Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621CAC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 21:59:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16388.1684879141884612337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 14:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=KilCC8L8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=450754b2d1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NJQRnB005250
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 14:59:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=OetV5QlbG34DSf8Ho11AMMbov6XOdcSDKcrYZhmvHvA=;
 b=KilCC8L8F7GRE4Vtu7xb5UnRet3OzIOHPgE7hCmH5R/pMj0E2dnsyLnFA1aSFVgNcWCd
 30oKFtLfK9H4+jJt9KqdvHdXRTP4cUCnBGPtDpfDWW5pZ6LUvTVLt5YYfoEZ1J/ukZQ8
 GjwRnn9BCc48YGEhvEflgTjcpfs69iC/add7ispeQA9pX4gsb0DJtE5pD/HN8+IhSTQ7
 Jy8w3BPV1D161vQD6VKOreQe64AKhRYDYLQcfkpkmW9dEtnxWyPUTmrhgSF7AxKNTdXa
 CAXzzGsPO2Qb5xd6eSF6MrMMqQ6BCSGCnpfltHxRYPzujfoo6Lm2kQQbEriBou3PRipS ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhb204-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 14:59:01 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34NLtcA5023868
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 14:59:00 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhb201-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 14:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNrKQuqnxHFWZY0+sHKzYnaroxP2XWGHbIQNA+hbHt2R+2668r8mE3KnGAibQtEqEdzwaWKmo0LUlq0PZ7nGR7FXXcI4sZuVfyjpXq4e0er7ys05UC75T8M22a0LfWAzWmIah+5+l/FMCSqg+qBcl2mi6oAB1agFlaIdCJqtjGY0tn53+Oi/aXw4iPtzgzQHRgBHxGJEEcOx3uMnFjV+Kz6eIf8iqYt37AevunR/YTlxFVUjeBCOu5UkLcERYULahvjs6nIuVsKk/l6ococUYQHg08+gCRvOcO/RqluKI55vw+7vh9wXR7qpby2CmLfBqS1CStTUiYnsF3fdIuhBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OetV5QlbG34DSf8Ho11AMMbov6XOdcSDKcrYZhmvHvA=;
 b=YQ5NKm1amX8twkxGWbkLhP/VBirrs7HS/wFN1WqFXKETCrple7l0kgpRTALJUxtnudOKhQ5LpgBCkKJaCfted9QpP9aLoSSv8MiAubV0iF55FBKpGvB8ajpkkYmL9kcwjZJdufBZERxfwVvjgy8WYiP61WZz4+adWF4C5VQthrpd+/wxzkdhLCLZlnrBsiVXs6f+dLKWGTETahs7/UDUOMTLGZLjNXYP5atcCLRCRZQrRGmKo+iK2RLIYl3Tv2aaBFL1NDGnH8h3sw7Vlfc9Uukcj/XQAq4V5Nj8Fj+QrTmc/sXPPBAKtR47C08UDEbNw24Dq+P+2Atv+ItTfCTywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB7206.namprd11.prod.outlook.com (2603:10b6:8:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 21:58:56 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 21:58:56 +0000
Content-Type: multipart/alternative;
 boundary="------------UzijYM0hWSg0bIn2OmsonAbQ"
Message-ID: <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
Date: Tue, 23 May 2023 17:58:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-python][hardknott][PATCH 2/2] python3-django: upgrade
 3.2.5 -> 3.2.12
Content-Language: en-CA
To: openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>,
        "Mali, Narpat"
 <narpat.mali@windriver.com>
References: <20220323173332.16576-1-trevor.gamblin@windriver.com>
 <20220323173332.16576-2-trevor.gamblin@windriver.com>
Cc: "Reyna, David" <david.reyna@windriver.com>, Khem Raj
 <raj.khem@gmail.com>,
        Trevor Gamblin <trevor.gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220323173332.16576-2-trevor.gamblin@windriver.com>
X-ClientProxiedBy: PH8PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:510:23c::10) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: fb86363b-f604-4180-fda9-08db5bd8e7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jw7FKlsJh5hbMoNJh9Yj7Pbqd95ilTrvOsYVvlmjWxuFKDP7eoHhF0zDeZ6MXEdfwrc0hlDX+ciJ35kwhGr27Z/EwcJc8bXxQ1m2sSQMcobcxtaaGBFY195J7ljMndPEJM2DDY3IYxJSRyF1ZwtHb/tG8akOJBSWSMv8eUE/h5GvdSS47tU9USv7nd/5Hbr0l7CV826i2b2ZMCPv/Wh6rGaGgGbUTv8h97ihhiLrXb/896mTIEB+q1YNetVLtSqk1JvIXUoe3i5aiyOtzJwMnMxTTcbqrDvC4psrzlkNwq7XdTSfHAkBqNmwaOKlraYK1UFxNzfsTj9gopU+bxna69E4NJhGiItKBjxcA7IEV3RsYORgufreCaI0rqRJB0rUnsU5Zw5mB2u/FSLVPlogtmm49S4+0yLoCyyqKefVkKWOf3Y2PgeGX9fsmEoJSqd6PFrPjkdr9AbG8DHKWJncqOV3l0VkQzW3Nz3+93yLpTRvefigU/W7kTm0oziKHtPvITSm8r8i0Net9fxa7m03djWI5gpfqYhTC03wN6IuhhJjAQ5KmrKvzu107nJZeA8FsOClRPx9Rzdz2hFhSB4lKSmKwSOrbmVDWFmgDFwzFPk82mo9ClOG4iQKhLSuowZ1BrkGjTEhrS+0eBvbuuCYDtPhhntlRT28W1K4QRQ+PaAbdQqmgQAn8amj5PqFhYxA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(451199021)(66899021)(166002)(8676002)(8936002)(5660300002)(30864003)(2906002)(36756003)(83380400001)(478600001)(54906003)(110136005)(2616005)(107886003)(31696002)(186003)(26005)(53546011)(6512007)(6506007)(33964004)(966005)(6666004)(6486002)(31686004)(316002)(6636002)(4326008)(66946007)(66556008)(66476007)(86362001)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3QwM2xEOUhyNHpBUDBIbnd4bEZ1Vkx2cUxlTjZKeHBXWU94ODZaRU5maG9N?=
 =?utf-8?B?Sk9tY2xLQjdIU2l5MXRPVldJcjdEYUhNU0szaU83c1FtZVU3WUk4cWpJMExU?=
 =?utf-8?B?ZVhSVWp2T2RkajZyWWVYTDFhZXZjMzE3U3ljRUVFZzBYOFhuWkNQT21weW5h?=
 =?utf-8?B?RkxOcWs2dmRGczdxWWkvM2lvNmQwT1I4S3pYMWdEeEdybTZMWVBwUCtZdUlv?=
 =?utf-8?B?ZU5yR25UdHhFS01sNEVHdTV3SUFBZ2x5c0h2RjFWWUl2VjBFcFFwenlXcUQz?=
 =?utf-8?B?QVZWdlBrOGlqbDdZRnZ6aU50VWdweFRTa2hyK0FzdmRyRFZwT2tQUWtIeXFm?=
 =?utf-8?B?VmE1NDVxY0M4YmVDZWVzMzE2MFN2OGxjcXRRY3BrNVY0cjJ2bDE0cURzbkxz?=
 =?utf-8?B?UVZXak5zUDZOYUNWL2hOZVZIWnlIU0M0aWR1Qi9ONzBZdWs2TmtycEJ6YVZ3?=
 =?utf-8?B?R0NJc0xtcDBHdVNaNS9QWFl2emFkNDM2MmpFL0hiU0VkcmhzWlFEbStJdFcw?=
 =?utf-8?B?VVV5ZlVKUkJWZmxYZTVBRHlZTTZGWXpjclFFODJvb1VJS082QlpVY1k3Rm9H?=
 =?utf-8?B?Z2ZLMUNTWFpoNDB5RGZrcUlqNVVnUWM3ekkycW1lS1JDMWRINWFPZFNCTHFI?=
 =?utf-8?B?YzJWYkN5K3dXZVE0YVVvRFJoQmZlWjU0UVVsUkJIQTlyVFh1OUR3RzRnM2Jo?=
 =?utf-8?B?NkwvYS9YZmVxSlh4WlF1OGxFdWFnWkdRdGpnVk96ZlFUeHM1T1RZT1VLVWV5?=
 =?utf-8?B?WnVhRE1rZVFaTkpEK3hLZ0djV2ZkTHVWY0ViNXczOFlMdGxJYUZ0ZDdYYlJt?=
 =?utf-8?B?TDFWbDFvY2JhOVlidDN6QTBMZHlqVVJJc1hCdStGdURwZUEyWktVU3ptRG05?=
 =?utf-8?B?NmU1QXFscFpvbDM2KzBsWk1QZDlPSmt3NHlPelQyRVFDU0grUXZzM1hUaEYr?=
 =?utf-8?B?Y2phNE9EMzcwTTRkbFN2UzQrMjVpTHc5ZmVibFFxNmRsNitwd3VIQ1ovc1V6?=
 =?utf-8?B?R1YvVnl4Yko2N0k4VksrZTZEb0labHJlNHV0NDhzelRrMjlxK3RuR1VldnQr?=
 =?utf-8?B?VlA2TVNaVlJnZ0dBSXphMFkwSXFGdklPbElDRTdIM0daMzJRWjJjUmhtVzNh?=
 =?utf-8?B?WURTemRHNDFaZjZ2NHdyS2ZkdmRldHRBRmdGSzk3d1duL3d4ZkR5bExXbjdt?=
 =?utf-8?B?QytFSmJtOEh4QnNBKy85WmJGNEJpL00xeThRUTB3OUxvWDRmSW01M2l2WGRC?=
 =?utf-8?B?UkdjOE1VeWFYK0tmN3pTdGd1U2NJQzVuR25TU3Jmb1JITW1FSFFCd0p3ZmlN?=
 =?utf-8?B?S3FnbEdlemFzUEtTQ0FLRzhWTUFZN2oyeDJjTUJrcFFmR0tTYk9CTDNGV29o?=
 =?utf-8?B?M3BtVlc1TGlQdWdhNXk5dXBDejVkM3h1UTl1RGxwMUJFNG9NMFhzNTZibytj?=
 =?utf-8?B?dHdNbDlWcm1jbENacTMrTSs3eEZqUFlERlVJUkpDSXVIMzBhTDBNMjgrQWZU?=
 =?utf-8?B?cFloWHVTVFFnY2hEMnJHUUVySmc2NEJkdHRYamtWTFJmdzZjamNGL3FIVWRT?=
 =?utf-8?B?YW82WnQrNWNGQzNLNU8rZ1hPNE05a1FrRDJWZUdQSG12WXJBblZ5VWF0OW5J?=
 =?utf-8?B?c0JVOTRoRkhMTTJkZkJld0kycGFHdm1LY2sxNmJFbm9xaXNJcjdzWE9pclVl?=
 =?utf-8?B?cVphcG4xdEdwdEgwQnBPYmNmU05CNk9Ub0FjZkpPTU8zUjNYU203ZitTbzZq?=
 =?utf-8?B?UEw1djZKMjZ5OTBpU1MvRXp2eHphdVB1U0NsNHo4ZkFsR0JhQ2VlSHZ5cVRB?=
 =?utf-8?B?ODkyU0txUkY2L2w3NmNrUktCZmgvMDFKNHp0K3BEV3dFT1J5eDV6NVVSUDhF?=
 =?utf-8?B?NDhkY09telBlUzU2cnJjSUlBL2NndHltNU9JNCtSQi8xY0ZqZ3pvbWcyaXVo?=
 =?utf-8?B?c1ZlOURtSGpUcmluVzY3Q3BqTlRMY0xPdmJZREVXbDRwQ2JWaUZZTWxKakVa?=
 =?utf-8?B?cm9xY21iOXA5WlN1WGpTU0pOM29ZU3NSYWJlU0w3T0k3Qk43d2U0S09YNnBH?=
 =?utf-8?B?Vm9vdTl0aTMzdmZhZ01LWStNM0xHR3kxTDhLUk5UK2NQYWRmQmJoaWdNS2N1?=
 =?utf-8?B?SEZNdUw3TThySG02Z1psZjh4bG9JSHhObHlMTFdiSXhjNGpxUjVjY3dOL1Z2?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb86363b-f604-4180-fda9-08db5bd8e7c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 21:58:56.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JA3wCj2Usy9mXS08M4GtIGZMrb+EGxWxpJWX04GblyTbnV6ZNXTqGjYGFIijUk039pT46nM327MDct6Nvg71ZcQRHAGxr+u56slY3dIuAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7206
X-Proofpoint-GUID: kIEWLKyImmsaupzKr-X-C8W8Rwiu-xr3
X-Proofpoint-ORIG-GUID: 5kMOua4ASFX_89Zg9ronSvQiNa9ZhCd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_14,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230176
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 21:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102744

--------------UzijYM0hWSg0bIn2OmsonAbQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34NJQRnB005250

On 2022-03-23 13:33, Trevor Gamblin wrote:
> The delta between 3.2.5 and 3.2.12 contain numerous CVE and other
> bugfixes. git log --oneline 3.2.5..3.2.12 shows:

Narpat is working on a patch for: CVE-2023-31047

He'll start with the default version of django : 2.2*

Which if any of the other versions should be fixed?

Can we remove version 3.2?
Can we update django 4.0 to 4.1 rather than backport the fix?

meta-oe.git on =EE=82=A0 kirkstone [$]
=E2=9D=AF fd django_
meta-python/recipes-devtools/python/python3-django_2.2.28.bb
meta-python/recipes-devtools/python/python3-django_3.2.12.bb
meta-python/recipes-devtools/python/python3-django_4.0.2.bb

Can we add a check to ensure that we never have 3 versions of a single
recipe at branch time again? It's rare I think but worth discussing the=20
idea.

../Randy


>
> fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
> d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file=
 uploads.
> 1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% de=
bug %} template tag.
> a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
> 027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-4=
5452 to security archive.
> 0a9a46a1d7 [3.2.x] Post-release version bump.
> 6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
> 8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path travers=
al in storage subsystem.
> c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information =
disclosure in dictsort template filter.
> a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in User=
AttributeSimilarityValidator.
> b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 rele=
ases.
> ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior=
 change in Django 2.2.25, 3.1.14, and 3.2.10.
> ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
> 1cea03ab00 [3.2.x] Post-release version bump.
> 0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
> 333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypa=
ss of an upstream access control based on URL paths.
> 6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_anno=
tation_with_callable_default() crash on Oracle.
> cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with mod=
els.BinaryField on PostgreSQL.
> 0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx bu=
ilds.
> 487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10=
, 3.1.14 and 2.2.25.
> 742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
> 99532fdadf [3.2.x] Corrected isort example in coding style docs.
> 31539a63f2 [3.2.x] Corrected "pip install" call in coding style docs.
> 76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
> 04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
> dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
> 9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The =
Docs.
> 327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Doc=
s.
> bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
> 3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
> 34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
> 21a56d596a [3.2.x] Post-release version bump.
> 1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
> e299cc2d2c [3.2.x] Added release date for 3.2.9.
> 947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB=
 backends.
> 128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example=
 to use correct template block.
> f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a fie=
ld with functional indexes on SQLite.
> fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length doc=
s.
> dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore =
and smtpd modules.
> 137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_=
login().
> 1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
> 82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in Dj=
ango 3.2.x.
> 1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and =
tox.ini.
> 53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() inste=
ad of get_event_loop() on Python 3.7+.
> f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() war=
nings on Python 3.10+.
> d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.se=
tDaemon().
> 8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's deprecated =
distutils.version package.
> faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is n=
ot installed.
> 329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
> 85e4af6a22 [3.2.x] Post-release version bump.
> 4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
> 65367b0500 [3.2.x] Added release date for 3.2.7.
> 51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained wit=
h HStoreField key transforms.
> 031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
> 7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
> 6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the adm=
in changelist when actions are both top and bottom.
> e235c7815a [3.2.x] Fixed broken links and redirects in docs.
> 51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-proc=
essing.txt.
> d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for ad=
min's readonly fields in custom admin site.
> 561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
> 454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjan=
go tutorial.
> b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
> a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and order_=
by arguments.
> 54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of check f=
unctions.
> 1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
> b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_in=
valid_option on Python 3.9.7+.
> 707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
> d5710f405a [3.2.x] Post-release version bump.
> 45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
> 4b80a40272 [3.2.x] Added release date for 3.2.7.
> 4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options ar=
e supported by every management command.
> fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed=
 offset timezones.
> 382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signatu=
re in docs.
> 11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
> 69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cac=
hed result by QuerySet.count().
> d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
> 358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
> d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
> eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django For=
um.
> 6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
> f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools d=
ocs.
> 2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
> 87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
> e1cad66dca [3.2.x] Post-release version bump.
> eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
> 70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
> d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description i=
n organization docs.
> 99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organi=
zation docs.
> ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization d=
ocs.
> 55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
> 5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
> aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as pre=
ferred over Form.get_initial_for_field().
> bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments sec=
tions in Model.save() docs.
> b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M re=
lation when through_fields is a list.
> de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in ad=
min docs where appropriate.
> f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
> 1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in =
DecimalField.validate().
> 05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
> 9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
> 0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
> b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
> 6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing=
-code.txt.
> f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailin=
g list references in docs.
> 527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
> 1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list=
 items.
> 9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
> 92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
> 3ab942f10a [3.2.x] Post-release version bump.
>
> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
> ---
>   .../{python3-django_3.2.5.bb =3D> python3-django_3.2.12.bb}       | 2=
 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb =3D=
> python3-django_3.2.12.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.b=
b b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> index 5890c8541..ee71f953b 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> @@ -1,7 +1,7 @@
>   require python-django.inc
>   inherit setuptools3
>  =20
> -SRC_URI[sha256sum] =3D "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a58=
41dda35019c01855cd"
> +SRC_URI[sha256sum] =3D "9772e6935703e59e993960832d66a614cf0233a1c5123b=
c6224ecc6ad69e41e2"
>  =20
>   RDEPENDS_${PN} +=3D "\
>       ${PYTHON_PN}-sqlparse \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96163):https://lists.openembedded.org/g/openembedde=
d-devel/message/96163
> Mute This Topic:https://lists.openembedded.org/mt/89981302/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------UzijYM0hWSg0bIn2OmsonAbQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34NJQRnB005250

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2022-03-23 13:33, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20220323173332.16576-2-trevor.g=
amblin@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">The delta between 3.2.5 and =
3.2.12 contain numerous CVE and other
bugfixes. git log --oneline 3.2.5..3.2.12 shows:</pre>
    </blockquote>
    <p>Narpat is working on a patch for: CVE-2023-31047</p>
    <p>He'll start with the default version of django : 2.2*<br>
      <br>
      Which if any of the other versions should be fixed?</p>
    <p>Can we remove version 3.2?<br>
      Can we update django 4.0 to 4.1 rather than backport the fix?<br>
    </p>
    <p>meta-oe.git on =EE=82=A0 kirkstone [$] <br>
      =E2=9D=AF fd django_<br>
      meta-python/recipes-devtools/python/python3-django_2.2.28.bb<br>
      meta-python/recipes-devtools/python/python3-django_3.2.12.bb<br>
      meta-python/recipes-devtools/python/python3-django_4.0.2.bb</p>
    <p>Can we add a check to ensure that we never have 3 versions of a
      single<br>
      recipe at branch time again? It's rare I think but worth
      discussing the idea.<br>
      <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20220323173332.16576-2-trevor.g=
amblin@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file u=
ploads.
1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debu=
g %} template tag.
a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-454=
52 to security archive.
0a9a46a1d7 [3.2.x] Post-release version bump.
6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal=
 in storage subsystem.
c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information di=
sclosure in dictsort template filter.
a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAt=
tributeSimilarityValidator.
b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releas=
es.
ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior c=
hange in Django 2.2.25, 3.1.14, and 3.2.10.
ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
1cea03ab00 [3.2.x] Post-release version bump.
0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass=
 of an upstream access control based on URL paths.
6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_annota=
tion_with_callable_default() crash on Oracle.
cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with model=
s.BinaryField on PostgreSQL.
0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx buil=
ds.
487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10, =
3.1.14 and 2.2.25.
742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
99532fdadf [3.2.x] Corrected isort example in coding style docs.
31539a63f2 [3.2.x] Corrected &quot;pip install&quot; call in coding style=
 docs.
76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The Do=
cs.
327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Docs.
bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
21a56d596a [3.2.x] Post-release version bump.
1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
e299cc2d2c [3.2.x] Added release date for 3.2.9.
947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB b=
ackends.
128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example t=
o use correct template block.
f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a field=
 with functional indexes on SQLite.
fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length docs.
dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore an=
d smtpd modules.
137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_lo=
gin().
1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in Djan=
go 3.2.x.
1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and to=
x.ini.
53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() instead=
 of get_event_loop() on Python 3.7+.
f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() warni=
ngs on Python 3.10+.
d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.setD=
aemon().
8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's deprecated di=
stutils.version package.
faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is not=
 installed.
329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
85e4af6a22 [3.2.x] Post-release version bump.
4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
65367b0500 [3.2.x] Added release date for 3.2.7.
51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained with =
HStoreField key transforms.
031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the admin=
 changelist when actions are both top and bottom.
e235c7815a [3.2.x] Fixed broken links and redirects in docs.
51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-proces=
sing.txt.
d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for admi=
n's readonly fields in custom admin site.
561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjango=
 tutorial.
b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and order_by=
 arguments.
54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of check fun=
ctions.
1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_inva=
lid_option on Python 3.9.7+.
707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
d5710f405a [3.2.x] Post-release version bump.
45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
4b80a40272 [3.2.x] Added release date for 3.2.7.
4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options are =
supported by every management command.
fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed o=
ffset timezones.
382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signature=
 in docs.
11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cache=
d result by QuerySet.count().
d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django Forum.
6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools doc=
s.
2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
e1cad66dca [3.2.x] Post-release version bump.
eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description in =
organization docs.
99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organiza=
tion docs.
ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization doc=
s.
55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as prefe=
rred over Form.get_initial_for_field().
bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments secti=
ons in Model.save() docs.
b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M rela=
tion when through_fields is a list.
de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in admi=
n docs where appropriate.
f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in De=
cimalField.validate().
05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing-c=
ode.txt.
f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing =
list references in docs.
527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list i=
tems.
9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
3ab942f10a [3.2.x] Post-release version bump.

Signed-off-by: Trevor Gamblin <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;=
</a>
---
 .../{python3-django_3.2.5.bb =3D&gt; python3-django_3.2.12.bb}       | 2=
 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb =3D&=
gt; python3-django_3.2.12.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb =
b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
index 5890c8541..ee71f953b 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D &quot;3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3=
a5841dda35019c01855cd&quot;
+SRC_URI[sha256sum] =3D &quot;9772e6935703e59e993960832d66a614cf0233a1c51=
23bc6224ecc6ad69e41e2&quot;
=20
 RDEPENDS_${PN} +=3D &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#96163): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/96163">https://=
lists.openembedded.org/g/openembedded-devel/message/96163</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/89981302/3616765">https://lists.openembedded.org/mt/=
89981302/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------UzijYM0hWSg0bIn2OmsonAbQ--

