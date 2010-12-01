Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNlJ5-0007fB-C4
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 12:57:07 +0100
Received: by fxm17 with SMTP id 17so4528272fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 03:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ZNkft+z09iZKlX2ZVdeCgqyklklTJ343UlprAvXpW/k=;
	b=l7kXL/k3CEzlnjzfywJCQAr+dEoXYm7ahnH99TyBoic5p6FSsZ0iErOTySeRYcedE0
	OJYU0zNLXdMT8144HHCAN6qJTHSkTrIYx/lXKm2GOqfD5hzeU49A4IKzBowfhLzoJUJ1
	xhig8pcss47MsHqnkE/8QDEFJsmsVQvWhOdQI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tw/oKCBbZRgJzRbMmxR4W5eAoSLf7sJrP2xxpaEq8s7i7sPIA6Gf50pYNyqgrxAubm
	FojXFNECf7q2myafRRuoJNQBIfPeUYyOehUq85wqzRYE9O1opasHGTHRgjrfMx532BJb
	RbGt9T6382XHzL+4etOUYPQ5BSKrfsDaHIM94=
Received: by 10.223.69.136 with SMTP id z8mr1968567fai.104.1291204545772;
	Wed, 01 Dec 2010 03:55:45 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 17sm2029069far.19.2010.12.01.03.55.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 03:55:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 12:55:39 +0100
Message-Id: <1291204540-4644-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] e-wm, efl: create e-base.bbclass with common settings and EFL_SRCREV
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
X-List-Received-Date: Wed, 01 Dec 2010 11:57:08 -0000

* include it from e.bbclass, efl.bbclass and now also python-efl.inc
* also use BPN instead of "${@bb.data.getVar('PN', d, 1).replace('-native', '')}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/e-base.bbclass               |    8 ++++++++
 classes/e.bbclass                    |    9 +--------
 classes/efl.bbclass                  |    8 +-------
 conf/distro/include/sane-srcrevs.inc |    3 ---
 recipes/efl1/libeflvala_svn.bb       |    6 +++---
 recipes/python/python-efl.inc        |    6 ++----
 6 files changed, 15 insertions(+), 25 deletions(-)
 create mode 100644 classes/e-base.bbclass

diff --git a/classes/e-base.bbclass b/classes/e-base.bbclass
new file mode 100644
index 0000000..81f6b8a
--- /dev/null
+++ b/classes/e-base.bbclass
@@ -0,0 +1,8 @@
+HOMEPAGE = "http://www.enlightenment.org"
+SRCNAME ?= "${BPN}"
+
+EFL_SRCREV ?= "54714"
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http"
+S = "${WORKDIR}/${SRCNAME}"
+
+ARM_INSTRUCTION_SET = "arm"
diff --git a/classes/e.bbclass b/classes/e.bbclass
index 5db0749..88a1f6a 100644
--- a/classes/e.bbclass
+++ b/classes/e.bbclass
@@ -1,13 +1,6 @@
-HOMEPAGE = "http://www.enlightenment.org"
 SECTION = "e/apps"
-SRCNAME ?= "${PN}"
 
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http"
-S = "${WORKDIR}/${SRCNAME}"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig binconfig
+inherit e-base autotools pkgconfig binconfig
 
 do_prepsources () {
 	make clean distclean || true
diff --git a/classes/efl.bbclass b/classes/efl.bbclass
index f148e9c..518444e 100644
--- a/classes/efl.bbclass
+++ b/classes/efl.bbclass
@@ -1,17 +1,11 @@
 SECTION = "e/libs"
-HOMEPAGE = "http://www.enlightenment.org"
 LICENSE = "MIT BSD"
-SRCNAME = "${@bb.data.getVar('PN', d, 1).replace('-native', '')}"
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk;module=${SRCNAME};proto=http"
-S = "${WORKDIR}/${SRCNAME}"
 DEPENDS += "pkgconfig-native"
 
 # revision 0d93ec84b30bc1bee2caaee72d667f87bc468a70 made SRCDATE and hence PV go backwards, so we need to up PE to unbreak builds and feeds :(
 PE = "2"
 
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools
+inherit e-base autotools
 
 # evas-native looks at this var, so keep it
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 9531ae4..e69de29 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -1,3 +0,0 @@
-# only SRCREVs included in more recipes should be here, otherwise put sane SRCREV to recipe directly
-
-EFL_SRCREV ?= "54714"
diff --git a/recipes/efl1/libeflvala_svn.bb b/recipes/efl1/libeflvala_svn.bb
index 22159e6..35f6872 100644
--- a/recipes/efl1/libeflvala_svn.bb
+++ b/recipes/efl1/libeflvala_svn.bb
@@ -7,11 +7,11 @@ PV = "0.5.0+svnr${SRCPV}"
 PR = "r1"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
+SRCNAME = "vala"
 
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=vala;proto=http"
-S = "${WORKDIR}/vala"
+inherit e-base autotools pkgconfig vala
 
-inherit autotools pkgconfig vala
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=${SRCNAME};proto=http"
 
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
diff --git a/recipes/python/python-efl.inc b/recipes/python/python-efl.inc
index 1b4a88f..5fc6b9c 100644
--- a/recipes/python/python-efl.inc
+++ b/recipes/python/python-efl.inc
@@ -1,7 +1,6 @@
 DESCRIPTION = "${PN} bindings"
 LICENSE = "BSD"
 AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
-HOMEPAGE = "http://www.enlightenment.org"
 # NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
 # we need to build pyrex otherwise cython doesn't get called to build
 # the extension modules.
@@ -14,10 +13,9 @@ PR = "ml1"
 export BUILD_SYS
 export HOST_SYS
 
-inherit autotools pkgconfig distutils-base
+inherit e-base autotools pkgconfig distutils-base
 
-SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS/python;module=${PN};proto=http"
-S = "${WORKDIR}/${PN}"
+SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS/python;module=${SRCNAME};proto=http"
 
 do_configure_prepend() {
 	# prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
-- 
1.7.3.2



