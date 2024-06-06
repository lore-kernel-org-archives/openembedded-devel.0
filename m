Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6B3C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 10:13:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10925.1717668825231980954
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 03:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6887352d54=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4566FCwA007486
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Jun 2024 03:13:44 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f4v1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 03:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP6vl7IjLAS9LawA/r4l5o9DZRclCOk8ql45W27Y22fH1tDnplpXxH5qWSEEgSLElMRIjrDM5yxUyuK5fWCh4tMYy8t4MwP+kS+1u6Ea8ZSpbYwKe5yYP7QIphWS40KSOvr3tIXGzLHc/N3wTGKcjxz8Bmjp+qlR9FK4Drj7YE6ItGbBBzkdOwb3O/V8KmZQ7yE9mcxcw+6lJVtflqaWFf16QS9qNKS9IQUm0b7XfiNw184wvidzd2oLFvPnihxe4UWzJR8J9bqWcDZ4RefBOYKkBcrqkfHqW5e8ygOcoKPFKjq7vvmQYyvfQkQO/uOvF9l+VmAlTedLXXreKquplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogP1yXKHdiRBUxcClyp4xHlq641Mx4hPGNSmMB2UMBg=;
 b=K20bRJJaRtzAbopuQNr2nDJ+oVLFzNE7SvfTWEfReTp3TbnBF+R3SUSy3BEd5JQ/gZV64O2hbeQikOUucyatrB851zG2Yvr1HI+zg+2pZqrenHTYourGGgc82qNKLrC/Np3AHdNXqEgypAs8eQMGFzu2T2SoMDnqcvkLWhgqk3hTHh4Piv0PGOA+H8p8DHV7NiUEiQ5DD7Sl2Hi0e24rWfe1G1HZL06kJ385YT3qj3n30FmgAJOmHGNyc+RuTOqu/a4lVetIYbZwyleycrt0hGsz95Y930/NuphW96SawpGXIflvftXCeu+5QqRtHPG/xoQBjxN23m36BuUGgttETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 10:13:42 +0000
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::6638:98c1:fb6:c3d9]) by SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::6638:98c1:fb6:c3d9%6]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 10:13:42 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] meta-oe/conf/layer.conf: remove libbpf from NON_MULTILIB_RECIPES for x86 and x86-64
Date: Thu,  6 Jun 2024 18:13:32 +0800
Message-Id: <20240606101332.1564737-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To SJ0PR11MB7155.namprd11.prod.outlook.com
 (2603:10b6:a03:48d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7155:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: df077d4f-a13f-447b-a550-08dc861157d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ejyAIfnbrbeJtFgmaykBQ6q+42i6MxNPfeQuG/eFv4vLRuVqDtVBEKRTIPQ+?=
 =?us-ascii?Q?VVEbaJdIUBQsZNmMtGlbRu58YDc7mEce/p5Mhdw7zv6kTrP0F7l7hQDdWT1n?=
 =?us-ascii?Q?fKF+yA428YirgH/XsouuUS30elW80ngbjSfSEwDpsGLS69c7yvzqEIrqX9k7?=
 =?us-ascii?Q?Pq4k85Lsh63cQIDtZ3KyKqk6cBfQe34e8bRnIJgmPJoisPTMzjIw3qKOuftG?=
 =?us-ascii?Q?IA5RdRqfH8VFZn4RGchCesrsuM3MVFkD7nwj2RiSXmDWwEcY3yz9+WlBjygX?=
 =?us-ascii?Q?64n9KbA/FuKSylZGSG1hlAp8mOQmVdSUszZF+rJ28lHJYUAEIdl1NfpleEef?=
 =?us-ascii?Q?K4UHDz8TZzEifkjY7N/oTkRjYgHSA79oWOYRwDAEosynR9fBg8pPvOdF6oW3?=
 =?us-ascii?Q?0qE3Oi9Nuth0qrUNcahjrt49m4epiWl3/KoUpT/VleDgzACkO5rcYKFUtSC0?=
 =?us-ascii?Q?l4t3MltZpA/01ZusAHy1L4vSlXk3UC1plUZj3OycmXAZNjWuDo5QZaiFMoFl?=
 =?us-ascii?Q?K96M/YoAclIbPsBl0sHpnF1/R2mEZIYOY+9ICv/5mury1HdSsoZ4cfbp0R+I?=
 =?us-ascii?Q?j6o100giEOqOvlAC0ZXb9ic1xrSmICwfpev6/NLyphQonHyGHyuR7XoC8Oum?=
 =?us-ascii?Q?aPjiZncnSXTvVtOCnMl/fdY5kSwCn5dTCTHF8SErwUrBj+Of3xAJrYeDijV6?=
 =?us-ascii?Q?99q7kR0dlylb5sdB6YUnvkTyqWCrBHgsO/5h+z7wmDeixHsJOCbQx5r5BqAv?=
 =?us-ascii?Q?LnNLtLH5HcJPQLTWvOiTxMd/qsvMVG4Vm3uNM6PKHBLrYPP5tyOfH1j18u5q?=
 =?us-ascii?Q?FAoRyMq9s3sTmVVBZ38tpG6EKViv4+CvqegPJ8x8VwiAWCa2IsQw0xdvW5Dj?=
 =?us-ascii?Q?ilfSRvkmbuiHk5Ni/Iioae6Pg65UIZQn0/Gpe3ITRkFerdUjEapoMlfymy2M?=
 =?us-ascii?Q?sZKC54c8Hk89acRRdF9Q2WlgWTkGmPk34+tvVMVEVta43Z8+XMJ65qxTqrKL?=
 =?us-ascii?Q?SVo5LufNL7kQotCkpff5ix95miqvdkHA88kPHwonW+ZNctWevkeyinzRD2dM?=
 =?us-ascii?Q?scgI59qn8DM+E2kqkOrLn3BNqvI4t7dBG3WznGkHRcLkUwLwOt8JvXwn9WAk?=
 =?us-ascii?Q?Wcx0HYj1V3O2gAq3oq4+y6dz2HFxamDGyq5HlEF/q8tYeKNbOswWGc+UMly5?=
 =?us-ascii?Q?3osiukWxhQ68GmvDudaGQUtwXk+yFPLUlJycIiRtMKcjA7939SPi/iaWlEWn?=
 =?us-ascii?Q?4D11jwUzwUoI+z5ZGkLsWIPRc/o5093fN8uq8pTZ9XtuhjzV08kQZhYXvF1L?=
 =?us-ascii?Q?4CL5tXI+ATaTiWtg4XAQEQk0sUXq+Q4Q6hAt9o9RtVB/bG5wAViufu6cKzXw?=
 =?us-ascii?Q?NnP93YU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB7155.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DKrIwMZz//7y5GJH3jZ5IkdGG7nmq5YB7z2h2ntRoW6ccOxhp1KygvE0nwMB?=
 =?us-ascii?Q?tov9r5a8jWlHiT6ZwImL6/y5fIUAO84UF5hQEo2O3jbTKuXDdjF0mGWPHV7u?=
 =?us-ascii?Q?modadCbVJW8s2ptqegtaFNT56HTVO+qeEKJnoLmfWvlUQX0YCakeL4fVqbyn?=
 =?us-ascii?Q?50PGgWo6DzA0VoqAwrb5HRLkBfjgWJsmCu1y1P7sYx5R/7Q/PVXPw6wF2IWY?=
 =?us-ascii?Q?THkNNdX8a80hj4Qc0BVPp/moROfXZ4TqzlDuO4Ar+hpduZelcV3q90p66ngu?=
 =?us-ascii?Q?5x/1OQVYJstD+0OyZrwRJzpDbx1XfWVaxrcp6offShk4A7sqMO+h0oVnxJSL?=
 =?us-ascii?Q?Fe2lzimacQF1rE1Q7p0reoKy5b0c4x6MLR4s4k5gN5CvEYTWFQZDndI4GdR6?=
 =?us-ascii?Q?mtnOFH46pe0rP5YGQ3Q3WTwTJU+rZOZnJ2KeRk1CowpHhEoNKroUBI4jjwMW?=
 =?us-ascii?Q?56ti5u9CIMqPanF8Tdu0OLOPjgzBER7bVgTtj9VfqnewiZlFwtcre1FA/a88?=
 =?us-ascii?Q?ESY7p4zuMQrbBC1TN5f4pSEsAIjEHg1BXesDOpluxGvY4fM+kUBJHmc+QuSe?=
 =?us-ascii?Q?xpdhhw1Xe9x1TrOq6vY1wLvXUdnrwnSdmx56FL39L2VdcYfOtmzLh3ntZmjq?=
 =?us-ascii?Q?XtLhcqbqCzqvu4+9NKLI2kqYY7LQH0ZwukTn25qEVTDAwieUle5wj5/zprlB?=
 =?us-ascii?Q?s0a/IcAA1grHlyZcgaOXfT7tzLVenl3iBlHakDQc6Df2vlNG5zLHjNXwR0D3?=
 =?us-ascii?Q?xN1ouIhROuBVxrw0eZ3PA2t1WSUZJqULZm88qlcJnC1MEiOjKpx7ZWxagjJn?=
 =?us-ascii?Q?MytWNJbONyViBsZRc6ecAh63LTGAz4vi7xA/i2QTTeHggguOuFOtKtg7Skn8?=
 =?us-ascii?Q?SNwFjL+FPqqwDQjVHqFcQ1c2yJ2LVoUfdHCmC3Sre1EsqHDug9ufkQEN8P0a?=
 =?us-ascii?Q?6mZXAHb/JB9DbX7lITd9ewoW89ZQ0C14cZVx3vks3d/Hdq62n00SOBFEXddi?=
 =?us-ascii?Q?s1okXrAytxZDHm9sm3G3AGx9TkjWq2dBvcKT109VXNnO0RlsNX9uyh5k+qjL?=
 =?us-ascii?Q?fEvd5F0zb2CrOMUhvkf79GAjqyLYshCPz+m+qhHMZ3JteJ0N6asGLGlAgtrl?=
 =?us-ascii?Q?2DwoeolEKidv0IUhU3kjkdQYkiDw1KeB8wiVTXqI8ffm+ODwQJSP5duxaZdO?=
 =?us-ascii?Q?y5iAd8BmfEWbhWBJ5kI7Txa/9dvMH15YgVb8C2WUH8g7e4tiIHia2cMMaZgp?=
 =?us-ascii?Q?2P+MQiFnf3FfhYTqi+1Ew9Esy3wWwOeKg9imLjqVWBXzm/wl9284Mvb5m+YT?=
 =?us-ascii?Q?ArHNHMimk3n4mZg1EkSKlEDdrJ9yFzxn8KG9/loZY+pk87M3AmG6wmsnqwtM?=
 =?us-ascii?Q?sqXOxXoFcFxxSWCVoqPPi7aVkAObCI+zvvPb0rfzJcC3YqM//F+yvsMY38tU?=
 =?us-ascii?Q?1FepGegRM0wPQo2Ahr9kQKmq73XJfgHfWcKtuwrul99raWaZvlIwlqNwO3jb?=
 =?us-ascii?Q?MkgvJY2xJ6+rcP9caZRGhW8+smMJrKq6ZCgXruHgeyxovmyydBy7bPw9a++R?=
 =?us-ascii?Q?LaP7mBu6HiHmebTgBbsoOYyRJPrZZa2xe2i8vt5AkK6ALSYrhlEuZPRw0zHW?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df077d4f-a13f-447b-a550-08dc861157d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7155.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:13:42.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wwctdOGq7diAoWL+q4rZm0T0M0w9C0VXYxNV2Fnk6g9OJpwFS0sHHzjFF2ElGvVfAdlCICDdellTDPX/qzaCDmQvtM6+Lcfu+1OpkLkrNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-Proofpoint-GUID: _UDlRkWLZ2dPXzlpoKiAI0koQElPp_LQ
X-Proofpoint-ORIG-GUID: _UDlRkWLZ2dPXzlpoKiAI0koQElPp_LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=861 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 10:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110745

libbpf supports x86_64 and i.86, remove libbpf from NON_MULTILIB_RECIPES
for x86 and x86-64

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta-oe/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 77855dc65..a254990ec 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -115,3 +115,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
 NON_MULTILIB_RECIPES:append = " crash pahole libbpf"
+
+NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
+NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-- 
2.25.1


