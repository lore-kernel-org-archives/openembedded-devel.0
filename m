Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82588C35FE4
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.113925.1726404740204526790
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYMsb018016
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1s1y6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpIvFaOxVMBGeKCKN/ZIDI7mi516BaI4H9F/WDvrFmFAebONX6XlqRKSCWeMjaxL8c2LkofgeGaleYOAJz9lnfs5YK/sIb0lfWu/fHFX2NVvnIV0PDv8dVJyiwX/YUAUHvwjON7XpHVk0J8SXk9LjWiktFcgswN9OJsKm3lwtqXEq+wpL3RZYR6iNKQ7dLxivvtcPXMBW+rrea2jonl1l7hONqorS/9KWGPhvrcpGepZKq06GCqyi7qWhVhDzumN/bcbXPZs/NBiFhKtqGIbFhVF04aF2etVWS133kDJUm93JhCsJhAJ5/mN80v0lQdQ0bJ1lJdrTI5UkxQrFUOQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvUL0QbjPVJ8g9zgoxAMkyuk1p6+/0qkamvP+JVKjmU=;
 b=jsXaObPVV9UxvpMr9uGrAcodvVR0T6VCI4Res3t5vEFwxABbOUdfzPtBpc6ep8JC9gZGuHD9JeBIv04X2WKNFgRAPp/3w1jJSKFZ4aZUHuxTXN6X7FW1EFk1ul09pQEyHfirbRH6DygaiP1cyLrK90t20p8wHjj8WLfr6VtePxRDor8X8wrLFknPHaqu+WD8QCiRBnG128/VdDK60lIY4XamCxGEh+qaeKhxduO0Sdh9oV5N3eRdD8smgwSZ2s2TTm99U5k/rzhzJtqXsCUx220jlZ+4sPoDeGfhG+h/Xh0Td9CYUw2Rne5952sObmwfMq/LMkGxCiMly92tdQhUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] libssh: upgrade 0.10.6 -> 0.11.1
Date: Sun, 15 Sep 2024 20:51:51 +0800
Message-Id: <20240915125153.2940806-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915125153.2940806-1-yi.zhao@windriver.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 9778d468-0fe1-4e75-51b8-08dcd5853739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Cx106HB/OqlqBsxkIThUrwsVGS9tI+Y6xSzRpJeDSwtEPeVBQGH//BGU0Mwb?=
 =?us-ascii?Q?CCMt34mGwObIWEX5+rjaWGJdoyTCmLBP6wmwgR5pEHfiH5YMKDwRRWMMBXne?=
 =?us-ascii?Q?/SqCmr9HkxALAg2UsaUXgEjVg3TrLuhwDxgiXZE/CVdXbgcXUO/PGZyaBi/a?=
 =?us-ascii?Q?1OUR5gG+DVA8t/d2Pigh8Yfvk5p7vpMBoxbd74lB675w1Gh5DNHK8RhEshsb?=
 =?us-ascii?Q?w/dcYLVTekkW0cZzYL6aDP88PWCWtD/emAKwgD2G3ZU5zD9viPK654NHStWU?=
 =?us-ascii?Q?QS7hqBlMpHwp2dASdfWUUoFHSzZlDdgBNCi7KwGJR12vmNuBMw/3H1FTXVSg?=
 =?us-ascii?Q?scOPa45Df7NBNXxo3o0UHY3TPxFbQFYWLDBmvK7ao8XwtHZcupyiWK1ekyDg?=
 =?us-ascii?Q?eLQt5Df8lrNYC0hbDB2ug4gP5oNP09KuB6b1ophReRyHtok9btQkCkZtX3FI?=
 =?us-ascii?Q?Zh+Bux0iDdTlBEjrBhsfxVmha2PPC7KWV9WsxOI7WCD8tMG9xShDS5/YM8PE?=
 =?us-ascii?Q?P4vfvr2oVjYVULOGPnRGL9E6nGq+9EcZTSmAnsHf0xP8b2gyA/O1U4GPLmDx?=
 =?us-ascii?Q?8V+5arRQR9dLswQlnyFCAX/8krFNSuqdJ12cvzp7swmRKqagLnL5a140fuW4?=
 =?us-ascii?Q?PMtk7CH/rAqyC/fPc/sdi90KU3WgeM4pEGys8/ijTuf8kL0jRa0/YcqlDDih?=
 =?us-ascii?Q?IHY1bot3WMJ+0/1hNy/eAFbpVUWm0mhZcnBUlIzNBK1x2uEzlH8B4CSYlmsq?=
 =?us-ascii?Q?dJ5HCzBcRO7lwkJgm0lbKN12RjJOLIAVdL7rgXbJVvn+7Kb2wY9n/vnePXWI?=
 =?us-ascii?Q?Z1C7bK1snNbgDBvnin3IPLYOeuXedEWUSyfX57QRpkf5dN1iKFH/ldtRc9sg?=
 =?us-ascii?Q?DYCKjdYucu0u2GnRORk/nNddnqfN02omR3mRBcSCmARXA6inWs5rylNYD0BY?=
 =?us-ascii?Q?WmlcV1b6tjqV5i6+qsz9kMRVXXmL6kgk8TSQwYQmsRK+LLSmmQ1iATv0BvY1?=
 =?us-ascii?Q?SqbB3FclEi3zKNqxsyrQqEHeNw+DiCWq+yV4ym/Nju8M+bReXJ7Osw/NKQF3?=
 =?us-ascii?Q?TgvXSzF9gyyqJp/CcuGhQYt8KHJEDf5IAmQmx+/XDAoVYnf7OIxkGQEV0XLA?=
 =?us-ascii?Q?8MPePpWfCvM0ba12xRcG+LwyWYOJ6U4RoWIPKT1pV9yvk1u6xmKnNffneqyZ?=
 =?us-ascii?Q?0sQ7wwzXSmMIeQSqQtwR/rpghIlJ8YxwUXpJE5zRmDnEInU4JyZ9914VPaX4?=
 =?us-ascii?Q?qftP6g2O5cc74OxpvtMb7U/AZtPfXSE9Hiy08YQYbv9gZy23vLZfPldcPNl5?=
 =?us-ascii?Q?BE+ipTNl0ZWm9SJWXnF7nvjW+K7SX7sa+WUBkwsDVlsmV5LF8Nqk3vXheSAO?=
 =?us-ascii?Q?hH8CdDAFbKrK05L9yIVak1SLw6awb4xag7CDQLHD+3gPcn4MxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pl5F1qpTq7uJmluRg4Fo3TNAvKmx7enUq7Pw+NnRjD6CFGrvFQKZsjp+pLfy?=
 =?us-ascii?Q?MbsfYjmjNzaCCF9Jh77Z+yNTVPZSVd9aZtOWCrJTvJmOyO3gk9SsZ7Jsad0n?=
 =?us-ascii?Q?yfTAoLHITIxEdWbgNxUO/pOuAYETx3JBKp0Gt/iYifAHY3M+Ud5QaqwI6NRN?=
 =?us-ascii?Q?DDr+0Fxhg2F23WTb3M3564l4iwvaMCcZ97YGyne4eVGdyg2R/YBlUn2qz5Wx?=
 =?us-ascii?Q?CrOUW470uge5YZPpLZpPOL+4LXc0TYNH9sKcPsAeIEeiwUXqgyuL2VR9BK19?=
 =?us-ascii?Q?hxsLOb7xYHvmrUJ/9znRtZqGnQEloBpDS6pgyYZUwZ+HswzqVlQ49CvbA9am?=
 =?us-ascii?Q?J4TGvNFBmjN1pdWaak90k40Gq1NIHXinFmSE5k3BzwJUHmnL1tVoLaDLo6Kh?=
 =?us-ascii?Q?JZwMcdtoxjwwkG7TbFcTw2pNEUTZJqYojMdjEMAsPK2fiHjPmNvrOr1aXkwe?=
 =?us-ascii?Q?p38RNuRKXrZLej42TaUakHxZ/MOtGDUzDTq2O0KeE5FwjIsGcc28ya52VA3J?=
 =?us-ascii?Q?TpooS7qOyT0pSJ7BSdsGjze/D7gNYLOtWi/hcj2odqTW8ojwoy68esZls7y2?=
 =?us-ascii?Q?oNUVW72g57jeFcI0GOrXV0SrJWxQEmR+vXNFrNA4N0cBXPRemibLnrY91dt7?=
 =?us-ascii?Q?W4etcr3KnSA4F6Wu69DvpXWFduNxKQLQy+BatcAiAL8FUlUl5SKU2gLP2OH1?=
 =?us-ascii?Q?Y5Hu8d29S6T1f0sDdNNZaL0bfrmL+zO65hSl31GCkFAyCcRbXlaA0pRkxfKt?=
 =?us-ascii?Q?BrzuBwrBXEqHjif0q6Rpb4p7EL/ORv2qZ7BQaeXk175Ooo5hXpBlnP0NhCXt?=
 =?us-ascii?Q?CsXUnvnrb4mj4CJ0qvzvXZFFpKwijhF+Oiw5HSMhU5VqWchxGpWAZ8IW/jjr?=
 =?us-ascii?Q?By1bMzjdbYybQ5irvZ1sOO8UJZrrg58j5LbSyRzLnHMGY2qomeR0t8V61GO2?=
 =?us-ascii?Q?KsaSuKI9HX4gkL031ly7zr70VlDYH2OdqzC+kLIwP/zDw5egBwckP99HEGdX?=
 =?us-ascii?Q?zd359oVQIyStAj/NJuKdkhsblJANTWGtWSJiranwbnhebDMJJxrVFHg13jvN?=
 =?us-ascii?Q?Xkne5U6SwNEHZZe/bSHha0qzYtvXx+L+I0sitajBVkUh+Y3jV4shpBq1iBbS?=
 =?us-ascii?Q?sL3IRQdL9F4bMVqiR0AouOiv1ZTXzKaqIQ+Ti41VOoHELZ+W2Gy/8x+M7Bk4?=
 =?us-ascii?Q?ckUgERKnWTMt8SicdMEpYzS2U0CJw7eo3w+Z+uoVnLdl/jMnYXKbyJU7Z8an?=
 =?us-ascii?Q?iP/wc8kxFEi6G/VYAYfGgRJaF5umzZBUlOIOxQhzj3d4gScgj4knZkKr+T37?=
 =?us-ascii?Q?tge6A8CqwJtzd5xm5tU5Q755ZIAFTNgNFmLRWcwxFr/2LRck09Nn+YElp2dx?=
 =?us-ascii?Q?yp8Gf9BZnHyuk6aJF2Mav2QvTluD7ZHYsp8FieF2HnCqo/uaZwnQb9+uCJUm?=
 =?us-ascii?Q?+mwBIeYEMXohha0ZaZePBoxQhIfJa7ImKXT7xDsWuhDzxgo1jAJyX0xVNP7C?=
 =?us-ascii?Q?dmcXQAi+/bvkfycGDf581G0i+MYUdC4Re0kh9lryUXEGEQeHuIAKdQUc4WOy?=
 =?us-ascii?Q?1ALbuvxTpyjx8HpXnMFXZbCC3cS5JGwIbv7aIdez?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9778d468-0fe1-4e75-51b8-08dcd5853739
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:11.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0a7cF33K3ZfdK6YcKKalhA6FqMiCUFytyLE4JuszWS4B5RgQKaXZldc11e0Juam/7NHs/zWgM61H+OkyI0Yjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e6d883 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=nar8ntqeAAAA:8
 a=oLtHuQmu1MEBwpkKkUYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=RptMqvEBejqe73AKBt4K:22
X-Proofpoint-GUID: CQLslmzfo1qCpGSPinuRrRBQHgtfX34_
X-Proofpoint-ORIG-GUID: CQLslmzfo1qCpGSPinuRrRBQHgtfX34_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112296

* Drop 0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
  as the issue has been fixed upstream.

* Add a patch to fix build with clang.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...cks.cmake-drop-Wunused-variable-flag.patch | 37 ++++++++++++++++
 ...prototype-of-des3_encrypt-des3_decry.patch | 44 -------------------
 ....txt-do-not-search-ssh-sshd-commands.patch | 16 ++++---
 .../{libssh_0.10.6.bb => libssh_0.11.1.bb}    |  8 ++--
 4 files changed, 51 insertions(+), 54 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.10.6.bb => libssh_0.11.1.bb} (88%)

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch b/meta-oe/recipes-support/libssh/libssh/0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch
new file mode 100644
index 000000000..21af9a5a1
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch
@@ -0,0 +1,37 @@
+From 98a330971f4344619b698d4603a45bd31d6935d9 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sun, 15 Sep 2024 20:31:55 +0800
+Subject: [PATCH] CompilerChecks.cmake: drop -Wunused-variable flag
+
+Drop -Wunused-variable flag to fix build with clang:
+
+libssh/0.11.1/git/src/threads/libgcrypt.c:29:1: error: unused variable 'gcry_threads_pthread' [-Werror,-Wunused-variable]
+   29 | GCRY_THREAD_OPTION_PTHREAD_IMPL;
+      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+libssh/0.11.1/recipe-sysroot/usr/include/gcrypt.h:217:33: note: expanded from macro 'GCRY_THREAD_OPTION_PTHREAD_IMPL'
+  217 |   static struct gcry_thread_cbs gcry_threads_pthread = {                \
+      |                                 ^~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CompilerChecks.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CompilerChecks.cmake b/CompilerChecks.cmake
+index 9719e699..ec15fa2a 100644
+--- a/CompilerChecks.cmake
++++ b/CompilerChecks.cmake
+@@ -48,7 +48,7 @@ if (UNIX)
+     add_c_compiler_flag("-Werror=implicit-int" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Wint-conversion" SUPPORTED_COMPILER_FLAGS)
+     add_c_compiler_flag("-Werror=int-conversion" SUPPORTED_COMPILER_FLAGS)
+-    add_c_compiler_flag("-Werror=unused-variable" SUPPORTED_COMPILER_FLAGS)
++    #add_c_compiler_flag("-Werror=unused-variable" SUPPORTED_COMPILER_FLAGS)
+ 
+     check_c_compiler_flag("-Wformat" REQUIRED_FLAGS_WFORMAT)
+     if (REQUIRED_FLAGS_WFORMAT)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
deleted file mode 100644
index d2d1fb595..000000000
--- a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 49a8ae4d6f77434ed9f7a601b9df488b921e4a22 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Mar 2023 21:59:19 -0700
-Subject: [PATCH] libgcrypt.c: Fix prototype of des3_encrypt/des3_decrypt
-
-This is to match the prototype for callback functions which are now emitted as
-errors by clang16
-
-Fixes
-
-TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:903:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
-    .encrypt     = des3_encrypt,
-                   ^~~~~~~~~~~~
-TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:904:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
-    .decrypt     = des3_decrypt
-                   ^~~~~~~~~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/libgcrypt.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libgcrypt.c b/src/libgcrypt.c
-index f410d997..e3f66781 100644
---- a/src/libgcrypt.c
-+++ b/src/libgcrypt.c
-@@ -416,12 +416,12 @@ static int des3_set_key(struct ssh_cipher_struct *cipher, void *key, void *IV) {
- }
- 
- static void des3_encrypt(struct ssh_cipher_struct *cipher, void *in,
--    void *out, unsigned long len) {
-+    void *out, size_t len) {
-   gcry_cipher_encrypt(cipher->key[0], out, len, in, len);
- }
- 
- static void des3_decrypt(struct ssh_cipher_struct *cipher, void *in,
--    void *out, unsigned long len) {
-+    void *out, size_t len) {
-   gcry_cipher_decrypt(cipher->key[0], out, len, in, len);
- }
- 
diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
index d6bc75c3a..4803ff81d 100644
--- a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -1,4 +1,4 @@
-From 69a89e8f015802f61637fed0d3791d20a594f298 Mon Sep 17 00:00:00 2001
+From 99fcb71903cca8458bcd6c0d5b676619a9710dab Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 15 Mar 2023 16:51:58 +0800
 Subject: [PATCH] tests/CMakeLists.txt: do not search ssh/sshd commands on host
@@ -9,16 +9,15 @@ not required by unittests, we can skip the search.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
 ---
  tests/CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index f5c30061..885c926a 100644
+index 89b95d08..e481534c 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
-@@ -86,6 +86,7 @@ set(TEST_TARGET_LIBRARIES
+@@ -96,6 +96,7 @@ set(TEST_TARGET_LIBRARIES
  
  add_subdirectory(unittests)
  
@@ -26,11 +25,14 @@ index f5c30061..885c926a 100644
  # OpenSSH Capabilities are required for all unit tests
  find_program(SSH_EXECUTABLE NAMES ssh)
  if (SSH_EXECUTABLE)
-@@ -302,6 +303,7 @@ if (CLIENT_TESTING OR SERVER_TESTING)
+@@ -345,6 +346,7 @@ endif (WITH_PKCS11_URI)
+ file(COPY gss/kdcsetup.sh DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/gss FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE)
  
-     message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
- endif ()
+ message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
 +endif ()
  
  configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
similarity index 88%
rename from meta-oe/recipes-support/libssh/libssh_0.10.6.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.1.bb
index 31f29c1b7..5f39c2d79 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10 \
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11 \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
-           file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
+
+SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
+
+SRCREV = "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


