Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15CBC001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:29:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.949.1689139775304271069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=mHF6e83Y;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6A56E0002
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139773;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=h7TKwHiqcbfJG3TJZGaYhwvWaXaA9H/LnuSZ3JuHnlI=;
	b=mHF6e83YRvfB54eaDhlIS9pqLSBAVmESDxtK96kJzxWxLr/3fD9zRHRFtz4UW7LXx6yZck
	1iQXABw/yst1yYaSaMC/r8jwERWTnfKiMPAblTHKAlLIBzxa+6dAviACMDDearAaMKB50E
	E6GnqTYhIRgWds6k9qwTjHEA9chER2ADKRnLgjQIS4OUimgBmL2KkSKzGQU0tIVm9PAa6c
	Z4HSyZ7eYxXDViIWK3oAZZjscf1xmrSpdY1GX8ODKn+y+DYXkuXlP/Semgk8sqD+/y4lFg
	9/ZkxVdvrKB8PWb8/rfdXdvhJo3znf9OtRERje56YOdfyg1RIClqqAZV6tglww==
Content-Type: multipart/mixed; boundary="===============4067249409309588284=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-alembic: upgrading to 1.11.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103739
Message-Id: <20230712052940.A15CBC001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:29:40 +0000 (UTC)

--===============4067249409309588284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-alembic* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alembic-upgrade-1.10.4-1.11.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c27dc0d1d0e534b5875dae094d3d341339fb125b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:23:11 -0500
Subject: [PATCH] python3-alembic: upgrade 1.10.4 -> 1.11.1

---
 .../libio/libio-socket-ssl-perl_2.078.bb      | 56 -------------------
 .../libmodule-build-tiny-perl_0.045.bb        | 53 ------------------
 meta-perl/recipes-perl/po4a/po4a_0.49.bb      | 33 -----------
 ...ic_1.10.4.bb => python3-alembic_1.11.1.bb} |  2 +-
 4 files changed, 1 insertion(+), 143 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
 delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
 delete mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb
 rename meta-python/recipes-devtools/python/{python3-alembic_1.10.4.bb => python3-alembic_1.11.1.bb} (81%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
deleted file mode 100644
index ff2559b8a..000000000
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Perl library for transparent SSL"
-DESCRIPTION = "This module is a true drop-in replacement for IO::Socket::INET that \
-uses SSL to encrypt data before it is transferred to a remote server \
-or client. IO::Socket::SSL supports all the extra features that one \
-needs to write a full-featured SSL client or server application: \
-multiple SSL contexts, cipher selection, certificate verification, and \
-SSL version selection. As an extra bonus, it works perfectly with \
-mod_perl."
-HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
-SECTION = "libs"
-
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
-
-RDEPENDS:${PN} += "\
-    libmozilla-ca-perl \
-    libnet-ssleay-perl \
-    perl-module-autoloader \
-    perl-module-io-socket \
-    perl-module-scalar-util \
-"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
-
-S = "${WORKDIR}/IO-Socket-SSL-${PV}"
-
-inherit cpan ptest-perl
-
-do_install:append () {
-    mkdir -p ${D}${docdir}/${PN}/
-    cp ${S}/BUGS ${D}${docdir}/${PN}/
-    cp ${S}/Changes ${D}${docdir}/${PN}/
-    cp ${S}/README ${D}${docdir}/${PN}/
-    cp -pRP ${S}/docs ${D}${docdir}/${PN}/
-    cp -pRP ${S}/certs ${D}${docdir}/${PN}/
-    cp -pRP ${S}/example ${D}${docdir}/${PN}/
-}
-
-RDEPENDS:${PN}-ptest += "\
-    libnet-libidn-perl \
-    liburi-perl \
-    perl-module-file-glob \
-    perl-module-findbin \
-    perl-module-io-socket-inet \
-    perl-module-io-socket-ip \
-    perl-module-perlio \
-    perl-module-perlio-scalar \
-    perl-module-test-more \
-"
-
-do_install_ptest:append () {
-    cp -r ${B}/certs ${D}${PTEST_PATH}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
deleted file mode 100644
index 17ee50d7c..000000000
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-SECTION = "libs"
-
-HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
-
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
-
-DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
-
-S = "${WORKDIR}/Module-Build-Tiny-${PV}"
-
-inherit cpan_build
-
-do_install () {
-        cpan_build_do_install
-}
-
-RDEPENDS:${PN} = " libextutils-config-perl \
-                   libextutils-helpers-perl \
-                   libextutils-installpaths-perl \
-                   perl-module-xsloader \
-                   perl-module-file-spec \
-                   perl-module-io-handle \
-                   perl-module-tap-harness-env \
-                   perl-module-ipc-open3 \
-                   perl-module-file-path \
-                   perl-module-cpan \
-                   perl-module-extutils-cbuilder \
-                   perl-module-getopt-long \
-                   perl-module-extutils-makemaker \
-                   perl-module-exporter \
-                   perl-module-carp \
-                   perl-module-test-more \
-                   perl-module-text-parsewords \
-                   perl-module-load \
-                   perl-module-file-temp \
-                   perl-module-data-dumper \
-                   perl-module-extutils-parsexs \
-                   perl-module-pod-man \
-                   perl-module-json-pp \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
deleted file mode 100644
index 679ea0fb4..000000000
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "PO for anything"
-DESCRIPTION = "The po4a (PO for anything) project goal is to ease translations \
-(and more interestingly, the maintenance of translations) using gettext tools \
-on areas where they were not expected like documentation."
-HOMEPAGE = "https://po4a.alioth.debian.org"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
-
-SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
-
-# v0.49
-SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = " \
-    libmodule-build-perl-native \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-RRECOMMENDS:${PN} = " \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-inherit cpan_build
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
index 071f40bb0..feb2c419b 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "295b54bbb92c4008ab6a7dcd1e227e668416d6f84b98b3c4446a2bc6214a556b"
+SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


--===============4067249409309588284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm64.txt"

Loading cache...done.
Loaded 12567 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 381 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux-musl"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 356 Local 91 Mirrors 236 Missed 29 Current 79 (91% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 86 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 88 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 93 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 98 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 103 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 104 of 435 (/home/auh/Projects/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 118 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 119 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 122 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 123 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 124 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 128 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 129 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 131 of 435 (/home/auh/Projects/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 177 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 185 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_fetch)
NOTE: Running task 186 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 187 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_fetch)
NOTE: Running task 188 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_fetch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_fetch: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 189 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_fetch: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_fetch: Started
NOTE: Running task 191 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_unpack)
NOTE: Running task 192 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 196 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_unpack)
NOTE: Running task 197 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_unpack)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 223 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 202 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_unpack: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 203 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_unpack)
NOTE: recipe python3-editor-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 204 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 241 of 435 (/home/auh/Projects/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 255 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 248 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_unpack)
NOTE: recipe gcc-cross-aarch64-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Started
NOTE: recipe gcc-cross-aarch64-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 435 (/home/auh/Projects/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 435 (/home/auh/Projects/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 435 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 435 (/home/auh/Projects/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 435 (/home/auh/Projects/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 435 (/home/auh/Projects/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 435 (/home/auh/Projects/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 435 (/home/auh/Projects/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 435 (/home/auh/Projects/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 435 (/home/auh/Projects/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 435 (/home/auh/Projects/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 435 (/home/auh/Projects/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 435 (/home/auh/Projects/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 435 (/home/auh/Projects/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 435 (/home/auh/Projects/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 435 (/home/auh/Projects/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 435 (/home/auh/Projects/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 435 (/home/auh/Projects/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 435 (/home/auh/Projects/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 435 (/home/auh/Projects/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 435 (/home/auh/Projects/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 435 (/home/auh/Projects/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 435 (/home/auh/Projects/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 435 (/home/auh/Projects/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 435 (/home/auh/Projects/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 435 (/home/auh/Projects/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 435 (/home/auh/Projects/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 435 (/home/auh/Projects/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 435 (/home/auh/Projects/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 435 (/home/auh/Projects/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 435 (/home/auh/Projects/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 435 (/home/auh/Projects/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 435 (/home/auh/Projects/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 435 (/home/auh/Projects/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 435 (/home/auh/Projects/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 435 (/home/auh/Projects/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 435 (/home/auh/Projects/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 435 (/home/auh/Projects/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 435 (/home/auh/Projects/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 435 (/home/auh/Projects/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 435 (/home/auh/Projects/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-aarch64-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-aarch64-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-aarch64-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-aarch64-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1176 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_patch)
NOTE: Running task 1191 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_patch)
NOTE: Running task 1192 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: Running task 1193 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_patch)
NOTE: Running task 1194 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_patch)
NOTE: Running task 1231 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1279 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1280 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1281 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1282 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1307 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_patch)
NOTE: Running task 1309 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_patch)
NOTE: Running task 1324 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-alembic-1.11.1-r0: task do_patch: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_patch: Started
NOTE: Running task 1347 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alembic-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1418 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_patch: Succeeded
NOTE: Running task 1419 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-alembic-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1442 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-editor-1.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1444 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_configure)
NOTE: Running task 1445 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_configure)
NOTE: recipe python3-alembic-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1446 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_configure)
NOTE: recipe python3-editor-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1447 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_configure)
NOTE: Running task 1448 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_configure: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_configure)
NOTE: recipe python3-alembic-1.11.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Started
NOTE: Running task 1450 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: Running task 1451 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_compile)
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_compile)
NOTE: recipe python3-alembic-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1454 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_compile)
NOTE: Running task 1455 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_compile: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_compile)
NOTE: recipe python3-alembic-1.11.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_compile: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_compile: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_install)
NOTE: Running task 1459 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_install)
NOTE: Running task 1460 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: Running task 1461 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_install)
NOTE: Running task 1462 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_install)
NOTE: recipe python3-editor-1.0.4-r0: task do_install: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_install: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_install)
NOTE: recipe python3-editor-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1464 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_package)
NOTE: recipe python3-pygments-2.15.1-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_install: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_package)
NOTE: Running task 1466 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_package)
NOTE: Running task 1467 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-editor-1.0.4-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 1468 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_package)
NOTE: Running task 1469 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1470 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1471 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata)
NOTE: recipe python3-editor-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 1472 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_packagedata)
NOTE: recipe python3-pygments-2.15.1-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1474 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_install: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_packagedata: Started
NOTE: Running task 1475 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_package)
NOTE: recipe python3-editor-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_package: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_packagedata)
NOTE: Running task 1477 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_create_spdx)
NOTE: Running task 1478 of 1491 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: Running task 1479 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_create_spdx)
NOTE: Running task 1480 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_package_write_rpm)
NOTE: Running task 1481 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_package_write_rpm)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1482 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_create_spdx)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_package: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_package: Succeeded
NOTE: Running setscene task 435 of 435 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_packagedata_setscene)
NOTE: Running task 1483 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata)
NOTE: recipe python3-pygments-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1483 tasks of which 1408 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-src went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dbg went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-staticdev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-doc went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-locale went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/cortexa57-poky-linux/python3-sqlalchemy/2.0.15-r0/temp/log.do_packagedata.232982
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata) failed with exit code '1'

--===============4067249409309588284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 12564 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12564 targets, 369 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 349 Local 39 Mirrors 290 Missed 20 Current 84 (94% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 91 of 433 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 93 of 433 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 98 of 433 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 103 of 433 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 108 of 433 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 109 of 433 (/home/auh/Projects/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 122 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 123 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 124 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 125 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 126 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 127 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 129 of 433 (/home/auh/Projects/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-editor-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 185 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_fetch)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 186 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_fetch)
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 187 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_fetch)
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running task 188 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_fetch)
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_fetch: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 214 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_fetch: Started
NOTE: Running task 189 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_unpack)
NOTE: recipe python3-editor-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 190 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_unpack)
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_fetch: Succeeded
NOTE: Running task 191 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_unpack)
NOTE: Running task 192 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_unpack)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_unpack: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 223 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 248 of 433 (/home/auh/Projects/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 433 (/home/auh/Projects/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 433 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 433 (/home/auh/Projects/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 433 (/home/auh/Projects/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 433 (/home/auh/Projects/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 433 (/home/auh/Projects/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 433 (/home/auh/Projects/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 281 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 433 (/home/auh/Projects/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 433 (/home/auh/Projects/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 433 (/home/auh/Projects/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 433 (/home/auh/Projects/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 433 (/home/auh/Projects/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 433 (/home/auh/Projects/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 433 (/home/auh/Projects/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 433 (/home/auh/Projects/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 433 (/home/auh/Projects/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 433 (/home/auh/Projects/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 433 (/home/auh/Projects/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 433 (/home/auh/Projects/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 433 (/home/auh/Projects/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 433 (/home/auh/Projects/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 433 (/home/auh/Projects/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 433 (/home/auh/Projects/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 433 (/home/auh/Projects/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 433 (/home/auh/Projects/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 433 (/home/auh/Projects/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 433 (/home/auh/Projects/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 433 (/home/auh/Projects/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 433 (/home/auh/Projects/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 433 (/home/auh/Projects/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 433 (/home/auh/Projects/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 433 (/home/auh/Projects/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 433 (/home/auh/Projects/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 433 (/home/auh/Projects/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 433 (/home/auh/Projects/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 433 (/home/auh/Projects/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 433 (/home/auh/Projects/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 433 (/home/auh/Projects/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 433 (/home/auh/Projects/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1183 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_patch)
NOTE: Running task 1198 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_patch)
NOTE: Running task 1199 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_patch)
NOTE: Running task 1200 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_patch)
NOTE: Running task 1238 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1285 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1286 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1287 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1335 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-alembic-1.11.1-r0: task do_patch: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_patch: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_patch: Started
NOTE: Running task 1429 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-alembic-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-editor-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_collect_spdx_deps)
NOTE: recipe python3-alembic-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_patch: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1454 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_configure)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1455 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_configure)
NOTE: Running task 1456 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_configure)
NOTE: Running task 1457 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_configure)
NOTE: recipe python3-alembic-1.11.1-r0: task do_configure: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_configure: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_configure: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_configure: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_compile)
NOTE: Running task 1459 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_compile)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_compile)
NOTE: Running task 1461 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_compile)
NOTE: recipe python3-alembic-1.11.1-r0: task do_compile: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_compile: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_compile: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_install)
NOTE: recipe python3-alembic-1.11.1-r0: task do_compile: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_install)
NOTE: Running task 1464 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_install)
NOTE: Running task 1465 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_install)
NOTE: recipe python3-editor-1.0.4-r0: task do_install: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_install: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_install: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_install: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1466 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_package)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_package)
NOTE: recipe python3-editor-1.0.4-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_install: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package: Started
NOTE: Running task 1468 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_package)
NOTE: Running task 1469 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_populate_sysroot)
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1470 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_packagedata)
NOTE: recipe python3-editor-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 1471 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_packagedata)
NOTE: recipe python3-dateutil-2.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_package)
NOTE: recipe python3-editor-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_package: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 1473 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_packagedata)
NOTE: Running task 1474 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_create_spdx)
NOTE: Running task 1475 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_create_spdx)
NOTE: Running task 1476 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_package_write_rpm)
NOTE: Running task 1477 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb:do_package_write_rpm)
NOTE: recipe python3-alembic-1.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dateutil-2.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1478 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_create_spdx)
NOTE: recipe python3-alembic-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-dateutil-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_package: Succeeded
NOTE: Running task 1479 of 1485 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata)
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1479 tasks of which 1433 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-src went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dbg went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-staticdev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-doc went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-locale went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-32-poky-linux-musl/python3-sqlalchemy/2.0.15-r0/temp/log.do_packagedata.243881
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata) failed with exit code '1'

--===============4067249409309588284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12567 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9276bb03427ee0cec1913eec550e8dc5edffac27"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 283 Local 33 Mirrors 237 Missed 13 Current 152 (95% match, 97% complete)
Removing 2 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 159 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 161 of 435 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-alembic-1.11.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1085 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_fetch)
NOTE: Running task 1288 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata)
NOTE: Running task 1469 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb:do_package_write_rpm)
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Started
NOTE: recipe python3-sqlalchemy-2.0.15-r0: task do_packagedata: Failed
NOTE: Running task 1470 of 1491 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb:do_unpack)
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Started
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alembic-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-editor-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1470 tasks of which 1466 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-src went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dbg went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-staticdev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-dev went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-doc went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy-locale went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: QA Issue: Package version for package python3-sqlalchemy went backwards which would break package feeds (from 0:2.0.18-r0 to 0:2.0.15-r0) [version-going-backwards]
ERROR: python3-sqlalchemy-2.0.15-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-sqlalchemy/2.0.15-r0/temp/log.do_packagedata.220228
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb:do_packagedata) failed with exit code '1'

--===============4067249409309588284==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-alembic-upgrade-1.10.4-1.11.1.patch"

From c27dc0d1d0e534b5875dae094d3d341339fb125b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 16:23:11 -0500
Subject: [PATCH] python3-alembic: upgrade 1.10.4 -> 1.11.1

---
 .../libio/libio-socket-ssl-perl_2.078.bb      | 56 -------------------
 .../libmodule-build-tiny-perl_0.045.bb        | 53 ------------------
 meta-perl/recipes-perl/po4a/po4a_0.49.bb      | 33 -----------
 ...ic_1.10.4.bb => python3-alembic_1.11.1.bb} |  2 +-
 4 files changed, 1 insertion(+), 143 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
 delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
 delete mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb
 rename meta-python/recipes-devtools/python/{python3-alembic_1.10.4.bb => python3-alembic_1.11.1.bb} (81%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
deleted file mode 100644
index ff2559b8a..000000000
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Perl library for transparent SSL"
-DESCRIPTION = "This module is a true drop-in replacement for IO::Socket::INET that \
-uses SSL to encrypt data before it is transferred to a remote server \
-or client. IO::Socket::SSL supports all the extra features that one \
-needs to write a full-featured SSL client or server application: \
-multiple SSL contexts, cipher selection, certificate verification, and \
-SSL version selection. As an extra bonus, it works perfectly with \
-mod_perl."
-HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
-SECTION = "libs"
-
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
-
-RDEPENDS:${PN} += "\
-    libmozilla-ca-perl \
-    libnet-ssleay-perl \
-    perl-module-autoloader \
-    perl-module-io-socket \
-    perl-module-scalar-util \
-"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
-
-S = "${WORKDIR}/IO-Socket-SSL-${PV}"
-
-inherit cpan ptest-perl
-
-do_install:append () {
-    mkdir -p ${D}${docdir}/${PN}/
-    cp ${S}/BUGS ${D}${docdir}/${PN}/
-    cp ${S}/Changes ${D}${docdir}/${PN}/
-    cp ${S}/README ${D}${docdir}/${PN}/
-    cp -pRP ${S}/docs ${D}${docdir}/${PN}/
-    cp -pRP ${S}/certs ${D}${docdir}/${PN}/
-    cp -pRP ${S}/example ${D}${docdir}/${PN}/
-}
-
-RDEPENDS:${PN}-ptest += "\
-    libnet-libidn-perl \
-    liburi-perl \
-    perl-module-file-glob \
-    perl-module-findbin \
-    perl-module-io-socket-inet \
-    perl-module-io-socket-ip \
-    perl-module-perlio \
-    perl-module-perlio-scalar \
-    perl-module-test-more \
-"
-
-do_install_ptest:append () {
-    cp -r ${B}/certs ${D}${PTEST_PATH}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
deleted file mode 100644
index 17ee50d7c..000000000
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.045.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-SECTION = "libs"
-
-HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
-
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6374136f6774db2f51cc116f5efbf705"
-
-DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d20692eee246d0b329b7f7659f36286b14ae0696fe91078a64b7078f8876d300"
-
-S = "${WORKDIR}/Module-Build-Tiny-${PV}"
-
-inherit cpan_build
-
-do_install () {
-        cpan_build_do_install
-}
-
-RDEPENDS:${PN} = " libextutils-config-perl \
-                   libextutils-helpers-perl \
-                   libextutils-installpaths-perl \
-                   perl-module-xsloader \
-                   perl-module-file-spec \
-                   perl-module-io-handle \
-                   perl-module-tap-harness-env \
-                   perl-module-ipc-open3 \
-                   perl-module-file-path \
-                   perl-module-cpan \
-                   perl-module-extutils-cbuilder \
-                   perl-module-getopt-long \
-                   perl-module-extutils-makemaker \
-                   perl-module-exporter \
-                   perl-module-carp \
-                   perl-module-test-more \
-                   perl-module-text-parsewords \
-                   perl-module-load \
-                   perl-module-file-temp \
-                   perl-module-data-dumper \
-                   perl-module-extutils-parsexs \
-                   perl-module-pod-man \
-                   perl-module-json-pp \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
deleted file mode 100644
index 679ea0fb4..000000000
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "PO for anything"
-DESCRIPTION = "The po4a (PO for anything) project goal is to ease translations \
-(and more interestingly, the maintenance of translations) using gettext tools \
-on areas where they were not expected like documentation."
-HOMEPAGE = "https://po4a.alioth.debian.org"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
-
-SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
-
-# v0.49
-SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = " \
-    libmodule-build-perl-native \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-RRECOMMENDS:${PN} = " \
-    libtext-wrapi18n-perl \
-    libterm-readkey-perl \
-    liblocale-gettext-perl \
-    libunicode-linebreak-perl \
-"
-
-inherit cpan_build
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
index 071f40bb0..feb2c419b 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "295b54bbb92c4008ab6a7dcd1e227e668416d6f84b98b3c4446a2bc6214a556b"
+SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


--===============4067249409309588284==--

