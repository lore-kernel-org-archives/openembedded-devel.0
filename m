Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AAFC433FE
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 18:49:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.304.1643395770111742508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DJmrAdao;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9027cf57c8=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SIGfPP020492
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:49:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=lopPHSglESmajMt6nhovnyp0OnqsVncDf6V1nhgXpOE=;
 b=DJmrAdaoaBa85AV+MCIpdPMzfYv1kH3pUhCQHISquUP4Pr39K6mQ/cDQ3onU4HtiwcxB
 /1OMnCvkoUiKlDvJGsY6ZuzPULvxsPRBxYvqU93CqgFr3hmlkg0kOdt33rsb0H1Inooi
 n9i/qm103iPy/+DrTS1sB2ZkSFMjyxkCCxs0aSmb8LoQwCexaSld/u6GMOVVNKCon22A
 WtrzHpBxxIs3ec7j97zKUrkGjaKUoNt/OBe0bEgpFwe2QonPMbMwp+hjJmDbUPBeD6zc
 xnD0FO7kdsWidvFqBQF6KUXt13xyF2Qn5rQ13FFFk3wXQt5+GIC0WIYf/dYat0uEHxlL Og==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dugc9hg8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkF/wGjxkVvScR4Ykh7U7/gIXIL0EviRsIMLIQWhFNYOQSMf0qV8blITFxOJ7V+F7tjcTg8QpnmWxdXASgnJNYD4CInN/E0y/8Lp0W9zdYz68JzMnm6YUgzlDr0lGE8DmGv30RHLkPMblMl17WTHAbXs39eLVaqJ61GfhOrbStktNlRG3vvHjwPiLPbrAwoejSMeyipt6q3hFDydAnJhe8qQxMDRjiYwf88dG9kRDn7JzLfCQTu5z4qiX9Yb7IMoZZkxSTK0WRtlKaPUWVmXWJY2/7+oi6gUjMJNDATIbakVBOBXfJDtzIhfxIVOztVSsqbXfSeLjViqGPtVSjtzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lopPHSglESmajMt6nhovnyp0OnqsVncDf6V1nhgXpOE=;
 b=ZGmyOuw+SkdbPDjF+Y2mBwcXWNdVqxVUV1SafkR6lnSy+XSvHkIIp65oVRJlHMqlYUlKMHER8ecyX43aUuxZcF2Fyc/s2H4Y5iPTQNd9Q+xzZttia6qhvaaIhFz2HdLFb2+awVr1QJ4ZkQNZmpVIq27vorb1V7+s/CrjR4ZztrUF59186lxnDu4K/l4iuZFB7CUECS3W9F1MOwrsl2zpCEHaW3oGronPZJDv0XOBpUg6rRDHqFr1IH7IJgyZ8CQEa/4vXc0JX0EJRMWIIYcc7JN7yKKQGKa76AevryordiCAW6AQHF6HeuKib/CqJbeYwCKXvluqRAjvql3ED93O+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB1963.namprd11.prod.outlook.com (2603:10b6:3:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Fri, 28 Jan
 2022 18:49:26 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 18:49:25 +0000
Message-ID: <bd95f281-82b4-910a-77a9-612db425499a@windriver.com>
Date: Fri, 28 Jan 2022 13:49:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [oe] [meta-python][hardknott][PATCH] python3-pillow: fix
 CVE-2022-22815, 22816, 22817
Content-Language: en-US
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <16CE74488F9899AE.6390@lists.openembedded.org>
In-Reply-To: <16CE74488F9899AE.6390@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d3fee1-ab58-4602-c984-08d9e28ee7cd
X-MS-TrafficTypeDiagnostic: DM5PR11MB1963:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1963A43FF3141CA87FB420FD9F229@DM5PR11MB1963.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ECfg6jop4viZ7a3INDwTzhL9l4TvNoYoeSO59Dy/H3ltjZpKuvN1TWrlI4MaQfc+3AUjQ0aAFm6FklFhmwKNymCtPsg+zBepz11EkR//GKffU8J5GrY2gHVeTpnp5cMjsDxL0XNHL4VEKc/myN9c4Jvxhu59g7AXeUgvj0mQGjjvr6E+Sag3qkdS58FFlvFeDfNT0MuXQll5Y2kGeqdJ5vWnHKB28OaOc2mKxn2pbN9m2OG5kVR8cIUPu6JhUb4MsGVcFYgEpb6ieSFUtJgJr73rboREM7CvyR3qJANpANVB3keJhDlXnOogfPSsIj8V8kMLVx3BImjBlHy7HVbGOPFW0yoFNkDGDw2c5bJ8+mrjLmwpwLWVbyEqFFaFnEiNXmgblimE7GHFueQUh+wrp7r+2okaoKeuEyBFSU0RA2bEruUD9fyr3x9x3XSNdthsuu9d7sp5s9Ku+5rUB3OfE0ZjVjh5VMzTUbffytvsQ/ctsdVMoGAfBx99RYqn8pALP1/cNAaPX8xujmpyAH9mxYz1cxSOk6i7+VPKkFRsToCdqqtVKnc87OI5sowDppMCp62BjAoOcFci4qOuyCiEdQH6Uuy6qBze9qhbhHOUXLdtZ96JA5Yk8YnmwEyJHmECKQQsVOglXdbwezyQkQRStsFvSXlWksFuIZQvvttJpblTeiiR/U9HKQZ68yv10vWhnRlX28dccA+nFJwij8DNtp8YV8c1Pj205NyzzL/KJDc5ZTOxdL/R95842Mm5+B7X1ZlSzUQY/pTi4i3oD4IGJhWXoxOLMz6tuy12AS5Z9vOgoaLjt455loXU/p3UVQF4okDacNjFEagq5D/Y2xQgCkpVbw/lTmvpgdH1xLw2cxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8676002)(66556008)(6506007)(316002)(53546011)(83380400001)(66476007)(6666004)(44832011)(8936002)(86362001)(2616005)(6512007)(966005)(6486002)(66946007)(38100700002)(5660300002)(31686004)(6916009)(36756003)(508600001)(31696002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUNjMFI0WitUdlR6MmRicGFTdSs4TXorTC84UFNkd3NNVGViaWlxTDR1elFq?=
 =?utf-8?B?T3dKNCtscElxblV0YW8yRzJoUnhOQWNpb08wMS9SQWxZYVkzMHdUOUI0YzV2?=
 =?utf-8?B?cmN2RWc4WHh0bGsrc0tncDZJOHU4Mk5KNlNFUVIzWWdlSENwckZpM2tla3hh?=
 =?utf-8?B?UW5CTHFZbU9qZFB1U0NqbkpBV2J3MndNYllsNyt2ZWlCZmhHdEZ4ZVdCS01n?=
 =?utf-8?B?TkRVK1FhTUkzejRvRkloZU5MU2ErN1RybHNobGh2eFAyNlo0ekpXWHQyd0pZ?=
 =?utf-8?B?OW53S2xoQ0RQVUNyTE9uakYyZEwydmsrN01jVzZpdHNLR2dSR3N0TUVlaC9y?=
 =?utf-8?B?OHN3MTlLKzVCSHkzbWtOQW5DREp3L1NVQ3pCeVBibTNYR1lCaDRpMDZEUEFa?=
 =?utf-8?B?VVpTVU9EbExsNm4yV2EyTE1zN0orMWhuQmNBRVROZzlheVJjMjhDK2FHOEJZ?=
 =?utf-8?B?bGJyYVBUbEVzeDhndEVMN3cycC9hM2RuNEFINDI3SWM1dEFBUUVHQ3dhR1JB?=
 =?utf-8?B?OHA1SEtwZ1ZnVDByZkxxS3M2RE43WG5Cd2RBZmxEdTNNeWFJc3ZRK1RpZUxC?=
 =?utf-8?B?Q3NjeWNLQWtWM0UzUFFQZmRMNUlURXFzNFk4eVNXUTFhNnkvc0ltT0lKVDlI?=
 =?utf-8?B?aytSb2d4Tk4wMnNkV2JwR1dEdEoxZTFNcWlkdFMrQ0ZGYnRuM0FCamN3QWt0?=
 =?utf-8?B?c1pINW5tUldQL3YzSHc3Q1E0MDJwcmFvclRyMVZIeVVwWG53ZmdFU3pkMkR4?=
 =?utf-8?B?L2l6UHdQMzRCeUNud20zT1dwY3hac2VReEE2Wk1vRVB0dTMySlhHeXAwV3VG?=
 =?utf-8?B?TGJ2d0FGWkxOcTZQTTRvT2dZdzh5N2xGblVyTHZjZkRiMFI1NmhZazI2Mnk5?=
 =?utf-8?B?VXpxYllNMTY1VjNMUTY5OXBTZEk5dEtucjRjc0pZQ0o5cHMrVmVUR3BjUGY1?=
 =?utf-8?B?cy9Td2N5THZyMGVZYXZTbmYySExUaW9PKzNvTEIrVEc1bWVZQThVa0JWVGt0?=
 =?utf-8?B?bE11bm8wMEhGVW1aaHlUbHdNSFNwbHRYSm9RNTdDWlBRZHBHeGtDRUlkRXlU?=
 =?utf-8?B?d3hlbGUwY3c0YjJvSktvUlBaektQb25va2hzcWVFN1hMU016a3c4M2MyMm1R?=
 =?utf-8?B?REM1UTdKNjA1M3c0d3BGSWVadW5CMTd6QjNkYUcvRjlVNHYwSDh4TG43eGRL?=
 =?utf-8?B?RkcyVzdmWEVSbmlDcGtkL1ZTZmN2NzNCa3lKWWJ0U0tyZEdDOVRUYjY3MkVY?=
 =?utf-8?B?V2phS3BRaUhsNGptcWttU0JiaTFHRXU3WUpCYVQvNi9mVkN2MTV3N2dRd09v?=
 =?utf-8?B?dnV3VWN5Wmp4YWZodDBiNVdRdER5bnpHQlRMQk5oNTdBMzY0S3NYeE9wVmlN?=
 =?utf-8?B?UHpOQkJzdGFFZXFvNFNsWGJ3Vk1MS2NZbHNxaGZhRHpVOExLNFVpblRCSkJC?=
 =?utf-8?B?dXhqaWtNVzRsN1dnZVloVUJDWEQvQ1JneUdRV1lMYm5jQi91d1Jwd3NrMnl5?=
 =?utf-8?B?OXcvdDV4Z29TNHZRK054TC8vUjQrRTVacElHZFlnZ0FKN3gyeGVSMEZXaHBO?=
 =?utf-8?B?UmpTVVBmOHpPZ3U3NU9scDlZMFJzZ0I0WldrOHBkc05RejZrOXhmL3VDUjVy?=
 =?utf-8?B?bERJUFd5b2lLUlRmdFlDai9wK2k2dndka1RxMVlDL1RJMUE0VWZOZzhnSGZJ?=
 =?utf-8?B?SSs5WUR5YUpHMnEvNzBHd2tYUTFiNEFZdWl0R0hKT2E0Qi8xUUFDYVlIQ0hO?=
 =?utf-8?B?R3NKRDAybWw2NlBSN0Nia0huUCtJelJqcWpTVnd5Rk40Mld3bHRIYkJGdk1l?=
 =?utf-8?B?SzBlNEVBMlJoVzB3Qkl3VnhrNDB3aFUyZWphYjhpZDVOSUFFUjQvZHpKM0ZT?=
 =?utf-8?B?V1g0U2NYaUs2SFVYZms5bDRBT3Z3RnVHblRhUWlsNkxMRlRNYlZlK3FmNVR6?=
 =?utf-8?B?WG1QMHFnWFNiTEZ1aVB3VHVJTFJEOHh1R043Mk16TjRCOEhRc2F2alpmWU5x?=
 =?utf-8?B?ajNjWXB3aXpXcGZPUVgzRVpGM2hoTkl1Ny9hS3FBNm1qaS94RWtCVW11cEox?=
 =?utf-8?B?bG1XMCtZWTBoSjdpMGhhVEVUdElERTlhOE9RRFlIL1h3RDBpOCs0MEYwYm80?=
 =?utf-8?B?cHdHdjZaUjRsdkZuTWxTZ200VUxYSWxBU2RaYStMaU4zYUp1S1lPK3BWTm91?=
 =?utf-8?B?M3E4R3Vja09pb1hMNjAzMVFnUHI4VWF3ejJZblBkN0UrU3d2bGxYTjVwSlpU?=
 =?utf-8?B?Zm80NGcxUDhGL3VuNnhCU1d4WHRTbFEreWZ0WDE0d2FzMTFNSjBPMmJXZi9x?=
 =?utf-8?Q?MuRfFiJpxPB1xlMVDO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48d3fee1-ab58-4602-c984-08d9e28ee7cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 18:49:25.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WGNZkT8riuj8ji7qLa2oDfehCSbkKR2X3BqqeqEhaAEgBm0y/VuFxMp9Cm1cIo3ALRY4zeaYX8izESoqEXslMROV9urTRS295n9DzD/CE7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1963
X-Proofpoint-GUID: IM74BA2HfdgV4s48zi6JrKahBV6ZuUSW
X-Proofpoint-ORIG-GUID: IM74BA2HfdgV4s48zi6JrKahBV6ZuUSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_06,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 18:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95160

Missing a sign-off from me on one of the patches. Will send a v2...

On 2022-01-28 09:05, Trevor Gamblin wrote:
> Backport three patches from 9.0.0 upstream to fix CVES.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...Handle-case-where-path-count-is-zero.patch | 75 +++++++++++++++++++
>   .../0001-Initialize-coordinates-to-zero.patch | 45 +++++++++++
>   ...Restrict-builtins-for-ImageMath.eval.patch | 60 +++++++++++++++
>   .../python/python3-pillow_8.2.0.bb            |  3 +
>   4 files changed, 183 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
> new file mode 100644
> index 000000000..26b741f9c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
> @@ -0,0 +1,75 @@
> +From c48271ab354db49cdbd740bc45e13be4f0f7993c Mon Sep 17 00:00:00 2001
> +From: Andrew Murray <radarhere@users.noreply.github.com>
> +Date: Mon, 6 Dec 2021 22:25:14 +1100
> +Subject: [PATCH] Handle case where path count is zero
> +
> +CVE: CVE-2022-22816
> +
> +Upstream-Status: Backport
> +(https://github.com/python-pillow/Pillow/pull/5920/commits/c48271ab354db49cdbd740bc45e13be4f0f7993c)
> +
> +---
> + Tests/test_imagepath.py |  1 +
> + src/path.c              | 33 +++++++++++++++++++--------------
> + 2 files changed, 20 insertions(+), 14 deletions(-)
> +
> +diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
> +index cd850bb1..b18271cc 100644
> +--- a/Tests/test_imagepath.py
> ++++ b/Tests/test_imagepath.py
> +@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
> +     [
> +         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
> +         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
> ++        (0, (0.0, 0.0, 0.0, 0.0)),
> +         (1, (0.0, 0.0, 0.0, 0.0)),
> +     ],
> + )
> +diff --git a/src/path.c b/src/path.c
> +index 64c767cb..dea274ee 100644
> +--- a/src/path.c
> ++++ b/src/path.c
> +@@ -327,21 +327,26 @@ path_getbbox(PyPathObject *self, PyObject *args) {
> +
> +     xy = self->xy;
> +
> +-    x0 = x1 = xy[0];
> +-    y0 = y1 = xy[1];
> ++    if (self->count == 0) {
> ++        x0 = x1 = 0;
> ++        y0 = y1 = 0;
> ++    } else {
> ++        x0 = x1 = xy[0];
> ++        y0 = y1 = xy[1];
> +
> +-    for (i = 1; i < self->count; i++) {
> +-        if (xy[i + i] < x0) {
> +-            x0 = xy[i + i];
> +-        }
> +-        if (xy[i + i] > x1) {
> +-            x1 = xy[i + i];
> +-        }
> +-        if (xy[i + i + 1] < y0) {
> +-            y0 = xy[i + i + 1];
> +-        }
> +-        if (xy[i + i + 1] > y1) {
> +-            y1 = xy[i + i + 1];
> ++        for (i = 1; i < self->count; i++) {
> ++            if (xy[i + i] < x0) {
> ++                x0 = xy[i + i];
> ++            }
> ++            if (xy[i + i] > x1) {
> ++                x1 = xy[i + i];
> ++            }
> ++            if (xy[i + i + 1] < y0) {
> ++                y0 = xy[i + i + 1];
> ++            }
> ++            if (xy[i + i + 1] > y1) {
> ++                y1 = xy[i + i + 1];
> ++            }
> +         }
> +     }
> +
> +--
> +2.33.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
> new file mode 100644
> index 000000000..758531f67
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
> @@ -0,0 +1,45 @@
> +From 1e092419b6806495c683043ab3feb6ce264f3b9c Mon Sep 17 00:00:00 2001
> +From: Andrew Murray <radarhere@users.noreply.github.com>
> +Date: Mon, 6 Dec 2021 22:24:19 +1100
> +Subject: [PATCH] Initialize coordinates to zero
> +
> +CVE: CVE-2022-22815
> +
> +Upstream-Status: Backport
> +(https://github.com/python-pillow/Pillow/pull/5920/commits/1e092419b6806495c683043ab3feb6ce264f3b9c)
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +---
> + Tests/test_imagepath.py | 1 +
> + src/path.c              | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
> +index 0835fdb4..cd850bb1 100644
> +--- a/Tests/test_imagepath.py
> ++++ b/Tests/test_imagepath.py
> +@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
> +     [
> +         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
> +         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
> ++        (1, (0.0, 0.0, 0.0, 0.0)),
> +     ],
> + )
> + def test_getbbox(coords, expected):
> +diff --git a/src/path.c b/src/path.c
> +index 4764c58a..64c767cb 100644
> +--- a/src/path.c
> ++++ b/src/path.c
> +@@ -57,7 +57,7 @@ alloc_array(Py_ssize_t count) {
> +     if ((unsigned long long)count > (SIZE_MAX / (2 * sizeof(double))) - 1) {
> +         return ImagingError_MemoryError();
> +     }
> +-    xy = malloc(2 * count * sizeof(double) + 1);
> ++    xy = calloc(2 * count * sizeof(double) + 1, sizeof(double));
> +     if (!xy) {
> +         ImagingError_MemoryError();
> +     }
> +--
> +2.33.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
> new file mode 100644
> index 000000000..4c266cc41
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
> @@ -0,0 +1,60 @@
> +From 8531b01d6cdf0b70f256f93092caa2a5d91afc11 Mon Sep 17 00:00:00 2001
> +From: Andrew Murray <radarhere@users.noreply.github.com>
> +Date: Sun, 2 Jan 2022 17:23:49 +1100
> +Subject: [PATCH] Restrict builtins for ImageMath.eval
> +
> +CVE: CVE-2022-22817
> +
> +Upstream-Status: Backport
> +(https://github.com/python-pillow/Pillow/pull/5923/commits/8531b01d6cdf0b70f256f93092caa2a5d91afc11)
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +---
> + Tests/test_imagemath.py     | 7 +++++++
> + src/PIL/ImageMath.py        | 7 ++++++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
> +index e7afd1ab..25811aa8 100644
> +--- a/Tests/test_imagemath.py
> ++++ b/Tests/test_imagemath.py
> +@@ -1,3 +1,5 @@
> ++import pytest
> ++
> + from PIL import Image, ImageMath
> +
> +
> +@@ -50,6 +52,11 @@ def test_ops():
> +     assert pixel(ImageMath.eval("float(B)**33", images)) == "F 8589934592.0"
> +
> +
> ++def test_prevent_exec():
> ++    with pytest.raises(ValueError):
> ++        ImageMath.eval("exec('pass')")
> ++
> ++
> + def test_logical():
> +     assert pixel(ImageMath.eval("not A", images)) == 0
> +     assert pixel(ImageMath.eval("A and B", images)) == "L 2"
> +diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
> +index 7f9c88e1..06bea800 100644
> +--- a/src/PIL/ImageMath.py
> ++++ b/src/PIL/ImageMath.py
> +@@ -246,7 +246,12 @@ def eval(expression, _dict={}, **kw):
> +         if hasattr(v, "im"):
> +             args[k] = _Operand(v)
> +
> +-    out = builtins.eval(expression, args)
> ++    code = compile(expression, "<string>", "eval")
> ++    for name in code.co_names:
> ++        if name not in args and name != "abs":
> ++            raise ValueError(f"'{name}' not allowed")
> ++
> ++    out = builtins.eval(expression, {"__builtins": {"abs": abs}}, args)
> +     try:
> +         return out.im
> +     except AttributeError:
> +--
> +2.33.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
> index 8279544a8..4393d9356 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
> @@ -11,6 +11,9 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x;protocol=https
>              file://0001-Limit-sprintf-modes-to-10-characters.patch \
>              file://0001-Use-snprintf-instead-of-sprintf.patch \
>              file://0001-Raise-ValueError-if-color-specifier-is-too-long.patch \
> +           file://0001-Initialize-coordinates-to-zero.patch \
> +           file://0001-Handle-case-where-path-count-is-zero.patch \
> +           file://0001-Restrict-builtins-for-ImageMath.eval.patch \
>   "
>   SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95147): https://lists.openembedded.org/g/openembedded-devel/message/95147
> Mute This Topic: https://lists.openembedded.org/mt/88744867/3616776
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

