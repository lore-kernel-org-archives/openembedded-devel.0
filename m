Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45302736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 04:11:35 +0000 (UTC)
Received: by obbgh1 with SMTP id gh1so8735294obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=161T5u/GE23AxOoY/DwqC+AAyblPPGDFYRYv6iiCuaI=;
	b=T794qKMJn6phSkYza7rCSM1U6Ryh36nNwGl0BOl1LjFcrY4x7kJDZS7Jy8GmHQvhY6
	3SWGgcLXrrUZWDZnJAQesdJN6vtaoSNwX0dPRpsEVy7NOUl71WTgOVWkcGEcGwyEwYRL
	Wc0HDI6AxDnbRdP3eY8LWvSTGAn8t2x1fgf2mxb/lGutKODhTMRYQldooc3F/WwvJ5md
	G6jHVqIkEB0gZ7dcsMluxHFYsbrzPLgpSW5Ah5I9ZkzYdOomEVUK3UUViWr+g59BGTgb
	R1+y6XvDksoXil3Pd8WSBxogRVUHSWoL3u+dsWEVwAPW+F2EJ/HMOwNBm24pVCv0DjdH
	7RIA==
X-Gm-Message-State: ALoCoQkyHGH/I2hPbtEaDvGee/rhqi34LctYbR7T3fa5bLk+UB1h8VlO023dMC3lDqr7tcjqJVLu
X-Received: by 10.60.133.82 with SMTP id pa18mr30842370oeb.63.1427775096238;
	Mon, 30 Mar 2015 21:11:36 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id v10sm8025488obo.19.2015.03.30.21.11.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Mar 2015 21:11:35 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 23:10:41 -0500
Message-Id: <1427775041-9330-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427775041-9330-1-git-send-email-gary.robertson@linaro.org>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
	<1427775041-9330-1-git-send-email-gary.robertson@linaro.org>
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
X-List-Received-Date: Tue, 31 Mar 2015 04:11:38 -0000

From: Mike Holmes <mike.holmes@linaro.org>

This patch adds a recipe for building the CUnit test framework libraries

Upstream Status - not applicable - recipe addition only

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
index 0000000..246a121
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
+SRC_URI = "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
+		file://fixup-install-docdir.patch;patch=1"
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
index 0000000..a9dc4bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
@@ -0,0 +1,36 @@
+From: "Mike Holmes" <mike.holmes@linaro.org>
+Date: Thu, 30 October 2014 16:21:03 -0500
+Subject: [PATCH] fixup-install-docdir
+
+The default configuration macros for CUnit install the documentation and
+header files in locations not consistent with the OE filesystem layout.
+This patch specifies new locations which are consistent with OE filesystems.
+
+Upstream Status - not applicable - customizes configs for OE build environment
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


