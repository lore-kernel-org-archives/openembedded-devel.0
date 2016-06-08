Return-Path: <straka.derek@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2656960796
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 18:20:22 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id fg1so1015043pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 11:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6HHTnbj77Fh6z1Otu/8yohopDMghmxMCJuX9Dm/eSPQ=;
	b=d6Ng6s1kQJK+BU0tyqyLPVC31WejphVaWmXz7o5TkXFm+CA/OYDdcX3CYFDAoq8MDr
	OIPHrgdjIhnUAzaPNANfnkSZGVXwOcmeOG+ts4DjE9deOXCK4UUEUFmyWrXjQv2blAvd
	hrzXYGQBXYul8r4QRO5U8VbSCFmcey/LC6FmK9jmD0BhDh9Ij8hOtJUWIlz+v43FTlCI
	QEf37fF/X75EALe8pckMdlGaDUjtSH+wdQ7HlZPaRYtiaBr5USJg9x+nURCdkgo7YrMG
	Qh7dwbZ7CLxzpfkvX+4nVNtY9oA3Pd2+yL3lEPqQv0n2UUpT2HyLPsM2StinGtphgzsK
	IChg==
X-Gm-Message-State: ALyK8tIfU2s45yPdqfB1giXXV0dWF1HfMHO7N0IFHNGm3oVC91ttoBab8ZzlZvZ2ubZNcg==
X-Received: by 10.66.123.37 with SMTP id lx5mr7067184pab.101.1465410023130;
	Wed, 08 Jun 2016 11:20:23 -0700 (PDT)
Received: from localhost.localdomain ([192.55.54.58])
	by smtp.gmail.com with ESMTPSA id
	dr4sm4043359pac.11.2016.06.08.11.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 11:20:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 14:19:37 -0400
Message-Id: <1465409977-17140-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] geos: use std::isnan to support gcc6
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
X-List-Received-Date: Wed, 08 Jun 2016 18:20:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../geos/files/fix-gcc6-isnan.patch                | 22 ++++++++++++++++++++++
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch

diff --git a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch b/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
new file mode 100644
index 0000000..5c5fbd1
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
@@ -0,0 +1,22 @@
+--- geos-3.4.2/configure.in.orig	2016-06-08 17:46:43.002250304 +0000
++++ geos-3.4.2/configure.in	2016-06-08 17:57:36.342241606 +0000
+@@ -197,7 +197,7 @@
+ AC_LANG_PUSH([C++])
+ AC_CACHE_CHECK([for isnan], ac_cv_isnan,
+  [AC_TRY_LINK([#include <cmath>],
+- [double x; int y; y = isnan(x);],
++ [double x; int y; y = std::isnan(x);],
+  ac_cv_isnan=yes,
+  ac_cv_isnan=no
+ )])
+--- geos-3.4.2/include/geos/platform.h.in.orig	2016-06-08 14:06:53.910234182 -0400
++++ geos-3.4.2/include/geos/platform.h.in	2016-06-08 14:07:19.298233844 -0400
+@@ -84,7 +84,7 @@
+ #endif
+ 
+ #if defined(HAVE_ISNAN)
+-# define ISNAN(x) (isnan(x))
++# define ISNAN(x) (std::isnan(x))
+ #else
+ # if defined(_MSC_VER)
+ #  define ISNAN(x) _isnan(x)
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
index 3a9a028..7193f8f 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
@@ -1,6 +1,7 @@
 require geos.inc
 
-SRC_URI += "file://geos-config-Add-includedir-variable.patch"
+SRC_URI += "file://geos-config-Add-includedir-variable.patch \
+            file://fix-gcc6-isnan.patch"
 
 SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
 SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
-- 
1.9.1


