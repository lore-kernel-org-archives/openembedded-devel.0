Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcNA-00059H-Cn
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:27:24 +0100
Received: by pwi8 with SMTP id 8so11282pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=hZlQnz5kbG71TXSyAcUBCDgLm//mMQdJGkd3IIGtjJI=;
	b=QMOeYHWY5Sa3SFCkiT/I/HIxNr1Gmd1QsiChgIukHVl1DZ5cKcgMoU9QUHqFM6lXsx
	LQ71boQnuedoXniuSQTmiQbFxyHUh/qCxYQHXQNwRcV8RlsRXqquI74tvxWei+eLap7l
	NT1/ctvOoF3w/Z2nFKJQznduoMkvc73S5ApAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gAY30h8DXPD0fV81fHJoxo5kTvmaw68o/k5vCQNGM7fPocld4pRWOGlcKCyNo4Ky+Q
	VwVLXNjhdk3yls6HPPhEFEtUmaSI8skQfKEBU17vX1gZIb33plrGwv5RR7NHVE9XSxIq
	cIewUVVQM6PuOpmRjrWgnd9CrWgpfZKwsyClg=
Received: by 10.142.90.10 with SMTP id n10mr4832976wfb.51.1295936793914;
	Mon, 24 Jan 2011 22:26:33 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.26.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:26:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:45 -0800
Message-Id: <1295936745-718-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 9/9] Recipes: Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Tue, 25 Jan 2011 06:27:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../blueprobe/files/blueprobe-svn-Makefile.patch   |    4 ++--
 recipes/gpe-today/files/Makefile.dpkg_ipkg         |    2 +-
 recipes/gpe-today/files/Makefile.translation       |    4 ++--
 recipes/libxsettings/files/Makefile.dpkg_ipkg      |    2 +-
 recipes/libxsettings/files/Makefile.translation    |    4 ++--
 recipes/masqmail/masqmail_0.2.21.bb                |    2 +-
 recipes/meta/canadian-sdk.bb                       |    2 +-
 recipes/meta/meta-toolchain.bb                     |    2 +-
 recipes/meta/nylon-feed.bb                         |    2 +-
 recipes/xserver-common/files/Makefile.dpkg_ipkg    |    2 +-
 recipes/xserver-common/files/Makefile.translation  |    4 ++--
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/recipes/blueprobe/files/blueprobe-svn-Makefile.patch b/recipes/blueprobe/files/blueprobe-svn-Makefile.patch
index b51b465..a6d4f24 100644
--- a/recipes/blueprobe/files/blueprobe-svn-Makefile.patch
+++ b/recipes/blueprobe/files/blueprobe-svn-Makefile.patch
@@ -99,7 +99,7 @@ diff -Naur blueprobe.orig/Makefile.dpkg_ipkg blueprobe/Makefile.dpkg_ipkg
 +	if test -e familiar/postrm;    then install familiar/postrm    familiar/dist/CONTROL; fi
 +	$(MAKE) DESTDIR=`pwd`/familiar/dist PREFIX=/usr prefix=/usr DEBUG=no install-program
 +	rm -rf familiar/dist.list
-+	ipkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
++	opkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
 +	if [ "x$(LINGUAS)" != "x" ]; then make translation-ipkg; tr ' ' '\n' < translation-ipkgs.txt >> familiar/dist.list; fi
 +	md5sum `cat familiar/dist.list` > $(PACKAGE)_$(VERSION).batch
 +	rm -rf familiar/dist familiar/dist.list
@@ -146,7 +146,7 @@ diff -Naur blueprobe.orig/Makefile.translation blueprobe/Makefile.translation
 +CONTROL = `if test -e familiar/control1; then echo control1; else echo control; fi`
 +
 +# use ipkg-build or ipkg-deb-build
-+IPKG_BUILD := ipkg-build
++IPKG_BUILD := opkg-build
 +
 +TRANSLATION_SITE := http://www.iro.umontreal.ca/~gnutra/maint
 +
diff --git a/recipes/gpe-today/files/Makefile.dpkg_ipkg b/recipes/gpe-today/files/Makefile.dpkg_ipkg
index 978b08d..ebf41fe 100644
--- a/recipes/gpe-today/files/Makefile.dpkg_ipkg
+++ b/recipes/gpe-today/files/Makefile.dpkg_ipkg
@@ -74,7 +74,7 @@ ipkg: check-source ipkg-prep clean
 	if test -e familiar/postrm;    then install familiar/postrm    familiar/dist/CONTROL; fi
 	$(MAKE) DESTDIR=`pwd`/familiar/dist PREFIX=/usr prefix=/usr DEBUG=no install-program
 	rm -rf familiar/dist.list
-	ipkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
+	opkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
 	if [ "x$(LINGUAS)" != "x" ]; then make translation-ipkg; tr ' ' '\n' < translation-ipkgs.txt >> familiar/dist.list; fi
 	md5sum `cat familiar/dist.list` > $(PACKAGE)_$(VERSION).batch
 	rm -rf familiar/dist familiar/dist.list
diff --git a/recipes/gpe-today/files/Makefile.translation b/recipes/gpe-today/files/Makefile.translation
index 1ca7d64..6ce30b4 100644
--- a/recipes/gpe-today/files/Makefile.translation
+++ b/recipes/gpe-today/files/Makefile.translation
@@ -2,8 +2,8 @@
 
 CONTROL = `if test -e familiar/control1; then echo control1; else echo control; fi`
 
-# use ipkg-build or ipkg-deb-build
-IPKG_BUILD := ipkg-build
+# use opkg-build or opkg-deb-build
+IPKG_BUILD := opkg-build
 
 TRANSLATION_SITE := http://www.iro.umontreal.ca/~gnutra/maint
 
diff --git a/recipes/libxsettings/files/Makefile.dpkg_ipkg b/recipes/libxsettings/files/Makefile.dpkg_ipkg
index 76c5321..771ed8b 100644
--- a/recipes/libxsettings/files/Makefile.dpkg_ipkg
+++ b/recipes/libxsettings/files/Makefile.dpkg_ipkg
@@ -74,7 +74,7 @@ ipkg: check-source ipkg-prep clean
 	if test -e familiar/postrm;    then install familiar/postrm    familiar/dist/CONTROL; fi
 	$(MAKE) DESTDIR=`pwd`/familiar/dist PREFIX=/usr prefix=/usr DEBUG=no install-program
 	rm -rf familiar/dist.list
-	ipkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
+	opkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
 	if [ "x$(LINGUAS)" != "x" ]; then make translation-ipkg; tr ' ' '\n' < translation-ipkgs.txt >> familiar/dist.list; fi
 	md5sum `cat familiar/dist.list` > $(PACKAGE)_$(VERSION).batch
 	rm -rf familiar/dist familiar/dist.list
diff --git a/recipes/libxsettings/files/Makefile.translation b/recipes/libxsettings/files/Makefile.translation
index 1ca7d64..6ce30b4 100644
--- a/recipes/libxsettings/files/Makefile.translation
+++ b/recipes/libxsettings/files/Makefile.translation
@@ -2,8 +2,8 @@
 
 CONTROL = `if test -e familiar/control1; then echo control1; else echo control; fi`
 
-# use ipkg-build or ipkg-deb-build
-IPKG_BUILD := ipkg-build
+# use opkg-build or opkg-deb-build
+IPKG_BUILD := opkg-build
 
 TRANSLATION_SITE := http://www.iro.umontreal.ca/~gnutra/maint
 
diff --git a/recipes/masqmail/masqmail_0.2.21.bb b/recipes/masqmail/masqmail_0.2.21.bb
index 94a742d..e632239 100644
--- a/recipes/masqmail/masqmail_0.2.21.bb
+++ b/recipes/masqmail/masqmail_0.2.21.bb
@@ -25,7 +25,7 @@ MAIL_GROUP ?= "mail"
 EXTRA_OECONF += "--with-user=$(id -u)"
 EXTRA_OECONF += "--with-group=$(id -g)"
 
-IPKGBUILDCMD = "ipkg-build -o ${MAIL_USER} -g ${MAIL_GROUP}"
+OPKGBUILDCMD = "opkg-build -o ${MAIL_USER} -g ${MAIL_GROUP}"
 
 SRC_URI[md5sum] = "7e989a8b0562054aea22c654507f2cb5"
 SRC_URI[sha256sum] = "2257099c760c12daf094744c6b2269d476e3bc6b523366168ad81bdd2ebd2445"
diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 93b80b2..0d914f7 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -91,7 +91,7 @@ do_populate_sdk() {
 			if [ -e $pkgnames ]; then
 				oenote "Found $pkgnames"
 				cp $pkgnames ${SDK_OUTPUT}/${prefix}/ipk/
-				orig_pkg=`ipkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
+				orig_pkg=`opkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
 				pkg_subdir=$arch${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}
 				mkdir -p ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime
 				cp ${STAGING_DIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index b8ea037..3462b2c 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -96,7 +96,7 @@ do_populate_sdk() {
 			if [ -e $pkgnames ]; then
 				oenote "Found $pkgnames"
 				cp $pkgnames ${SDK_OUTPUT2}/${SDKPATH}/ipk/
-				orig_pkg=`ipkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
+				orig_pkg=`opkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
 				pkg_subdir=$arch${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}
 				mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/$pkg_subdir/runtime
 				cp ${TMPDIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/$pkg_subdir/
diff --git a/recipes/meta/nylon-feed.bb b/recipes/meta/nylon-feed.bb
index d5759ae..d68f5f8 100644
--- a/recipes/meta/nylon-feed.bb
+++ b/recipes/meta/nylon-feed.bb
@@ -39,7 +39,7 @@ RDEPENDS = "${NYLON_FEED} \
 
 do_index() {
 	touch ${DEPLOY_DIR_IPK}/Packages
-	ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
+	opkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
 }
 
 addtask index before do_build after do_install
diff --git a/recipes/xserver-common/files/Makefile.dpkg_ipkg b/recipes/xserver-common/files/Makefile.dpkg_ipkg
index 76c5321..771ed8b 100644
--- a/recipes/xserver-common/files/Makefile.dpkg_ipkg
+++ b/recipes/xserver-common/files/Makefile.dpkg_ipkg
@@ -74,7 +74,7 @@ ipkg: check-source ipkg-prep clean
 	if test -e familiar/postrm;    then install familiar/postrm    familiar/dist/CONTROL; fi
 	$(MAKE) DESTDIR=`pwd`/familiar/dist PREFIX=/usr prefix=/usr DEBUG=no install-program
 	rm -rf familiar/dist.list
-	ipkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
+	opkg-build -o 0 -g 0 familiar/dist | sed 's/^Packaged .*into //; t 1; d; : 1; s:.*/::' >> familiar/dist.list
 	if [ "x$(LINGUAS)" != "x" ]; then make translation-ipkg; tr ' ' '\n' < translation-ipkgs.txt >> familiar/dist.list; fi
 	md5sum `cat familiar/dist.list` > $(PACKAGE)_$(VERSION).batch
 	rm -rf familiar/dist familiar/dist.list
diff --git a/recipes/xserver-common/files/Makefile.translation b/recipes/xserver-common/files/Makefile.translation
index 1ca7d64..6ce30b4 100644
--- a/recipes/xserver-common/files/Makefile.translation
+++ b/recipes/xserver-common/files/Makefile.translation
@@ -2,8 +2,8 @@
 
 CONTROL = `if test -e familiar/control1; then echo control1; else echo control; fi`
 
-# use ipkg-build or ipkg-deb-build
-IPKG_BUILD := ipkg-build
+# use opkg-build or opkg-deb-build
+IPKG_BUILD := opkg-build
 
 TRANSLATION_SITE := http://www.iro.umontreal.ca/~gnutra/maint
 
-- 
1.7.0.4



