Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PppYc-0001GX-PI
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:09:10 +0100
Received: by mail-yx0-f175.google.com with SMTP id 5so818676yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Fnh4/cWEFlmr0a4XQSNwW0zO+Q8u8FPyhSg5t/4ZbSc=;
	b=rhIv/M3DvYGzIOu8GEafEP/rX4vQpUJUHVR8gcjEbSky/M8oHS+kLMA7WOhskXTF0M
	VlChh34qjC6ovxvV4SajB9C1pK+vb0YysjIRz7LfCTO82vgKpl32tsfe7okGgqOcsBRz
	ikmPRnqeNsVlWy9GZUb/ROiynTJ6kkYq19P2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lw1VSBAT5ev9C4EbVUU25mbfb9O2OaLyzfRUJvu679FHBy5xCJ+WuQNiMK6a2uZczb
	1k5ncl/gO1RcgwRYBj0aZFq83T/YiS+p/H3o95aOXLohOefHXjj2gV+0TV41+zpWDxN0
	lTQa0mON6JMF+Vz1vtTyhAHsdvPw5vK9PUCgY=
Received: by 10.150.135.17 with SMTP id i17mr1397977ybd.233.1297894081134;
	Wed, 16 Feb 2011 14:08:01 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u27sm399093yba.3.2011.02.16.14.07.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:08:00 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 15:07:43 -0700
Message-Id: <1297894063-27374-4-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] autotools: avoid special casing autoconf/automake/help2man
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
X-List-Received-Date: Wed, 16 Feb 2011 22:09:11 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass           |    6 +-----
 recipes/autoconf/autoconf.inc       |    3 ++-
 recipes/automake/automake.inc       |    4 +---
 recipes/help2man/help2man_1.36.4.bb |    6 +-----
 recipes/help2man/help2man_1.38.2.bb |    6 +-----
 5 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index dd52e03..eaeca7f 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -13,13 +13,9 @@ def autotools_deps(d):
     if oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', d):
         return deps
 
-    pn = bb.data.getVar('PN', d, 1)
-    if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
-        return deps
-
     deps += ' autoconf-native automake-native help2man-native'
 
-    if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
+    if d.getVar('BPN', True) != 'libtool':
         deps += ' libtool-native'
         if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
                                   'sdk') and
diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 7f22c2b..d13b61e 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -5,8 +5,9 @@ HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS += "m4-native perl-native"
 RDEPENDS_${PN} = "m4 perl gnu-config"
-DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
+DEPENDS_virtclass-native = "m4-native perl-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native perl-native"
+INHIBIT_AUTOTOOLS_BOOTSTRAP_virtclass-native = "true"
 
 INC_PR = "r13"
 
diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.inc
index de4df34..6ed21cd 100644
--- a/recipes/automake/automake.inc
+++ b/recipes/automake/automake.inc
@@ -28,6 +28,7 @@ RDEPENDS_automake += "\
     perl-module-strict \
     perl-module-text-parsewords \
     perl-module-vars "
+INHIBIT_AUTOTOOLS_BOOTSTRAP_virtclass-native = "true"
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2;name=automake"
 INC_PR = "r4"
 AUTOMAKE_API = "${@".".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
@@ -36,9 +37,6 @@ inherit autotools
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
 
-do_configure_append() {
-}
-
 do_install_append () {
 	autotools_do_install
 	# replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
diff --git a/recipes/help2man/help2man_1.36.4.bb b/recipes/help2man/help2man_1.36.4.bb
index 8cb5530..8cd4475 100644
--- a/recipes/help2man/help2man_1.36.4.bb
+++ b/recipes/help2man/help2man_1.36.4.bb
@@ -5,6 +5,7 @@ LICENSE     = "GPLv2"
 DEPENDS     = "gettext-native perl-native liblocale-gettext-perl-native"
 DEPENDS_virtclass-native = "perl-native autoconf-native automake-native"
 RDEPENDS_${PN}    = "gettext perl liblocale-gettext-perl"
+INHIBIT_AUTOTOOLS_BOOTSTRAP = "true"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -16,11 +17,6 @@ BBCLASSEXTEND = "native"
 
 PR = "r3"
 
-# We don't want to reconfigure things
-do_configure() {
-	oe_runconf
-}
-
 do_install_append () {
 	# Make sure we use /usr/bin/env perl
 	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
diff --git a/recipes/help2man/help2man_1.38.2.bb b/recipes/help2man/help2man_1.38.2.bb
index ab06186..795bad6 100644
--- a/recipes/help2man/help2man_1.38.2.bb
+++ b/recipes/help2man/help2man_1.38.2.bb
@@ -5,6 +5,7 @@ DEPENDS = "gettext-native perl-native liblocale-gettext-perl-native"
 DEPENDS_virtclass-native = "perl-native autoconf-native automake-native"
 RDEPENDS_${PN} = "gettext perl liblocale-gettext-perl"
 RDEPENDS_${PN}_virtclass-native = ""
+INHIBIT_AUTOTOOLS_BOOTSTRAP = "true"
 PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
@@ -18,11 +19,6 @@ EXTRA_OECONF = "--disable-nls"
 
 BBCLASSEXTEND = "native"
 
-# We don't want to reconfigure things
-do_configure() {
-	oe_runconf
-}
-
 do_install_append () {
 	# Make sure we use /usr/bin/env perl
 	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
-- 
1.7.2.3



