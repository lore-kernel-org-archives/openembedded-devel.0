Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41B6C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 10:14:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.97820.1679652882213778511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 03:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LU1accCb;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id h8so5757678ede.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679652880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PilsdQj89HI39drfeO1v/H8uaRRuxTDXOr6DKI3282o=;
        b=LU1accCbgAt6Mjv24Psz72O5NqLLc9Ar3HAGgQdYOzIkKOJDQapuv/yJI6IV4gPip2
         INjaG28G0+WZHcfTMZBY1NJiun4u44dVwILvlDFQhoNNxC386VYRMQmZNquvLrbjFpX5
         /DkZgdbglXUbz6H49IBkO6RaXR1oE/MsfedIwP8egMwawSipVhPx7NJmfAc9yBn/qJAo
         SQcf3VrX/aCvxVbHeZOI6g/3TjG94va6ij+8O09HR9XBmyJirk23c/8Rn1xC9u+gvv0s
         TYMVefEHJTzW+EoYRMGxqgarxVXYh+rUOdsPOWenri4CvPeRjHLLrejKdYrCtny0fK+M
         7pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679652880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PilsdQj89HI39drfeO1v/H8uaRRuxTDXOr6DKI3282o=;
        b=5iya3ougwJbkbSyBpkbLSEXh+OgqnjywoQUhvnkeXvBJxqH5qKSIE/2ZMbVnRBAA12
         r15J3WWGSeiLrUN7tqT666bac+Qu3379/57rae+SstskMuIf2q1K8f24wcOOIi+HwK3g
         MlSrRN2d78iE0D2a+lGwmDbyUQFJhp8vf/g2HAITCuiwoceWtloGrKnRyLP551eq+ktj
         H5QhRMQKiKcDW4yVqpnH+UQsL1sYOBUbC9WBTZm31qvYIxgvst4Rj6chuUNU8PXcnTB5
         +FmhMPFoanbdBdD1AfwOWl15uZ8WgGWeZ+XzSfRUiAR2tvD5qaWtbKYri1tCEl+27oLW
         G/gQ==
X-Gm-Message-State: AAQBX9dK4Dn4l7pzN0fR72J6sV7BRFO2CYKfhT3QiaOvyx2aem04F6bX
	wfutFyyeGPIQTTJg/3lB5BI9JlWwLYFzug==
X-Google-Smtp-Source: AKy350afpbdQXeF9oQU85e7WHKJ949CBrsUz5SflGrfKcvxISpoHsFbkPVfBs/KogRLHjpj450wn1Q==
X-Received: by 2002:a05:6402:1145:b0:4fb:9b54:ccbf with SMTP id g5-20020a056402114500b004fb9b54ccbfmr2193254edw.22.1679652880154;
        Fri, 24 Mar 2023 03:14:40 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x21-20020a50d615000000b004bb810e0b87sm10477985edi.39.2023.03.24.03.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 03:14:39 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3] meson.bbclass: Split into meson-env and meson classes
Date: Fri, 24 Mar 2023 11:14:37 +0100
Message-Id: <20230324101437.1793537-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <174F530673C9926D.22739@lists.openembedded.org>
References: <174F530673C9926D.22739@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 10:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101704

The new meson-env class will be used by a new PEP517 python
build class using meson-python a.k.a. mesonpy.

Reasons for not using meson.bbclass as is:
* Both meson and python_pep517 classes declare
   EXPORT_FUNCTION. For some reason, meson always wins
   regardless of the inheritance order. The mesonpy class
   needs the meson cross compiler environment using the
   pep517 configure/compile/install functions.
* The meson class adds do_qa_configure which fails because
   the mesonpy build moves the meson setup phase from
   do_configure to do_compile. Removing items from
   do_configure[postfuncs] is impossible because this results
   in a parse error:
   do_configure[postfuncs]:remove = "meson_do_qa_configure"

The only option left is to split the environment setup part
out of meson.bbclass.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/meson-env.bbclass | 141 ++++++++++++++++++++++++++
 meta/classes-recipe/meson.bbclass     | 136 +------------------------
 2 files changed, 142 insertions(+), 135 deletions(-)
 create mode 100644 meta/classes-recipe/meson-env.bbclass

diff --git a/meta/classes-recipe/meson-env.bbclass b/meta/classes-recipe/meson-env.bbclass
new file mode 100644
index 0000000000..e02b3e5ab6
--- /dev/null
+++ b/meta/classes-recipe/meson-env.bbclass
@@ -0,0 +1,141 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python3native meson-routines qemu
+
+DEPENDS:append = " meson-native ninja-native"
+
+EXEWRAPPER_ENABLED:class-native = "False"
+EXEWRAPPER_ENABLED:class-nativesdk = "False"
+EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
+
+# As Meson enforces out-of-tree builds we can just use cleandirs
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+# Where the meson.build build configuration is
+MESON_SOURCEPATH = "${S}"
+
+def noprefix(var, d):
+    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
+
+MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
+MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
+MESONOPTS = " --prefix ${prefix} \
+              --buildtype ${MESON_BUILDTYPE} \
+              --bindir ${@noprefix('bindir', d)} \
+              --sbindir ${@noprefix('sbindir', d)} \
+              --datadir ${@noprefix('datadir', d)} \
+              --libdir ${@noprefix('libdir', d)} \
+              --libexecdir ${@noprefix('libexecdir', d)} \
+              --includedir ${@noprefix('includedir', d)} \
+              --mandir ${@noprefix('mandir', d)} \
+              --infodir ${@noprefix('infodir', d)} \
+              --sysconfdir ${sysconfdir} \
+              --localstatedir ${localstatedir} \
+              --sharedstatedir ${sharedstatedir} \
+              --wrap-mode nodownload \
+              --native-file ${WORKDIR}/meson.native"
+
+EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
+
+MESON_CROSS_FILE = ""
+MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
+
+# Needed to set up qemu wrapper below
+export STAGING_DIR_HOST
+
+def rust_tool(d, target_var):
+    rustc = d.getVar('RUSTC')
+    if not rustc:
+        return ""
+    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
+    return "rust = %s" % repr(cmd)
+
+addtask write_config before do_configure
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = ${@meson_array('CC', d)}
+cpp = ${@meson_array('CXX', d)}
+cython = 'cython3'
+ar = ${@meson_array('AR', d)}
+nm = ${@meson_array('NM', d)}
+strip = ${@meson_array('STRIP', d)}
+readelf = ${@meson_array('READELF', d)}
+objcopy = ${@meson_array('OBJCOPY', d)}
+pkgconfig = 'pkg-config'
+llvm-config = 'llvm-config'
+cups-config = 'cups-config'
+g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
+g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
+${@rust_tool(d, "HOST_SYS")}
+${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
+
+[built-in options]
+c_args = ${@meson_array('CFLAGS', d)}
+c_link_args = ${@meson_array('LDFLAGS', d)}
+cpp_args = ${@meson_array('CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('LDFLAGS', d)}
+
+[properties]
+needs_exe_wrapper = true
+
+[host_machine]
+system = '${@meson_operating_system('HOST_OS', d)}'
+cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
+cpu = '${HOST_ARCH}'
+endian = '${@meson_endian('HOST', d)}'
+
+[target_machine]
+system = '${@meson_operating_system('TARGET_OS', d)}'
+cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
+cpu = '${TARGET_ARCH}'
+endian = '${@meson_endian('TARGET', d)}'
+EOF
+
+    cat >${WORKDIR}/meson.native <<EOF
+[binaries]
+c = ${@meson_array('BUILD_CC', d)}
+cpp = ${@meson_array('BUILD_CXX', d)}
+cython = 'cython3'
+ar = ${@meson_array('BUILD_AR', d)}
+nm = ${@meson_array('BUILD_NM', d)}
+strip = ${@meson_array('BUILD_STRIP', d)}
+readelf = ${@meson_array('BUILD_READELF', d)}
+objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
+pkgconfig = 'pkg-config-native'
+${@rust_tool(d, "BUILD_SYS")}
+
+[built-in options]
+c_args = ${@meson_array('BUILD_CFLAGS', d)}
+c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
+cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
+EOF
+}
+
+do_write_config:append:class-target() {
+    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
+    # can run target helper binaries through that.
+    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    cat > ${WORKDIR}/meson-qemuwrapper << EOF
+#!/bin/sh
+# Use a modules directory which doesn't exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+
+# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+unset LD_LIBRARY_PATH
+
+$qemu_binary "\$@"
+EOF
+    chmod +x ${WORKDIR}/meson-qemuwrapper
+}
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 48688bed75..697cf6ecc8 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,141 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
-
-DEPENDS:append = " meson-native ninja-native"
-
-EXEWRAPPER_ENABLED:class-native = "False"
-EXEWRAPPER_ENABLED:class-nativesdk = "False"
-EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
-DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
-
-# As Meson enforces out-of-tree builds we can just use cleandirs
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-# Where the meson.build build configuration is
-MESON_SOURCEPATH = "${S}"
-
-def noprefix(var, d):
-    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
-
-MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
-MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
-MESONOPTS = " --prefix ${prefix} \
-              --buildtype ${MESON_BUILDTYPE} \
-              --bindir ${@noprefix('bindir', d)} \
-              --sbindir ${@noprefix('sbindir', d)} \
-              --datadir ${@noprefix('datadir', d)} \
-              --libdir ${@noprefix('libdir', d)} \
-              --libexecdir ${@noprefix('libexecdir', d)} \
-              --includedir ${@noprefix('includedir', d)} \
-              --mandir ${@noprefix('mandir', d)} \
-              --infodir ${@noprefix('infodir', d)} \
-              --sysconfdir ${sysconfdir} \
-              --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir} \
-              --wrap-mode nodownload \
-              --native-file ${WORKDIR}/meson.native"
-
-EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
-
-MESON_CROSS_FILE = ""
-MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
-MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
-
-# Needed to set up qemu wrapper below
-export STAGING_DIR_HOST
-
-def rust_tool(d, target_var):
-    rustc = d.getVar('RUSTC')
-    if not rustc:
-        return ""
-    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
-    return "rust = %s" % repr(cmd)
-
-addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
-do_write_config() {
-    # This needs to be Py to split the args into single-element lists
-    cat >${WORKDIR}/meson.cross <<EOF
-[binaries]
-c = ${@meson_array('CC', d)}
-cpp = ${@meson_array('CXX', d)}
-cython = 'cython3'
-ar = ${@meson_array('AR', d)}
-nm = ${@meson_array('NM', d)}
-strip = ${@meson_array('STRIP', d)}
-readelf = ${@meson_array('READELF', d)}
-objcopy = ${@meson_array('OBJCOPY', d)}
-pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config'
-cups-config = 'cups-config'
-g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
-g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
-${@rust_tool(d, "HOST_SYS")}
-${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
-
-[built-in options]
-c_args = ${@meson_array('CFLAGS', d)}
-c_link_args = ${@meson_array('LDFLAGS', d)}
-cpp_args = ${@meson_array('CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('LDFLAGS', d)}
-
-[properties]
-needs_exe_wrapper = true
-
-[host_machine]
-system = '${@meson_operating_system('HOST_OS', d)}'
-cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
-cpu = '${HOST_ARCH}'
-endian = '${@meson_endian('HOST', d)}'
-
-[target_machine]
-system = '${@meson_operating_system('TARGET_OS', d)}'
-cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
-cpu = '${TARGET_ARCH}'
-endian = '${@meson_endian('TARGET', d)}'
-EOF
-
-    cat >${WORKDIR}/meson.native <<EOF
-[binaries]
-c = ${@meson_array('BUILD_CC', d)}
-cpp = ${@meson_array('BUILD_CXX', d)}
-cython = 'cython3'
-ar = ${@meson_array('BUILD_AR', d)}
-nm = ${@meson_array('BUILD_NM', d)}
-strip = ${@meson_array('BUILD_STRIP', d)}
-readelf = ${@meson_array('BUILD_READELF', d)}
-objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
-pkgconfig = 'pkg-config-native'
-${@rust_tool(d, "BUILD_SYS")}
-
-[built-in options]
-c_args = ${@meson_array('BUILD_CFLAGS', d)}
-c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
-cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
-EOF
-}
-
-do_write_config:append:class-target() {
-    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
-    # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
-    cat > ${WORKDIR}/meson-qemuwrapper << EOF
-#!/bin/sh
-# Use a modules directory which doesn't exist so we don't load random things
-# which may then get deleted (or their dependencies) and potentially segfault
-export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
-
-# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
-unset LD_LIBRARY_PATH
-
-$qemu_binary "\$@"
-EOF
-    chmod +x ${WORKDIR}/meson-qemuwrapper
-}
+inherit meson-env
 
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
-- 
2.39.2


