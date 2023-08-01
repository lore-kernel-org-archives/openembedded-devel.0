Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE7DC001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 22:52:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2419.1690930352426334241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 15:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UMoEVzAJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7577a138c0=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371Me2sE013970
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Aug 2023 15:52:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=DEbcdFeA5cyDfWO7S2
	f16SVX3dL3DwQM7lVIrmSAY0M=; b=UMoEVzAJqRnZBXH9rYClYHGdhiFO96TCLb
	jYzPMYUB0jgHQux7lxlWcRrsTMCcPYTgTFHx+Zcyvcaxv4wLspPiIsYuxAx4zWKK
	Lwe1i5II9mbNtGGJ/NXmGbfWogh+t8c7IcErd1zi6eL0visL2RPYKjoLvd5dAs2P
	2Wctx/U8tw7MvI48nuDSoHfw99J9x6EcN+H8N+6sHL4bHg+L1AKGTCSHK0JUCvII
	t7YGfSGa3fC+nFMQfUNVjv7ynSURyqYavmrKw8ZtedMdPDfSIdYbVvh+uqsM/5sH
	T+rTqehlxonip33NwUfB7jjzcs4Z8pjUxdCMhfdTbaOnHWMiEQjA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqsmp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 15:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAhIULGO5ds7/OYNe4lj2JiC3fHTnfWCgVMsy2QfekNMMrCI86KiFfR9w5gjGkgvGllbdDbc+OGtgn88TVnMqPVyL3VtA7nZuSJtfkT+cUWFL6sPl2Z8ZBFj4wbTIHWRJRcS+q0wmERprZvzZpEp/qN+D9/9biQELImBlwp8tML9kZFG3QzNieT33pYmvJJvptExP2KdodozU9vl9yhCJPAw7uBaBlz0cwh+VN/aZ1NOrLwwXQuiOhuVtC/Da03mlzAPtcJnU9zL9XJxm1ya521lTSkaR0iF9xomh30rVaItv7TkhhQX0M9/J7N0QJg4QSUvc23N1MpykqYeDb0gJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEbcdFeA5cyDfWO7S2f16SVX3dL3DwQM7lVIrmSAY0M=;
 b=SJ3/2s4DpiheiNX1sHIO+0BC78CA+AfAadxVrBxgCdeKh0M797y6bu+g7QJrAY95bFaXWO+ncPPrEm01PhNJMWouKJnojpxpwvW9QFfAbgrkG0mrYtnSVf7ckYJ+g6GYFRug+JZVhBVRAO3r6Ss0oXBGhHhsrotwLiXpBoDRjGUYaHo1mcwdDmxIbXc9MxmMmYEIIeZLxZe+Tz+nXrGbsaMGmwjjQ9XAWDWIi+wGA17R3noZunBj2+2TREeD0y9mJjI046KMaD2WqTcGCx9LsjEePjSsPM6DbjlczlezWRgtMkIzq8DX5DxpKm6drAVootU1XRzum09jfSroKccdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 by CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 22:52:28 +0000
Received: from SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91]) by SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91%7]) with mapi id 15.20.6631.045; Tue, 1 Aug 2023
 22:52:28 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Fix function inline errors in debug optimization
Date: Tue,  1 Aug 2023 15:51:39 -0700
Message-Id: <20230801225139.3011215-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To SN7PR11MB6701.namprd11.prod.outlook.com
 (2603:10b6:806:26b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6701:EE_|CY5PR11MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 547bb9fd-bf57-4a82-dec4-08db92e1fb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c/DTwGF2rXIMOBPEzfBzz//BOaR9uYu6GLLkiUQMSyttfP3dFiCsZVw/xSUdPcTTvNgzjViUqd0wJVqBknSJTkwdIotws9Ou+WPqrWh2D4u7YwYp0vAMHtfa+PsD11TqRGkMFdDn5MORfcqjCPgpj4+eoBPpac250TXtU7Gp66cXkO89mm+AiO1iR7lV+nGOUMkfocLZmaQj/AiaxFK3vxsRlBPHmJOGey6/XQtD1EmvPiP7sR7ULzhPkbzeYKkm4XNF8XTcJ4zzHoJ/jEWydqVY0arNyo1Samgv8eFWIUVvyNDMFuFCAZEd5ZgAFsyyKapjwtlofrogTIddBD+0ifslFadVTYzKAAe/60+1T07jPngheqqKm2V4VNv/FXXkZnJnjr/o5Cy1T2GfVNUnTYuZqJ7/nrGilytJzCfHP6KxT0qwICr6zSLhE2kf0lPPfVDMpr6RKSzSsOL6SLtZsL3rlV2AGwj8vXEfx5LdneGknlAviNrQIHUwG87bKa98rJx4HfUo+UGkkD0ATgc8nGAFrAFi11B368oxDpOu8DkBJfeLnn164op5VIdXfxgY8yxg84SZga2sgkCIHTNLiDDG5G47af7pKlgZvA8Y4+ppGFh2r9/MG1wFdriUHzx9MxOYNBxcKtMWltMX6JQ4dw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(451199021)(8936002)(8676002)(36756003)(6486002)(41300700001)(478600001)(52116002)(2616005)(2906002)(6666004)(83380400001)(26005)(316002)(186003)(86362001)(6506007)(1076003)(5660300002)(38100700002)(966005)(6512007)(9686003)(38350700002)(6916009)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Ioer8xAjkE25+nWH6MaWGS+wc1wzlQDqrjaUxCQD5UQG0bZZRQMBkFNaLPv?=
 =?us-ascii?Q?i4wiLN7OCybJDx2AX0MdQ9gnW3VF6SjLIgey1lfbFpcbhD/Y6U7MKahwPz5B?=
 =?us-ascii?Q?KV0O2L2bjayaAc41BvXYVmfDVmiwhBcyEdy6LCm340ArK0NmN77ACkjkfs8d?=
 =?us-ascii?Q?Odnpg6GdUcxcWmM7ZVLzW8Si1OhSie1xeIy3vJoOqmgFAqgTiE4GQQEqd3vu?=
 =?us-ascii?Q?y7KTpNJFuj+H3SPTg+sxEVeG09njt2xcw8Wb21N+HFzqxOHO6WDNIPiT/csI?=
 =?us-ascii?Q?QdXmVvGgUihgY/HkKv9u+wK/OeFpe3iFA42OyQBRwtAJc1AiLbdBU6FGkWga?=
 =?us-ascii?Q?Bz0V78qrvcHft7uwTm1mtVbsFXTQ1dG1YyMefhru3p5U42VsSH3eD7S/O/8m?=
 =?us-ascii?Q?3mvixJTBaR/VWbj+R0nLfFtFFmzUqkN4xmN6UWN/YC88EJ4P8WMShAW0Jg7N?=
 =?us-ascii?Q?4axUTe9SWaipjK913mNf9xLfC5DMhIGKdgJRt8h4Z5kSXc6NIpWXp7Crd0L0?=
 =?us-ascii?Q?644QYW4bs0jQsL/PSvLyvihnDSXOXrT/uXudi0WyprweJAGHo4T6VFFrFSfk?=
 =?us-ascii?Q?1io9jChlLIgQVSHsjkYRhM5hlC6Sd/RUacnzJbHvUcvh7EG8anf1qneArCRp?=
 =?us-ascii?Q?FO6SwhwDs/zDE+l8JrfFOldh+W4awufaqBxEd8+LfZQWHRQXHubT1fynfaP1?=
 =?us-ascii?Q?K8wW/0t58ljXcceKXNxWEzaqWh5DEDvQCY7wx1njR11RQKAfJYH6IkECc+T9?=
 =?us-ascii?Q?U9BSttwtti1Q8CsT65S9SlgEfr5O2mFwfl6iq1XRlEnTW4YbuhoB0f/rSEnn?=
 =?us-ascii?Q?m7aCsgrohPWxchHXtpb5f729Rg0p597abi9CTG9ube9AxmQt+nGy13jXZhdX?=
 =?us-ascii?Q?qJB1GXJAHCv3Q8euXRSteg3y80FVP7RdgsKdWNU+nqR/T00mKHGQYaVjq+vH?=
 =?us-ascii?Q?/kOwSzdATTkZm6gD+9eR9dEq0PerVrf9vkwY1hfQOgJ4S2DeafNlZkEONtxn?=
 =?us-ascii?Q?sowgYJFXyI6Kxs4GxSRkbV6M8VwWMY8YOeIepE1A7EVno7wwXjVN0XXPRGu9?=
 =?us-ascii?Q?6SqEQTzrv0Lhr7hIWSwlkPSd2K/RqVOg6XbcjslUu5m3TfODaLbnYYk0f7ud?=
 =?us-ascii?Q?aLbKRIF7iTBcQD7LZNZnQrFEfduVi3aJMYtLI3gRV5eiN8FnAHcB90Wd2tV7?=
 =?us-ascii?Q?Fg06QgvstDwUO5lLC4sRDCqMubaSjmZqBpHonO/UsPPpxrHCxoWquC35u6D4?=
 =?us-ascii?Q?So1rliN+L9jWX5ND2pXiD56SHZkNkPuFO2t7f4ktE6CcHcH45GaW99qqdJLa?=
 =?us-ascii?Q?BjL6AvasHeSYFBh42yOR3vzKmHhHSScEfiAxp3pUS31woIiGI5VM+JRnFDsJ?=
 =?us-ascii?Q?USwPmv/s9Hji4qXNRY1nGDZ/pWbEVa7xOayk7keV6G8xZ9b9R2dyiFpVNWKc?=
 =?us-ascii?Q?q9eRUJMDyXDYTilZjVcomknZX85yr1JVWi2BgxCp5CkQ+DCP/XqEGmYCnbXa?=
 =?us-ascii?Q?Xp3PPGrui01njX49HWsu16eOY5Rd0BDzULW9kClhQZt9mjJDi/FeG5X4wIBb?=
 =?us-ascii?Q?qgZJav1raJKkHUe3FegfGu2FYIrlDkzzfvm36qhClipt7XD7HSD69pr0rx08?=
 =?us-ascii?Q?Iba3MY5TRAAm5c338Hhu+Y0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547bb9fd-bf57-4a82-dec4-08db92e1fb41
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 22:52:28.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9IKaL9RwZ8Buk1OakbPISbHWNH2ZflfrIf5Fv2VVFbAD9SgwUHwVf14ISdGpvbDkkj171YzW0IkDt+sG/YSlXXv3N97HpJGZLz4V/q7vTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6139
X-Proofpoint-ORIG-GUID: b0IrAKwX0j1lUgBqob8npMO975uQBRst
X-Proofpoint-GUID: b0IrAKwX0j1lUgBqob8npMO975uQBRst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_19,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=942 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010205
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 22:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104199

From: Nicolas Marguet <nicolas.marguet@windriver.com>

Compiler does not inline any functions when using debug optimization (-Og).
Hence, remove -Winline flag when compiling with debug optimization.

Backport upstream fix: https://github.com/rsyslog/librelp/pull/258
Remove previous local fix: https://github.com/rsyslog/librelp/issues/256

Upstream-Status: Backport [https://github.com/rsyslog/librelp/commit/6d575d9]

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 ...line-errors-in-debug-optimization-Og.patch | 29 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  5 +---
 2 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch

diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
new file mode 100644
index 000000000..509bfbf8a
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
@@ -0,0 +1,29 @@
+From 6d575d98565ce3119a14359eecb11ccdff92a303 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <53660251+Yashinde145@users.noreply.github.com>
+Date: Thu, 29 Jun 2023 18:10:15 +0530
+Subject: [PATCH] Fix function inline errors in debug optimization (-Og)
+
+Compiler does not inline any functions when using debug optimization (-Og). Hence, remove -Winline flag when compiling with debug optimization.
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 21c1fde..1204c4e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -230,6 +230,12 @@ if test "$enable_debug" = "no"; then
+         AC_DEFINE(NDEBUG, 1, [Defined if debug mode is disabled.])
+ fi
+
++#Compiler does not inline any functions when not optimizing(-Og).
++#Hence, remove -Winline flag when DEBUG is enabled.
++#ifdef DEBUG
++WARN_CFLAGS="$(echo "$WARN_CFLAGS" | sed s/-Winline//g)"
++#endif
++
+ # valgrind
+ AC_ARG_ENABLE(valgrind,
+         [AS_HELP_STRING([--enable-valgrind],[Enable valgrind tests@<:@default=yes@:>@])],
+--
+2.39.0
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index e7b79ad03..bac5abb05 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
+           file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
 "
 
 SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
@@ -14,7 +15,3 @@ SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-DEBUG_OPTIMIZATION:append = " -Wno-error=inline"
-
-
-- 
2.39.0


