Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.6811.1612850861567043232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 22:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11967N1n026323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Feb 2021 22:07:23 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 22:07:17 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Feb 2021 22:07:17 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] ndpi: fix autoconf-2.71 compatibility
Date: Mon, 8 Feb 2021 22:07:17 -0800
Message-ID: <20210209060717.69440-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While compiling with gcc option -D_FORTIFY_SOURCE=2 (by setting
DEBUG_BUILD = '1' in local.conf), the do_configure failed:
...
|configure: error: C preprocessor "i686-wrs-linux-gcc -E --sysroot=tmp-glibc/
work/core2-32-wrs-linux/ndpi/3.4-r0/recipe-sysroot  -m32 -march=core2
-mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security" fails sanity check
...

Drop AC_LANG_WERROR to workaround the failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-configure-drop-AC_LANG_WERROR.patch  | 29 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_3.4.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch

diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
new file mode 100644
index 000000000..b2a337ae6
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure-drop-AC_LANG_WERROR.patch
@@ -0,0 +1,29 @@
+From f3061fbc10aab9d0edec6964449af97658a993fc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 8 Feb 2021 19:25:52 -0800
+Subject: [PATCH] configure: drop AC_LANG_WERROR
+
+To workaround configure failure with gcc option `-D_FORTIFY_SOURCE=2'
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.seed | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.seed b/configure.seed
+index 9d1185f1..f87889ed 100644
+--- a/configure.seed
++++ b/configure.seed
+@@ -34,7 +34,6 @@ dnl>  AC_PROG_CC
+   AC_PROG_CXX
+   AC_PROG_CC_STDC
+ fi
+-AC_LANG_WERROR
+ AX_PTHREAD
+ 
+ NDPI_VERSION_SHORT="@NDPI_VERSION_SHORT@"
+-- 
+2.29.2
+
diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
index 1e4153779..256e2ca54 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
            file://0001-autogen.sh-not-generate-configure.patch \
+           file://0001-configure-drop-AC_LANG_WERROR.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.29.2

