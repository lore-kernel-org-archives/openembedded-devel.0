Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NacNE-0006q2-T8
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 22:58:03 +0100
Received: by ewy5 with SMTP id 5so739339ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 13:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bn3xq46n1oL2JJGyDh2o/1lyGfj2KkOJGBpe2n6m8HY=;
	b=hmkz9aldLZccqjg8bGkdkvNzzUZrI7b9rtFP+Xcd3aYn94pbSu686zKHwctUZwjmRB
	0KJVORYFCJyikcJIsIL/cPucPXDdCUeEL8DMUi5CJwToLRSr50M8+4uVcqfv3Q0mdvAa
	4mu2aejv0jH3i0bIytUqB7WLgh0/nRoTZ9kus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IhAv24jav9YlVTd6hE+gT27SVZufUNnI02rIikI0OerFpM+8eCNd1KLMWLscPdbIqP
	ezfwlayMPuluYfFdXFVE6Ah47kplZe/2lKfXEpv8lTT0NUD+PK9cIIXi5n+42pr2a9C1
	vWqzqJGFJECByZgyBazi2KYJ1BI35wktSVUSI=
Received: by 10.216.90.138 with SMTP id e10mr1811084wef.150.1264715737887;
	Thu, 28 Jan 2010 13:55:37 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id 5sm32469eyf.2.2010.01.28.13.55.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 13:55:33 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2010 22:55:28 +0100
Message-Id: <1264715728-860-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel.bbclass only install image in do_deploy if not installing from packaged staging
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
X-List-Received-Date: Thu, 28 Jan 2010 21:58:04 -0000

install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
expandds to
install -m 0644 arch/arm/boot/uImage .../deploy/glibc/images/beagleboard/uImage-2.6.29-r51-beagleboard.bin
but of course arch/arm/boot/uImage does not exist since we are using packaged staging so we get
the error:
install: cannot stat `arch/arm/boot/uImage': No such file or directory
This patch only installs if not using packaged staging
---
 classes/kernel.bbclass                  |    4 +++-
 recipes/perl/perl-5.8.8/firsttime.patch |   15 +++++++++++++++
 recipes/perl/perl-native_5.8.8.bb       |    3 ++-
 recipes/perl/perl_5.8.8.bb              |    3 ++-
 4 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 recipes/perl/perl-5.8.8/firsttime.patch

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 53ea252..fa48a43 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -537,7 +537,9 @@ MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
 
 do_deploy() {
 	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if [ "$PSTAGING_ACTIVE" = "0" ]; then
+	    install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
+	fi
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${PKGD}/lib" ]; then
diff --git a/recipes/perl/perl-5.8.8/firsttime.patch b/recipes/perl/perl-5.8.8/firsttime.patch
new file mode 100644
index 0000000..bd09589
--- /dev/null
+++ b/recipes/perl/perl-5.8.8/firsttime.patch
@@ -0,0 +1,15 @@
+Index: perl-5.8.8/lib/CPAN/FirstTime.pm
+===================================================================
+--- perl-5.8.8.orig/lib/CPAN/FirstTime.pm
++++ perl-5.8.8/lib/CPAN/FirstTime.pm
+@@ -68,9 +68,7 @@ dialog anytime later by typing 'o conf i
+ 
+ ];
+ 
+-    my $manual_conf =
+-	ExtUtils::MakeMaker::prompt("Are you ready for manual configuration?",
+-				    "yes");
++    my $manual_conf = "no";
+     my $fastread;
+     {
+       local $^W;
diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native_5.8.8.bb
index 60a5cf5..a9c66e8 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -15,7 +15,8 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
            file://native-no-gdbminc.patch;patch=1 \
            file://native-perlinc.patch;patch=1 \
            file://makedepend-dash.patch;patch=1 \
-           file://asm-pageh-fix.patch;patch=1"
+           file://asm-pageh-fix.patch;patch=1 \
+           file://firsttime.patch;patch=1"
 
 S = "${WORKDIR}/perl-${PV}"
 
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index edd3a83..200e70c 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r31"
+PR = "r32"
 
 # Major part of version
 PVM = "5.8"
@@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
         file://64_debian_enc2xs_inc.patch;patch=1 \
         file://asm-pageh-fix.patch;patch=1 \
         file://shared-ldflags.patch;patch=1 \
+        file://firsttime.patch;patch=1 \
         file://config.sh \
         file://config.sh-32 \
         file://config.sh-32-le \
-- 
1.6.4.2



