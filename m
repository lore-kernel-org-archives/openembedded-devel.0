Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152DAC433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Oct 2022 14:52:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.8235.1664722323167124147
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Oct 2022 07:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SMpRVkvL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id t16so9417723ljh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Oct 2022 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=1TpOdCctbPgv8EtQlwK7IGWg8Y7Xm/v8zERNSbLnW+M=;
        b=SMpRVkvLRHroczmjTTubGlKSFLbADKxVp38Ecp1KD6wbcIV4KjUwDrr3R9KkAxouS8
         ckGwsorkUbaAbz5R7MHIDCKjb9jwctkRXVgc3GIaFemVpJ9eSYYKqMZyvdTOarSntiXi
         x/HM+jsIfY1BoUi/DB7pDLYEL4hvwD8sPNWOyuRIdrz9CDZay6pp1LaTJJImN/twna/A
         oOVigQzsOOBNC/IqKpS3HyVF1hFLlUSTF1HpxW0nmW1DSO5imRvKWGSdkeo0Cz8kp/zx
         8F5ZWS5jHrBJn2r089Ost4nGn5U46hXk3oIEsPVWOrr2bvIZqVy3hjc3JwHGXktZQ0AM
         jlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=1TpOdCctbPgv8EtQlwK7IGWg8Y7Xm/v8zERNSbLnW+M=;
        b=y8tjkMqLzK0HE2C/rxG38xtKTxRBzpZyQSHI6YwO3z+JfDutNGpgTy2rmXTJ5NnhiO
         jt8fXg2S8s3JnMhQsBXSOKxvXC5yUoRCM7eT6rpKf1sfZrQv6AQJHHrh/2M6GYWkxnoj
         tVWU/oLsKuXLIEb/VcbXBsIor+/GFEZGROHtHuHsiGxG7+0GlmCHjhV3oc4miiPDRp73
         PkWqzkgrmg1ugsHQrbIpZvZx1f62z2J1QYAw1TDxpIM/MJ64ajGZ7C2bgq8cTV7JnuCb
         CcLBtoPyILHb+XHvy1JRa4xz+v12s2dRdHhe/QPoRhFWCWoehp0SDKGtz4GT90nE6CUW
         C/ZA==
X-Gm-Message-State: ACrzQf3SPWfOVeeiI32/wJnn1p/m9M4iVyYWrVjFx1KKK48yRLoLK3q2
	A+IWsneC/0xQcTgrjQmjhcgQhtVk1t4=
X-Google-Smtp-Source: 
 AMsMyM4TICUkblDbUzQD/iLUR/+xTeF1wyaZVSRrX26A8oKcgpKCGIvG8Lnt5nm+BXSNP7eTgYV71Q==
X-Received: by 2002:a2e:95d5:0:b0:26d:c9f4:730e with SMTP id
 y21-20020a2e95d5000000b0026dc9f4730emr2312795ljh.522.1664722320779;
        Sun, 02 Oct 2022 07:52:00 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 k21-20020a05651210d500b00492f1b2ac0bsm1104979lfg.101.2022.10.02.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 07:52:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] plymouth: uprev to 22.02.122
Date: Sun,  2 Oct 2022 16:51:57 +0200
Message-Id: <20221002145157.2309000-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Oct 2022 14:52:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99036

From: Ming Liu <liu.ming50@gmail.com>

Also introduce more PACKAGECONFIGs to make build more predicable.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...tall-ignoring-configured-runstatedir.patch | 30 +++++++++++
 ...-standard-runstatedir-vs-custom-flag.patch | 50 +++++++++++++++++
 ...lymouth_0.9.5.bb => plymouth_22.02.122.bb} | 54 +++++++++----------
 3 files changed, 107 insertions(+), 27 deletions(-)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
 rename meta-oe/recipes-core/plymouth/{plymouth_0.9.5.bb => plymouth_22.02.122.bb} (61%)

diff --git a/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch b/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
new file mode 100644
index 000000000..e04917e30
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
@@ -0,0 +1,30 @@
+From 4c90a66fb7fd9dbb861c5a888fc828f3795fe540 Mon Sep 17 00:00:00 2001
+From: Ben Brown <ben@demerara.io>
+Date: Tue, 19 Jul 2022 16:12:12 +0100
+Subject: [PATCH] Fix daemon install ignoring configured runstatedir
+
+Upstream-Status: Backport
+
+Signed-off-by: Ben Brown <ben@demerara.io>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index ad3655d..abd7a4c 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -37,7 +37,7 @@ escrow_PROGRAMS = plymouthd-fd-escrow
+ 
+ plymouthd_fd_escrow_SOURCES = plymouthd-fd-escrow.c
+ 
+-plymouthdrundir = $(localstatedir)/run/plymouth
++plymouthdrundir = $(plymouthruntimedir)
+ plymouthdspooldir = $(localstatedir)/spool/plymouth
+ plymouthdtimedir = $(localstatedir)/lib/plymouth
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch b/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
new file mode 100644
index 000000000..e351098f3
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
@@ -0,0 +1,50 @@
+From 97012d2c38b84fffb32867fb5eeac64a93455626 Mon Sep 17 00:00:00 2001
+From: Ben Brown <ben@demerara.io>
+Date: Tue, 19 Jul 2022 16:10:24 +0100
+Subject: [PATCH] Use standard runstatedir vs custom flag
+
+Upstream-Status: Backport
+
+---
+ configure.ac | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+Signed-off-by: Ben Brown <ben@demerara.io>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+index 608ad02..34a2f2c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -140,9 +140,7 @@ if test x$enable_systemd_integration = xyes; then
+   AC_SUBST(SYSTEMD_UNIT_DIR)
+ fi
+ 
+-AC_ARG_WITH([runtimedir],
+-            AC_HELP_STRING([--with-runtimedir=DIR], [runtime data dir [LOCALSTATEDIR/run]]),
+-            [plymouthruntimedir=${withval}/plymouth], [plymouthruntimedir=""])
++AC_ARG_WITH([runtimedir], [], [AC_MSG_ERROR([--with-runtimedir is obsolete, use --runstatedir instead])], [])
+ 
+ AC_ARG_WITH(system-root-install, AS_HELP_STRING([--with-system-root-install],[Install client in /bin and daemon in /sbin]),with_system_root_install=${withval},with_system_root_install=no)
+ AM_CONDITIONAL(WITH_SYSTEM_ROOT_INSTALL,  [test "$with_system_root_install" = yes])
+@@ -150,16 +148,11 @@ AM_CONDITIONAL(WITH_SYSTEM_ROOT_INSTALL,  [test "$with_system_root_install" = ye
+ if test x$with_system_root_install = xyes; then
+   plymouthclientdir=/bin
+   plymouthdaemondir=/sbin
+-  if (test -z "${plymouthruntimedir}"); then
+-    plymouthruntimedir=/run/plymouth
+-  fi
+ else
+   plymouthclientdir=$bindir
+   plymouthdaemondir=$sbindir
+-  if (test -z "${plymouthruntimedir}"); then
+-    plymouthruntimedir=$localstatedir/run/plymouth
+-  fi
+ fi
++plymouthruntimedir=$runstatedir/plymouth
+ AC_SUBST(plymouthclientdir)
+ AC_SUBST(plymouthdaemondir)
+ AC_SUBST(plymouthruntimedir)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
similarity index 61%
rename from meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
rename to meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
index 143ffa10d..469914cd4 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
@@ -1,62 +1,58 @@
 SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
-
 DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
-    (even before the root filesystem is mounted!) that provides a \
-    graphical boot animation while the boot process happens in the background. \
-"
-
+(even before the root filesystem is mounted!) that provides a \
+graphical boot animation while the boot process happens in the background."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
 SECTION = "base"
 
 LICENSE = "GPL-2.0-or-later"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libcap libpng cairo dbus udev"
-DEPENDS:append:libc-musl = " musl-rpmatch"
-PROVIDES = "virtual/psplash"
-RPROVIDES:${PN} = "virtual-psplash virtual-psplash-support"
-
 SRC_URI = " \
     http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
-    file://0001-systemd-switch-to-KillMode-mixed.patch \
     file://0001-plymouth-start-service-in-add-related-kernel-paramet.patch \
     file://0001-plymouth-Add-the-retain-splash-option.patch \
-        "
+    file://0001-Use-standard-runstatedir-vs-custom-flag.patch \
+    file://0001-Fix-daemon-install-ignoring-configured-runstatedir.patch \
+"
 
-SRC_URI[md5sum] = "8a25d23f3ae732af300a56fa33cacff2"
+SRC_URI[sha256sum] = "100551442221033ce868c447ad6c74d831d209c18ae232b98ae0207e34eadaeb"
 
-EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
-    --with-logo=${LOGO} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '--disable-systemd-integration', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge','--without-system-root-install','--with-system-root-install',d)} \
-"
+LOGO ??= "${datadir}/plymouth/bizcom.png"
+RUNSTATEDIR ??= "${localstatedir}/run"
+
+EXTRA_OECONF = "--runstatedir=${RUNSTATEDIR}"
 
-PACKAGECONFIG ??= "pango initrd"
+PACKAGECONFIG ??= "initrd logo pango udev ${@bb.utils.filter('DISTRO_FEATURES', 'systemd usrmerge', d)}"
 PACKAGECONFIG:append:x86 = " drm"
 PACKAGECONFIG:append:x86-64 = " drm"
 
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
-PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[documentation] = "--enable-documentation,--disable-documentation"
+PACKAGECONFIG[initrd] = ",,"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-PACKAGECONFIG[initrd] = ",,,"
-
-LOGO ??= "${datadir}/plymouth/bizcom.png"
+PACKAGECONFIG[logo] = "--with-logo=${LOGO},--without-logo"
+PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
+PACKAGECONFIG[systemd] = "--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent,--disable-systemd-integration,systemd"
+PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev"
+PACKAGECONFIG[upstart-monitoring] = "--enable-upstart-monitoring,--disable-upstart-monitoring,ncurses dbus"
+PACKAGECONFIG[usrmerge] = "--without-system-root-install,--with-system-root-install"
 
 inherit autotools pkgconfig systemd gettext
 
-LDFLAGS:append:libc-musl = " -lrpmatch"
-
 do_install:append() {
     # Remove /var/run from package as plymouth will populate it on startup
-    rm -fr "${D}${localstatedir}/run"
+    rm -fr ${D}${RUNSTATEDIR}
 
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
         rm -rf "${D}${libexecdir}"
     fi
 }
 
+PROVIDES = "virtual/psplash"
+RPROVIDES:${PN} = "virtual-psplash virtual-psplash-support"
+
 PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
 PACKAGES =+ "${PN}-set-default-theme"
 
@@ -66,6 +62,10 @@ FILES:${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
 FILES:${PN} += "${systemd_unitdir}/system/*"
 FILES:${PN}-dbg += "${libdir}/plymouth/renderers/.debug"
 
+DEPENDS = "libcap libpng"
+DEPENDS:append:libc-musl = " musl-rpmatch"
+
+LDFLAGS:append:libc-musl = " -lrpmatch"
 
 RDEPENDS:${PN}-initrd = "bash dracut"
 RDEPENDS:${PN}-set-default-theme = "bash"
-- 
2.25.1


