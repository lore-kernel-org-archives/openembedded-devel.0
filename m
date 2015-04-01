Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id B1E2673C73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 21:50:50 +0000 (UTC)
Received: by obbfy7 with SMTP id fy7so16193931obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 14:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6zG1jBXmf2piOOPhbutpjWCwyXlFnIToYdu/MgTW3gg=;
	b=kwJHypDhICpuJtFlDLg4fGihuoU4eywVSOhKawZJBFMIEdNYKBpSHPxkQDubTMwwbW
	YY7YV0aBbSINuvMDVYfInqyb0C5QKWmqVupXHQcE4VrqZhX3wdz+H9M9QKZ6J+WZmgSa
	TJUx8SMpBrRhHjhWwAB4drlufEcbpm7jDbD6JBtV7wHntEM7SCKEY5G3bSpQ5bC3toKZ
	Zx+sOoXjrdF19BOdramkaCArIRhMxRByYloj8R/Tjshf0af33RpsoahfYTFZWlvJczNl
	fR71gHaBN+1U/J+dPIy4ilmE5X1/SYgpaZqjeh/hbKUdyWkt8ZayP+7rApDLVdcJ10ea
	DKgg==
X-Gm-Message-State: ALoCoQlWMf6TYfB6IS5Lct3Lf0SpRnIdKN/FORKL7KdgPC418FV9LRgSMunAwiCju/i2xXJxy/lb
X-Received: by 10.60.46.66 with SMTP id t2mr42330257oem.60.1427925050845;
	Wed, 01 Apr 2015 14:50:50 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id ud3sm2898046oeb.2.2015.04.01.14.50.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 14:50:49 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Wed,  1 Apr 2015 16:50:13 -0500
Message-Id: <1427925013-7492-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427925013-7492-1-git-send-email-gary.robertson@linaro.org>
References: <20150331070731.GI14928@jama>
	<1427925013-7492-1-git-send-email-gary.robertson@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] add CUnit test suite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 21:50:51 -0000

From: Mike Holmes <mike.holmes@linaro.org>

Adds a new recipe for building the CUnit test framework libraries

Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb      | 19 ++++++++++++
 .../cunit/files/fixup-install-docdir.patch         | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
 create mode 100644 meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
new file mode 100644
index 0000000..085f4be
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "CUnit is a C framework for unit testing. Test output supports comandline and GUI results reporting"
+HOMEPAGE = "http://cunit.sourceforge.net"
+LICENSE = "LGPL-2.0"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
+
+S = "${WORKDIR}/CUnit-${PV}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
+    file://fixup-install-docdir.patch"
+SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
+SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-console"
+
+FILES_${PN}-dev += "${datadir}/CUnit"
+FILES_${PN}-doc += "${docdir}"
diff --git a/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch b/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
new file mode 100644
index 0000000..c328227
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
@@ -0,0 +1,36 @@
+From: "Mike Holmes" <mike.holmes@linaro.org>
+Date: Thu, 30 October 2014 16:21:03 -0500
+Subject: [PATCH] fixup-install-docdir
+
+The default configuration macros for CUnit install the documentation and
+header files in locations not consistent with the OE filesystem layout.
+So here we specify new locations which are consistent with OE filesystems.
+
+Upstream-Status: Inappropriate - configuration for OE build environment
+
+Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+
+diff -uNr a/doc/headers/Makefile.am b/doc/headers/Makefile.am
+--- a/doc/headers/Makefile.am	2014-10-30 22:06:29.704574162 +0100
++++ b/doc/headers/Makefile.am	2014-10-30 22:07:43.578524791 +0100
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-dochdrdir = $(prefix)/doc/@PACKAGE@/headers
++dochdrdir = $(docdir)/headers
+ 
+ INCLUDE_FILES = \
+ 	Automated.h \
+diff -uNr a/doc/Makefile.am b/doc/Makefile.am
+--- a/doc/Makefile.am	2014-10-30 22:06:29.704574162 +0100
++++ b/doc/Makefile.am	2014-10-30 22:07:01.461412166 +0100
+@@ -1,7 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-docdir = $(prefix)/doc/@PACKAGE@
+-
+ doc_DATA = \
+ 	CUnit_doc.css \
+ 	error_handling.html \
-- 
1.9.1


