Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26041C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 02:16:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.74091.1701915397330269243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 18:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ho0CvrRl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07054163ca=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B71F09d010766
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Dec 2023 18:16:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=rQSh6i9QlKeY5tM+neay64NzeR1T8Z4uRw8W7T7AUHE=; b=
	ho0CvrRlphJWo008yYuBp4cy/1Iw+3NhqLKJ6pa0IxcNzFJ7Odm/OvON2dunvT93
	aX2ErdwH/nvT69sB+vlwsJK8hVdXYmkuEGNf4MyBYWVq0xS8rEvA3AkzR6m5VKAz
	KtJV6+b3p9PR8+VW2zsX6eM927vff/8d/wOcqC1vhs6HbeOdZxiRzse2CVMn4mJf
	4aDcr/1nwhn7oioCXFc4zOYodlMKwJ8jf38RJvouwY7f25HIDSzmhW3soBWipVfl
	aCncuQs2AAD8GvxpoBqeRaba5bkZfYjV/RO6X+T/EJjyQjt8NvR1eqlDdlATpdJg
	QD4y59UOTYXWGuqPLD/mcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r177t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 18:16:36 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B72GarS014452
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Dec 2023 18:16:36 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2r177r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 18:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCSR8BoZJ+CzxoHJRXN5eaHiVdM/tfuh41iFVpmTx5AqKHgJcXoofBcZuaYx+ngOJw75QNcyoHAczIn4bsmjjqaG0t02yLmcKxpDhueoT8WIpofD9Vy4ebp+nUzWNdLb21m/SGjF5netKZDvCW/01JinwlovqTlVyXNpAFAfKN8ZN2YH0sv49RPk0E2Rbm4HLjftQDt8BKfTQaSZJPVABBSkFraApYRSOShpLAiFcdIoObGw8MvrH9geRDueHwvsFvfi5pG7ju2QnSQNKLO5RmJMiIP6jbzceCchfyH9EbmUoT1rPRBaFHG1t+rdvXhBZlyZMDUrmFKOSpTUMryGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQSh6i9QlKeY5tM+neay64NzeR1T8Z4uRw8W7T7AUHE=;
 b=gkC5Xh4no1XHxlCVmyBRcDBp3SyxflHuCShlDjnS6+arzi6j8FnxiywEvlalm42mMjeSWsUdLTmXUfRFAR2A6WWcemZ+h4olZ19VCU+BiStv7L406NogQxjlM7iUPMyYtA/e6GQs7MhFqVbZKTHJk5TA6exxyHReHPPUa6454GqVWoxgipF55wwBND/BXuEyl7/6/56K8+tAAomaxZdWcR1bAR5/Pg/Vdv+kt6Y6qScKsvPEf03LSe3j538eHxcEuAHDLy9yNRKQja01vT3+sc1NjbG8nP7yZPZO+F8epihD8US7lVJ7rQIggptE4U/swC+OyUBNu1JDAoTe7+QmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 02:16:34 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::dca9:26e2:b46:2372%3]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 02:16:33 +0000
Message-ID: <d587fb36-527a-b31a-f412-8c296321bc67@windriver.com>
Date: Thu, 7 Dec 2023 10:16:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
References: <179DF70836C36579.24600@lists.openembedded.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <179DF70836C36579.24600@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1ce4de-cf69-44e1-b212-08dbf6ca8863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tCgKP4QqmWDbt9DI6/yu9IDRwdd3/UZ/lg7CJnqxiXdgmy+St3rSwn/g6MSg5tMocOFFN9t416DBqjCPQ14pZ/lO1Eg4io1R8/pvOESJZGZEYDftPpBFu4ExOKIp7bOb80Np5ev/hHRhRZWeVDf+DD+DiXlDi8BQtiZnr+SvexiG9f5yIXtgcRLuJe7kcRrYsyBxFcmIfWo5nWtUjjtj5ryTG5qmB+WYpfX/kBbsEq17HqPbyzAhGA3PZCViIm2O1IAgvAQSqfF/so9MnNA+1CAHlf2UE0Je7UmH2zzOPFoiPTqc1ZP1oFine6esnWKfTOqjrr6b1Bi2u/0T5XkTTNS7ZEwBK2r8i296zYiQNevEv+kJuuELtzs6XCRUJSC6yGPT2WuIgR8SZaUeyaOyXc5dF325u2ks/oJD9ZYvQq1p56k6rYBnMJrf3XFb8tRcSwC2QmRj9QylxgpcQ3PSYA5+tJXNcbFzw5tTy8/ruAsY26z7GAzylD1ADIdjcMPKQnudawXp18pE85fqUXFAM6Wb9xS5V55ApeIvDVhM5NouFOp1567TT4NgSfiLP8S5E9QHbYMz/4Nl9mxhWlwMooAJfwg3LgSyBOMVECmpHIxr/U6QHp6LrPj+9qyuJf4lCbzSX0ji3LsQB+uiJs6Dwk6Msjndg7CruCI5yIb2nlQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8676002)(8936002)(316002)(66476007)(66899024)(83380400001)(5660300002)(66556008)(6512007)(478600001)(6486002)(966005)(36756003)(2616005)(41300700001)(86362001)(26005)(31696002)(6506007)(53546011)(6666004)(31686004)(110136005)(66946007)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2xCZGJKTlErK3NsQjRsQXZNUUkxdG1sUlhLWWdaUVM5VE5WeGVxckZZWWFR?=
 =?utf-8?B?bDNOYi9rb0dySHRNTE5tcE1KSkdmZVl0SU5DL2twbE40OFFqKzd3c29kYytK?=
 =?utf-8?B?cm50OGhlUkl4WFRoVzhJZUlvRzl3U3V2T1NOTHVLa3hhUjczaFlLVG1Qa2hC?=
 =?utf-8?B?RTBrRW0waUtabjUxcEdISE5kc3R0eWFkbzhVN1VLaTMzcGNEeVZSaDk0OGRo?=
 =?utf-8?B?WFZuMHdoL1BneEM3Y2xnblNqSGIzSndpeVBEaVFvR2IzOWtYSEpLWmZSbnBH?=
 =?utf-8?B?UnFYZjQvZUlsNFNGaSsrQlkva0NZdG10Y0VnMlhraXBuaDd1RW9Ub2tDSTNF?=
 =?utf-8?B?ZWtLWC8xUFJCd25pa29naUhsdlFqRjIrNmxndm9rdHhIdW9OVUZYYzJZcVNw?=
 =?utf-8?B?RWxSZHUvM2lOZTVuRDF1dm1SYUpsUWdrMnBxTlUzQlUwakxtMXNiN0lxNFFo?=
 =?utf-8?B?YW9sYm1vSVB5TTB5WDd2T2c4UDJ1d3Z1Wmp1U01TVWdxakUvNTJ2TVJrUm5Z?=
 =?utf-8?B?bHR5ZmhNK0E5dkRGZmlOcncyMVRldzMzaXZXYUtKd1hjeFk0NHQ1Rm9wK1Jk?=
 =?utf-8?B?QWNGdjl2dkJId2dtelJ4bnA0cElHa0V1Qm1TakZHZm9QZEJTM1lWTjdnakpl?=
 =?utf-8?B?L0VTYjRUNjdqSWRRMVdXUVZ2ZlQzUnlHcExGamRqTEtQeGFLQWYwcFFJYUdY?=
 =?utf-8?B?ZEJaakJWdnB6U25vWG1naU9WN1FubUt3YVo3d0VQcXVBMTluZlRRYy84RGtV?=
 =?utf-8?B?bm5FamVEV0lOTzVMcHhFa0hwNno3YVk5MnloR2h4ZmwwVmx1M0RLRXhDRTda?=
 =?utf-8?B?Mit0UzlLN1U3MEM0em56MFlTNVVrYzZXQXdCYjhsUjc4VndsVUZFckNoaW9N?=
 =?utf-8?B?aXpESE5ibHNjbEdCMDdmbmhwWlEyQlIyNkRlSnJxRUhEN0FHSnphZHFaV0Nm?=
 =?utf-8?B?WUxuT0hTUHY0WWtLV1NnaXpuMy9RdjROVnc4Ni9GeWZXM0huZFJUOWU0WGpa?=
 =?utf-8?B?L2RuK2NOQnZqZDZreVZPekw5RzROMW1NMmM2NEpuVEkyTDlRYnNvLzB6Y0pN?=
 =?utf-8?B?aStQcjQ1RGNDK1JhUXhvY05KNWJiaFAzdTFOOFBxVFNtSDBEMHNHYWgreFpl?=
 =?utf-8?B?TmNnMTB3YVR0dnFXQ1lZUVpTc1kyU043eUJpYW1ac3NCKzdJQmFuS2tyeDhV?=
 =?utf-8?B?cXBnWHhSTEM4TlZLR094UHdsTGVtQkJ6TFpEM2JRNFd5TDMvNjVSVFEvdDYy?=
 =?utf-8?B?RjJHaG5zZ3Z0dnJzK1RkdXJ0VG9YeFZ5Und4enQ3TkttbDYvWVp0YmF5Q0Rs?=
 =?utf-8?B?UEdrR3krdnlIRUFScVRpWDVwRi8vU09DSjh6TDByeXQ3UDJDUjVUb05GcElr?=
 =?utf-8?B?a0VRdUJtQ2NJOVQxU3ZrMnNRWVB3QytqR0NOSFUvczg4b2IwN3ZhSzJXd0tI?=
 =?utf-8?B?b3VZUFpyYVBTT0UvNnN4QW92SFU4ZzZqWEZtVktmZlhCSWd3ZFcxYjloOE50?=
 =?utf-8?B?TzhGcEpWbFZPRVpkMHBxNUdJUzFUZkx6QmptbmdSeUo4ckRaVEpXbzl5NEU0?=
 =?utf-8?B?YngxcVFBVzVHVVNiUGRPQXpIekhPMU1GU3VOQTFwQm9icVpHR0x4UC94MFBW?=
 =?utf-8?B?akFPVS9NNy9VdTBOMGlWQnFENXEySy9paHBodXZoNzlTVHU5T3VPR1NNY3A1?=
 =?utf-8?B?SmU3bnBQOWhyc2NTYjVJVVVieU9GTm5CS0oxMzhVVTNJblVRVGR2Z0k3OXlV?=
 =?utf-8?B?T05tUmZoSThIRHdYRjQwVXE1NThHeElLcWNYQ3ZrSWdTMWg5bDA0cVk2VWt1?=
 =?utf-8?B?TnV4SkFqamg2dWoySVhrdjYrMTlNbW9sZ1FidFUzWEpvVk9XZEJGQkNhbFlz?=
 =?utf-8?B?cXFabUFxSGw3Sy9aV0VvdmRBVkxVaGRyRjFjbjVMWDl2YTVxRHJoWlNGZkJr?=
 =?utf-8?B?SDVFc21QRG94TTRlYitrVnExSERCL0dIQWZSbWs4L0RJMDg1T0ppWk5TQVpu?=
 =?utf-8?B?a0xCS1JWQUNsaWkzWEhGVEE4MFQ4c2ZIL2lScTVHOHZzSm45QklpWDRqTUhn?=
 =?utf-8?B?MERqRUVWbEN4SlJHeGNXZHdVYXdpdWFrdHZGT043cVVqWGV4TWpUTzhJVlgw?=
 =?utf-8?Q?7Sv2yr9PFzPrWqW/7tfH0f8P9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1ce4de-cf69-44e1-b212-08dbf6ca8863
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 02:16:33.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH3W8+HQTDSza4pgQZhWCU4Hb4F87OzFuPQ09k6tM+3HVKjqeOVG5yleptLPJ0c5mxFv+DZTmI5Fg2rfSOpakg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
X-Proofpoint-ORIG-GUID: w6cprgVVimxeh705BjCSXdvHzmK_Kzab
X-Proofpoint-GUID: 77XmzmrPwwvPm7ZGzRas0O0buxgPqE9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=733
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312070016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 02:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107268

On 12/5/23 22:50, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which is
> required by lvm2 when package config 'dbus' is enabled.

Hi Khem,

It seems this patch is still in branch master-next, but it has been 
dropped in the v2 review request.

Regards,
Kai


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> index 6fcf346bc..8bc3afdb5 100644
> --- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> @@ -20,3 +20,5 @@ RDEPENDS:${PN} = "\
>       ${PYTHON_PN}-fcntl \
>       libudev \
>   "
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107225): https://lists.openembedded.org/g/openembedded-devel/message/107225
> Mute This Topic: https://lists.openembedded.org/mt/102992734/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


