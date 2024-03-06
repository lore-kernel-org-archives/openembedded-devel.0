Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37126C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:54:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11049.1709729663203104613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GQ8g8Vol;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37951e9ca0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4264UTrM017888
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 04:54:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=jJULudV0Xl2HT1E27W
	cZ9CMDqrjDVlvpruC4XmVm4G0=; b=GQ8g8VolBsrUQj4jrIaST2hvX3xmo5j1Au
	DwMLtAHnCcLqbFwELC2qmOV0DMI1v4Zkqmg1qsTnvCcF1ZKad9warvHlPPhnOV9x
	MlKJ7A+n1ZFiECgZDTzAdduBr7UHR93oYzLiULKAc+w2pNtnwd14dTuPznhTyxCH
	lzNoYT7mmbSWYuLZq+e0z5sJG7WNxDfmRQ/cvaDSZtg0047ghC5P446o8zSKLjZX
	TqEccc2/vlQjWEpv2WzdqBhDkNR0BAXBgsaXAwOVP5DwQgaNbvtiJkmJ8k3KVzaI
	bVSXn4RVecwWX91qfnlpnDd5RF/1fDWW2fihVz8i5LfgIXSd8+CA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093us50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 04:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fH6q6rbqlUxDjZ6Y2FSj+NStpoWSwFzBcCKGIo7CRdWd4WextksEt3UtZpTJ5P+xkJN8z4B3FcxqvoWvzz2Mlka9H/FuvqG/6YbqfL33P81QQz2OrnRUis63tMjv7rmHfaRzJyWT6YERiWHCUAtK9wq8bT2g+YgClti3++/cYFjnJkgPwwu+CJ0FwSVmLMa2XKF+QITdgtwqbd0w1wjXhKH/uKaHevBnyHhWwe87Yf33GiiGwzpgx6urxmFARusQ0vqRo61yNUfVuydRsZ8jDQ3RqXIYwPJI49f6lHoHJbagV3eqCdTuoH6V8lJNoc5bzyqMCyLtXcAbMffaQSVPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJULudV0Xl2HT1E27WcZ9CMDqrjDVlvpruC4XmVm4G0=;
 b=kS9k5l4m2OioodoFfDQTzAw9DWrdyeacLU2jyazJtIp7jwJhheo8MUS94LYkF1rk1QUbW2UJdMbUBkQZDusy9syJGSOg8z6Yulyn7efaeyiwOZ0bZutSs/uIgzYsYXAMNDQ7YSqIIqTXHzHXYi2UEuIPb0GJi/GmUgj0AqYzCtmGhwmudXMuMTw8JFc4ko0eXjNk/6yT8avgWUPn+FVPz3vxhjLlpHpIGdcsxI764MFPM7FYYRAb23uaHCJfVGJIdUqsUCg2UTvO5RUNgz7yVYHtGpJBA7xHNXT9Ce7uhsEkLXW6fXHMxCEjFl/73KfBK3CSjqhXZLUjkP/751t8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 6 Mar
 2024 12:54:18 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 12:54:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] netplan: upgrade 0.106 -> 1.0
Date: Wed,  6 Mar 2024 20:54:06 +0800
Message-Id: <20240306125406.1381827-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DM6PR11MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c2ab71-bc46-4d10-090b-08dc3ddc88cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m6G5DZ809OBsH1gwMdsqZVWhiPhh7Eekp6IWRc5zwAkSjAImATEDokkrCOG9zl5cGaOj+wSLqHNY7C1oyr8cLampqvrdVB76z3mZMtfPvbnVra/cSPnGdt3ceafP0HuFhO/QosUvfqmBPjFeotSt4t+pY4BDKCowcKBVZ2Jp2fOjN+p/xNECQ9sQ2gCgqnv+T0Ce3gEh4NjuQkhs5BCIhjvKc3AiIuSEJiC9B7/vlqdb/RLC+KUOr/CYH8UOr6FOcMxW8RupraPRSR8Iq4q8vNJTbC36MfwmiNx2mP//vIDQ49PGZZ0KXvwHwmo3k+5QZGB5g3CQWrcdqIpsK5pM8o9MNp0a0PysFUeZyarClFTPKRwPCgQgRvH1WamGPUrWXW+xYKK72WTa6fuUa/diDmskbbZs5hCpP0ZyYYqnaLl3XrmnneqenwJ0dGXAtJZzo3OTTbTjl6eRf8JxwlNizoTU4hcxiFBqPET+oe0yDb8Mx9sqj8qHom2783oglWfjDfe31y40vM7YVYvPUwFa9lYZUjQAMDq73p5mscfZfZFjrogAhckx6HxiMGq0xSbDb7kUFygOd++rQpgFNbDaaEaObtfgmStPZpTrsuCGmY/5w7K9+L/g/0Fuctymei+JYnQFnnKOOlgcqtbXr5Oxh6lxUwpvTwcvzrRPRSz0zqAzb/54KMaf70s+OkjN58Xy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s3KX17LqTjGv8bep6y7sVsSM8dVwOQZOXBpa0xvdQpQrpr2vxVJ7/5AkxjaA?=
 =?us-ascii?Q?jp2cfd8xK3GswKbWrF3rC49WSFmzxS/4DUZk5G15pgYuLPVIPBz+vbduJZWX?=
 =?us-ascii?Q?pJPGYqDrSUVo0jKN1MA+PQbqKfJvhTU1Yeiaw16xkBULwmjg8EgHfl7ZGEDS?=
 =?us-ascii?Q?kmFZaBQpLJQNy/HQnPdBfA9SuIU+AzQHGXdgIoQ68Azh/6XJF9raJgdho7oD?=
 =?us-ascii?Q?gfQgMlziwXe69BioPNPVkNvf4g5mDMuE1uCrVf2MCGJciHjrofZaybxHpTXU?=
 =?us-ascii?Q?fuRgzeZuoqMqA3dpboGclP0ztgnDcViGlIUvqlMCm5aQTBh973TJJDn4vkDH?=
 =?us-ascii?Q?+pPT5tv8Re/AjoQA4gOL22pvOX7nSNFuGcF1eoPc3nI0Bh9rojftMRDy5sLO?=
 =?us-ascii?Q?G/H/yMyugOx85O4GQAYIUQy1M3VdGVCOKGj4xcpSWo6o8uzY31ifjrrRXJZH?=
 =?us-ascii?Q?CSJ7GeNvqR1/2xh4tavLqyyHOzwX1j+QybuhDQKaxEqM6bFczB4W+wSOgbAQ?=
 =?us-ascii?Q?9mjBZi8kHkgfYxpFYLuBuciYE7/9pcaEgpXP8anLln49V8fqKsQTSb5c5jWr?=
 =?us-ascii?Q?/8mnfMCqeBWNHBRU8stIzBRYCUjotb21PuKfkdAHWvY8Ytt/muz8WeLtwX8a?=
 =?us-ascii?Q?HpC2qU/iI1ccpUYiKOZ29o4NwgtkRloqdbZUYagiW/RnPTOqZqUDTFAyXUCI?=
 =?us-ascii?Q?VTYLGH447zJZzJIdu5cmhGNAE1lbw2FS/I5c5SMnIF+NSblgnIRgvJswYT7e?=
 =?us-ascii?Q?tccrGoVUOw8lKZy14fB6LRBVz4Qp7u1MFCqGwo+Aiffw0rISyzSebrD4FCFY?=
 =?us-ascii?Q?kSVN+UvcTBVAsVpIBlqtor+Hg7CBHQVsb25+5gzvCgviUOwpjFYg3omP7M39?=
 =?us-ascii?Q?YKdzzNDKv9wwHorzpcZtdygKzm1P8xIScav4F+Mph3XpC1tF89yQWFFLDbH8?=
 =?us-ascii?Q?zGFtzGvO/4GnoqVJpP8kq5cb7AUP88m228yPp1Kvlnt8xrH6WhhaZhXXN8oe?=
 =?us-ascii?Q?tmSPtS6NV8jJBYX390TrLmXdBUem7NCr8W0S2Sp+yo/+G2PLHNuQFVjsQNBh?=
 =?us-ascii?Q?kL9wtp6hbmKwG4crJijLN23yXfWnWx3ilaPGAsKO9APtsiDWBt2Cu4sAEq6s?=
 =?us-ascii?Q?bbi/q3fwLcDjRVDYpz3r49l/20LS8BzdAf+9qb7FnBsA3mWZTkjXlgjIpdur?=
 =?us-ascii?Q?ooBoN7dWJ4xlzcLn6vGiyQsUbb75q+x4XY90BbsAa53hR20IqWzwR5PHXa2d?=
 =?us-ascii?Q?x0HXWmlvxZLLVlHXM4JmXpWZLes+0D0d0cY0Hu0Mr1vw5qzqyj8kWa5KE3ei?=
 =?us-ascii?Q?llWAsMPiyDtmwvl5GfC6bntrtktoTUu8oUYSjrP7sa+z/+s/PQ58iafLctCt?=
 =?us-ascii?Q?jM7Llt9cim0b6W16X3ztizg9heosDWpJtmdIyVlV5MVw2NYvoAteWJGGOMOD?=
 =?us-ascii?Q?69LVQFi+FSX6/JRBAxygZi0EWIHlYKW2mm3bAKR+phVcGm9oFkQMUfzTv1ky?=
 =?us-ascii?Q?bnmWfqv5eGmu7UE632o5vx2uB4vhsaFF1l790KOj3QX8npZ+q9rHturfcJcu?=
 =?us-ascii?Q?KiMJ0X9YWDR+DaDCETL56iNsj2fQNjOwtP87+DsB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c2ab71-bc46-4d10-090b-08dc3ddc88cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 12:54:18.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnjOLn29GPafewyEhSFQ1pBeViakCIb+C2i22dKB03hpkJbT9T1V/Albdoxlg16hmuPFPW4NsIzhSaR5XmEP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
X-Proofpoint-GUID: N7J774MXTjwYfQaruh6u1UNwuqp1hfRK
X-Proofpoint-ORIG-GUID: N7J774MXTjwYfQaruh6u1UNwuqp1hfRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_08,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 12:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109167

Release Notes:
https://github.com/canonical/netplan/releases/tag/1.0

* Switch to meson build
* Add systemd to REQUIRED_DISTRO_FEATURES as systemd dependency can not
  be removed.
* Add a patch to fix build with clang.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Makefile-do-not-use-Werror.patch     | 26 -------
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch | 12 ++--
 ...-drop-unnecessary-build-dependencies.patch | 58 ++++++++++++++++
 ...ine-scope-specific-to-case-statement.patch | 47 +++++++++++++
 .../0002-meson.build-do-not-use-Werror.patch  | 29 ++++++++
 .../netplan/netplan_0.106.bb                  | 67 -------------------
 .../netplan/netplan_1.0.bb                    | 47 +++++++++++++
 7 files changed, 187 insertions(+), 99 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
deleted file mode 100644
index b8c48d540..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 3 Oct 2021 21:52:16 +0200
-Subject: [PATCH] Makefile: do not use -Werror
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 97973ce..78273ff 100644
---- a/Makefile
-+++ b/Makefile
-@@ -8,7 +8,6 @@ BUILDFLAGS = \
- 	-DSBINDIR=\"$(SBINDIR)\" \
- 	-I${CURDIR}/include \
- 	-Wall \
--	-Werror \
- 	$(NULL)
- 
- TESTFLAGS =	\
--- 
-2.34.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
index 0bd7f80c2..cabceae84 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -1,20 +1,20 @@
-From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 2001
+From 0ea11f520a8b4453e60eaf0679b9feb757024422 Mon Sep 17 00:00:00 2001
 From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 11:41:43 +0900
 Subject: [PATCH] don't fail if GLOB_BRACE is not defined
 
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
  src/util.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/src/util.c b/src/util.c
-index 841ec12..59595da 100644
+index 36eb896a..ee13ec44 100644
 --- a/src/util.c
 +++ b/src/util.c
-@@ -32,6 +32,12 @@
+@@ -35,6 +35,12 @@
  #include "names.h"
  #include "yaml-helpers.h"
  
@@ -24,7 +24,7 @@ index 841ec12..59595da 100644
 +#define GLOB_BRACE 0
 +#endif
 +
- NETPLAN_ABI GHashTable*
+ GHashTable*
  wifi_frequency_24;
  
 -- 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
new file mode 100644
index 000000000..4f385e917
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
@@ -0,0 +1,58 @@
+From d3aa30f5cd7ba375e006a755752acbcfcd619452 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 6 Mar 2024 19:27:15 +0800
+Subject: [PATCH] meson.build: drop unnecessary build dependencies
+
+The pytest and pycoverage are required by meson test but not for
+building. Mark them as 'required: false' to get rid of unnecessary
+build dependencies.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ meson.build | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9556836a..30f33fe2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -25,8 +25,8 @@ bash_completions_dir = completions.get_variable(pkgconfig: 'completionsdir', def
+ # Order: Fedora/Mageia/openSUSE || Debian/Ubuntu
+ pyflakes = find_program('pyflakes-3', 'pyflakes3', required: false)
+ pycodestyle = find_program('pycodestyle-3', 'pycodestyle', 'pep8', required: false)
+-pytest = find_program('pytest-3', 'pytest3')  # also requires the pytest-cov plugin
+-pycoverage = find_program('coverage-3', 'python3-coverage')
++pytest = find_program('pytest-3', 'pytest3', required: false)  # also requires the pytest-cov plugin
++pycoverage = find_program('coverage-3', 'python3-coverage', required: false)
+ pandoc = find_program('pandoc', required: false)
+ find = find_program('find')
+ 
+@@ -75,6 +75,7 @@ if get_option('unit_testing')
+ endif
+ 
+ #FIXME: exclude doc/env/
++if pyflakes.found() and pycodestyle.found()
+ test('linting',
+      pyflakes,
+      timeout: 100,
+@@ -91,7 +92,9 @@ test('legacy-tests',
+      find_program('tests/cli_legacy.py'),
+      timeout: 600,
+      env: test_env)
++endif
+ #TODO: split out dbus tests into own test() instance, to run in parallel
++if pycoverage.found()
+ test('unit-tests',
+      pycoverage,
+      args: ['run', '-a', '-m', 'pytest', '-s', '-v', '--cov-append', meson.current_source_dir()],
+@@ -143,4 +146,5 @@ if get_option('b_coverage')
+          priority: -99, # run last
+          is_parallel: false)
+ endif
++endif
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
new file mode 100644
index 000000000..9f01108a2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
@@ -0,0 +1,47 @@
+From 6e3dd61bf90a7ca8c36c5b95943cbff7c1ad3c2d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 6 Mar 2024 16:12:31 +0800
+Subject: [PATCH] networkd.c: define scope specific to case statement
+
+Per [1], define a scope specific to case statement to fix build with
+clang.
+
+Fixes:
+../git/src/networkd.c:544:13: error: expected expression
+  544 |             gchar* first = g_strcmp0(def->id, def->veth_peer_link->id) < 0 ? def->id : def->veth_peer_link->id;
+      |             ^
+../git/src/networkd.c:545:17: error: use of undeclared identifier 'first'
+  545 |             if (first != def->id) {
+      |                 ^
+
+[1] https://stackoverflow.com/questions/92396/why-cant-variables-be-declared-in-a-switch-statement
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/networkd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/networkd.c b/src/networkd.c
+index 25121c48..5eb9c0fe 100644
+--- a/src/networkd.c
++++ b/src/networkd.c
+@@ -541,12 +541,14 @@ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const ch
+              * and, if the selected name is the name of the netdef being written, we generate
+              * the .netdev file. Otherwise we skip the netdef.
+              */
++        {
+             gchar* first = g_strcmp0(def->id, def->veth_peer_link->id) < 0 ? def->id : def->veth_peer_link->id;
+             if (first != def->id) {
+                 g_string_free(s, TRUE);
+                 return;
+             }
+             g_string_append_printf(s, "Kind=veth\n\n[Peer]\nName=%s\n", def->veth_peer_link->id);
++        }
+             break;
+ 
+         case NETPLAN_DEF_TYPE_TUNNEL:
+-- 
+2.25.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch
new file mode 100644
index 000000000..663a80ecd
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch
@@ -0,0 +1,29 @@
+From 668ee79f39614ad758edd44c42b8b0eff57877cf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 21:52:16 +0200
+Subject: [PATCH] meson.build: do not use -Werror
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 30f33fe2..0b214795 100644
+--- a/meson.build
++++ b/meson.build
+@@ -4,7 +4,7 @@ project('netplan', 'c',
+         default_options: [
+             'c_std=c99',
+             'warning_level=2',
+-            'werror=true',
++            'werror=false',
+         ],
+         meson_version: '>= 0.61.0',
+ )
+-- 
+2.25.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
deleted file mode 100644
index 8c1eaa550..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "The network configuration abstraction renderer"
-DESCRIPTION = "Netplan is a utility for easily configuring networking on a \
-linux system. You simply create a YAML description of the required network \
-interfaces and what each should be configured to do. From this description \
-Netplan will generate all the necessary configuration for your chosen renderer \
-tool."
-HOMEPAGE = "https://netplan.io"
-SECTION = "net/misc"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-S = "${WORKDIR}/git"
-SRCREV = "15ce044d1df27b5057556d84d0d14beef8dd4e4d"
-PV = "0.106"
-
-SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
-           file://0001-Makefile-do-not-use-Werror.patch \
-           "
-
-SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-
-DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-PACKAGECONFIG ?= ""
-
-PACKAGECONFIG[tests] = ",,,python3-nose python3-coverage python3-netifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
-
-RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan python3-dbus python3-rich"
-
-inherit pkgconfig systemd
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-EXTRA_OEMAKE = "generate netplan/_features.py"
-EXTRA_OEMAKE =+ "${@bb.utils.contains('DISTRO_FEATURES','systemd','netplan-dbus dbus/io.netplan.Netplan.service','',d)}"
-
-do_install() {
-	install -d ${D}${sbindir} ${D}${libdir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
-	install -m 755 ${S}/generate ${D}${base_libdir}/netplan/
-	install -m 644 ${S}/netplan/*.py ${D}${datadir}/netplan/netplan
-	install -m 644 ${S}/netplan/cli/*.py ${D}${datadir}/netplan/netplan/cli
-	install -m 644 ${S}/netplan/cli/commands/*.py ${D}${datadir}/netplan/netplan/cli/commands
-	install -m 755 ${S}/src/netplan.script ${D}${datadir}/netplan/
-	ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
-	sed -i -e "s#/lib/netplan/generate#${base_libdir}/netplan/generate#" ${D}${datadir}/netplan/netplan/cli/utils.py
-
-	install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
-	ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
-		install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
-		install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
-		install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
-		sed -i -e "s#^Exec=/lib/#Exec=${base_libdir}/#" ${D}${datadir}/dbus-1/system-services/io.netplan.Netplan.service
-	fi
-
-	install -m 755 ${S}/libnetplan.so.0.0 ${D}${libdir}
-        ln -rfs ${D}${libdir}/libnetplan.so.0.0 ${D}${libdir}/libnetplan.so
-}
-
-PACKAGES += "${PN}-dbus libnetplan"
-
-FILES:libnetplan = "${libdir}/libnetplan.so.0.0"
-FILES:${PN} = "${sbindir} ${base_libdir}/netplan/generate ${datadir}/netplan ${sysconfdir}/netplan ${systemd_unitdir}"
-FILES:${PN}-dbus = "${base_libdir}/netplan/netplan-dbus ${datadir}/dbus-1"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
new file mode 100644
index 000000000..71efd2cc3
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
@@ -0,0 +1,47 @@
+SUMMARY = "The network configuration abstraction renderer"
+DESCRIPTION = "Netplan is a utility for easily configuring networking on a \
+linux system. You simply create a YAML description of the required network \
+interfaces and what each should be configured to do. From this description \
+Netplan will generate all the necessary configuration for your chosen renderer \
+tool."
+HOMEPAGE = "https://netplan.io"
+SECTION = "net/misc"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit meson pkgconfig systemd python3targetconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
+           file://0001-meson.build-drop-unnecessary-build-dependencies.patch \
+           file://0002-meson.build-do-not-use-Werror.patch \
+          "
+
+SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
+SRC_URI:append:toolchain-clang = " file://0001-networkd.c-define-scope-specific-to-case-statement.patch"
+
+SRCREV = "45f7cd1569896d9e316c130bf5c60b7ccfc8211d"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "glib-2.0 libyaml util-linux-libuuid \
+           systemd python3-cffi-native \
+          "
+
+EXTRA_OEMESON = "-Dunit_testing=false"
+
+RDEPENDS:${PN} = "python3-core python3-netifaces python3-pyyaml \
+                  python3-dbus python3-rich python3-cffi \
+                  util-linux-libuuid libnetplan \
+                 "
+
+PACKAGES += "${PN}-dbus libnetplan"
+
+FILES:libnetplan = "${libdir}/libnetplan.so.*"
+FILES:${PN} = "${sbindir} ${libexecdir}/netplan/generate \
+               ${datadir}/netplan ${datadir}/bash-completion \
+               ${systemd_unitdir} ${PYTHON_SITEPACKAGES_DIR} \
+              "
+FILES:${PN}-dbus = "${libexecdir}/netplan/netplan-dbus ${datadir}/dbus-1"
-- 
2.25.1


