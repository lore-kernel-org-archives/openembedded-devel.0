Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E40C714D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 05:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8H5uhoA016675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:56:43 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 22:56:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 01:56:38 -0400
Message-ID: <f9381bf9bb70cb6ff496c3489edae44fba442f86.1410932659.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410932659.git.wenzong.fan@windriver.com>
References: <cover.1410932659.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-oe] talloc: fix swig dependencies
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
X-List-Received-Date: Wed, 17 Sep 2014 05:56:45 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* depens on swig-native to make sure that the talloc.i always be
  installed;

* remove relative path that from `swig -swiglib`:

    ${D}/usr/bin/../share -> ${D}/usr/share

  This prevents 'install' from creraing empty dir: ${D}${bindir};

* fix the path to talloc.i for separate build.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../install-swig-interface-in-SWINGLIBDIR.patch    |    2 +-
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch b/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
index e1339a0..635c60e 100644
--- a/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
+++ b/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
@@ -17,7 +17,7 @@ Index: talloc-2.0.1/talloc.mk
 -	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)`swig -swiglib` || true
 -	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 talloc.i $(DESTDIR)`swig -swiglib` || true
 +	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)/$(SWIGLIBDIR) || true
-+	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 talloc.i $(DESTDIR)/$(SWIGLIBDIR) || true
++	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 $(srcdir)/$(tallocdir)/talloc.i $(DESTDIR)/$(SWIGLIBDIR) || true
  
  doc:: talloc.3 talloc.3.html
  
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 48c0915..9cf3e43 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -18,10 +18,12 @@ PR = "r2"
 
 EXTRA_AUTORECONF = "--exclude=autopoint --exclude=aclocal"
 
+DEPENDS += "swig-native"
+
 do_install_prepend() {
     # Hack the way swig interface for talloc is installed
     # This hack is accompanied by install-swig-interface-in-SWINGLIBDIR.patch
-    type swig > /dev/null 2>&1 && SWIGLIBDIR=`swig -swiglib` && SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR || echo "No swig found"
+    type swig > /dev/null 2>&1 && SWIGLIBDIR=`swig -swiglib` && SWIGLIBDIR=`readlink -f ${SWIGLIBDIR}` && SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR || echo "No swig found"
 }
 
 do_install_append() {
@@ -29,7 +31,6 @@ do_install_append() {
     ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
     ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
     ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
-    rmdir ${D}${bindir}
 }
 
 PACKAGES += "${PN}-swig"
-- 
1.7.9.5


