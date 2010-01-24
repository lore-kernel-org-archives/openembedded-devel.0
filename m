Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NZBL3-0005pW-CV
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 23:53:52 +0100
Received: by ewy4 with SMTP id 4so3560487ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 14:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=K8xf0ovG+rua+K5KfDQEm/ig/IB3CuJB/j5itEK765g=;
	b=jFStMwSJW7UnoQZntmDeGT49l8w1L4qfibeUPguHaalKPn4F+B8WAQfSIOPzBZ2ZDx
	gnJlsPGDPvuos0NDcvCaD7800xn5cIVJXW0gbuWdgte1FXRv62yEElJJJ8Ny0NiHNpyY
	asSN5qLx6iOk74zRyZwZf3mEKWVhBDiYy7OjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Q0yIXllKY8qKHjzmWxamMxyjyhU7q0BO0P/hbATaKhrrThsOPFqOjKFrAZgZfLOr/a
	kh6BQ8Kz4pViuw+ARV3pvXZSn35Rv3osGK3q6j8ZvzkqD4B4Pu8LeuLG4q/ahNlj8XZK
	LexDSlBrGLsIFL9fqQQWCkRx6AorJ8lqqvATY=
MIME-Version: 1.0
Received: by 10.213.0.209 with SMTP id 17mr1605098ebc.89.1264373486951; Sun, 
	24 Jan 2010 14:51:26 -0800 (PST)
Date: Sun, 24 Jan 2010 23:51:26 +0100
Message-ID: <d1b08f941001241451m316d86ecpa46640e907479c63@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: QA: Fixes needed by console-image
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
X-List-Received-Date: Sun, 24 Jan 2010 22:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I post here some bits of the log of console-image: my understanding is
we should convert asap the packages using legacy do_stage.
Most of these exhibit the   cp: cannot stat `...*': No such file or
directory issue.
Others have just bad packaging, not logged by our QA checks. Some are
heavy recipes so I let the work to the senior devs :)

Fixes are available here:   http://git.pokylinux.org/cgit.cgi/poky/log/

Regards
Andrea


andrea@mizar /oe/build $ time bitbake console-image
NOTE: Handling BitBake files: - (0350/7994) [ 4 %]__builtin__:8:
DeprecationWarning: the sets module is deprecated

NOTE: Running task 42 of 4025 (ID: 222,
/oe/org.openembedded.dev/recipes/coreutils/coreutils-native_7.2.bb,
do_patch)
NOTE: Applying patch 'coreutils-7.2-fix-sort-segfault.patch'
(../org.openembedded.dev/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch)
NOTE: self._current is None
NOTE: patches is [{'remote':
'file://coreutils-7.2-fix-sort-segfault.patch', 'strippath': '1',
'file': '/oe/org.openembedded.dev/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch',
'filemd5': '325209586106c662267b1bc3d64921fa'}]
NOTE: applying patch {'remote':
'file://coreutils-7.2-fix-sort-segfault.patch', 'strippath': '1',
'file': '/oe/org.openembedded.dev/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch',
'filemd5': '325209586106c662267b1bc3d64921fa'}
NOTE: Running task 43 of 4025 (ID: 223,
/oe/org.openembedded.dev/recipes/coreutils/coreutils-native_7.2.bb,
do_configure)
NOTE: Running task 44 of 4025 (ID: 45,
/oe/org.openembedded.dev/recipes/quilt/quilt-native_0.48.bb,
do_unpack)
NOTE: Unpacking ../sources/quilt-0.48.tar.gz to
tmp/work/i686-linux/quilt-native-0.48-r0/
NOTE: Running task 45 of 4025 (ID: 46,
/oe/org.openembedded.dev/recipes/quilt/quilt-native_0.48.bb, do_patch)
NOTE: Applying patch 'install.patch'
(../org.openembedded.dev/recipes/quilt/quilt-0.48/install.patch)
NOTE: self._current is None
NOTE: patches is [{'remote': 'file://install.patch', 'strippath': '1',
'file': '/oe/org.openembedded.dev/recipes/quilt/quilt-0.48/install.patch',
'filemd5': 'd18e682e0d69b48a0314af5a420f9f8a'}]
NOTE: applying patch {'remote': 'file://install.patch', 'strippath':
'1', 'file': '/oe/org.openembedded.dev/recipes/quilt/quilt-0.48/install.patch',
'filemd5': 'd18e682e0d69b48a0314af5a420f9f8a'}
NOTE: Running task 46 of 4025 (ID: 55,
/oe/org.openembedded.dev/recipes/quilt/quilt-native_0.48.bb,
do_distribute_sources)


NOTE: Running task 126 of 4025 (ID: 51,
/oe/org.openembedded.dev/recipes/quilt/quilt-native_0.48.bb,
do_populate_staging)
cp: cannot stat
`/oe/build/tmp/work/i686-linux/quilt-native-0.48-r0/sysroot-destdir//oe/build/tmp/*':
No such file or directory
NOTE: Running task 127 of 4025 (ID: 54,
/oe/org.openembedded.dev/recipes/quilt/quilt-native_0.48.bb,
do_package)


NOTE: Running task 694 of 4025 (ID: 1317,
/oe/org.openembedded.dev/recipes/openssl/openssl-native_0.9.8j.bb,
do_package)
cp: cannot stat
`/oe/build/tmp/work/i686-linux/openssl-native-0.9.8j-r11.1/image/*':
No such file or directory
NOTE: Running task 695 of 4025 (ID: 1807,
/oe/org.openembedded.dev/recipes/ncurses/ncurses_5.4.bb, do_configure)


NOTE: Legacy staging mode for
/oe/org.openembedded.dev/recipes/libxml/libxml2-native_2.7.3.bb
NOTE: Running task 874 of 4025 (ID: 3886,
/oe/org.openembedded.dev/recipes/libxml/libxml2-native_2.7.3.bb,
do_package)
cp: cannot stat
`/oe/build/tmp/work/i686-linux/libxml2-native-2.7.3-r0/image/*': No
such file or directory


NOTE: Running task 1687 of 4025 (ID: 1771,
/oe/org.openembedded.dev/recipes/gnutls/gnutls_2.4.2.bb, do_compile)
NOTE: the following files were installed but not shipped in any package:
NOTE:   /etc/rpc
NOTE: Multiple libraries (libnss_hesiod.so.2, libnss_nis.so.2,
libnss_nisplus.so.2) found, but LEAD_SONAME 'libc.so' doesn't match
any of them
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: package glibc-dbg skipped
NOTE: Running task 1688 of 4025 (ID: 1772,
/oe/org.openembedded.dev/recipes/gnutls/gnutls_2.4.2.bb, do_install)


Packaged contents of glibc-gconv-ibm855 into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-ibm855_2.9-r35.3.5_armv5te.ipk
Packaged contents of glibc-gconv-tis-620 into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-tis-620_2.9-r35.3.5_armv5te.ipk
Packaged contents of glibc-gconv-iso8859-5 into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-iso8859-5_2.9-r35.3.5_armv5te.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/libudev.so
NOTE:   /usr/lib/libvolume_id.so
NOTE:   /usr/lib/pkgconfig/libudev.pc
NOTE:   /usr/lib/pkgconfig/libvolume_id.pc
Packaged contents of glibc-gconv-viscii into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-viscii_2.9-r35.3.5_armv5te.ipk


Packaged contents of glibc-gconv-ibm9066 into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-ibm9066_2.9-r35.3.5_armv5te.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/share/getopt/getopt-parse.bash
NOTE:   /usr/share/getopt/getopt-test.tcsh
NOTE:   /usr/share/getopt/getopt-parse.tcsh
NOTE:   /usr/share/getopt/getopt-test.bash
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
NOTE: util-linux-ng contains dangling symlink to /usr/sbin/shutdown
Packaged contents of glibc-gconv-ibm1162 into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-gconv-ibm1162_2.9-r35.3.5_armv5te.ipk


Packaged contents of glibc-charmap-jis-c6229-1984-kana into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-charmap-jis-c6229-1984-kana_2.9-r35.3.5_armv5te.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.2200.1-gdb.py
NOTE:   /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.2200.1-gdb.py
Packaged contents of glibc-charmap-jis-c6229-1984-hand into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-charmap-jis-c6229-1984-hand_2.9-r35.3.5_armv5te.ipk


Packaged contents of glibc-binary-localedata-sk-sk into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-binary-localedata-sk-sk_2.9-r35.3.5_armv5te.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/security/.debug/pam_keyinit.so
NOTE:   /usr/lib/security/.debug/pam_stress.so
NOTE:   /usr/lib/security/.debug/pam_faildelay.so
NOTE:   /usr/lib/security/.debug/pam_timestamp.so
NOTE:   /usr/lib/security/.debug/pam_env.so
NOTE:   /usr/lib/security/.debug/pam_localuser.so
NOTE:   /usr/lib/security/.debug/pam_lastlog.so
NOTE:   /usr/lib/security/.debug/pam_xauth.so
NOTE:   /usr/lib/security/.debug/pam_rhosts.so
NOTE:   /usr/lib/security/.debug/pam_debug.so
NOTE:   /usr/lib/security/.debug/pam_deny.so
NOTE:   /usr/lib/security/.debug/pam_echo.so
NOTE:   /usr/lib/security/.debug/pam_listfile.so
NOTE:   /usr/lib/security/.debug/pam_warn.so
NOTE:   /usr/lib/security/.debug/pam_loginuid.so
NOTE:   /usr/lib/security/.debug/pam_rootok.so
NOTE:   /usr/lib/security/.debug/pam_securetty.so
NOTE:   /usr/lib/security/.debug/pam_issue.so
NOTE:   /usr/lib/security/.debug/pam_limits.so
NOTE:   /usr/lib/security/.debug/pam_mkhomedir.so
NOTE:   /usr/lib/security/.debug/pam_wheel.so
NOTE:   /usr/lib/security/.debug/pam_succeed_if.so
NOTE:   /usr/lib/security/.debug/pam_tally2.so
NOTE:   /usr/lib/security/.debug/pam_tally.so
NOTE:   /usr/lib/security/.debug/pam_time.so
NOTE:   /usr/lib/security/.debug/pam_namespace.so
NOTE:   /usr/lib/security/.debug/pam_access.so
NOTE:   /usr/lib/security/.debug/pam_permit.so
NOTE:   /usr/lib/security/.debug/pam_pwhistory.so
NOTE:   /usr/lib/security/.debug/pam_nologin.so
NOTE:   /usr/lib/security/.debug/pam_unix.so
NOTE:   /usr/lib/security/.debug/pam_mail.so
NOTE:   /usr/lib/security/.debug/pam_filter.so
NOTE:   /usr/lib/security/.debug/pam_exec.so
NOTE:   /usr/lib/security/.debug/pam_group.so
NOTE:   /usr/lib/security/.debug/pam_shells.so
NOTE:   /usr/lib/security/.debug/pam_motd.so
NOTE:   /usr/lib/security/.debug/pam_ftp.so
NOTE:   /usr/lib/security/.debug/pam_umask.so
NOTE:   /usr/lib/security/pam_filter/.debug/upperLOWER
Packaged contents of glibc-binary-localedata-ku-tr into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-binary-localedata-ku-tr_2.9-r35.3.5_armv5te.ipk


Packaged contents of glibc-binary-localedata-es-cr into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-binary-localedata-es-cr_2.9-r35.3.5_armv5te.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /lib/modules/2.6.26/modules.order
Packaged contents of glibc-binary-localedata-fur-it into
/oe/build/tmp/deploy/glibc/ipk/armv5te/glibc-binary-localedata-fur-it_2.9-r35.3.5_armv5te.ipk


Packaged contents of kernel-module-snd-page-alloc into
/oe/build/tmp/deploy/glibc/ipk/c7x0/kernel-module-snd-page-alloc_2.6.26-r12.5_c7x0.ipk
NOTE: Multiple libraries (libpolkit-dbus.so.2, libpolkit.so.2,
libpolkit-grant.so.2) found and LEAD_SONAME not defined
Packaged contents of kernel-module-snd-mixer-oss into
/oe/build/tmp/deploy/glibc/ipk/c7x0/kernel-module-snd-mixer-oss_2.6.26-r12.5_c7x0.ipk


Packaged contents of kernel-module-zaurus into
/oe/build/tmp/deploy/glibc/ipk/c7x0/kernel-module-zaurus_2.6.26-r12.5_c7x0.ipk
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/share/common-lisp/source/gpg-error/gpg-error-package.lisp
NOTE:   /usr/share/common-lisp/source/gpg-error/gpg-error-codes.lisp
NOTE:   /usr/share/common-lisp/source/gpg-error/gpg-error.asd
NOTE:   /usr/share/common-lisp/source/gpg-error/gpg-error.lisp
Packaged contents of kernel-module-pegasus into
/oe/build/tmp/deploy/glibc/ipk/c7x0/kernel-module-pegasus_2.6.26-r12.5_c7x0.ipk


NOTE: Running task 2120 of 4025 (ID: 3715,
/oe/org.openembedded.dev/recipes/tcltk/tcl-native_8.4.19.bb,
do_package)
cp: cannot stat
`/oe/build/tmp/work/i686-linux/tcl-native-8.4.19-r4/image/*': No such
file or directory
NOTE: Running task 2121 of 4025 (ID: 1029,
/oe/org.openembedded.dev/recipes/avahi/avahi_0.6.25.bb,
do_populate_staging)


NOTE: Running task 2560 of 4025 (ID: 1907,
/oe/org.openembedded.dev/recipes/libusb/libusb-compat_0.1.2.bb,
do_qa_staging)
NOTE: Multiple libraries (libgstreamer-0.10.so.0,
libgstdataprotocol-0.10.so.0, libgstbase-0.10.so.0,
libgstcheck-0.10.so.0, libgstcontroller-0.10.so.0,
libgstnet-0.10.so.0) found and LEAD_SONAME not defined
NOTE: Running task 2561 of 4025 (ID: 1898,
/oe/org.openembedded.dev/recipes/libusb/libusb-compat_0.1.2.bb,
do_build)


NOTE: Unpacking ../org.openembedded.dev/recipes/opkg/files/configure
to tmp/work/i686-linux/opkg-native-0.1.6+svnr446-r19/
NOTE: Running task 2684 of 4025 (ID: 84,
/oe/org.openembedded.dev/recipes/opkg/opkg-native_svn.bb, do_patch)
NOTE: Patch 'opkg_unarchive.patch' applies to earlier revisions
NOTE: Patch 'opkg-intercept-cleanup.patch' applies to earlier revisions
NOTE: Patch 'opkg-libdir.patch' applies to earlier revisions
NOTE: Running task 2685 of 4025 (ID: 85,
/oe/org.openembedded.dev/recipes/opkg/opkg-native_svn.bb,
do_configure)


NOTE: Running task 2854 of 4025 (ID: 183,
/oe/org.openembedded.dev/recipes/kexecboot/linux-kexecboot_2.6.26.bb,
do_compile)
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/ssl/openssl.cnf
NOTE:   /usr/lib/ssl/misc/CA.pl
NOTE:   /usr/lib/ssl/misc/CA.sh
NOTE: Running task 2855 of 4025 (ID: 1724,
/oe/org.openembedded.dev/recipes/openssl/openssl_0.9.8j.bb,
do_package_write_ipk)


NOTE: Applying patch 'pppoatm-makefile.patch'
(../org.openembedded.dev/recipes/ppp/ppp-2.4.3/pppoatm-makefile.patch)
NOTE: Applying patch 'enable-ipv6.patch'
(../org.openembedded.dev/recipes/ppp/ppp-2.4.3/enable-ipv6.patch)
NOTE: Multiple libraries (libnss_mdns6_minimal.so.2,
libnss_mdns4.so.2, libnss_mdns4_minimal.so.2, libnss_mdns6.so.2,
libnss_mdns_minimal.so.2, libnss_mdns.so.2) found and LEAD_SONAME not
defined
NOTE: Applying patch 'makefile-remove-hard-usr-reference.patch'
(../org.openembedded.dev/recipes/ppp/ppp-2.4.3/makefile-remove-hard-usr-reference.patch)


NOTE: Running task 2926 of 4025 (ID: 384,
/oe/org.openembedded.dev/recipes/sysvinit/sysvinit_2.86.bb,
do_distribute_sources)
NOTE: sysvinit-utils contains dangling symlink to /usr/bin/last
NOTE: sysvinit contains dangling symlink to /sbin/halt
NOTE: sysvinit contains dangling symlink to /sbin/init
NOTE: sysvinit contains dangling symlink to /sbin/halt
NOTE: Running task 2927 of 4025 (ID: 381, /oe/org.openembedded.dev/


NOTE: Running task 3061 of 4025 (ID: 801,
/oe/org.openembedded.dev/recipes/tasks/task-boot.bb, do_package)
cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/task-boot-1.0-r52/image/*':
No such file or directory
NOTE: Running task 3062 of 4025 (ID: 802,
/oe/org.openembedded.dev/recipes/tasks/task-boot.bb,
do_distribute_sources)


NOTE: Running task 3367 of 4025 (ID: 2137,
/oe/org.openembedded.dev/recipes/base-files/base-files_3.0.14.bb,
do_package)
NOTE: base-files contains dangling symlink to /media/net
NOTE: base-files contains dangling symlink to /media/cf
NOTE: base-files contains dangling symlink to /media/ram
NOTE: base-files contains dangling symlink to /media/card
NOTE: Running task 3368 of 4025 (ID: 2134,
/oe/org.openembedded.dev/recipes/base-files/base-files_3.0.14.bb,
do_populate_staging)


NOTE: Running task 3439 of 4025 (ID: 288,
/oe/org.openembedded.dev/recipes/tasks/task-base.bb, do_package)
cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/task-base-1.0-r87/image/*':
No such file or directory
NOTE: Running task 3440 of 4025 (ID: 309,
/oe/org.openembedded.dev/recipes/psplash/psplash-angstrom_svn.bb,
do_package_stage_all)


NOTE: Running task 3852 of 4025 (ID: 573,
/oe/org.openembedded.dev/recipes/angstrom/angstrom-libc-fixup-hack.bb,
do_package)
cp: cannot stat
`/oe/build/tmp/work/all-angstrom-linux-gnueabi/angstrom-libc-fixup-hack-1.0-r0/image/*':
No such file or directory
NOTE: Running task 3853 of 4025 (ID: 596,
/oe/org.openembedded.dev/recipes/portmap/portmap_6.0.bb, do_rm_work)


NOTE: Running task 3979 of 4025 (ID: 211,
/oe/org.openembedded.dev/recipes/sharp-binary-only/sharp-flash-header-c700.bb,
do_package)
cp: cannot stat
`/oe/build/tmp/work/c7x0-angstrom-linux-gnueabi/sharp-flash-header-c700-1.0-r0/image/*':
No such file or directory
NOTE: Running task 3980 of 4025 (ID: 208,
/oe/org.openembedded.dev/recipes/sharp-binary-only/sharp-flash-header-c700.bb,
do_populate_staging)


