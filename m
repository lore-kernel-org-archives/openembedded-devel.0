Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B90C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 18:56:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26066.1691693771519277267
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 11:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NxHbipoV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758674e306=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37AHIYpv021730
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 18:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:cc:from
	:in-reply-to:mime-version; s=PPS06212021; bh=nChbNxcqLwnWhrP8g6O
	9aP2yQJ5Ns4BuxJoY4DtuKLA=; b=NxHbipoVTi/gMgBywRMP39+HVRZrtTmmIVq
	54QYQcq50sLfqdnMlM1d1rtgGU+7SlK4I2UCsN2o1TlIxekwLqNpMbqRu4bCAeBH
	+1TweNH8JhsH9xUy+3DdhLpjEQKbxezWbnc34qDBwtFijmCVgQR45ROihccCbHbb
	296YLA4iS5Vrde30msK/+8xt8UAHVn/GrcqTHUz8jtPkJXozd+xRpr1kNe/r0Ga1
	ZFxJzyMJwKzRp0QYtUllTyjtJLbAu0Y6t1M0Ly+V+L1YACRY1/U3R6C2piLRlgxz
	kWV2MBawvJc2pC2xn0CDZ0JIy19mAbxZOmerqa265bEkMsWV3mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3schfmh30d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 18:56:10 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37AIuAhE019543;
	Thu, 10 Aug 2023 18:56:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3schfmh309-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 18:56:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFpRISoV/D1ctPCQewah9rgcFCJZsFVev3t6vy+3Xm3uz3ZAQNh3OB2+7ag21DwYIjuV3fLrxqe6z83YeG5ZArUCWCJEf/v/hgUVG/txAzOxRdRt4n5ydW01Vvk1CLIbs7qGHmYGwgLDAWFrmwEhLzNPVG8sdFJ8b26cAqpu24hujYybzDSDL3/ZCbIv7BTtSKmpLXJAZUU63+5Ge4dqx8PqaPXFQjTvYpLnFBg3aHkC+q7Vq9f53sN9+bCNmn0dEOrvCM/Y+0nEPrQJgqP+GHGR2fRBQ/VYqH+Czrutwuz3HbYHhsXhpY46+4h1E4sj8U/+xMBKc2dKAWxEKK5c5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nChbNxcqLwnWhrP8g6O9aP2yQJ5Ns4BuxJoY4DtuKLA=;
 b=YdV31x0a7dOkEdCgVlIkyhAK8egI6p1ZoxQYZoJyv2jz4HCFeUkma2WL1bR8eGQFzNi0w1AehXCq1KnA84rRxIRW9ZVYVBlrfiScD1qczXJopY5atv/SPaJyl/otwQjKk3PneNwrfLf3Zf2JNKQwFlvkfweAG7KDsk5/YzGBnddP5DvroLjcy40arwbvMQvcwUQULmR4/kM/NZbEKNadWyQR3Ie2OxQfndZ+vVvJ8Rjf8KGdagkLXD86YRMDiZqpgadxj8XrOKxPu+Pnp7b01+ghXib36chy1j7trYmHmfDn574Y90fXsgpJOabN9OD1MBk/8nCqTyHoV+UEDYAuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5364.namprd11.prod.outlook.com (2603:10b6:610:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 18:56:04 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 18:56:04 +0000
Content-Type: multipart/alternative;
 boundary="------------YV7OCzVxE6eZocBmiXztMu8o"
Message-ID: <8a52ceed-e4d5-6008-2995-e1c28955575d@windriver.com>
Date: Thu, 10 Aug 2023 14:56:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] lmsensors: do not pull in
 unneeded perl modules for run-time dependencies
To: akuster808@gmail.com
References: <1777F944D33CE024.19936@lists.openembedded.org>
Content-Language: en-CA
Cc: openembedded-devel@lists.openembedded.org
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1777F944D33CE024.19936@lists.openembedded.org>
X-ClientProxiedBy: BYAPR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba4e3c7-b54a-407b-b8df-08db99d37297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lppafWcFYiA0ZjcnGZ4Nf6+iVoNp9LPLZ0J5bwigR015U+Dqhg0DDAEAgLOut3RZAH1Aln9hzbZIeAo2mXE29VXwo8OIfAl5I15drXDnOho5vCqjzn9aiNP4UpCBWl2zkVrlKQ3GT00GKA0d4k6FffFAxk6OXMD53TdWq25qsGJ9OiKJI5KMAIgs/waORQo5HXJlbTV2fizUrd3aSoguIX0m/YEnz4BXcUAgFMNNpImW+kTj8uZiu9n8jsHglC/ku7lFDHZAACEi+EdKGFYbYqo+yIP9ysEtCuziXv1RjMHef1MKA30p/fMpann7JEUsq9Y5tyJzZy273D+7GbBXGnaM+K2JVxsnBz/lbyF5eNJbTCgqllbsZx++msqE20ckk9u8Ajj/NfXskjUAdb3r3p5EhMkNlDEaeXwlKiy7/tcG2Xqo6yVNdElzVRRFPxfqkZcHdvy12gvmnQPVM8FkmBJFJ2WNUz9vUxdgPKxUiS9utSiciobDZR6xG1QzgBXt/Ciex5nut/K2LG/5DpLuTLnF2E84t7Fcc2b1vjicwJ4A6n3JsfFloHHiOo7/ffBK1mi95nwhDL/U0PYBFA8Bmy8jjWOxzACgnqxJHqlbLDp2qNeyXtPA3gyeZf+FM2iB+511Dkn/PP9vI09YnnnJ1W4ivNMKVvYYARlykGrvxgfl/hm84gGhQ2a2D/Qb2ZdS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(1800799006)(186006)(451199021)(36756003)(86362001)(31696002)(166002)(2906002)(6486002)(33964004)(6666004)(53546011)(26005)(966005)(6512007)(6506007)(316002)(478600001)(41300700001)(38100700002)(8936002)(8676002)(31686004)(5660300002)(66946007)(6916009)(66556008)(4326008)(83380400001)(66476007)(2616005)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ujc3RkhLYXNUV1djdklnZDcrOFAxK084cHFKeWtiekQxNFVsYk9na0lRNnl3?=
 =?utf-8?B?c2xRWHA3VVNGT2tDSWt2aWU4bS9BdzdkTkhRb21ydm1sZmp4dnFac2dVaVZZ?=
 =?utf-8?B?eUpKSlJuRlhGcWp3OGkwTytFcmJBL1JOQzUycDcwUlRBb2ZPSm9sMVVseCs5?=
 =?utf-8?B?VHlVTUVDY05udVhLQkplVHlSQjBkKzFWK1lHOUpxdW9IcEc2TE05NDZnMUJ1?=
 =?utf-8?B?S2t3amRzN2VVeDl5dUVNT3JjNHRVZHNUWWc0Ly9kS0x1NW9DL0pCcUpQOS82?=
 =?utf-8?B?c2JLcFRDMlZnZjJ3VG5mdndORCtjRXpTZEVNcFlzY09SenVjU3dzRDZZUDNX?=
 =?utf-8?B?b0pqZzltNGxLUnFlUTJZVGxHT0pIY0RnRkFJOVN0ZmI3SUZuNjgxblhnbjdm?=
 =?utf-8?B?dUY1ckg0OHQwMkxGZGV3ZmZtbzV0RTRDNVZYTGFEaHErdUp1MWYvUTg4RnI1?=
 =?utf-8?B?VUVBSlVHaVkwelBVZmZ3THNLQkg3OUs4RVVjYytWcXpRY0lmSUQxbDh5NW5h?=
 =?utf-8?B?Q2lJb0w4dXNDR2ZoZEhMb29zUWpaTEVDc2E3QUdPdG9hTmEzc0F0RzJSZDNR?=
 =?utf-8?B?MUtDMHFNeW5ZTHRVeXJYdGNGMTR4Z0JzUEtvRW0za0hKS1dYSGxCbkE1NW44?=
 =?utf-8?B?L0t0dHNpVU9wNFRvd3VKY2hKd3dOVzRlL2YxVWttS29TT21BWWF3VGRSZXNF?=
 =?utf-8?B?aXVOKzFtVk5YRXpVOHR3VWlLSUNpS1lwT01DMWZTWENGVVJMSmFEelA5YytI?=
 =?utf-8?B?Um5MemwvaU1PaVE2OU9UUWk2OUxRdUZKQU5oV3psS3RGNnRmNC93cWJmR29T?=
 =?utf-8?B?UHRQWEtwRlBUWlBNbmdBVEREVUhpNldvVEtZVGd5UTNvb0p0NUhLKzFhNmM5?=
 =?utf-8?B?TDVJUnNQVmRKQXNmOHVmS0VXbGZiSFhtZi9HNGtLNklxL0VZekNUUkI2RjRm?=
 =?utf-8?B?VDNWbW5MODNjTWVDSjE5VUxqWjZFZkI4NG5sS2doKzVHRHR3M2ZUaHdSdFVV?=
 =?utf-8?B?TU5WZmJ2aS9UOUx0VmdYSzZCMzRWdlUvM21aMCt2ejlRU1I3M2duWXZCcERo?=
 =?utf-8?B?ekJSeVl5VDlPMmRqRmYxSUkvR2VWeGIxQTZCTHcyb0Vtek4yUzFlWXpvdUNT?=
 =?utf-8?B?amc1WmR6b0kxM1lrK1AxSUt0TmtEanM3VVdpVVBtSTBFRW9QWjdmTXJSV2Vp?=
 =?utf-8?B?U1c0cHdUZko4ZFJteFRhZU5NRzk3aktYTnpPWitZTEhKcVVwWkxPbmt0MFZ0?=
 =?utf-8?B?K29LMkRpbmcvTFJoN0l0SlNrZzkyUHFTdk5MNWZDNlB1S3h2aFQzZFYzY29B?=
 =?utf-8?B?MWtmK0x6TzJvZ0UyMHZ2bmh2eFZtaFJuMVluVytCTnd4Sjh0UW5kaGpGeVNw?=
 =?utf-8?B?VFd4SG4yZGF5S3pjc3NaSm1BbkhhVFpVWFhIVFcrM3VseUh0YTJFNE9VZjBa?=
 =?utf-8?B?N0p6aE5FakdZdys2THQxRy9rSHE5MWNPeG5JQnRMNFBDSGhpYTBGcDlZR3JH?=
 =?utf-8?B?R2tOT2I3YVF0RURHUmFwOVYvL3dEcXh0d2VNcFdwdHNqMURnc2UrbnNQdFpL?=
 =?utf-8?B?Vm90SVVIUHkxYlRPVEVWSFRVemR6c0M0cWNXN0pEdU1LZmdyNnJ0VWplMUlB?=
 =?utf-8?B?NHJmUThReCtYRFVNSzE1S2tPcXBNdTlhTU80aHgyMHRFUUhwNHNJcFFCMk9E?=
 =?utf-8?B?UjN4bEtpUmNIWnBhZzdjL0pQUDlVMURqYUp2eldXdCs4azNSUTNjYW1vVmow?=
 =?utf-8?B?Tk1uT3llQUx2RjJ3V0tmZFE0RXc3YmV1RjIzK3RRdlVncXpoWjZJMVE3alNq?=
 =?utf-8?B?eC9GVVdXL3VTdnhwVEJjNTQ3OWVScjlNdmx4bytqYkNBTjhRVzhITmpBWGZD?=
 =?utf-8?B?ZjZvTWNNZWZmYU5heCtIeTlPWkhBNThLRWxIajVWQW1hNGNNa2ZaS1FNSEVB?=
 =?utf-8?B?OTJsQ0I5QzdScWltbnNYc05IWENEeStFS2UyK0U4SDBTakJTOXU2S090NDNz?=
 =?utf-8?B?RmJ0a3YrR0V3U0w3bnk3N1MreXcydHlzVHlHam1Beld6elF5cllnakpUR2kz?=
 =?utf-8?B?ODhieFFOa1lZY1kzdUJwUFZUdzk4K0JNaEJIT3dEYkUwZmVKUktPK1pCN3ZX?=
 =?utf-8?B?N2FSaWxBakpkN0loaTFvamtqaDRXMWNGMkE0TUduaDhqWWJNVjlFT3Yrbjh1?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba4e3c7-b54a-407b-b8df-08db99d37297
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 18:56:04.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9qfZUp8AY7y/tHmUaKCpDH8OnZRW5qxCBPlOGH7ECszwfhhsQVRIjvjxfB1PtjWihfcO7+Z/DOdYJlTMCYrb8n6reFY+5/vMQmhKNOZAR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5364
X-Proofpoint-GUID: K96c_lZBIe1G3uZRbqjnP2gTRlqs00aA
X-Proofpoint-ORIG-GUID: dHVuG7Hth085cX2Jv51wtTZGOBz__Aob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_14,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308100163
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 18:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104331

--------------YV7OCzVxE6eZocBmiXztMu8o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-03 16:24, Randy MacLeod via lists.openembedded.org wrote:
> From: Beniamin Sandu<beniaminsandu@gmail.com>
>
> Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index f821cdaf4..aba5ab587 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = "lmsensors-config-fancontrol"
>   # sensors-detect script files
>   FILES:${PN}-sensorsdetect = "${sbindir}/sensors-detect"
>   FILES:${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
> -RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
> +RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
> +	perl-module-strict perl-module-constant"
>   
>   # sensors-conf-convert script files
>   FILES:${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
>   FILES:${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
> -RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
> +RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-module-strict perl-module-vars"
>   
>   # pwmconfig script files
>   FILES:${PN}-pwmconfig = "${sbindir}/pwmconfig"


Armin,

I see this lmsensors cherry-pick merged to mickledore a week ago but it 
didn't land in kirkstone yet:

https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&id=75cf318cef3b4ee81fad2782cf063ecd69ba8842
https://git.openembedded.org/meta-openembedded/log/?h=kirkstone

Thanks,

../Randy

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104224):https://lists.openembedded.org/g/openembedded-devel/message/104224
> Mute This Topic:https://lists.openembedded.org/mt/100534246/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------YV7OCzVxE6eZocBmiXztMu8o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-03 16:24, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1777F944D33CE024.19936@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>

Signed-off-by: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index f821cdaf4..aba5ab587 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = &quot;lmsensors-config-fancontrol&quot;
 # sensors-detect script files
 FILES:${PN}-sensorsdetect = &quot;${sbindir}/sensors-detect&quot;
 FILES:${PN}-sensorsdetect-doc = &quot;${mandir}/man8/sensors-detect.8&quot;
-RDEPENDS:${PN}-sensorsdetect = &quot;${PN}-sensors perl perl-modules&quot;
+RDEPENDS:${PN}-sensorsdetect = &quot;${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
+	perl-module-strict perl-module-constant&quot;
 
 # sensors-conf-convert script files
 FILES:${PN}-sensorsconfconvert = &quot;${bindir}/sensors-conf-convert&quot;
 FILES:${PN}-sensorsconfconvert-doc = &quot;${mandir}/man8/sensors-conf-convert.8&quot;
-RDEPENDS:${PN}-sensorsconfconvert = &quot;${PN}-sensors perl perl-modules&quot;
+RDEPENDS:${PN}-sensorsconfconvert = &quot;${PN}-sensors perl perl-module-strict perl-module-vars&quot;
 
 # pwmconfig script files
 FILES:${PN}-pwmconfig = &quot;${sbindir}/pwmconfig&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Armin,<br>
      <br>
      I see this lmsensors cherry-pick merged to mickledore a week ago
      but it didn't land in kirkstone yet:<br>
    </p>
    <p>&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&amp;id=75cf318cef3b4ee81fad2782cf063ecd69ba8842">https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&amp;id=75cf318cef3b4ee81fad2782cf063ecd69ba8842</a><br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/log/?h=kirkstone">https://git.openembedded.org/meta-openembedded/log/?h=kirkstone</a><br>
      <br>
    </p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:1777F944D33CE024.19936@lists.openembedded.org"><br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104224): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/104224">https://lists.openembedded.org/g/openembedded-devel/message/104224</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/100534246/3616765">https://lists.openembedded.org/mt/100534246/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------YV7OCzVxE6eZocBmiXztMu8o--

