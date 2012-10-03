Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJPPO-0001Ve-6Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:54:42 +0200
Received: by ggnv1 with SMTP id v1so820038ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=5lSQiaUR+yr5Ht9lNw86w+pqSvErbgQ4GZAbEi1xIl0=;
	b=R3AgY+bcLsfdClL4p1iJe9kqQyuFREkrln48zbvFEmZ+PWh/8NqqqRbRFkX2hprrCW
	znqkw58dhbmuDR0VunIGGrevDZK2mhjcUtb40dHddJIxGJmS6AGeQT23uQyiBhl7HsCJ
	1S4sWYRNYs9ckJgh8UgrJajIchpXO/IxoXwhs/JAIkifWv3JqPOT+S4vyjXspg+3xZkI
	VmSF8a5ADLQm1kT/wOE8ZUH9wgpn7+IajU6lFLB4yA2uBhkNcUAXX8gkcFHRAO0tQE0U
	M8J37/2PcMGa8RNXJbtnyU4dkcbYdMouSnhXm/WvCZ+vp8VWCKPtQYo34lkJkcdnEdnz
	/V/Q==
Received: by 10.236.142.139 with SMTP id i11mr1855715yhj.24.1349271701818;
	Wed, 03 Oct 2012 06:41:41 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id l16sm3906857anm.6.2012.10.03.06.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 06:41:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 10:41:30 -0300
Message-Id: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 1/4] talloc: Fix swig interface install path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 13:54:42 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Using the way swig interface is installed leads to a bad path in ${D}.
The interface ended up in ${D}/${STAGING_DIR_NATIVE} which is wrong. The
fix is to define a variable in recipe which is used in install rule by
talloc.
As well, LICENSE variable  modified to reflect the real license:
LGPL-3.0

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../install-swig-interface-in-SWINGLIBDIR.patch    |   23 ++++++++++++++++++++
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |   17 ++++++++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch

diff --git a/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch b/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
new file mode 100644
index 0000000..e1339a0
--- /dev/null
+++ b/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
@@ -0,0 +1,23 @@
+Using the way swig interface is installed leads to a bad path in ${D}.
+The interface ended up in ${D}/${STAGING_DIR_NATIVE} which is wrong. The
+fix is to define a variable in recipe which is used in install rule by
+talloc.
+
+Upstream-Status: Inappropriate [build system specific]
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: talloc-2.0.1/talloc.mk
+===================================================================
+--- talloc-2.0.1.orig/talloc.mk	2009-10-11 16:42:24.000000000 +0300
++++ talloc-2.0.1/talloc.mk	2012-09-13 23:15:05.283539702 +0300
+@@ -23,8 +23,8 @@
+ 	${INSTALLCMD} -m 644 talloc.pc $(DESTDIR)$(libdir)/pkgconfig
+ 	if [ -f talloc.3 ];then ${INSTALLCMD} -d $(DESTDIR)$(mandir)/man3; fi
+ 	if [ -f talloc.3 ];then ${INSTALLCMD} -m 644 talloc.3 $(DESTDIR)$(mandir)/man3; fi
+-	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)`swig -swiglib` || true
+-	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 talloc.i $(DESTDIR)`swig -swiglib` || true
++	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)/$(SWIGLIBDIR) || true
++	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 talloc.i $(DESTDIR)/$(SWIGLIBDIR) || true
+ 
+ doc:: talloc.3 talloc.3.html
+ 
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index a69bd40..6aa5a9e 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -1,17 +1,19 @@
 DESCRIPTION = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://talloc.samba.org"
-LICENSE = "LGPL"
+LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
+           file://install-swig-interface-in-SWINGLIBDIR.patch \
+           "
 SRC_URI[md5sum] = "c6e736540145ca58cb3dcb42f91cf57b"
 SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd27c9b4"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PR = "r1"
+PR = "r2"
 
 # autoreconf doesn't work well while reconfiguring included libreplace
 do_configure () {
@@ -19,9 +21,18 @@ do_configure () {
        oe_runconf
 }
 
+do_install_prepend() {
+       # Hack the way swig interface for talloc is installed
+       # This hack is accompanied by install-swig-interface-in-SWINGLIBDIR.patch
+       type swig > /dev/null 2>&1 && SWIGLIBDIR=`swig -swiglib` && SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR || echo "No swig found"
+}
+
 do_install_append() {
        install -d ${D}${libdir}
        ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
        ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
        ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
 }
+
+PACKAGES += "${PN}-swig"
+FILES_${PN}-swig += "${datadir}"
-- 
1.7.2.5



