Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39564EE57D5
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 06:42:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34019.1694155340553803720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 23:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n/qlo9qe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761562b37d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3886fOb2013487
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Sep 2023 23:42:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=yBxtalYbFhNict39wYKJdPUEtsnMXxC/honogkxvF6k=; b=
	n/qlo9qeyDKOfsZONpVfY1HDyfkiSr+uC2m03p3FLbkuWVM+JdcwlFkJ+CUxYw3b
	0eH/ubPsZHC1B3+QKJWnM3BQC+z8pwp7W9DiOY1phGcQYDUOvZhAINlO6dhAwnsO
	CUtNBwd69JXnY0xlge1j3XdvobyoNu4F2fNccK7upUPIDKDDN0Qw7r3qk+9GctPD
	cLiYL/WbCqZ/xfCieIEaaQblX5vVMIxzh6AwuKDwNC7KBKEc9NompvLT4//JG29y
	iZK3NKn9I7aD5t6398yo6x0s3TkbpgYkA9LyUq2+nEJmDNlWOc6NKe5KoMxzVQAH
	cDxb3uopvQnv0SE96kETjg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b0584v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 23:42:20 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3886gJ2L014832
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Sep 2023 23:42:19 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b0584t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOtgZyEYORd/j4bdyBVfFmUeDRnuv5xWWKcpUu7Bcjqh1fS8CzGKo3bhb3oKWV+d7qlFvoppxaVJ4EF2+Q48Ylmqos1tzzvtfkF/DFiXwPf2mvF5YQiazV9PpIO17ypODMmioacchM+6p/v6Phm1COJK1WFNE6fBO4CvRE1qz+IkQsF08e6hJpMudLmvsxn4qw9wVaT3pkV0qJ60vZ9Phn2ucMQW5JB4WLGMfAPeFtdJTaSDqGDt2gBPBRbr2wMpVP6xYquZMHGE+hB2YvXK2C4wAeVGiKJ7FfD+ThFks/6DhaoRM25250RTIh8Lp+A9bu4w5O5iDoiBz3Evloi/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBxtalYbFhNict39wYKJdPUEtsnMXxC/honogkxvF6k=;
 b=h06kd64gd07pf8b2fiA3y7b4u5h3CMTVvpjJXWBJw8pCBhNbqG0e5Dj2aU34FAL8juHWnoAuFALHtB56IOGCxPgPXtvKCxXqIqOBtAPFfpI4zvBRvVnhjEai3PIlpKg3A179moNHfloGEmEXH9tXnfMd9PnEi9HNU0Ddzniz0amI0NZDBDH1pteaEN0x/QWPN+fpT6elJ9mGzaG+ESPHZ6akfrFf2yu7KZAxAVGDiHkfsZGDgOU040hkLbqZECUORuDGxbmTnhU7Pn+4F46dTwvMItO7VLR3Idxtn+ehvhsMSOz/gBC4cY51fOjZ0I/vDKWfT/KWICV3LH51euBn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:42:18 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:42:17 +0000
Message-ID: <28de531c-20c5-4a33-f3bf-09b0f2b4bbf9@windriver.com>
Date: Fri, 8 Sep 2023 12:09:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 2/2] Introduce
 python3-trustme to fix ptest error of python3-requests-toolbelt
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <20230823104110.1949022-1-narpat.mali@windriver.com>
 <177DFD136D69B7A7.28529@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <177DFD136D69B7A7.28529@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4f11af-787f-4f47-3767-08dbb036bec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AOzfi6qhsss8VbCH5WLWN+42ctL5X4e1NE2+lsW9l5un0dJFZSY6Kmwk+q/99PJX4hYQTMhjunz1/lVphvrzmsdrdJSIJTMENAMNHnbSkDSvVCD5jC4lyc5ySYwIyFeV/4BVu+CRMMsx2MmxMk1vy28wnEk69DXfkzX3x2bB1VXzkZ3fvFp1y+imB0WWf5rYCUGXy9Ox8RNFoLkNkfQkSdtC8R4ck/OWskEwTmj9QXTT4oxyoELOrihqU+fskDHu+5vqyPgzPNJU+D08xMZB+772fDnAdKjVfKAGhruAii9xXvjFUGT5+N9ZpX1CxDX5DsGfBOPcFGvvvukqFdEq02v4C8STI0iF9HeeaOqCRgLy/aUDUDPeKeTk5I7HIVBTnLXZUUh6iWo3IlARd82UeMp0H3XkyN/26u8N2ECXyFWR9gKdZGJhbXn9PtxGvGtEXsY+3Xot3JqCjCO0V2QmBRC5EjA5ljjQl0iltg641XVO50q04+Qu0CDYho4ABO0nGzy3Nw5Bo343EL0Rtr7jm2LyIMY33S6XhSTmgDKFnAfQL3EbbhX8K+BbySf8MRypSUb0465frvwbQs3Li4M6qzPR+edz3ds+CrV85dCeshjPNmW0pAZMj1hH0q8FUP+aDXtlwc8ev1E6xc5vKrPO7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39850400004)(1800799009)(451199024)(186009)(6486002)(6506007)(53546011)(6666004)(55236004)(6512007)(966005)(478600001)(83380400001)(2616005)(26005)(2906002)(66476007)(66556008)(66946007)(316002)(41300700001)(5660300002)(8676002)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVl3OGdYdkk2UXcrU2s0SU5XQiswTkNDM1dmVUxSbkdBKzBnMHJKZnduZTBF?=
 =?utf-8?B?WGNBcTJ3Z01jWG1GSjBRbWlpMFArd3lpdnp1aU80MVJ6UnI2L3l2K1R1ZjVI?=
 =?utf-8?B?NWRxUkg5ODkrZm8yMkRrZ2JpMkswM0Ywam1oZHBNQUdRWlFRVTdjQ01pNjJo?=
 =?utf-8?B?cXBxUkgwU3lFZnhEd0NWQUZQQ0xMaEVPVFdRc0dkdGYyVHJsQWNQQlBseldH?=
 =?utf-8?B?ZDgydjBBZ1B6VjAxQ28ra2tZbXdYejJDeEI2c1ZRaUVVbVV3NnZJSkxzTjNB?=
 =?utf-8?B?ZFRYZThpNCsxNzI2K1lyOFlwbWJaVDRnQi9iWVRVZzNmR3U1LzcrenhDcFVy?=
 =?utf-8?B?VDR3VGRuVUlGMlVoMW5PQ2M2QmR0SHE2MU9BM3JjUVlRcTZuRmdkWit6cGxE?=
 =?utf-8?B?UXJ5R1QzZW5DRXJ3WGhzTHdURmhzUE43OHJEZUg4TGdVamZrR0lEbENxSVhL?=
 =?utf-8?B?ZjFDWm40ODR1TlZpOWtzK3JQdiswU0gzLytKd0VsVDIzMzZCbmM0YjgvYllV?=
 =?utf-8?B?R09mTUtKSDNaNEJURWJCNUR4T29KZlVLZSs1Rno4dWM4clUxOTF2SFZHS1pr?=
 =?utf-8?B?MnBUMFpCaWROOXJESVhrZEpGWGpTNVFpQmJBbUVNekY3NHNqVmVzN1pCS1lG?=
 =?utf-8?B?UUNRblgwRDIyQWRXdXc0SkRxcEtKbTk5RCsxRUxHY3gzeWJTRTZTR25WVlRP?=
 =?utf-8?B?aElhaDl4SjY2RkpBZCtOQ0NCOGx4WmtBRmtMaVFTc3NpMFVDc2ovbzBadVA4?=
 =?utf-8?B?RjdYSlhnVnorVTUyb3dsU2NrYkc0K2xlUWIrNVF1NmhXcERhbVlrSStuN05u?=
 =?utf-8?B?YUVoczhBdnJ1SUVGQklGeHpIR3dpV2NabWFpWHpiQkRvdnJGZnJJZnYrMEVu?=
 =?utf-8?B?a2VYMkVFdGgzdGswY1VBSmFrQ2FWK0V4YXAwQkdQMjYxT0RxMDYzaXo5L3NB?=
 =?utf-8?B?UnJLTXVlVTAyUE9pYVY1MXZQK0c4SXoxRXFEeDd5ZTVodHU2VGRQTTJEWXZ6?=
 =?utf-8?B?WkY3SUYzZHNtM2YzOVVNTEtNT01XRU1UT0lhSC8wTHQzTURmaXJQbFcvYVgr?=
 =?utf-8?B?bmYwKzl6WS9yZE1LQjJ0Q1ZKSzJwMkpVODRPeEtQeHBhU0pncTZLUnNYcUhB?=
 =?utf-8?B?RlZOSXFQUktqamJZaVduUGdlZXFLMTdUMExuRjNZaW82aHByNjNNZjRJbzJv?=
 =?utf-8?B?by85MmphQ2xXTFJoc29jWFZtbUZPdU1tS24ybGExMnlHbWZUWGo4K0xOQlpm?=
 =?utf-8?B?Ky9vQUJ2TmZNY3ZZa045Y05FWFIwYXhnQm5yNlBaVUk2cDRXUmYvbjZwbWhZ?=
 =?utf-8?B?aUdpNGxiY1ZtaWVmMlNIMUpRL3lpd2V3WXBRVmc2MWZlaWZmbFNwaUZHZ3NG?=
 =?utf-8?B?T3kzV2F0bWhsSk9zRG9FRXRabGZrZWpxakc1OU1nbEZpRDRMM2FISFFYRjF6?=
 =?utf-8?B?ZWtRUXN0RFMzQ2xIOGRXNXdQYytMUURlcUY0b2Q4dEdmV3lBNHEyYlpUZkZS?=
 =?utf-8?B?dXFTcmNNeEIyT1d6cFg4Z1crY1ZiWnBFYnlEVDk3TE1TaFZxTGJqYVBzeDJx?=
 =?utf-8?B?Yjk5STdmcUVhQ0V6TDVKZWxyYmluN21STm9BMlUrOUFxVFJ0dnNqNUNVQktU?=
 =?utf-8?B?S0lvNUxIenpNUkhtUzN4ckZoSXAwZ2NQSzloRmwxMGZYdXVSNld6czhQUjd4?=
 =?utf-8?B?RUUwOFFaNUovZldhR2tiNFBpZzh4bytBZXBlNVdTODQxa1poUDRYOG43MkJR?=
 =?utf-8?B?djM0UksySWUrWVZsSk9sNy8xeTFlNU02UElXLzZsd1NEaW1OdkxKRkdEc0to?=
 =?utf-8?B?MFNaQm92SmN0VUVNMlN2bGFSRldzdzlhNXpQeEl1KzI4aHMyRi9pZ3BENEpx?=
 =?utf-8?B?NjhCWWt3d1VaZS81bXFaUWl0UDVaZE1EUjV5YThLQWo3Zm9KL0xOTnBtaWRz?=
 =?utf-8?B?R2RDRGx3K3VwelIxRE5hdnZIQTZySHZ2NURSZmRDZWRybGt0Vyt2U0tBM2U5?=
 =?utf-8?B?V1ZQcXNxL0luZzVRTG1RV2pyOWsraWt1eDBOaW8rcVZENjZ3WFB0Q3AydWdl?=
 =?utf-8?B?VFJ0ekppck4xOTZPNDVkN0ZUdVZ0ZkpQVlg1cWM1MWhnS2R1MzFuaFk1TytK?=
 =?utf-8?B?ZVFMa1NRdEhZYjdNTVpYM0Ztc0cybnlXeEZxNUFqc3BWeEtzK2c5eFd1RzFG?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4f11af-787f-4f47-3767-08dbb036bec1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:42:17.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwMytDW5HDx3QgFaGo0e8ZJSH7GwxA2Me0EEcPuG54T9pLFDVOJ/NWurOPiMdLqCpqEvpkYCkVoC5QHZ6Cptj8AhSWZlqW17gbTgnims1g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
X-Proofpoint-ORIG-GUID: N7o_jppbzZH923mSXICkmjpxtPIyGAej
X-Proofpoint-GUID: _nxKmj9RR9HLsvNMnlC-B8C7O1HimStY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 06:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104799

Gentle Reminder !!

../Narpat

On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> The ptest fails after python3-requests-toolbelt is upgraded
> to 0.10.1.
>
> =======================================================
> Hint: make sure your test modules/packages have valid Python names.
> Traceback:
> ../../python3.11/importlib/{}init{}.py:126: in import_module
>      return _bootstrap._gcd_import(name[level:], package, level)
> tests/test_x509_adapter.py:20: in <module>
>      import trustme
> E   ModuleNotFoundError: No module named 'trustme'
> =======================================================
>
> The commit b93b4067ea "Fix x509 tests by using trustme" of
> python3-requests-toolbelt introduces the trustme in test_x509_adapter.py.
>
> Introducing python3-trustme to fix ptest error of python3-requests-toolbelt,
> also introducing python3-service-identity, which is requested by python3-trustme's
> ptest.
>
> The ptest passes of all the three packages.
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Cherry-picked the upstream master commit:
> https://git.openembedded.org/meta-openembedded/commit/?id=a4b6e3ee894047cd13c5d2b7bfc67f0093899537
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb |  2 ++
>   .../python3-requests-toolbelt_0.10.1.bb       |  1 +
>   .../python/python3-service-identity/run-ptest |  3 +++
>   .../python/python3-service-identity_21.1.0.bb | 25 +++++++++++++++++
>   .../python/python3-trustme/run-ptest          |  3 +++
>   .../python/python3-trustme_0.9.0.bb           | 27 +++++++++++++++++++
>   6 files changed, 61 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-service-identity/run-ptest
>   create mode 100644 meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-trustme/run-ptest
>   create mode 100644 meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index fdeb83c42a..c2481eb307 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -373,6 +373,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>       python3-send2trash \
>       python3-sentry-sdk \
>       python3-serpent \
> +    python3-service-identity \
>       python3-sh \
>       python3-sijax \
>       python3-simpleeval \
> @@ -408,6 +409,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>       python3-trafaret-config \
>       python3-traitlets \
>       python3-transitions \
> +    python3-trustme \
>       python3-twine \
>       python3-twisted \
>       python3-twitter \
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> index c39950ab5d..7191a3e6c1 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
> @@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest += " \
>   	${PYTHON_PN}-betamax \
>   	${PYTHON_PN}-mock \
>   	${PYTHON_PN}-multiprocessing \
> +        ${PYTHON_PN}-trustme \
>   "
>   
>   do_install_ptest() {
> diff --git a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
> new file mode 100644
> index 0000000000..0210a5de22
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "The tools for verifying whether a certificate is valid for the intended purposes."
> +HOMEPAGE = "https://pypi.org/project/service-identity"
> +AUTHOR = "Hynek Schlawack"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
> +
> +SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
> +SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
> +}
> diff --git a/meta-python/recipes-devtools/python/python3-trustme/run-ptest b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
> new file mode 100644
> index 0000000000..641512c46c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "A utility provides a fake certificate authority (CA)"
> +HOMEPAGE = "https://pypi.org/project/trustme"
> +AUTHOR = "Nathaniel J. Smith"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
> +
> +SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
> +SRC_URI[sha256sum] = "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-service-identity \
> +	${PYTHON_PN}-pyasn1-modules \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
> +}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104534): https://lists.openembedded.org/g/openembedded-devel/message/104534
> Mute This Topic: https://lists.openembedded.org/mt/100912003/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

