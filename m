Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2D0C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 03:44:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2783.1639107875887362760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 19:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Wl1bfo6F;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7978a44723=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BA3YgYP002424
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4bsaPhydp1QdpQxouyzrPVMpQmDpKa3WbwU31lVGIk4=;
 b=Wl1bfo6F8oya5uf+T+YhYDNCloSQy9a64ZIszzeGA0n591f09dwb9fGUJ62SUtiXLloe
 E0JITgGJPOAkCgK7bo6HyOccJkCmRcrBbIqQ1yZ22hLqHSqHcmS3nap/V0RPnHJfFgLg
 /yZNAh8Uo4nDtN8OjumjZr6O/tLQ3InDEbBzyI8pJS9CDLrv4A2c5UBn5ZWKCZcfieXO
 kT6Q6NmpHLLui15notew0rU20phlDiB9eKry6JaLPyVjesDa021tTig/YC2kMLJ2sHjg
 GoyeH9LPp/jAlpxZVKrk3uuQA/bq/lR2w/3H4VpU/G1JiakMnXg9pgunbwxZu5Rw83Jw rA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cukc3rtk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:44:34 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BA3iYTo020454
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:44:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cukc3rtk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Dec 2021 03:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7n3vfKu3LCU8F7klC9YZQ0M+Slz+MdSZ/9uAauBe0LxIzw/envG0/LltfeYwSswYeeusELJFSJm/9afWZ4rpTC9sdhz/M43pzZ/6x3AXNB1VVoufST0VwGEOvwkZ3z/qtJA5PE/m8hEveIN/NrAQLS46Hyyrk3PBj4nXvF+tsmICsWfvJu3slNP4dcMHpmVxnn/aQA4ZqwVjo4JBe0MDfjKlLjoaS+n4ClcE0Ad1SU56VvlEJxGrHDXuMjRTFdn+ylcH//e0ca670yE8zjri1x6AlYWLfULo3YEJC2dwanrDM9iGFlAeFmk6Tr5G+CMXCjJs10OxiEMNTC2wIezSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bsaPhydp1QdpQxouyzrPVMpQmDpKa3WbwU31lVGIk4=;
 b=PdsojS4/Njaz4ERBJRCWnmQDYg/TI+q7fhZ5aEH8bRwk2Js4vmx7Dew/EiUKbtZsWsJJ83qWSToFJEJCcFL9OXHtb+MDWkQsol5Oyb8hS2micMMnYuogS5qE1BYA/5aQsPqHfDOK5exafYkVd9zi7JI+9vHGUOPHrx/o8yVzFILHpmhR5u/d1lM4nHGDPxmorjhiK7Pr4EeaCQWuUKEENVqR6Wg2vTtLFpUviZvgBVf5i+Ac5K7OhTON9Izh0D8LBOYfOgD6WQQayMGukvf5b3xE7igbdg40+MWQk5I44sDgqF3GnryjHcTU0+wmFscKHrDj0Cg82yDETgXd7Dv4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 10 Dec
 2021 03:44:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 03:44:32 +0000
Subject: Re: [oe] [meta-oe][PATCH] openldap: fix strip issue with new patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20211209095614.173901-1-yi.zhao@windriver.com>
 <CAMKF1soZg8WykcHXVz2jMS-xvA=GCrcXWy9AthNB0WHbLrVyFA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <ec4d1b02-0892-1107-7bb1-25084e26c8eb@windriver.com>
Date: Fri, 10 Dec 2021 11:44:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CAMKF1soZg8WykcHXVz2jMS-xvA=GCrcXWy9AthNB0WHbLrVyFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from [128.224.162.174] (60.247.85.82) by
 HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 03:44:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d99e0f93-509b-43e5-89e3-08d9bb8f603f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4586:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4586030C223E1502D27AB529F9719@MW3PR11MB4586.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hIVuUN9gdcx4tXWjQByhLaC3Ksv21DpX2QeA/AvlDJuObIlWrjT7TaI0s7BP1M2I1Vu5mMUKiDETVKvstlMPpitF4lAdErDyJO9SvCnqPKXpMoZNCALZNNa8sar+jDAU6v5ZaaT/VRgqLUxg47q200LnLGUjVyHSZKk2cJ9oX76jH8+4DMwyh1gMKYWTzrtOvd26Cne6y8wdrAF2TYouX/WZdmqqpPsc4N9cwXy8T5R8+4uHPl/Uyhi+hmZE8tQIQ5e8ggFE2xTogLd63kPFLItHmiiHB5q8Bto1nKLtBJmK0fpviZnhj+Jd700Bjbbmvc/8O6f7iGK/Y9jvMHSEP0zNaIuxUdGw2nhigHbgTO1s1sEEBXAj8wgcIPhU5LrzPhvNYPVu/M4sxR8l7HTWn6aRfGuZUJgzbIw8vUX/Kqs0ogbpW4s8QVUjCuBqb2KHPb0ChSGu3D6vb1yQj6zUYMkU/D9355jpZV+n2n4xHN6kIVyk8a3Nt8tC6CN6GhBqDr/p3TSdT26BFutYQsPHHgUVjdUbmUbY7ukggk8qawKpf0zEtM5UOFuQoC4HCBNElU6mCDhxeMqSGNRMjuCOmzjGe0+QeINIS/qlkwZN15CNXMDn8dZSauAfNO4aG8eZdnH+SLPC2r8CiY4jAgnDjuBbNrd2iAodE+uI3l6QArex+MEMD8QB8YtkYywjHa/c2AEy7LhvzPo4JDKv29NqaaE5UG0N3PsP1XtuL0gjNvmheMFYjcTIhhuUV8Rr+LrLhK6Oo4QY38JHhAzomkSuE+g1GMEwisTzXzRfdldOnYqgbaf1xUIsS0oDD8lSDhdQED6VCgqWesGhYp7DJAzc2v/GNvDZy1ht5VjPhLEmvpdCXV3heyJms8RE1bLuPgviwoyAsYJeFmYTsCBvQjV1OlM909ca65G6FJw1QWTU8AM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(186003)(6666004)(26005)(2906002)(6486002)(8936002)(86362001)(956004)(66476007)(6916009)(66946007)(66556008)(2616005)(4326008)(6706004)(38100700002)(38350700002)(16576012)(44832011)(316002)(966005)(31686004)(53546011)(508600001)(8676002)(31696002)(5660300002)(52116002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVhHU0ZVV0ZJS05mUVkzVFhiaFAxWkR0RmE1aUhKaDY4V095YVlvRGdPbE9L?=
 =?utf-8?B?QTV0d0luWHMwUTZ3QXZ1VzRTb0d6M1VBc3N4TzNmdkRqd3QrYS9QRFlMSE1p?=
 =?utf-8?B?bEZxUXZyTy9WeGs4ZFM5dnZTYXdIekg5ZnhKT214ejlPT1gyeHlJTy82RkVh?=
 =?utf-8?B?bDBCTTZ5VUhtNjI0MEc0N2JGNjd2OWI3UC9wVXo1RmwzMnBDOEpmYXJ2VFN4?=
 =?utf-8?B?bWdpNEM2WG5vM2hCSWpJT0lpQzAwZWE4WGhkTExoTzFMbXZOejV5NFBWL2E4?=
 =?utf-8?B?Nk9QWFl2Wlh5UUt5UDNKd1BBUUJSdTJ1MnpXVitMRVhYQjdyc0Z6dmlPNlg5?=
 =?utf-8?B?SjFGamMrSHAwaVVCOVdVblliKzFCT0NUL3I0MDcwOFB3OHJJbkZZcDJ5aktL?=
 =?utf-8?B?M1pMZjF1OFlYM21QNHhLTlUzU2dWWjV1eWg0N3hGTm5iL0ladURHb3A4VW5o?=
 =?utf-8?B?VW5JRmtINHo0cWJLUCtTcFJIcTdGc1QxR0lIS1U4Mmdvbm44UDBqZml5cU0y?=
 =?utf-8?B?SVo1NVpWbUo5VEx1L1VWZVNhTjFNSjArdnBxSSsra1o4d241ZHZQc0ZOWlFK?=
 =?utf-8?B?L2pldEUvdWRmL0llY2VkUEpjdEVYU3owenkwanpIZlMwVXlXRDVody91enVG?=
 =?utf-8?B?VFR0ZkVLQ3pYWk5nQnZuV0FiL3FITlBWSlhoTy9yU3NNU1VOZzlQeGh4ZFlL?=
 =?utf-8?B?cFhoYStFQ2lNWjB3ZHl6ck44cm9wOWZucU5tNEUyKzVwRFpFTS9rVTJRNHF5?=
 =?utf-8?B?aUVmWm9nY0RBdDFxRCs3bXF4aEJsY1hYMDUzQkQvN0JHL0dRejdXVnp1d3o3?=
 =?utf-8?B?d1RaTGFGVEFnQVh4U1pyM252N3VEMnFsa2NyVXBxZlN3U21FUklhR0crWGl2?=
 =?utf-8?B?MFoyWjMzUFU2U0dnbm02eGN5dlFaOU5od2Q3Vm9vTDJ4NkZBNlZ4ODdQT0Z4?=
 =?utf-8?B?UXVGayt4Wk5HUS9nM1lua1lrZlJCZ2dXaTRHcnhMa2ppWDJTZ2tVcld4UHk3?=
 =?utf-8?B?b3NRMWNYaTU5RkcwNERFWXZ5K1VpTmNkalJJZ082VGEvbzlMa0RjSGNlT3dQ?=
 =?utf-8?B?elFPZ29MZzBkME1XanVPMnlBN2kzNENGZ1ByNnkvUzhFaXVqZEVxSERjN1BO?=
 =?utf-8?B?T3hlRXlyZU5XckdZMmxDU1JiVGVYQWxkcXlHQVRPN3FlcFJuYTh2d1A1aVFz?=
 =?utf-8?B?U0g2YUZqcGlxOVpsNFRvcEtLVjdFY1B5TjBMUngzOUtEMUxibzAwY0R2d1ZO?=
 =?utf-8?B?NXZIdUJxYnM2eHhMNW9ha0V1azBJUXZWVGNvbUd3N1hwcXE1V0NLSUhuU3pn?=
 =?utf-8?B?bCtRWjY2d3d0OWdLV2xSdUVEdEV1OXR4OEg1bjJpRlBHSWYwMmY5YmE1Zldk?=
 =?utf-8?B?WmV1dWY1WHgxdGxGM2VVbUFyZmtIVzdGYXR6M2QyQWtRUlN3SXQ2a2IrSnJO?=
 =?utf-8?B?eisrTFo4U1phUURKeUIydE9oWnJ2OVZvdEk2eWVMYmEvY3NFVHJ0RjVQVGNC?=
 =?utf-8?B?RzZUUVV5VkpzdmtsVjdtQWhubTJrOGhNS25EdEZnRTZFTGJDNkFUZHJUeExl?=
 =?utf-8?B?NTYyc0NhYVRmM1A0UnVLVHlFN09hVE8zYkZSNE91OXdRZFVrUVNPQ2c2MXBm?=
 =?utf-8?B?ei9sUDNYNU5kNUliZEd4WTJJWExoNkVMYUIzUWphbVhYalFrZGh2NC82N1dK?=
 =?utf-8?B?Nm9oV0UxNVo4UVdURENpL0dUeDBDVjZiMHc1Q2JlS3hMMjdkdkFxSUpuREt6?=
 =?utf-8?B?TUs1dlhKMXlWU1hYRXlOd0M2WVE3Qm81dEFwQkFhTUdFMWhIY2hUbzlNVTJS?=
 =?utf-8?B?OEh2Y2FHRUx2UUU5UkFqNHNtcTBPZUUrTnJ1QWxSM3F0UzJMcFBNMGtHbU5t?=
 =?utf-8?B?OXV4aGZuY1k0UGp3Kzdkcm5xQ3NSUWZLT2wvL25vVm1Mb0RNaDBZS2JTcVly?=
 =?utf-8?B?VzZDQk9WYlcvWmlUZTRBOFh2QnF0b1hsOWtvbTREZlkrcElsVkt1RXhkNGtm?=
 =?utf-8?B?NjBCb2ZVNUhzQWQzbVJ2QUJFbUFxVERxcWlVOXVsQU1Nd08vRWZBMnZ6ZzF2?=
 =?utf-8?B?WVFUcUZBakczUE4yS2U5cFZ6VmxyRDVIejFUOVEzY3pHSVdSVzY2SHFWcUw2?=
 =?utf-8?B?bjBNdHBEKzlxbWZyNVpwbVRiaDV4WlNhTUlkUFphUUVORFpvVGZSbDYraWJV?=
 =?utf-8?Q?ASy6FeYWZW8AJBhupWRuYzg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d99e0f93-509b-43e5-89e3-08d9bb8f603f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 03:44:32.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gMpcsZnml8rJF10xV2NQ8G3VLvZQh37f8Ls9DFkD7iLhqtaF3fwjFePUIh+gnTt+G8YXeKvuOI2qFEHYt3Imdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-Proofpoint-ORIG-GUID: D-5p7DjcfVZ0uFJ1heZMfSuRokmOY28i
X-Proofpoint-GUID: uQh9Yy2LSxNw4V_ELJUIhjAC9sJewUOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_01,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 03:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94266


On 12/9/21 11:57 PM, Khem Raj wrote:
> On Thu, Dec 9, 2021 at 1:56 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>> The patch install-strip.patch tries to fix the [already-stripped] QA
>> error with an outdated install-sh script which causes a parallel
>> installation failure:
>>
>>    ../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
>>    STRIPPROG="" ../../i686-wrs-linux-libtool --mode=install ../../contrib/ldapc++/install-sh -c  -m 644 liblber.la TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib
>>    mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/core2-32-wrs-linux/openldap/2.5.9-r0/image/usr/lib': File exists
>>
>> With the new version of openldap, we can fix the strip issue by
>> unsetting STRIP_OPTS.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../0001-build-top.mk-unset-STRIP_OPTS.patch  | 38 +++++++++++++++++++
>>   .../openldap/openldap/install-strip.patch     | 17 ---------
>>   .../openldap/openldap_2.5.9.bb                |  6 +--
>>   3 files changed, 39 insertions(+), 22 deletions(-)
>>   create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
>>   delete mode 100644 meta-oe/recipes-support/openldap/openldap/install-strip.patch
>>
>> diff --git a/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
>> new file mode 100644
>> index 000000000..9d25f2c59
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/openldap/openldap/0001-build-top.mk-unset-STRIP_OPTS.patch
>> @@ -0,0 +1,38 @@
>> +From 321839cbd1d57f12d3d6695254d2003473d8dd1a Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Wed, 8 Dec 2021 16:58:55 +0800
>> +Subject: [PATCH] build/top.mk: unset STRIP_OPTS
>> +
>> +Unset STRIP_OPTS to disable strip to fix QA errors:
>> +
>> +ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
>> +'/usr/bin/ldapcompare' from openldap was already stripped, this will
>> +prevent future debugging! [already-stripped]
>> +
>> +ERROR: openldap-2.5.9-r0 do_package: QA Issue: File
>> +'/usr/bin/ldapdelete' from openldap was already stripped, this will
>> +prevent future debugging! [already-stripped]
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + build/top.mk | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/build/top.mk b/build/top.mk
>> +index 38ce146..6e9fe1f 100644
>> +--- a/build/top.mk
>> ++++ b/build/top.mk
>> +@@ -60,7 +60,7 @@ INSTALL_PROGRAM = $(INSTALL)
>> + INSTALL_DATA = $(INSTALL) -m 644
>> + INSTALL_SCRIPT = $(INSTALL)
>> +
>> +-STRIP_OPTS = -s
>> ++STRIP_OPTS =
> You can make it STRIP_OPTS ?= -s perhaps that can be submitted upstream
> if thats accepted then we can pass STRIP_OPTS = "" from bitbake environment
> in recipe and eliminate this patch.


Thanks, I will do it.


//Yi


>
>> +
>> + LINT = lint
>> + 5LINT = 5lint
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
>> deleted file mode 100644
>> index fb7ad8f59..000000000
>> --- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -# This patch ensures that the install operations which strip
>> -# programs and libraries (LTINSTALL) work in a cross build
>> -# environment.
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> ---- a/build/top.mk
>> -+++ b/build/top.mk
>> -@@ -125,7 +125,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
>> - LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
>> -       $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
>> -
>> --LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL)
>> -+LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
>> - LTFINISH = $(LIBTOOL) --mode=finish
>> -
>> - # Misc UNIX commands used in build environment
>> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
>> index d95d6912e..c008c7b4b 100644
>> --- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
>> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>>       file://slapd.service \
>>       file://remove-user-host-pwd-from-version.patch \
>>       file://0001-ldif-filter-fix-parallel-build-failure.patch \
>> +    file://0001-build-top.mk-unset-STRIP_OPTS.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
>> @@ -28,11 +29,6 @@ SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364
>>
>>   DEPENDS = "util-linux groff-native"
>>
>> -# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
>> -# installing .so and executables, this fails in cross compilation
>> -# environments
>> -SRC_URI += "file://install-strip.patch"
>> -
>>   inherit autotools-brokensep update-rc.d systemd pkgconfig
>>
>>   # CV SETTINGS
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94259): https://lists.openembedded.org/g/openembedded-devel/message/94259
>> Mute This Topic: https://lists.openembedded.org/mt/87609121/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

