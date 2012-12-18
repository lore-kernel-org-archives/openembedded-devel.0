Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g0-00071r-Vm
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:09:59 +0100
Received: by mail-ee0-f52.google.com with SMTP id d17so474402eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=W8bSAexj1S4/15yadVZUqfZU+lPgBk7Rvep8uCrRiMU=;
	b=MfAYEcXfMi6dafedDRZpQxILmVbjsevQI4gNZoUrWQN24o6dYREq0fyWzHZlH5dSyR
	czq26V+I6J3X5pTGiIWwstzuxuk5c3ij8pFelAB+LL69yMmvqSkouiE6tf9FgVT31w8o
	L+EO+X7twK1vQOFh0ABR2awz7A4vp7M5yOQqeKv4uJU8pfnRgDqA4qtXJjy/THMCIoM1
	CjSvYHIwKY9C8djRW0irMcgZ0OQHdREyKBvODJucwuXfB8Ni7WLBLtJ4RTD9dNF4pP64
	cF+Vzl20rIpGrnZnx5O+wWb2V9ByJ9CnjpQOkfAQGl7K+Bybs5w9FZrdqoxNtMPnFiIG
	lR5A==
X-Received: by 10.14.215.197 with SMTP id e45mr7323244eep.0.1355849715254;
	Tue, 18 Dec 2012 08:55:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm4252647eek.0.2012.12.18.08.55.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:02 +0100
Message-Id: <9f7427199a88b1e9ad92780ab44e0499c01c96fd.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/10] krb5: fix path to recipe and upgrade to 1.11
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

* drop PR
* fix FILES_${PN}-doc
* fix QA warnings:
  WARNING: QA Issue: krb5: Files/directories were installed but not
  shipped
    /usr/share/gnats
    /usr/share/gnats/mit
  and RPATH entries

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/krb5/krb5_1.11.bb         | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/krb5/krb5_1.8.5.bb => meta-oe/recipes-connectivity/krb5/krb5_1.11.bb (48%)

diff --git a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
similarity index 48%
rename from meta/recipes-connectivity/krb5/krb5_1.8.5.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index 2f497a3..b1bb32a 100644
--- a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -1,18 +1,19 @@
 DESCRIPTION = "A network authentication protocol"
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
-PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../README;md5=5595a75ae6fab5f825f579a817baa618"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=e8fad1d174de32f8da0ddc56b67b6941"
 DEPENDS = "ncurses util-linux e2fsprogs-native"
 
 inherit autotools binconfig perlnative
 
-SRC_URI = "http://web.mit.edu/kerberos/dist/krb5/1.8/krb5-1.8.5-signed.tar"
+SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar"
+SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
+SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456a78651"
 
-S = "${WORKDIR}/${PN}-${PV}/src/"
+S = "${WORKDIR}/${P}/src/"
 
-EXTRA_OECONF += " --without-tcl --with-system-et"
+EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"
@@ -20,20 +21,19 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
 CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
 LDFLAGS_append += "-lpthread"
 
-FILES_${PN}-doc += ${datadir}/examples
+FILES_${PN}-doc += "${datadir}/examples"
+FILES_${PN} += "${datadir}/gnats"
 
 krb5_do_unpack() {
-	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
+    # ${P}-signed.tar contains ${P}.tar.gz.asc and ${P}.tar.gz
+    tar xzf ${WORKDIR}/${P}.tar.gz -C ${WORKDIR}/
 }
 
 python do_unpack() {
-	bb.build.exec_func('base_do_unpack', d)
-	bb.build.exec_func('krb5_do_unpack', d)
+    bb.build.exec_func('base_do_unpack', d)
+    bb.build.exec_func('krb5_do_unpack', d)
 }
 
 do_configure() {
 	oe_runconf
 }
-
-SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
-SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
-- 
1.8.0.2



