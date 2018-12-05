Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1526D470
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 14:37:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 96so19968145wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ngtv5kIjiAko82je90cYrp05n7VPIpWyD8KYALhr7ZI=;
	b=MFFZbzPokvE8eSTUmdcjKAckGniGhojI+5RMG9gSydvhpAWKOGYVKcfRf7nUrwyb4x
	s/98sHioBhB1GSLHyi6S0qju3EsxCmG5MxUaZJfaKIZzTrtuQJhu5ThnLnawtgtX5kBe
	TgyhAr4enIwroSGlNMSAT8Suc/PBw2kEKDAYxk3s4dD72slLzTwpBDPYxBJ0wyMrXLMl
	8tqIN5p/cnP9Uakvea4NiA/PIr9e90yM/tW7wl5QqDIy4VuRQ8YlnnWNJui0hrot9fAL
	JyCgwAZYQXsGfDDPBHODHJ6Ytof3fqso4vj9M5ysskmes6UfIdr/Opl+ZLELmcRwiOLw
	JwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ngtv5kIjiAko82je90cYrp05n7VPIpWyD8KYALhr7ZI=;
	b=FCKFHqYpjYi/2an69+wr57bxlnROBH1XfkTafSEp9Am58SppQ7eZIfxZI9agUXFDPB
	cZmejxZVebb3uHOamBuyWeDKGFQpW4dXWIYgpclbKDxmO8Og4UUeM/JNGrEcY3/EcKKT
	V6Hlmpk8Ml4pS4rXyzqYOqj/Vpj2O4QeLoOht4Ho1Agh6R7Uig7q9STwdefuNN8+jIQX
	Ar5Ccpf2QFaVBNqgbHHYeTGInhZQPAJaI/DBkFg7z474Lh+c2CkkELogwk32RuwIoXfW
	kBtizAkNDTEGdtffmdPclMbVulQSWsYyoWz83I7W32rDCasfBLNstRwsrITbQcJteGk8
	7Vyg==
X-Gm-Message-State: AA+aEWYEZ0JqA5VLkafrv8VY3gi4lJ388MEX6Cb73yJmxrct1XFnu94F
	cgJo0aAGqxLwMma2nhrAr2z6BD10
X-Google-Smtp-Source: AFSGD/VgA0ecxojDjRk2kAwaIsL14+zUON4H+n1RORsqFHIua0sTdS8nIduapsQWAHxHNHMW8P+J1g==
X-Received: by 2002:adf:8001:: with SMTP id 1mr21082564wrk.23.1544020666303;
	Wed, 05 Dec 2018 06:37:46 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h127sm13008929wmd.31.2018.12.05.06.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Dec 2018 06:37:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 14:37:46 +0000
Message-Id: <20181205143746.26444-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe] open-vm-tools: fix indentation and drop FILES_${PN}-dbg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2018 14:37:46 -0000

* don't mix tabs and spaces for indentation, removes new warning:
  meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb: python should use 4 spaces indentation, but found tabs in open-vm-tools_10.3.0.bb, line 107
* remove FILES_${PN}-dbg variable, all .debug directories are
  packaged automatically in ${PN}-dbg for long time (at least since
  2.1 Krogoth) since this oe-core commit:
      commit da5ec06814e105451cca11cce76b5c5231110524
      Author: Richard Purdie <richard.purdie@linuxfoundation.org>
      Date:   Tue Dec 15 15:38:54 2015 +0000

        package: Add auto package splitting of .debug files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../open-vm-tools/open-vm-tools_10.3.0.bb     | 47 +++++++++----------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
index 478d762cfb..2d7486da34 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.0.bb
@@ -22,22 +22,22 @@ LICENSE_modules/linux = "GPL-2.0"
 LICENSE_modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
-           file://tools.conf \
-           file://vmtoolsd.service \
-           file://vmtoolsd.init \
-           file://0001-configure.ac-don-t-use-dnet-config.patch \
-           file://0002-add-include-sys-sysmacros.h.patch \
-           file://0005-Use-configure-test-for-struct-timespec.patch \
-           file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
-           file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
-           file://0011-Use-configure-test-for-sys-stat.h-include.patch \
-           file://fix-subdir-objects-configure-error.patch \
-           file://0001-include-poll.h-instead-of-sys-poll.h.patch \
-           file://0002-Rename-poll.h-to-vm_poll.h.patch \
-           file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
-           file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
-           file://0001-Use-off64_t-instead-of-__off64_t.patch \
-           "
+    file://tools.conf \
+    file://vmtoolsd.service \
+    file://vmtoolsd.init \
+    file://0001-configure.ac-don-t-use-dnet-config.patch \
+    file://0002-add-include-sys-sysmacros.h.patch \
+    file://0005-Use-configure-test-for-struct-timespec.patch \
+    file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
+    file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
+    file://0011-Use-configure-test-for-sys-stat.h-include.patch \
+    file://fix-subdir-objects-configure-error.patch \
+    file://0001-include-poll.h-instead-of-sys-poll.h.patch \
+    file://0002-Rename-poll.h-to-vm_poll.h.patch \
+    file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
+    file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
+    file://0001-Use-off64_t-instead-of-__off64_t.patch \
+"
 SRCREV = "2147df6aabe639fc5ff423ed791a8e7f02bf8d0a"
 
 S = "${WORKDIR}/git/open-vm-tools"
@@ -52,9 +52,9 @@ inherit autotools pkgconfig systemd update-rc.d
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
-                --disable-tests --without-gtkmm --without-xerces --without-pam \
-                --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
-                --without-root-privileges --without-kernel-modules"
+         --disable-tests --without-gtkmm --without-xerces --without-pam \
+         --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
+         --without-root-privileges --without-kernel-modules"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
@@ -68,13 +68,9 @@ FILES_${PN} += "\
     ${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
     ${libdir}/open-vm-tools/plugins/common/lib*.so \
     ${sysconfdir}/vmware-tools/tools.conf \
-    "
+"
 FILES_${PN}-locale += "${datadir}/open-vm-tools/messages"
 FILES_${PN}-dev += "${libdir}/open-vm-tools/plugins/common/lib*.la"
-FILES_${PN}-dbg += "\
-    ${libdir}/open-vm-tools/plugins/common/.debug \
-    ${libdir}/open-vm-tools/plugins/vmsvc/.debug \
-    "
 
 CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
 
@@ -104,7 +100,6 @@ INITSCRIPT_PARAMS_${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split() or \
-	'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires meta-networking and meta-filesystems to be present.')
 }
-
-- 
2.17.1


