Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4517FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:30:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="77564363"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 11:30:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B59894CE1643
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 11:22:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 28 Oct 2019 11:30:37 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 19:24:58 +0800
Message-ID: <1572261898-121933-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B59894CE1643.A78F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] autofs: upgrade 5.1.5 -> 5.1.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2019 03:30:34 -0000
Content-Type: text/plain

1) Upgrade autofs from 5.1.5 to 5.1.6.

2) Update 0001-Do-not-hardcode-path-for-pkg.m4.patch for 5.1.6.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch      | 14 ++++++--------
 .../autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb}            |  4 ++--
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb} (95%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
index 410827b..364b05c 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
@@ -1,9 +1,4 @@
-From a27217a5437da313d251b4a765bf7cb60ffaa62d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 27 Nov 2018 15:27:47 +0800
-Subject: [PATCH] From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17
- 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 24 Aug 2018
- 06:24:36 +0000 Subject: [PATCH] Do not hardcode path for pkg.m4
+Subject: [PATCH] Do not hardcode path for pkg.m4
 
 Upstream-Status: Pending
 
@@ -11,16 +6,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 update patch to version 5.1.5
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+update patch to version 5.1.6
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 493b9f1..268d06b 100644
+index 859eaa6..2ae04bd 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.5)
+ AC_INIT(.autofs-5.1.6)
  
  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
similarity index 95%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
index 9e43549..67d03d6 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
@@ -28,8 +28,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            "
 
 
-SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
-SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
+SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
+SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
-- 
2.7.4




