Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DA8FEE4D9
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115985.1772269330849293375
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WY7kM4Q/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269331; x=1803805331;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yFPCPepqUaa8uU3ulCFD8Ja3gi3h2UlbMr3mjEBzi6k=;
  b=WY7kM4Q/ovqxrFYrX+NOJcLTSZh6Rvf09lAcN6h7+Ng/UqLbVZNgWC3p
   ZN2hLIwxOSq/jUvNalczuP3hYmWP9RHrr+UN4UkX2DhROc+zeva3duXaW
   jLOyfuTzPPtQqeu5M4q3m/hswKBSPW1zQ1WbmOrdqCga+B8AjijebCoQ6
   FXc+whZOq//7aIGmRK7U/9iXFPViaBZuuPFYPsikbV91n5MWx+MfT0LRv
   T/bBgNDXyBEJqFji6IWe2GYhT0PmaPtZICXE9akZRv2ZChKKrSRSdhozk
   wpDylLgtWiGc8cLCIuJ7zZ60+qtFbeC+L8vBhUA/tOIcwDE5Kt3BzJHe2
   Q==;
X-CSE-ConnectionGUID: WDcCcYVeR2uAZLIPtmHOgg==
X-CSE-MsgGUID: QE2tvBPdTlitauutfWwScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="232067629"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="232067629"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 093EC820709
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AF7498D65C4
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:08 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 67E61101BB41
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:06 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-gmpy2: upgrade 2.2.2 -> 2.3.0
Date: Sat, 28 Feb 2026 17:01:58 +0800
Message-ID: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124770

1.Changelog:
https://github.com/gmpy2/gmpy2/releases/tag/v2.3.0

2.Add python3-setuptools-scm-native as depend to satisfy require check of setuptools_scm

3.Add 0001-Avoid-do_configure-requires-check-error.patch to fix require check error of setuptools
| ERROR Missing dependencies:
|       setuptools_scm[toml]>=6.0
|       setuptools<80,>=77

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...id-do_configure-requires-check-error.patch | 29 +++++++++++++++++++
 ...-gmpy2_2.2.2.bb => python3-gmpy2_2.3.0.bb} |  9 ++++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.2.2.bb => python3-gmpy2_2.3.0.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
new file mode 100644
index 0000000000..3c602cebe5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gmpy2/0001-Avoid-do_configure-requires-check-error.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] Avoid do_configure requires check error.
+
+The gmpy2-2.3.0 need setuptools < 80, but version in oe-core is 80.9.0,
+so fix it to avoid following error.
+
+| ERROR Missing dependencies:
+|       setuptools<80,>=77
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 1f00809..3a4f3e2 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ['setuptools>=77,<80', 'setuptools_scm[toml]>=6.0']
++requires = ['setuptools>=77', 'setuptools_scm[toml]>=6.0']
+ build-backend = 'setuptools.build_meta'
+ 
+ [project]
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb
index 2196616a0e..841d87097d 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb
@@ -1,13 +1,16 @@
 SUMMARY = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x"
 SECTION = "devel/python"
+HOMEPAGE = "https://github.com/gmpy2/gmpy2"
 LICENSE = "GPL-3.0-only | LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-DEPENDS += "gmp mpfr libmpc"
+DEPENDS += "gmp mpfr libmpc python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "d9b8c81e0f5e1a3cabf1ea8d154b29b5ef6e33b8f4e4c37b3da957b2dd6a3fa8"
+SRC_URI[sha256sum] = "2d943cc9051fcd6b15b2a09369e2f7e18c526bc04c210782e4da61b62495eb4a"
 
-inherit pypi python_setuptools_build_meta python3native
+SRC_URI += "file://0001-Avoid-do_configure-requires-check-error.patch"
+
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


