Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id B11B470538;
	Wed, 16 Jul 2014 14:55:36 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn18so4165417igb.3
	for <multiple recipients>; Wed, 16 Jul 2014 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2aOexzQ4Z6kookyK4spOAFXALZx5VPZ+CXrcf4YkQ2k=;
	b=xUj6WTTIAkuLen7lHA+A/rAIT+ZFqnRUbRke7FqAnKkF+tdbciOCxRYdxhh1Op4wUG
	YnU20AUxwVdR8zFwQBr8d+sZrHovlmDiSh9MsuSG2/375QR0U8WrOc9IHu9PHJzOOwV+
	s4uqVwASwaGEHfmPp5iK3wxW2BrjozsUSS7wyRt/iTE1HrRb7H2GvihI85e0i4XxdzCm
	5CIRlfO5+1NYS9gDrmQm+hd+07iAzAlMcu2YCw4a7zR7NftY7wnnNUtCCLjaMqI3wqB2
	s2iSh9paxN5t1Imb34+6r/thxNw6w1YHRDM/jfzeyYfE2iJUxYH5np38f/MBNNMdmuOJ
	9qdQ==
MIME-Version: 1.0
X-Received: by 10.42.82.6 with SMTP id b6mr5804674icl.51.1405522537497; Wed,
	16 Jul 2014 07:55:37 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 07:55:37 -0700 (PDT)
In-Reply-To: <20140716140238.GB2433@jama>
References: <20140716140238.GB2433@jama>
Date: Wed, 16 Jul 2014 07:55:37 -0700
Message-ID: <CAMKF1srwcYatH07Se1L6ofMWOgiF3n+d4wcfLXZ9gcF4NHRauw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, wrong PACKAGE_ARCHs 2014-07-16
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
X-List-Received-Date: Wed, 16 Jul 2014 14:55:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wednesday, July 16, 2014, Martin Jansa <martin.jansa@gmail.com> wrote:

> This is new report generated with oe-core/scripts/sstate-diff-machines.sh
>
> To reproduce it, you need "qemux86copy" MACHINE which is the same as
> qemux86 only with different name (to simulate 2 MACHINEs with same
> TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
> jansa/master branch:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/master
>
> Current logs:
>
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140716_132914.log/
>
> jansa/master branches are containing couple of pending changes (mostly
> to remove allarch), so if you try it with current master branches it
> will be (a lot) worse.
>
> ERROR: 43 issues were found in these recipes: android-tools dracut
> font-alias initscripts ipsec-tools libxml-filter-buffertext-perl
> libxml-sax-writer-perl lmsensors oprofile oprofileui oprofileui-server
> polkit-group-rule-datetime polkit-group-rule-network shr-theme-neo
> sysvinit tipcutils vpnc xfce4-session xl2tpd xserver-common
> xserver-nodm-init xuser-account
>
> The best way to read and fix this issues is to fix do_configure
> signatures first, because otherwise the same recipes are listed also in
> do_populate_sysroot and do_package_write_ipk logs (I've tried to remove
> "duplicities" in this e-mail)



There might be differences due to machine override being different ?
In past I have seen code operating on qemu machine overrides


>
>  === Comparing signatures for task do_configure.sigdata between
> qemux86copy and qemux86 ===
> ERROR: ipsec-tools different signature for task do_configure.sigdata
> between qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed
> from c253b062798fefe715db6372bbfcc7e8 to 32bab404579337cdcb4db68b10b8aa4c
>
> ERROR: oprofile different signature for task do_configure.sigdata between
> qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed
> from c253b062798fefe715db6372bbfcc7e8 to 32bab404579337cdcb4db68b10b8aa4c
>
> ERROR: tipcutils different signature for task do_configure.sigdata between
> qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed
> from c253b062798fefe715db6372bbfcc7e8 to 32bab404579337cdcb4db68b10b8aa4c
>
> ERROR: xl2tpd different signature for task do_configure.sigdata between
> qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed
> from c253b062798fefe715db6372bbfcc7e8 to 32bab404579337cdcb4db68b10b8aa4c
>
> ERROR: 4 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemux86.do_configure.sigdata.log
>
>
>  === Comparing signatures for task do_populate_sysroot.sigdata between
> qemux86copy and qemux86 ===
> ERROR: initscripts different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemux86
> Hash for dependent task initscripts_1.0.bb.do_install changed from
> aa6ce84410b6892ce2a48419c945b67d to a3e9caad2fed51a6aafac0b87ddef23d
>
> ERROR: ipsec-tools different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemux86
> Hash for dependent task ipsec-tools_0.8.1.bb.do_install changed from
> fb2c1fa673c08675b74483cf6804c094 to 978c0f8ab111ecd9d5422daa8d296277
>
> ERROR: oprofile different signature for task do_populate_sysroot.sigdata
> between qemux86copy and qemux86
> Hash for dependent task oprofile_0.9.9.bb.do_install changed from
> b8c56409c633da5bcb3a6b7bc1016eac to ba58a43b834b734d5b07ac87f37da314
>
> ERROR: tipcutils different signature for task do_populate_sysroot.sigdata
> between qemux86copy and qemux86
> Hash for dependent task tipcutils_2.0.6.bb.do_install changed from
> 0a7042ad46d0aed5f09182f6b14358e9 to 30821fe8c8e955d4b8cd1cb1741606a8
>
> ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata
> between qemux86copy and qemux86
> Hash for dependent task xl2tpd_git.bb.do_install changed from
> c2062974040d53d00db9cb51d50c5d51 to eb6456a6fcf21b31a7ea4cdb27bc4cb7
>
> ERROR: 5 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemux86.do_populate_sysroot.sigdata.log
>
>
>  === Comparing signatures for task do_package_write_ipk.sigdata between
> qemux86copy and qemux86 ===
> ERROR: android-tools different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task android-tools-conf_1.0.bb.do_packagedata changed
> from b73524bb4bcdfc1ee4974bb99c3a4366 to c2036d4aa8a660fc7dbde84491b01244
>
> ERROR: dracut different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from
> b9ceae429eabdabcf81fcbde35c07a34 to fb301cbc7b86caf92d4b2bda97c356b0
>
> ERROR: initscripts different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task initscripts_1.0.bb.do_packagedata changed from
> ad32b81eb710448dff20a0824349e6cc to 3d88ea84376699ada4cfa40a01ef09ad
> Hash for dependent task initscripts_1.0.bb.do_package changed from
> 0986a7744c1baaab29058797fdcf2164 to 7ce7479c20c34ff7f9d90512581f2ba7
>
> ERROR: ipsec-tools different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task ipsec-tools_0.8.1.bb.do_packagedata changed from
> 323fce7e68421b337d1cfd8dbb67261d to 1a4a668b92c22ffb40631e9f0041dc35
> Hash for dependent task ipsec-tools_0.8.1.bb.do_package changed from
> 4d8e61bb252c84971bc3c915d69eedc6 to dcf0d9dbf8b431025422cad16f2f3bf4
>
> ERROR: lmsensors different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task lmsensors-config_1.0.bb.do_packagedata changed
> from 75d42e3d25389da982d58ea2ab998050 to 8c53c7f35093da3823cfd417a09a5cc3
>
> ERROR: oprofile different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task oprofile_0.9.9.bb.do_package changed from
> 6371af777750423f8d11cb35361fc3e5 to 59ce8158b5948fb6ff205e1ece1b8f25
> Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from
> b9ceae429eabdabcf81fcbde35c07a34 to fb301cbc7b86caf92d4b2bda97c356b0
> Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from
> db4fbff1c6f4e69c5e346408b94d7176 to 509757f5b59c77d8db1e8f1abf5e8c7f
>
> ERROR: oprofileui different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from
> db4fbff1c6f4e69c5e346408b94d7176 to 509757f5b59c77d8db1e8f1abf5e8c7f
>
> ERROR: oprofileui-server different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from
> db4fbff1c6f4e69c5e346408b94d7176 to 509757f5b59c77d8db1e8f1abf5e8c7f
>
> ERROR: sysvinit different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task initscripts_1.0.bb.do_packagedata changed from
> ad32b81eb710448dff20a0824349e6cc to 3d88ea84376699ada4cfa40a01ef09ad
>
> ERROR: tipcutils different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task tipcutils_2.0.6.bb.do_package changed from
> 18ff8d0787429ba9725a3c6a741554c1 to 17de9a3641f3e60bbc7032ba0e32e992
> Hash for dependent task tipcutils_2.0.6.bb.do_packagedata changed from
> 69c92221f120a85d53c4f9a1736bf3be to 83379b2a8e92c161bdf27ba4e1d4f256
>
> ERROR: vpnc different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from
> b9ceae429eabdabcf81fcbde35c07a34 to fb301cbc7b86caf92d4b2bda97c356b0
>
> ERROR: xfce4-session different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
> Hash for dependent task xfce4-session_4.10.1.bb.do_packagedata changed
> from d51cce68c4e23c3b66c076ccef2940e1 to 4bd915ae152c62a72bd51f6d09e2415c
> Hash for dependent task xfce4-session_4.10.1.bb.do_package changed from
> c0324970a4b76544446827de87eaa1d3 to 61106bb262d79271403bfa4f4d85523d
>
> ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata
> between qemux86copy and qemux86
> Hash for dependent task xl2tpd_git.bb.do_package changed from
> 27cf36165c47ae4497746750dbe7c7a4 to fa7b47abfac6f3dfb60db6a2ecc15e11
> Hash for dependent task xl2tpd_git.bb.do_packagedata changed from
> 757c512785b36720c7e6b2b9405cfdf9 to ade6f220bb093658a02956afb90191c1
>
> ERROR: 13 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemux86.do_package_write_ipk.sigdata.log
>
>
>  === Comparing signatures for task do_configure.sigdata between
> qemux86copy and qemuarm ===
> INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
> ERROR: libxml-filter-buffertext-perl different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS',
> 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS',
> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS',
> 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
> 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP',
> 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS',
> 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF',
> 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH',
> 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS',
> 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE',
> 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM',
> 'OBJCOPY', 'OBJDUMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB',
> 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV',
> 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX',
> 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH',
> 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST',
> 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir',
> 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_license', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars',
> 'sysconfdir', 'sysroot_cleansstate', 'systemd_unitdir']
> to:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS',
> 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS',
> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS',
> 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
> 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP',
> 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS',
> 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF',
> 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH',
> 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS',
> 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE',
> 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM',
> 'OBJCOPY', 'OBJDUMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB',
> 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV',
> 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX',
> 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH',
> 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST',
> 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native',
> 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal',
> 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]',
> 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version',
> 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir',
> 'libdir_native', 'libexecdir', 'localstatedir', 'mandir',
> 'nonarch_base_libdir', 'oldincludedir', 'package_qa_check_license',
> 'package_qa_handle_error', 'package_qa_write_error', 'prefix',
> 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add',
> 'sstate_clean', 'sstate_clean_manifest', 'sstate_init',
> 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate',
> 'systemd_unitdir']
> basehash changed from 12fd21c38127be8f9353a731550684df to
> 914e7c808449928a35636b8582c7d02f
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task gcc-cross_4.9.bb.do_populate_sysroot changed from
> e4a890049e8cc22023556ae8956b6fbb to 7fb212e95c71cdd8a445bcaf9ee24b29
> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from
> b4106df72c91c8db07190cd9bc649cef to 368ae16600d838d4eb94a532e37eab1e
> Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from
> efbd3ede4ae537f66f97780342caf21b to dc45af00cb90c5e95910576f2e57a03e
> Hash for dependent task gcc-runtime_4.9.bb.do_populate_sysroot changed
> from cf63f74e6da45ba35e379033c8211fb8 to 0703d88be16ffb9afe68c65b1817ca2e
>
> ERROR: libxml-sax-writer-perl different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS',
> 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS',
> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS',
> 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
> 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP',
> 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS',
> 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF',
> 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH',
> 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS',
> 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE',
> 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM',
> 'OBJCOPY', 'OBJDUMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB',
> 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV',
> 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX',
> 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH',
> 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST',
> 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir',
> 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_license', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars',
> 'sysconfdir', 'sysroot_cleansstate', 'systemd_unitdir']
> to:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS',
> 'BB_CURRENTTASK', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS',
> 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS',
> 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
> 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP',
> 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS',
> 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF',
> 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH',
> 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS',
> 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE',
> 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM',
> 'OBJCOPY', 'OBJDUMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB',
> 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV',
> 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX',
> 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH',
> 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST',
> 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native',
> 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal',
> 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]',
> 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version',
> 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir',
> 'libdir_native', 'libexecdir', 'localstatedir', 'mandir',
> 'nonarch_base_libdir', 'oldincludedir', 'package_qa_check_license',
> 'package_qa_handle_error', 'package_qa_write_error', 'prefix',
> 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add',
> 'sstate_clean', 'sstate_clean_manifest', 'sstate_init',
> 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate',
> 'systemd_unitdir']
> basehash changed from e5118091542f0e7c8b362e1f59992bb0 to
> e8bbf8934a04bcd29ad7ae1ace523287
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task gcc-cross_4.9.bb.do_populate_sysroot changed from
> e4a890049e8cc22023556ae8956b6fbb to 7fb212e95c71cdd8a445bcaf9ee24b29
> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from
> b4106df72c91c8db07190cd9bc649cef to 368ae16600d838d4eb94a532e37eab1e
> Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from
> efbd3ede4ae537f66f97780342caf21b to dc45af00cb90c5e95910576f2e57a03e
> Hash for dependent task gcc-runtime_4.9.bb.do_populate_sysroot changed
> from cf63f74e6da45ba35e379033c8211fb8 to 0703d88be16ffb9afe68c65b1817ca2e
>
> INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
> INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
> ERROR: polkit-group-rule-datetime different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
> Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from
> 9052e25ae66f9aba06beabd2887d76f8 to eeebe7364b23f4cc564fd34aa37c4d64
> Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from
> 9f8dc8a5929525e1106a83b620e2b677 to c9e44f16cb9f3d830fac9fd5d8534692
> Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed
> from ed160b66ca0a36339a76741d4bab3402 to 5d9b87f55a06afe370416813187382da
> Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot
> changed from 1451668be4424173b233dde43f44dc21 to
> fc4530f0db07a3979c6b5f81e912568d
>
> ERROR: polkit-group-rule-network different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
> Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from
> 9052e25ae66f9aba06beabd2887d76f8 to eeebe7364b23f4cc564fd34aa37c4d64
> Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from
> 9f8dc8a5929525e1106a83b620e2b677 to c9e44f16cb9f3d830fac9fd5d8534692
> Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed
> from ed160b66ca0a36339a76741d4bab3402 to 5d9b87f55a06afe370416813187382da
> Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot
> changed from 1451668be4424173b233dde43f44dc21 to
> fc4530f0db07a3979c6b5f81e912568d
>
> ERROR: xserver-common different signature for task do_configure.sigdata
> between qemux86copy and qemuarm
> Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from
> efbd3ede4ae537f66f97780342caf21b to dc45af00cb90c5e95910576f2e57a03e
>
> ERROR: xuser-account different signature for task do_configure.sigdata
> between qemux86copy and qemuarm
> Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from
> 9052e25ae66f9aba06beabd2887d76f8 to eeebe7364b23f4cc564fd34aa37c4d64
> Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed
> from ed160b66ca0a36339a76741d4bab3402 to 5d9b87f55a06afe370416813187382da
> Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot
> changed from 1451668be4424173b233dde43f44dc21 to
> fc4530f0db07a3979c6b5f81e912568d
>
> ERROR: 6 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemuarm.do_configure.sigdata.log
>
>
>  === Comparing signatures for task do_populate_sysroot.sigdata between
> qemux86copy and qemuarm ===
> INFO: grub-efi-native task do_populate_sysroot.sigdata doesn't exist in
> qemuarm
> ERROR: libxml-filter-buffertext-perl different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN',
> 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX',
> 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'MULTI_PROVIDER_WHITELIST', 'NM', 'OBJCOPY',
> 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCONFIGTARGET',
> 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES',
> 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR',
> 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH',
> 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir',
> 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix',
> 'base_sbindir', 'baselib', 'bindir', 'datadir',
> 'do_populate_sysroot[sstate-inputdirs]',
> 'do_populate_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]',
> 'do_qa_staging', 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_staged', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_create_package', 'sstate_hardcode_path',
> 'sstate_init', 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs',
> 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
> to:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN',
> 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX',
> 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'MULTI_PROVIDER_WHITELIST', 'NM', 'OBJCOPY',
> 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCONFIGTARGET',
> 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES',
> 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR',
> 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH',
> 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'base_bindir', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]',
> 'do_populate_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]',
> 'do_qa_staging', 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_staged', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_create_package', 'sstate_hardcode_path',
> 'sstate_init', 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs',
> 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
> basehash changed from ce60889d0c59408bc2bc49d15ef8b005 to
> 6b83e24759d9e85ca166d500b5ffe425
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_install
> changed from 6719dae82a60cf8cdcbe74ca4fa3e12e to
> 9e6adf7e9272366102abc8c95fe47db3
>
> ERROR: libxml-sax-writer-perl different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN',
> 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX',
> 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'MULTI_PROVIDER_WHITELIST', 'NM', 'OBJCOPY',
> 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCONFIGTARGET',
> 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES',
> 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR',
> 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH',
> 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir',
> 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix',
> 'base_sbindir', 'baselib', 'bindir', 'datadir',
> 'do_populate_sysroot[sstate-inputdirs]',
> 'do_populate_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]',
> 'do_qa_staging', 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_staged', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_create_package', 'sstate_hardcode_path',
> 'sstate_init', 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs',
> 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
> to:
> ['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN',
> 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX',
> 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'MULTI_PROVIDER_WHITELIST', 'NM', 'OBJCOPY',
> 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCONFIGTARGET',
> 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES',
> 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR',
> 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH',
> 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES',
> 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE',
> 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE',
> 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'base_bindir', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]',
> 'do_populate_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]',
> 'do_qa_staging', 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'nonarch_base_libdir', 'oldincludedir',
> 'package_qa_check_staged', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir',
> 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean',
> 'sstate_clean_manifest', 'sstate_create_package', 'sstate_hardcode_path',
> 'sstate_init', 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs',
> 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
> basehash changed from ce60889d0c59408bc2bc49d15ef8b005 to
> 6b83e24759d9e85ca166d500b5ffe425
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_install changed
> from 47db247f244a254c6c68778779c018ec to 15c05a489228c71f5abaca78a8b8391c
>
> INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in
> qemuarm
> INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
> ERROR: polkit-group-rule-datetime different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Hash for dependent task polkit-group-rule-datetime.bb.do_install changed
> from e730e39d58b63d59fbec7134265603f6 to fec3097a18b181865eda9e2b0086e5b6
>
> ERROR: polkit-group-rule-network different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Hash for dependent task polkit-group-rule-network.bb.do_install changed
> from 7d36a01798a7202dbc7e472fe45c8bd0 to 45aafe063f2095f40d0c26921814f9db
>
> ERROR: xserver-common different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Hash for dependent task xserver-common_1.34.bb.do_install changed from
> 4be08f635bf852af6967bd32d252d4f7 to 1b8165969b06618f148cdcb76dd24c96
>
> ERROR: xuser-account different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> Hash for dependent task xuser-account_0.1.bb.do_install changed from
> 1c8104f20271f00b8e36cea77615d336 to 9a0923ba57d7cd3d26fdeeae988cb1fa
>
> ERROR: 6 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemuarm.do_populate_sysroot.sigdata.log
>
>
>  === Comparing signatures for task do_package_write_ipk.sigdata between
> qemux86copy and qemuarm ===
> ERROR: font-alias different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task font-util_1.3.0.bb.do_packagedata changed from
> e1a856469f51c2691ad4def4b0e62480 to bf98bd02a5ec99baad8b9d0205a33cce
>
> ERROR: libxml-filter-buffertext-perl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'ALLOW_EMPTY', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK',
> 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CONFFILES', 'CPP', 'CPPFLAGS',
> 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'DEPLOY_DIR', 'DEPLOY_DIR_IPK', 'DESCRIPTION', 'EXTENDPRAUTO',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOMEPAGE',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX',
> 'IPK_HIERARCHICAL_FEED', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPKGBUILDCMD',
> 'PACKAGES', 'PACKAGE_ARCH', 'PACKAGE_BEFORE_PN', 'PATCH_GET', 'PE',
> 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB',
> 'PERL_OWN_DIR', 'PKG', 'PKGDEST', 'PKGE', 'PKGR', 'PKGV', 'PKGWRITEDIRIPK',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PRAUTO',
> 'PSEUDO_DISABLED', 'PV', 'RANLIB', 'RCONFLICTS', 'RDEPENDS', 'RPROVIDES',
> 'RRECOMMENDS', 'RREPLACES', 'RSUGGESTS', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]',
> 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR', 'SSTATE_EXTRAPATH',
> 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH', 'SSTATE_PKGNAME',
> 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES', 'SSTATE_SWSPEC',
> 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR',
> 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE',
> 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'SUMMARY',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir',
> 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix',
> 'base_sbindir', 'baselib', 'bindir', 'datadir', 'do_package_ipk',
> 'do_package_write_ipk[fakeroot]', 'do_package_write_ipk[sstate-inputdirs]',
> 'do_package_write_ipk[sstate-outputdirs]', 'do_package_write_ipk[umask]',
> 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_package_additional_metadata', 'get_package_mapping',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'mapping_rename_hook', 'nonarch_base_libdir', 'oldincludedir',
> 'prefix', 'prefix_native', 'read_subpackage_metadata',
> 'runtime_mapping_rename', 'sbindir', 'servicedir', 'sharedstatedir',
> 'sstate_add', 'sstate_clean', 'sstate_clean_manifest',
> 'sstate_create_package', 'sstate_hardcode_path', 'sstate_init',
> 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'systemd_unitdir']
> to:
> ['ABIEXTENSION', 'ALLOW_EMPTY', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK',
> 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CONFFILES', 'CPP', 'CPPFLAGS',
> 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'DEPLOY_DIR', 'DEPLOY_DIR_IPK', 'DESCRIPTION', 'EXTENDPRAUTO',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOMEPAGE',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX',
> 'IPK_HIERARCHICAL_FEED', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPKGBUILDCMD',
> 'PACKAGES', 'PACKAGE_ARCH', 'PACKAGE_BEFORE_PN', 'PATCH_GET', 'PE',
> 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB',
> 'PERL_OWN_DIR', 'PKG', 'PKGDEST', 'PKGE', 'PKGR', 'PKGV', 'PKGWRITEDIRIPK',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PRAUTO',
> 'PSEUDO_DISABLED', 'PV', 'RANLIB', 'RCONFLICTS', 'RDEPENDS', 'RPROVIDES',
> 'RRECOMMENDS', 'RREPLACES', 'RSUGGESTS', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]',
> 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR', 'SSTATE_EXTRAPATH',
> 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH', 'SSTATE_PKGNAME',
> 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES', 'SSTATE_SWSPEC',
> 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR',
> 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE',
> 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'SUMMARY',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'base_bindir', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bindir', 'datadir', 'do_package_ipk',
> 'do_package_write_ipk[fakeroot]', 'do_package_write_ipk[sstate-inputdirs]',
> 'do_package_write_ipk[sstate-outputdirs]', 'do_package_write_ipk[umask]',
> 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_package_additional_metadata', 'get_package_mapping',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'mapping_rename_hook', 'nonarch_base_libdir', 'oldincludedir',
> 'prefix', 'prefix_native', 'read_subpackage_metadata',
> 'runtime_mapping_rename', 'sbindir', 'servicedir', 'sharedstatedir',
> 'sstate_add', 'sstate_clean', 'sstate_clean_manifest',
> 'sstate_create_package', 'sstate_hardcode_path', 'sstate_init',
> 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'systemd_unitdir']
> basehash changed from 14b7d3cd523cfdba62d7c6f91b510811 to
> b6b11788aa037ee6929e403b2439a40e
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task
> libxml-filter-buffertext-perl_1.01.bb.do_packagedata changed from
> 81429fd3c4b21f1ebd418c8e83e15138 to 19f1053cd581b448a981bc9731adbf14
> Hash for dependent task libxml-filter-buffertext-perl_1.01.bb.do_package
> changed from a375d287b30b08289a0787fda39c8f1d to
> ce6e6ab412f4247027904f956f4222a7
> Hash for dependent task libxml-sax-perl_0.99.bb.do_packagedata changed
> from d36259e29688181c0f1012d9099b2eef to cd7e167aa1f9e2ef61d88c075c1ccd42
> Hash for dependent task perl_5.20.0.bb.do_packagedata changed from
> 3c1843eddee09b2de23a4d910ccdc8a5 to 6944372bda2311d0dae641608ef497c3
>
> ERROR: libxml-sax-writer-perl different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Task dependencies changed from:
> ['ABIEXTENSION', 'ALLOW_EMPTY', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK',
> 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CONFFILES', 'CPP', 'CPPFLAGS',
> 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'DEPLOY_DIR', 'DEPLOY_DIR_IPK', 'DESCRIPTION', 'EXTENDPRAUTO',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOMEPAGE',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX',
> 'IPK_HIERARCHICAL_FEED', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPKGBUILDCMD',
> 'PACKAGES', 'PACKAGE_ARCH', 'PACKAGE_BEFORE_PN', 'PATCH_GET', 'PE',
> 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB',
> 'PERL_OWN_DIR', 'PKG', 'PKGDEST', 'PKGE', 'PKGR', 'PKGV', 'PKGWRITEDIRIPK',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PRAUTO',
> 'PSEUDO_DISABLED', 'PV', 'RANLIB', 'RCONFLICTS', 'RDEPENDS', 'RPROVIDES',
> 'RRECOMMENDS', 'RREPLACES', 'RSUGGESTS', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]',
> 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR', 'SSTATE_EXTRAPATH',
> 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH', 'SSTATE_PKGNAME',
> 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES', 'SSTATE_SWSPEC',
> 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR',
> 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE',
> 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'SUMMARY',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir',
> 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix',
> 'base_sbindir', 'baselib', 'bindir', 'datadir', 'do_package_ipk',
> 'do_package_write_ipk[fakeroot]', 'do_package_write_ipk[sstate-inputdirs]',
> 'do_package_write_ipk[sstate-outputdirs]', 'do_package_write_ipk[umask]',
> 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_package_additional_metadata', 'get_package_mapping',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'mapping_rename_hook', 'nonarch_base_libdir', 'oldincludedir',
> 'prefix', 'prefix_native', 'read_subpackage_metadata',
> 'runtime_mapping_rename', 'sbindir', 'servicedir', 'sharedstatedir',
> 'sstate_add', 'sstate_clean', 'sstate_clean_manifest',
> 'sstate_create_package', 'sstate_hardcode_path', 'sstate_init',
> 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'systemd_unitdir']
> to:
> ['ABIEXTENSION', 'ALLOW_EMPTY', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK',
> 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC',
> 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD',
> 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION',
> 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS',
> 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CONFFILES', 'CPP', 'CPPFLAGS',
> 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION',
> 'DEPLOY_DIR', 'DEPLOY_DIR_IPK', 'DESCRIPTION', 'EXTENDPRAUTO',
> 'EXTRA_STAGING_FIXMES', 'FC', 'FULL_OPTIMIZATION', 'HOMEPAGE',
> 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_PREFIX',
> 'IPK_HIERARCHICAL_FEED', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION',
> 'LINKER_HASH_STYLE', 'MAKE', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPKGBUILDCMD',
> 'PACKAGES', 'PACKAGE_ARCH', 'PACKAGE_BEFORE_PN', 'PATCH_GET', 'PE',
> 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB',
> 'PERL_OWN_DIR', 'PKG', 'PKGDEST', 'PKGE', 'PKGR', 'PKGV', 'PKGWRITEDIRIPK',
> 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
> 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PRAUTO',
> 'PSEUDO_DISABLED', 'PV', 'RANLIB', 'RCONFLICTS', 'RDEPENDS', 'RPROVIDES',
> 'RRECOMMENDS', 'RREPLACES', 'RSUGGESTS', 'SELECTED_OPTIMIZATION',
> 'SPECIAL_PKGSUFFIX', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]',
> 'SSTATEPOSTINSTFUNCS', 'SSTATE_BUILDDIR', 'SSTATE_EXTRAPATH',
> 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE_PKGARCH', 'SSTATE_PKGNAME',
> 'SSTATE_PKGSPEC', 'SSTATE_SCAN_CMD', 'SSTATE_SCAN_FILES', 'SSTATE_SWSPEC',
> 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR',
> 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE',
> 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'SUMMARY',
> 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS',
> 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',
> 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS',
> 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS',
> 'TUNE_CCARGS', 'TUNE_LDARGS', 'base_bindir', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',
> 'baselib', 'bindir', 'datadir', 'do_package_ipk',
> 'do_package_write_ipk[fakeroot]', 'do_package_write_ipk[sstate-inputdirs]',
> 'do_package_write_ipk[sstate-outputdirs]', 'do_package_write_ipk[umask]',
> 'docdir', 'exec_prefix', 'generate_sstatefn',
> 'get_package_additional_metadata', 'get_package_mapping',
> 'get_perl_version', 'includedir', 'includedir_native', 'infodir',
> 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'mandir', 'mapping_rename_hook', 'nonarch_base_libdir', 'oldincludedir',
> 'prefix', 'prefix_native', 'read_subpackage_metadata',
> 'runtime_mapping_rename', 'sbindir', 'servicedir', 'sharedstatedir',
> 'sstate_add', 'sstate_clean', 'sstate_clean_manifest',
> 'sstate_create_package', 'sstate_hardcode_path', 'sstate_init',
> 'sstate_install', 'sstate_package', 'sstate_state_fromvars',
> 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir',
> 'systemd_unitdir']
> basehash changed from cb684427af381d2c058eb6b06e4e7c22 to
> b5a0de98ed74687f0261343dbb3867a7
> List of dependencies for variable TUNE_ARCH changed from
> 'set(['X86ARCH32', 'X86ARCH64'])' to 'set([])'
> Dependency on Variable X86ARCH32 was removed
> Dependency on Variable X86ARCH64 was removed
> Variable TUNE_LDARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable TUNE_CCARGS value changed from ' -m32 -march=i586' to '
> -march=armv5te -marm -mthumb-interwork'
> Variable TUNE_ARCH value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", ""
> ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}
> TUNE_FEATURES{m32} = Set
> TUNE_FEATURES{m64} = Unset
> TUNE_FEATURES{mx32} = Unset' to '${@bb.utils.contains("TUNE_FEATURES",
> "bigendian", "armeb", "arm", d)}
> TUNE_FEATURES{bigendian} = Unset'
> Variable TUNE_ASARGS value changed from '
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}
> TUNE_FEATURES{mx32} = Unset' to ''
> Variable ABIEXTENSION value changed from
> '${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}
> TUNE_FEATURES{mx32} = Unset' to 'eabi'
> Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_package changed
> from 7778aae49e86ba8faa48ddb150589077 to 8b554a31e3397a142867d90ad988cfc9
> Hash for dependent task
> libxml-filter-buffertext-perl_1.01.bb.do_packagedata changed from
> 81429fd3c4b21f1ebd418c8e83e15138 to 19f1053cd581b448a981bc9731adbf14
> Hash for dependent task libxml-sax-writer-perl_0.54.bb.do_packagedata
> changed from 5f64049566e39a95391438d3254d2db4 to
> 07bd16524032e03dec17b6d772635f60
> Hash for dependent task perl_5.20.0.bb.do_packagedata changed from
> 3c1843eddee09b2de23a4d910ccdc8a5 to 6944372bda2311d0dae641608ef497c3
>
> ERROR: polkit-group-rule-datetime different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task polkit-group-rule-datetime.bb.do_package changed
> from d725604428a5f831cb8b536076c2d4f8 to 13b6a59908af32a1dd30c705bbfb4db9
> Hash for dependent task polkit-group-rule-datetime.bb.do_packagedata
> changed from 32905e81ed1d0961480b5bc23cf28c08 to
> d7ef33416a2f764c15a6aa7eda7e5333
>
> ERROR: polkit-group-rule-network different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task polkit-group-rule-network.bb.do_package changed
> from 3d0ea872e189b736afd2902fa480587d to add7977defe2232924c703ec38154778
> Hash for dependent task polkit-group-rule-network.bb.do_packagedata
> changed from fbbc100b3a3b5abeb1b53272fc8a07a3 to
> c2519a9ffac7f0a1945686b43ee4a85e
>
> ERROR: shr-theme-neo different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task icon-theme-neo_git.bb.do_packagedata changed from
> d3738ce45bddde1a0be4d4c68d349517 to e2dd25534b9e3a94bd13094197daf73a
>
> ERROR: xserver-common different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task xmodmap_1.0.8.bb.do_packagedata changed from
> ff9b9af60cc2e49838b2f9490eac2f07 to b8c3270367b16c6f7bc3af0bad59b227
> Hash for dependent task xinput-calibrator_git.bb.do_packagedata changed
> from 71315c15171c8f8c6165321d191a5586 to c3fd6578f7ffb634b652ea87dbcaad7d
> Hash for dependent task fbset_2.1.bb.do_packagedata changed from
> 7c7dcb40bfd3a15145952960918d2c51 to 3e1512f17e924046d25b58787dd7dee6
> Hash for dependent task xserver-common_1.34.bb.do_package changed from
> 5b2750a755bc49c8a0bb91c7fd24f4ae to f5d83030afd20c78da756eb39f9682c9
> Hash for dependent task xdpyinfo_1.3.1.bb.do_packagedata changed from
> 9c775b1fa215ac8879e57d0e1fd30b06 to 9e24f3bc70b12fee7477f51212a50b28
> Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from
> 425dde47c9756dbb2408cd69c935418d to 1c236e1ff20853154e9f96152059078f
> Hash for dependent task xrandr_1.4.2.bb.do_packagedata changed from
> 5e15abe46d9f78e226a88991023724b2 to 4b6faaa01d3301e5583533331b4b0ba2
>
> ERROR: xserver-nodm-init different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from
> 425dde47c9756dbb2408cd69c935418d to 1c236e1ff20853154e9f96152059078f
> Hash for dependent task xserver-nodm-init_2.0.bb.do_packagedata changed
> from 57d76eae66dc2bf916935528767feb23 to ec0f251195991dea975cdc7388ef4e61
> Hash for dependent task xinit_1.3.3.bb.do_packagedata changed from
> cd4de65b468fdffc262dc4c96b901bc5 to d92dc2b50ffd0cadb615112a11064ac5
> Hash for dependent task xserver-nodm-init_2.0.bb.do_package changed from
> 965ba3c7944a5fb457c3342e1440887c to ccb33da1026eacb5f30bc96c125245c1
>
> ERROR: xuser-account different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemuarm
> Hash for dependent task xuser-account_0.1.bb.do_packagedata changed from
> 28f28291a5ab1cba1934f7e20942158f to 0b5d82eae7c938e689776851a2fdc496
> Hash for dependent task xuser-account_0.1.bb.do_package changed from
> dd4d524c51b8be5b93757f1a100d92f1 to de3a4efd100982d69f2e156b4c9a5258
>
> ERROR: 9 errors found in
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-diff/1405517355/signatures.qemuarm.do_package_write_ipk.sigdata.log
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:;>
>

