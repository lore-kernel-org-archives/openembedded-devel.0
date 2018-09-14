Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id E4A5979966
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 11:23:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n2-v6so10171684wrw.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8as/HvrT8OUM8rKI/QgGvM0xznbbNPKPasEpZL/Fmss=;
	b=S88IPKYZ5qFFTa3QfAvJgr9GbvMzvz87izSKbZDkP3Wfd98Z031KBS5M+XBpyKcA0l
	uJ9GfxWxyiyA+u4i32ZRS8BPQ/BRzCJiv9Kr2R7iSa1FQhLhhFFhO9YDvsP5zCafGZmu
	ZTT//Bipb7+UpUH3+732zsUM6BV+LUkGPG1nhYgdFkIGoK5MxRMKUaSQd9duKK5p8RwO
	t/1sUsEdblbEZmSCTNLtGb7N70AJfXS+FSIXmYBbx51b4KqMIlXrjnsWA9iEKZyvrZRt
	oy1uKQY61xyhpR6lj934VHHr5O8iJvRbFsGX/dtAdHg2S5/x4o44zvNkmNTYDgW8AQ7r
	tTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8as/HvrT8OUM8rKI/QgGvM0xznbbNPKPasEpZL/Fmss=;
	b=Zd1T2sBWEIZYZxYfESyZwNg/TpYt5xkTCQiZO9v82+eyb49l9rW2eYHhiOzyxBxbTX
	e9El/PnmIbfWkcLZnt5ZY6jzZa5ngmJxyaoprVx8NsoIypkoa6YRLj9DUZQBRFDQd9oU
	sDEeQfDYwZMSGpulpEPBMYpVRKnTGh/ijrtwfcy+RR0VPL+EgE+eUn0RlQiuvODw1kVp
	1GjPwMA4mTWamXfEwhwFB95t5Svx5fmfl2K1jYkpi2iMd7RELe2PNrqfEJMrxyBdeiqx
	JBWl7PQfj/B+kpUqJG2qdbYnxMbWWtnyCWeq/IaAoQfHp75lHWG6m+BIHCIjLMjrExpI
	Q8Ag==
X-Gm-Message-State: APzg51Cxd8tbYF3Zl0Aq8u8o8WHTlYTgl8JGVWnxH+6amQkw/sHlerki
	lLZsfnE26mcn3rUC7KZ/Ds5Vl0Sr
X-Google-Smtp-Source: ANB0VdYDRPl9sgyOtVfJZx5OqfZISldILAqhc2oSvI+LeOvdREjqqG8MzKDGjRgEYKE6Q82oqkqZQA==
X-Received: by 2002:adf:e8c1:: with SMTP id k1-v6mr8997976wrn.43.1536924240181;
	Fri, 14 Sep 2018 04:24:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b12sm6906041wrx.11.2018.09.14.04.23.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Sep 2018 04:23:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2018 11:23:58 +0000
Message-Id: <20180914112358.5671-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] fbset-modes: drop allarch inherit
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
X-List-Received-Date: Fri, 14 Sep 2018 11:24:00 -0000

* setting PACKAGE_ARCH to MACHINE_ARCH together with allarch doesn't work
  well anymore since:
  http://git.openembedded.org/openembedded-core/commit/?id=a23c482cab4f874f4a6a6889716123569eb5ece9
* fixes:
 === Comparing signatures for task do_configure.sigdata between qemux86 and qemuarm ===
ERROR: fbset-modes different signature for task do_configure.sigdata between qemux86 and qemuarm
Task dependencies changed from:
['AR', 'AS', 'B', 'BASEDEPENDS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'CC', 'CCLD', 'CFLAGS', 'CLEANBROKEN', 'CONFIGURESTAMPFILE', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEPENDS', 'DISABLE_STATIC', 'DISTRO', 'EXTRA_OECONF', 'EXTRA_OEMAKE', 'FC', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX', 'ICECC_AS', 'ICECC_CC', 'ICECC_CXX', 'ICECC_VERSION', 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG',
  'PACKAGE_ARCH', 'PERL_HASH_SEED', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PKG_CONFIG_SYSTEM_INCLUDE_PATH', 'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN', 'PSEUDO_DISABLED', 'PV', 'PYTHONHASHSEED', 'QA_LOGFILE', 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S', 'SOURCE_DATE_EPOCH', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_DATADIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
  'TZ', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_do_configure', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_sbindir', 'baselib', 'bbfatal_log', 'bbnote', 'bbwarn', 'bindir', 'bindir_cross', 'create_path', 'datadir', 'die', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_cross_kernel_cc', 'get_icecc', 'icecc_dep_prepend', 'icecc_dir', 'icecc_get_and_check_tool', 'icecc_get_external_tool', 'icecc_get_path_tool', 'icecc_get_tool', 'icecc_get_tool_link', 'icecc_is_allarch', 'icecc_is_cross_canadian', 'icecc_is_kernel', 'icecc_is_native', 'icecc_path', 'icecc_version', 'includedir', 'includedir_native', 'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
  'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oe_runmake', 'oe_runmake_call', 'oldincludedir', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix', 'sbindir', 'servicedir', 'set_icecc_env', 'sharedstatedir', 'sysconfdir', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'use_icecc']
to:
['ABIEXTENSION', 'AR', 'ARMPKGARCH', 'ARMPKGARCH_tune-armv5te', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSFX_ENDIAN', 'ARMPKGSFX_FPU', 'ARMPKGSFX_THUMB', 'ARM_INSTRUCTION_SET', 'ARM_M_OPT', 'ARM_THUMB_OPT', 'ARM_THUMB_SUFFIX', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BASE_DEFAULT_DEPS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'CC', 'CCLD', 'CFLAGS', 'CLEANBROKEN', 'CONFIGURESTAMPFILE', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEBUG_PREFIX_MAP', 'DEFAULTTUNE', 'DEPENDS', 'DISABLE_STATIC', 'DISTRO', 'EXTENDPE', 'EXTRA_OECONF', 'EXTRA_OEMAKE', 'FC', 'FULL_OPTIMIZATION', 'GCCPIE', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX',
  'ICECC_AS', 'ICECC_CC', 'ICECC_CXX', 'ICECC_VERSION', 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MACHINE', 'MACHINE_ARCH', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PACKAGE_ARCH', 'PE', 'PERL_HASH_SEED', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PKG_CONFIG_SYSTEM_INCLUDE_PATH', 'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN', 'PR', 'PREFERRED_ARM_INSTRUCTION_SET', 'PSEUDO_DISABLED', 'PV', 'PYTHONHASHSEED', 'QA_LOGFILE', 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S', 'SECURITY_CFLAGS', 'SECURITY_LDFLAGS', 'SECURITY_PIE_CFLAGS', 'SECURITY_STACK_PROTECTOR', 'SECURITY_STRINGFORMAT', 'SELECTED_OPTIMIZATION', 'SOURCE_DATE_EPOCH', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_DATADIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T',
  'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_CCARGS_MFLOAT', 'TUNE_CCARGS_MFPU', 'TUNE_FEATURES', 'TUNE_FEATURES_tune-armv5', 'TUNE_FEATURES_tune-armv5t', 'TUNE_FEATURES_tune-armv5te', 'TUNE_LDARGS', 'TUNE_PKGARCH', 'TZ', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_do_configure', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_sbindir', 'baselib', 'bbfatal_log', 'bbnote', 'bbwarn', 'bindir', 'bindir_cross', 'create_path', 'datadir', 'die', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_cross_kernel_cc', 'get_icecc', 'icecc_dep_prepend', 'icecc_dir', 'icecc_get_and_check_tool', 'icecc_get_external_tool',
  'icecc_get_path_tool', 'icecc_get_tool', 'icecc_get_tool_link', 'icecc_is_allarch', 'icecc_is_cross_canadian', 'icecc_is_kernel', 'icecc_is_native', 'icecc_path', 'icecc_version', 'includedir', 'includedir_native', 'infodir', 'lcl_maybe_fortify', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oe_runmake', 'oe_runmake_call', 'oldincludedir', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix', 'sbindir', 'servicedir', 'set_icecc_env', 'sharedstatedir', 'sysconfdir', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'use_icecc']
basehash changed from ac2e156620321beef53eb90cea8574bc to 5ab527b38214c867bd9574174151c0bf
List of dependencies for variable TARGET_OS changed from 'set()' to '{'ABIEXTENSION', 'LIBCEXTENSION'}'
List of dependencies for variable TARGET_LD_ARCH changed from 'set()' to '{'TUNE_LDARGS'}'
List of dependencies for variable TARGET_LDFLAGS changed from 'set()' to '{'SECURITY_LDFLAGS', 'ASNEEDED', 'TARGET_LINK_HASH_STYLE'}'
List of dependencies for variable BASEDEPENDS changed from '{'base_dep_prepend'}' to '{'BASE_DEFAULT_DEPS', 'base_dep_prepend'}'
changed items: {'BASE_DEFAULT_DEPS'}
List of dependencies for variable TARGET_PREFIX changed from 'set()' to '{'TARGET_SYS'}'
List of dependencies for variable TARGET_AS_ARCH changed from 'set()' to '{'TUNE_ASARGS'}'
List of dependencies for variable PACKAGE_ARCH changed from 'set()' to '{'MACHINE_ARCH'}'
List of dependencies for variable TARGET_CXXFLAGS changed from 'set()' to '{'TARGET_CFLAGS'}'
List of dependencies for variable TARGET_ARCH changed from 'set()' to '{'TUNE_ARCH'}'
List of dependencies for variable TARGET_CC_ARCH changed from 'set()' to '{'SECURITY_CFLAGS', 'TUNE_CCARGS'}'
List of dependencies for variable LDFLAGS changed from 'set()' to '{'TARGET_LDFLAGS'}'
List of dependencies for variable TARGET_CFLAGS changed from 'set()' to '{'SELECTED_OPTIMIZATION', 'TARGET_CPPFLAGS'}'
Dependency on variable PR was added
Dependency on variable PE was added
Dependency on variable ARM_THUMB_OPT was added
Dependency on variable BASE_DEFAULT_DEPS was added
Dependency on variable DEFAULTTUNE was added
Dependency on variable EXTENDPE was added
Dependency on variable ARMPKGARCH was added
Dependency on variable MACHINE_ARCH was added
Dependency on variable TUNE_FEATURES_tune-armv5 was added
Dependency on variable TUNE_FEATURES was added
Dependency on variable TARGET_LINK_HASH_STYLE was added
Dependency on variable lcl_maybe_fortify was added
Dependency on variable DEBUG_OPTIMIZATION was added
Dependency on variable SECURITY_PIE_CFLAGS was added
Dependency on variable SELECTED_OPTIMIZATION was added
Dependency on variable TUNE_CCARGS_MFLOAT was added
Dependency on variable SECURITY_CFLAGS was added
Dependency on variable FULL_OPTIMIZATION was added
Dependency on variable SECURITY_STRINGFORMAT was added
Dependency on variable ASNEEDED was added
Dependency on variable ARMPKGSFX_FPU was added
Dependency on variable GCCPIE was added
Dependency on variable PREFERRED_ARM_INSTRUCTION_SET was added
Dependency on variable TUNE_FEATURES_tune-armv5te was added
Dependency on variable SECURITY_LDFLAGS was added
Dependency on variable TUNE_CCARGS_MFPU was added
Dependency on variable TUNE_ARCH was added
Dependency on variable ABIEXTENSION was added
Dependency on variable LINKER_HASH_STYLE was added
Dependency on variable ARM_M_OPT was added
Dependency on variable ARM_INSTRUCTION_SET was added
Dependency on variable DEBUG_BUILD was added
Dependency on variable DEBUG_PREFIX_MAP was added
Dependency on variable TUNE_PKGARCH was added
Dependency on variable TUNE_FEATURES_tune-armv5t was added
Dependency on variable ARM_THUMB_SUFFIX was added
Dependency on variable SECURITY_STACK_PROTECTOR was added
Dependency on variable LIBCEXTENSION was added
Dependency on variable TUNE_CCARGS was added
Dependency on variable ARMPKGSFX_DSP was added
Dependency on variable ARMPKGARCH_tune-armv5te was added
Dependency on variable ARMPKGSFX_ENDIAN was added
Dependency on variable MACHINE was added
Dependency on variable TUNE_LDARGS was added
Dependency on variable TUNE_ASARGS was added
Dependency on variable ARMPKGSFX_EABI was added
Dependency on variable ARMPKGSFX_THUMB was added
Dependency on variable DEBUG_FLAGS was added
Variable TARGET_OS value changed from 'linux' to 'linux${LIBCEXTENSION}${ABIEXTENSION}'
Variable TARGET_LD_ARCH value changed from 'none' to '${TUNE_LDARGS}'
Variable TARGET_LDFLAGS value changed:
"[-none-] {+-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}+}"
Variable TARGET_AS_ARCH value changed from 'none' to '${TUNE_ASARGS}'
Variable TARGET_PREFIX value changed from '' to '${TARGET_SYS}-'
Variable PACKAGE_ARCH value changed from 'all' to '${MACHINE_ARCH}'
Variable TARGET_CXXFLAGS value changed from 'none' to '${TARGET_CFLAGS}'
Variable TARGET_ARCH value changed from 'allarch' to '${TUNE_ARCH}'
Variable TARGET_CPPFLAGS value changed from 'none' to ''
Variable TARGET_CC_ARCH value changed:
"[-none-] {+${TUNE_CCARGS} ${SECURITY_CFLAGS}+}"
Variable LDFLAGS value changed from '' to '${TARGET_LDFLAGS}'
Variable TARGET_CFLAGS value changed:
"[-none-] {+${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}+}"
runtaskdeps changed:
fbset/fbset-modes.bb.do_patch with hash 9332ef5e19ea111b5da7669ddc8c0637
 changed to
fbset/fbset-modes.bb.do_patch with hash 9a59ced6a021e0bbaa28f25f7617f9e7
fbset/fbset-modes.bb.do_prepare_recipe_sysroot with hash 2c39514f57b3f732b820bcbb703142aa
 changed to
fbset/fbset-modes.bb.do_prepare_recipe_sysroot with hash 7d5ab8f06ede5d28de82a4a2b1072c6a
Hash for dependent task fbset/fbset-modes.bb.do_patch changed from 9332ef5e19ea111b5da7669ddc8c0637 to 9a59ced6a021e0bbaa28f25f7617f9e7
Hash for dependent task fbset/fbset-modes.bb.do_prepare_recipe_sysroot changed from 2c39514f57b3f732b820bcbb703142aa to 7d5ab8f06ede5d28de82a4a2b1072c6a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/fbset/fbset-modes.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index 5f6f9909b9..b768553323 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -14,8 +14,6 @@ do_install() {
     install -m 0644 ${WORKDIR}/fb.modes ${D}${sysconfdir}
 }
 
-inherit allarch
-
 # fb.modes file is MACHINE_ARCH, base.bbclass correctly changes it to MACHINE_ARCH, but too late for allarch.bbclass
 # to disable "all" behavior (found when comparing qemuarm and qemux86 signatures)
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.17.1


