Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 379117DDC2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 21:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451fpb5PsDz4D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 23:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557608967;
	bh=RC9di2KA806b+sxI42+/VU7fYcekq/of5FEauOizeps=;
	h=From:To:Subject:Date:From;
	b=FlfuU3apd9bzj3ERE6UdKTdcrKR/G6pIkxLhBYzgN1J7IXmrNYdfwU3IL2jl5Sa4Z
	QucV60ZT4hF1kQ5zkML9riMLdX6fBiRDPdc4HyhpjwlrT0l/SxkhdMpa8JKUnSsYw9
	v2lX9Z3IO8PPC9PHVx2WsnGiqcRHoKi7m2L+ijVzaPNFPs5QdlB7hBAJpOT9uSigfX
	zzPverHvmWDarVwsfea4/yggVAj8qVQipTiafTd2656g7tGuWd40CUdxej9VBjX5az
	nNjDPFes/ia5zEUnRsaeHr2XQ/7n8afOCR54GX+w8i+578RrLSiRjTyPKZyyRBdSci
	b6JYOIqINpXliPsL8BLQ+hVU6GUyulOJaUU7apRFRvf/o2JAU7O+Imyb4RBx0cYSlE
	vveyG/wp1JxIG5HBs0k7IncZR9BPRIzdDbO9YB+GNZHQDmpy5KF1U69csfqSz8705P
	XTvu60K7ln1N7h7Hn2irv8gw6PmOUuR6Eux0eBDgrkzeOruWPs/0rbQ2sz97gmLm24
	fTNhxD8gqc0scXMCXyi52jhIU+9KyUFxp06TT+8N09GIRdlzCDb2ZetJBnQUF9U79N
	i+J49FJiFgHLE28hcPf/TUPetBBfPPDRrQZomcUltRIANSVSRvs93pQzgZvL9mEf8z
	i4+dLZ1NBqfjEv4sD0uNLkFE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2019 00:09:26 +0300
Message-Id: <20190511210927.16928-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] geos: Upgrade 3.4.2 -> 3.4.3
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
X-List-Received-Date: Sat, 11 May 2019 21:09:27 -0000

Remove patch applied upstream.
The change in COPYING is due to updated FSF postal address.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../geos/files/fix-gcc6-isnan.patch           | 22 -------------------
 meta-oe/recipes-navigation/geos/geos.inc      |  2 +-
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb |  7 ------
 meta-oe/recipes-navigation/geos/geos_3.4.3.bb |  7 ++++++
 4 files changed, 8 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
 delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.3.bb

diff --git a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch b/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
deleted file mode 100644
index 5c5fbd1d9..000000000
--- a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- geos-3.4.2/configure.in.orig	2016-06-08 17:46:43.002250304 +0000
-+++ geos-3.4.2/configure.in	2016-06-08 17:57:36.342241606 +0000
-@@ -197,7 +197,7 @@
- AC_LANG_PUSH([C++])
- AC_CACHE_CHECK([for isnan], ac_cv_isnan,
-  [AC_TRY_LINK([#include <cmath>],
-- [double x; int y; y = isnan(x);],
-+ [double x; int y; y = std::isnan(x);],
-  ac_cv_isnan=yes,
-  ac_cv_isnan=no
- )])
---- geos-3.4.2/include/geos/platform.h.in.orig	2016-06-08 14:06:53.910234182 -0400
-+++ geos-3.4.2/include/geos/platform.h.in	2016-06-08 14:07:19.298233844 -0400
-@@ -84,7 +84,7 @@
- #endif
- 
- #if defined(HAVE_ISNAN)
--# define ISNAN(x) (isnan(x))
-+# define ISNAN(x) (std::isnan(x))
- #else
- # if defined(_MSC_VER)
- #  define ISNAN(x) _isnan(x)
diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
index 2e308b488..48721058d 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://trac.osgeo.org/geos/"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
deleted file mode 100644
index 7193f8fb5..000000000
--- a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require geos.inc
-
-SRC_URI += "file://geos-config-Add-includedir-variable.patch \
-            file://fix-gcc6-isnan.patch"
-
-SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
-SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.3.bb b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
new file mode 100644
index 000000000..538456cc2
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
@@ -0,0 +1,7 @@
+require geos.inc
+
+SRC_URI += "file://geos-config-Add-includedir-variable.patch \
+"
+
+SRC_URI[md5sum] = "77f2c2cca1e9f49bc1bece9037ac7a7a"
+SRC_URI[sha256sum] = "cfbf68079117c1c2b76411636444ff41d73c31093c4cab9dcc9a8c1bbe7e3897"
-- 
2.17.1


