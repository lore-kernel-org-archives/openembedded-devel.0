Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.4138.1628020914511759765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 13:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=is96xCDt;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so403788pjd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrzdBEvDU4kcKlVHu6M1P3DZw7z2FC8N6pNRF+eCsKs=;
        b=is96xCDtwTz6wQLmO/eoe2cTbNBcxg3bLmD3ly86rnPJb8DxsyfPzZoMFs2NaKgFQw
         HALnJXC/Yol+7FePatbVGyPR4vnjWtM4mIWJaUecIehX4+suoErlZrKGAcsT20EC7agK
         Z3Xb4L+kGs3INI2OTERpNXaUT9MtkQOvyXDz97TMW8nM790YKm1P06iYjaLy6DhAFXt6
         luT4hb2V7FiWMNk/X+Oqnsf75x0JKqMK/Ff6LdAdKN9Z8Yksv0DKmFVPZ69zl67mNQMt
         zY+JhKyzIsr/4hVojrMHG8FbHsQPBFIGm7PvSoxr5M1rblFFfXvUhfKnW++RGMbf0hvV
         jN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrzdBEvDU4kcKlVHu6M1P3DZw7z2FC8N6pNRF+eCsKs=;
        b=uJmFE6YJOIHQjTpFdL6Z5qF0didFKvm2SMQFvNcD+odSC1owDCgrgvtPmmpIlGSyUf
         NX4tO3GE2AxXGhPx0FHX7hTofD8obGTbUPE8BJaGcBUYARp7XBY2I1WBbSW9UAyBtyg4
         oBOtcaDYaN7Lv7u2ubI0wjjO0VnaQuBinrn8KwxHYOpt4e3pyRXYm6JUeXKI2jkdHziR
         u43mnU+OcZv76lbpV7wiDx7NeztQHP/CfXn9RZSwBzvUxUfTHYYW3M0K/20T14f3VnBT
         q8nd8nJ/uDj3JIhWSM76s4KcPEsmYM24+pniccHDbL1oFs8qhaqJO5VMJ72z1pFLsz8s
         bt/Q==
X-Gm-Message-State: AOAM530f/q9jUK179iKWLIcy7ODEVScxqqMA3MEeSZtfDdFND5aCcRHD
	G72JcgTAmOvvEuu0PYG11gfJhbELbYXmLQ==
X-Google-Smtp-Source: ABdhPJy0i4pYMBS2kx8rUGDUldWRx16i08nhNuVf84piwaVTv0KQFFlWaB51TemuthiixlBkUf5RTw==
X-Received: by 2002:a65:6658:: with SMTP id z24mr1025035pgv.266.1628020913822;
        Tue, 03 Aug 2021 13:01:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id a35sm18914290pgm.66.2021.08.03.13.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 13:01:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe,meta-initramfs,meta-networking][PATCH 3/3] recipes: Fix override syntax
Date: Tue,  3 Aug 2021 13:01:49 -0700
Message-Id: <20210803200149.2706807-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803200149.2706807-1-raj.khem@gmail.com>
References: <20210803200149.2706807-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb     | 2 +-
 .../recipes-extended/corosync/corosync_3.0.3.bb           | 2 +-
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb  | 8 ++++----
 meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb           | 4 ++--
 meta-oe/recipes-extended/ostree/ostree_2021.3.bb          | 2 +-
 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb  | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 0f77f65df3..d45c62a082 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRC_URI:append_libc-klibc = "\
+SRC_URI:append:libc-klibc = "\
     file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch \
     file://0001-make-Add-compiler-includes-in-cflags.patch \
 "
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index 0af954c310..909296197c 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_un
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash ap_cv_cc_pie=no"
 EXTRA_OEMAKE = "tmpfilesdir_DATA="

-#do_configure_prepend() {
+#do_configure:prepend() {
 #    ( cd ${S}
 #    ${S}/autogen.sh )
 #}
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index d8cf9b9f54..1ca7b6084c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls."
-DESCRIPTION:append_lirc = " This package contains the lirc daemon, libraries and tools."
-DESCRIPTION:append_lirc-exec = " This package contains a daemon that runs programs on IR signals."
-DESCRIPTION:append_lirc-remotes = " This package contains some config files for remotes."
-DESCRIPTION:append_lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
+DESCRIPTION:append:lirc = " This package contains the lirc daemon, libraries and tools."
+DESCRIPTION:append:lirc-exec = " This package contains a daemon that runs programs on IR signals."
+DESCRIPTION:append:lirc-remotes = " This package contains some config files for remotes."
+DESCRIPTION:append:lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
index 62d4df5e09..1664d637b7 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
 # Note this is not officially supported and is just illustrated here to
 # show an example of how it can be done
 # You'll also need your fortran recipe to depend on libgfortran
-#FORTRAN_forcevariable = ",fortran"
-#RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"
+#FORTRAN:forcevariable = ",fortran"
+#RUNTIMETARGET:append:pn-gcc-runtime = " libquadmath"

 DEPENDS = "libgfortran"

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.3.bb b/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
index a0576b51e2..b0c9849fad 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
@@ -154,7 +154,7 @@ RDEPENDS:${PN}:class-target = " \
 # Note that to get ptest to pass you also need:
 #
 #   xattr in DISTRO_FEATURES
-#   static ostree-prepare-root (PACKAGECONFIG_append_pn-ostree = " static")
+#   static ostree-prepare-root (PACKAGECONFIG:append:pn-ostree = " static")
 #   meta-python in your layers
 #   overlayfs in your kernel (KERNEL_EXTRA_FEATURES += "features/overlayfs/overlayfs.scc")
 #   busybox built statically
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 26d51bdafd..bcc85157cb 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF:append:class-native = " with_x=no"
 LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"

-#do_configure_prepend() {
+#do_configure:prepend() {
 # uthash sources are expected in uthash/src
 #    mkdir -p ${S}/uthash/src
 #    cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src
--
2.32.0
