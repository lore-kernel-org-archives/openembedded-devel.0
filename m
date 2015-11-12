Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC7477223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:12:27 +0000 (UTC)
Received: by wmww144 with SMTP id w144so204641873wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CMjQ7aBRl6KleCeA+ELp2j1DgIduDMyl5JZbbTNFgEI=;
	b=leV85zTL0jV1J0co7Mqgfh1yEyGyWCQtc5PPDo1kUH/Yd8j4d+P5xKjm7126W4Yvng
	m4L+2f2g5pBtEfuvEN+vlJS0E0XA3ldoMhXHQC0eCEPK8TG1kVY0aCEwxelhHs+0jrpr
	iOZ84W9tA2dk85IzGDGWLsfxc527k/Vo84NDxzIVsyaz76B/7xUYH4ztqkn+nFGCsE1i
	AZTrZ0XU0Vkac2PiAQbUkoC1x5gFfm+fWnPmpf6YNULHs9iFvhR331/NOprjDKnIlGQL
	ZNJyicPlz4a5GFf0Se0yzevqfV7myicVHucXNlt2KI3cbuFKz0XO7oZ6l97n3uS2eTeS
	/bNQ==
X-Received: by 10.28.21.134 with SMTP id 128mr46597885wmv.29.1447341147190;
	Thu, 12 Nov 2015 07:12:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s2sm31209123wmd.13.2015.11.12.07.12.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 07:12:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:12:41 +0100
Message-Id: <1447341161-27811-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-perl] libauthen-sasl-perl, libdigest-hmac-perl, libio-socket-ssl-perl: don't set PACKAGE_ARCH = "all"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 15:12:28 -0000

* like other perl libraries
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: libauthen-sasl-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
basehash changed from b763f116791dcfd3397a567aadf33af1 to 74942d7d488bd2407a53f216def91d03
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} = Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to ' -march=armv5te -mthumb  -mthumb-interwork'
Variable TUNE_ARCH value changed from '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} = Set
TUNE_FEATURES{m64} = Unset
TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} = Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} = Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} = Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libauthenlibauthen-sasl-perl_2.16.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libauthenlibauthen-sasl-perl_2.16.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot']
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b386d52
 changed to
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6122fc8ab74fb7855854a458f17af6cc
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb.do_populate_sysroot with hash 30baea95a6cd93b85bb73af985ade681
 changed to
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb.do_populate_sysroot with hash 79873f0dca561218ce1a8f4a6bda63f2
openembedded-core/meta/recipes-core/glibc/glibc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
openembedded-core/meta/recipes-core/glibc/glibc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
openembedded-core/meta/recipes-devtools/perl/perl_5.22.0.bb.do_populate_sysroot with hash 518c240274a630b9760a9a4228466878
 changed to
openembedded-core/meta/recipes-devtools/perl/perl_5.22.0.bb.do_populate_sysroot with hash d116d80b83736fb332556760dc7e5a72
Hash for dependent task gccgcc-runtime_5.2.bb.do_populate_sysroot changed from 30baea95a6cd93b85bb73af985ade681 to 79873f0dca561218ce1a8f4a6bda63f2
Hash for dependent task gccgcc-cross_5.2.bb.do_populate_sysroot changed from 6496d4375c62146d7c0063af4b386d52 to 6122fc8ab74fb7855854a458f17af6cc
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from 467aec2bee3aea4b15e1de8b0c34cc13 to b58254263eec016f62b8245d94983aca
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from 518c240274a630b9760a9a4228466878 to d116d80b83736fb332556760dc7e5a72

ERROR: libdigest-hmac-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedi32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} = Set
TUNE_FEATURES{m64} = Unset
TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} = Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} = Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} = Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libdigestlibdigest-hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libdigestlibdigest-hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot']
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b386d52
 changed to
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6122fc8ab74fb7855854a458f17af6cc
/home/jenkins/oe/worlnged from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',
'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS',
'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
basehash changed from 420659583378ef3654158cacfe50aa76 to be004e4778dc3647c9c1782a5856701b
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} = Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to ' -march=armv5te -mthumb  -mthumb-interwork'
Variable TUNE_ARCH value changed from '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} = Set
TUNE_FEATURES{m64} = Unset
TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} = Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} = Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} = Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libiolibio-socket-ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libiolibio-socket-ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot']
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b386d52
 changed to
openembedded-core/meta/recipes-devtools/gcc/gcc-cross_5.2.bb.do_populate_sysroot with hash 6122fc8ab74fb7855854a458f17af6cc
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb.do_populate_sysroot with hash 30baea95a6cd93b85bb73af985ade681
 changed to
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb.do_populate_sysroot with hash 79873f0dca561218ce1a8f4a6bda63f2
openembedded-core/meta/recipes-core/glibc/glibc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
openembedded-core/meta/recipes-core/glibc/glibc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
openembedded-core/meta/recipes-devtools/perl/perl_5.22.0.bb.do_populate_sysroo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 --
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb | 1 -
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb  | 2 --
 3 files changed, 5 deletions(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 361bdf1..e658a5f 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -25,6 +25,4 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-PACKAGE_ARCH = "all"
 BBCLASSEXTEND = "native"
-
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index affc9f6..8f1c98c 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -22,5 +22,4 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-PACKAGE_ARCH = "all"
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
index 19dec83..ba5788a 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
@@ -24,8 +24,6 @@ S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
 inherit cpan ptest
 
-PACKAGE_ARCH = "all"
-
 do_install_append () {
     mkdir -p ${D}${docdir}/${PN}/
     cp ${S}/BUGS ${D}${docdir}/${PN}/
-- 
2.6.3


