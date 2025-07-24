Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6B5C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 09:24:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8413.1753349035752065648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 02:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9300cd684d=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O8U24f764677
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 02:23:55 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483hcdr1k3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 02:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEhf1C8ykROMnP6ji8Qt16UhW/ERtsZ1c0CH7GIc6tAGlvVtDWC97eC/+HbFa08Q4mQip2iB9ag1FngrmmnJpw4GkvbOhlId5vYN1elpB6meVOLVybstU0KY9QmN4Ot6SUIgwnAa6NX2BcXC1Wxw/bLzLO6P8woNIfJ2AymO+8S28lUKEfwyIZOXoT36NhK+0GIhvsTs18A7e47YTVgcD63O/M8eJujQafPH9PXA6Uam/0to3LxSaCDmmF+8y194/PPa3tvUxlD2kDn54hMEZpW4czcMwVIA5VoJPD6V9tuW/PA4p/S2XVlNZtpm325+BL3FOPgel2g7XU3iGxKQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXFs63PxaJPSQmmN94yI6OmeCppq5s7Rmpm0scfyIJQ=;
 b=HOgp1hPJCrbWgCJB4RlHRwAkLT339jrUyw7ghB+PJsG3SC5s6bqIkb68DCqpYUBhG+UlJ136mHLpDlDcOawVU318IRc4ZQgTLuAtEcLt3NWKxh5tiyVjgKHNcPKiXsT2BpnkJcSEv+b2mrC84Kr6Te7hqjhtjRDDpvCFi8MHWJTgJYICCC3i79ENMJ2URwr0PcOzEHRuDEE7XEaimEtWTaqtbxvx1m/KjCJELxszcGjrCdjm74zNanrNJtw7ktGzr7K9p9Fs1Mgk1BoqQEZwUAflsavwPgaHn9KUAuEr0InqC6i3CQdM1dn0F9eIRj97+78rovqvzAdIYo3adL2edA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:23:53 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%3]) with mapi id 15.20.8901.021; Thu, 24 Jul 2025
 09:23:53 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] wxwidgets: fix CVE-2024-58249
Date: Thu, 24 Jul 2025 17:23:42 +0800
Message-Id: <20250724092342.2896751-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0076.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::9)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: d119e214-ed61-44b2-006b-08ddca93ce6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Ml5GGkyl/P54W5osGE+ljpf+YHVXt/TtenJI+VL2sRO1TbG3DYeb50lXIZi?=
 =?us-ascii?Q?Of8Yfd6wSHzW9ZfZaZNa61VcbchGnwhRcZ28ha4E0vkoNra0DzRh6ts+MoA+?=
 =?us-ascii?Q?9QYTv06CGSV93g8B3WA/dNsw9CuRsuMmo91xg48YbILgYxWwb3Ab7shpKBsB?=
 =?us-ascii?Q?bCbrZWk0lYgTMNHlGz4lA8bJZ7IPQ5mTZGgrIlj1tJJnaMBS2AUW8PVbsYA1?=
 =?us-ascii?Q?F+2Rphmnu0sfZgeBtGjp70Lle/iZDrOMzVIzpdqOpFHlq2h7zcannLB1OA4w?=
 =?us-ascii?Q?LiRZJgfyo7l/QKGL99ozAQjcEQM7hQPr4sxdPqt5qTZdUDLPlurqCqO57y/d?=
 =?us-ascii?Q?gSOx9ZVrqfyGbGhNoxnNhqaIwbiwSEjv9XHJABVsdvHr3W/eE840fzWGvjAb?=
 =?us-ascii?Q?NHgHkDJl7q7J5nqNd2p3MKV90Ejb8YlKLYwL4IuzS54FiG6ujSxYGXkpmp8y?=
 =?us-ascii?Q?k5/4aBpkOgWHWGxo0tvHFwTOBbgT0lTPDnzRrmECGdV9a+Tcracugv6gl5Er?=
 =?us-ascii?Q?bwTm32dGupdbYgAsWm0SBEFdN4Du+PsTr4E5fnc7CDCgFjWgtVr0IduR1jgk?=
 =?us-ascii?Q?coX3NlSJ3F98+Y1zbZN0JwLxElYumKi17OTvw08fizKaGg00/S8rEYP97Iy2?=
 =?us-ascii?Q?o1PIam02HoISvtj67yfGxQZF08J1Pg2fHgkMemDSxpxbMEFhbCI06emQ7Ahk?=
 =?us-ascii?Q?l4uwcnEAueyDkluqYHnyMtN2ARPImIz4xDnCXq72Pk9V1nKGFAK3R9MZjlf9?=
 =?us-ascii?Q?gx4pftvcFJozVcUXYAx50+hTTXYM+XR40kkHHYjtZnueINj/aPVFyFHFg92f?=
 =?us-ascii?Q?3PFDa/NXHS9wmhrAWbGy6MRhGdO1APDiTFX/vdjur++JvWq17weqKUX7Mggq?=
 =?us-ascii?Q?stlzOpnin5icWeDqU7ncuj73JzsaDXkIT3IfKVzjT/7Uby3Z/O2pwk5WM5fi?=
 =?us-ascii?Q?JpUUwZwj2BsGKZv6qj7KiBKyyVFgF8eJBbmLSExh6rTlLFkVJ2ukpxiLVJVT?=
 =?us-ascii?Q?u+1uDb+ssdyvd/8/TgtFtqOxqEtrCNbf5SJef6Si3HKSckAX6vci3P9NvTMR?=
 =?us-ascii?Q?jfWT6vKKrOpzd1BneRg1SqMF9ST1bsIYyR9KXaEH3uVmYah8Y7nRu3WWPpqn?=
 =?us-ascii?Q?EFKrPbZ9mJ9I4AsMG48UuOiCfX7m9K1lMzrogK2GXSSOIhxrlXvG7CArcitu?=
 =?us-ascii?Q?h2yOsHEPU/1d5eGGyh30NSeFhL5eRe9KDYdT3rtQN+eh16dx62WoU99ouzyM?=
 =?us-ascii?Q?aN0hlV1XBD28oxYK7fa0STe4HqR57EIJZQJOG38FhyRCPk3GSdys0qFMpKqw?=
 =?us-ascii?Q?Vs5/pOZAu86tOHxxZFcS3VgQ1ekcy4BafCSpIGHmf1inuNju+hwW7UxyhJ6E?=
 =?us-ascii?Q?J1KtLHEkABWYnvDLrAPhxw01jav7KXGB40SXz7FW/n2sVn+mLt741vKQ7SDC?=
 =?us-ascii?Q?14uNI0PZEoSxN5iE60z6bBaqzoC4SPr2jnpgqrrcPDkudkkNagLQSHBWpBQA?=
 =?us-ascii?Q?4WPqJ9PyO+j4By4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3OVMNmsJpFP1Kb15hJmqtnY06L3uYo+UsEa1lHunz+b6scS2jsnrOVHo5fhr?=
 =?us-ascii?Q?W5yuhoPQC8LcnrviMoNkXFSfrf4jv7XrVzbtjSfHKKQ1Vh0JqtDRtxa0Zmo/?=
 =?us-ascii?Q?Z+3Js7YfCl7G5102oi3IbS937zC74r8h7GxCxmgFc6HMg+9hjm7Qk8e6VH5l?=
 =?us-ascii?Q?o+X0wt0z+43rJJMyTK+23SIUamyj8z+qqSpjK4TXaO3PvGihw6+wAM3VH9OY?=
 =?us-ascii?Q?Zt/2woHGdnaXeGFK/AKIJxa8+IAeJ42WecbWOBtfBOqbRPuQGnI2EOSMmBZz?=
 =?us-ascii?Q?U60BnRiJ3icoVy9ui3c2AhPkF1xVLl9/Z75X0DYugBhUaxTwiaHrdIALzQf3?=
 =?us-ascii?Q?UNplUnhnlLb0fKV6Cb9LTOsuW2nxB+vhrp+SwpUCw+EW4IwMXHQ9HX3FUryK?=
 =?us-ascii?Q?9y5dOng/edZaDkeiuhqAnRLegsrylNKQ6sylRRaO/z7JpZe72U9D+xBSsDsw?=
 =?us-ascii?Q?tukoZKK7ujkKUw9nXp7Z8Z/yANcFLxAYAXlHa3UozoFxdBXXm2Bs3BDyO/NP?=
 =?us-ascii?Q?BD/D9CV8YXKQGlFP+Ttgu3W70g8eedYDrdbExA+Sy6VioOHNQgliFctoAiWF?=
 =?us-ascii?Q?jpXY8mlvquasrpkTE4fxzgnuT2KGMLR5VfFYsqU066m6ry6rmcIhIseuis5C?=
 =?us-ascii?Q?+8xYdj5avO5UKPmmbBDCY4T2w55D5rruL5M3h56q+af1n8BiMmC8b1q60CaJ?=
 =?us-ascii?Q?TgLhCvuYFqqVIEyrjvNy48D/vm4bap6Zlt/i8u7+Vl78o4YEtZaPRKTRHqBQ?=
 =?us-ascii?Q?rG/nJbEhk7smqjUZycvm8Wx3cjoa3Yyan9mu968ns88zHuEMncMmKY4shw/Y?=
 =?us-ascii?Q?eAjvsCuzM6xX/OB4bh5eDCti70NVzpx1CFiFX2yyvnMYC5trc467g9cWiiyt?=
 =?us-ascii?Q?G4pQN2nn1kMvVYj+R+apfo8jKgWl6czHBei6oHhXw1EnUy8Yv6r4sXLbLj2N?=
 =?us-ascii?Q?nHXQCq2FU8hnhIEgakEC9j5eEND+Q99kNxFUifPbjOhCUSLKwVya8EKh95Yt?=
 =?us-ascii?Q?sYEVrG5wWdmtD7StjnJ4HfvgfFGh/1h8s1McEwSQzaboAvx3594TfYNawRkd?=
 =?us-ascii?Q?rPY+WzAJ3d59qDNri8tMfrhZsjtUEocXeZVqOxPYbpfYhxH9qdZbEQY9E0pp?=
 =?us-ascii?Q?X7r3Kf/qnA/YN0NXwKYHxHXljQ4PIRvCqgXZNinsVIGAZxHTB6lAb75bD/LH?=
 =?us-ascii?Q?pL1V7qUVZ09BRYpF+sZSZpB1QPFQ508lyeYTZ/Ya4qvJ/lNCDYmSG51/xiMZ?=
 =?us-ascii?Q?W9uv4j/OVOQX71Hiytjz/oUM/ZdzlL48T5FYLTYzYKGKcOAy1VyA8uYoSUd8?=
 =?us-ascii?Q?QtnuxTz1W+//f+eBBjhnzrKFFFVGkkG6fI6Illcg4cAh/9HRrhjZPOjACOIJ?=
 =?us-ascii?Q?8ZZ40kzVBtDRH1D9WoVVJaKLOy8iwC5BtX9luinKGE2DsopvlKuhzETr1twe?=
 =?us-ascii?Q?oX6BtPnIBFwZa7FMC8WrLZPRzaSpN251M8k3vWaokKhhQxDMiuV+utke23p1?=
 =?us-ascii?Q?RTzS7Lll+3y86HAsJyXw+S5V6Hgbisw7nhJbIx2bqWlYjq6PxC9czZ0GsN8Q?=
 =?us-ascii?Q?tI3AqxfnzDFLXXaYexmRCOx2TCdiq50uDRzcng9xL2FplyYQVUUbo3JL00Mw?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d119e214-ed61-44b2-006b-08ddca93ce6b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:23:53.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvKO41026fcbHft0jNcKRz4HUKtwfRqM0kCbqJp0hWFBZBB6HVhybQSlLR3sTftdC5sFAhZdT/Z+4K/Aw5a7/3M9Whw+LcOt/qs+3jV5J4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
X-Proofpoint-GUID: UosSZQv11VJpCFhhlFTr1bYpPeytNnxT
X-Proofpoint-ORIG-GUID: UosSZQv11VJpCFhhlFTr1bYpPeytNnxT
X-Authority-Analysis: v=2.4 cv=eujfzppX c=1 sm=1 tr=0 ts=6881fbab cx=c_pps
 a=BZcKXadMzMgoE806unv5Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=IFCbucT4AAAA:8
 a=3epcOkmVbHiDymNTJPUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cnuYUo6HLIWjuL6tXTi5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA2OSBTYWx0ZWRfX4MsI3B2c6VEl
 hhToO56Ynn2w2Hzq98FM34yma2vMBtdt/4RQEYCNqHCHlvmeMiycDgmPHFuTlBBCoSp+UfLl2MA
 z+njEC0IHMAk8tvriaEb/HPcF2p3M9n1otvDeSagT4b1OG8JVTm9taunw4weirNbYDfEme0Zp7W
 9zBGHlxNzyBvLJdtLipWzB2qisoIEgsUIpvqwuVFXMNrjinRWW5nWVPyEoxf+krp9XAJ7SwwjNK
 nEdyIFsOeAN9nViKNWB03Fy3h3B5iE5ZiYL+Cayn3CSTWeMjlo8/HS70AwTJm7ZTH1SnQBvNrsU
 OUGGEYTjTi5LLRSEQ1L5nuw7sIrwu1Yjcbu6F+auZIp3bAVY7KowjUWYQOCcBFyfIerun/J+V7r
 /QQLyqcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 09:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118722

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-58249:
In wxWidgets before 3.2.7, a crash can be triggered in wxWidgets apps when connections are refused in wxWebRequestCURL.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-58249]

Upstream patches:
[https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch  | 178 ++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.6.bb              |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
new file mode 100644
index 0000000000..8ba9cc1b04
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
@@ -0,0 +1,178 @@
+From e440b3a6097546a8aca66bd4c7a21be25e89d340 Mon Sep 17 00:00:00 2001
+From: Vadim Zeitlin <vadim@wxwidgets.org>
+Date: Sun, 27 Oct 2024 00:56:21 +0200
+Subject: [PATCH] Fix crash when connection is refused in wxWebRequestCURL
+
+Avoid deleting wxEventLoopSourceHandler which may be still in use, as is
+the case when we get write IO notification just before an error one: if
+we delete the handler while handling the former, we crash when getting
+the latter one.
+
+Use a hack to avoid deleting the handlers for which write notification
+is being processed and delete them later, when we get the error one.
+
+See #24885.
+
+(cherry picked from commit 4e0fca8ab9756989598d07b41e672af86eac7092)
+
+CVE: CVE-2024-58249
+Upstream-Status: Backport [https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/webrequest_curl.cpp | 80 +++++++++++++++++++++++++---------
+ 1 file changed, 60 insertions(+), 20 deletions(-)
+
+diff --git a/src/common/webrequest_curl.cpp b/src/common/webrequest_curl.cpp
+index f50acf4f8d..64650ab6b4 100644
+--- a/src/common/webrequest_curl.cpp
++++ b/src/common/webrequest_curl.cpp
+@@ -704,10 +704,13 @@ SocketPollerImpl* SocketPollerImpl::Create(wxEvtHandler* hndlr)
+ 
+ // SocketPollerSourceHandler - a source handler used by the SocketPoller class.
+ 
++class SourceSocketPoller;
++
+ class SocketPollerSourceHandler: public wxEventLoopSourceHandler
+ {
+ public:
+-    SocketPollerSourceHandler(curl_socket_t, wxEvtHandler*);
++    SocketPollerSourceHandler(curl_socket_t sock, SourceSocketPoller* poller)
++        : m_socket(sock), m_poller(poller) {}
+ 
+     void OnReadWaiting() wxOVERRIDE;
+     void OnWriteWaiting() wxOVERRIDE;
+@@ -716,16 +719,9 @@ public:
+ private:
+     void SendEvent(int);
+     curl_socket_t m_socket;
+-    wxEvtHandler* m_handler;
++    SourceSocketPoller* const m_poller;
+ };
+ 
+-SocketPollerSourceHandler::SocketPollerSourceHandler(curl_socket_t sock,
+-                                                     wxEvtHandler* hndlr)
+-{
+-    m_socket = sock;
+-    m_handler = hndlr;
+-}
+-
+ void SocketPollerSourceHandler::OnReadWaiting()
+ {
+     SendEvent(SocketPoller::READY_FOR_READ);
+@@ -741,14 +737,6 @@ void SocketPollerSourceHandler::OnExceptionWaiting()
+     SendEvent(SocketPoller::HAS_ERROR);
+ }
+ 
+-void SocketPollerSourceHandler::SendEvent(int result)
+-{
+-    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
+-    event.SetPayload<curl_socket_t>(m_socket);
+-    event.SetInt(result);
+-    m_handler->ProcessEvent(event);
+-}
+-
+ // SourceSocketPoller - a SocketPollerImpl based on event loop sources.
+ 
+ class SourceSocketPoller: public SocketPollerImpl
+@@ -760,6 +748,8 @@ public:
+     void StopPolling(curl_socket_t) wxOVERRIDE;
+     void ResumePolling(curl_socket_t) wxOVERRIDE;
+ 
++    void SendEvent(curl_socket_t sock, int result);
++
+ private:
+     WX_DECLARE_HASH_MAP(curl_socket_t, wxEventLoopSource*, wxIntegerHash,\
+                         wxIntegerEqual, SocketDataMap);
+@@ -768,11 +758,25 @@ private:
+ 
+     SocketDataMap m_socketData;
+     wxEvtHandler* m_handler;
++
++    // The socket for which we're currently processing a write IO notification.
++    curl_socket_t m_activeWriteSocket;
++
++    // The sockets that we couldn't clean up yet but should do if/when we get
++    // an error notification for them.
++    wxVector<curl_socket_t> m_socketsToCleanUp;
+ };
+ 
++// This function must be implemented after full SourceSocketPoller declaration.
++void SocketPollerSourceHandler::SendEvent(int result)
++{
++    m_poller->SendEvent(m_socket, result);
++}
++
+ SourceSocketPoller::SourceSocketPoller(wxEvtHandler* hndlr)
+ {
+     m_handler = hndlr;
++    m_activeWriteSocket = 0;
+ }
+ 
+ SourceSocketPoller::~SourceSocketPoller()
+@@ -822,9 +826,7 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+     }
+     else
+     {
+-        // Otherwise create a new source handler.
+-        srcHandler =
+-            new SocketPollerSourceHandler(sock, m_handler);
++        srcHandler = new SocketPollerSourceHandler(sock, this);
+     }
+ 
+     // Get a new source object for these polling checks.
+@@ -858,6 +860,15 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+ 
+ void SourceSocketPoller::StopPolling(curl_socket_t sock)
+ {
++    if ( sock == m_activeWriteSocket )
++    {
++        // We can't clean up the socket while we're inside OnWriteWaiting() for
++        // it because it could be followed by OnExceptionWaiting() and we'd
++        // crash if we deleted it already.
++        m_socketsToCleanUp.push_back(sock);
++        return;
++    }
++
+     SocketDataMap::iterator it = m_socketData.find(sock);
+ 
+     if ( it != m_socketData.end() )
+@@ -871,6 +882,35 @@ void SourceSocketPoller::ResumePolling(curl_socket_t WXUNUSED(sock))
+ {
+ }
+ 
++void SourceSocketPoller::SendEvent(curl_socket_t sock, int result)
++{
++    if ( result == SocketPoller::READY_FOR_WRITE )
++    {
++        // Prevent the handler from this socket from being deleted in case we
++        // get a HAS_ERROR event for it immediately after this one.
++        m_activeWriteSocket = sock;
++    }
++
++    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
++    event.SetPayload<curl_socket_t>(sock);
++    event.SetInt(result);
++    m_handler->ProcessEvent(event);
++
++    m_activeWriteSocket = 0;
++
++    if ( result == SocketPoller::HAS_ERROR )
++    {
++        // Check if we have any sockets to clean up and do it now, it should be
++        // safe.
++        for ( size_t n = 0; n < m_socketsToCleanUp.size(); ++n )
++        {
++            StopPolling(m_socketsToCleanUp[n]);
++        }
++
++        m_socketsToCleanUp.clear();
++    }
++}
++
+ void SourceSocketPoller::CleanUpSocketSource(wxEventLoopSource* source)
+ {
+     wxEventLoopSourceHandler* srcHandler = source->GetHandler();
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 71e2a60e0c..1cf44bbfa3 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -26,6 +26,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://0005-wx-config-fix-libdir-for-multilib.patch \
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
+           file://CVE-2024-58249.patch \
            "
 SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S = "${WORKDIR}/git"
-- 
2.34.1


