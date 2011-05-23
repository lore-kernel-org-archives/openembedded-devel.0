Received: from bsmtp4.bon.at ([195.3.86.186] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QOVer-0007uV-NA for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:59:01 +0200
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 190DC1300A2;
	Mon, 23 May 2011 15:55:39 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 15:55:37 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201105231555.38190.pgsellmann@portner-elektronik.at>
Subject: Sorry, 4340f07345392b2c4c2017142cce40e407d219af
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
X-List-Received-Date: Mon, 23 May 2011 13:59:01 -0000
X-Groupsio-MsgNum: 32248
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Zdm2N+QF47DK0Dn"

--Boundary-00=_Zdm2N+QF47DK0Dn
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin!

The above commit breaks my daily build.
By reverting it, i can build again.
Error occurs in recipe gnumail which obviously needs some 64bit javac
Log is appended


Sincerely
Peter

--Boundary-00=_Zdm2N+QF47DK0Dn
Content-Type: text/plain;
  charset="UTF-8";
  name="logerror.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="logerror.txt"

Parsing .bb files, please wait...NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is provided by udev
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality is provided by udev
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is provided by udev
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: angstrom DOES NOT support fso-apm because regular apmd is good enough
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality is provided by udev
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
NOTE: angstrom DOES NOT support ipkg because ipkg has been superseded by opkg
NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the target
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multimedia library
NOTE: angstrom DOES NOT support xcursor-watchonly-theme because xcursor-transparent-theme is good enough
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multimedia library
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multimedia library
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multimedia library
NOTE: angstrom DOES NOT support hotplug2 because hotplug functionality is provided by udev
done.
Parsing of 7367 .bb files complete (0 cached, 7367 parsed). 7667 targets, 362 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "bd66081"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pcontrolg20"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.05"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2 of 5581 (ID: 2291, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_setscene)
NOTE: Running task 3 of 5581 (ID: 1267, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_setscene)
NOTE: Running task 4 of 5581 (ID: 1337, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_setscene)
NOTE: Running task 1 of 5581 (ID: 1253, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_setscene)
NOTE: package quilt-native-0.48-r7.1: task do_setscene: Started
NOTE: package unifdef-native-2.6-0: task do_setscene: Started
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_setscene: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_setscene: Started
NOTE: Running task 5 of 5581 (ID: 2872, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_setscene)
NOTE: package perl-native-5.10.1-r11: task do_setscene: Started
NOTE: package unifdef-native-2.6-0: task do_setscene: Succeeded
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_setscene: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_setscene: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_setscene: Succeeded
NOTE: Running task 6 of 5581 (ID: 1252, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_fetch)
NOTE: Running task 7 of 5581 (ID: 2290, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_fetch)
NOTE: package quilt-native-0.48-r7.1: task do_fetch: Started
NOTE: package perl-native-5.10.1-r11: task do_setscene: Succeeded
NOTE: Running task 8 of 5581 (ID: 1266, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_fetch)
NOTE: package unifdef-native-2.6-0: task do_fetch: Started
NOTE: package unifdef-native-2.6-0: task do_fetch: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_fetch: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_fetch: Started
NOTE: Running task 9 of 5581 (ID: 1336, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_fetch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_fetch: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_fetch: Succeeded
NOTE: Running task 10 of 5581 (ID: 2871, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_fetch)
NOTE: package perl-native-5.10.1-r11: task do_fetch: Started
NOTE: Running task 11 of 5581 (ID: 1245, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_unpack)
NOTE: Running task 12 of 5581 (ID: 2283, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_unpack)
NOTE: package quilt-native-0.48-r7.1: task do_unpack: Started
NOTE: Unpacking ../sources/quilt-0.48.tar.gz to tmp/work/x86_64-linux/quilt-native-0.48-r7.1/
NOTE: package unifdef-native-2.6-0: task do_unpack: Started
NOTE: Unpacking ../sources/unifdef-2.6.tar.gz to tmp/work/x86_64-linux/unifdef-native-2.6-0/
NOTE: Running task 13 of 5581 (ID: 1329, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_unpack)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_unpack: Started
NOTE: Unpacking ../sources/git_git.savannah.gnu.org.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.gz to tmp/work/x86_64-linux/gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0/
NOTE: package perl-native-5.10.1-r11: task do_fetch: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_unpack: Succeeded
NOTE: package unifdef-native-2.6-0: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/gnu-config/files/gnu-configize.in to tmp/work/x86_64-linux/gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0/
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_unpack: Succeeded
NOTE: Running task 14 of 5581 (ID: 2864, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_unpack)
NOTE: package perl-native-5.10.1-r11: task do_unpack: Started
NOTE: Running task 15 of 5581 (ID: 1246, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_patch)
NOTE: Running task 16 of 5581 (ID: 2284, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_patch)
NOTE: package unifdef-native-2.6-0: task do_patch: Started
NOTE: package unifdef-native-2.6-0: task do_patch: Succeeded
NOTE: Unpacking ../sources/perl-5.10.1.tar.gz to tmp/work/x86_64-linux/perl-native-5.10.1-r11/
NOTE: package quilt-native-0.48-r7.1: task do_patch: Started
NOTE: Applying patch 'install.patch' (../openembedded/recipes/quilt/quilt-0.48/install.patch)
NOTE: Running task 17 of 5581 (ID: 2858, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_setscene)
NOTE: package m4-native-1.4.14-r0.1: task do_setscene: Started
NOTE: Running task 18 of 5581 (ID: 2292, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_configure)
NOTE: Applying patch 'no_rm_symlinks.patch' (../openembedded/recipes/quilt/quilt-0.48/no_rm_symlinks.patch)
NOTE: Applying patch 'use-cp-for-patch-backup.patch' (../openembedded/recipes/quilt/quilt-0.48/use-cp-for-patch-backup.patch)
NOTE: package unifdef-native-2.6-0: task do_configure: Started
NOTE: package unifdef-native-2.6-0: task do_configure: Succeeded
NOTE: Applying patch 'dont-allow-optional-quiltrc.patch' (../openembedded/recipes/quilt/quilt-0.48/dont-allow-optional-quiltrc.patch)
NOTE: package m4-native-1.4.14-r0.1: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/perl/perl-native/CPAN-Config.pm to tmp/work/x86_64-linux/perl-native-5.10.1-r11/
NOTE: Running task 19 of 5581 (ID: 2857, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_fetch)
NOTE: package perl-native-5.10.1-r11: task do_unpack: Succeeded
NOTE: Applying patch 'fix_new_GNU_patch_detection.patch' (../openembedded/recipes/quilt/quilt-0.48/fix_new_GNU_patch_detection.patch)
NOTE: package quilt-native-0.48-r7.1: task do_patch: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_fetch: Started
NOTE: package m4-native-1.4.14-r0.1: task do_fetch: Succeeded
NOTE: Running task 20 of 5581 (ID: 2293, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_qa_configure)
NOTE: package unifdef-native-2.6-0: task do_qa_configure: Started
NOTE: package unifdef-native-2.6-0: task do_qa_configure: Succeeded
NOTE: Running task 21 of 5581 (ID: 2865, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_patch)
NOTE: Running task 22 of 5581 (ID: 1254, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_configure)
NOTE: package perl-native-5.10.1-r11: task do_patch: Started
NOTE: package quilt-native-0.48-r7.1: task do_configure: Started
NOTE: Running task 23 of 5581 (ID: 2850, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_unpack)
NOTE: Applying patch 'Configure-multilib.patch' (../openembedded/recipes/perl/files/Configure-multilib.patch)
NOTE: Applying patch 'perl-configpm-switch.patch' (../openembedded/recipes/perl/perl-5.10.1/perl-configpm-switch.patch)
NOTE: Applying patch 'native-nopacklist.patch' (../openembedded/recipes/perl/perl-5.10.1/native-nopacklist.patch)
NOTE: package m4-native-1.4.14-r0.1: task do_unpack: Started
NOTE: Unpacking ../sources/m4-1.4.14.tar.bz2 to tmp/work/x86_64-linux/m4-native-1.4.14-r0.1/
NOTE: Running task 24 of 5581 (ID: 2294, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_compile)
NOTE: Applying patch 'native-perlinc.patch' (../openembedded/recipes/perl/perl-5.10.1/native-perlinc.patch)
NOTE: Applying patch 'perl-fix-cross-library-check.patch' (../openembedded/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch)
NOTE: Applying patch 'ubuntu-11.04-multiarch.patch' (../openembedded/recipes/perl/files/ubuntu-11.04-multiarch.patch)
NOTE: package unifdef-native-2.6-0: task do_compile: Started
NOTE: package perl-native-5.10.1-r11: task do_patch: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_unpack: Succeeded
NOTE: Running task 25 of 5581 (ID: 2873, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_configure)
NOTE: Running task 26 of 5581 (ID: 1295, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_setscene)
NOTE: package perl-native-5.10.1-r11: task do_configure: Started
NOTE: package autoconf-native-2.65-r14.1: task do_setscene: Started
NOTE: package autoconf-native-2.65-r14.1: task do_setscene: Succeeded
NOTE: Running task 27 of 5581 (ID: 1294, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_fetch)
NOTE: package autoconf-native-2.65-r14.1: task do_fetch: Started
NOTE: package autoconf-native-2.65-r14.1: task do_fetch: Succeeded
NOTE: Running task 28 of 5581 (ID: 1287, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_unpack)
NOTE: package autoconf-native-2.65-r14.1: task do_unpack: Started
NOTE: Unpacking ../sources/autoconf-2.65.tar.bz2 to tmp/work/x86_64-linux/autoconf-native-2.65-r14.1/
NOTE: package autoconf-native-2.65-r14.1: task do_unpack: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 29 of 5581 (ID: 1259, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_unpack)
NOTE: package unifdef-native-2.6-0: task do_compile: Succeeded
NOTE: Running task 30 of 5581 (ID: 1309, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_setscene)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_unpack: Started
NOTE: Unpacking ../sources/linux-2.6.37.tar.bz2 to tmp/work/x86_64-linux/linux-libc-headers-native-2.6.37-r0/
NOTE: package automake-native-1.11.1-r5.2: task do_setscene: Started
NOTE: Running task 31 of 5581 (ID: 2285, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_install)
NOTE: package automake-native-1.11.1-r5.2: task do_setscene: Succeeded
NOTE: package unifdef-native-2.6-0: task do_install: Started
NOTE: package unifdef-native-2.6-0: task do_install: Succeeded
NOTE: Running task 32 of 5581 (ID: 1308, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_fetch)
NOTE: package automake-native-1.11.1-r5.2: task do_fetch: Started
NOTE: package automake-native-1.11.1-r5.2: task do_fetch: Succeeded
NOTE: Running task 33 of 5581 (ID: 2286, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_populate_sysroot)
NOTE: package unifdef-native-2.6-0: task do_populate_sysroot: Started
NOTE: Running task 34 of 5581 (ID: 1301, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_unpack)
NOTE: package unifdef-native-2.6-0: task do_populate_sysroot: Succeeded
NOTE: package automake-native-1.11.1-r5.2: task do_unpack: Started
NOTE: Unpacking ../sources/automake-1.11.1.tar.bz2 to tmp/work/x86_64-linux/automake-native-1.11.1-r5.2/
NOTE: Running task 35 of 5581 (ID: 1323, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_setscene)
NOTE: package automake-native-1.11.1-r5.2: task do_unpack: Succeeded
NOTE: package libtool-native-2.4-r28.1: task do_setscene: Started
NOTE: Running task 36 of 5581 (ID: 1689, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_setscene)
NOTE: package ncurses-native-5.9-r1: task do_setscene: Started
NOTE: package libtool-native-2.4-r28.1: task do_setscene: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_configure: Succeeded
NOTE: package ncurses-native-5.9-r1: task do_setscene: Succeeded
NOTE: Running task 37 of 5581 (ID: 1255, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_qa_configure)
NOTE: package quilt-native-0.48-r7.1: task do_qa_configure: Started
NOTE: Running task 38 of 5581 (ID: 1322, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_fetch)
NOTE: package quilt-native-0.48-r7.1: task do_qa_configure: Succeeded
NOTE: package libtool-native-2.4-r28.1: task do_fetch: Started
NOTE: package libtool-native-2.4-r28.1: task do_fetch: Succeeded
NOTE: Running task 39 of 5581 (ID: 1688, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_fetch)
NOTE: package ncurses-native-5.9-r1: task do_fetch: Started
NOTE: package ncurses-native-5.9-r1: task do_fetch: Succeeded
NOTE: Running task 40 of 5581 (ID: 1256, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_compile)
NOTE: package quilt-native-0.48-r7.1: task do_compile: Started
NOTE: Running task 41 of 5581 (ID: 1315, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_unpack)
NOTE: package libtool-native-2.4-r28.1: task do_unpack: Started
NOTE: Unpacking ../sources/libtool-2.4.tar.gz to tmp/work/x86_64-linux/libtool-native-2.4-r28.1/
NOTE: Running task 42 of 5581 (ID: 1681, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_unpack)
NOTE: package libtool-native-2.4-r28.1: task do_unpack: Succeeded
NOTE: package ncurses-native-5.9-r1: task do_unpack: Started
NOTE: Unpacking ../sources/ncurses-5.9.tar.gz to tmp/work/x86_64-linux/ncurses-native-5.9-r1/
NOTE: Unpacking ../openembedded/recipes/ncurses/ncurses/config.cache to tmp/work/x86_64-linux/ncurses-native-5.9-r1/
NOTE: package ncurses-native-5.9-r1: task do_unpack: Succeeded
NOTE: Running task 43 of 5581 (ID: 1281, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_setscene)
NOTE: Running task 44 of 5581 (ID: 3379, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_setscene)
NOTE: package pkgconfig-native-0.23-r8.1: task do_setscene: Started
NOTE: package readline-native-5.2-r8: task do_setscene: Started
NOTE: package readline-native-5.2-r8: task do_setscene: Succeeded
NOTE: package pkgconfig-native-0.23-r8.1: task do_setscene: Succeeded
NOTE: Running task 45 of 5581 (ID: 1280, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_fetch)
NOTE: Running task 46 of 5581 (ID: 3378, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_fetch)
NOTE: package pkgconfig-native-0.23-r8.1: task do_fetch: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_fetch: Succeeded
NOTE: package readline-native-5.2-r8: task do_fetch: Started
NOTE: package readline-native-5.2-r8: task do_fetch: Succeeded
NOTE: Running task 47 of 5581 (ID: 1273, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_unpack)
NOTE: Running task 48 of 5581 (ID: 3371, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_unpack)
NOTE: package pkgconfig-native-0.23-r8.1: task do_unpack: Started
NOTE: Unpacking ../sources/pkg-config-0.23.tar.gz to tmp/work/x86_64-linux/pkgconfig-native-0.23-r8.1/
NOTE: package readline-native-5.2-r8: task do_unpack: Started
NOTE: Unpacking ../sources/readline-5.2.tar.gz to tmp/work/x86_64-linux/readline-native-5.2-r8/
NOTE: Unpacking ../openembedded/recipes/readline/readline-5.2/acinclude.m4 to tmp/work/x86_64-linux/readline-native-5.2-r8/
NOTE: package readline-native-5.2-r8: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/pkgconfig/pkgconfig-0.23/glibconfig-sysdefs.h to tmp/work/x86_64-linux/pkgconfig-native-0.23-r8.1/
NOTE: package pkgconfig-native-0.23-r8.1: task do_unpack: Succeeded
NOTE: Running task 49 of 5581 (ID: 1365, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_setscene)
NOTE: package zlib-native-1.2.3-r7.0: task do_setscene: Started
NOTE: Running task 50 of 5581 (ID: 2959, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_setscene)
NOTE: package openssl-native-1.0.0d-r14.0: task do_setscene: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_setscene: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_compile: Succeeded
NOTE: Running task 51 of 5581 (ID: 1247, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_install)
NOTE: package quilt-native-0.48-r7.1: task do_install: Started
NOTE: Running task 52 of 5581 (ID: 2958, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_fetch)
NOTE: package zlib-native-1.2.3-r7.0: task do_setscene: Succeeded
NOTE: package openssl-native-1.0.0d-r14.0: task do_fetch: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_fetch: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_install: Succeeded
NOTE: Running task 53 of 5581 (ID: 1364, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_fetch)
NOTE: Running task 54 of 5581 (ID: 2951, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_unpack)
NOTE: package zlib-native-1.2.3-r7.0: task do_fetch: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_fetch: Succeeded
NOTE: package openssl-native-1.0.0d-r14.0: task do_unpack: Started
NOTE: Unpacking ../sources/openssl-1.0.0d.tar.gz to tmp/work/x86_64-linux/openssl-native-1.0.0d-r14.0/
NOTE: Running task 55 of 5581 (ID: 1248, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_populate_sysroot)
NOTE: package quilt-native-0.48-r7.1: task do_populate_sysroot: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_unpack: Succeeded
NOTE: Running task 56 of 5581 (ID: 1357, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_unpack)
NOTE: package zlib-native-1.2.3-r7.0: task do_unpack: Started
NOTE: Unpacking ../sources/zlib-1.2.3.tar.bz2 to tmp/work/x86_64-linux/zlib-native-1.2.3-r7.0/
NOTE: package zlib-native-1.2.3-r7.0: task do_unpack: Succeeded
NOTE: Running task 57 of 5581 (ID: 3393, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_setscene)
NOTE: package quilt-native-0.48-r7.1: task do_populate_sysroot: Succeeded
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_setscene: Started
NOTE: Running task 58 of 5581 (ID: 3365, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_setscene)
NOTE: package bzip2-full-native-1.0.6-r0: task do_setscene: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_setscene: Succeeded
NOTE: Running task 59 of 5581 (ID: 1330, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_patch)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_setscene: Succeeded
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_patch: Started
NOTE: Applying patch 'config-guess-uclibc.patch' (../openembedded/recipes/gnu-config/gnu-config-git/config-guess-uclibc.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_patch: Succeeded
NOTE: Running task 60 of 5581 (ID: 2851, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_patch)
NOTE: package m4-native-1.4.14-r0.1: task do_patch: Started
NOTE: Running task 61 of 5581 (ID: 1288, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_patch)
NOTE: Applying patch 'f13-compile.patch' (../openembedded/recipes/m4/files/f13-compile.patch)
NOTE: package autoconf-native-2.65-r14.1: task do_patch: Started
NOTE: Applying patch 'program_prefix.patch' (../openembedded/recipes/autoconf/autoconf-2.65/program_prefix.patch)
NOTE: Running task 62 of 5581 (ID: 1338, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_configure)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_configure: Started
NOTE: Applying patch 'm4-uclibc-sched_param-def.patch' (../openembedded/recipes/m4/files/m4-uclibc-sched_param-def.patch)
NOTE: package m4-native-1.4.14-r0.1: task do_patch: Succeeded
NOTE: Applying patch 'autoreconf-exclude.patch' (../openembedded/recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch)
NOTE: Applying patch 'autoreconf-foreign.patch' (../openembedded/recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_configure: Succeeded
NOTE: Applying patch 'autoheader-nonfatal-warnings.patch' (../openembedded/recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch)
NOTE: Running task 63 of 5581 (ID: 1302, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_patch)
NOTE: Running task 64 of 5581 (ID: 1339, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_qa_configure)
NOTE: Applying patch 'autoreconf-gnuconfigize.patch' (../openembedded/recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch)
NOTE: package automake-native-1.11.1-r5.2: task do_patch: Started
NOTE: Applying patch '0001-py-compile-compile-only-optimized-byte-code.patch' (../openembedded/recipes/automake/files/0001-py-compile-compile-only-optimized-byte-code.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_qa_configure: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_qa_configure: Succeeded
NOTE: Applying patch 'config-site.patch' (../openembedded/recipes/autoconf/autoconf-2.65/config-site.patch)
NOTE: Running task 65 of 5581 (ID: 1340, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_compile)
NOTE: Applying patch 'autoconf-dont-execute-perl.patch' (../openembedded/recipes/autoconf/autoconf-2.65/autoconf-dont-execute-perl.patch)
NOTE: Applying patch 'automake-dont-execute-perl.patch' (../openembedded/recipes/automake/automake-1.11.1/automake-dont-execute-perl.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_compile: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_compile: Succeeded
NOTE: Applying patch 'fix_path_xtra.patch' (../openembedded/recipes/autoconf/autoconf-2.65/fix_path_xtra.patch)
NOTE: package autoconf-native-2.65-r14.1: task do_patch: Succeeded
NOTE: package automake-native-1.11.1-r5.2: task do_patch: Succeeded
NOTE: Running task 66 of 5581 (ID: 1316, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_patch)
NOTE: package libtool-native-2.4-r28.1: task do_patch: Started
NOTE: Running task 67 of 5581 (ID: 1682, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_patch)
NOTE: Running task 68 of 5581 (ID: 1331, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_install)
NOTE: Applying patch 'trailingslash.patch' (../openembedded/recipes/libtool/libtool-2.4/trailingslash.patch)
NOTE: package ncurses-native-5.9-r1: task do_patch: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_install: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_install: Succeeded
NOTE: Applying patch 'prefix-manpage-fix.patch' (../openembedded/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch)
NOTE: Applying patch 'rename-with-sysroot.patch' (../openembedded/recipes/libtool/libtool-2.4/rename-with-sysroot.patch)
NOTE: Applying patch 'tic-hang.patch' (../openembedded/recipes/ncurses/ncurses/tic-hang.patch)
NOTE: package ncurses-native-5.9-r1: task do_patch: Succeeded
NOTE: Running task 69 of 5581 (ID: 1274, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_patch)
NOTE: Running task 70 of 5581 (ID: 1332, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_populate_sysroot)
NOTE: Applying patch 'resolve-sysroot.patch' (../openembedded/recipes/libtool/libtool-2.4/resolve-sysroot.patch)
NOTE: package pkgconfig-native-0.23-r8.1: task do_patch: Started
NOTE: Applying patch 'autofoo.patch' (../openembedded/recipes/pkgconfig/pkgconfig-0.23/autofoo.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_populate_sysroot: Started
NOTE: Applying patch 'use-sysroot-in-libpath.patch' (../openembedded/recipes/libtool/libtool-2.4/use-sysroot-in-libpath.patch)
NOTE: Applying patch 'sysrootfix.patch' (../openembedded/recipes/pkgconfig/pkgconfig-0.23/sysrootfix.patch)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_populate_sysroot: Succeeded
NOTE: Applying patch 'fix-final-rpath.patch' (../openembedded/recipes/libtool/libtool-2.4/fix-final-rpath.patch)
NOTE: Applying patch 'prefix.patch' (../openembedded/recipes/libtool/libtool-2.4/prefix.patch)
NOTE: package pkgconfig-native-0.23-r8.1: task do_patch: Succeeded
NOTE: Running task 71 of 5581 (ID: 3372, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_patch)
NOTE: package libtool-native-2.4-r28.1: task do_patch: Succeeded
NOTE: Running task 72 of 5581 (ID: 3392, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_fetch)
NOTE: package readline-native-5.2-r8: task do_patch: Started
NOTE: Applying patch 'fix-includes.patch' (../openembedded/recipes/readline/readline-5.2/fix-includes.patch)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_fetch: Started
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_fetch: Succeeded
NOTE: Applying patch 'configure_fix.patch' (../openembedded/recipes/readline/readline-5.2/configure_fix.patch)
NOTE: Running task 73 of 5581 (ID: 3364, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_fetch)
NOTE: Applying patch 'darwin.patch' (../openembedded/recipes/readline/darwin.patch)
NOTE: package bzip2-full-native-1.0.6-r0: task do_fetch: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 74 of 5581 (ID: 3385, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_unpack)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_unpack: Started
NOTE: Unpacking ../sources/sqlite-3.6.23.1.tar.gz to tmp/work/x86_64-linux/sqlite3-native-3.6.23.1-r4.0/
NOTE: package readline-native-5.2-r8: task do_patch: Succeeded
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_unpack: Succeeded
NOTE: Running task 75 of 5581 (ID: 3357, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_unpack)
NOTE: package bzip2-full-native-1.0.6-r0: task do_unpack: Started
NOTE: Unpacking ../sources/bzip2-1.0.6.tar.gz to tmp/work/x86_64-linux/bzip2-full-native-1.0.6-r0/
NOTE: package bzip2-full-native-1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 76 of 5581 (ID: 1358, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_patch)
NOTE: Running task 77 of 5581 (ID: 2952, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_patch)
NOTE: package zlib-native-1.2.3-r7.0: task do_patch: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_patch: Started
NOTE: Applying patch 'configure-targets.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/configure-targets.patch)
NOTE: Running task 78 of 5581 (ID: 3386, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_patch)
NOTE: Applying patch 'visibility.patch' (../openembedded/recipes/zlib/zlib-1.2.3/visibility.patch)
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/zlib/zlib-1.2.3/autotools.patch)
NOTE: Applying patch 'shared-libs.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/shared-libs.patch)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_patch: Started
NOTE: Applying patch 'libtool.patch' (../openembedded/recipes/sqlite/sqlite3/libtool.patch)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_patch: Succeeded
NOTE: Applying patch 'debian.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/debian.patch)
NOTE: Running task 79 of 5581 (ID: 3358, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_patch)
NOTE: package zlib-native-1.2.3-r7.0: task do_patch: Succeeded
NOTE: Applying patch 'libdeps-first.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/libdeps-first.patch)
NOTE: package openssl-native-1.0.0d-r14.0: task do_patch: Succeeded
NOTE: package bzip2-full-native-1.0.6-r0: task do_patch: Started
NOTE: Applying patch 'bzip2-1.0.5-autoconfiscated.patch' (../openembedded/recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch)
NOTE: Running task 80 of 5581 (ID: 2039, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_setscene)
NOTE: package bzip2-full-native-1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 81 of 5581 (ID: 3001, virtual:native:/home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_setscene)
NOTE: package python-native-2.6.6-ml12.0: task do_setscene: Started
NOTE: package libxml2-native-2.7.8-r9.1: task do_setscene: Started
NOTE: Running task 82 of 5581 (ID: 1478, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_setscene)
NOTE: package libxml2-native-2.7.8-r9.1: task do_setscene: Succeeded
NOTE: package gmp-native-5.0.1-r1.1: task do_setscene: Started
NOTE: package python-native-2.6.6-ml12.0: task do_setscene: Succeeded
NOTE: Running task 83 of 5581 (ID: 2038, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_fetch)
NOTE: package gmp-native-5.0.1-r1.1: task do_setscene: Succeeded
NOTE: package python-native-2.6.6-ml12.0: task do_fetch: Started
NOTE: Running task 84 of 5581 (ID: 3000, virtual:native:/home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_fetch)
NOTE: package libxml2-native-2.7.8-r9.1: task do_fetch: Started
NOTE: Running task 85 of 5581 (ID: 1477, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_fetch)
NOTE: package libxml2-native-2.7.8-r9.1: task do_fetch: Succeeded
NOTE: package gmp-native-5.0.1-r1.1: task do_fetch: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_fetch: Succeeded
NOTE: package python-native-2.6.6-ml12.0: task do_fetch: Succeeded
NOTE: Running task 86 of 5581 (ID: 2993, virtual:native:/home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_unpack)
NOTE: package libxml2-native-2.7.8-r9.1: task do_unpack: Started
NOTE: Running task 87 of 5581 (ID: 1470, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_unpack)
NOTE: Running task 88 of 5581 (ID: 2031, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_unpack)
NOTE: package python-native-2.6.6-ml12.0: task do_unpack: Started
NOTE: Unpacking ../sources/libxml2-2.7.8.tar.gz to tmp/work/x86_64-linux/libxml2-native-2.7.8-r9.1/
NOTE: package gmp-native-5.0.1-r1.1: task do_unpack: Started
NOTE: Unpacking ../sources/gmp-5.0.1.tar.bz2 to tmp/work/x86_64-linux/gmp-native-5.0.1-r1.1/
NOTE: Unpacking ../sources/Python-2.6.6.tar.bz2 to tmp/work/x86_64-linux/python-native-2.6.6-ml12.0/
NOTE: package libxml2-native-2.7.8-r9.1: task do_unpack: Succeeded
NOTE: Running task 89 of 5581 (ID: 1435, virtual:native:/home/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_setscene)
NOTE: package gettext-native-0.18-r6: task do_setscene: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_unpack: Succeeded
NOTE: package gettext-native-0.18-r6: task do_setscene: Succeeded
NOTE: Running task 90 of 5581 (ID: 2994, virtual:native:/home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_patch)
NOTE: package libxml2-native-2.7.8-r9.1: task do_patch: Started
NOTE: Applying patch '0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch)
NOTE: Running task 91 of 5581 (ID: 1434, virtual:native:/home/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_fetch)
NOTE: Applying patch 'df83c17e5a2646bd923f75e5e507bc80d73c9722.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/df83c17e5a2646bd923f75e5e507bc80d73c9722.patch)
NOTE: package gettext-native-0.18-r6: task do_fetch: Started
NOTE: Applying patch 'fec31bcd452e77c10579467ca87a785b41115de6.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/fec31bcd452e77c10579467ca87a785b41115de6.patch)
NOTE: package gettext-native-0.18-r6: task do_fetch: Succeeded
NOTE: Applying patch '00819877651b87842ed878898ba17dba489820f0.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/00819877651b87842ed878898ba17dba489820f0.patch)
NOTE: package libxml2-native-2.7.8-r9.1: task do_patch: Succeeded
NOTE: Running task 92 of 5581 (ID: 1427, virtual:native:/home/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_unpack)
NOTE: package gettext-native-0.18-r6: task do_unpack: Started
NOTE: Unpacking ../sources/gettext-0.18.tar.gz to tmp/work/x86_64-linux/gettext-native-0.18-r6/
NOTE: Running task 93 of 5581 (ID: 1464, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_setscene)
NOTE: package mpfr-native-3.0.0-r3.1: task do_setscene: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_setscene: Succeeded
NOTE: package gettext-native-0.18-r6: task do_unpack: Succeeded
NOTE: Running task 94 of 5581 (ID: 1471, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_patch)
NOTE: package gmp-native-5.0.1-r1.1: task do_patch: Started
NOTE: Applying patch 'configure.patch' (../openembedded/recipes/gmp/gmp-5.0.1/configure.patch)
NOTE: Running task 95 of 5581 (ID: 1463, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_fetch)
NOTE: Applying patch 'amd64.patch' (../openembedded/recipes/gmp/gmp-5.0.1/amd64.patch)
NOTE: package mpfr-native-3.0.0-r3.1: task do_fetch: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_fetch: Succeeded
NOTE: package gmp-native-5.0.1-r1.1: task do_patch: Succeeded
NOTE: Running task 96 of 5581 (ID: 1428, virtual:native:/home/oe/openembedded/recipes/gettext/gettext_0.18.bb, do_patch)
NOTE: package gettext-native-0.18-r6: task do_patch: Started
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/gettext/gettext-0.18/autotools.patch)
NOTE: Running task 97 of 5581 (ID: 1456, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_unpack)
NOTE: package python-native-2.6.6-ml12.0: task do_unpack: Succeeded
NOTE: package mpfr-native-3.0.0-r3.1: task do_unpack: Started
NOTE: Unpacking ../sources/mpfr-3.0.0.tar.bz2 to tmp/work/x86_64-linux/mpfr-native-3.0.0-r3.1/
NOTE: Applying patch 'gettext-autoconf-lib-link-no-L.patch' (../openembedded/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch)
NOTE: Applying patch 'gnulib-uclibc-sched_param-def.patch' (../openembedded/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch)
NOTE: Running task 98 of 5581 (ID: 2032, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_patch)
NOTE: package python-native-2.6.6-ml12.0: task do_patch: Started
NOTE: package gettext-native-0.18-r6: task do_patch: Succeeded
NOTE: package mpfr-native-3.0.0-r3.1: task do_unpack: Succeeded
NOTE: Applying patch '00-fix-parallel-make.patch' (../openembedded/recipes/python/python-2.6.6/00-fix-parallel-make.patch)
NOTE: Applying patch '04-default-is-optimized.patch' (../openembedded/recipes/python/python-2.6.6/04-default-is-optimized.patch)
NOTE: Applying patch '05-enable-ctypes-cross-build.patch' (../openembedded/recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch)
NOTE: Applying patch '06-ctypes-libffi-fix-configure.patch' (../openembedded/recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch)
NOTE: Applying patch '10-distutils-fix-swig-parameter.patch' (../openembedded/recipes/python/python-2.6.6/10-distutils-fix-swig-parameter.patch)
NOTE: Running task 99 of 5581 (ID: 1717, virtual:native:/home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_setscene)
NOTE: package flex-native-2.5.35-r7.1: task do_setscene: Started
NOTE: package flex-native-2.5.35-r7.1: task do_setscene: Succeeded
NOTE: Running task 100 of 5581 (ID: 1506, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_setscene)
NOTE: package libelf-native-0.8.13-r1: task do_setscene: Started
NOTE: Applying patch '11-distutils-never-modify-shebang-line.patch' (../openembedded/recipes/python/python-2.6.6/11-distutils-never-modify-shebang-line.patch)
NOTE: Applying patch '12-distutils-prefix-is-inside-staging-area.patch' (../openembedded/recipes/python/python-2.6.6/12-distutils-prefix-is-inside-staging-area.patch)
NOTE: Running task 101 of 5581 (ID: 1716, virtual:native:/home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_fetch)
NOTE: package libelf-native-0.8.13-r1: task do_setscene: Succeeded
NOTE: package flex-native-2.5.35-r7.1: task do_fetch: Started
NOTE: package flex-native-2.5.35-r7.1: task do_fetch: Succeeded
NOTE: Running task 102 of 5581 (ID: 1492, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_setscene)
NOTE: package libmpc-native-0.8.2-r1: task do_setscene: Started
NOTE: Running task 103 of 5581 (ID: 1709, virtual:native:/home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_unpack)
NOTE: package flex-native-2.5.35-r7.1: task do_unpack: Started
NOTE: Unpacking ../sources/flex-2.5.35.tar.bz2 to tmp/work/x86_64-linux/flex-native-2.5.35-r7.1/
NOTE: Applying patch 'debug.patch' (../openembedded/recipes/python/python-2.6.6/debug.patch)
NOTE: Applying patch 'nohostlibs.patch' (../openembedded/recipes/python/python-2.6.6/nohostlibs.patch)
NOTE: package libmpc-native-0.8.2-r1: task do_setscene: Succeeded
NOTE: package flex-native-2.5.35-r7.1: task do_unpack: Succeeded
NOTE: package python-native-2.6.6-ml12.0: task do_patch: Succeeded
NOTE: Running task 104 of 5581 (ID: 1449, /home/oe/openembedded/recipes/binutils/binutils-cross_2.20.1.bb, do_setscene)
NOTE: Running task 105 of 5581 (ID: 1455, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_fixup)
NOTE: package binutils-cross-2.20.1-r14.4: task do_setscene: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_fixup: Started
NOTE: Running task 106 of 5581 (ID: 1710, virtual:native:/home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_patch)
NOTE: package mpfr-native-3.0.0-r3.1: task do_fixup: Succeeded
NOTE: package flex-native-2.5.35-r7.1: task do_patch: Started
NOTE: package flex-native-2.5.35-r7.1: task do_patch: Succeeded
NOTE: Running task 107 of 5581 (ID: 1457, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_patch)
NOTE: package binutils-cross-2.20.1-r14.4: task do_setscene: Succeeded
NOTE: package mpfr-native-3.0.0-r3.1: task do_patch: Started
NOTE: Running task 108 of 5581 (ID: 1505, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_fetch)
NOTE: package libelf-native-0.8.13-r1: task do_fetch: Started
NOTE: Running task 109 of 5581 (ID: 1491, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_fetch)
NOTE: package libmpc-native-0.8.2-r1: task do_fetch: Started
NOTE: Applying patch 'p4.patch' (../openembedded/recipes/mpfr/mpfr-3.0.0/p4.patch)
NOTE: package libmpc-native-0.8.2-r1: task do_fetch: Succeeded
NOTE: package libelf-native-0.8.13-r1: task do_fetch: Succeeded
NOTE: Running task 110 of 5581 (ID: 1498, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_unpack)
NOTE: package libelf-native-0.8.13-r1: task do_unpack: Started
NOTE: Unpacking ../sources/libelf-0.8.13.tar.gz to tmp/work/x86_64-linux/libelf-native-0.8.13-r1/
NOTE: Running task 111 of 5581 (ID: 1484, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_unpack)
NOTE: package libmpc-native-0.8.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/mpc-0.8.2.tar.gz to tmp/work/x86_64-linux/libmpc-native-0.8.2-r1/
NOTE: package libelf-native-0.8.13-r1: task do_unpack: Succeeded
NOTE: package libmpc-native-0.8.2-r1: task do_unpack: Succeeded
NOTE: Running task 112 of 5581 (ID: 1448, /home/oe/openembedded/recipes/binutils/binutils-cross_2.20.1.bb, do_fetch)
NOTE: package binutils-cross-2.20.1-r14.4: task do_fetch: Started
NOTE: Running task 113 of 5581 (ID: 1548, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_setscene)
NOTE: package cross-localedef-native-2.12-r1: task do_setscene: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_patch: Succeeded
NOTE: package cross-localedef-native-2.12-r1: task do_setscene: Succeeded
NOTE: Running task 114 of 5581 (ID: 901, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_setscene)
NOTE: package linux-libc-headers-2.6.37-r0: task do_setscene: Started
NOTE: Running task 115 of 5581 (ID: 4429, /home/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, do_setscene)
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_setscene: Started
NOTE: package binutils-cross-2.20.1-r14.4: task do_fetch: Succeeded
NOTE: package linux-libc-headers-2.6.37-r0: task do_setscene: Succeeded
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_setscene: Succeeded
NOTE: Running task 116 of 5581 (ID: 1441, /home/oe/openembedded/recipes/binutils/binutils-cross_2.20.1.bb, do_unpack)
NOTE: package binutils-cross-2.20.1-r14.4: task do_unpack: Started
NOTE: Unpacking ../sources/binutils-2.20.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.20.1-r14.4/
NOTE: Running task 117 of 5581 (ID: 1499, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_patch)
NOTE: Running task 118 of 5581 (ID: 1485, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_patch)
NOTE: package libelf-native-0.8.13-r1: task do_patch: Started
NOTE: package libelf-native-0.8.13-r1: task do_patch: Succeeded
NOTE: package libmpc-native-0.8.2-r1: task do_patch: Started
NOTE: package libmpc-native-0.8.2-r1: task do_patch: Succeeded
NOTE: Running task 119 of 5581 (ID: 1547, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_fetch)
NOTE: Running task 120 of 5581 (ID: 900, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_fetch)
NOTE: package cross-localedef-native-2.12-r1: task do_fetch: Started
NOTE: package cross-localedef-native-2.12-r1: task do_fetch: Succeeded
NOTE: package linux-libc-headers-2.6.37-r0: task do_fetch: Started
NOTE: Running task 121 of 5581 (ID: 1540, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_unpack)
NOTE: package cross-localedef-native-2.12-r1: task do_unpack: Started
NOTE: Unpacking ../sources/eglibc-2_12_www.eglibc.org_.svn.branches._12230_.tar.gz to tmp/work/x86_64-linux/cross-localedef-native-2.12-r1/
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_unpack: Succeeded
NOTE: package linux-libc-headers-2.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 122 of 5581 (ID: 1260, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_patch)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_patch: Started
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_patch: Succeeded
NOTE: Running task 123 of 5581 (ID: 893, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_unpack)
NOTE: package linux-libc-headers-2.6.37-r0: task do_unpack: Started
NOTE: Unpacking ../sources/linux-2.6.37.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/linux-libc-headers-2.6.37-r0/
NOTE: Running task 124 of 5581 (ID: 1268, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_configure)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_configure: Started
NOTE: package cross-localedef-native-2.12-r1: task do_unpack: Succeeded
NOTE: Running task 125 of 5581 (ID: 4428, /home/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, do_fetch)
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_fetch: Started
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_fetch: Succeeded
NOTE: Running task 126 of 5581 (ID: 4421, /home/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, do_unpack)
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_unpack: Started
NOTE: Unpacking ../sources/gcc-4_5-branch_gcc.gnu.org_.svn.gcc.branches_170880_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_configure: Succeeded
NOTE: Running task 127 of 5581 (ID: 1269, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_qa_configure)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_qa_configure: Started
NOTE: package binutils-cross-2.20.1-r14.4: task do_unpack: Succeeded
NOTE: Running task 128 of 5581 (ID: 1442, /home/oe/openembedded/recipes/binutils/binutils-cross_2.20.1.bb, do_patch)
NOTE: package binutils-cross-2.20.1-r14.4: task do_patch: Started
NOTE: Applying patch 'binutils-uclibc-100-uclibc-conf.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch)
NOTE: Applying patch '110-arm-eabi-conf.patch' (../openembedded/recipes/binutils/binutils-2.20.1/110-arm-eabi-conf.patch)
NOTE: Applying patch 'binutils-uclibc-300-001_ld_makefile_patch.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch)
NOTE: Applying patch 'binutils-uclibc-300-006_better_file_error.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch)
NOTE: Applying patch 'binutils-uclibc-300-012_check_ldrunpath_length.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch)
NOTE: Applying patch 'binutils-uclibc-gas-needs-libm.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch)
NOTE: Applying patch 'binutils-x86_64_i386_biarch.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch)
NOTE: Applying patch 'libtool-2.4-update.patch' (../openembedded/recipes/binutils/binutils-2.20.1/libtool-2.4-update.patch)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_qa_configure: Succeeded
NOTE: Running task 129 of 5581 (ID: 1270, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_compile)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_compile: Started
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_compile: Succeeded
NOTE: Running task 130 of 5581 (ID: 1261, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_install)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_install: Started
NOTE: Applying patch 'binutils-2.19.1-ld-sysroot.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch)
NOTE: Applying patch 'binutils-2.16.1-e300c2c3.patch' (../openembedded/recipes/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch)
NOTE: package binutils-cross-2.20.1-r14.4: task do_patch: Succeeded
NOTE: Running task 131 of 5581 (ID: 3015, /home/oe/openembedded/recipes/eglibc/eglibc-initial_2.12.bb, do_setscene)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_setscene: Started
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_setscene: Succeeded
NOTE: Running task 132 of 5581 (ID: 1541, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_patch)
NOTE: package cross-localedef-native-2.12-r1: task do_patch: Started
NOTE: package cross-localedef-native-2.12-r1: task do_patch: Succeeded
NOTE: Running task 133 of 5581 (ID: 3014, /home/oe/openembedded/recipes/eglibc/eglibc-initial_2.12.bb, do_fetch)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_fetch: Started
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_fetch: Succeeded
NOTE: Running task 134 of 5581 (ID: 3007, /home/oe/openembedded/recipes/eglibc/eglibc-initial_2.12.bb, do_unpack)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_unpack: Started
NOTE: Unpacking ../sources/eglibc-2_12_svn.eglibc.org_.branches_13230_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-initial-2.12-r21.8+svnr13230/
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_install: Succeeded
NOTE: Running task 135 of 5581 (ID: 1262, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_populate_sysroot)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_populate_sysroot: Started
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 136 of 5581 (ID: 2859, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_configure)
NOTE: package m4-native-1.4.14-r0.1: task do_configure: Started
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_unpack: Succeeded
NOTE: Running task 137 of 5581 (ID: 4422, /home/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, do_patch)
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_patch: Started
NOTE: package linux-libc-headers-2.6.37-r0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
NOTE: Running task 138 of 5581 (ID: 894, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_patch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_patch: Started
NOTE: package linux-libc-headers-2.6.37-r0: task do_patch: Succeeded
NOTE: Running task 139 of 5581 (ID: 902, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_configure)
NOTE: package linux-libc-headers-2.6.37-r0: task do_configure: Started
NOTE: Applying patch '100-uclibc-conf.patch' (../openembedded/recipes/gcc/gcc-4.5/100-uclibc-conf.patch)
NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch)
NOTE: Applying patch 'cache-amnesia.patch' (../openembedded/recipes/gcc/gcc-4.5/cache-amnesia.patch)
NOTE: Applying patch 'gcc-flags-for-build.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-flags-for-build.patch)
NOTE: Applying patch 'libstdc++-emit-__cxa_end_cleanup-in-text.patch' (../openembedded/recipes/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch)
NOTE: Applying patch 'Makefile.in.patch' (../openembedded/recipes/gcc/gcc-4.5/Makefile.in.patch)
NOTE: Applying patch 'gcc-armv4-pass-fix-v4bx-to-ld.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch)
NOTE: Applying patch 'sh4-multilib.patch' (../openembedded/recipes/gcc/gcc-4.5/sh4-multilib.patch)
NOTE: Applying patch 'arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch' (../openembedded/recipes/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99297.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch)
NOTE: Unpacking ../openembedded/recipes/eglibc/files/etc/ld.so.conf to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-initial-2.12-r21.8+svnr13230/etc/
NOTE: Unpacking ../openembedded/recipes/eglibc/files/generate-supported.mk to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-initial-2.12-r21.8+svnr13230/
NOTE: Applying patch 'gcc-4.5-linaro-r99298.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_unpack: Succeeded
NOTE: Running task 140 of 5581 (ID: 1534, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_setscene)
NOTE: package gperf-native-3.0.3-r0: task do_setscene: Started
NOTE: package gperf-native-3.0.3-r0: task do_setscene: Succeeded
NOTE: package linux-libc-headers-2.6.37-r0: task do_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99299.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch)
NOTE: Running task 141 of 5581 (ID: 1520, /home/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.5.bb, do_setscene)
NOTE: Running task 142 of 5581 (ID: 903, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_qa_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99300.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_setscene: Started
NOTE: package linux-libc-headers-2.6.37-r0: task do_qa_configure: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99301.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99302.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99303.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99304.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99305.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_setscene: Succeeded
NOTE: Running task 143 of 5581 (ID: 1533, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_fetch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_qa_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99306.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch)
NOTE: package gperf-native-3.0.3-r0: task do_fetch: Started
NOTE: package gperf-native-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 144 of 5581 (ID: 904, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_compile)
NOTE: Applying patch 'gcc-4.5-linaro-r99307.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_compile: Started
NOTE: package linux-libc-headers-2.6.37-r0: task do_compile: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99308.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch)
NOTE: Running task 145 of 5581 (ID: 1526, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99310.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch)
NOTE: package gperf-native-3.0.3-r0: task do_unpack: Started
NOTE: Unpacking ../sources/gperf-3.0.3.tar.gz to tmp/work/x86_64-linux/gperf-native-3.0.3-r0/
NOTE: package gperf-native-3.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 146 of 5581 (ID: 895, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_install)
NOTE: package linux-libc-headers-2.6.37-r0: task do_install: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99312.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99313.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch)
NOTE: Running task 147 of 5581 (ID: 3008, /home/oe/openembedded/recipes/eglibc/eglibc-initial_2.12.bb, do_patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99314.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_patch: Started
NOTE: Applying patch 'eglibc-svn-arm-lowlevellock-include-tls.patch' (../openembedded/recipes/eglibc/eglibc-svn/eglibc-svn-arm-lowlevellock-include-tls.patch)
NOTE: Applying patch 'IO-acquire-lock-fix.patch' (../openembedded/recipes/eglibc/files/IO-acquire-lock-fix.patch)
NOTE: Applying patch 'shorten-build-commands.patch' (../openembedded/recipes/eglibc/files/shorten-build-commands.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99315.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99316.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch)
NOTE: Applying patch 'sh4_set_fpscr_2.12.patch' (../openembedded/recipes/eglibc/files/sh4_set_fpscr_2.12.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99318.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99319.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch)
NOTE: Applying patch 'sh4_local-fpscr_values.patch' (../openembedded/recipes/eglibc/files/sh4_local-fpscr_values.patch)
NOTE: Applying patch 'eglibc-dont-cache-slibdir.patch' (../openembedded/recipes/eglibc/files/eglibc-dont-cache-slibdir.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99320.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99321.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch)
NOTE: Applying patch 'armv4-eabi-compile-fix.patch' (../openembedded/recipes/eglibc/eglibc-svn/armv4-eabi-compile-fix.patch)
NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_patch: Succeeded
NOTE: Running task 148 of 5581 (ID: 1519, /home/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.5.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99322.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99323.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_fetch: Started
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_fetch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99324.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99325.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch)
NOTE: Running task 149 of 5581 (ID: 1512, /home/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.5.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99326.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99327.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_unpack: Started
NOTE: Unpacking ../sources/gcc-4_5-branch_gcc.gnu.org_.svn.gcc.branches_170880_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r36.1+svnr170880/
NOTE: Applying patch 'gcc-4.5-linaro-r99332.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99335.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99336.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99337.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99338.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99339.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99340.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99341.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99342.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_install: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99343.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99344.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99345.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch)
NOTE: Running task 150 of 5581 (ID: 896, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_populate_sysroot)
NOTE: Applying patch 'gcc-4.5-linaro-r99346.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99347.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_populate_sysroot: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99348.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99349.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch)
NOTE: package linux-libc-headers-2.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99351.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch)
NOTE: Running task 151 of 5581 (ID: 111, /home/oe/openembedded/recipes/eglibc/eglibc_2.12.bb, do_setscene)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99352.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99353.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_setscene: Succeeded
NOTE: Running task 152 of 5581 (ID: 1527, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_patch)
NOTE: package gperf-native-3.0.3-r0: task do_patch: Started
NOTE: Applying patch 'autoreconf.patch' (../openembedded/recipes/gperf/files/autoreconf.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99354.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch)
NOTE: package gperf-native-3.0.3-r0: task do_patch: Succeeded
NOTE: Running task 153 of 5581 (ID: 110, /home/oe/openembedded/recipes/eglibc/eglibc_2.12.bb, do_fetch)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_fetch: Started
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_fetch: Succeeded
NOTE: Running task 154 of 5581 (ID: 103, /home/oe/openembedded/recipes/eglibc/eglibc_2.12.bb, do_unpack)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_unpack: Started
NOTE: Unpacking ../sources/eglibc-2_12_svn.eglibc.org_.branches_13230_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr13230/
NOTE: Applying patch 'gcc-4.5-linaro-r99355.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99356.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99357.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99358.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99359.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99360.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99361.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99363.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99364.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99365.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99366.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99367.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99368.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99369.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99371.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99372.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99373.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99374.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99375.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99376.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99377.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99378.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99379.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99380.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99381.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99383.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99384.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99385.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99388.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99391.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99392.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99393.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99395.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99396.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99397.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99398.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99402.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99403.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99404.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99405.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99406.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99407.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99408.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99409.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99410.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99411.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99412.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99413.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99415.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch)
NOTE: Unpacking ../openembedded/recipes/eglibc/files/etc/ld.so.conf to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr13230/etc/
NOTE: Unpacking ../openembedded/recipes/eglibc/files/generate-supported.mk to tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r21.8+svnr13230/
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99416.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99417.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch)
NOTE: Running task 155 of 5581 (ID: 104, /home/oe/openembedded/recipes/eglibc/eglibc_2.12.bb, do_patch)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_patch: Started
NOTE: Applying patch 'eglibc-svn-arm-lowlevellock-include-tls.patch' (../openembedded/recipes/eglibc/eglibc-svn/eglibc-svn-arm-lowlevellock-include-tls.patch)
NOTE: Applying patch 'IO-acquire-lock-fix.patch' (../openembedded/recipes/eglibc/files/IO-acquire-lock-fix.patch)
NOTE: Applying patch 'shorten-build-commands.patch' (../openembedded/recipes/eglibc/files/shorten-build-commands.patch)
NOTE: Applying patch 'sh4_set_fpscr_2.12.patch' (../openembedded/recipes/eglibc/files/sh4_set_fpscr_2.12.patch)
NOTE: Applying patch 'sh4_local-fpscr_values.patch' (../openembedded/recipes/eglibc/files/sh4_local-fpscr_values.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99418.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch)
NOTE: Applying patch 'eglibc-dont-cache-slibdir.patch' (../openembedded/recipes/eglibc/files/eglibc-dont-cache-slibdir.patch)
NOTE: Applying patch 'armv4-eabi-compile-fix.patch' (../openembedded/recipes/eglibc/eglibc-svn/armv4-eabi-compile-fix.patch)
NOTE: package eglibc-2.12-r21.8+svnr13230: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99419.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99420.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch)
NOTE: Running task 156 of 5581 (ID: 97, /home/oe/openembedded/recipes/gcc/gcc-cross_4.5.bb, do_setscene)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99421.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99423.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99424.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_setscene: Succeeded
NOTE: Running task 157 of 5581 (ID: 96, /home/oe/openembedded/recipes/gcc/gcc-cross_4.5.bb, do_fetch)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_fetch: Started
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_fetch: Succeeded
NOTE: Running task 158 of 5581 (ID: 89, /home/oe/openembedded/recipes/gcc/gcc-cross_4.5.bb, do_unpack)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_unpack: Started
NOTE: Unpacking ../sources/gcc-4_5-branch_gcc.gnu.org_.svn.gcc.branches_170880_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.5-r36.1+svnr170880/
NOTE: Applying patch 'gcc-4.5-linaro-r99425.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99426.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99429.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99432.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99433.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99434.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99435.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99436.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99437.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99439.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99440.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch)
NOTE: Running task 159 of 5581 (ID: 1513, /home/oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.5.bb, do_patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_patch: Started
NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
NOTE: Applying patch '100-uclibc-conf.patch' (../openembedded/recipes/gcc/gcc-4.5/100-uclibc-conf.patch)
NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch)
NOTE: Applying patch 'cache-amnesia.patch' (../openembedded/recipes/gcc/gcc-4.5/cache-amnesia.patch)
NOTE: Applying patch 'gcc-flags-for-build.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-flags-for-build.patch)
NOTE: Applying patch 'libstdc++-emit-__cxa_end_cleanup-in-text.patch' (../openembedded/recipes/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch)
NOTE: Applying patch 'Makefile.in.patch' (../openembedded/recipes/gcc/gcc-4.5/Makefile.in.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99441.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch)
NOTE: Applying patch 'gcc-armv4-pass-fix-v4bx-to-ld.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch)
NOTE: Applying patch 'sh4-multilib.patch' (../openembedded/recipes/gcc/gcc-4.5/sh4-multilib.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99442.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch)
NOTE: package perl-native-5.10.1-r11: task do_configure: Succeeded
NOTE: Applying patch 'arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch' (../openembedded/recipes/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99297.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99443.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99444.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch)
NOTE: Running task 160 of 5581 (ID: 2874, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_qa_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99298.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch)
NOTE: package perl-native-5.10.1-r11: task do_qa_configure: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99449.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99450.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch)
NOTE: package perl-native-5.10.1-r11: task do_qa_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99299.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99300.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch)
NOTE: Running task 161 of 5581 (ID: 2875, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_compile)
NOTE: package perl-native-5.10.1-r11: task do_compile: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99301.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99302.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99451.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99303.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99304.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99452.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99305.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99453.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99454.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99306.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99307.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99308.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99455.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99310.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99464.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99312.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99465.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99313.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99314.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99315.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99466.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99468.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99316.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99473.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99318.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99319.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99320.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99475.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99321.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99322.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99323.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99324.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99325.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99326.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99478.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99327.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99479.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99480.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99332.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99335.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99481.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99482.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99336.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99337.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99483.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99338.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99339.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99488.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99340.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99341.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99489.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch)
NOTE: Applying patch 'more-epilogues.patch' (../openembedded/recipes/gcc/gcc-4.5/more-epilogues.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99342.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99343.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99344.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99345.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch)
NOTE: Applying patch 'gcc-scalar-widening-pr45847.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch)
NOTE: Applying patch 'gcc-arm-volatile-bitfield-fix.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99346.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99347.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch)
NOTE: Applying patch 'zecke-no-host-includes.patch' (../openembedded/recipes/gcc/gcc-4.5/zecke-no-host-includes.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99348.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch)
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99349.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99351.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99352.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch)
NOTE: Running task 162 of 5581 (ID: 1562, /home/oe/openembedded/recipes/libtool/libtool-cross_2.4.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99353.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch)
NOTE: package libtool-cross-2.4-r28.2: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99354.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99355.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99356.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99357.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch)
NOTE: package libtool-cross-2.4-r28.2: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99358.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99359.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99360.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99361.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch)
NOTE: Running task 163 of 5581 (ID: 1561, /home/oe/openembedded/recipes/libtool/libtool-cross_2.4.bb, do_fetch)
NOTE: package libtool-cross-2.4-r28.2: task do_fetch: Started
NOTE: package libtool-cross-2.4-r28.2: task do_fetch: Succeeded
NOTE: Running task 164 of 5581 (ID: 1554, /home/oe/openembedded/recipes/libtool/libtool-cross_2.4.bb, do_unpack)
NOTE: package libtool-cross-2.4-r28.2: task do_unpack: Started
NOTE: Unpacking ../sources/libtool-2.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libtool-cross-2.4-r28.2/
NOTE: package libtool-cross-2.4-r28.2: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99363.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch)
NOTE: Running task 165 of 5581 (ID: 1555, /home/oe/openembedded/recipes/libtool/libtool-cross_2.4.bb, do_patch)
NOTE: package libtool-cross-2.4-r28.2: task do_patch: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99364.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_unpack: Succeeded
NOTE: Applying patch 'trailingslash.patch' (../openembedded/recipes/libtool/libtool-2.4/trailingslash.patch)
NOTE: Applying patch 'prefix-manpage-fix.patch' (../openembedded/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch)
NOTE: Applying patch 'rename-with-sysroot.patch' (../openembedded/recipes/libtool/libtool-2.4/rename-with-sysroot.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99365.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99366.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99367.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch)
NOTE: Applying patch 'resolve-sysroot.patch' (../openembedded/recipes/libtool/libtool-2.4/resolve-sysroot.patch)
NOTE: Running task 166 of 5581 (ID: 90, /home/oe/openembedded/recipes/gcc/gcc-cross_4.5.bb, do_patch)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_patch: Started
NOTE: Applying patch 'use-sysroot-in-libpath.patch' (../openembedded/recipes/libtool/libtool-2.4/use-sysroot-in-libpath.patch)
NOTE: Applying patch 'fix-final-rpath.patch' (../openembedded/recipes/libtool/libtool-2.4/fix-final-rpath.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99368.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99369.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch)
NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
NOTE: Applying patch '100-uclibc-conf.patch' (../openembedded/recipes/gcc/gcc-4.5/100-uclibc-conf.patch)
NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch)
NOTE: Applying patch 'prefix.patch' (../openembedded/recipes/libtool/libtool-2.4/prefix.patch)
NOTE: package libtool-cross-2.4-r28.2: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99371.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99372.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch)
NOTE: Running task 167 of 5581 (ID: 3225, /home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_setscene)
NOTE: Applying patch 'cache-amnesia.patch' (../openembedded/recipes/gcc/gcc-4.5/cache-amnesia.patch)
NOTE: Applying patch 'gcc-flags-for-build.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-flags-for-build.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99373.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99374.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99375.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch)
NOTE: package util-macros-1_1.13.0-r2.0: task do_setscene: Started
NOTE: Applying patch 'libstdc++-emit-__cxa_end_cleanup-in-text.patch' (../openembedded/recipes/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99376.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch)
NOTE: package util-macros-1_1.13.0-r2.0: task do_setscene: Succeeded
NOTE: Applying patch 'Makefile.in.patch' (../openembedded/recipes/gcc/gcc-4.5/Makefile.in.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99377.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch)
NOTE: Applying patch 'gcc-armv4-pass-fix-v4bx-to-ld.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch)
NOTE: Applying patch 'sh4-multilib.patch' (../openembedded/recipes/gcc/gcc-4.5/sh4-multilib.patch)
NOTE: Applying patch 'arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch' (../openembedded/recipes/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99378.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99379.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch)
NOTE: Running task 168 of 5581 (ID: 3224, /home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99297.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99298.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99380.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch)
NOTE: package util-macros-1_1.13.0-r2.0: task do_fetch: Started
NOTE: package util-macros-1_1.13.0-r2.0: task do_fetch: Succeeded
NOTE: Running task 169 of 5581 (ID: 3217, /home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99299.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99300.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99381.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch)
NOTE: package util-macros-1_1.13.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/util-macros-1.13.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/util-macros-1_1.13.0-r2.0/
NOTE: package util-macros-1_1.13.0-r2.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99383.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch)
NOTE: Running task 170 of 5581 (ID: 3218, /home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99301.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99384.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch)
NOTE: package util-macros-1_1.13.0-r2.0: task do_patch: Started
NOTE: package util-macros-1_1.13.0-r2.0: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99302.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99303.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99385.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99388.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch)
NOTE: Running task 171 of 5581 (ID: 4999, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99304.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99305.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99391.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99306.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99307.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99392.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99393.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99395.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_setscene: Succeeded
NOTE: Running task 172 of 5581 (ID: 4998, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_fetch)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_fetch: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_fetch: Succeeded
NOTE: Running task 173 of 5581 (ID: 4991, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_unpack)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/util-macros-1.13.0.tar.gz to tmp/work/x86_64-linux/util-macros-native-1_1.13.0-r2.0/
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_unpack: Succeeded
NOTE: Running task 174 of 5581 (ID: 3239, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_setscene)
NOTE: package xorg-headers-native-1.0-r2: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99308.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99310.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99396.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99312.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99313.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99314.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99315.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99316.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99397.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch)
NOTE: Running task 175 of 5581 (ID: 3238, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99318.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99319.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99320.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99398.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_fetch: Started
NOTE: package xorg-headers-native-1.0-r2: task do_fetch: Succeeded
NOTE: Running task 176 of 5581 (ID: 3231, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99321.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99322.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/xorg-lib/xorg-headers-native/X11 to tmp/work/x86_64-linux/xorg-headers-native-1.0-r2/
NOTE: package xorg-headers-native-1.0-r2: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99402.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99403.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch)
NOTE: Running task 177 of 5581 (ID: 3888, /home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99323.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99324.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99325.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99404.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch)
NOTE: package xproto-1_7.0.21-r2.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99326.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99327.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99405.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99406.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99407.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch)
NOTE: package xproto-1_7.0.21-r2.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99332.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99335.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99408.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch)
NOTE: Running task 178 of 5581 (ID: 3887, /home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99336.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99337.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99409.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99410.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch)
NOTE: package xproto-1_7.0.21-r2.0: task do_fetch: Started
NOTE: package xproto-1_7.0.21-r2.0: task do_fetch: Succeeded
NOTE: Running task 179 of 5581 (ID: 3880, /home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99338.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99339.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99411.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99412.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch)
NOTE: package xproto-1_7.0.21-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xproto-7.0.21.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xproto-1_7.0.21-r2.0/
NOTE: package xproto-1_7.0.21-r2.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99340.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99341.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99413.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99415.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99342.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99416.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99343.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch)
NOTE: Running task 180 of 5581 (ID: 4992, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99417.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99418.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_patch: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99344.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch)
NOTE: Running task 181 of 5581 (ID: 3232, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99345.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99346.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99419.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_patch: Started
NOTE: package xorg-headers-native-1.0-r2: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99420.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99347.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch)
NOTE: Running task 182 of 5581 (ID: 3240, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99421.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99423.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99348.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99349.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99351.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_configure: Started
NOTE: package xorg-headers-native-1.0-r2: task do_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99424.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99352.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99353.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99354.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch)
NOTE: Running task 183 of 5581 (ID: 3881, /home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_patch)
NOTE: package xproto-1_7.0.21-r2.0: task do_patch: Started
NOTE: package xproto-1_7.0.21-r2.0: task do_patch: Succeeded
NOTE: Running task 184 of 5581 (ID: 3211, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99355.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99356.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99357.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99358.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99359.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99360.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_setscene: Started
NOTE: package m4-native-1.4.14-r0.1: task do_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99361.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch)
NOTE: Running task 185 of 5581 (ID: 2860, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_qa_configure)
NOTE: package m4-native-1.4.14-r0.1: task do_qa_configure: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99425.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch)
NOTE: package m4-native-1.4.14-r0.1: task do_qa_configure: Succeeded
NOTE: package gtk-doc-native-1.0-r3: task do_setscene: Succeeded
NOTE: Running task 186 of 5581 (ID: 3210, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_fetch)
NOTE: package gtk-doc-native-1.0-r3: task do_fetch: Started
NOTE: package gtk-doc-native-1.0-r3: task do_fetch: Succeeded
NOTE: Running task 187 of 5581 (ID: 2861, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_compile)
NOTE: package m4-native-1.4.14-r0.1: task do_compile: Started
NOTE: Running task 188 of 5581 (ID: 3203, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99363.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99364.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/gtk-doc/gtk-doc.m4 to tmp/work/x86_64-linux/gtk-doc-native-1.0-r3/
NOTE: package gtk-doc-native-1.0-r3: task do_unpack: Succeeded
NOTE: Running task 189 of 5581 (ID: 4204, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_setscene)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_setscene: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99426.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch)
NOTE: Running task 190 of 5581 (ID: 4203, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_fetch)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_fetch: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_fetch: Succeeded
NOTE: Running task 191 of 5581 (ID: 4196, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99429.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xproto-7.0.21.tar.bz2 to tmp/work/x86_64-linux/xproto-native-1_7.0.21-r2.0/
NOTE: package xproto-native-1_7.0.21-r2.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99365.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99366.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99367.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99432.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99433.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99434.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99368.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch)
NOTE: Running task 192 of 5581 (ID: 3241, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_qa_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99369.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99371.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99435.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99436.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99437.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_qa_configure: Started
NOTE: package xorg-headers-native-1.0-r2: task do_qa_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99439.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch)
NOTE: Running task 193 of 5581 (ID: 3242, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_compile)
NOTE: Applying patch 'gcc-4.5-linaro-r99372.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_compile: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99440.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99441.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99373.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99374.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_compile: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99442.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99375.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99443.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch)
NOTE: Running task 194 of 5581 (ID: 3233, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_install)
NOTE: Applying patch 'gcc-4.5-linaro-r99376.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99444.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_install: Started
NOTE: package xorg-headers-native-1.0-r2: task do_install: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99377.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99378.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99449.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99450.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99451.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99379.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99380.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch)
NOTE: Running task 195 of 5581 (ID: 3234, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_populate_sysroot)
NOTE: Applying patch 'gcc-4.5-linaro-r99452.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99381.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99383.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch)
NOTE: package xorg-headers-native-1.0-r2: task do_populate_sysroot: Started
NOTE: package xorg-headers-native-1.0-r2: task do_populate_sysroot: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99453.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99454.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99384.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99385.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99455.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99464.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99465.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch)
NOTE: Running task 196 of 5581 (ID: 3846, /home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99388.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99391.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99466.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch)
NOTE: package libxau-1_1.0.6-r9.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99392.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99468.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch)
NOTE: package libxau-1_1.0.6-r9.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99393.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99395.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99473.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99475.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99396.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99478.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99397.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch)
NOTE: Running task 197 of 5581 (ID: 3845, /home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99479.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch)
NOTE: package libxau-1_1.0.6-r9.0: task do_fetch: Started
NOTE: package libxau-1_1.0.6-r9.0: task do_fetch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99480.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch)
NOTE: Running task 198 of 5581 (ID: 3838, /home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99398.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99402.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99481.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch)
NOTE: package libxau-1_1.0.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXau-1.0.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxau-1_1.0.6-r9.0/
NOTE: package libxau-1_1.0.6-r9.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99403.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99404.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99482.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99483.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99405.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99406.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99488.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99489.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch)
NOTE: Running task 199 of 5581 (ID: 3204, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r3: task do_patch: Started
NOTE: package gtk-doc-native-1.0-r3: task do_patch: Succeeded
NOTE: Applying patch 'more-epilogues.patch' (../openembedded/recipes/gcc/gcc-4.5/more-epilogues.patch)
NOTE: Running task 200 of 5581 (ID: 3212, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99407.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99408.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch)
NOTE: Applying patch 'gcc-scalar-widening-pr45847.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_configure: Started
NOTE: package gtk-doc-native-1.0-r3: task do_configure: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99409.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99410.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch)
NOTE: Applying patch 'gcc-arm-volatile-bitfield-fix.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch)
NOTE: Applying patch 'zecke-no-host-includes.patch' (../openembedded/recipes/gcc/gcc-4.5/zecke-no-host-includes.patch)
NOTE: package gcc-cross-intermediate-4.5-r36.1+svnr170880: task do_patch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99411.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch)
NOTE: Running task 201 of 5581 (ID: 2987, virtual:native:/home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99412.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch)
NOTE: package glib-2.0-native-2.28.5-r1: task do_setscene: Started
NOTE: Running task 202 of 5581 (ID: 4197, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99413.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99415.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_patch: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_patch: Succeeded
NOTE: package glib-2.0-native-2.28.5-r1: task do_setscene: Succeeded
NOTE: Running task 203 of 5581 (ID: 5307, virtual:native:/home/oe/openembedded/recipes/libxslt/libxslt_1.1.26.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99416.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99417.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99418.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch)
NOTE: package libxslt-native-1.1.26-r6.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99419.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch)
NOTE: Running task 204 of 5581 (ID: 2986, virtual:native:/home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_fetch)
NOTE: package libxslt-native-1.1.26-r6.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99420.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99421.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99423.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch)
NOTE: package glib-2.0-native-2.28.5-r1: task do_fetch: Started
NOTE: package glib-2.0-native-2.28.5-r1: task do_fetch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99424.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch)
NOTE: Running task 205 of 5581 (ID: 5306, virtual:native:/home/oe/openembedded/recipes/libxslt/libxslt_1.1.26.bb, do_fetch)
NOTE: Running task 206 of 5581 (ID: 2979, virtual:native:/home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99425.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch)
NOTE: package libxslt-native-1.1.26-r6.0: task do_fetch: Started
NOTE: package libxslt-native-1.1.26-r6.0: task do_fetch: Succeeded
NOTE: package glib-2.0-native-2.28.5-r1: task do_unpack: Started
NOTE: Unpacking ../sources/glib-2.28.5.tar.bz2 to tmp/work/x86_64-linux/glib-2.0-native-2.28.5-r1/
NOTE: Running task 207 of 5581 (ID: 5299, virtual:native:/home/oe/openembedded/recipes/libxslt/libxslt_1.1.26.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99426.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch)
NOTE: package libxslt-native-1.1.26-r6.0: task do_unpack: Started
NOTE: Unpacking ../sources/libxslt-1.1.26.tar.gz to tmp/work/x86_64-linux/libxslt-native-1.1.26-r6.0/
NOTE: package libxslt-native-1.1.26-r6.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99429.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99432.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch)
NOTE: Running task 208 of 5581 (ID: 5293, virtual:native:/home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99433.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch)
NOTE: package xcb-proto-native-1.6-r3.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99434.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch)
NOTE: package xcb-proto-native-1.6-r3.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99435.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99436.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99437.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch)
NOTE: Running task 209 of 5581 (ID: 5292, virtual:native:/home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_fetch)
NOTE: package xcb-proto-native-1.6-r3.0: task do_fetch: Started
NOTE: package xcb-proto-native-1.6-r3.0: task do_fetch: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99439.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch)
NOTE: Running task 210 of 5581 (ID: 5285, virtual:native:/home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_unpack)
NOTE: package xcb-proto-native-1.6-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/xcb-proto-1.6.tar.bz2 to tmp/work/x86_64-linux/xcb-proto-native-1.6-r3.0/
NOTE: package xcb-proto-native-1.6-r3.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99440.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99441.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch)
NOTE: Running task 211 of 5581 (ID: 5321, /home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99442.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch)
NOTE: package libpthread-stubs-0.2-r2.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99443.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch)
NOTE: package libpthread-stubs-0.2-r2.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99444.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99449.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99450.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch)
NOTE: Running task 212 of 5581 (ID: 5320, /home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_fetch)
NOTE: package libpthread-stubs-0.2-r2.0: task do_fetch: Started
NOTE: package libpthread-stubs-0.2-r2.0: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/glib-2.0/files/glibconfig-sysdefs.h to tmp/work/x86_64-linux/glib-2.0-native-2.28.5-r1/
NOTE: package glib-2.0-native-2.28.5-r1: task do_unpack: Succeeded
NOTE: Running task 213 of 5581 (ID: 5313, /home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99451.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99452.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch)
NOTE: package libpthread-stubs-0.2-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/libpthread-stubs-0.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libpthread-stubs-0.2-r2.0/
NOTE: package libpthread-stubs-0.2-r2.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99453.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99454.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99455.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch)
NOTE: Running task 214 of 5581 (ID: 5279, /home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_setscene)
NOTE: package xcb-proto-1.6-r3.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99464.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch)
NOTE: Running task 215 of 5581 (ID: 4667, /home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_setscene)
NOTE: Applying patch 'gcc-4.5-linaro-r99465.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99466.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch)
NOTE: package xcb-proto-1.6-r3.0: task do_setscene: Succeeded
NOTE: package xtrans-1_1.2.6-r9.0: task do_setscene: Started
NOTE: Running task 216 of 5581 (ID: 5278, /home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_fetch)
NOTE: Applying patch 'gcc-4.5-linaro-r99468.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99473.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch)
NOTE: package xtrans-1_1.2.6-r9.0: task do_setscene: Succeeded
NOTE: package xcb-proto-1.6-r3.0: task do_fetch: Started
NOTE: package xcb-proto-1.6-r3.0: task do_fetch: Succeeded
NOTE: Running task 217 of 5581 (ID: 4666, /home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_fetch)
NOTE: Running task 218 of 5581 (ID: 5271, /home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_unpack)
NOTE: Applying patch 'gcc-4.5-linaro-r99475.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch)
NOTE: package xtrans-1_1.2.6-r9.0: task do_fetch: Started
NOTE: package xtrans-1_1.2.6-r9.0: task do_fetch: Succeeded
NOTE: package xcb-proto-1.6-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/xcb-proto-1.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xcb-proto-1.6-r3.0/
NOTE: package xcb-proto-1.6-r3.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99478.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch)
NOTE: Running task 219 of 5581 (ID: 4659, /home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_unpack)
NOTE: Running task 220 of 5581 (ID: 1801, /home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_setscene)
NOTE: package xtrans-1_1.2.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/xtrans-1.2.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xtrans-1_1.2.6-r9.0/
NOTE: package zlib-1.2.3-r7.0: task do_setscene: Started
NOTE: Applying patch 'gcc-4.5-linaro-r99479.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch)
NOTE: package xtrans-1_1.2.6-r9.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99480.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99481.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch)
NOTE: Running task 221 of 5581 (ID: 3839, /home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_patch)
NOTE: package zlib-1.2.3-r7.0: task do_setscene: Succeeded
NOTE: Applying patch 'gcc-4.5-linaro-r99482.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99483.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch)
NOTE: package libxau-1_1.0.6-r9.0: task do_patch: Started
NOTE: package libxau-1_1.0.6-r9.0: task do_patch: Succeeded
NOTE: Running task 222 of 5581 (ID: 1800, /home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_fetch)
NOTE: package zlib-1.2.3-r7.0: task do_fetch: Started
NOTE: package zlib-1.2.3-r7.0: task do_fetch: Succeeded
NOTE: Running task 223 of 5581 (ID: 3213, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_qa_configure)
NOTE: Applying patch 'gcc-4.5-linaro-r99488.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch)
NOTE: Applying patch 'gcc-4.5-linaro-r99489.patch' (../openembedded/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_qa_configure: Started
NOTE: package gtk-doc-native-1.0-r3: task do_qa_configure: Succeeded
NOTE: Running task 224 of 5581 (ID: 1793, /home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_unpack)
NOTE: package zlib-1.2.3-r7.0: task do_unpack: Started
NOTE: Unpacking ../sources/zlib-1.2.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/zlib-1.2.3-r7.0/
NOTE: Applying patch 'more-epilogues.patch' (../openembedded/recipes/gcc/gcc-4.5/more-epilogues.patch)
NOTE: Running task 225 of 5581 (ID: 3214, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_compile)
NOTE: package zlib-1.2.3-r7.0: task do_unpack: Succeeded
NOTE: Applying patch 'gcc-scalar-widening-pr45847.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch)
NOTE: Applying patch 'gcc-arm-volatile-bitfield-fix.patch' (../openembedded/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch)
NOTE: Applying patch 'zecke-no-host-includes.patch' (../openembedded/recipes/gcc/gcc-4.5/zecke-no-host-includes.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_compile: Started
NOTE: package gtk-doc-native-1.0-r3: task do_compile: Succeeded
NOTE: Running task 226 of 5581 (ID: 2980, virtual:native:/home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_patch)
NOTE: Running task 227 of 5581 (ID: 3205, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_install)
NOTE: package gcc-cross-4.5-r36.1+svnr170880: task do_patch: Succeeded
NOTE: package glib-2.0-native-2.28.5-r1: task do_patch: Started
NOTE: Applying patch 'configure-libtool.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/configure-libtool.patch)
NOTE: package gtk-doc-native-1.0-r3: task do_install: Started
NOTE: package gtk-doc-native-1.0-r3: task do_install: Succeeded
NOTE: Running task 228 of 5581 (ID: 5300, virtual:native:/home/oe/openembedded/recipes/libxslt/libxslt_1.1.26.bb, do_patch)
NOTE: Applying patch 'g_once_init_enter.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/g_once_init_enter.patch)
NOTE: Applying patch 'gatomic-proper-pointer-get-cast.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/gatomic-proper-pointer-get-cast.patch)
NOTE: package libxslt-native-1.1.26-r6.0: task do_patch: Started
NOTE: package libxslt-native-1.1.26-r6.0: task do_patch: Succeeded
NOTE: Running task 229 of 5581 (ID: 3206, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_populate_sysroot)
NOTE: Running task 230 of 5581 (ID: 5286, virtual:native:/home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r3: task do_populate_sysroot: Started
NOTE: Applying patch '60_wait-longer-for-threads-to-die.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/60_wait-longer-for-threads-to-die.patch)
NOTE: Applying patch 'glib-mkenums-interpreter.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/glib-mkenums-interpreter.patch)
NOTE: package xcb-proto-native-1.6-r3.0: task do_patch: Started
NOTE: package xcb-proto-native-1.6-r3.0: task do_patch: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_compile: Succeeded
NOTE: Running task 231 of 5581 (ID: 1421, virtual:native:/home/oe/openembedded/recipes/desktop-file-utils/desktop-file-utils_0.16.bb, do_setscene)
NOTE: package gtk-doc-native-1.0-r3: task do_populate_sysroot: Succeeded
NOTE: Applying patch 'libglib2-fix-compilation-with-no-builtin-atomic.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/libglib2-fix-compilation-with-no-builtin-atomic.patch)
NOTE: Applying patch 'configure-ipv6.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/configure-ipv6.patch)
NOTE: package desktop-file-utils-native-0.16-r0: task do_setscene: Started
NOTE: Running task 232 of 5581 (ID: 2852, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_install)
NOTE: package m4-native-1.4.14-r0.1: task do_install: Started
NOTE: Running task 233 of 5581 (ID: 1407, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_setscene)
NOTE: package glib-2.0-native-2.28.5-r1: task do_patch: Succeeded
NOTE: package desktop-file-utils-native-0.16-r0: task do_setscene: Succeeded
NOTE: package pax-utils-native-0.1.19-r2: task do_setscene: Started
NOTE: Running task 234 of 5581 (ID: 1393, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_setscene)
NOTE: package file-native-5.05-r2.0: task do_setscene: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_setscene: Succeeded
NOTE: Running task 235 of 5581 (ID: 1420, virtual:native:/home/oe/openembedded/recipes/desktop-file-utils/desktop-file-utils_0.16.bb, do_fetch)
NOTE: package desktop-file-utils-native-0.16-r0: task do_fetch: Started
NOTE: package desktop-file-utils-native-0.16-r0: task do_fetch: Succeeded
NOTE: package file-native-5.05-r2.0: task do_setscene: Succeeded
NOTE: Running task 236 of 5581 (ID: 1406, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_fetch)
NOTE: package pax-utils-native-0.1.19-r2: task do_fetch: Started
NOTE: Running task 237 of 5581 (ID: 1392, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_fetch)
NOTE: package m4-native-1.4.14-r0.1: task do_install: Succeeded
NOTE: package file-native-5.05-r2.0: task do_fetch: Started
NOTE: Running task 238 of 5581 (ID: 1413, virtual:native:/home/oe/openembedded/recipes/desktop-file-utils/desktop-file-utils_0.16.bb, do_unpack)
NOTE: package desktop-file-utils-native-0.16-r0: task do_unpack: Started
NOTE: Unpacking ../sources/desktop-file-utils-0.16.tar.bz2 to tmp/work/x86_64-linux/desktop-file-utils-native-0.16-r0/
NOTE: package desktop-file-utils-native-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 239 of 5581 (ID: 2853, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_populate_sysroot)
NOTE: package m4-native-1.4.14-r0.1: task do_populate_sysroot: Started
NOTE: Running task 240 of 5581 (ID: 3902, /home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_setscene)
NOTE: package pax-utils-native-0.1.19-r2: task do_fetch: Succeeded
NOTE: package file-native-5.05-r2.0: task do_fetch: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_populate_sysroot: Succeeded
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_setscene: Started
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_setscene: Succeeded
NOTE: Running task 241 of 5581 (ID: 1399, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_unpack)
NOTE: Running task 242 of 5581 (ID: 1385, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_unpack)
NOTE: Running task 243 of 5581 (ID: 4457, /home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_setscene)
NOTE: package pax-utils-native-0.1.19-r2: task do_unpack: Started
NOTE: package file-native-5.05-r2.0: task do_unpack: Started
NOTE: package xextproto-1_7.2.0-r2.0: task do_setscene: Started
NOTE: Running task 244 of 5581 (ID: 3901, /home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_fetch)
NOTE: Unpacking ../sources/pax-utils-0.1.19.tar.bz2 to tmp/work/x86_64-linux/pax-utils-native-0.1.19-r2/
NOTE: package pax-utils-native-0.1.19-r2: task do_unpack: Succeeded
NOTE: Unpacking ../sources/file-5.05.tar.gz to tmp/work/x86_64-linux/file-native-5.05-r2.0/
NOTE: package file-native-5.05-r2.0: task do_unpack: Succeeded
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_fetch: Started
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_fetch: Succeeded
NOTE: Running task 245 of 5581 (ID: 1590, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_setscene)
NOTE: package fastjar-native-0.98-r4.2: task do_setscene: Started
NOTE: Running task 246 of 5581 (ID: 5041, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_setscene)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_setscene: Started
NOTE: package xextproto-1_7.2.0-r2.0: task do_setscene: Succeeded
NOTE: Running task 247 of 5581 (ID: 3894, /home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_unpack)
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXdmcp-1.1.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxdmcp-1_1.1.0-r9.0/
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_unpack: Succeeded
NOTE: Running task 248 of 5581 (ID: 4456, /home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_fetch)
NOTE: package fastjar-native-0.98-r4.2: task do_setscene: Succeeded
NOTE: package libxau-native-1_1.0.6-r9.0: task do_setscene: Succeeded
NOTE: package xextproto-1_7.2.0-r2.0: task do_fetch: Started
NOTE: package xextproto-1_7.2.0-r2.0: task do_fetch: Succeeded
NOTE: Running task 249 of 5581 (ID: 1589, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_fetch)
NOTE: Running task 250 of 5581 (ID: 5040, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_fetch)
NOTE: Running task 251 of 5581 (ID: 5314, /home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_patch)
NOTE: package fastjar-native-0.98-r4.2: task do_fetch: Started
NOTE: package libpthread-stubs-0.2-r2.0: task do_patch: Started
NOTE: package libpthread-stubs-0.2-r2.0: task do_patch: Succeeded
NOTE: Running task 252 of 5581 (ID: 4449, /home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_unpack)
NOTE: package fastjar-native-0.98-r4.2: task do_fetch: Succeeded
NOTE: package libxau-native-1_1.0.6-r9.0: task do_fetch: Started
NOTE: package libxau-native-1_1.0.6-r9.0: task do_fetch: Succeeded
NOTE: package xextproto-1_7.2.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xextproto-7.2.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xextproto-1_7.2.0-r2.0/
NOTE: package xextproto-1_7.2.0-r2.0: task do_unpack: Succeeded
NOTE: Running task 253 of 5581 (ID: 1582, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_unpack)
NOTE: Running task 254 of 5581 (ID: 5033, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_unpack)
NOTE: package fastjar-native-0.98-r4.2: task do_unpack: Started
NOTE: Running task 255 of 5581 (ID: 3832, /home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_setscene)
NOTE: Unpacking ../sources/fastjar-0.98.tar.gz to tmp/work/x86_64-linux/fastjar-native-0.98-r4.2/
NOTE: package fastjar-native-0.98-r4.2: task do_unpack: Succeeded
NOTE: package libxau-native-1_1.0.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXau-1.0.6.tar.bz2 to tmp/work/x86_64-linux/libxau-native-1_1.0.6-r9.0/
NOTE: package kbproto-1_1.0.5-r2.0: task do_setscene: Started
NOTE: Running task 256 of 5581 (ID: 5272, /home/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb, do_patch)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_unpack: Succeeded
NOTE: package xcb-proto-1.6-r3.0: task do_patch: Started
NOTE: package xcb-proto-1.6-r3.0: task do_patch: Succeeded
NOTE: Running task 257 of 5581 (ID: 3267, /home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_setscene)
NOTE: Running task 258 of 5581 (ID: 4709, /home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_setscene)
NOTE: package inputproto-1_2.0.1-r2.0: task do_setscene: Started
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_setscene: Started
NOTE: Running task 259 of 5581 (ID: 4695, /home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_setscene)
NOTE: package kbproto-1_1.0.5-r2.0: task do_setscene: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_setscene: Started
NOTE: package inputproto-1_2.0.1-r2.0: task do_setscene: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_setscene: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 260 of 5581 (ID: 3831, /home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_fetch)
NOTE: package kbproto-1_1.0.5-r2.0: task do_fetch: Started
NOTE: package kbproto-1_1.0.5-r2.0: task do_fetch: Succeeded
NOTE: Running task 261 of 5581 (ID: 3266, /home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_fetch)
NOTE: Running task 262 of 5581 (ID: 4708, /home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_fetch)
NOTE: Running task 263 of 5581 (ID: 4694, /home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_fetch)
NOTE: package inputproto-1_2.0.1-r2.0: task do_fetch: Started
NOTE: package inputproto-1_2.0.1-r2.0: task do_fetch: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_fetch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_fetch: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_fetch: Started
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_fetch: Succeeded
NOTE: Running task 264 of 5581 (ID: 3824, /home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_unpack)
NOTE: package kbproto-1_1.0.5-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/kbproto-1.0.5.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/kbproto-1_1.0.5-r2.0/
NOTE: package kbproto-1_1.0.5-r2.0: task do_unpack: Succeeded
NOTE: Running task 265 of 5581 (ID: 3259, /home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_unpack)
NOTE: Running task 266 of 5581 (ID: 4701, /home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_unpack)
NOTE: Running task 267 of 5581 (ID: 4687, /home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_unpack)
NOTE: package inputproto-1_2.0.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/inputproto-2.0.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/inputproto-1_2.0.1-r2.0/
NOTE: package inputproto-1_2.0.1-r2.0: task do_unpack: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xf86bigfontproto-1.2.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xf86bigfontproto-1_1.2.0-r2.0/
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xcmiscproto-1.2.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xcmiscproto-1_1.2.1-r2.0/
NOTE: Running task 268 of 5581 (ID: 4681, /home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_setscene)
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_unpack: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_unpack: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_setscene: Started
NOTE: Running task 269 of 5581 (ID: 4653, /home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_setscene)
NOTE: Running task 270 of 5581 (ID: 5013, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_setscene)
NOTE: package libxcb-1.6-r4.1: task do_setscene: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_setscene: Started
NOTE: Running task 271 of 5581 (ID: 3281, /home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_setscene)
NOTE: package flex-2.5.35-r7.1: task do_setscene: Started
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 272 of 5581 (ID: 4680, /home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_fetch)
NOTE: package libxcb-1.6-r4.1: task do_setscene: Succeeded
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_setscene: Succeeded
NOTE: package flex-2.5.35-r7.1: task do_setscene: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_fetch: Started
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_fetch: Succeeded
NOTE: Running task 273 of 5581 (ID: 4652, /home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_fetch)
NOTE: Running task 274 of 5581 (ID: 5012, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_fetch)
NOTE: Running task 275 of 5581 (ID: 3280, /home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_fetch)
NOTE: package libxcb-1.6-r4.1: task do_fetch: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_fetch: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_fetch: Succeeded
NOTE: package flex-2.5.35-r7.1: task do_fetch: Started
NOTE: package flex-2.5.35-r7.1: task do_fetch: Succeeded
NOTE: Running task 276 of 5581 (ID: 4673, /home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_unpack)
NOTE: package libxcb-1.6-r4.1: task do_fetch: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/bigreqsproto-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/bigreqsproto-1_1.1.1-r2.0/
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 277 of 5581 (ID: 4645, /home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_unpack)
NOTE: Running task 278 of 5581 (ID: 5005, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_unpack)
NOTE: Running task 279 of 5581 (ID: 3273, /home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_unpack)
NOTE: package libxcb-1.6-r4.1: task do_unpack: Started
NOTE: Unpacking ../sources/libxcb-1.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxcb-1.6-r4.1/
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/xtrans-1.2.6.tar.bz2 to tmp/work/x86_64-linux/xtrans-native-1_1.2.6-r9.0/
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_unpack: Succeeded
NOTE: package flex-2.5.35-r7.1: task do_unpack: Started
NOTE: Unpacking ../sources/flex-2.5.35.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/flex-2.5.35-r7.1/
NOTE: Running task 280 of 5581 (ID: 4660, /home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_patch)
NOTE: package libxcb-1.6-r4.1: task do_unpack: Succeeded
NOTE: package xtrans-1_1.2.6-r9.0: task do_patch: Started
NOTE: package xtrans-1_1.2.6-r9.0: task do_patch: Succeeded
NOTE: Running task 281 of 5581 (ID: 1794, /home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_patch)
NOTE: Running task 282 of 5581 (ID: 5491, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_setscene)
NOTE: Running task 283 of 5581 (ID: 1414, virtual:native:/home/oe/openembedded/recipes/desktop-file-utils/desktop-file-utils_0.16.bb, do_patch)
NOTE: package zlib-1.2.3-r7.0: task do_patch: Started
NOTE: Applying patch 'visibility.patch' (../openembedded/recipes/zlib/zlib-1.2.3/visibility.patch)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_setscene: Started
NOTE: package desktop-file-utils-native-0.16-r0: task do_patch: Started
NOTE: package flex-2.5.35-r7.1: task do_unpack: Succeeded
NOTE: package desktop-file-utils-native-0.16-r0: task do_patch: Succeeded
NOTE: Running task 284 of 5581 (ID: 1400, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_patch)
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/zlib/zlib-1.2.3/autotools.patch)
NOTE: package zlib-1.2.3-r7.0: task do_patch: Succeeded
NOTE: package pax-utils-native-0.1.19-r2: task do_patch: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_patch: Succeeded
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_setscene: Succeeded
NOTE: Running task 285 of 5581 (ID: 1386, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_patch)
NOTE: Running task 286 of 5581 (ID: 3895, /home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_patch)
NOTE: package file-native-5.05-r2.0: task do_patch: Started
NOTE: Running task 287 of 5581 (ID: 5490, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_fetch)
NOTE: Applying patch 'reloc.patch' (../openembedded/recipes/file/file-5.05/reloc.patch)
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_patch: Started
NOTE: package libxdmcp-1_1.1.0-r9.0: task do_patch: Succeeded
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_fetch: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_fetch: Succeeded
NOTE: Running task 288 of 5581 (ID: 1408, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_configure)
NOTE: package file-native-5.05-r2.0: task do_patch: Succeeded
NOTE: package pax-utils-native-0.1.19-r2: task do_configure: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_configure: Succeeded
NOTE: Running task 289 of 5581 (ID: 4450, /home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_patch)
NOTE: Running task 290 of 5581 (ID: 5483, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_unpack)
NOTE: Running task 291 of 5581 (ID: 1583, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_patch)
NOTE: package xextproto-1_7.2.0-r2.0: task do_patch: Started
NOTE: package xextproto-1_7.2.0-r2.0: task do_patch: Succeeded
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/libpthread-stubs-0.2.tar.bz2 to tmp/work/x86_64-linux/libpthread-stubs-native-0.2-r2.0/
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_unpack: Succeeded
NOTE: Running task 292 of 5581 (ID: 5034, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_patch)
NOTE: package fastjar-native-0.98-r4.2: task do_patch: Started
NOTE: Applying patch 'jartool.patch' (../openembedded/recipes/fastjar/files/jartool.patch)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_patch: Started
NOTE: package libxau-native-1_1.0.6-r9.0: task do_patch: Succeeded
NOTE: Running task 293 of 5581 (ID: 3825, /home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_patch)
NOTE: Running task 294 of 5581 (ID: 3260, /home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_patch)
NOTE: package kbproto-1_1.0.5-r2.0: task do_patch: Started
NOTE: package kbproto-1_1.0.5-r2.0: task do_patch: Succeeded
NOTE: Running task 295 of 5581 (ID: 4702, /home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_patch)
NOTE: package fastjar-native-0.98-r4.2: task do_patch: Succeeded
NOTE: package inputproto-1_2.0.1-r2.0: task do_patch: Started
NOTE: package inputproto-1_2.0.1-r2.0: task do_patch: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_patch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r2.0: task do_patch: Succeeded
NOTE: Running task 296 of 5581 (ID: 4688, /home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_patch)
NOTE: Running task 297 of 5581 (ID: 4674, /home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_patch)
NOTE: Running task 298 of 5581 (ID: 4646, /home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_patch)
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_patch: Started
NOTE: package xcmiscproto-1_1.2.1-r2.0: task do_patch: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_patch: Started
NOTE: package bigreqsproto-1_1.1.1-r2.0: task do_patch: Succeeded
NOTE: package libxcb-1.6-r4.1: task do_patch: Started
NOTE: Applying patch 'configure_git.patch' (../openembedded/recipes/xcb/libxcb/configure_git.patch)
NOTE: Running task 299 of 5581 (ID: 3309, /home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_setscene)
NOTE: package libx11-1_1.4.3-r9.0: task do_setscene: Started
NOTE: Running task 300 of 5581 (ID: 5006, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_patch)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_patch: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_patch: Succeeded
NOTE: Running task 301 of 5581 (ID: 1211, /home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_setscene)
NOTE: package libxcb-1.6-r4.1: task do_patch: Succeeded
NOTE: package ncurses-5.9-r1: task do_setscene: Started
NOTE: Running task 302 of 5581 (ID: 3274, /home/oe/openembedded/recipes/flex/flex_2.5.35.bb, do_patch)
NOTE: package flex-2.5.35-r7.1: task do_patch: Started
NOTE: package flex-2.5.35-r7.1: task do_patch: Succeeded
NOTE: Running task 303 of 5581 (ID: 1773, /home/oe/openembedded/recipes/pam/libpam_1.1.1.bb, do_setscene)
NOTE: package libpam-1.1.1-r2: task do_setscene: Started
NOTE: package libx11-1_1.4.3-r9.0: task do_setscene: Succeeded
NOTE: Running task 304 of 5581 (ID: 3308, /home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_fetch)
NOTE: package libx11-1_1.4.3-r9.0: task do_fetch: Started
NOTE: package libx11-1_1.4.3-r9.0: task do_fetch: Succeeded
NOTE: Running task 305 of 5581 (ID: 3085, /home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_setscene)
NOTE: package libpam-1.1.1-r2: task do_setscene: Succeeded
NOTE: package ncurses-5.9-r1: task do_setscene: Succeeded
NOTE: package gtk-doc-1.0-r3: task do_setscene: Started
NOTE: Running task 306 of 5581 (ID: 1210, /home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_fetch)
NOTE: Running task 307 of 5581 (ID: 1772, /home/oe/openembedded/recipes/pam/libpam_1.1.1.bb, do_fetch)
NOTE: Running task 308 of 5581 (ID: 3301, /home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_unpack)
NOTE: package ncurses-5.9-r1: task do_fetch: Started
NOTE: package ncurses-5.9-r1: task do_fetch: Succeeded
NOTE: package libpam-1.1.1-r2: task do_fetch: Started
NOTE: package libpam-1.1.1-r2: task do_fetch: Succeeded
NOTE: package libx11-1_1.4.3-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libX11-1.4.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libx11-1_1.4.3-r9.0/
NOTE: package gtk-doc-1.0-r3: task do_setscene: Succeeded
NOTE: Running task 309 of 5581 (ID: 3084, /home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_fetch)
NOTE: Running task 310 of 5581 (ID: 1203, /home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_unpack)
NOTE: package gtk-doc-1.0-r3: task do_fetch: Started
NOTE: package gtk-doc-1.0-r3: task do_fetch: Succeeded
NOTE: package ncurses-5.9-r1: task do_unpack: Started
NOTE: Unpacking ../sources/ncurses-5.9.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/ncurses-5.9-r1/
NOTE: Running task 311 of 5581 (ID: 1765, /home/oe/openembedded/recipes/pam/libpam_1.1.1.bb, do_unpack)
NOTE: package libpam-1.1.1-r2: task do_unpack: Started
NOTE: Unpacking ../sources/Linux-PAM-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-1.1.1-r2/
NOTE: Unpacking ../openembedded/recipes/ncurses/ncurses/config.cache to tmp/work/armv5te-angstrom-linux-gnueabi/ncurses-5.9-r1/
NOTE: package ncurses-5.9-r1: task do_unpack: Succeeded
NOTE: Running task 312 of 5581 (ID: 3077, /home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_unpack)
NOTE: package gtk-doc-1.0-r3: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/gtk-doc/gtk-doc.m4 to tmp/work/armv5te-angstrom-linux-gnueabi/gtk-doc-1.0-r3/
NOTE: package gtk-doc-1.0-r3: task do_unpack: Succeeded
NOTE: Running task 313 of 5581 (ID: 5069, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_setscene)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_setscene: Started
NOTE: Running task 314 of 5581 (ID: 5027, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_setscene)
NOTE: package libpam-1.1.1-r2: task do_unpack: Succeeded
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_setscene: Started
NOTE: Running task 315 of 5581 (ID: 5111, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_setscene)
NOTE: package libx11-1_1.4.3-r9.0: task do_unpack: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_setscene: Succeeded
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_setscene: Succeeded
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_setscene: Started
NOTE: Running task 316 of 5581 (ID: 5484, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_patch)
NOTE: Running task 317 of 5581 (ID: 5068, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_fetch)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_patch: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_patch: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_fetch: Started
NOTE: Running task 318 of 5581 (ID: 5026, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_fetch)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_fetch: Succeeded
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_fetch: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_fetch: Succeeded
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_setscene: Succeeded
NOTE: Running task 319 of 5581 (ID: 5125, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_setscene)
NOTE: Running task 320 of 5581 (ID: 5061, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_unpack)
NOTE: Running task 321 of 5581 (ID: 5019, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_unpack)
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXdmcp-1.1.0.tar.bz2 to tmp/work/x86_64-linux/libxdmcp-native-1_1.1.0-r9.0/
NOTE: Running task 322 of 5581 (ID: 5110, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_fetch)
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_setscene: Started
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xextproto-7.2.0.tar.bz2 to tmp/work/x86_64-linux/xextproto-native-1_7.2.0-r2.0/
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_unpack: Succeeded
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_fetch: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_fetch: Succeeded
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_setscene: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_unpack: Succeeded
NOTE: Running task 323 of 5581 (ID: 5097, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_setscene)
NOTE: Running task 324 of 5581 (ID: 5124, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_fetch)
NOTE: Running task 325 of 5581 (ID: 5083, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_setscene)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_setscene: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_fetch: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_fetch: Succeeded
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_setscene: Started
NOTE: Running task 326 of 5581 (ID: 5103, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_unpack)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/kbproto-1.0.5.tar.bz2 to tmp/work/x86_64-linux/kbproto-native-1_1.0.5-r2.0/
NOTE: Running task 327 of 5581 (ID: 5117, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_unpack)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_setscene: Succeeded
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_unpack: Succeeded
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/inputproto-2.0.1.tar.bz2 to tmp/work/x86_64-linux/inputproto-native-1_2.0.1-r2.0/
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 328 of 5581 (ID: 5096, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_fetch)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_fetch: Started
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 329 of 5581 (ID: 5055, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_setscene)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_fetch: Succeeded
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_setscene: Started
NOTE: Running task 330 of 5581 (ID: 5082, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_fetch)
NOTE: Running task 331 of 5581 (ID: 4985, virtual:native:/home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_setscene)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_fetch: Started
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_fetch: Succeeded
NOTE: package libxcb-native-1.6-r4.1: task do_setscene: Started
NOTE: Running task 332 of 5581 (ID: 5089, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_unpack)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_setscene: Succeeded
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xf86bigfontproto-1.2.0.tar.bz2 to tmp/work/x86_64-linux/xf86bigfontproto-native-1_1.2.0-r2.0/
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_unpack: Succeeded
NOTE: Running task 333 of 5581 (ID: 5075, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_unpack)
NOTE: Running task 334 of 5581 (ID: 1409, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_qa_configure)
NOTE: Running task 335 of 5581 (ID: 5054, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_fetch)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xcmiscproto-1.2.1.tar.bz2 to tmp/work/x86_64-linux/xcmiscproto-native-1_1.2.1-r2.0/
NOTE: package pax-utils-native-0.1.19-r2: task do_qa_configure: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_qa_configure: Succeeded
NOTE: package libxcb-native-1.6-r4.1: task do_setscene: Succeeded
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_fetch: Started
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_fetch: Succeeded
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 336 of 5581 (ID: 4984, virtual:native:/home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_fetch)
NOTE: Running task 337 of 5581 (ID: 3421, /home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_setscene)
NOTE: Running task 338 of 5581 (ID: 1410, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_compile)
NOTE: package libxcb-native-1.6-r4.1: task do_fetch: Started
NOTE: package libxcb-native-1.6-r4.1: task do_fetch: Succeeded
NOTE: package libice-1_1.0.7-r9.0: task do_setscene: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_compile: Started
NOTE: Running task 339 of 5581 (ID: 5047, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_unpack)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/bigreqsproto-1.1.1.tar.bz2 to tmp/work/x86_64-linux/bigreqsproto-native-1_1.1.1-r2.0/
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 340 of 5581 (ID: 4977, virtual:native:/home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_unpack)
NOTE: package libice-1_1.0.7-r9.0: task do_setscene: Succeeded
NOTE: package libxcb-native-1.6-r4.1: task do_unpack: Started
NOTE: Unpacking ../sources/libxcb-1.6.tar.bz2 to tmp/work/x86_64-linux/libxcb-native-1.6-r4.1/
NOTE: package libxcb-native-1.6-r4.1: task do_unpack: Succeeded
NOTE: Running task 341 of 5581 (ID: 3420, /home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_fetch)
NOTE: Running task 342 of 5581 (ID: 2403, /home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_setscene)
NOTE: package libice-1_1.0.7-r9.0: task do_fetch: Started
NOTE: package libice-1_1.0.7-r9.0: task do_fetch: Succeeded
NOTE: package expat-2.0.1-r3.0: task do_setscene: Started
NOTE: Running task 343 of 5581 (ID: 3302, /home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_patch)
NOTE: package libx11-1_1.4.3-r9.0: task do_patch: Started
NOTE: Applying patch 'keysymdef_include.patch' (../openembedded/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch)
NOTE: Running task 344 of 5581 (ID: 3413, /home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_unpack)
NOTE: package expat-2.0.1-r3.0: task do_setscene: Succeeded
NOTE: Applying patch 'x11_disable_makekeys.patch' (../openembedded/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch)
NOTE: package libice-1_1.0.7-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libICE-1.0.7.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libice-1_1.0.7-r9.0/
NOTE: package libice-1_1.0.7-r9.0: task do_unpack: Succeeded
NOTE: package libx11-1_1.4.3-r9.0: task do_patch: Succeeded
NOTE: Running task 345 of 5581 (ID: 2402, /home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_fetch)
NOTE: Running task 346 of 5581 (ID: 5447, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_setscene)
NOTE: package libice-native-1_1.0.7-r9.0: task do_setscene: Started
NOTE: Running task 347 of 5581 (ID: 1703, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_setscene)
NOTE: package expat-2.0.1-r3.0: task do_fetch: Started
NOTE: package expat-2.0.1-r3.0: task do_fetch: Succeeded
NOTE: package expat-native-2.0.1-r3.0: task do_setscene: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_setscene: Succeeded
NOTE: Running task 348 of 5581 (ID: 2395, /home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_unpack)
NOTE: package expat-native-2.0.1-r3.0: task do_setscene: Succeeded
NOTE: package expat-2.0.1-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/expat-2.0.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/expat-2.0.1-r3.0/
NOTE: package expat-2.0.1-r3.0: task do_unpack: Succeeded
NOTE: Running task 349 of 5581 (ID: 5446, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_fetch)
NOTE: Running task 350 of 5581 (ID: 1702, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_fetch)
NOTE: Running task 351 of 5581 (ID: 1204, /home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_patch)
NOTE: package expat-native-2.0.1-r3.0: task do_fetch: Started
NOTE: package expat-native-2.0.1-r3.0: task do_fetch: Succeeded
NOTE: package libice-native-1_1.0.7-r9.0: task do_fetch: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_fetch: Succeeded
NOTE: package ncurses-5.9-r1: task do_patch: Started
NOTE: Applying patch 'tic-hang.patch' (../openembedded/recipes/ncurses/ncurses/tic-hang.patch)
NOTE: Running task 352 of 5581 (ID: 5439, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_unpack)
NOTE: package ncurses-5.9-r1: task do_patch: Succeeded
NOTE: Running task 353 of 5581 (ID: 1695, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_unpack)
NOTE: package libice-native-1_1.0.7-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libICE-1.0.7.tar.bz2 to tmp/work/x86_64-linux/libice-native-1_1.0.7-r9.0/
NOTE: package libice-native-1_1.0.7-r9.0: task do_unpack: Succeeded
NOTE: package expat-native-2.0.1-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/expat-2.0.1.tar.gz to tmp/work/x86_64-linux/expat-native-2.0.1-r3.0/
NOTE: package expat-native-2.0.1-r3.0: task do_unpack: Succeeded
NOTE: Running task 354 of 5581 (ID: 1766, /home/oe/openembedded/recipes/pam/libpam_1.1.1.bb, do_patch)
NOTE: package libpam-1.1.1-r2: task do_patch: Started
NOTE: Running task 355 of 5581 (ID: 957, /home/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.18.bb, do_setscene)
NOTE: Applying patch 'pam-nodocs.patch' (../openembedded/recipes/pam/libpam-1.1.1/pam-nodocs.patch)
NOTE: Running task 356 of 5581 (ID: 3078, /home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_patch)
NOTE: package gtk-doc-1.0-r3: task do_patch: Started
NOTE: package gtk-doc-1.0-r3: task do_patch: Succeeded
NOTE: Running task 357 of 5581 (ID: 1341, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_package)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package: Succeeded
NOTE: Running task 358 of 5581 (ID: 2505, /home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_setscene)
NOTE: package freetype-2.4.3-r1: task do_setscene: Started
NOTE: package freetype-2.4.3-r1: task do_setscene: Succeeded
NOTE: package util-linux-ng-2.18-r36.0: task do_setscene: Started
NOTE: package util-linux-ng-2.18-r36.0: task do_setscene: Succeeded
NOTE: Running task 359 of 5581 (ID: 2504, /home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_fetch)
NOTE: package pax-utils-native-0.1.19-r2: task do_compile: Succeeded
NOTE: package freetype-2.4.3-r1: task do_fetch: Started
NOTE: Running task 360 of 5581 (ID: 956, /home/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.18.bb, do_fetch)
NOTE: package util-linux-ng-2.18-r36.0: task do_fetch: Started
NOTE: Running task 361 of 5581 (ID: 1401, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_install)
NOTE: Applying patch 'define-HAVE_DBM.patch' (../openembedded/recipes/pam/libpam-1.1.1/define-HAVE_DBM.patch)
NOTE: package pax-utils-native-0.1.19-r2: task do_install: Started
NOTE: package libpam-1.1.1-r2: task do_patch: Succeeded
NOTE: package pax-utils-native-0.1.19-r2: task do_install: Succeeded
NOTE: Running task 362 of 5581 (ID: 1402, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_populate_sysroot)
NOTE: Running task 363 of 5581 (ID: 1745, /home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_setscene)
NOTE: package pax-utils-native-0.1.19-r2: task do_populate_sysroot: Started
NOTE: package freetype-2.4.3-r1: task do_fetch: Succeeded
NOTE: package util-linux-ng-2.18-r36.0: task do_fetch: Succeeded
NOTE: package glib-2.0-2.28.5-r1: task do_setscene: Started
NOTE: package glib-2.0-2.28.5-r1: task do_setscene: Succeeded
NOTE: Running task 364 of 5581 (ID: 2497, /home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_unpack)
NOTE: package freetype-2.4.3-r1: task do_unpack: Started
NOTE: Running task 365 of 5581 (ID: 949, /home/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.18.bb, do_unpack)
NOTE: Unpacking ../sources/freetype-2.4.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/freetype-2.4.3-r1/
NOTE: package util-linux-ng-2.18-r36.0: task do_unpack: Started
NOTE: Unpacking ../sources/util-linux-ng-2.18.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/util-linux-ng-2.18-r36.0/
NOTE: Running task 366 of 5581 (ID: 1744, /home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_fetch)
NOTE: package pax-utils-native-0.1.19-r2: task do_populate_sysroot: Succeeded
NOTE: package glib-2.0-2.28.5-r1: task do_fetch: Started
NOTE: Running task 367 of 5581 (ID: 3874, /home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_setscene)
NOTE: package glib-2.0-2.28.5-r1: task do_fetch: Succeeded
NOTE: package renderproto-1_0.11.1-r2.0: task do_setscene: Started
NOTE: Running task 368 of 5581 (ID: 1737, /home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_unpack)
NOTE: package freetype-2.4.3-r1: task do_unpack: Succeeded
NOTE: package renderproto-1_0.11.1-r2.0: task do_setscene: Succeeded
NOTE: package glib-2.0-2.28.5-r1: task do_unpack: Started
NOTE: Unpacking ../sources/glib-2.28.5.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.28.5-r1/
NOTE: Running task 369 of 5581 (ID: 4911, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_setscene)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_setscene: Started
NOTE: Running task 370 of 5581 (ID: 3873, /home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_fetch)
NOTE: package renderproto-1_0.11.1-r2.0: task do_fetch: Started
NOTE: package renderproto-1_0.11.1-r2.0: task do_fetch: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_setscene: Succeeded
NOTE: Running task 371 of 5581 (ID: 3866, /home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_unpack)
NOTE: package renderproto-1_0.11.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/renderproto-0.11.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/renderproto-1_0.11.1-r2.0/
NOTE: package renderproto-1_0.11.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 372 of 5581 (ID: 4910, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_fetch)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_fetch: Started
NOTE: package jaxp1.3-native-1.3.04-r1: task do_fetch: Succeeded
NOTE: Running task 373 of 5581 (ID: 5561, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_setscene)
NOTE: package util-linux-ng-2.18-r36.0: task do_unpack: Succeeded
NOTE: package jikes-native-1.22-r3: task do_setscene: Started
NOTE: Running task 374 of 5581 (ID: 4903, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_unpack)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_unpack: Started
NOTE: Unpacking ../sources/xml-commons-external-1.3.04-src.tar.gz to tmp/work/x86_64-linux/jaxp1.3-native-1.3.04-r1/jaxp1.3-1.3.04/
NOTE: package jaxp1.3-native-1.3.04-r1: task do_unpack: Succeeded
NOTE: Running task 375 of 5581 (ID: 5062, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_patch)
NOTE: package jikes-native-1.22-r3: task do_setscene: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_patch: Started
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_patch: Succeeded
NOTE: Running task 376 of 5581 (ID: 5020, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_patch)
NOTE: Running task 377 of 5581 (ID: 5104, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_patch)
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_patch: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_patch: Succeeded
NOTE: Running task 378 of 5581 (ID: 5560, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_fetch)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_patch: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_patch: Succeeded
NOTE: package jikes-native-1.22-r3: task do_fetch: Started
NOTE: package jikes-native-1.22-r3: task do_fetch: Succeeded
NOTE: Running task 379 of 5581 (ID: 5118, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_patch)
NOTE: Running task 380 of 5581 (ID: 5090, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_patch)
NOTE: Running task 381 of 5581 (ID: 5553, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_unpack)
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_patch: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_patch: Succeeded
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_patch: Started
NOTE: package jikes-native-1.22-r3: task do_unpack: Started
NOTE: Unpacking ../sources/jikes-1.22.tar.bz2 to tmp/work/x86_64-linux/jikes-native-1.22-r3/
NOTE: package jikes-native-1.22-r3: task do_unpack: Succeeded
NOTE: Running task 382 of 5581 (ID: 5076, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_patch)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_patch: Succeeded
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_patch: Started
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_patch: Succeeded
NOTE: Running task 383 of 5581 (ID: 5048, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_patch)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_patch: Started
NOTE: Running task 384 of 5581 (ID: 4978, virtual:native:/home/oe/openembedded/recipes/xcb/libxcb_1.6.bb, do_patch)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_patch: Succeeded
NOTE: package libxcb-native-1.6-r4.1: task do_patch: Started
NOTE: Applying patch 'configure_git.patch' (../openembedded/recipes/xcb/libxcb/configure_git.patch)
NOTE: Running task 385 of 5581 (ID: 4190, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_setscene)
NOTE: package libx11-native-1_1.4.3-r9.0: task do_setscene: Started
NOTE: package libxcb-native-1.6-r4.1: task do_patch: Succeeded
NOTE: Running task 386 of 5581 (ID: 1576, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_setscene)
NOTE: package update-rc.d-native-0.7-r2: task do_setscene: Started
NOTE: package libx11-native-1_1.4.3-r9.0: task do_setscene: Succeeded
NOTE: Running task 387 of 5581 (ID: 4009, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_setscene)
NOTE: Unpacking ../openembedded/recipes/glib-2.0/files/glibconfig-sysdefs.h to tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.28.5-r1/
NOTE: package glib-2.0-2.28.5-r1: task do_unpack: Succeeded
NOTE: package gnujaf-native-1.1.1-r2: task do_setscene: Started
NOTE: Running task 388 of 5581 (ID: 3414, /home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_patch)
NOTE: package libice-1_1.0.7-r9.0: task do_patch: Started
NOTE: package libice-1_1.0.7-r9.0: task do_patch: Succeeded
NOTE: Running task 389 of 5581 (ID: 4189, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_fetch)
NOTE: package update-rc.d-native-0.7-r2: task do_setscene: Succeeded
NOTE: package libx11-native-1_1.4.3-r9.0: task do_fetch: Started
NOTE: package libx11-native-1_1.4.3-r9.0: task do_fetch: Succeeded
NOTE: Running task 390 of 5581 (ID: 1575, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_fetch)
NOTE: Running task 391 of 5581 (ID: 1604, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_setscene)
NOTE: package update-rc.d-native-0.7-r2: task do_fetch: Started
NOTE: package update-rc.d-native-0.7-r2: task do_fetch: Succeeded
NOTE: Running task 392 of 5581 (ID: 4182, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_unpack)
NOTE: package gnujaf-native-1.1.1-r2: task do_setscene: Succeeded
NOTE: package libx11-native-1_1.4.3-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libX11-1.4.3.tar.bz2 to tmp/work/x86_64-linux/libx11-native-1_1.4.3-r9.0/
NOTE: Running task 393 of 5581 (ID: 4008, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_fetch)
NOTE: package zip-native-2.32-r2: task do_setscene: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_fetch: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_fetch: Succeeded
NOTE: Running task 394 of 5581 (ID: 1568, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_unpack)
NOTE: package update-rc.d-native-0.7-r2: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/update-rc.d/update-rc.d/update-rc.d to tmp/work/x86_64-linux/update-rc.d-native-0.7-r2/
NOTE: package zip-native-2.32-r2: task do_setscene: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_unpack: Succeeded
NOTE: Running task 395 of 5581 (ID: 4001, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_unpack)
NOTE: Running task 396 of 5581 (ID: 1603, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_fetch)
NOTE: package zip-native-2.32-r2: task do_fetch: Started
NOTE: package zip-native-2.32-r2: task do_fetch: Succeeded
NOTE: Running task 397 of 5581 (ID: 2396, /home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_patch)
NOTE: package gnujaf-native-1.1.1-r2: task do_unpack: Started
NOTE: Unpacking ../sources/activation-1.1.1.tar.gz to tmp/work/x86_64-linux/gnujaf-native-1.1.1-r2/
NOTE: package gnujaf-native-1.1.1-r2: task do_unpack: Succeeded
NOTE: package libx11-native-1_1.4.3-r9.0: task do_unpack: Succeeded
NOTE: package expat-2.0.1-r3.0: task do_patch: Started
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/expat/expat-2.0.1/autotools.patch)
NOTE: Running task 398 of 5581 (ID: 5440, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_patch)
NOTE: package expat-2.0.1-r3.0: task do_patch: Succeeded
NOTE: Running task 399 of 5581 (ID: 1696, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_patch)
NOTE: Running task 400 of 5581 (ID: 1596, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_unpack)
NOTE: package libice-native-1_1.0.7-r9.0: task do_patch: Started
NOTE: package expat-native-2.0.1-r3.0: task do_patch: Started
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/expat/expat-2.0.1/autotools.patch)
NOTE: package zip-native-2.32-r2: task do_unpack: Started
NOTE: Unpacking ../sources/zip232.tar.gz to tmp/work/x86_64-linux/zip-native-2.32-r2/
NOTE: package zip-native-2.32-r2: task do_unpack: Succeeded
NOTE: Running task 401 of 5581 (ID: 950, /home/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.18.bb, do_patch)
NOTE: package libice-native-1_1.0.7-r9.0: task do_patch: Succeeded
NOTE: package util-linux-ng-2.18-r36.0: task do_patch: Started
NOTE: Applying patch 'uclibc-compile.patch' (../openembedded/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch)
NOTE: package expat-native-2.0.1-r3.0: task do_patch: Succeeded
NOTE: Running task 402 of 5581 (ID: 3337, /home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_setscene)
NOTE: package libsm-1_1.2.0-r9.0: task do_setscene: Started
NOTE: Running task 403 of 5581 (ID: 4926, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_setscene)
NOTE: package inetlib-native-1.1.1-r2: task do_setscene: Started
NOTE: Applying patch 'util-linux-ng-replace-siginterrupt.patch' (../openembedded/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-siginterrupt.patch)
NOTE: Applying patch 'fdiskbsdlabel.h-nios2.patch' (../openembedded/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch)
NOTE: Running task 404 of 5581 (ID: 3295, /home/oe/openembedded/recipes/libusb/libusb1_1.0.8.bb, do_setscene)
NOTE: package libusb1-1.0.8-r0: task do_setscene: Started
NOTE: package libsm-1_1.2.0-r9.0: task do_setscene: Succeeded
NOTE: package inetlib-native-1.1.1-r2: task do_setscene: Succeeded
NOTE: Running task 405 of 5581 (ID: 3336, /home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_fetch)
NOTE: Applying patch 'uclibc-nolargefile.patch' (../openembedded/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch)
NOTE: package util-linux-ng-2.18-r36.0: task do_patch: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_setscene: Succeeded
NOTE: package libsm-1_1.2.0-r9.0: task do_fetch: Started
NOTE: package libsm-1_1.2.0-r9.0: task do_fetch: Succeeded
NOTE: Running task 406 of 5581 (ID: 4925, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_fetch)
NOTE: package inetlib-native-1.1.1-r2: task do_fetch: Started
NOTE: package inetlib-native-1.1.1-r2: task do_fetch: Succeeded
NOTE: Running task 407 of 5581 (ID: 2295, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_package)
NOTE: Running task 408 of 5581 (ID: 3294, /home/oe/openembedded/recipes/libusb/libusb1_1.0.8.bb, do_fetch)
NOTE: package unifdef-native-2.6-0: task do_package: Started
NOTE: Running task 409 of 5581 (ID: 3329, /home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_unpack)
NOTE: package libusb1-1.0.8-r0: task do_fetch: Started
NOTE: package unifdef-native-2.6-0: task do_package: Succeeded
NOTE: package libsm-1_1.2.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libSM-1.2.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libsm-1_1.2.0-r9.0/
NOTE: Running task 410 of 5581 (ID: 4918, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_unpack)
NOTE: package libusb1-1.0.8-r0: task do_fetch: Succeeded
NOTE: package inetlib-native-1.1.1-r2: task do_unpack: Started
NOTE: Unpacking ../sources/inetlib-1.1.1.tar.gz to tmp/work/x86_64-linux/inetlib-native-1.1.1-r2/
NOTE: package inetlib-native-1.1.1-r2: task do_unpack: Succeeded
NOTE: Running task 411 of 5581 (ID: 4246, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_setscene)
NOTE: package libsm-1_1.2.0-r9.0: task do_unpack: Succeeded
NOTE: Running task 412 of 5581 (ID: 3287, /home/oe/openembedded/recipes/libusb/libusb1_1.0.8.bb, do_unpack)
NOTE: package freetype-native-2.4.3-r1: task do_setscene: Started
NOTE: package libusb1-1.0.8-r0: task do_unpack: Started
NOTE: Running task 413 of 5581 (ID: 2498, /home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_patch)
NOTE: Unpacking ../sources/libusb-1.0.8.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libusb1-1.0.8-r0/
NOTE: package freetype-2.4.3-r1: task do_patch: Started
NOTE: Running task 414 of 5581 (ID: 1738, /home/oe/openembedded/recipes/glib-2.0/glib-2.0_2.28.5.bb, do_patch)
NOTE: package freetype-native-2.4.3-r1: task do_setscene: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_unpack: Succeeded
NOTE: Applying patch 'no-hardcode.patch' (../openembedded/recipes/freetype/freetype/no-hardcode.patch)
NOTE: Applying patch 'libtool-tag.patch' (../openembedded/recipes/freetype/freetype-2.4.3/libtool-tag.patch)
NOTE: package glib-2.0-2.28.5-r1: task do_patch: Started
NOTE: Applying patch 'configure-libtool.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/configure-libtool.patch)
NOTE: Applying patch 'g_once_init_enter.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/g_once_init_enter.patch)
NOTE: Running task 415 of 5581 (ID: 3867, /home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_patch)
NOTE: package freetype-2.4.3-r1: task do_patch: Succeeded
NOTE: Applying patch 'gatomic-proper-pointer-get-cast.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/gatomic-proper-pointer-get-cast.patch)
NOTE: package renderproto-1_0.11.1-r2.0: task do_patch: Started
NOTE: Applying patch '60_wait-longer-for-threads-to-die.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/60_wait-longer-for-threads-to-die.patch)
NOTE: Applying patch 'glib-mkenums-interpreter.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/glib-mkenums-interpreter.patch)
NOTE: Running task 416 of 5581 (ID: 4245, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_fetch)
NOTE: package renderproto-1_0.11.1-r2.0: task do_patch: Succeeded
NOTE: package freetype-native-2.4.3-r1: task do_fetch: Started
NOTE: package freetype-native-2.4.3-r1: task do_fetch: Succeeded
NOTE: Running task 417 of 5581 (ID: 2561, /home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_setscene)
NOTE: Running task 418 of 5581 (ID: 5554, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_patch)
NOTE: package jikes-native-1.22-r3: task do_patch: Started
NOTE: package jikes-native-1.22-r3: task do_patch: Succeeded
NOTE: package libxrender-1_0.9.6-r9.0: task do_setscene: Started
NOTE: Running task 419 of 5581 (ID: 4238, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_unpack)
NOTE: Applying patch 'libglib2-fix-compilation-with-no-builtin-atomic.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/libglib2-fix-compilation-with-no-builtin-atomic.patch)
NOTE: package freetype-native-2.4.3-r1: task do_unpack: Started
NOTE: Unpacking ../sources/freetype-2.4.3.tar.bz2 to tmp/work/x86_64-linux/freetype-native-2.4.3-r1/
NOTE: Applying patch 'configure-ipv6.patch' (../openembedded/recipes/glib-2.0/glib-2.0-2.28.5/configure-ipv6.patch)
NOTE: package glib-2.0-2.28.5-r1: task do_patch: Succeeded
NOTE: Running task 420 of 5581 (ID: 5139, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_setscene)
NOTE: package libxrender-1_0.9.6-r9.0: task do_setscene: Succeeded
NOTE: package libsm-native-1_1.2.0-r9.0: task do_setscene: Started
NOTE: Running task 421 of 5581 (ID: 4183, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libx11_1.4.3.bb, do_patch)
NOTE: package libx11-native-1_1.4.3-r9.0: task do_patch: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_setscene: Succeeded
NOTE: package freetype-native-2.4.3-r1: task do_unpack: Succeeded
NOTE: Running task 422 of 5581 (ID: 2560, /home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_fetch)
NOTE: Applying patch 'keysymdef_include.patch' (../openembedded/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch)
NOTE: Applying patch 'x11_disable_makekeys.patch' (../openembedded/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch)
NOTE: package libx11-native-1_1.4.3-r9.0: task do_patch: Succeeded
NOTE: package libxrender-1_0.9.6-r9.0: task do_fetch: Started
NOTE: package libxrender-1_0.9.6-r9.0: task do_fetch: Succeeded
NOTE: Running task 423 of 5581 (ID: 1569, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_patch)
NOTE: Running task 424 of 5581 (ID: 5138, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_fetch)
NOTE: Running task 425 of 5581 (ID: 2914, /home/oe/openembedded/recipes/fontconfig/fontconfig_2.8.0.bb, do_setscene)
NOTE: package update-rc.d-native-0.7-r2: task do_patch: Started
NOTE: package fontconfig-2.8.0-r0: task do_setscene: Started
NOTE: Running task 426 of 5581 (ID: 2553, /home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_unpack)
NOTE: Applying patch 'add-verbose.patch' (../openembedded/recipes/update-rc.d/update-rc.d/add-verbose.patch)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_fetch: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_fetch: Succeeded
NOTE: package libxrender-1_0.9.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXrender-0.9.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxrender-1_0.9.6-r9.0/
NOTE: package update-rc.d-native-0.7-r2: task do_patch: Succeeded
NOTE: package fontconfig-2.8.0-r0: task do_setscene: Succeeded
NOTE: package libxrender-1_0.9.6-r9.0: task do_unpack: Succeeded
NOTE: Running task 427 of 5581 (ID: 5131, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_unpack)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libSM-1.2.0.tar.bz2 to tmp/work/x86_64-linux/libsm-native-1_1.2.0-r9.0/
NOTE: package libsm-native-1_1.2.0-r9.0: task do_unpack: Succeeded
NOTE: Running task 428 of 5581 (ID: 1577, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_configure)
NOTE: package update-rc.d-native-0.7-r2: task do_configure: Started
NOTE: Running task 429 of 5581 (ID: 2913, /home/oe/openembedded/recipes/fontconfig/fontconfig_2.8.0.bb, do_fetch)
NOTE: package fontconfig-2.8.0-r0: task do_fetch: Started
NOTE: Running task 430 of 5581 (ID: 1181, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_setscene)
NOTE: package update-rc.d-native-0.7-r2: task do_configure: Succeeded
NOTE: package fontconfig-2.8.0-r0: task do_fetch: Succeeded
NOTE: package update-rc.d-0.7-r2: task do_setscene: Started
NOTE: Running task 431 of 5581 (ID: 3979, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_setscene)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_setscene: Started
NOTE: Running task 432 of 5581 (ID: 5195, /home/oe/openembedded/recipes/xorg-proto/fixesproto_5.0.bb, do_setscene)
NOTE: package fixesproto-1_5.0-r2.0: task do_setscene: Started
NOTE: Running task 433 of 5581 (ID: 2906, /home/oe/openembedded/recipes/fontconfig/fontconfig_2.8.0.bb, do_unpack)
NOTE: package fontconfig-2.8.0-r0: task do_unpack: Started
NOTE: package update-rc.d-0.7-r2: task do_setscene: Succeeded
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_setscene: Succeeded
NOTE: Unpacking ../sources/fontconfig-2.8.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/fontconfig-2.8.0-r0/
NOTE: package fontconfig-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 434 of 5581 (ID: 1180, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_fetch)
NOTE: Running task 435 of 5581 (ID: 3978, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_fetch)
NOTE: package update-rc.d-0.7-r2: task do_fetch: Started
NOTE: package update-rc.d-0.7-r2: task do_fetch: Succeeded
NOTE: Running task 436 of 5581 (ID: 1597, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_patch)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_fetch: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_fetch: Succeeded
NOTE: package fixesproto-1_5.0-r2.0: task do_setscene: Succeeded
NOTE: package zip-native-2.32-r2: task do_patch: Started
NOTE: package zip-native-2.32-r2: task do_patch: Succeeded
NOTE: Running task 437 of 5581 (ID: 5194, /home/oe/openembedded/recipes/xorg-proto/fixesproto_5.0.bb, do_fetch)
NOTE: Running task 438 of 5581 (ID: 1173, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_unpack)
NOTE: package update-rc.d-0.7-r2: task do_unpack: Started
NOTE: Running task 439 of 5581 (ID: 3971, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_unpack)
NOTE: Running task 440 of 5581 (ID: 1605, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_configure)
NOTE: package fixesproto-1_5.0-r2.0: task do_fetch: Started
NOTE: package fixesproto-1_5.0-r2.0: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/update-rc.d/update-rc.d/update-rc.d to tmp/work/all-angstrom-linux-gnueabi/update-rc.d-0.7-r2/
NOTE: package update-rc.d-0.7-r2: task do_unpack: Succeeded
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/xml-commons-resolver-1.2.tar.gz to tmp/work/x86_64-linux/xml-commons-resolver1.1-native-1.2-r0/
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_unpack: Succeeded
NOTE: package zip-native-2.32-r2: task do_configure: Started
NOTE: package zip-native-2.32-r2: task do_configure: Succeeded
NOTE: Running task 441 of 5581 (ID: 5187, /home/oe/openembedded/recipes/xorg-proto/fixesproto_5.0.bb, do_unpack)
NOTE: Running task 442 of 5581 (ID: 1997, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_setscene)
NOTE: package unzip-native-552-r3: task do_setscene: Started
NOTE: Running task 443 of 5581 (ID: 5575, /home/oe/openembedded/recipes/classpath/classpath-initial_0.93.bb, do_setscene)
NOTE: package fixesproto-1_5.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/fixesproto-5.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/fixesproto-1_5.0-r2.0/
NOTE: package classpath-initial-0.93-r6: task do_setscene: Started
NOTE: Running task 444 of 5581 (ID: 4902, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_removebinaries)
NOTE: package fixesproto-1_5.0-r2.0: task do_unpack: Succeeded
NOTE: package unzip-native-552-r3: task do_setscene: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_removebinaries: Started
NOTE: package jaxp1.3-native-1.3.04-r1: task do_removebinaries: Succeeded
NOTE: package classpath-initial-0.93-r6: task do_setscene: Succeeded
NOTE: Running task 445 of 5581 (ID: 2431, /home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_setscene)
NOTE: Running task 446 of 5581 (ID: 1996, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_fetch)
NOTE: package libpng-1.2.44-r3.0: task do_setscene: Started
NOTE: package unzip-native-552-r3: task do_fetch: Started
NOTE: Running task 447 of 5581 (ID: 4904, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_patch)
NOTE: package unzip-native-552-r3: task do_fetch: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_patch: Started
NOTE: package jaxp1.3-native-1.3.04-r1: task do_patch: Succeeded
NOTE: Running task 448 of 5581 (ID: 5574, /home/oe/openembedded/recipes/classpath/classpath-initial_0.93.bb, do_fetch)
NOTE: package classpath-initial-0.93-r6: task do_fetch: Started
NOTE: Running task 449 of 5581 (ID: 1989, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_unpack)
NOTE: package unzip-native-552-r3: task do_unpack: Started
NOTE: Unpacking ../sources/unzip552.tar.gz to tmp/work/x86_64-linux/unzip-native-552-r3/
NOTE: Running task 450 of 5581 (ID: 4485, /home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_setscene)
NOTE: package libpng-1.2.44-r3.0: task do_setscene: Succeeded
NOTE: package classpath-initial-0.93-r6: task do_fetch: Succeeded
NOTE: package unzip-native-552-r3: task do_unpack: Succeeded
NOTE: package libgpg-error-1.4-r7.1: task do_setscene: Started
NOTE: Running task 451 of 5581 (ID: 5567, /home/oe/openembedded/recipes/classpath/classpath-initial_0.93.bb, do_unpack)
NOTE: package classpath-initial-0.93-r6: task do_unpack: Started
NOTE: Running task 452 of 5581 (ID: 2430, /home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_fetch)
NOTE: Unpacking ../sources/classpath-0.93.tar.gz to tmp/work/x86_64-linux/classpath-initial-0.93-r6/
NOTE: package libpng-1.2.44-r3.0: task do_fetch: Started
NOTE: package libpng-1.2.44-r3.0: task do_fetch: Succeeded
NOTE: Running task 453 of 5581 (ID: 4541, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_setscene)
NOTE: package libpng-native-1.2.44-r3.0: task do_setscene: Started
NOTE: package libgpg-error-1.4-r7.1: task do_setscene: Succeeded
NOTE: Running task 454 of 5581 (ID: 2423, /home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_unpack)
NOTE: package libpng-1.2.44-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/libpng-1.2.44.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libpng-1.2.44-r3.0/
NOTE: package libpng-native-1.2.44-r3.0: task do_setscene: Succeeded
NOTE: package libpng-1.2.44-r3.0: task do_unpack: Succeeded
NOTE: Running task 455 of 5581 (ID: 4484, /home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_fetch)
NOTE: package classpath-initial-0.93-r6: task do_unpack: Succeeded
NOTE: package libgpg-error-1.4-r7.1: task do_fetch: Started
NOTE: package libgpg-error-1.4-r7.1: task do_fetch: Succeeded
NOTE: Running task 456 of 5581 (ID: 4540, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_fetch)
NOTE: Running task 457 of 5581 (ID: 3330, /home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_patch)
NOTE: package libpng-native-1.2.44-r3.0: task do_fetch: Started
NOTE: Running task 458 of 5581 (ID: 4000, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_removebinaries)
NOTE: package libsm-1_1.2.0-r9.0: task do_patch: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_fetch: Succeeded
NOTE: package gnujaf-native-1.1.1-r2: task do_removebinaries: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_removebinaries: Succeeded
NOTE: package libsm-1_1.2.0-r9.0: task do_patch: Succeeded
NOTE: Running task 459 of 5581 (ID: 4477, /home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_unpack)
NOTE: package libgpg-error-1.4-r7.1: task do_unpack: Started
NOTE: Unpacking ../sources/libgpg-error-1.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libgpg-error-1.4-r7.1/
NOTE: package libgpg-error-1.4-r7.1: task do_unpack: Succeeded
NOTE: Running task 460 of 5581 (ID: 4533, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_unpack)
NOTE: Running task 461 of 5581 (ID: 3994, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_setscene)
NOTE: Running task 462 of 5581 (ID: 4002, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_patch)
NOTE: package libpng-native-1.2.44-r3.0: task do_unpack: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_patch: Started
NOTE: Running task 463 of 5581 (ID: 3288, /home/oe/openembedded/recipes/libusb/libusb1_1.0.8.bb, do_patch)
NOTE: package libusb1-1.0.8-r0: task do_patch: Started
NOTE: Unpacking ../sources/libpng-1.2.44.tar.bz2 to tmp/work/x86_64-linux/libpng-native-1.2.44-r3.0/
NOTE: package gnumail-native-1.1.2-r2: task do_setscene: Started
NOTE: package libusb1-1.0.8-r0: task do_patch: Succeeded
NOTE: Applying patch 'datadir_java.patch' (../openembedded/recipes/classpathx/gnujaf-1.1.1/datadir_java.patch)
NOTE: Running task 464 of 5581 (ID: 1787, /home/oe/openembedded/recipes/libusb/libusb-compat_0.1.3.bb, do_setscene)
NOTE: package gnujaf-native-1.1.1-r2: task do_patch: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_setscene: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_unpack: Succeeded
NOTE: Running task 465 of 5581 (ID: 4239, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_patch)
NOTE: package gnumail-native-1.1.2-r2: task do_setscene: Succeeded
NOTE: package freetype-native-2.4.3-r1: task do_patch: Started
NOTE: Applying patch 'no-hardcode.patch' (../openembedded/recipes/freetype/freetype/no-hardcode.patch)
NOTE: Running task 466 of 5581 (ID: 3323, /home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_setscene)
NOTE: package libusb-compat-1_0.1.3-r0: task do_setscene: Succeeded
NOTE: Applying patch 'libtool-tag.patch' (../openembedded/recipes/freetype/freetype-2.4.3/libtool-tag.patch)
NOTE: package pixman-0.22.0-r5.1: task do_setscene: Started
NOTE: Running task 467 of 5581 (ID: 3993, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_fetch)
NOTE: package freetype-native-2.4.3-r1: task do_patch: Succeeded
NOTE: package pixman-0.22.0-r5.1: task do_setscene: Succeeded
NOTE: package gnumail-native-1.1.2-r2: task do_fetch: Started
NOTE: package gnumail-native-1.1.2-r2: task do_fetch: Succeeded
NOTE: Running task 468 of 5581 (ID: 1786, /home/oe/openembedded/recipes/libusb/libusb-compat_0.1.3.bb, do_fetch)
NOTE: package libusb-compat-1_0.1.3-r0: task do_fetch: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 469 of 5581 (ID: 5223, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_setscene)
NOTE: Running task 470 of 5581 (ID: 3322, /home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_fetch)
NOTE: package fontconfig-native-2.6.0-r4: task do_setscene: Started
NOTE: Running task 471 of 5581 (ID: 3986, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_unpack)
NOTE: Running task 472 of 5581 (ID: 1779, /home/oe/openembedded/recipes/libusb/libusb-compat_0.1.3.bb, do_unpack)
NOTE: package libusb-compat-1_0.1.3-r0: task do_unpack: Started
NOTE: package pixman-0.22.0-r5.1: task do_fetch: Started
NOTE: package pixman-0.22.0-r5.1: task do_fetch: Succeeded
NOTE: package gnumail-native-1.1.2-r2: task do_unpack: Started
NOTE: Unpacking ../sources/mail-1.1.2.tar.gz to tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/
NOTE: package gnumail-native-1.1.2-r2: task do_unpack: Succeeded
NOTE: Unpacking ../sources/libusb-compat-0.1.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libusb-compat-1_0.1.3-r0/
NOTE: package libusb-compat-1_0.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 473 of 5581 (ID: 3315, /home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_unpack)
NOTE: package pixman-0.22.0-r5.1: task do_unpack: Started
NOTE: Running task 474 of 5581 (ID: 5209, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_setscene)
NOTE: Running task 475 of 5581 (ID: 2554, /home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_patch)
NOTE: Unpacking ../sources/pixman-0.22.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/pixman-0.22.0-r5.1/
NOTE: package pixman-0.22.0-r5.1: task do_unpack: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_setscene: Started
NOTE: package libxrender-1_0.9.6-r9.0: task do_patch: Started
NOTE: package libxrender-1_0.9.6-r9.0: task do_patch: Succeeded
NOTE: Running task 476 of 5581 (ID: 1759, /home/oe/openembedded/recipes/udev/attr_2.4.44.bb, do_setscene)
NOTE: package fontconfig-native-2.6.0-r4: task do_setscene: Succeeded
NOTE: Running task 477 of 5581 (ID: 3057, /home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_setscene)
NOTE: package attr-2.4.44-r4: task do_setscene: Started
NOTE: Running task 478 of 5581 (ID: 5222, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_fetch)
NOTE: package libxext-1_1.3.0-r9.0: task do_setscene: Started
NOTE: package fontconfig-native-2.6.0-r4: task do_fetch: Started
NOTE: package fontconfig-native-2.6.0-r4: task do_fetch: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_setscene: Succeeded
NOTE: Running task 479 of 5581 (ID: 5208, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_fetch)
NOTE: package libxext-1_1.3.0-r9.0: task do_setscene: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_fetch: Started
NOTE: package pixman-native-0.22.0-r5.1: task do_fetch: Succeeded
NOTE: Running task 480 of 5581 (ID: 5215, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_unpack)
NOTE: package attr-2.4.44-r4: task do_setscene: Succeeded
NOTE: package fontconfig-native-2.6.0-r4: task do_unpack: Started
NOTE: Unpacking ../sources/fontconfig-2.6.0.tar.gz to tmp/work/x86_64-linux/fontconfig-native-2.6.0-r4/
NOTE: Running task 481 of 5581 (ID: 1758, /home/oe/openembedded/recipes/udev/attr_2.4.44.bb, do_fetch)
NOTE: package attr-2.4.44-r4: task do_fetch: Started
NOTE: Running task 482 of 5581 (ID: 3056, /home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_fetch)
NOTE: Running task 483 of 5581 (ID: 5201, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_unpack)
NOTE: package fontconfig-native-2.6.0-r4: task do_unpack: Succeeded
NOTE: package attr-2.4.44-r4: task do_fetch: Succeeded
NOTE: package libxext-1_1.3.0-r9.0: task do_fetch: Started
NOTE: package libxext-1_1.3.0-r9.0: task do_fetch: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_unpack: Started
NOTE: Unpacking ../sources/pixman-0.22.0.tar.gz to tmp/work/x86_64-linux/pixman-native-0.22.0-r5.1/
NOTE: package pixman-native-0.22.0-r5.1: task do_unpack: Succeeded
NOTE: Running task 484 of 5581 (ID: 5132, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_patch)
NOTE: Running task 485 of 5581 (ID: 1751, /home/oe/openembedded/recipes/udev/attr_2.4.44.bb, do_unpack)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_patch: Started
NOTE: package attr-2.4.44-r4: task do_unpack: Started
NOTE: Running task 486 of 5581 (ID: 3049, /home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_unpack)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_patch: Succeeded
NOTE: Unpacking ../sources/attr-2.4.44.src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r4/
NOTE: package attr-2.4.44-r4: task do_unpack: Succeeded
NOTE: package libxext-1_1.3.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXext-1.3.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxext-1_1.3.0-r9.0/
NOTE: Running task 487 of 5581 (ID: 4836, virtual:native:/home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_setscene)
NOTE: package dbus-native-1.4.1-r21.0: task do_setscene: Started
NOTE: Running task 488 of 5581 (ID: 1578, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_qa_configure)
NOTE: package libxext-1_1.3.0-r9.0: task do_unpack: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_qa_configure: Started
NOTE: package update-rc.d-native-0.7-r2: task do_qa_configure: Succeeded
NOTE: Running task 489 of 5581 (ID: 2907, /home/oe/openembedded/recipes/fontconfig/fontconfig_2.8.0.bb, do_patch)
NOTE: package fontconfig-2.8.0-r0: task do_patch: Started
NOTE: package dbus-native-1.4.1-r21.0: task do_setscene: Succeeded
NOTE: package fontconfig-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 490 of 5581 (ID: 1174, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_patch)
NOTE: Running task 491 of 5581 (ID: 4835, virtual:native:/home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_fetch)
NOTE: package update-rc.d-0.7-r2: task do_patch: Started
NOTE: Running task 492 of 5581 (ID: 1579, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_compile)
NOTE: Running task 493 of 5581 (ID: 5188, /home/oe/openembedded/recipes/xorg-proto/fixesproto_5.0.bb, do_patch)
NOTE: Applying patch 'add-verbose.patch' (../openembedded/recipes/update-rc.d/update-rc.d/add-verbose.patch)
NOTE: package update-rc.d-0.7-r2: task do_patch: Succeeded
NOTE: package dbus-native-1.4.1-r21.0: task do_fetch: Started
NOTE: package dbus-native-1.4.1-r21.0: task do_fetch: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_compile: Started
NOTE: package update-rc.d-native-0.7-r2: task do_compile: Succeeded
NOTE: package fixesproto-1_5.0-r2.0: task do_patch: Started
NOTE: package fixesproto-1_5.0-r2.0: task do_patch: Succeeded
NOTE: Running task 494 of 5581 (ID: 1182, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_configure)
NOTE: Running task 495 of 5581 (ID: 4828, virtual:native:/home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_unpack)
NOTE: package update-rc.d-0.7-r2: task do_configure: Started
NOTE: package dbus-native-1.4.1-r21.0: task do_unpack: Started
NOTE: Running task 496 of 5581 (ID: 1570, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_install)
NOTE: Running task 497 of 5581 (ID: 3963, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_setscene)
NOTE: package update-rc.d-0.7-r2: task do_configure: Succeeded
NOTE: Unpacking ../sources/dbus-1.4.1.tar.gz to tmp/work/x86_64-linux/dbus-native-1.4.1-r21.0/
NOTE: Unpacking ../openembedded/recipes/dbus/dbus/dbus-1.init to tmp/work/x86_64-linux/dbus-native-1.4.1-r21.0/
NOTE: package update-rc.d-native-0.7-r2: task do_install: Started
NOTE: package xerces-j-native-2.9.1-r1: task do_setscene: Started
NOTE: package dbus-native-1.4.1-r21.0: task do_unpack: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_install: Succeeded
NOTE: Running task 498 of 5581 (ID: 4471, /home/oe/openembedded/recipes/xorg-lib/libxfixes_5.0.bb, do_setscene)
NOTE: package xerces-j-native-2.9.1-r1: task do_setscene: Succeeded
NOTE: package libxfixes-1_5.0-r9.0: task do_setscene: Started
NOTE: Running task 499 of 5581 (ID: 4917, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_removebinaries)
NOTE: package inetlib-native-1.1.1-r2: task do_removebinaries: Started
NOTE: Running task 500 of 5581 (ID: 1571, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_populate_sysroot)
NOTE: package inetlib-native-1.1.1-r2: task do_removebinaries: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_populate_sysroot: Started
NOTE: Running task 501 of 5581 (ID: 3962, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_fetch)
NOTE: package xerces-j-native-2.9.1-r1: task do_fetch: Started
NOTE: package xerces-j-native-2.9.1-r1: task do_fetch: Succeeded
NOTE: Running task 502 of 5581 (ID: 4919, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_patch)
NOTE: package update-rc.d-native-0.7-r2: task do_populate_sysroot: Succeeded
NOTE: package inetlib-native-1.1.1-r2: task do_patch: Started
NOTE: Applying patch 'datadir_java.patch' (../openembedded/recipes/classpathx/inetlib-1.1.1/datadir_java.patch)
NOTE: Running task 503 of 5581 (ID: 3955, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_unpack)
NOTE: package libxfixes-1_5.0-r9.0: task do_setscene: Succeeded
NOTE: package xerces-j-native-2.9.1-r1: task do_unpack: Started
NOTE: Unpacking ../sources/Xerces-J-src.2.9.1.tar.gz to tmp/work/x86_64-linux/xerces-j-native-2.9.1-r1/
NOTE: package xerces-j-native-2.9.1-r1: task do_unpack: Succeeded
NOTE: Running task 504 of 5581 (ID: 4470, /home/oe/openembedded/recipes/xorg-lib/libxfixes_5.0.bb, do_fetch)
NOTE: Running task 505 of 5581 (ID: 2025, /home/oe/openembedded/recipes/lzo/lzo_1.08.bb, do_setscene)
NOTE: package inetlib-native-1.1.1-r2: task do_patch: Succeeded
NOTE: package libxfixes-1_5.0-r9.0: task do_fetch: Started
NOTE: package libxfixes-1_5.0-r9.0: task do_fetch: Succeeded
NOTE: package lzo-1.08-r15: task do_setscene: Started
NOTE: Running task 506 of 5581 (ID: 1606, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_qa_configure)
NOTE: Running task 507 of 5581 (ID: 1990, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_patch)
NOTE: package lzo-1.08-r15: task do_setscene: Succeeded
NOTE: package zip-native-2.32-r2: task do_qa_configure: Started
NOTE: package zip-native-2.32-r2: task do_qa_configure: Succeeded
NOTE: package unzip-native-552-r3: task do_patch: Started
NOTE: package unzip-native-552-r3: task do_patch: Succeeded
NOTE: Running task 508 of 5581 (ID: 4463, /home/oe/openembedded/recipes/xorg-lib/libxfixes_5.0.bb, do_unpack)
NOTE: package libxfixes-1_5.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXfixes-5.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxfixes-1_5.0-r9.0/
NOTE: package libxfixes-1_5.0-r9.0: task do_unpack: Succeeded
NOTE: Running task 509 of 5581 (ID: 2024, /home/oe/openembedded/recipes/lzo/lzo_1.08.bb, do_fetch)
NOTE: Running task 510 of 5581 (ID: 1607, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_compile)
NOTE: package lzo-1.08-r15: task do_fetch: Started
NOTE: package zip-native-2.32-r2: task do_compile: Started
NOTE: Running task 511 of 5581 (ID: 1998, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_configure)
NOTE: package lzo-1.08-r15: task do_fetch: Succeeded
NOTE: package unzip-native-552-r3: task do_configure: Started
NOTE: package unzip-native-552-r3: task do_configure: Succeeded
NOTE: Running task 512 of 5581 (ID: 5568, /home/oe/openembedded/recipes/classpath/classpath-initial_0.93.bb, do_patch)
NOTE: package classpath-initial-0.93-r6: task do_patch: Started
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/classpath/files/autotools.patch)
NOTE: Running task 513 of 5581 (ID: 2017, /home/oe/openembedded/recipes/lzo/lzo_1.08.bb, do_unpack)
NOTE: Running task 514 of 5581 (ID: 2424, /home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_patch)
NOTE: Applying patch 'miscompilation-0.93.patch' (../openembedded/recipes/classpath/files/miscompilation-0.93.patch)
NOTE: package lzo-1.08-r15: task do_unpack: Started
NOTE: Unpacking ../sources/lzo-1.08.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/lzo-1.08-r15/
NOTE: package lzo-1.08-r15: task do_unpack: Succeeded
NOTE: package libpng-1.2.44-r3.0: task do_patch: Started
NOTE: Applying patch 'makefile_fix.patch' (../openembedded/recipes/libpng/files/makefile_fix.patch)
NOTE: package libpng-1.2.44-r3.0: task do_patch: Succeeded
NOTE: package classpath-initial-0.93-r6: task do_patch: Succeeded
NOTE: Running task 515 of 5581 (ID: 4478, /home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_patch)
NOTE: package libgpg-error-1.4-r7.1: task do_patch: Started
NOTE: Applying patch 'pkgconfig.patch' (../openembedded/recipes/libgpg-error/libgpg-error-1.4/pkgconfig.patch)
NOTE: Running task 516 of 5581 (ID: 3099, /home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_setscene)
NOTE: package libgcrypt-1.4.1-r0: task do_setscene: Started
NOTE: Running task 517 of 5581 (ID: 2319, /home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_setscene)
NOTE: package libgpg-error-1.4-r7.1: task do_patch: Succeeded
NOTE: package dbus-1.4.1-r21.0: task do_setscene: Started
NOTE: Running task 518 of 5581 (ID: 4039, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_setscene)
NOTE: package libgcrypt-1.4.1-r0: task do_setscene: Succeeded
NOTE: package regexp-native-1.5-r1: task do_setscene: Started
NOTE: package dbus-1.4.1-r21.0: task do_setscene: Succeeded
NOTE: Running task 519 of 5581 (ID: 3098, /home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_fetch)
NOTE: Running task 520 of 5581 (ID: 2318, /home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_fetch)
NOTE: package libgcrypt-1.4.1-r0: task do_fetch: Started
NOTE: package libgcrypt-1.4.1-r0: task do_fetch: Succeeded
NOTE: package regexp-native-1.5-r1: task do_setscene: Succeeded
NOTE: package dbus-1.4.1-r21.0: task do_fetch: Started
NOTE: package dbus-1.4.1-r21.0: task do_fetch: Succeeded
NOTE: Running task 521 of 5581 (ID: 4038, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_fetch)
NOTE: package regexp-native-1.5-r1: task do_fetch: Started
NOTE: Running task 522 of 5581 (ID: 3091, /home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_unpack)
NOTE: package regexp-native-1.5-r1: task do_fetch: Succeeded
NOTE: package libgcrypt-1.4.1-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libgcrypt-1.4.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libgcrypt-1.4.1-r0/
NOTE: package libgcrypt-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 523 of 5581 (ID: 2311, /home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_unpack)
NOTE: package dbus-1.4.1-r21.0: task do_unpack: Started
NOTE: Unpacking ../sources/dbus-1.4.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/dbus-1.4.1-r21.0/
NOTE: Running task 524 of 5581 (ID: 4031, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_unpack)
NOTE: package regexp-native-1.5-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jakarta-regexp-1.5.tar.gz to tmp/work/x86_64-linux/regexp-native-1.5-r1/
NOTE: package regexp-native-1.5-r1: task do_unpack: Succeeded
NOTE: Running task 525 of 5581 (ID: 4534, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_patch)
NOTE: Unpacking ../openembedded/recipes/dbus/dbus/dbus-1.init to tmp/work/armv5te-angstrom-linux-gnueabi/dbus-1.4.1-r21.0/
NOTE: package dbus-1.4.1-r21.0: task do_unpack: Succeeded
NOTE: package libpng-native-1.2.44-r3.0: task do_patch: Started
NOTE: Applying patch 'makefile_fix.patch' (../openembedded/recipes/libpng/files/makefile_fix.patch)
NOTE: Running task 526 of 5581 (ID: 3407, /home/oe/openembedded/recipes/guile/guile-native_1.8.7.bb, do_setscene)
NOTE: Running task 527 of 5581 (ID: 1780, /home/oe/openembedded/recipes/libusb/libusb-compat_0.1.3.bb, do_patch)
NOTE: package libusb-compat-1_0.1.3-r0: task do_patch: Started
NOTE: package guile-native-1.8.7-r1: task do_setscene: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_patch: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_patch: Succeeded
NOTE: Running task 528 of 5581 (ID: 4942, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_setscene)
NOTE: Running task 529 of 5581 (ID: 3316, /home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_patch)
NOTE: package servlet2.3-native-4.1.37-r1: task do_setscene: Started
NOTE: package pixman-0.22.0-r5.1: task do_patch: Started
NOTE: Applying patch '0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch)
NOTE: Applying patch '0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch)
NOTE: package guile-native-1.8.7-r1: task do_setscene: Succeeded
NOTE: package servlet2.3-native-4.1.37-r1: task do_setscene: Succeeded
NOTE: Applying patch '0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch)
NOTE: Running task 530 of 5581 (ID: 3406, /home/oe/openembedded/recipes/guile/guile-native_1.8.7.bb, do_fetch)
NOTE: package guile-native-1.8.7-r1: task do_fetch: Started
NOTE: Applying patch '0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch)
NOTE: package guile-native-1.8.7-r1: task do_fetch: Succeeded
NOTE: Running task 531 of 5581 (ID: 4941, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_fetch)
NOTE: package servlet2.3-native-4.1.37-r1: task do_fetch: Started
NOTE: package servlet2.3-native-4.1.37-r1: task do_fetch: Succeeded
NOTE: Running task 532 of 5581 (ID: 3399, /home/oe/openembedded/recipes/guile/guile-native_1.8.7.bb, do_unpack)
NOTE: package pixman-0.22.0-r5.1: task do_patch: Succeeded
NOTE: package guile-native-1.8.7-r1: task do_unpack: Started
NOTE: Unpacking ../sources/guile-1.8.7.tar.gz to tmp/work/x86_64-linux/guile-native-1.8.7-r1/
NOTE: Running task 533 of 5581 (ID: 4934, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_unpack)
NOTE: package servlet2.3-native-4.1.37-r1: task do_unpack: Started
NOTE: Unpacking ../sources/apache-tomcat-4.1.37-src.tar.gz to tmp/work/x86_64-linux/servlet2.3-native-4.1.37-r1/
NOTE: package guile-native-1.8.7-r1: task do_unpack: Succeeded
NOTE: Running task 534 of 5581 (ID: 5216, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_patch)
NOTE: package fontconfig-native-2.6.0-r4: task do_patch: Started
NOTE: Running task 535 of 5581 (ID: 5202, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_patch)
NOTE: Applying patch 'fix-pkgconfig.patch' (../openembedded/recipes/fontconfig/fontconfig-2.6.0/fix-pkgconfig.patch)
NOTE: package fontconfig-native-2.6.0-r4: task do_patch: Succeeded
NOTE: package servlet2.3-native-4.1.37-r1: task do_unpack: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_patch: Started
NOTE: Applying patch '0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch)
NOTE: Applying patch '0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch)
NOTE: Running task 536 of 5581 (ID: 4583, /home/oe/openembedded/recipes/cairo/cairo-native_1.8.0.bb, do_setscene)
NOTE: Applying patch '0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch)
NOTE: package cairo-native-1.8.0-r1: task do_setscene: Started
NOTE: Running task 537 of 5581 (ID: 1885, /home/oe/openembedded/recipes/cairo/cairo_1.10.0.bb, do_setscene)
NOTE: package cairo-1.10.0-r2: task do_setscene: Started
NOTE: Applying patch '0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch' (../openembedded/recipes/xorg-lib/pixman-0.22.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch)
NOTE: package pixman-native-0.22.0-r5.1: task do_patch: Succeeded
NOTE: Running task 538 of 5581 (ID: 5533, /home/oe/openembedded/recipes/jikes/jikes-initial.bb, do_setscene)
NOTE: package jikes-initial-1.0-r0: task do_setscene: Started
NOTE: package cairo-native-1.8.0-r1: task do_setscene: Succeeded
NOTE: package cairo-1.10.0-r2: task do_setscene: Succeeded
NOTE: Running task 539 of 5581 (ID: 4582, /home/oe/openembedded/recipes/cairo/cairo-native_1.8.0.bb, do_fetch)
NOTE: package jikes-initial-1.0-r0: task do_setscene: Succeeded
NOTE: package cairo-native-1.8.0-r1: task do_fetch: Started
NOTE: package cairo-native-1.8.0-r1: task do_fetch: Succeeded
NOTE: Running task 540 of 5581 (ID: 1884, /home/oe/openembedded/recipes/cairo/cairo_1.10.0.bb, do_fetch)
NOTE: package cairo-1.10.0-r2: task do_fetch: Started
NOTE: package zip-native-2.32-r2: task do_compile: Succeeded
NOTE: Running task 541 of 5581 (ID: 1598, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_install)
NOTE: Running task 542 of 5581 (ID: 5532, /home/oe/openembedded/recipes/jikes/jikes-initial.bb, do_fetch)
NOTE: package zip-native-2.32-r2: task do_install: Started
NOTE: package jikes-initial-1.0-r0: task do_fetch: Started
NOTE: package jikes-initial-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 543 of 5581 (ID: 4575, /home/oe/openembedded/recipes/cairo/cairo-native_1.8.0.bb, do_unpack)
NOTE: package cairo-native-1.8.0-r1: task do_unpack: Started
NOTE: Unpacking ../sources/cairo-1.8.0.tar.gz to tmp/work/x86_64-linux/cairo-native-1.8.0-r1/
NOTE: Running task 544 of 5581 (ID: 5525, /home/oe/openembedded/recipes/jikes/jikes-initial.bb, do_unpack)
NOTE: package jikes-initial-1.0-r0: task do_unpack: Started
NOTE: package cairo-1.10.0-r2: task do_fetch: Succeeded
NOTE: package zip-native-2.32-r2: task do_install: Succeeded
NOTE: package cairo-native-1.8.0-r1: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/jikes/jikes-initial.bb to tmp/work/x86_64-linux/jikes-initial-1.0-r0/
NOTE: package jikes-initial-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 545 of 5581 (ID: 1877, /home/oe/openembedded/recipes/cairo/cairo_1.10.0.bb, do_unpack)
NOTE: package cairo-1.10.0-r2: task do_unpack: Started
NOTE: Running task 546 of 5581 (ID: 1599, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_populate_sysroot)
NOTE: Unpacking ../sources/cairo-1.10.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/cairo-1.10.0-r2/
NOTE: package zip-native-2.32-r2: task do_populate_sysroot: Started
NOTE: Running task 547 of 5581 (ID: 1752, /home/oe/openembedded/recipes/udev/attr_2.4.44.bb, do_patch)
NOTE: package attr-2.4.44-r4: task do_patch: Started
NOTE: package attr-2.4.44-r4: task do_patch: Succeeded
NOTE: Running task 548 of 5581 (ID: 985, /home/oe/openembedded/recipes/usbutils/usbutils_0.86.bb, do_setscene)
NOTE: package usbutils-0.86-r1: task do_setscene: Started
NOTE: Running task 549 of 5581 (ID: 2277, /home/oe/openembedded/recipes/udev/acl_2.2.49.bb, do_setscene)
NOTE: package acl-2.2.49-r5: task do_setscene: Started
NOTE: package cairo-1.10.0-r2: task do_unpack: Succeeded
NOTE: package usbutils-0.86-r1: task do_setscene: Succeeded
NOTE: Running task 550 of 5581 (ID: 3050, /home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_patch)
NOTE: package acl-2.2.49-r5: task do_setscene: Succeeded
NOTE: package zip-native-2.32-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 551 of 5581 (ID: 984, /home/oe/openembedded/recipes/usbutils/usbutils_0.86.bb, do_fetch)
NOTE: package usbutils-0.86-r1: task do_fetch: Started
NOTE: package libxext-1_1.3.0-r9.0: task do_patch: Started
NOTE: package libxext-1_1.3.0-r9.0: task do_patch: Succeeded
NOTE: package usbutils-0.86-r1: task do_fetch: Succeeded
NOTE: Running task 552 of 5581 (ID: 1815, /home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_setscene)
NOTE: Running task 553 of 5581 (ID: 2276, /home/oe/openembedded/recipes/udev/acl_2.2.49.bb, do_fetch)
NOTE: package jpeg-8b-r1: task do_setscene: Started
NOTE: package acl-2.2.49-r5: task do_fetch: Started
NOTE: Running task 554 of 5581 (ID: 4829, virtual:native:/home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_patch)
NOTE: package acl-2.2.49-r5: task do_fetch: Succeeded
NOTE: package dbus-native-1.4.1-r21.0: task do_patch: Started
NOTE: Applying patch 'tmpdir.patch' (../openembedded/recipes/dbus/dbus/tmpdir.patch)
NOTE: Running task 555 of 5581 (ID: 977, /home/oe/openembedded/recipes/usbutils/usbutils_0.86.bb, do_unpack)
NOTE: package usbutils-0.86-r1: task do_unpack: Started
NOTE: Unpacking ../sources/usbutils-0.86.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/usbutils-0.86-r1/
NOTE: package usbutils-0.86-r1: task do_unpack: Succeeded
NOTE: Running task 556 of 5581 (ID: 2269, /home/oe/openembedded/recipes/udev/acl_2.2.49.bb, do_unpack)
NOTE: Running task 557 of 5581 (ID: 3758, virtual:native:/home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_setscene)
NOTE: package jpeg-8b-r1: task do_setscene: Succeeded
NOTE: package acl-2.2.49-r5: task do_unpack: Started
NOTE: Unpacking ../sources/acl-2.2.49.src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/acl-2.2.49-r5/
NOTE: package acl-2.2.49-r5: task do_unpack: Succeeded
NOTE: package dbus-glib-native-0.86-r2.1: task do_setscene: Started
NOTE: Running task 558 of 5581 (ID: 1814, /home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_fetch)
NOTE: package dbus-glib-native-0.86-r2.1: task do_setscene: Succeeded
NOTE: package jpeg-8b-r1: task do_fetch: Started
NOTE: Running task 559 of 5581 (ID: 1183, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_qa_configure)
NOTE: package update-rc.d-0.7-r2: task do_qa_configure: Started
NOTE: package update-rc.d-0.7-r2: task do_qa_configure: Succeeded
NOTE: package jpeg-8b-r1: task do_fetch: Succeeded
NOTE: Running task 560 of 5581 (ID: 1184, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_compile)
NOTE: Running task 561 of 5581 (ID: 3757, virtual:native:/home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_fetch)
NOTE: package update-rc.d-0.7-r2: task do_compile: Started
NOTE: package update-rc.d-0.7-r2: task do_compile: Succeeded
NOTE: package dbus-glib-native-0.86-r2.1: task do_fetch: Started
NOTE: Running task 562 of 5581 (ID: 1807, /home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_unpack)
NOTE: package dbus-glib-native-0.86-r2.1: task do_fetch: Succeeded
NOTE: package jpeg-8b-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jpegsrc.v8b.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/jpeg-8b-r1/
NOTE: package jpeg-8b-r1: task do_unpack: Succeeded
NOTE: Running task 563 of 5581 (ID: 1175, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_install)
NOTE: package update-rc.d-0.7-r2: task do_install: Started
NOTE: Running task 564 of 5581 (ID: 4054, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb, do_setscene)
NOTE: package update-rc.d-0.7-r2: task do_install: Succeeded
NOTE: Applying patch 'add-configurable-reply-timeouts.patch' (../openembedded/recipes/dbus/dbus/add-configurable-reply-timeouts.patch)
NOTE: package log4j1.2-native-1.2.15-r1: task do_setscene: Started
NOTE: Running task 565 of 5581 (ID: 3750, virtual:native:/home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_unpack)
NOTE: package dbus-glib-native-0.86-r2.1: task do_unpack: Started
NOTE: Unpacking ../sources/dbus-glib-0.86.tar.gz to tmp/work/x86_64-linux/dbus-glib-native-0.86-r2.1/
NOTE: package dbus-glib-native-0.86-r2.1: task do_unpack: Succeeded
NOTE: Running task 566 of 5581 (ID: 1176, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_populate_sysroot)
NOTE: package dbus-native-1.4.1-r21.0: task do_patch: Succeeded
NOTE: package update-rc.d-0.7-r2: task do_populate_sysroot: Started
NOTE: Running task 567 of 5581 (ID: 3970, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_removebinaries)
NOTE: package log4j1.2-native-1.2.15-r1: task do_setscene: Succeeded
NOTE: package update-rc.d-0.7-r2: task do_populate_sysroot: Succeeded
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_removebinaries: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_removebinaries: Succeeded
NOTE: Running task 568 of 5581 (ID: 3969, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_unpackpost)
NOTE: Running task 569 of 5581 (ID: 4053, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb, do_fetch)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_unpackpost: Started
NOTE: Running task 570 of 5581 (ID: 4464, /home/oe/openembedded/recipes/xorg-lib/libxfixes_5.0.bb, do_patch)
NOTE: package log4j1.2-native-1.2.15-r1: task do_fetch: Started
NOTE: package libxfixes-1_5.0-r9.0: task do_patch: Started
NOTE: package libxfixes-1_5.0-r9.0: task do_patch: Succeeded
NOTE: Running task 571 of 5581 (ID: 4513, /home/oe/openembedded/recipes/xorg-proto/damageproto_1.2.1.bb, do_setscene)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_unpackpost: Succeeded
NOTE: package log4j1.2-native-1.2.15-r1: task do_fetch: Succeeded
NOTE: Running task 572 of 5581 (ID: 3985, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_removebinaries)
NOTE: package damageproto-1_1.2.1-r2.0: task do_setscene: Started
NOTE: package gnumail-native-1.1.2-r2: task do_removebinaries: Started
NOTE: package gnumail-native-1.1.2-r2: task do_removebinaries: Succeeded
NOTE: Running task 573 of 5581 (ID: 3972, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_patch)
NOTE: Running task 574 of 5581 (ID: 4046, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb, do_unpack)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_patch: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_patch: Succeeded
NOTE: package log4j1.2-native-1.2.15-r1: task do_unpack: Started
NOTE: Unpacking ../sources/apache-log4j-1.2.15.tar.gz to tmp/work/x86_64-linux/log4j1.2-native-1.2.15-r1/
NOTE: Running task 575 of 5581 (ID: 3987, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_patch)
NOTE: package gnumail-native-1.1.2-r2: task do_patch: Started
NOTE: Applying patch 'datadir_java.patch' (../openembedded/recipes/classpathx/gnumail-1.1.2/datadir_java.patch)
NOTE: package log4j1.2-native-1.2.15-r1: task do_unpack: Succeeded
NOTE: package gnumail-native-1.1.2-r2: task do_patch: Succeeded
NOTE: Running task 576 of 5581 (ID: 2018, /home/oe/openembedded/recipes/lzo/lzo_1.08.bb, do_patch)
NOTE: package damageproto-1_1.2.1-r2.0: task do_setscene: Succeeded
NOTE: package lzo-1.08-r15: task do_patch: Started
NOTE: package lzo-1.08-r15: task do_patch: Succeeded
NOTE: Running task 577 of 5581 (ID: 4512, /home/oe/openembedded/recipes/xorg-proto/damageproto_1.2.1.bb, do_fetch)
NOTE: Running task 578 of 5581 (ID: 5251, virtual:native:/home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_setscene)
NOTE: Running task 579 of 5581 (ID: 5237, virtual:native:/home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_setscene)
NOTE: package libgpg-error-native-1.4-r7.1: task do_setscene: Started
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_setscene: Started
NOTE: Running task 580 of 5581 (ID: 1999, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_qa_configure)
NOTE: package damageproto-1_1.2.1-r2.0: task do_fetch: Started
NOTE: package damageproto-1_1.2.1-r2.0: task do_fetch: Succeeded
NOTE: package unzip-native-552-r3: task do_qa_configure: Started
NOTE: package unzip-native-552-r3: task do_qa_configure: Succeeded
NOTE: Running task 581 of 5581 (ID: 4505, /home/oe/openembedded/recipes/xorg-proto/damageproto_1.2.1.bb, do_unpack)
NOTE: package damageproto-1_1.2.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/damageproto-1.2.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/damageproto-1_1.2.1-r2.0/
NOTE: Running task 582 of 5581 (ID: 2000, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_compile)
NOTE: package damageproto-1_1.2.1-r2.0: task do_unpack: Succeeded
NOTE: package unzip-native-552-r3: task do_compile: Started
NOTE: package libgpg-error-native-1.4-r7.1: task do_setscene: Succeeded
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 583 of 5581 (ID: 5505, virtual:native:/home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_setscene)
NOTE: package libffi-native-3.0.9-r0: task do_setscene: Started
NOTE: Running task 584 of 5581 (ID: 5250, virtual:native:/home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_fetch)
NOTE: package libgpg-error-native-1.4-r7.1: task do_fetch: Started
NOTE: package libgpg-error-native-1.4-r7.1: task do_fetch: Succeeded
NOTE: Running task 585 of 5581 (ID: 5236, virtual:native:/home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_fetch)
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_fetch: Started
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_fetch: Succeeded
NOTE: package libffi-native-3.0.9-r0: task do_setscene: Succeeded
NOTE: Running task 586 of 5581 (ID: 5243, virtual:native:/home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_unpack)
NOTE: package libgpg-error-native-1.4-r7.1: task do_unpack: Started
NOTE: Running task 587 of 5581 (ID: 5229, virtual:native:/home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_unpack)
NOTE: Unpacking ../sources/libgpg-error-1.4.tar.gz to tmp/work/x86_64-linux/libgpg-error-native-1.4-r7.1/
NOTE: package libgpg-error-native-1.4-r7.1: task do_unpack: Succeeded
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/renderproto-0.11.1.tar.bz2 to tmp/work/x86_64-linux/renderproto-native-1_0.11.1-r2.0/
NOTE: Running task 588 of 5581 (ID: 5504, virtual:native:/home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_fetch)
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_unpack: Succeeded
NOTE: package libffi-native-3.0.9-r0: task do_fetch: Started
NOTE: package libffi-native-3.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 589 of 5581 (ID: 4069, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb, do_setscene)
NOTE: package oro-native-2.0.8-r1: task do_setscene: Started
NOTE: Running task 590 of 5581 (ID: 3092, /home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_patch)
NOTE: Running task 591 of 5581 (ID: 5497, virtual:native:/home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_unpack)
NOTE: package libgcrypt-1.4.1-r0: task do_patch: Started
NOTE: Applying patch 'add-pkgconfig-support.patch' (../openembedded/recipes/libgcrypt/libgcrypt-1.4.1/add-pkgconfig-support.patch)
NOTE: package libffi-native-3.0.9-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libffi-3.0.9.tar.gz to tmp/work/x86_64-linux/libffi-native-3.0.9-r0/
NOTE: Applying patch 'mips-h-constraint.patch' (../openembedded/recipes/libgcrypt/files/mips-h-constraint.patch)
NOTE: package libgcrypt-1.4.1-r0: task do_patch: Succeeded
NOTE: package libffi-native-3.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 592 of 5581 (ID: 2312, /home/oe/openembedded/recipes/dbus/dbus_1.4.1.bb, do_patch)
NOTE: package oro-native-2.0.8-r1: task do_setscene: Succeeded
NOTE: Running task 593 of 5581 (ID: 3400, /home/oe/openembedded/recipes/guile/guile-native_1.8.7.bb, do_patch)
NOTE: package dbus-1.4.1-r21.0: task do_patch: Started
NOTE: package guile-native-1.8.7-r1: task do_patch: Started
NOTE: Running task 594 of 5581 (ID: 4068, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb, do_fetch)
NOTE: package oro-native-2.0.8-r1: task do_fetch: Started
NOTE: package oro-native-2.0.8-r1: task do_fetch: Succeeded
NOTE: Applying patch 'tmpdir.patch' (../openembedded/recipes/dbus/dbus/tmpdir.patch)
NOTE: Applying patch 'add-configurable-reply-timeouts.patch' (../openembedded/recipes/dbus/dbus/add-configurable-reply-timeouts.patch)
NOTE: Applying patch 'configure-fix.patch' (../openembedded/recipes/guile/files/configure-fix.patch)
NOTE: Applying patch 'cpp-linemarkers.patch' (../openembedded/recipes/guile/files/cpp-linemarkers.patch)
NOTE: Running task 595 of 5581 (ID: 4061, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb, do_unpack)
NOTE: package oro-native-2.0.8-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jakarta-oro-2.0.8.tar.gz to tmp/work/x86_64-linux/oro-native-2.0.8-r1/
NOTE: package oro-native-2.0.8-r1: task do_unpack: Succeeded
NOTE: Applying patch 'reloc.patch' (../openembedded/recipes/guile/guile-native-1.8.7/reloc.patch)
NOTE: Running task 596 of 5581 (ID: 2305, /home/oe/openembedded/recipes/gnutls/gnutls_2.10.4.bb, do_setscene)
NOTE: package dbus-1.4.1-r21.0: task do_patch: Succeeded
NOTE: package guile-native-1.8.7-r1: task do_patch: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_setscene: Started
NOTE: Running task 597 of 5581 (ID: 5462, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb, do_setscene)
NOTE: package avalon-framework-api-native-4.3-r1: task do_setscene: Started
NOTE: Running task 598 of 5581 (ID: 4576, /home/oe/openembedded/recipes/cairo/cairo-native_1.8.0.bb, do_patch)
NOTE: package cairo-native-1.8.0-r1: task do_patch: Started
NOTE: package cairo-native-1.8.0-r1: task do_patch: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_setscene: Succeeded
NOTE: Running task 599 of 5581 (ID: 1878, /home/oe/openembedded/recipes/cairo/cairo_1.10.0.bb, do_patch)
NOTE: package cairo-1.10.0-r2: task do_patch: Started
NOTE: package cairo-1.10.0-r2: task do_patch: Succeeded
NOTE: Running task 600 of 5581 (ID: 2304, /home/oe/openembedded/recipes/gnutls/gnutls_2.10.4.bb, do_fetch)
NOTE: package avalon-framework-api-native-4.3-r1: task do_setscene: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_fetch: Started
NOTE: Running task 601 of 5581 (ID: 5526, /home/oe/openembedded/recipes/jikes/jikes-initial.bb, do_patch)
NOTE: package jikes-initial-1.0-r0: task do_patch: Started
NOTE: package jikes-initial-1.0-r0: task do_patch: Succeeded
NOTE: Running task 602 of 5581 (ID: 5461, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb, do_fetch)
NOTE: package avalon-framework-api-native-4.3-r1: task do_fetch: Started
NOTE: Running task 603 of 5581 (ID: 978, /home/oe/openembedded/recipes/usbutils/usbutils_0.86.bb, do_patch)
NOTE: package usbutils-0.86-r1: task do_patch: Started
NOTE: package usbutils-0.86-r1: task do_patch: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_fetch: Succeeded
NOTE: package avalon-framework-api-native-4.3-r1: task do_fetch: Succeeded
NOTE: Running task 604 of 5581 (ID: 2270, /home/oe/openembedded/recipes/udev/acl_2.2.49.bb, do_patch)
NOTE: package acl-2.2.49-r5: task do_patch: Started
NOTE: Running task 605 of 5581 (ID: 5454, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb, do_unpack)
NOTE: Applying patch 'nolargefile.patch' (../openembedded/recipes/udev/acl-2.2.49/nolargefile.patch)
NOTE: package avalon-framework-api-native-4.3-r1: task do_unpack: Started
NOTE: Unpacking ../sources/avalon-framework-api-4.3-src.tar.gz to tmp/work/x86_64-linux/avalon-framework-api-native-4.3-r1/
NOTE: Unpacking ../sources/logkit-1.2.2-src.tar.gz to tmp/work/x86_64-linux/avalon-framework-api-native-4.3-r1/
NOTE: Running task 606 of 5581 (ID: 2297, /home/oe/openembedded/recipes/gnutls/gnutls_2.10.4.bb, do_unpack)
NOTE: package avalon-framework-api-native-4.3-r1: task do_unpack: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_unpack: Started
NOTE: Unpacking ../sources/gnutls-2.10.4.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gnutls-2.10.4-r11.2/
NOTE: package acl-2.2.49-r5: task do_patch: Succeeded
NOTE: Running task 607 of 5581 (ID: 803, /home/oe/openembedded/recipes/udev/udev_168.bb, do_setscene)
NOTE: package udev-168-r0: task do_setscene: Started
NOTE: Running task 608 of 5581 (ID: 4499, /home/oe/openembedded/recipes/xorg-proto/randrproto_1.3.2.bb, do_setscene)
NOTE: package randrproto-1_1.3.2-r2.0: task do_setscene: Started
NOTE: package udev-168-r0: task do_setscene: Succeeded
NOTE: package randrproto-1_1.3.2-r2.0: task do_setscene: Succeeded
NOTE: Running task 609 of 5581 (ID: 802, /home/oe/openembedded/recipes/udev/udev_168.bb, do_fetch)
NOTE: Running task 610 of 5581 (ID: 4498, /home/oe/openembedded/recipes/xorg-proto/randrproto_1.3.2.bb, do_fetch)
NOTE: package udev-168-r0: task do_fetch: Started
NOTE: package udev-168-r0: task do_fetch: Succeeded
NOTE: package randrproto-1_1.3.2-r2.0: task do_fetch: Started
NOTE: package randrproto-1_1.3.2-r2.0: task do_fetch: Succeeded
NOTE: Running task 611 of 5581 (ID: 795, /home/oe/openembedded/recipes/udev/udev_168.bb, do_unpack)
NOTE: package udev-168-r0: task do_unpack: Started
NOTE: Unpacking ../sources/udev-168.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/run.rules to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/udev.rules to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Running task 612 of 5581 (ID: 4491, /home/oe/openembedded/recipes/xorg-proto/randrproto_1.3.2.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/udev/udev/links.conf to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/permissions.rules to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/angstrom/mount.sh to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/mount.blacklist to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/network.sh to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: package unzip-native-552-r3: task do_compile: Succeeded
NOTE: package randrproto-1_1.3.2-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/randrproto-1.3.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/randrproto-1_1.3.2-r2.0/
NOTE: package randrproto-1_1.3.2-r2.0: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/udev/udev/local.rules to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/default to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/init to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/cache to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: Unpacking ../openembedded/recipes/udev/udev/udev-compat-wrapper-patch to tmp/work/armv5te-angstrom-linux-gnueabi/udev-168-r0/
NOTE: package udev-168-r0: task do_unpack: Succeeded
NOTE: Running task 613 of 5581 (ID: 1991, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_install)
NOTE: package unzip-native-552-r3: task do_install: Started
NOTE: Running task 614 of 5581 (ID: 4443, /home/oe/openembedded/recipes/xorg-lib/libxft_2.2.0.bb, do_setscene)
NOTE: package libxft-1_2.2.0-r9.0: task do_setscene: Started
NOTE: Running task 615 of 5581 (ID: 1808, /home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_patch)
NOTE: package unzip-native-552-r3: task do_install: Succeeded
NOTE: package libxft-1_2.2.0-r9.0: task do_setscene: Succeeded
NOTE: package jpeg-8b-r1: task do_patch: Started
NOTE: Applying patch '0001-configure-make-jpeg-work-with-older-autotools.patch' (../openembedded/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch)
NOTE: package jpeg-8b-r1: task do_patch: Succeeded
NOTE: Running task 616 of 5581 (ID: 1992, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_populate_sysroot)
NOTE: Running task 617 of 5581 (ID: 4442, /home/oe/openembedded/recipes/xorg-lib/libxft_2.2.0.bb, do_fetch)
NOTE: Running task 618 of 5581 (ID: 4024, virtual:native:/home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_setscene)
NOTE: package gnutls-2.10.4-r11.2: task do_unpack: Succeeded
NOTE: package unzip-native-552-r3: task do_populate_sysroot: Started
NOTE: package libxft-1_2.2.0-r9.0: task do_fetch: Started
NOTE: package libxft-1_2.2.0-r9.0: task do_fetch: Succeeded
NOTE: package bcel-native-5.2-r1: task do_setscene: Started
NOTE: Running task 619 of 5581 (ID: 3751, virtual:native:/home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_patch)
NOTE: package dbus-glib-native-0.86-r2.1: task do_patch: Started
NOTE: Applying patch 'run-with-tmp-session-bus.patch' (../openembedded/recipes/dbus/dbus-glib-0.86/run-with-tmp-session-bus.patch)
NOTE: Running task 620 of 5581 (ID: 4435, /home/oe/openembedded/recipes/xorg-lib/libxft_2.2.0.bb, do_unpack)
NOTE: package libxft-1_2.2.0-r9.0: task do_unpack: Started
NOTE: package bcel-native-5.2-r1: task do_setscene: Succeeded
NOTE: package dbus-glib-native-0.86-r2.1: task do_patch: Succeeded
NOTE: Unpacking ../sources/libXft-2.2.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxft-1_2.2.0-r9.0/
NOTE: package libxft-1_2.2.0-r9.0: task do_unpack: Succeeded
NOTE: Running task 621 of 5581 (ID: 4023, virtual:native:/home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_fetch)
NOTE: package bcel-native-5.2-r1: task do_fetch: Started
NOTE: Running task 622 of 5581 (ID: 2375, /home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_setscene)
NOTE: package unzip-native-552-r3: task do_populate_sysroot: Succeeded
NOTE: package bcel-native-5.2-r1: task do_fetch: Succeeded
NOTE: package dbus-glib-0.86-r2.1: task do_setscene: Started
NOTE: Running task 623 of 5581 (ID: 3954, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_removebinaries)
NOTE: package xerces-j-native-2.9.1-r1: task do_removebinaries: Started
NOTE: package xerces-j-native-2.9.1-r1: task do_removebinaries: Succeeded
NOTE: Running task 624 of 5581 (ID: 3953, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_unpackpost)
NOTE: package xerces-j-native-2.9.1-r1: task do_unpackpost: Started
NOTE: Running task 625 of 5581 (ID: 4016, virtual:native:/home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_unpack)
NOTE: package bcel-native-5.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/bcel-5.2-src.tar.gz to tmp/work/x86_64-linux/bcel-native-5.2-r1/
NOTE: package bcel-native-5.2-r1: task do_unpack: Succeeded
NOTE: Running task 626 of 5581 (ID: 5519, /home/oe/openembedded/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_setscene)
NOTE: package dbus-glib-0.86-r2.1: task do_setscene: Succeeded
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_setscene: Started
NOTE: Running task 627 of 5581 (ID: 2374, /home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_fetch)
NOTE: package dbus-glib-0.86-r2.1: task do_fetch: Started
NOTE: package dbus-glib-0.86-r2.1: task do_fetch: Succeeded
NOTE: Running task 628 of 5581 (ID: 4030, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_removebinaries)
NOTE: package regexp-native-1.5-r1: task do_removebinaries: Started
NOTE: package regexp-native-1.5-r1: task do_removebinaries: Succeeded
NOTE: Running task 629 of 5581 (ID: 2367, /home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_unpack)
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_setscene: Succeeded
NOTE: package dbus-glib-0.86-r2.1: task do_unpack: Started
NOTE: Unpacking ../sources/dbus-glib-0.86.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/dbus-glib-0.86-r2.1/
NOTE: package dbus-glib-0.86-r2.1: task do_unpack: Succeeded
NOTE: Running task 630 of 5581 (ID: 5518, /home/oe/openembedded/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_fetch)
NOTE: Running task 631 of 5581 (ID: 4032, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_patch)
NOTE: Running task 632 of 5581 (ID: 4506, /home/oe/openembedded/recipes/xorg-proto/damageproto_1.2.1.bb, do_patch)
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_fetch: Started
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_fetch: Succeeded
NOTE: package regexp-native-1.5-r1: task do_patch: Started
NOTE: package regexp-native-1.5-r1: task do_patch: Succeeded
NOTE: package damageproto-1_1.2.1-r2.0: task do_patch: Started
NOTE: package damageproto-1_1.2.1-r2.0: task do_patch: Succeeded
NOTE: Running task 633 of 5581 (ID: 5511, /home/oe/openembedded/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_unpack)
NOTE: Running task 634 of 5581 (ID: 3127, /home/oe/openembedded/recipes/xorg-lib/libxdamage_1.1.3.bb, do_setscene)
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_unpack: Started
NOTE: package libxdamage-1_1.1.3-r9.0: task do_setscene: Started
NOTE: Running task 635 of 5581 (ID: 69, virtual:native:/home/oe/openembedded/recipes/fakeroot/fakeroot_1.15.1.bb, do_setscene)
NOTE: package fakeroot-native-1.15.1-r0.0: task do_setscene: Started
NOTE: Unpacking ../sources/xf86vidmodeproto-2.3.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xf86vidmodeproto-1_2.3.1-r2.0/
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 636 of 5581 (ID: 489, /home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_setscene)
NOTE: package fakeroot-native-1.15.1-r0.0: task do_setscene: Succeeded
NOTE: package libxml2-2.7.8-r9.1: task do_setscene: Started
NOTE: package libxdamage-1_1.1.3-r9.0: task do_setscene: Succeeded
NOTE: Running task 637 of 5581 (ID: 68, virtual:native:/home/oe/openembedded/recipes/fakeroot/fakeroot_1.15.1.bb, do_fetch)
NOTE: package fakeroot-native-1.15.1-r0.0: task do_fetch: Started
NOTE: package fakeroot-native-1.15.1-r0.0: task do_fetch: Succeeded
NOTE: Running task 638 of 5581 (ID: 3126, /home/oe/openembedded/recipes/xorg-lib/libxdamage_1.1.3.bb, do_fetch)
NOTE: package libxml2-2.7.8-r9.1: task do_setscene: Succeeded
NOTE: Running task 639 of 5581 (ID: 61, virtual:native:/home/oe/openembedded/recipes/fakeroot/fakeroot_1.15.1.bb, do_unpack)
NOTE: package libxdamage-1_1.1.3-r9.0: task do_fetch: Started
NOTE: package libxdamage-1_1.1.3-r9.0: task do_fetch: Succeeded
NOTE: package fakeroot-native-1.15.1-r0.0: task do_unpack: Started
NOTE: Unpacking ../sources/fakeroot_1.15.1.orig.tar.bz2 to tmp/work/x86_64-linux/fakeroot-native-1.15.1-r0.0/
NOTE: package fakeroot-native-1.15.1-r0.0: task do_unpack: Succeeded
NOTE: Running task 640 of 5581 (ID: 488, /home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_fetch)
NOTE: Running task 641 of 5581 (ID: 3119, /home/oe/openembedded/recipes/xorg-lib/libxdamage_1.1.3.bb, do_unpack)
NOTE: package libxml2-2.7.8-r9.1: task do_fetch: Started
NOTE: package libxdamage-1_1.1.3-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXdamage-1.1.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxdamage-1_1.1.3-r9.0/
NOTE: package libxdamage-1_1.1.3-r9.0: task do_unpack: Succeeded
NOTE: Running task 642 of 5581 (ID: 4232, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_setscene)
NOTE: package libxext-native-1_1.3.0-r9.0: task do_setscene: Started
NOTE: package xerces-j-native-2.9.1-r1: task do_unpackpost: Succeeded
NOTE: Running task 643 of 5581 (ID: 3646, /home/oe/openembedded/recipes/libogg/libogg_1.1.4.bb, do_setscene)
NOTE: package libogg-1.1.4-r4.0: task do_setscene: Started
NOTE: package libxml2-2.7.8-r9.1: task do_fetch: Succeeded
NOTE: package libxext-native-1_1.3.0-r9.0: task do_setscene: Succeeded
NOTE: Running task 644 of 5581 (ID: 3956, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_patch)
NOTE: package xerces-j-native-2.9.1-r1: task do_patch: Started
NOTE: Running task 645 of 5581 (ID: 481, /home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_unpack)
NOTE: package libogg-1.1.4-r4.0: task do_setscene: Succeeded
NOTE: package xerces-j-native-2.9.1-r1: task do_patch: Succeeded
NOTE: package libxml2-2.7.8-r9.1: task do_unpack: Started
NOTE: Unpacking ../sources/libxml2-2.7.8.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libxml2-2.7.8-r9.1/
NOTE: Running task 646 of 5581 (ID: 4231, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_fetch)
NOTE: package libxext-native-1_1.3.0-r9.0: task do_fetch: Started
NOTE: package libxext-native-1_1.3.0-r9.0: task do_fetch: Succeeded
NOTE: Running task 647 of 5581 (ID: 3645, /home/oe/openembedded/recipes/libogg/libogg_1.1.4.bb, do_fetch)
NOTE: package libogg-1.1.4-r4.0: task do_fetch: Started
NOTE: Running task 648 of 5581 (ID: 4527, /home/oe/openembedded/recipes/xorg-proto/compositeproto_0.4.2.bb, do_setscene)
NOTE: package libogg-1.1.4-r4.0: task do_fetch: Succeeded
NOTE: package compositeproto-1_0.4.2-r2.0: task do_setscene: Started
NOTE: Running task 649 of 5581 (ID: 4224, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_unpack)
NOTE: package libxext-native-1_1.3.0-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXext-1.3.0.tar.bz2 to tmp/work/x86_64-linux/libxext-native-1_1.3.0-r9.0/
NOTE: Running task 650 of 5581 (ID: 3638, /home/oe/openembedded/recipes/libogg/libogg_1.1.4.bb, do_unpack)
NOTE: package libogg-1.1.4-r4.0: task do_unpack: Started
NOTE: package libxext-native-1_1.3.0-r9.0: task do_unpack: Succeeded
NOTE: package libxml2-2.7.8-r9.1: task do_unpack: Succeeded
NOTE: Unpacking ../sources/libogg-1.1.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libogg-1.1.4-r4.0/
NOTE: package libogg-1.1.4-r4.0: task do_unpack: Succeeded
NOTE: package compositeproto-1_0.4.2-r2.0: task do_setscene: Succeeded
NOTE: Running task 651 of 5581 (ID: 5244, virtual:native:/home/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb, do_patch)
NOTE: Running task 652 of 5581 (ID: 5230, virtual:native:/home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_patch)
NOTE: package libgpg-error-native-1.4-r7.1: task do_patch: Started
NOTE: Running task 653 of 5581 (ID: 4526, /home/oe/openembedded/recipes/xorg-proto/compositeproto_0.4.2.bb, do_fetch)
NOTE: Applying patch 'pkgconfig.patch' (../openembedded/recipes/libgpg-error/libgpg-error-1.4/pkgconfig.patch)
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_patch: Started
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_patch: Succeeded
NOTE: package compositeproto-1_0.4.2-r2.0: task do_fetch: Started
NOTE: Running task 654 of 5581 (ID: 4611, virtual:native:/home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_setscene)
NOTE: package compositeproto-1_0.4.2-r2.0: task do_fetch: Succeeded
NOTE: package libgcrypt-native-1.4.1-r0: task do_setscene: Started
NOTE: package libgpg-error-native-1.4-r7.1: task do_patch: Succeeded
NOTE: package libgcrypt-native-1.4.1-r0: task do_setscene: Succeeded
NOTE: Running task 655 of 5581 (ID: 4597, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_setscene)
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_setscene: Started
NOTE: Running task 656 of 5581 (ID: 4569, virtual:native:/home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_setscene)
NOTE: Running task 657 of 5581 (ID: 4519, /home/oe/openembedded/recipes/xorg-proto/compositeproto_0.4.2.bb, do_unpack)
NOTE: package pango-native-1.28.3-r1.0: task do_setscene: Started
NOTE: package compositeproto-1_0.4.2-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/compositeproto-0.4.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/compositeproto-1_0.4.2-r2.0/
NOTE: Running task 658 of 5581 (ID: 4610, virtual:native:/home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_fetch)
NOTE: package libgcrypt-native-1.4.1-r0: task do_fetch: Started
NOTE: package libgcrypt-native-1.4.1-r0: task do_fetch: Succeeded
NOTE: package pango-native-1.28.3-r1.0: task do_setscene: Succeeded
NOTE: package compositeproto-1_0.4.2-r2.0: task do_unpack: Succeeded
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_setscene: Succeeded
NOTE: Running task 659 of 5581 (ID: 4603, virtual:native:/home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_unpack)
NOTE: package libgcrypt-native-1.4.1-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libgcrypt-1.4.1.tar.gz to tmp/work/x86_64-linux/libgcrypt-native-1.4.1-r0/
NOTE: package libgcrypt-native-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 660 of 5581 (ID: 4596, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_fetch)
NOTE: Running task 661 of 5581 (ID: 4568, virtual:native:/home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_fetch)
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_fetch: Started
NOTE: package pango-native-1.28.3-r1.0: task do_fetch: Started
NOTE: Running task 662 of 5581 (ID: 4555, virtual:native:/home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_setscene)
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_fetch: Succeeded
NOTE: package pango-native-1.28.3-r1.0: task do_fetch: Succeeded
NOTE: package atk-native-1.30.0-r1: task do_setscene: Started
NOTE: Running task 663 of 5581 (ID: 5498, virtual:native:/home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_patch)
NOTE: package libffi-native-3.0.9-r0: task do_patch: Started
NOTE: package libffi-native-3.0.9-r0: task do_patch: Succeeded
NOTE: Running task 664 of 5581 (ID: 4589, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_unpack)
NOTE: Running task 665 of 5581 (ID: 4561, virtual:native:/home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_unpack)
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXrender-0.9.6.tar.bz2 to tmp/work/x86_64-linux/libxrender-native-1_0.9.6-r9.0/
NOTE: package pango-native-1.28.3-r1.0: task do_unpack: Started
NOTE: Unpacking ../sources/pango-1.28.3.tar.bz2 to tmp/work/x86_64-linux/pango-native-1.28.3-r1.0/
NOTE: Running task 666 of 5581 (ID: 5547, /home/oe/openembedded/recipes/jamvm/jamvm-initial_1.4.5.bb, do_setscene)
NOTE: package jamvm-initial-1.4.5-r3: task do_setscene: Started
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_unpack: Succeeded
NOTE: package jamvm-initial-1.4.5-r3: task do_setscene: Succeeded
NOTE: Running task 667 of 5581 (ID: 4780, /home/oe/openembedded/recipes/cmake/cmake-native_2.8.3.bb, do_setscene)
NOTE: package atk-native-1.30.0-r1: task do_setscene: Succeeded
NOTE: package pango-native-1.28.3-r1.0: task do_unpack: Succeeded
NOTE: package cmake-native-2.8.3-r2.0: task do_setscene: Started
NOTE: Running task 668 of 5581 (ID: 4554, virtual:native:/home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_fetch)
NOTE: package atk-native-1.30.0-r1: task do_fetch: Started
NOTE: package atk-native-1.30.0-r1: task do_fetch: Succeeded
NOTE: Running task 669 of 5581 (ID: 5546, /home/oe/openembedded/recipes/jamvm/jamvm-initial_1.4.5.bb, do_fetch)
NOTE: package jamvm-initial-1.4.5-r3: task do_fetch: Started
NOTE: package jamvm-initial-1.4.5-r3: task do_fetch: Succeeded
NOTE: Running task 670 of 5581 (ID: 4896, /home/oe/openembedded/recipes/cup/cup-native_0.10k.bb, do_setscene)
NOTE: package cup-native-0.10k-r1: task do_setscene: Started
NOTE: Running task 671 of 5581 (ID: 4547, virtual:native:/home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_unpack)
NOTE: package cmake-native-2.8.3-r2.0: task do_setscene: Succeeded
NOTE: package atk-native-1.30.0-r1: task do_unpack: Started
NOTE: Unpacking ../sources/atk-1.30.0.tar.bz2 to tmp/work/x86_64-linux/atk-native-1.30.0-r1/
NOTE: Running task 672 of 5581 (ID: 5539, /home/oe/openembedded/recipes/jamvm/jamvm-initial_1.4.5.bb, do_unpack)
NOTE: package jamvm-initial-1.4.5-r3: task do_unpack: Started
NOTE: Unpacking ../sources/jamvm-1.4.5.tar.gz to tmp/work/x86_64-linux/jamvm-initial-1.4.5-r3/
NOTE: package jamvm-initial-1.4.5-r3: task do_unpack: Succeeded
NOTE: Running task 673 of 5581 (ID: 4779, /home/oe/openembedded/recipes/cmake/cmake-native_2.8.3.bb, do_fetch)
NOTE: Running task 674 of 5581 (ID: 4881, /home/oe/openembedded/recipes/jlex/jlex-native_1.2.6.bb, do_setscene)
NOTE: package cmake-native-2.8.3-r2.0: task do_fetch: Started
NOTE: package cmake-native-2.8.3-r2.0: task do_fetch: Succeeded
NOTE: package jlex-native-1.2.6-r1: task do_setscene: Started
NOTE: package cup-native-0.10k-r1: task do_setscene: Succeeded
NOTE: package jlex-native-1.2.6-r1: task do_setscene: Succeeded
NOTE: package atk-native-1.30.0-r1: task do_unpack: Succeeded
NOTE: Running task 675 of 5581 (ID: 4895, /home/oe/openembedded/recipes/cup/cup-native_0.10k.bb, do_fetch)
NOTE: package cup-native-0.10k-r1: task do_fetch: Started
NOTE: Running task 676 of 5581 (ID: 3435, virtual:native:/home/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb, do_setscene)
NOTE: Running task 677 of 5581 (ID: 4772, /home/oe/openembedded/recipes/cmake/cmake-native_2.8.3.bb, do_unpack)
NOTE: Running task 678 of 5581 (ID: 4880, /home/oe/openembedded/recipes/jlex/jlex-native_1.2.6.bb, do_fetch)
NOTE: package cup-native-0.10k-r1: task do_fetch: Succeeded
NOTE: package libxml-parser-perl-native-2.36-r4: task do_setscene: Started
NOTE: package cmake-native-2.8.3-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/cmake-2.8.3.tar.gz to tmp/work/x86_64-linux/cmake-native-2.8.3-r2.0/
NOTE: package jlex-native-1.2.6-r1: task do_fetch: Started
NOTE: package jlex-native-1.2.6-r1: task do_fetch: Succeeded
NOTE: Running task 679 of 5581 (ID: 4888, /home/oe/openembedded/recipes/cup/cup-native_0.10k.bb, do_unpack)
NOTE: package cup-native-0.10k-r1: task do_unpack: Started
NOTE: Unpacking ../sources/java_cup_v10k.tar.gz to tmp/work/x86_64-linux/cup-native-0.10k-r1/
NOTE: Unpacking ../openembedded/recipes/cup/files/cup to tmp/work/x86_64-linux/cup-native-0.10k-r1/
NOTE: package cup-native-0.10k-r1: task do_unpack: Succeeded
NOTE: Running task 680 of 5581 (ID: 4873, /home/oe/openembedded/recipes/jlex/jlex-native_1.2.6.bb, do_unpack)
NOTE: package jlex-native-1.2.6-r1: task do_unpack: Started
NOTE: Unpacking ../sources/Main.java to tmp/work/x86_64-linux/jlex-native-1.2.6-r1/
NOTE: Unpacking ../openembedded/recipes/jlex/files/jlex to tmp/work/x86_64-linux/jlex-native-1.2.6-r1/
NOTE: package libxml-parser-perl-native-2.36-r4: task do_setscene: Succeeded
NOTE: package cmake-native-2.8.3-r2.0: task do_unpack: Succeeded
NOTE: package jlex-native-1.2.6-r1: task do_unpack: Succeeded
NOTE: Running task 681 of 5581 (ID: 4045, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb, do_removebinaries)
NOTE: Running task 682 of 5581 (ID: 3434, virtual:native:/home/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb, do_fetch)
NOTE: package log4j1.2-native-1.2.15-r1: task do_removebinaries: Started
NOTE: Running task 683 of 5581 (ID: 2298, /home/oe/openembedded/recipes/gnutls/gnutls_2.10.4.bb, do_patch)
NOTE: package libxml-parser-perl-native-2.36-r4: task do_fetch: Started
NOTE: package log4j1.2-native-1.2.15-r1: task do_removebinaries: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_patch: Started
NOTE: Applying patch 'gettextize-with-gettext-0.18.patch' (../openembedded/recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch)
NOTE: Running task 684 of 5581 (ID: 2361, /home/oe/openembedded/recipes/alsa/alsa-lib_1.0.24.1.bb, do_setscene)
NOTE: package alsa-lib-1.0.24.1-r0: task do_setscene: Started
NOTE: package libxml-parser-perl-native-2.36-r4: task do_fetch: Succeeded
NOTE: Running task 685 of 5581 (ID: 4047, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb, do_patch)
NOTE: package log4j1.2-native-1.2.15-r1: task do_patch: Started
NOTE: package log4j1.2-native-1.2.15-r1: task do_patch: Succeeded
NOTE: Running task 686 of 5581 (ID: 3427, virtual:native:/home/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb, do_unpack)
NOTE: Applying patch 'gnutls-openssl.patch' (../openembedded/recipes/gnutls/gnutls-2.10.4/gnutls-openssl.patch)
NOTE: Applying patch 'gnutls-replace-siginterrupt.patch' (../openembedded/recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch)
NOTE: package libxml-parser-perl-native-2.36-r4: task do_unpack: Started
NOTE: Unpacking ../sources/XML-Parser-2.36.tar.gz to tmp/work/x86_64-linux/libxml-parser-perl-native-2.36-r4/
NOTE: package libxml-parser-perl-native-2.36-r4: task do_unpack: Succeeded
NOTE: package gnutls-2.10.4-r11.2: task do_patch: Succeeded
NOTE: Running task 687 of 5581 (ID: 4957, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb, do_setscene)
NOTE: package alsa-lib-1.0.24.1-r0: task do_setscene: Succeeded
NOTE: Running task 688 of 5581 (ID: 4933, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_removebinaries)
NOTE: package logkit-native-1.2.2-r1: task do_setscene: Started
NOTE: package servlet2.3-native-4.1.37-r1: task do_removebinaries: Started
NOTE: Running task 689 of 5581 (ID: 4932, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_unpackpost)
NOTE: package servlet2.3-native-4.1.37-r1: task do_unpackpost: Started
NOTE: package servlet2.3-native-4.1.37-r1: task do_unpackpost: Succeeded
NOTE: Running task 690 of 5581 (ID: 2360, /home/oe/openembedded/recipes/alsa/alsa-lib_1.0.24.1.bb, do_fetch)
NOTE: package alsa-lib-1.0.24.1-r0: task do_fetch: Started
NOTE: package alsa-lib-1.0.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 691 of 5581 (ID: 5477, /home/oe/openembedded/recipes/ecj/libecj-bootstrap_3.6.bb, do_setscene)
NOTE: package libecj-bootstrap-3.6-r0: task do_setscene: Started
NOTE: package logkit-native-1.2.2-r1: task do_setscene: Succeeded
NOTE: package servlet2.3-native-4.1.37-r1: task do_removebinaries: Succeeded
NOTE: Running task 692 of 5581 (ID: 2353, /home/oe/openembedded/recipes/alsa/alsa-lib_1.0.24.1.bb, do_unpack)
NOTE: package alsa-lib-1.0.24.1-r0: task do_unpack: Started
NOTE: Unpacking ../sources/alsa-lib-1.0.24.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/alsa-lib-1.0.24.1-r0/
NOTE: Running task 693 of 5581 (ID: 4935, virtual:native:/home/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb, do_patch)
NOTE: Running task 694 of 5581 (ID: 4956, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb, do_fetch)
NOTE: package servlet2.3-native-4.1.37-r1: task do_patch: Started
NOTE: package servlet2.3-native-4.1.37-r1: task do_patch: Succeeded
NOTE: package alsa-lib-1.0.24.1-r0: task do_unpack: Succeeded
NOTE: package libecj-bootstrap-3.6-r0: task do_setscene: Succeeded
NOTE: package logkit-native-1.2.2-r1: task do_fetch: Started
NOTE: package logkit-native-1.2.2-r1: task do_fetch: Succeeded
NOTE: Running task 695 of 5581 (ID: 796, /home/oe/openembedded/recipes/udev/udev_168.bb, do_patch)
NOTE: package udev-168-r0: task do_patch: Started
NOTE: Running task 696 of 5581 (ID: 5265, /home/oe/openembedded/recipes/libidl/libidl-native_0.8.13.bb, do_setscene)
NOTE: Running task 697 of 5581 (ID: 5476, /home/oe/openembedded/recipes/ecj/libecj-bootstrap_3.6.bb, do_fetch)
NOTE: package udev-168-r0: task do_patch: Succeeded
NOTE: package libidl-native-0.8.13-r1: task do_setscene: Started
NOTE: package libecj-bootstrap-3.6-r0: task do_fetch: Started
NOTE: package libecj-bootstrap-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 5581 (ID: 4949, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb, do_unpack)
NOTE: package logkit-native-1.2.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/logkit-1.2.2-src.tar.gz to tmp/work/x86_64-linux/logkit-native-1.2.2-r1/
NOTE: package logkit-native-1.2.2-r1: task do_unpack: Succeeded
NOTE: Running task 699 of 5581 (ID: 4492, /home/oe/openembedded/recipes/xorg-proto/randrproto_1.3.2.bb, do_patch)
NOTE: Running task 700 of 5581 (ID: 5469, /home/oe/openembedded/recipes/ecj/libecj-bootstrap_3.6.bb, do_unpack)
NOTE: package randrproto-1_1.3.2-r2.0: task do_patch: Started
NOTE: package randrproto-1_1.3.2-r2.0: task do_patch: Succeeded
NOTE: package libecj-bootstrap-3.6-r0: task do_unpack: Started
NOTE: Unpacking ../sources/ecjsrc-3.6.zip to tmp/work/x86_64-linux/libecj-bootstrap-3.6-r0/
NOTE: Running task 701 of 5581 (ID: 4436, /home/oe/openembedded/recipes/xorg-lib/libxft_2.2.0.bb, do_patch)
NOTE: package libxft-1_2.2.0-r9.0: task do_patch: Started
NOTE: package libidl-native-0.8.13-r1: task do_setscene: Succeeded
NOTE: package libecj-bootstrap-3.6-r0: task do_unpack: Succeeded
NOTE: package libxft-1_2.2.0-r9.0: task do_patch: Succeeded
NOTE: Running task 702 of 5581 (ID: 5264, /home/oe/openembedded/recipes/libidl/libidl-native_0.8.13.bb, do_fetch)
NOTE: package libidl-native-0.8.13-r1: task do_fetch: Started
NOTE: Running task 703 of 5581 (ID: 3113, /home/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.1.bb, do_setscene)
NOTE: Running task 704 of 5581 (ID: 3029, /home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_setscene)
NOTE: package libidl-native-0.8.13-r1: task do_fetch: Succeeded
NOTE: package libxrandr-1_1.3.1-r9.0: task do_setscene: Started
NOTE: package pango-1.28.3-r1.0: task do_setscene: Started
NOTE: Running task 705 of 5581 (ID: 4060, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb, do_removebinaries)
NOTE: package oro-native-2.0.8-r1: task do_removebinaries: Started
NOTE: Running task 706 of 5581 (ID: 5257, /home/oe/openembedded/recipes/libidl/libidl-native_0.8.13.bb, do_unpack)
NOTE: package libidl-native-0.8.13-r1: task do_unpack: Started
NOTE: package oro-native-2.0.8-r1: task do_removebinaries: Succeeded
NOTE: Unpacking ../sources/libIDL-0.8.13.tar.bz2 to tmp/work/x86_64-linux/libidl-native-0.8.13-r1/
NOTE: package pango-1.28.3-r1.0: task do_setscene: Succeeded
NOTE: Running task 707 of 5581 (ID: 4062, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb, do_patch)
NOTE: package libidl-native-0.8.13-r1: task do_unpack: Succeeded
NOTE: package libxrandr-1_1.3.1-r9.0: task do_setscene: Succeeded
NOTE: package oro-native-2.0.8-r1: task do_patch: Started
NOTE: package oro-native-2.0.8-r1: task do_patch: Succeeded
NOTE: Running task 708 of 5581 (ID: 3112, /home/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.1.bb, do_fetch)
NOTE: Running task 709 of 5581 (ID: 3028, /home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_fetch)
NOTE: package libxrandr-1_1.3.1-r9.0: task do_fetch: Started
NOTE: package pango-1.28.3-r1.0: task do_fetch: Started
NOTE: Running task 710 of 5581 (ID: 2368, /home/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb, do_patch)
NOTE: package libxrandr-1_1.3.1-r9.0: task do_fetch: Succeeded
NOTE: package pango-1.28.3-r1.0: task do_fetch: Succeeded
NOTE: package dbus-glib-0.86-r2.1: task do_patch: Started
NOTE: Applying patch 'no-examples.patch' (../openembedded/recipes/dbus/dbus-glib-0.86/no-examples.patch)
NOTE: Running task 711 of 5581 (ID: 5512, /home/oe/openembedded/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb, do_patch)
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_patch: Started
NOTE: package xf86vidmodeproto-1_2.3.1-r2.0: task do_patch: Succeeded
NOTE: Running task 712 of 5581 (ID: 3105, /home/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.1.bb, do_unpack)
NOTE: package libxrandr-1_1.3.1-r9.0: task do_unpack: Started
NOTE: Running task 713 of 5581 (ID: 3021, /home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_unpack)
NOTE: Applying patch 'no-introspect.patch' (../openembedded/recipes/dbus/dbus-glib-0.86/no-introspect.patch)
NOTE: Unpacking ../sources/libXrandr-1.3.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxrandr-1_1.3.1-r9.0/
NOTE: package libxrandr-1_1.3.1-r9.0: task do_unpack: Succeeded
NOTE: Running task 714 of 5581 (ID: 5433, /home/oe/openembedded/recipes/time/time_1.7.bb, do_setscene)
NOTE: package pango-1.28.3-r1.0: task do_unpack: Started
NOTE: Unpacking ../sources/pango-1.28.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/pango-1.28.3-r1.0/
NOTE: package dbus-glib-0.86-r2.1: task do_patch: Succeeded
NOTE: package time-1.7-r1: task do_setscene: Started
NOTE: Running task 715 of 5581 (ID: 5419, virtual:native:/home/oe/openembedded/recipes/xorg-util/makedepend_1.0.3.bb, do_setscene)
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_setscene: Started
NOTE: Running task 716 of 5581 (ID: 5405, /home/oe/openembedded/recipes/dri/libdrm_2.4.25.bb, do_setscene)
NOTE: package libdrm-2.4.25-r0: task do_setscene: Started
NOTE: package time-1.7-r1: task do_setscene: Succeeded
NOTE: package pango-1.28.3-r1.0: task do_unpack: Succeeded
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_setscene: Succeeded
NOTE: package libdrm-2.4.25-r0: task do_setscene: Succeeded
NOTE: Running task 717 of 5581 (ID: 5432, /home/oe/openembedded/recipes/time/time_1.7.bb, do_fetch)
NOTE: package time-1.7-r1: task do_fetch: Started
NOTE: package time-1.7-r1: task do_fetch: Succeeded
NOTE: Running task 718 of 5581 (ID: 5391, /home/oe/openembedded/recipes/xorg-proto/dri2proto_2.4.bb, do_setscene)
NOTE: Running task 719 of 5581 (ID: 5418, virtual:native:/home/oe/openembedded/recipes/xorg-util/makedepend_1.0.3.bb, do_fetch)
NOTE: Running task 720 of 5581 (ID: 5404, /home/oe/openembedded/recipes/dri/libdrm_2.4.25.bb, do_fetch)
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_fetch: Started
NOTE: package libdrm-2.4.25-r0: task do_fetch: Started
NOTE: package libdrm-2.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 721 of 5581 (ID: 5425, /home/oe/openembedded/recipes/time/time_1.7.bb, do_unpack)
NOTE: package dri2proto-2.4-r2.1: task do_setscene: Started
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_fetch: Succeeded
NOTE: package time-1.7-r1: task do_unpack: Started
NOTE: Unpacking ../sources/time-1.7.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/time-1.7-r1/
NOTE: package time-1.7-r1: task do_unpack: Succeeded
NOTE: Running task 722 of 5581 (ID: 5411, virtual:native:/home/oe/openembedded/recipes/xorg-util/makedepend_1.0.3.bb, do_unpack)
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_unpack: Started
NOTE: Running task 723 of 5581 (ID: 5397, /home/oe/openembedded/recipes/dri/libdrm_2.4.25.bb, do_unpack)
NOTE: Running task 724 of 5581 (ID: 5377, /home/oe/openembedded/recipes/talloc/talloc_2.0.1.bb, do_setscene)
NOTE: Unpacking ../sources/makedepend-1.0.3.tar.gz to tmp/work/x86_64-linux/makedepend-native-1_1.0.3-r4.0/
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_unpack: Succeeded
NOTE: package libdrm-2.4.25-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libdrm-2.4.25.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libdrm-2.4.25-r0/
NOTE: package talloc-2.0.1-r1: task do_setscene: Started
NOTE: package dri2proto-2.4-r2.1: task do_setscene: Succeeded
NOTE: Running task 725 of 5581 (ID: 5363, /home/oe/openembedded/recipes/xorg-lib/libxxf86vm_1.1.1.bb, do_setscene)
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_setscene: Started
NOTE: package libdrm-2.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 726 of 5581 (ID: 5390, /home/oe/openembedded/recipes/xorg-proto/dri2proto_2.4.bb, do_fetch)
NOTE: package talloc-2.0.1-r1: task do_setscene: Succeeded
NOTE: package dri2proto-2.4-r2.1: task do_fetch: Started
NOTE: package dri2proto-2.4-r2.1: task do_fetch: Succeeded
NOTE: Running task 727 of 5581 (ID: 5349, /home/oe/openembedded/recipes/xorg-proto/glproto_1.4.13.bb, do_setscene)
NOTE: Running task 728 of 5581 (ID: 5376, /home/oe/openembedded/recipes/talloc/talloc_2.0.1.bb, do_fetch)
NOTE: package glproto-1_1.4.13-r2.1: task do_setscene: Started
NOTE: package talloc-2.0.1-r1: task do_fetch: Started
NOTE: package talloc-2.0.1-r1: task do_fetch: Succeeded
NOTE: Running task 729 of 5581 (ID: 5383, /home/oe/openembedded/recipes/xorg-proto/dri2proto_2.4.bb, do_unpack)
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_setscene: Succeeded
NOTE: package dri2proto-2.4-r2.1: task do_unpack: Started
NOTE: Unpacking ../sources/dri2proto-2.4.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/dri2proto-2.4-r2.1/
NOTE: package dri2proto-2.4-r2.1: task do_unpack: Succeeded
NOTE: Running task 730 of 5581 (ID: 5369, /home/oe/openembedded/recipes/talloc/talloc_2.0.1.bb, do_unpack)
NOTE: Running task 731 of 5581 (ID: 5362, /home/oe/openembedded/recipes/xorg-lib/libxxf86vm_1.1.1.bb, do_fetch)
NOTE: package talloc-2.0.1-r1: task do_unpack: Started
NOTE: package glproto-1_1.4.13-r2.1: task do_setscene: Succeeded
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_fetch: Started
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_fetch: Succeeded
NOTE: Running task 732 of 5581 (ID: 5335, /home/oe/openembedded/recipes/xorg-proto/xf86driproto_2.1.1.bb, do_setscene)
NOTE: Unpacking ../sources/talloc-2.0.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/talloc-2.0.1-r1/
NOTE: package talloc-2.0.1-r1: task do_unpack: Succeeded
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_setscene: Started
NOTE: Running task 733 of 5581 (ID: 5348, /home/oe/openembedded/recipes/xorg-proto/glproto_1.4.13.bb, do_fetch)
NOTE: Running task 734 of 5581 (ID: 3120, /home/oe/openembedded/recipes/xorg-lib/libxdamage_1.1.3.bb, do_patch)
NOTE: package glproto-1_1.4.13-r2.1: task do_fetch: Started
NOTE: package libxdamage-1_1.1.3-r9.0: task do_patch: Started
NOTE: Running task 735 of 5581 (ID: 5355, /home/oe/openembedded/recipes/xorg-lib/libxxf86vm_1.1.1.bb, do_unpack)
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXxf86vm-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxxf86vm-1_1.1.1-r9.0/
NOTE: package libxdamage-1_1.1.3-r9.0: task do_patch: Succeeded
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_unpack: Succeeded
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 736 of 5581 (ID: 5334, /home/oe/openembedded/recipes/xorg-proto/xf86driproto_2.1.1.bb, do_fetch)
NOTE: Running task 737 of 5581 (ID: 62, virtual:native:/home/oe/openembedded/recipes/fakeroot/fakeroot_1.15.1.bb, do_patch)
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_fetch: Started
NOTE: package fakeroot-native-1.15.1-r0.0: task do_patch: Started
NOTE: Applying patch 'quiet-getopt-check.patch' (../openembedded/recipes/fakeroot/fakeroot-1.15.1/quiet-getopt-check.patch)
NOTE: Running task 738 of 5581 (ID: 482, /home/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb, do_patch)
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_fetch: Succeeded
NOTE: package glproto-1_1.4.13-r2.1: task do_fetch: Succeeded
NOTE: Applying patch 'configure-libtool.patch' (../openembedded/recipes/fakeroot/files/configure-libtool.patch)
NOTE: package libxml2-2.7.8-r9.1: task do_patch: Started
NOTE: Applying patch '0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch)
NOTE: Applying patch 'df83c17e5a2646bd923f75e5e507bc80d73c9722.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/df83c17e5a2646bd923f75e5e507bc80d73c9722.patch)
NOTE: Running task 739 of 5581 (ID: 5341, /home/oe/openembedded/recipes/xorg-proto/glproto_1.4.13.bb, do_unpack)
NOTE: Running task 740 of 5581 (ID: 5327, /home/oe/openembedded/recipes/xorg-proto/xf86driproto_2.1.1.bb, do_unpack)
NOTE: package fakeroot-native-1.15.1-r0.0: task do_patch: Succeeded
NOTE: Applying patch 'fec31bcd452e77c10579467ca87a785b41115de6.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/fec31bcd452e77c10579467ca87a785b41115de6.patch)
NOTE: Applying patch '00819877651b87842ed878898ba17dba489820f0.patch' (../openembedded/recipes/libxml/libxml2-2.7.8/00819877651b87842ed878898ba17dba489820f0.patch)
NOTE: package glproto-1_1.4.13-r2.1: task do_unpack: Started
NOTE: Unpacking ../sources/glproto-1.4.13.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/glproto-1_1.4.13-r2.1/
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xf86driproto-2.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xf86driproto-1_2.1.1-r2.0/
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_unpack: Succeeded
NOTE: package glproto-1_1.4.13-r2.1: task do_unpack: Succeeded
NOTE: Running task 741 of 5581 (ID: 4225, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxext_1.3.0.bb, do_patch)
NOTE: Running task 742 of 5581 (ID: 5453, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb, do_removebinaries)
NOTE: package libxext-native-1_1.3.0-r9.0: task do_patch: Started
NOTE: package libxext-native-1_1.3.0-r9.0: task do_patch: Succeeded
NOTE: package avalon-framework-api-native-4.3-r1: task do_removebinaries: Started
NOTE: package avalon-framework-api-native-4.3-r1: task do_removebinaries: Succeeded
NOTE: Running task 743 of 5581 (ID: 4132, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_setscene)
NOTE: package libxml2-2.7.8-r9.1: task do_patch: Succeeded
NOTE: package commons-logging-native-1.1.1-r0: task do_setscene: Started
NOTE: Running task 744 of 5581 (ID: 2081, /home/oe/openembedded/recipes/readline/readline_5.2.bb, do_setscene)
NOTE: Running task 745 of 5581 (ID: 3639, /home/oe/openembedded/recipes/libogg/libogg_1.1.4.bb, do_patch)
NOTE: package readline-5.2-r8: task do_setscene: Started
NOTE: package libogg-1.1.4-r4.0: task do_patch: Started
NOTE: package libogg-1.1.4-r4.0: task do_patch: Succeeded
NOTE: Running task 746 of 5581 (ID: 5455, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb, do_patch)
NOTE: package avalon-framework-api-native-4.3-r1: task do_patch: Started
NOTE: package commons-logging-native-1.1.1-r0: task do_setscene: Succeeded
NOTE: Running task 747 of 5581 (ID: 2445, /home/oe/openembedded/recipes/cups/cups_1.4.6.bb, do_setscene)
NOTE: package cups-1.4.6-r0: task do_setscene: Started
NOTE: package readline-5.2-r8: task do_setscene: Succeeded
NOTE: package avalon-framework-api-native-4.3-r1: task do_patch: Succeeded
NOTE: Running task 748 of 5581 (ID: 4131, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_fetch)
NOTE: package commons-logging-native-1.1.1-r0: task do_fetch: Started
NOTE: Running task 749 of 5581 (ID: 2080, /home/oe/openembedded/recipes/readline/readline_5.2.bb, do_fetch)
NOTE: package commons-logging-native-1.1.1-r0: task do_fetch: Succeeded
NOTE: package cups-1.4.6-r0: task do_setscene: Succeeded
NOTE: package readline-5.2-r8: task do_fetch: Started
NOTE: package readline-5.2-r8: task do_fetch: Succeeded
NOTE: Running task 750 of 5581 (ID: 4520, /home/oe/openembedded/recipes/xorg-proto/compositeproto_0.4.2.bb, do_patch)
NOTE: package compositeproto-1_0.4.2-r2.0: task do_patch: Started
NOTE: package compositeproto-1_0.4.2-r2.0: task do_patch: Succeeded
NOTE: Running task 751 of 5581 (ID: 2444, /home/oe/openembedded/recipes/cups/cups_1.4.6.bb, do_fetch)
NOTE: Running task 752 of 5581 (ID: 4124, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_unpack)
NOTE: package cups-1.4.6-r0: task do_fetch: Started
NOTE: package commons-logging-native-1.1.1-r0: task do_unpack: Started
NOTE: Running task 753 of 5581 (ID: 2073, /home/oe/openembedded/recipes/readline/readline_5.2.bb, do_unpack)
NOTE: Running task 754 of 5581 (ID: 601, /home/oe/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_setscene)
NOTE: Unpacking ../sources/commons-logging-1.1.1-src.tar.gz to tmp/work/x86_64-linux/commons-logging-native-1.1.1-r0/
NOTE: package commons-logging-native-1.1.1-r0: task do_unpack: Succeeded
NOTE: package cups-1.4.6-r0: task do_fetch: Succeeded
NOTE: package readline-5.2-r8: task do_unpack: Started
NOTE: Unpacking ../sources/readline-5.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/readline-5.2-r8/
NOTE: Unpacking ../openembedded/recipes/readline/readline-5.2/acinclude.m4 to tmp/work/armv5te-angstrom-linux-gnueabi/readline-5.2-r8/
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_setscene: Started
NOTE: package readline-5.2-r8: task do_unpack: Succeeded
NOTE: Running task 755 of 5581 (ID: 2929, /home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_setscene)
NOTE: package jaxp1.3-1.3.04-r1: task do_setscene: Started
NOTE: Running task 756 of 5581 (ID: 2437, /home/oe/openembedded/recipes/cups/cups_1.4.6.bb, do_unpack)
NOTE: package cups-1.4.6-r0: task do_unpack: Started
NOTE: Unpacking ../sources/cups-1.4.6-source.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/cups-1.4.6-r0/
NOTE: Running task 757 of 5581 (ID: 4604, virtual:native:/home/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb, do_patch)
NOTE: package libgcrypt-native-1.4.1-r0: task do_patch: Started
NOTE: Applying patch 'add-pkgconfig-support.patch' (../openembedded/recipes/libgcrypt/libgcrypt-1.4.1/add-pkgconfig-support.patch)
NOTE: Applying patch 'mips-h-constraint.patch' (../openembedded/recipes/libgcrypt/files/mips-h-constraint.patch)
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_setscene: Succeeded
NOTE: package jaxp1.3-1.3.04-r1: task do_setscene: Succeeded
NOTE: Running task 758 of 5581 (ID: 600, /home/oe/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_fetch)
NOTE: package libgcrypt-native-1.4.1-r0: task do_patch: Succeeded
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_fetch: Started
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_fetch: Succeeded
NOTE: Running task 759 of 5581 (ID: 2928, /home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_fetch)
NOTE: package jaxp1.3-1.3.04-r1: task do_fetch: Started
NOTE: Running task 760 of 5581 (ID: 4590, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb, do_patch)
NOTE: package jaxp1.3-1.3.04-r1: task do_fetch: Succeeded
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_patch: Started
NOTE: package libxrender-native-1_0.9.6-r9.0: task do_patch: Succeeded
NOTE: Running task 761 of 5581 (ID: 593, /home/oe/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_unpack)
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_unpack: Started
NOTE: Unpacking ../sources/tiff-4.0.0beta6.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/tiff-3.9.4+4.0.0beta6-r1/
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_unpack: Succeeded
NOTE: Running task 762 of 5581 (ID: 2921, /home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_unpack)
NOTE: package jaxp1.3-1.3.04-r1: task do_unpack: Started
NOTE: Unpacking ../sources/xml-commons-external-1.3.04-src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/jaxp1.3-1.3.04-r1/jaxp1.3-1.3.04/
NOTE: package jaxp1.3-1.3.04-r1: task do_unpack: Succeeded
NOTE: Running task 763 of 5581 (ID: 4562, virtual:native:/home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_patch)
NOTE: package pango-native-1.28.3-r1.0: task do_patch: Started
NOTE: Applying patch 'no-tests.patch' (../openembedded/recipes/pango/pango-1.28.3/no-tests.patch)
NOTE: Running task 764 of 5581 (ID: 4548, virtual:native:/home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_patch)
NOTE: package atk-native-1.30.0-r1: task do_patch: Started
NOTE: package atk-native-1.30.0-r1: task do_patch: Succeeded
NOTE: Running task 765 of 5581 (ID: 3169, virtual:native:/home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_setscene)
NOTE: package pango-native-1.28.3-r1.0: task do_patch: Succeeded
NOTE: Unpacking ../openembedded/recipes/cups/cups-1.4.6/textonly.ppd to tmp/work/armv5te-angstrom-linux-gnueabi/cups-1.4.6-r0/
NOTE: package gtk+-native-2.20.1-r10.4: task do_setscene: Started
NOTE: Running task 766 of 5581 (ID: 3155, /home/oe/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_setscene)
NOTE: package gtk+-native-2.20.1-r10.4: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/cups/cups-1.4.6/textonly to tmp/work/armv5te-angstrom-linux-gnueabi/cups-1.4.6-r0/
NOTE: Unpacking ../openembedded/recipes/cups/cups-1.4.6/text.convs to tmp/work/armv5te-angstrom-linux-gnueabi/cups-1.4.6-r0/
NOTE: package cups-1.4.6-r0: task do_unpack: Succeeded
NOTE: package jasper-1.900.1-r1: task do_setscene: Started
NOTE: Running task 767 of 5581 (ID: 3141, /home/oe/openembedded/recipes/xorg-lib/libxcomposite_0.4.3.bb, do_setscene)
NOTE: Running task 768 of 5581 (ID: 3071, /home/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.11.bb, do_setscene)
NOTE: package libxcursor-1_1.1.11-r9.0: task do_setscene: Started
NOTE: Running task 769 of 5581 (ID: 3168, virtual:native:/home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_fetch)
NOTE: package gtk+-native-2.20.1-r10.4: task do_fetch: Started
NOTE: package jasper-1.900.1-r1: task do_setscene: Succeeded
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_setscene: Started
NOTE: Running task 770 of 5581 (ID: 3154, /home/oe/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_fetch)
NOTE: package jasper-1.900.1-r1: task do_fetch: Started
NOTE: package libxcursor-1_1.1.11-r9.0: task do_setscene: Succeeded
NOTE: package gtk+-native-2.20.1-r10.4: task do_fetch: Succeeded
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_setscene: Succeeded
NOTE: package jasper-1.900.1-r1: task do_fetch: Succeeded
NOTE: Running task 771 of 5581 (ID: 3140, /home/oe/openembedded/recipes/xorg-lib/libxcomposite_0.4.3.bb, do_fetch)
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_fetch: Started
NOTE: Running task 772 of 5581 (ID: 3070, /home/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.11.bb, do_fetch)
NOTE: package libxcursor-1_1.1.11-r9.0: task do_fetch: Started
NOTE: Running task 773 of 5581 (ID: 3161, virtual:native:/home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_unpack)
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_fetch: Succeeded
NOTE: package libxcursor-1_1.1.11-r9.0: task do_fetch: Succeeded
NOTE: package gtk+-native-2.20.1-r10.4: task do_unpack: Started
NOTE: Unpacking ../sources/gtk+-2.20.1.tar.bz2 to tmp/work/x86_64-linux/gtk+-native-2.20.1-r10.4/
NOTE: Running task 774 of 5581 (ID: 3147, /home/oe/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_unpack)
NOTE: package jasper-1.900.1-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jasper-1.900.1.zip to tmp/work/armv5te-angstrom-linux-gnueabi/jasper-1.900.1-r1/
NOTE: package jasper-1.900.1-r1: task do_unpack: Succeeded
NOTE: Running task 775 of 5581 (ID: 3133, /home/oe/openembedded/recipes/xorg-lib/libxcomposite_0.4.3.bb, do_unpack)
NOTE: Running task 776 of 5581 (ID: 3063, /home/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.11.bb, do_unpack)
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_unpack: Started
NOTE: package libxcursor-1_1.1.11-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXcursor-1.1.11.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxcursor-1_1.1.11-r9.0/
NOTE: Running task 777 of 5581 (ID: 3043, /home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_setscene)
NOTE: Unpacking ../sources/libXcomposite-0.4.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxcomposite-1_0.4.3-r9.0/
NOTE: package libxcursor-1_1.1.11-r9.0: task do_unpack: Succeeded
NOTE: package atk-1.30.0-r1: task do_setscene: Started
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_unpack: Succeeded
NOTE: Running task 778 of 5581 (ID: 5540, /home/oe/openembedded/recipes/jamvm/jamvm-initial_1.4.5.bb, do_patch)
NOTE: package atk-1.30.0-r1: task do_setscene: Succeeded
NOTE: package jamvm-initial-1.4.5-r3: task do_patch: Started
NOTE: Applying patch 'jamvm_1.4.5-initial.patch' (../openembedded/recipes/jamvm/files/jamvm_1.4.5-initial.patch)
NOTE: Running task 779 of 5581 (ID: 1913, /home/oe/openembedded/recipes/popt/popt_1.14.bb, do_setscene)
NOTE: package jamvm-initial-1.4.5-r3: task do_patch: Succeeded
NOTE: package popt-1.14-r3.0: task do_setscene: Started
NOTE: package popt-1.14-r3.0: task do_setscene: Succeeded
NOTE: Running task 780 of 5581 (ID: 3042, /home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_fetch)
NOTE: Running task 781 of 5581 (ID: 4773, /home/oe/openembedded/recipes/cmake/cmake-native_2.8.3.bb, do_patch)
NOTE: package atk-1.30.0-r1: task do_fetch: Started
NOTE: package atk-1.30.0-r1: task do_fetch: Succeeded
NOTE: package cmake-native-2.8.3-r2.0: task do_patch: Started
NOTE: Applying patch 'support-oe-qt4-tools-names.patch' (../openembedded/recipes/cmake/cmake-2.8.3/support-oe-qt4-tools-names.patch)
NOTE: Running task 782 of 5581 (ID: 1912, /home/oe/openembedded/recipes/popt/popt_1.14.bb, do_fetch)
NOTE: package popt-1.14-r3.0: task do_fetch: Started
NOTE: package popt-1.14-r3.0: task do_fetch: Succeeded
NOTE: Running task 783 of 5581 (ID: 3035, /home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_unpack)
NOTE: package atk-1.30.0-r1: task do_unpack: Started
NOTE: Unpacking ../sources/atk-1.30.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/atk-1.30.0-r1/
NOTE: Running task 784 of 5581 (ID: 1905, /home/oe/openembedded/recipes/popt/popt_1.14.bb, do_unpack)
NOTE: package cmake-native-2.8.3-r2.0: task do_patch: Succeeded
NOTE: package popt-1.14-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/popt-1.14.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/popt-1.14-r3.0/
NOTE: package popt-1.14-r3.0: task do_unpack: Succeeded
NOTE: Running task 785 of 5581 (ID: 3947, virtual:native:/home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_setscene)
NOTE: package xalan-j-native-2.7.1-r4: task do_setscene: Started
NOTE: Running task 786 of 5581 (ID: 363, /home/oe/openembedded/recipes/liboil/liboil_0.3.17.bb, do_setscene)
NOTE: package liboil-0.3.17-r1: task do_setscene: Started
NOTE: package atk-1.30.0-r1: task do_unpack: Succeeded
NOTE: package xalan-j-native-2.7.1-r4: task do_setscene: Succeeded
NOTE: package liboil-0.3.17-r1: task do_setscene: Succeeded
NOTE: Running task 787 of 5581 (ID: 4765, /home/oe/openembedded/recipes/libdiscid/libdiscid_0.2.2.bb, do_setscene)
NOTE: package libdiscid-0.2.2-r0: task do_setscene: Started
NOTE: Running task 788 of 5581 (ID: 3946, virtual:native:/home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_fetch)
NOTE: package xalan-j-native-2.7.1-r4: task do_fetch: Started
NOTE: Running task 789 of 5581 (ID: 362, /home/oe/openembedded/recipes/liboil/liboil_0.3.17.bb, do_fetch)
NOTE: package liboil-0.3.17-r1: task do_fetch: Started
NOTE: package libdiscid-0.2.2-r0: task do_setscene: Succeeded
NOTE: package xalan-j-native-2.7.1-r4: task do_fetch: Succeeded
NOTE: package liboil-0.3.17-r1: task do_fetch: Succeeded
NOTE: Running task 790 of 5581 (ID: 4764, /home/oe/openembedded/recipes/libdiscid/libdiscid_0.2.2.bb, do_fetch)
NOTE: package libdiscid-0.2.2-r0: task do_fetch: Started
NOTE: Running task 791 of 5581 (ID: 3939, virtual:native:/home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_unpack)
NOTE: package libdiscid-0.2.2-r0: task do_fetch: Succeeded
NOTE: package xalan-j-native-2.7.1-r4: task do_unpack: Started
NOTE: Unpacking ../sources/xalan-j_2_7_1-src.tar.gz to tmp/work/x86_64-linux/xalan-j-native-2.7.1-r4/
NOTE: Running task 792 of 5581 (ID: 355, /home/oe/openembedded/recipes/liboil/liboil_0.3.17.bb, do_unpack)
NOTE: package liboil-0.3.17-r1: task do_unpack: Started
NOTE: Unpacking ../sources/liboil-0.3.17.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/liboil-0.3.17-r1/
NOTE: package liboil-0.3.17-r1: task do_unpack: Succeeded
NOTE: Running task 793 of 5581 (ID: 4757, /home/oe/openembedded/recipes/libdiscid/libdiscid_0.2.2.bb, do_unpack)
NOTE: package libdiscid-0.2.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/bsf-src-2.4.0.tar.gz to tmp/work/x86_64-linux/xalan-j-native-2.7.1-r4/
NOTE: package xalan-j-native-2.7.1-r4: task do_unpack: Succeeded
NOTE: Unpacking ../sources/libdiscid-0.2.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libdiscid-0.2.2-r0/
NOTE: package libdiscid-0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 5581 (ID: 3702, /home/oe/openembedded/recipes/libid3tag/libid3tag_0.15.1b.bb, do_setscene)
NOTE: Running task 795 of 5581 (ID: 4015, virtual:native:/home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_removebinaries)
NOTE: package libid3tag-0.15.1b-r3: task do_setscene: Started
NOTE: package bcel-native-5.2-r1: task do_removebinaries: Started
NOTE: Running task 796 of 5581 (ID: 3428, virtual:native:/home/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb, do_patch)
NOTE: package libxml-parser-perl-native-2.36-r4: task do_patch: Started
NOTE: package libxml-parser-perl-native-2.36-r4: task do_patch: Succeeded
NOTE: package bcel-native-5.2-r1: task do_removebinaries: Succeeded
NOTE: package libid3tag-0.15.1b-r3: task do_setscene: Succeeded
NOTE: Running task 797 of 5581 (ID: 3701, /home/oe/openembedded/recipes/libid3tag/libid3tag_0.15.1b.bb, do_fetch)
NOTE: package libid3tag-0.15.1b-r3: task do_fetch: Started
NOTE: Running task 798 of 5581 (ID: 4017, virtual:native:/home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_patch)
NOTE: package libid3tag-0.15.1b-r3: task do_fetch: Succeeded
NOTE: Running task 799 of 5581 (ID: 2333, /home/oe/openembedded/recipes/intltool/intltool-native_0.40.3.bb, do_setscene)
NOTE: package bcel-native-5.2-r1: task do_patch: Started
NOTE: package bcel-native-5.2-r1: task do_patch: Succeeded
NOTE: package intltool-native-0.40.3-r4.0: task do_setscene: Started
NOTE: Running task 800 of 5581 (ID: 2354, /home/oe/openembedded/recipes/alsa/alsa-lib_1.0.24.1.bb, do_patch)
NOTE: package alsa-lib-1.0.24.1-r0: task do_patch: Started
NOTE: Applying patch 'fix-tstamp-declaration.patch' (../openembedded/recipes/alsa/alsa-lib/fix-tstamp-declaration.patch)
NOTE: Running task 801 of 5581 (ID: 3694, /home/oe/openembedded/recipes/libid3tag/libid3tag_0.15.1b.bb, do_unpack)
NOTE: package libid3tag-0.15.1b-r3: task do_unpack: Started
NOTE: Unpacking ../sources/libid3tag-0.15.1b.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libid3tag-0.15.1b-r3/
NOTE: package libid3tag-0.15.1b-r3: task do_unpack: Succeeded
NOTE: Applying patch 'fix_libmath.patch' (../openembedded/recipes/alsa/alsa-lib/fix_libmath.patch)
NOTE: package alsa-lib-1.0.24.1-r0: task do_patch: Succeeded
NOTE: Running task 802 of 5581 (ID: 3243, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_package)
NOTE: package intltool-native-0.40.3-r4.0: task do_setscene: Succeeded
NOTE: package xorg-headers-native-1.0-r2: task do_package: Started
NOTE: package xorg-headers-native-1.0-r2: task do_package: Succeeded
NOTE: Running task 803 of 5581 (ID: 2332, /home/oe/openembedded/recipes/intltool/intltool-native_0.40.3.bb, do_fetch)
NOTE: package intltool-native-0.40.3-r4.0: task do_fetch: Started
NOTE: Running task 804 of 5581 (ID: 5258, /home/oe/openembedded/recipes/libidl/libidl-native_0.8.13.bb, do_patch)
NOTE: package intltool-native-0.40.3-r4.0: task do_fetch: Succeeded
NOTE: package libidl-native-0.8.13-r1: task do_patch: Started
NOTE: package libidl-native-0.8.13-r1: task do_patch: Succeeded
NOTE: Running task 805 of 5581 (ID: 3106, /home/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.1.bb, do_patch)
NOTE: package libxrandr-1_1.3.1-r9.0: task do_patch: Started
NOTE: package libxrandr-1_1.3.1-r9.0: task do_patch: Succeeded
NOTE: Running task 806 of 5581 (ID: 2325, /home/oe/openembedded/recipes/intltool/intltool-native_0.40.3.bb, do_unpack)
NOTE: Running task 807 of 5581 (ID: 3022, /home/oe/openembedded/recipes/pango/pango_1.28.3.bb, do_patch)
NOTE: package intltool-native-0.40.3-r4.0: task do_unpack: Started
NOTE: Running task 808 of 5581 (ID: 4176, virtual:native:/home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_setscene)
NOTE: package pango-1.28.3-r1.0: task do_patch: Started
NOTE: Applying patch 'no-tests.patch' (../openembedded/recipes/pango/pango-1.28.3/no-tests.patch)
NOTE: Unpacking ../sources/intltool-0.40.3.tar.bz2 to tmp/work/x86_64-linux/intltool-native-0.40.3-r4.0/
NOTE: package intltool-native-0.40.3-r4.0: task do_unpack: Succeeded
NOTE: package rhino-native-1.7r1-r1: task do_setscene: Started
NOTE: Running task 809 of 5581 (ID: 5426, /home/oe/openembedded/recipes/time/time_1.7.bb, do_patch)
NOTE: package pango-1.28.3-r1.0: task do_patch: Succeeded
NOTE: package time-1.7-r1: task do_patch: Started
NOTE: Applying patch 'debian.patch' (../openembedded/recipes/time/files/debian.patch)
NOTE: Running task 810 of 5581 (ID: 5412, virtual:native:/home/oe/openembedded/recipes/xorg-util/makedepend_1.0.3.bb, do_patch)
NOTE: package rhino-native-1.7r1-r1: task do_setscene: Succeeded
NOTE: package time-1.7-r1: task do_patch: Succeeded
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_patch: Started
NOTE: package makedepend-native-1_1.0.3-r4.0: task do_patch: Succeeded
NOTE: Running task 811 of 5581 (ID: 4175, virtual:native:/home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_fetch)
NOTE: package rhino-native-1.7r1-r1: task do_fetch: Started
NOTE: Running task 812 of 5581 (ID: 5398, /home/oe/openembedded/recipes/dri/libdrm_2.4.25.bb, do_patch)
NOTE: package rhino-native-1.7r1-r1: task do_fetch: Succeeded
NOTE: package libdrm-2.4.25-r0: task do_patch: Started
NOTE: Running task 813 of 5581 (ID: 5384, /home/oe/openembedded/recipes/xorg-proto/dri2proto_2.4.bb, do_patch)
NOTE: package dri2proto-2.4-r2.1: task do_patch: Started
NOTE: package gtk+-native-2.20.1-r10.4: task do_unpack: Succeeded
NOTE: Applying patch 'installtests.patch' (../openembedded/recipes/dri/libdrm-2.4.25/installtests.patch)
NOTE: Applying patch 'glamo.patch' (../openembedded/recipes/dri/libdrm-2.4.25/glamo.patch)
NOTE: package libdrm-2.4.25-r0: task do_patch: Succeeded
NOTE: Applying patch 'f3c211e1ae183dab5c7529814c9f42af2c29fc6c.patch' (../openembedded/recipes/xorg-proto/dri2proto-2.4/f3c211e1ae183dab5c7529814c9f42af2c29fc6c.patch)
NOTE: package dri2proto-2.4-r2.1: task do_patch: Succeeded
NOTE: Running task 814 of 5581 (ID: 5370, /home/oe/openembedded/recipes/talloc/talloc_2.0.1.bb, do_patch)
NOTE: Running task 815 of 5581 (ID: 4168, virtual:native:/home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_unpack)
NOTE: package talloc-2.0.1-r1: task do_patch: Started
NOTE: package rhino-native-1.7r1-r1: task do_unpack: Started
NOTE: Running task 816 of 5581 (ID: 5356, /home/oe/openembedded/recipes/xorg-lib/libxxf86vm_1.1.1.bb, do_patch)
NOTE: Unpacking ../sources/rhino1_7R1.zip to tmp/work/x86_64-linux/rhino-native-1.7r1-r1/
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_patch: Started
NOTE: package libxxf86vm-1_1.1.1-r9.0: task do_patch: Succeeded
NOTE: Running task 817 of 5581 (ID: 5342, /home/oe/openembedded/recipes/xorg-proto/glproto_1.4.13.bb, do_patch)
NOTE: package glproto-1_1.4.13-r2.1: task do_patch: Started
NOTE: package talloc-2.0.1-r1: task do_patch: Succeeded
NOTE: Unpacking ../openembedded/recipes/mozilla/rhino/rhino to tmp/work/x86_64-linux/rhino-native-1.7r1-r1/
NOTE: Running task 818 of 5581 (ID: 5328, /home/oe/openembedded/recipes/xorg-proto/xf86driproto_2.1.1.bb, do_patch)
NOTE: Unpacking ../openembedded/recipes/mozilla/rhino/rhino-jsc to tmp/work/x86_64-linux/rhino-native-1.7r1-r1/
NOTE: package rhino-native-1.7r1-r1: task do_unpack: Succeeded
NOTE: Applying patch '7196c9441af941be74180f8e8d4e10a08659b80f.patch' (../openembedded/recipes/xorg-proto/glproto-1.4.13/7196c9441af941be74180f8e8d4e10a08659b80f.patch)
NOTE: package glproto-1_1.4.13-r2.1: task do_patch: Succeeded
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_patch: Started
NOTE: package xf86driproto-1_2.1.1-r2.0: task do_patch: Succeeded
NOTE: Running task 819 of 5581 (ID: 4887, /home/oe/openembedded/recipes/cup/cup-native_0.10k.bb, do_removebinaries)
NOTE: package cup-native-0.10k-r1: task do_removebinaries: Started
NOTE: package cup-native-0.10k-r1: task do_removebinaries: Succeeded
NOTE: Running task 820 of 5581 (ID: 4872, /home/oe/openembedded/recipes/jlex/jlex-native_1.2.6.bb, do_removebinaries)
NOTE: Running task 821 of 5581 (ID: 4822, /home/oe/openembedded/recipes/xorg-proto/videoproto_2.3.1.bb, do_setscene)
NOTE: package jlex-native-1.2.6-r1: task do_removebinaries: Started
NOTE: Running task 822 of 5581 (ID: 4808, /home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_setscene)
NOTE: package videoproto-1_2.3.1-r2.0: task do_setscene: Started
NOTE: package orc-0.4.11-r0: task do_setscene: Started
NOTE: Running task 823 of 5581 (ID: 4889, /home/oe/openembedded/recipes/cup/cup-native_0.10k.bb, do_patch)
NOTE: package cup-native-0.10k-r1: task do_patch: Started
NOTE: package cup-native-0.10k-r1: task do_patch: Succeeded
NOTE: package jlex-native-1.2.6-r1: task do_removebinaries: Succeeded
NOTE: Running task 824 of 5581 (ID: 4794, virtual:native:/home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_setscene)
NOTE: package orc-native-0.4.11-r0: task do_setscene: Started
NOTE: Running task 825 of 5581 (ID: 4874, /home/oe/openembedded/recipes/jlex/jlex-native_1.2.6.bb, do_patch)
NOTE: package jlex-native-1.2.6-r1: task do_patch: Started
NOTE: package jlex-native-1.2.6-r1: task do_patch: Succeeded
NOTE: Running task 826 of 5581 (ID: 4758, /home/oe/openembedded/recipes/libdiscid/libdiscid_0.2.2.bb, do_patch)
NOTE: package videoproto-1_2.3.1-r2.0: task do_setscene: Succeeded
NOTE: package orc-0.4.11-r0: task do_setscene: Succeeded
NOTE: package orc-native-0.4.11-r0: task do_setscene: Succeeded
NOTE: package libdiscid-0.2.2-r0: task do_patch: Started
NOTE: package libdiscid-0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 827 of 5581 (ID: 4821, /home/oe/openembedded/recipes/xorg-proto/videoproto_2.3.1.bb, do_fetch)
NOTE: Running task 828 of 5581 (ID: 4807, /home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_fetch)
NOTE: Running task 829 of 5581 (ID: 4793, virtual:native:/home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_fetch)
NOTE: package videoproto-1_2.3.1-r2.0: task do_fetch: Started
NOTE: package videoproto-1_2.3.1-r2.0: task do_fetch: Succeeded
NOTE: package orc-0.4.11-r0: task do_fetch: Started
NOTE: package orc-0.4.11-r0: task do_fetch: Succeeded
NOTE: package orc-native-0.4.11-r0: task do_fetch: Started
NOTE: package orc-native-0.4.11-r0: task do_fetch: Succeeded
NOTE: Running task 830 of 5581 (ID: 4751, /home/oe/openembedded/recipes/neon/neon_0.25.5.bb, do_setscene)
NOTE: package neon-0.25.5-r4: task do_setscene: Started
NOTE: Running task 831 of 5581 (ID: 4814, /home/oe/openembedded/recipes/xorg-proto/videoproto_2.3.1.bb, do_unpack)
NOTE: Running task 832 of 5581 (ID: 4800, /home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_unpack)
NOTE: package videoproto-1_2.3.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/videoproto-2.3.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/videoproto-1_2.3.1-r2.0/
NOTE: package neon-0.25.5-r4: task do_setscene: Succeeded
NOTE: package orc-0.4.11-r0: task do_unpack: Started
NOTE: Unpacking ../sources/orc-0.4.11.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/orc-0.4.11-r0/
NOTE: Running task 833 of 5581 (ID: 4786, virtual:native:/home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_unpack)
NOTE: package videoproto-1_2.3.1-r2.0: task do_unpack: Succeeded
NOTE: package orc-0.4.11-r0: task do_unpack: Succeeded
NOTE: package orc-native-0.4.11-r0: task do_unpack: Started
NOTE: Unpacking ../sources/orc-0.4.11.tar.gz to tmp/work/x86_64-linux/orc-native-0.4.11-r0/
NOTE: package orc-native-0.4.11-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 5581 (ID: 4750, /home/oe/openembedded/recipes/neon/neon_0.25.5.bb, do_fetch)
NOTE: package neon-0.25.5-r4: task do_fetch: Started
NOTE: Running task 835 of 5581 (ID: 4737, /home/oe/openembedded/recipes/tslib/tslib_1.0.bb, do_setscene)
NOTE: package tslib-1.0-r28.6: task do_setscene: Started
NOTE: Running task 836 of 5581 (ID: 4723, /home/oe/openembedded/recipes/mesa/mesa_7.10.bb, do_setscene)
NOTE: Running task 837 of 5581 (ID: 4387, /home/oe/openembedded/recipes/pkgconfig/pkgconfig_0.23.bb, do_setscene)
NOTE: package pkgconfig-0.23-r8.3: task do_setscene: Started
NOTE: package neon-0.25.5-r4: task do_fetch: Succeeded
NOTE: package mesa-2_7.10-r11.0: task do_setscene: Started
NOTE: Running task 838 of 5581 (ID: 4743, /home/oe/openembedded/recipes/neon/neon_0.25.5.bb, do_unpack)
NOTE: package neon-0.25.5-r4: task do_unpack: Started
NOTE: package tslib-1.0-r28.6: task do_setscene: Succeeded
NOTE: Unpacking ../sources/neon-0.25.5.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/neon-0.25.5-r4/
NOTE: package neon-0.25.5-r4: task do_unpack: Succeeded
NOTE: Running task 839 of 5581 (ID: 4736, /home/oe/openembedded/recipes/tslib/tslib_1.0.bb, do_fetch)
NOTE: package mesa-2_7.10-r11.0: task do_setscene: Succeeded
NOTE: package pkgconfig-0.23-r8.3: task do_setscene: Succeeded
NOTE: package tslib-1.0-r28.6: task do_fetch: Started
NOTE: package tslib-1.0-r28.6: task do_fetch: Succeeded
NOTE: Running task 840 of 5581 (ID: 4866, virtual:native:/home/oe/openembedded/recipes/jacl/jacl_1.4.1.bb, do_setscene)
NOTE: package jacl-native-1.4.1-r0: task do_setscene: Started
NOTE: Running task 841 of 5581 (ID: 4722, /home/oe/openembedded/recipes/mesa/mesa_7.10.bb, do_fetch)
NOTE: package mesa-2_7.10-r11.0: task do_fetch: Started
NOTE: Running task 842 of 5581 (ID: 4386, /home/oe/openembedded/recipes/pkgconfig/pkgconfig_0.23.bb, do_fetch)
NOTE: package pkgconfig-0.23-r8.3: task do_fetch: Started
NOTE: package pkgconfig-0.23-r8.3: task do_fetch: Succeeded
NOTE: Running task 843 of 5581 (ID: 4729, /home/oe/openembedded/recipes/tslib/tslib_1.0.bb, do_unpack)
NOTE: package tslib-1.0-r28.6: task do_unpack: Started
NOTE: package jacl-native-1.4.1-r0: task do_setscene: Succeeded
NOTE: package mesa-2_7.10-r11.0: task do_fetch: Succeeded
NOTE: Unpacking ../sources/tslib-1.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/tslib-1.0-r28.6/
NOTE: Unpacking ../openembedded/recipes/tslib/tslib/ts.conf to tmp/work/armv5te-angstrom-linux-gnueabi/tslib-1.0-r28.6/
NOTE: Unpacking ../openembedded/recipes/tslib/tslib/ts.conf-collie-2.4 to tmp/work/armv5te-angstrom-linux-gnueabi/tslib-1.0-r28.6/
NOTE: Unpacking ../openembedded/recipes/tslib/tslib/ts.conf-simpad-2.4 to tmp/work/armv5te-angstrom-linux-gnueabi/tslib-1.0-r28.6/
NOTE: Unpacking ../openembedded/recipes/tslib/tslib/tslib.sh to tmp/work/armv5te-angstrom-linux-gnueabi/tslib-1.0-r28.6/
NOTE: Running task 844 of 5581 (ID: 4865, virtual:native:/home/oe/openembedded/recipes/jacl/jacl_1.4.1.bb, do_fetch)
NOTE: package tslib-1.0-r28.6: task do_unpack: Succeeded
NOTE: Running task 845 of 5581 (ID: 4379, /home/oe/openembedded/recipes/pkgconfig/pkgconfig_0.23.bb, do_unpack)
NOTE: package jacl-native-1.4.1-r0: task do_fetch: Started
NOTE: package pkgconfig-0.23-r8.3: task do_unpack: Started
NOTE: Running task 846 of 5581 (ID: 4715, /home/oe/openembedded/recipes/mesa/mesa_7.10.bb, do_unpack)
NOTE: Running task 847 of 5581 (ID: 4851, virtual:native:/home/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb, do_setscene)
NOTE: package jacl-native-1.4.1-r0: task do_fetch: Succeeded
NOTE: Unpacking ../sources/pkg-config-0.23.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/pkgconfig-0.23-r8.3/
NOTE: Unpacking ../openembedded/recipes/pkgconfig/pkgconfig-0.23/glibconfig-sysdefs.h to tmp/work/armv5te-angstrom-linux-gnueabi/pkgconfig-0.23-r8.3/
NOTE: package pkgconfig-0.23-r8.3: task do_unpack: Succeeded
NOTE: package mesa-2_7.10-r11.0: task do_unpack: Started
NOTE: Unpacking ../sources/MesaLib-7.10.tar.bz2 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/mesa-2_7.10-r11.0/
NOTE: package jzlib-native-1.0.7-r0: task do_setscene: Started
NOTE: Running task 848 of 5581 (ID: 4858, virtual:native:/home/oe/openembedded/recipes/jacl/jacl_1.4.1.bb, do_unpack)
NOTE: Running task 849 of 5581 (ID: 4948, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb, do_removebinaries)
NOTE: package jacl-native-1.4.1-r0: task do_unpack: Started
NOTE: Unpacking ../sources/jacl1.4.1.tar.gz to tmp/work/x86_64-linux/jacl-native-1.4.1-r0/
NOTE: package logkit-native-1.2.2-r1: task do_removebinaries: Started
NOTE: package logkit-native-1.2.2-r1: task do_removebinaries: Succeeded
NOTE: package jzlib-native-1.0.7-r0: task do_setscene: Succeeded
NOTE: package jacl-native-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 5581 (ID: 4850, virtual:native:/home/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb, do_fetch)
NOTE: package jzlib-native-1.0.7-r0: task do_fetch: Started
NOTE: Running task 851 of 5581 (ID: 2074, /home/oe/openembedded/recipes/readline/readline_5.2.bb, do_patch)
NOTE: Running task 852 of 5581 (ID: 4950, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb, do_patch)
NOTE: package jzlib-native-1.0.7-r0: task do_fetch: Succeeded
NOTE: package readline-5.2-r8: task do_patch: Started
NOTE: Applying patch 'fix-includes.patch' (../openembedded/recipes/readline/readline-5.2/fix-includes.patch)
NOTE: package logkit-native-1.2.2-r1: task do_patch: Started
NOTE: package logkit-native-1.2.2-r1: task do_patch: Succeeded
NOTE: Running task 853 of 5581 (ID: 4843, virtual:native:/home/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb, do_unpack)
NOTE: package jzlib-native-1.0.7-r0: task do_unpack: Started
NOTE: Unpacking ../sources/jzlib-1.0.7.tar.gz to tmp/work/x86_64-linux/jzlib-native-1.0.7-r0/
NOTE: package jzlib-native-1.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 5581 (ID: 2438, /home/oe/openembedded/recipes/cups/cups_1.4.6.bb, do_patch)
NOTE: package cups-1.4.6-r0: task do_patch: Started
NOTE: Applying patch 'configure_fix.patch' (../openembedded/recipes/readline/readline-5.2/configure_fix.patch)
NOTE: Applying patch 'use_echo_only_in_init.patch' (../openembedded/recipes/cups/cups-1.4.6/use_echo_only_in_init.patch)
NOTE: Applying patch 'skip_tools.patch' (../openembedded/recipes/cups/cups-1.4.6/skip_tools.patch)
NOTE: Applying patch 'darwin.patch' (../openembedded/recipes/readline/darwin.patch)
NOTE: Running task 855 of 5581 (ID: 594, /home/oe/openembedded/recipes/libtiff/tiff_3.9.4.bb, do_patch)
NOTE: Applying patch 'configure.patch' (../openembedded/recipes/cups/cups-1.4.6/configure.patch)
NOTE: package cups-1.4.6-r0: task do_patch: Succeeded
NOTE: package readline-5.2-r8: task do_patch: Succeeded
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_patch: Started
NOTE: Applying patch 'tiff-lp589145.diff' (../openembedded/recipes/libtiff/tiff-3.9.4+4.0.0beta6/tiff-lp589145.diff)
NOTE: Applying patch 'tiff-ojpeg-null-stripbytecount.diff' (../openembedded/recipes/libtiff/tiff-3.9.4+4.0.0beta6/tiff-ojpeg-null-stripbytecount.diff)
NOTE: package tiff-3.9.4+4.0.0beta6-r1: task do_patch: Succeeded
NOTE: Running task 856 of 5581 (ID: 3162, virtual:native:/home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_patch)
NOTE: package gtk+-native-2.20.1-r10.4: task do_patch: Started
NOTE: Running task 857 of 5581 (ID: 3148, /home/oe/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_patch)
NOTE: Running task 858 of 5581 (ID: 3134, /home/oe/openembedded/recipes/xorg-lib/libxcomposite_0.4.3.bb, do_patch)
NOTE: Applying patch 'hardcoded_libtool.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/hardcoded_libtool.patch)
NOTE: package jasper-1.900.1-r1: task do_patch: Started
NOTE: package jasper-1.900.1-r1: task do_patch: Succeeded
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_patch: Started
NOTE: package libxcomposite-1_0.4.3-r9.0: task do_patch: Succeeded
NOTE: Applying patch 'run-iconcache.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/run-iconcache.patch)
NOTE: Running task 859 of 5581 (ID: 3064, /home/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.11.bb, do_patch)
NOTE: Applying patch 'toggle-font.diff' (../openembedded/recipes/gtk+/gtk+-2.20.1/toggle-font.diff)
NOTE: package libxcursor-1_1.1.11-r9.0: task do_patch: Started
NOTE: package libxcursor-1_1.1.11-r9.0: task do_patch: Succeeded
NOTE: Running task 860 of 5581 (ID: 3036, /home/oe/openembedded/recipes/atk/atk_1.30.0.bb, do_patch)
NOTE: package atk-1.30.0-r1: task do_patch: Started
NOTE: package atk-1.30.0-r1: task do_patch: Succeeded
NOTE: Applying patch 'xsettings.patch' (../openembedded/recipes/gtk+/files/xsettings.patch)
NOTE: Running task 861 of 5581 (ID: 5468, /home/oe/openembedded/recipes/ecj/libecj-bootstrap_3.6.bb, do_unpackpost)
NOTE: package libecj-bootstrap-3.6-r0: task do_unpackpost: Started
NOTE: Running task 862 of 5581 (ID: 4971, /home/oe/openembedded/recipes/ecj/ecj-initial.bb, do_setscene)
NOTE: package ecj-initial-1.0-r2: task do_setscene: Started
NOTE: Applying patch 'no-demos.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/no-demos.patch)
NOTE: Applying patch 'gtk-dnd-grab-deadlock-fix.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/gtk-dnd-grab-deadlock-fix.patch)
NOTE: Applying patch 'cross-nm.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/cross-nm.patch)
NOTE: package libecj-bootstrap-3.6-r0: task do_unpackpost: Succeeded
NOTE: package mesa-2_7.10-r11.0: task do_unpack: Succeeded
NOTE: package ecj-initial-1.0-r2: task do_setscene: Succeeded
NOTE: Running task 863 of 5581 (ID: 1647, /home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_setscene)
NOTE: Applying patch 'xkb-ifdef.patch' (../openembedded/recipes/gtk+/files/xkb-ifdef.patch)
NOTE: Running task 864 of 5581 (ID: 5470, /home/oe/openembedded/recipes/ecj/libecj-bootstrap_3.6.bb, do_patch)
NOTE: package gtk+-native-2.20.1-r10.4: task do_patch: Succeeded
NOTE: Running task 865 of 5581 (ID: 4970, /home/oe/openembedded/recipes/ecj/ecj-initial.bb, do_fetch)
NOTE: package ecj-initial-1.0-r2: task do_fetch: Started
NOTE: package ecj-initial-1.0-r2: task do_fetch: Succeeded
NOTE: package libecj-bootstrap-3.6-r0: task do_patch: Started
NOTE: package libecj-bootstrap-3.6-r0: task do_patch: Succeeded
NOTE: package gtk+-2.20.1-r10.4: task do_setscene: Started
NOTE: Running task 866 of 5581 (ID: 1906, /home/oe/openembedded/recipes/popt/popt_1.14.bb, do_patch)
NOTE: package popt-1.14-r3.0: task do_patch: Started
NOTE: Running task 867 of 5581 (ID: 356, /home/oe/openembedded/recipes/liboil/liboil_0.3.17.bb, do_patch)
NOTE: Running task 868 of 5581 (ID: 4963, /home/oe/openembedded/recipes/ecj/ecj-initial.bb, do_unpack)
NOTE: package popt-1.14-r3.0: task do_patch: Succeeded
NOTE: package liboil-0.3.17-r1: task do_patch: Started
NOTE: Applying patch 'fix-unaligned-whitelist.patch' (../openembedded/recipes/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch)
NOTE: package ecj-initial-1.0-r2: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/ecj/files/ecj-initial.in to tmp/work/x86_64-linux/ecj-initial-1.0-r2/
NOTE: package ecj-initial-1.0-r2: task do_unpack: Succeeded
NOTE: package gtk+-2.20.1-r10.4: task do_setscene: Succeeded
NOTE: package liboil-0.3.17-r1: task do_patch: Succeeded
NOTE: Running task 869 of 5581 (ID: 1646, /home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_fetch)
NOTE: Running task 870 of 5581 (ID: 3695, /home/oe/openembedded/recipes/libid3tag/libid3tag_0.15.1b.bb, do_patch)
NOTE: package gtk+-2.20.1-r10.4: task do_fetch: Started
NOTE: package libid3tag-0.15.1b-r3: task do_patch: Started
NOTE: Running task 871 of 5581 (ID: 2690, /home/oe/openembedded/recipes/openssl/ocf-linux_20100325.bb, do_setscene)
NOTE: Applying patch 'libid3tag-pkg-config.patch' (../openembedded/recipes/libid3tag/files/libid3tag-pkg-config.patch)
NOTE: package ocf-linux-20100325-r2.0: task do_setscene: Started
NOTE: Running task 872 of 5581 (ID: 2109, /home/oe/openembedded/recipes/tcltk/tcl_8.5.8.bb, do_setscene)
NOTE: package gtk+-2.20.1-r10.4: task do_fetch: Succeeded
NOTE: package libid3tag-0.15.1b-r3: task do_patch: Succeeded
NOTE: package tcl-8.5.8-r9: task do_setscene: Started
NOTE: package ocf-linux-20100325-r2.0: task do_setscene: Succeeded
NOTE: Running task 873 of 5581 (ID: 3575, /home/oe/openembedded/recipes/musicbrainz/libmusicbrainz_3.0.2.bb, do_setscene)
NOTE: Running task 874 of 5581 (ID: 1639, /home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_unpack)
NOTE: package libmusicbrainz-3.0.2-r1: task do_setscene: Started
NOTE: package gtk+-2.20.1-r10.4: task do_unpack: Started
NOTE: Unpacking ../sources/gtk+-2.20.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gtk+-2.20.1-r10.4/
NOTE: Running task 875 of 5581 (ID: 2689, /home/oe/openembedded/recipes/openssl/ocf-linux_20100325.bb, do_fetch)
NOTE: package ocf-linux-20100325-r2.0: task do_fetch: Started
NOTE: package ocf-linux-20100325-r2.0: task do_fetch: Succeeded
NOTE: package tcl-8.5.8-r9: task do_setscene: Succeeded
NOTE: Running task 876 of 5581 (ID: 2108, /home/oe/openembedded/recipes/tcltk/tcl_8.5.8.bb, do_fetch)
NOTE: package tcl-8.5.8-r9: task do_fetch: Started
NOTE: Running task 877 of 5581 (ID: 2682, /home/oe/openembedded/recipes/openssl/ocf-linux_20100325.bb, do_unpack)
NOTE: package ocf-linux-20100325-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/ocf-linux-20100325.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/ocf-linux-20100325-r2.0/
NOTE: package ocf-linux-20100325-r2.0: task do_unpack: Succeeded
NOTE: package libmusicbrainz-3.0.2-r1: task do_setscene: Succeeded
NOTE: package tcl-8.5.8-r9: task do_fetch: Succeeded
NOTE: Running task 878 of 5581 (ID: 2095, /home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_setscene)
NOTE: Running task 879 of 5581 (ID: 3574, /home/oe/openembedded/recipes/musicbrainz/libmusicbrainz_3.0.2.bb, do_fetch)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_setscene: Started
NOTE: package libmusicbrainz-3.0.2-r1: task do_fetch: Started
NOTE: package libmusicbrainz-3.0.2-r1: task do_fetch: Succeeded
NOTE: Running task 880 of 5581 (ID: 2101, /home/oe/openembedded/recipes/tcltk/tcl_8.5.8.bb, do_unpack)
NOTE: package tcl-8.5.8-r9: task do_unpack: Started
NOTE: Unpacking ../sources/tcl8.5.8-src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/tcl-8.5.8-r9/
NOTE: Running task 881 of 5581 (ID: 3567, /home/oe/openembedded/recipes/musicbrainz/libmusicbrainz_3.0.2.bb, do_unpack)
NOTE: package libmusicbrainz-3.0.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/libmusicbrainz-3.0.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libmusicbrainz-3.0.2-r1/
NOTE: package libmusicbrainz-3.0.2-r1: task do_unpack: Succeeded
NOTE: package tcl-8.5.8-r9: task do_unpack: Succeeded
NOTE: package sqlite3-3.6.23.1-r4.0: task do_setscene: Succeeded
NOTE: Running task 882 of 5581 (ID: 2945, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_setscene)
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_setscene: Started
NOTE: Running task 883 of 5581 (ID: 2094, /home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_fetch)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_fetch: Started
NOTE: Running task 884 of 5581 (ID: 2326, /home/oe/openembedded/recipes/intltool/intltool-native_0.40.3.bb, do_patch)
NOTE: package intltool-native-0.40.3-r4.0: task do_patch: Started
NOTE: package intltool-native-0.40.3-r4.0: task do_patch: Succeeded
NOTE: package sqlite3-3.6.23.1-r4.0: task do_fetch: Succeeded
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_setscene: Succeeded
NOTE: Running task 885 of 5581 (ID: 2193, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_setscene)
NOTE: Running task 886 of 5581 (ID: 2944, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_fetch)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_setscene: Started
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_fetch: Started
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 5581 (ID: 2087, /home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_unpack)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_unpack: Started
NOTE: Unpacking ../sources/sqlite-3.6.23.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/sqlite3-3.6.23.1-r4.0/
NOTE: Running task 888 of 5581 (ID: 2937, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_unpack)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_unpack: Succeeded
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/xml-commons-resolver-1.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/xml-commons-resolver1.1-1.2-r0/
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 889 of 5581 (ID: 2179, /home/oe/openembedded/recipes/bluez/bluez-dtl1-workaround_1.0.bb, do_setscene)
NOTE: Running task 890 of 5581 (ID: 2165, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_setscene)
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_setscene: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_setscene: Succeeded
NOTE: package update-modules-1.0-r10: task do_setscene: Started
NOTE: Running task 891 of 5581 (ID: 2192, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_fetch)
NOTE: package update-modules-1.0-r10: task do_setscene: Succeeded
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_setscene: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_fetch: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_fetch: Succeeded
NOTE: Running task 892 of 5581 (ID: 2178, /home/oe/openembedded/recipes/bluez/bluez-dtl1-workaround_1.0.bb, do_fetch)
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_fetch: Started
NOTE: Running task 893 of 5581 (ID: 2164, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_fetch)
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_fetch: Succeeded
NOTE: package update-modules-1.0-r10: task do_fetch: Started
NOTE: package update-modules-1.0-r10: task do_fetch: Succeeded
NOTE: Running task 894 of 5581 (ID: 2185, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_unpack)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_unpack: Started
NOTE: Unpacking ../sources/u-boot-1.3.2.tar.bz2 to tmp/work/x86_64-linux/u-boot-mkimage-native-1.3.2-r3/
NOTE: Running task 895 of 5581 (ID: 2171, /home/oe/openembedded/recipes/bluez/bluez-dtl1-workaround_1.0.bb, do_unpack)
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/bluez/bluez-dtl1-workaround/02dtl1_cs.sh to tmp/work/all-angstrom-linux-gnueabi/bluez-dtl1-workaround-1.0-r1/
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_unpack: Succeeded
NOTE: Running task 896 of 5581 (ID: 2157, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_unpack)
NOTE: package update-modules-1.0-r10: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/update-modules/update-modules-1.0/update-modules to tmp/work/all-angstrom-linux-gnueabi/update-modules-1.0-r10/
NOTE: package update-modules-1.0-r10: task do_unpack: Succeeded
NOTE: Running task 897 of 5581 (ID: 2151, /home/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.12.bb, do_setscene)
NOTE: package module-init-tools-cross-3.12-r6: task do_setscene: Started
NOTE: Running task 898 of 5581 (ID: 4161, /home/oe/openembedded/recipes/classpath/classpath-native_0.98.bb, do_setscene)
NOTE: package classpath-native-0.98-r4: task do_setscene: Started
NOTE: package module-init-tools-cross-3.12-r6: task do_setscene: Succeeded
NOTE: package classpath-native-0.98-r4: task do_setscene: Succeeded
NOTE: Running task 899 of 5581 (ID: 2150, /home/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.12.bb, do_fetch)
NOTE: package module-init-tools-cross-3.12-r6: task do_fetch: Started
NOTE: package module-init-tools-cross-3.12-r6: task do_fetch: Succeeded
NOTE: Running task 900 of 5581 (ID: 4160, /home/oe/openembedded/recipes/classpath/classpath-native_0.98.bb, do_fetch)
NOTE: Running task 901 of 5581 (ID: 2143, /home/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.12.bb, do_unpack)
NOTE: package classpath-native-0.98-r4: task do_fetch: Started
NOTE: package module-init-tools-cross-3.12-r6: task do_unpack: Started
NOTE: Unpacking ../sources/module-init-tools-3.12.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/module-init-tools-cross-3.12-r6/
NOTE: package classpath-native-0.98-r4: task do_fetch: Succeeded
NOTE: Running task 902 of 5581 (ID: 4153, /home/oe/openembedded/recipes/classpath/classpath-native_0.98.bb, do_unpack)
NOTE: package module-init-tools-cross-3.12-r6: task do_unpack: Succeeded
NOTE: package classpath-native-0.98-r4: task do_unpack: Started
NOTE: Unpacking ../sources/classpath-0.98.tar.gz to tmp/work/x86_64-linux/classpath-native-0.98-r4/
NOTE: Running task 903 of 5581 (ID: 4116, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_setscene)
NOTE: package commons-net-native-1.4.1-r0: task do_setscene: Started
NOTE: package commons-net-native-1.4.1-r0: task do_setscene: Succeeded
NOTE: package classpath-native-0.98-r4: task do_unpack: Succeeded
NOTE: Running task 904 of 5581 (ID: 4115, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_fetch)
NOTE: package commons-net-native-1.4.1-r0: task do_fetch: Started
NOTE: package commons-net-native-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 5581 (ID: 4084, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_setscene)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_unpack: Succeeded
NOTE: package junit-native-3.8.2-r0: task do_setscene: Started
NOTE: Running task 906 of 5581 (ID: 4108, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_unpack)
NOTE: package commons-net-native-1.4.1-r0: task do_unpack: Started
NOTE: Unpacking ../sources/commons-net-1.4.1-src.tar.gz to tmp/work/x86_64-linux/commons-net-native-1.4.1-r0/
NOTE: package commons-net-native-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 5581 (ID: 2920, /home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_removebinaries)
NOTE: package jaxp1.3-1.3.04-r1: task do_removebinaries: Started
NOTE: package jaxp1.3-1.3.04-r1: task do_removebinaries: Succeeded
NOTE: Running task 908 of 5581 (ID: 4639, /home/oe/openembedded/recipes/gnome/orbit2-native_2.14.12.bb, do_setscene)
NOTE: Running task 909 of 5581 (ID: 2922, /home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_patch)
NOTE: package junit-native-3.8.2-r0: task do_setscene: Succeeded
NOTE: package orbit2-native-2.14.12-r0: task do_setscene: Started
NOTE: package jaxp1.3-1.3.04-r1: task do_patch: Started
NOTE: package jaxp1.3-1.3.04-r1: task do_patch: Succeeded
NOTE: Running task 910 of 5581 (ID: 4083, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_fetch)
NOTE: Running task 911 of 5581 (ID: 4625, /home/oe/openembedded/recipes/libidl/libidl_0.8.13.bb, do_setscene)
NOTE: package libidl-0.8.13-r0: task do_setscene: Started
NOTE: package junit-native-3.8.2-r0: task do_fetch: Started
NOTE: package orbit2-native-2.14.12-r0: task do_setscene: Succeeded
NOTE: Running task 912 of 5581 (ID: 4638, /home/oe/openembedded/recipes/gnome/orbit2-native_2.14.12.bb, do_fetch)
NOTE: package orbit2-native-2.14.12-r0: task do_fetch: Started
NOTE: package junit-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: package orbit2-native-2.14.12-r0: task do_fetch: Succeeded
NOTE: package libidl-0.8.13-r0: task do_setscene: Succeeded
NOTE: Running task 913 of 5581 (ID: 4076, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_unpack)
NOTE: package junit-native-3.8.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/junit3.8.2.zip to tmp/work/x86_64-linux/junit-native-3.8.2-r0/
NOTE: Running task 914 of 5581 (ID: 4631, /home/oe/openembedded/recipes/gnome/orbit2-native_2.14.12.bb, do_unpack)
NOTE: package orbit2-native-2.14.12-r0: task do_unpack: Started
NOTE: Unpacking ../sources/ORBit2-2.14.12.tar.bz2 to tmp/work/x86_64-linux/orbit2-native-2.14.12-r0/
NOTE: package gtk+-2.20.1-r10.4: task do_unpack: Succeeded
NOTE: Running task 915 of 5581 (ID: 4624, /home/oe/openembedded/recipes/libidl/libidl_0.8.13.bb, do_fetch)
NOTE: package libidl-0.8.13-r0: task do_fetch: Started
NOTE: package libidl-0.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 5581 (ID: 2533, /home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_setscene)
NOTE: Running task 917 of 5581 (ID: 4617, /home/oe/openembedded/recipes/libidl/libidl_0.8.13.bb, do_unpack)
NOTE: package libidl-0.8.13-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libIDL-0.8.13.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libidl-0.8.13-r0/
NOTE: package libxt-1_1.1.1-r9.0: task do_setscene: Started
NOTE: package junit-native-3.8.2-r0: task do_unpack: Succeeded
NOTE: package libidl-0.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 918 of 5581 (ID: 3938, virtual:native:/home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_removebinaries)
NOTE: package libxt-1_1.1.1-r9.0: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/gnome/files/gtk-doc.m4 to tmp/work/x86_64-linux/orbit2-native-2.14.12-r0/
NOTE: Unpacking ../openembedded/recipes/gnome/files/gtk-doc.make to tmp/work/x86_64-linux/orbit2-native-2.14.12-r0/
NOTE: package xalan-j-native-2.7.1-r4: task do_removebinaries: Started
NOTE: Running task 919 of 5581 (ID: 4815, /home/oe/openembedded/recipes/xorg-proto/videoproto_2.3.1.bb, do_patch)
NOTE: package orbit2-native-2.14.12-r0: task do_unpack: Succeeded
NOTE: package videoproto-1_2.3.1-r2.0: task do_patch: Started
NOTE: package videoproto-1_2.3.1-r2.0: task do_patch: Succeeded
NOTE: Running task 920 of 5581 (ID: 2532, /home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_fetch)
NOTE: package xalan-j-native-2.7.1-r4: task do_removebinaries: Succeeded
NOTE: Running task 921 of 5581 (ID: 4801, /home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_patch)
NOTE: package libxt-1_1.1.1-r9.0: task do_fetch: Started
NOTE: Running task 922 of 5581 (ID: 4787, virtual:native:/home/oe/openembedded/recipes/orc/orc_0.4.11.bb, do_patch)
NOTE: package libxt-1_1.1.1-r9.0: task do_fetch: Succeeded
NOTE: package orc-native-0.4.11-r0: task do_patch: Started
NOTE: package orc-native-0.4.11-r0: task do_patch: Succeeded
NOTE: package orc-0.4.11-r0: task do_patch: Started
NOTE: package orc-0.4.11-r0: task do_patch: Succeeded
NOTE: Running task 923 of 5581 (ID: 3940, virtual:native:/home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_patch)
NOTE: package xalan-j-native-2.7.1-r4: task do_patch: Started
NOTE: package xalan-j-native-2.7.1-r4: task do_patch: Succeeded
NOTE: Running task 924 of 5581 (ID: 2525, /home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_unpack)
NOTE: Running task 925 of 5581 (ID: 4766, /home/oe/openembedded/recipes/libdiscid/libdiscid_0.2.2.bb, do_generate_toolchain_file)
NOTE: package libxt-1_1.1.1-r9.0: task do_unpack: Started
NOTE: package libdiscid-0.2.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 926 of 5581 (ID: 4744, /home/oe/openembedded/recipes/neon/neon_0.25.5.bb, do_patch)
NOTE: Unpacking ../sources/libXt-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxt-1_1.1.1-r9.0/
NOTE: package libdiscid-0.2.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: package neon-0.25.5-r4: task do_patch: Started
NOTE: Applying patch 'gnutls-force-and-detect.patch' (../openembedded/recipes/neon/files/gnutls-force-and-detect.patch)
NOTE: Running task 927 of 5581 (ID: 4730, /home/oe/openembedded/recipes/tslib/tslib_1.0.bb, do_patch)
NOTE: package tslib-1.0-r28.6: task do_patch: Started
NOTE: package libxt-1_1.1.1-r9.0: task do_unpack: Succeeded
NOTE: Applying patch 'fix_version.patch' (../openembedded/recipes/tslib/tslib/fix_version.patch)
NOTE: Applying patch 'gnutls-2.patch' (../openembedded/recipes/neon/files/gnutls-2.patch)
NOTE: Running task 928 of 5581 (ID: 4716, /home/oe/openembedded/recipes/mesa/mesa_7.10.bb, do_patch)
NOTE: package neon-0.25.5-r4: task do_patch: Succeeded
NOTE: Applying patch 'tslib-nopressure.patch' (../openembedded/recipes/tslib/tslib/tslib-nopressure.patch)
NOTE: Applying patch 'tslib-pluginsld.patch' (../openembedded/recipes/tslib/tslib/tslib-pluginsld.patch)
NOTE: Running task 929 of 5581 (ID: 4380, /home/oe/openembedded/recipes/pkgconfig/pkgconfig_0.23.bb, do_patch)
NOTE: package pkgconfig-0.23-r8.3: task do_patch: Started
NOTE: package mesa-2_7.10-r11.0: task do_patch: Started
NOTE: Applying patch 'glamo.patch' (../openembedded/recipes/mesa/mesa-7.10/glamo.patch)
NOTE: Applying patch 'autofoo.patch' (../openembedded/recipes/pkgconfig/pkgconfig-0.23/autofoo.patch)
NOTE: Running task 930 of 5581 (ID: 3744, /home/oe/openembedded/recipes/xorg-lib/libxv_1.0.6.bb, do_setscene)
NOTE: Applying patch 'newer-libtool-fix.patch' (../openembedded/recipes/tslib/tslib/newer-libtool-fix.patch)
NOTE: Applying patch 'sysrootfix.patch' (../openembedded/recipes/pkgconfig/pkgconfig-0.23/sysrootfix.patch)
NOTE: package libxv-1.0.6-r9.0: task do_setscene: Started
NOTE: Applying patch 'uclibc.patch' (../openembedded/recipes/mesa/mesa-7.10/uclibc.patch)
NOTE: package libxv-1.0.6-r9.0: task do_setscene: Succeeded
NOTE: package pkgconfig-0.23-r8.3: task do_patch: Succeeded
NOTE: package mesa-2_7.10-r11.0: task do_patch: Succeeded
NOTE: package tslib-1.0-r28.6: task do_patch: Succeeded
NOTE: Running task 931 of 5581 (ID: 3743, /home/oe/openembedded/recipes/xorg-lib/libxv_1.0.6.bb, do_fetch)
NOTE: package libxv-1.0.6-r9.0: task do_fetch: Started
NOTE: Running task 932 of 5581 (ID: 3730, /home/oe/openembedded/recipes/libtheora/libtheora_1.1.1.bb, do_setscene)
NOTE: Running task 933 of 5581 (ID: 3716, /home/oe/openembedded/recipes/cdparanoia/cdparanoia_svn.bb, do_setscene)
NOTE: Running task 934 of 5581 (ID: 3688, /home/oe/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_setscene)
NOTE: package libtheora-1.1.1-r3.0: task do_setscene: Started
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_setscene: Started
NOTE: package libmad-0.15.1b-r5: task do_setscene: Started
NOTE: package libxv-1.0.6-r9.0: task do_fetch: Succeeded
NOTE: package libtheora-1.1.1-r3.0: task do_setscene: Succeeded
NOTE: Running task 935 of 5581 (ID: 3736, /home/oe/openembedded/recipes/xorg-lib/libxv_1.0.6.bb, do_unpack)
NOTE: package libxv-1.0.6-r9.0: task do_unpack: Started
NOTE: package libmad-0.15.1b-r5: task do_setscene: Succeeded
NOTE: Unpacking ../sources/libXv-1.0.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxv-1.0.6-r9.0/
NOTE: package libxv-1.0.6-r9.0: task do_unpack: Succeeded
NOTE: Running task 936 of 5581 (ID: 3729, /home/oe/openembedded/recipes/libtheora/libtheora_1.1.1.bb, do_fetch)
NOTE: package libtheora-1.1.1-r3.0: task do_fetch: Started
NOTE: Running task 937 of 5581 (ID: 3674, /home/oe/openembedded/recipes/libvorbis/libvorbis_1.2.3.bb, do_setscene)
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_setscene: Succeeded
NOTE: package libtheora-1.1.1-r3.0: task do_fetch: Succeeded
NOTE: Running task 938 of 5581 (ID: 3687, /home/oe/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_fetch)
NOTE: package libmad-0.15.1b-r5: task do_fetch: Started
NOTE: package libvorbis-1.2.3-r2.1: task do_setscene: Started
NOTE: package libmad-0.15.1b-r5: task do_fetch: Succeeded
NOTE: Running task 939 of 5581 (ID: 3715, /home/oe/openembedded/recipes/cdparanoia/cdparanoia_svn.bb, do_fetch)
NOTE: Running task 940 of 5581 (ID: 3722, /home/oe/openembedded/recipes/libtheora/libtheora_1.1.1.bb, do_unpack)
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_fetch: Started
NOTE: package libtheora-1.1.1-r3.0: task do_unpack: Started
NOTE: Unpacking ../sources/libtheora-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libtheora-1.1.1-r3.0/
NOTE: Running task 941 of 5581 (ID: 3680, /home/oe/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_unpack)
NOTE: package libmad-0.15.1b-r5: task do_unpack: Started
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_fetch: Succeeded
NOTE: package libvorbis-1.2.3-r2.1: task do_setscene: Succeeded
NOTE: Unpacking ../sources/libmad-0.15.1b.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libmad-0.15.1b-r5/
NOTE: package libmad-0.15.1b-r5: task do_unpack: Succeeded
NOTE: Running task 942 of 5581 (ID: 3673, /home/oe/openembedded/recipes/libvorbis/libvorbis_1.2.3.bb, do_fetch)
NOTE: package libvorbis-1.2.3-r2.1: task do_fetch: Started
NOTE: Running task 943 of 5581 (ID: 3708, /home/oe/openembedded/recipes/cdparanoia/cdparanoia_svn.bb, do_unpack)
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_unpack: Started
NOTE: Unpacking ../sources/cdparanoia_svn.xiph.org_.trunk_17714_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/cdparanoia-10.2+svnr17714-r1/
NOTE: Running task 944 of 5581 (ID: 3660, /home/oe/openembedded/recipes/tremor/tremor_20041119.bb, do_setscene)
NOTE: package libtheora-1.1.1-r3.0: task do_unpack: Succeeded
NOTE: Running task 945 of 5581 (ID: 3632, /home/oe/openembedded/recipes/libmikmod/libmikmod_3.1.12.bb, do_setscene)
NOTE: package libmikmod-3.1.12-r4: task do_setscene: Started
NOTE: package tremor-20041119-r2: task do_setscene: Started
NOTE: package tremor-20041119-r2: task do_setscene: Succeeded
NOTE: package libmikmod-3.1.12-r4: task do_setscene: Succeeded
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_unpack: Succeeded
NOTE: Running task 946 of 5581 (ID: 3659, /home/oe/openembedded/recipes/tremor/tremor_20041119.bb, do_fetch)
NOTE: package tremor-20041119-r2: task do_fetch: Started
NOTE: package tremor-20041119-r2: task do_fetch: Succeeded
NOTE: Running task 947 of 5581 (ID: 3618, /home/oe/openembedded/recipes/faad2/faad2_2.7.bb, do_setscene)
NOTE: Running task 948 of 5581 (ID: 3631, /home/oe/openembedded/recipes/libmikmod/libmikmod_3.1.12.bb, do_fetch)
NOTE: package libmikmod-3.1.12-r4: task do_fetch: Started
NOTE: Running task 949 of 5581 (ID: 3652, /home/oe/openembedded/recipes/tremor/tremor_20041119.bb, do_unpack)
NOTE: package tremor-20041119-r2: task do_unpack: Started
NOTE: Unpacking ../sources/Tremor_svn.xiph.org_.trunk_4573_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/tremor-20041119-r2/
NOTE: package libvorbis-1.2.3-r2.1: task do_fetch: Succeeded
NOTE: package faad2-2.7-r0: task do_setscene: Started
NOTE: package libmikmod-3.1.12-r4: task do_fetch: Succeeded
NOTE: package tremor-20041119-r2: task do_unpack: Succeeded
NOTE: Running task 950 of 5581 (ID: 3666, /home/oe/openembedded/recipes/libvorbis/libvorbis_1.2.3.bb, do_unpack)
NOTE: package libvorbis-1.2.3-r2.1: task do_unpack: Started
NOTE: Running task 951 of 5581 (ID: 3624, /home/oe/openembedded/recipes/libmikmod/libmikmod_3.1.12.bb, do_unpack)
NOTE: Unpacking ../sources/libvorbis-1.2.3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libvorbis-1.2.3-r2.1/
NOTE: package libvorbis-1.2.3-r2.1: task do_unpack: Succeeded
NOTE: package libmikmod-3.1.12-r4: task do_unpack: Started
NOTE: Unpacking ../sources/libmikmod-3.1.12.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libmikmod-3.1.12-r4/
NOTE: package libmikmod-3.1.12-r4: task do_unpack: Succeeded
NOTE: package faad2-2.7-r0: task do_setscene: Succeeded
NOTE: Running task 952 of 5581 (ID: 3604, /home/oe/openembedded/recipes/faac/faac_1.24.bb, do_setscene)
NOTE: package faac-1.24-r1: task do_setscene: Started
NOTE: Running task 953 of 5581 (ID: 3617, /home/oe/openembedded/recipes/faad2/faad2_2.7.bb, do_fetch)
NOTE: package faad2-2.7-r0: task do_fetch: Started
NOTE: Running task 954 of 5581 (ID: 3590, /home/oe/openembedded/recipes/schroedinger/schroedinger_1.0.9.bb, do_setscene)
NOTE: package faad2-2.7-r0: task do_fetch: Succeeded
NOTE: package schroedinger-1.0.9-r1.0: task do_setscene: Started
NOTE: Running task 955 of 5581 (ID: 3568, /home/oe/openembedded/recipes/musicbrainz/libmusicbrainz_3.0.2.bb, do_patch)
NOTE: package faac-1.24-r1: task do_setscene: Succeeded
NOTE: package libmusicbrainz-3.0.2-r1: task do_patch: Started
NOTE: Applying patch 'libmusicbrainz-3.0.2-gcc-4.4-fix.patch' (../openembedded/recipes/musicbrainz/files/libmusicbrainz-3.0.2-gcc-4.4-fix.patch)
NOTE: Running task 956 of 5581 (ID: 3610, /home/oe/openembedded/recipes/faad2/faad2_2.7.bb, do_unpack)
NOTE: Applying patch 'libmusicbrainz-3.0.2-cmake-neon.patch' (../openembedded/recipes/musicbrainz/files/libmusicbrainz-3.0.2-cmake-neon.patch)
NOTE: package libmusicbrainz-3.0.2-r1: task do_patch: Succeeded
NOTE: package faad2-2.7-r0: task do_unpack: Started
NOTE: Unpacking ../sources/faad2-2.7.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/faad2-2.7-r0/
NOTE: Running task 957 of 5581 (ID: 3603, /home/oe/openembedded/recipes/faac/faac_1.24.bb, do_fetch)
NOTE: package faac-1.24-r1: task do_fetch: Started
NOTE: package faac-1.24-r1: task do_fetch: Succeeded
NOTE: package schroedinger-1.0.9-r1.0: task do_setscene: Succeeded
NOTE: Running task 958 of 5581 (ID: 3596, /home/oe/openembedded/recipes/faac/faac_1.24.bb, do_unpack)
NOTE: package faad2-2.7-r0: task do_unpack: Succeeded
NOTE: package faac-1.24-r1: task do_unpack: Started
NOTE: Unpacking ../sources/faac-1.24.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/faac-1.24-r1/
NOTE: package faac-1.24-r1: task do_unpack: Succeeded
NOTE: Running task 959 of 5581 (ID: 3561, /home/oe/openembedded/recipes/libmms/libmms_0.6.bb, do_setscene)
NOTE: package libmms-0.6-r0: task do_setscene: Started
NOTE: Running task 960 of 5581 (ID: 3589, /home/oe/openembedded/recipes/schroedinger/schroedinger_1.0.9.bb, do_fetch)
NOTE: package schroedinger-1.0.9-r1.0: task do_fetch: Started
NOTE: Running task 961 of 5581 (ID: 3547, /home/oe/openembedded/recipes/vlc/x264_r2245.bb, do_setscene)
NOTE: package schroedinger-1.0.9-r1.0: task do_fetch: Succeeded
NOTE: package x264-r2245-r8: task do_setscene: Started
NOTE: package libmms-0.6-r0: task do_setscene: Succeeded
NOTE: Running task 962 of 5581 (ID: 3533, /home/oe/openembedded/recipes/webm/libvpx_0.9.5.bb, do_setscene)
NOTE: package libvpx-0.9.5-r6.0: task do_setscene: Started
NOTE: Running task 963 of 5581 (ID: 3560, /home/oe/openembedded/recipes/libmms/libmms_0.6.bb, do_fetch)
NOTE: package libmms-0.6-r0: task do_fetch: Started
NOTE: package libmms-0.6-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 5581 (ID: 3582, /home/oe/openembedded/recipes/schroedinger/schroedinger_1.0.9.bb, do_unpack)
NOTE: package x264-r2245-r8: task do_setscene: Succeeded
NOTE: package schroedinger-1.0.9-r1.0: task do_unpack: Started
NOTE: Unpacking ../sources/schroedinger-1.0.9.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/
NOTE: package schroedinger-1.0.9-r1.0: task do_unpack: Succeeded
NOTE: Running task 965 of 5581 (ID: 3546, /home/oe/openembedded/recipes/vlc/x264_r2245.bb, do_fetch)
NOTE: package x264-r2245-r8: task do_fetch: Started
NOTE: Running task 966 of 5581 (ID: 3553, /home/oe/openembedded/recipes/libmms/libmms_0.6.bb, do_unpack)
NOTE: package libmms-0.6-r0: task do_unpack: Started
NOTE: package libvpx-0.9.5-r6.0: task do_setscene: Succeeded
NOTE: package x264-r2245-r8: task do_fetch: Succeeded
NOTE: Unpacking ../sources/libmms-0.6.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libmms-0.6-r0/
NOTE: package libmms-0.6-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 5581 (ID: 3519, /home/oe/openembedded/recipes/libsdl/libsdl-x11_1.2.14.bb, do_setscene)
NOTE: package libsdl-x11-1.2.14-r1.8: task do_setscene: Started
NOTE: Running task 968 of 5581 (ID: 3532, /home/oe/openembedded/recipes/webm/libvpx_0.9.5.bb, do_fetch)
NOTE: package libvpx-0.9.5-r6.0: task do_fetch: Started
NOTE: Running task 969 of 5581 (ID: 3539, /home/oe/openembedded/recipes/vlc/x264_r2245.bb, do_unpack)
NOTE: package libsdl-x11-1.2.14-r1.8: task do_setscene: Succeeded
NOTE: Running task 970 of 5581 (ID: 3505, /home/oe/openembedded/recipes/jack/jack_0.118.0.bb, do_setscene)
NOTE: package jack-0.118.0-r3: task do_setscene: Started
NOTE: package libvpx-0.9.5-r6.0: task do_fetch: Succeeded
NOTE: package x264-r2245-r8: task do_unpack: Started
NOTE: Unpacking ../sources/x264-snapshot-20100531-2245.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/x264-r2245-r8/
NOTE: Running task 971 of 5581 (ID: 3525, /home/oe/openembedded/recipes/webm/libvpx_0.9.5.bb, do_unpack)
NOTE: package libvpx-0.9.5-r6.0: task do_unpack: Started
NOTE: Unpacking ../sources/libvpx-v0.9.5.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libvpx-0.9.5-r6.0/
NOTE: package jack-0.118.0-r3: task do_setscene: Succeeded
NOTE: Running task 972 of 5581 (ID: 3518, /home/oe/openembedded/recipes/libsdl/libsdl-x11_1.2.14.bb, do_fetch)
NOTE: package libsdl-x11-1.2.14-r1.8: task do_fetch: Started
NOTE: package x264-r2245-r8: task do_unpack: Succeeded
NOTE: package libsdl-x11-1.2.14-r1.8: task do_fetch: Succeeded
NOTE: Running task 973 of 5581 (ID: 3491, /home/oe/openembedded/recipes/gstreamer/gstreamer_0.10.32.bb, do_setscene)
NOTE: package gstreamer-0.10.32-r0: task do_setscene: Started
NOTE: Running task 974 of 5581 (ID: 3504, /home/oe/openembedded/recipes/jack/jack_0.118.0.bb, do_fetch)
NOTE: package jack-0.118.0-r3: task do_fetch: Started
NOTE: package jack-0.118.0-r3: task do_fetch: Succeeded
NOTE: Running task 975 of 5581 (ID: 3511, /home/oe/openembedded/recipes/libsdl/libsdl-x11_1.2.14.bb, do_unpack)
NOTE: package libsdl-x11-1.2.14-r1.8: task do_unpack: Started
NOTE: Unpacking ../sources/SDL-1.2.14.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libsdl-x11-1.2.14-r1.8/
NOTE: package libvpx-0.9.5-r6.0: task do_unpack: Succeeded
NOTE: package gstreamer-0.10.32-r0: task do_setscene: Succeeded
NOTE: package libsdl-x11-1.2.14-r1.8: task do_unpack: Succeeded
NOTE: Running task 976 of 5581 (ID: 3497, /home/oe/openembedded/recipes/jack/jack_0.118.0.bb, do_unpack)
NOTE: package jack-0.118.0-r3: task do_unpack: Started
NOTE: Unpacking ../sources/RELEASE_0_118_0_subversion.jackaudio.org_.jack.tags_4084_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/jack-0.118.0-r3/
NOTE: Running task 977 of 5581 (ID: 3477, /home/oe/openembedded/recipes/libvisual/libvisual_0.4.0.bb, do_setscene)
NOTE: package jack-0.118.0-r3: task do_unpack: Succeeded
NOTE: Running task 978 of 5581 (ID: 3490, /home/oe/openembedded/recipes/gstreamer/gstreamer_0.10.32.bb, do_fetch)
NOTE: package libvisual-0.4.0-r1: task do_setscene: Started
NOTE: package gstreamer-0.10.32-r0: task do_fetch: Started
NOTE: Running task 979 of 5581 (ID: 3463, /home/oe/openembedded/recipes/xbmc/wavpack_4.60.1.bb, do_setscene)
NOTE: package gstreamer-0.10.32-r0: task do_fetch: Succeeded
NOTE: package wavpack-4.60.1-r0: task do_setscene: Started
NOTE: Running task 980 of 5581 (ID: 3449, /home/oe/openembedded/recipes/libcdio/libcdio_0.82.bb, do_setscene)
NOTE: package libcdio-0.82-r4.0: task do_setscene: Started
NOTE: package libvisual-0.4.0-r1: task do_setscene: Succeeded
NOTE: package wavpack-4.60.1-r0: task do_setscene: Succeeded
NOTE: Running task 981 of 5581 (ID: 3476, /home/oe/openembedded/recipes/libvisual/libvisual_0.4.0.bb, do_fetch)
NOTE: Running task 982 of 5581 (ID: 3483, /home/oe/openembedded/recipes/gstreamer/gstreamer_0.10.32.bb, do_unpack)
NOTE: package libvisual-0.4.0-r1: task do_fetch: Started
NOTE: package gstreamer-0.10.32-r0: task do_unpack: Started
NOTE: Unpacking ../sources/gstreamer-0.10.32.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gstreamer-0.10.32-r0/
NOTE: Running task 983 of 5581 (ID: 3462, /home/oe/openembedded/recipes/xbmc/wavpack_4.60.1.bb, do_fetch)
NOTE: package wavpack-4.60.1-r0: task do_fetch: Started
NOTE: package libvisual-0.4.0-r1: task do_fetch: Succeeded
NOTE: package libcdio-0.82-r4.0: task do_setscene: Succeeded
NOTE: package wavpack-4.60.1-r0: task do_fetch: Succeeded
NOTE: Running task 984 of 5581 (ID: 3448, /home/oe/openembedded/recipes/libcdio/libcdio_0.82.bb, do_fetch)
NOTE: package libcdio-0.82-r4.0: task do_fetch: Started
NOTE: Running task 985 of 5581 (ID: 3469, /home/oe/openembedded/recipes/libvisual/libvisual_0.4.0.bb, do_unpack)
NOTE: Running task 986 of 5581 (ID: 3455, /home/oe/openembedded/recipes/xbmc/wavpack_4.60.1.bb, do_unpack)
NOTE: package wavpack-4.60.1-r0: task do_unpack: Started
NOTE: package libcdio-0.82-r4.0: task do_fetch: Succeeded
NOTE: package libvisual-0.4.0-r1: task do_unpack: Started
NOTE: Unpacking ../sources/libvisual-0.4.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libvisual-0.4.0-r1/
NOTE: package libvisual-0.4.0-r1: task do_unpack: Succeeded
NOTE: Unpacking ../sources/wavpack-4.60.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/wavpack-4.60.1-r0/
NOTE: Running task 987 of 5581 (ID: 3441, /home/oe/openembedded/recipes/libcdio/libcdio_0.82.bb, do_unpack)
NOTE: package wavpack-4.60.1-r0: task do_unpack: Succeeded
NOTE: package libcdio-0.82-r4.0: task do_unpack: Started
NOTE: Unpacking ../sources/libcdio-0.82.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libcdio-0.82-r4.0/
NOTE: Running task 988 of 5581 (ID: 1633, /home/oe/openembedded/recipes/antlr/antlr-native_2.7.7.bb, do_setscene)
NOTE: package antlr-native-2.7.7-r1: task do_setscene: Started
NOTE: package libcdio-0.82-r4.0: task do_unpack: Succeeded
NOTE: Running task 989 of 5581 (ID: 4123, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_removebinaries)
NOTE: package commons-logging-native-1.1.1-r0: task do_removebinaries: Started
NOTE: package commons-logging-native-1.1.1-r0: task do_removebinaries: Succeeded
NOTE: Running task 990 of 5581 (ID: 4122, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_unpackpost)
NOTE: package antlr-native-2.7.7-r1: task do_setscene: Succeeded
NOTE: package commons-logging-native-1.1.1-r0: task do_unpackpost: Started
NOTE: package commons-logging-native-1.1.1-r0: task do_unpackpost: Succeeded
NOTE: Running task 991 of 5581 (ID: 4100, virtual:native:/home/oe/openembedded/recipes/jdepend/jdepend_2.9.bb, do_setscene)
NOTE: package jdepend-native-2.9-r0: task do_setscene: Started
NOTE: package gstreamer-0.10.32-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 5581 (ID: 1632, /home/oe/openembedded/recipes/antlr/antlr-native_2.7.7.bb, do_fetch)
NOTE: package antlr-native-2.7.7-r1: task do_fetch: Started
NOTE: package jdepend-native-2.9-r0: task do_setscene: Succeeded
NOTE: package antlr-native-2.7.7-r1: task do_fetch: Succeeded
NOTE: Running task 993 of 5581 (ID: 3932, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb, do_setscene)
NOTE: Running task 994 of 5581 (ID: 4125, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb, do_patch)
NOTE: package bsf-native-2.4.0-r1: task do_setscene: Started
NOTE: Running task 995 of 5581 (ID: 4099, virtual:native:/home/oe/openembedded/recipes/jdepend/jdepend_2.9.bb, do_fetch)
NOTE: package commons-logging-native-1.1.1-r0: task do_patch: Started
NOTE: package commons-logging-native-1.1.1-r0: task do_patch: Succeeded
NOTE: package jdepend-native-2.9-r0: task do_fetch: Started
NOTE: package jdepend-native-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 5581 (ID: 1625, /home/oe/openembedded/recipes/antlr/antlr-native_2.7.7.bb, do_unpack)
NOTE: package antlr-native-2.7.7-r1: task do_unpack: Started
NOTE: Unpacking ../sources/antlr-2.7.7.tar.gz to tmp/work/x86_64-linux/antlr-native-2.7.7-r1/
NOTE: Running task 997 of 5581 (ID: 3917, virtual:native:/home/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb, do_setscene)
NOTE: package bsf-native-2.4.0-r1: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/antlr/files/runantlr to tmp/work/x86_64-linux/antlr-native-2.7.7-r1/
NOTE: package antlr-native-2.7.7-r1: task do_unpack: Succeeded
NOTE: package jsch-native-0.1.40-r2: task do_setscene: Started
NOTE: Running task 998 of 5581 (ID: 4092, virtual:native:/home/oe/openembedded/recipes/jdepend/jdepend_2.9.bb, do_unpack)
NOTE: package jdepend-native-2.9-r0: task do_unpack: Started
NOTE: Unpacking ../sources/jdepend-2.9.zip to tmp/work/x86_64-linux/jdepend-native-2.9-r0/
NOTE: package jdepend-native-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 5581 (ID: 4964, /home/oe/openembedded/recipes/ecj/ecj-initial.bb, do_patch)
NOTE: package ecj-initial-1.0-r2: task do_patch: Started
NOTE: Running task 1000 of 5581 (ID: 3931, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb, do_fetch)
NOTE: package ecj-initial-1.0-r2: task do_patch: Succeeded
NOTE: package bsf-native-2.4.0-r1: task do_fetch: Started
NOTE: package bsf-native-2.4.0-r1: task do_fetch: Succeeded
NOTE: Running task 1001 of 5581 (ID: 1640, /home/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb, do_patch)
NOTE: package jsch-native-0.1.40-r2: task do_setscene: Succeeded
NOTE: package gtk+-2.20.1-r10.4: task do_patch: Started
NOTE: Applying patch 'hardcoded_libtool.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/hardcoded_libtool.patch)
NOTE: Running task 1002 of 5581 (ID: 3916, virtual:native:/home/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb, do_fetch)
NOTE: Running task 1003 of 5581 (ID: 2683, /home/oe/openembedded/recipes/openssl/ocf-linux_20100325.bb, do_patch)
NOTE: Running task 1004 of 5581 (ID: 3924, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb, do_unpack)
NOTE: Applying patch 'run-iconcache.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/run-iconcache.patch)
NOTE: Applying patch 'toggle-font.diff' (../openembedded/recipes/gtk+/gtk+-2.20.1/toggle-font.diff)
NOTE: package ocf-linux-20100325-r2.0: task do_patch: Started
NOTE: package ocf-linux-20100325-r2.0: task do_patch: Succeeded
NOTE: package jsch-native-0.1.40-r2: task do_fetch: Started
NOTE: package jsch-native-0.1.40-r2: task do_fetch: Succeeded
NOTE: package bsf-native-2.4.0-r1: task do_unpack: Started
NOTE: Unpacking ../sources/bsf-src-2.4.0.tar.gz to tmp/work/x86_64-linux/bsf-native-2.4.0-r1/
NOTE: package bsf-native-2.4.0-r1: task do_unpack: Succeeded
NOTE: Applying patch 'xsettings.patch' (../openembedded/recipes/gtk+/files/xsettings.patch)
NOTE: Running task 1005 of 5581 (ID: 3909, virtual:native:/home/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb, do_unpack)
NOTE: Running task 1006 of 5581 (ID: 2102, /home/oe/openembedded/recipes/tcltk/tcl_8.5.8.bb, do_patch)
NOTE: package jsch-native-0.1.40-r2: task do_unpack: Started
NOTE: Unpacking ../sources/jsch-0.1.40.zip to tmp/work/x86_64-linux/jsch-native-0.1.40-r2/
NOTE: package jsch-native-0.1.40-r2: task do_unpack: Succeeded
NOTE: package tcl-8.5.8-r9: task do_patch: Started
NOTE: Applying patch 'confsearch.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/confsearch.diff)
NOTE: Applying patch 'gtk-dnd-grab-deadlock-fix.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/gtk-dnd-grab-deadlock-fix.patch)
NOTE: Running task 1007 of 5581 (ID: 2088, /home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_patch)
NOTE: Applying patch 'cross-nm.patch' (../openembedded/recipes/gtk+/gtk+-2.20.1/cross-nm.patch)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_patch: Started
NOTE: Applying patch 'libtool.patch' (../openembedded/recipes/sqlite/sqlite3/libtool.patch)
NOTE: Applying patch 'manpages.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/manpages.diff)
NOTE: Applying patch 'non-linux.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/non-linux.diff)
NOTE: Applying patch 'xkb-ifdef.patch' (../openembedded/recipes/gtk+/files/xkb-ifdef.patch)
NOTE: package sqlite3-3.6.23.1-r4.0: task do_patch: Succeeded
NOTE: Running task 1008 of 5581 (ID: 4167, virtual:native:/home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_removebinaries)
NOTE: package gtk+-2.20.1-r10.4: task do_patch: Succeeded
NOTE: package rhino-native-1.7r1-r1: task do_removebinaries: Started
NOTE: package rhino-native-1.7r1-r1: task do_removebinaries: Succeeded
NOTE: Running task 1009 of 5581 (ID: 1239, /home/oe/openembedded/recipes/openssl/openssl_1.0.0d.bb, do_setscene)
NOTE: Applying patch 'rpath.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/rpath.diff)
NOTE: Applying patch 'tcllibrary.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/tcllibrary.diff)
NOTE: Running task 1010 of 5581 (ID: 4169, virtual:native:/home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_patch)
NOTE: package openssl-1.0.0d-r14.0: task do_setscene: Started
NOTE: Applying patch 'tclpackagepath.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/tclpackagepath.diff)
NOTE: package rhino-native-1.7r1-r1: task do_patch: Started
NOTE: package rhino-native-1.7r1-r1: task do_patch: Succeeded
NOTE: Running task 1011 of 5581 (ID: 2476, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_setscene)
NOTE: Applying patch 'tclprivate.diff' (../openembedded/recipes/tcltk/tcl-8.5.8/tclprivate.diff)
NOTE: package xerces-j-2.9.1-r1: task do_setscene: Started
NOTE: Running task 1012 of 5581 (ID: 2186, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_patch)
NOTE: Applying patch 'mips-tclstrtod.patch' (../openembedded/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch)
NOTE: package tcl-8.5.8-r9: task do_patch: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_setscene: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_patch: Started
NOTE: Applying patch 'fix-arm920t-eabi.patch' (../openembedded/recipes/u-boot/u-boot-mkimage-1.3.2/fix-arm920t-eabi.patch)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_patch: Succeeded
NOTE: package openssl-1.0.0d-r14.0: task do_setscene: Succeeded
NOTE: Running task 1013 of 5581 (ID: 1238, /home/oe/openembedded/recipes/openssl/openssl_1.0.0d.bb, do_fetch)
NOTE: package openssl-1.0.0d-r14.0: task do_fetch: Started
NOTE: Running task 1014 of 5581 (ID: 2172, /home/oe/openembedded/recipes/bluez/bluez-dtl1-workaround_1.0.bb, do_patch)
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_patch: Started
NOTE: Running task 1015 of 5581 (ID: 2475, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_fetch)
NOTE: package openssl-1.0.0d-r14.0: task do_fetch: Succeeded
NOTE: package bluez-dtl1-workaround-1.0-r1: task do_patch: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_fetch: Started
NOTE: package xerces-j-2.9.1-r1: task do_fetch: Succeeded
NOTE: Running task 1016 of 5581 (ID: 2194, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_configure)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_configure: Started
NOTE: Running task 1017 of 5581 (ID: 1231, /home/oe/openembedded/recipes/openssl/openssl_1.0.0d.bb, do_unpack)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_configure: Succeeded
NOTE: package openssl-1.0.0d-r14.0: task do_unpack: Started
NOTE: Running task 1018 of 5581 (ID: 2158, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_patch)
NOTE: Unpacking ../sources/openssl-1.0.0d.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openssl-1.0.0d-r14.0/
NOTE: package update-modules-1.0-r10: task do_patch: Started
NOTE: Running task 1019 of 5581 (ID: 2468, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_unpack)
NOTE: package update-modules-1.0-r10: task do_patch: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_unpack: Started
NOTE: Unpacking ../sources/Xerces-J-src.2.9.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/xerces-j-2.9.1-r1/
NOTE: Running task 1020 of 5581 (ID: 2144, /home/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.12.bb, do_patch)
NOTE: package module-init-tools-cross-3.12-r6: task do_patch: Started
NOTE: package module-init-tools-cross-3.12-r6: task do_patch: Succeeded
NOTE: Running task 1021 of 5581 (ID: 2166, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_configure)
NOTE: package openssl-1.0.0d-r14.0: task do_unpack: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_unpack: Succeeded
NOTE: package update-modules-1.0-r10: task do_configure: Started
NOTE: package update-modules-1.0-r10: task do_configure: Succeeded
NOTE: Running task 1022 of 5581 (ID: 615, /home/oe/openembedded/recipes/linux/linux_2.6.38.bb, do_setscene)
NOTE: package linux-2.6.38-r4: task do_setscene: Started
NOTE: Running task 1023 of 5581 (ID: 1969, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_setscene)
NOTE: Running task 1024 of 5581 (ID: 4857, virtual:native:/home/oe/openembedded/recipes/jacl/jacl_1.4.1.bb, do_removebinaries)
NOTE: package shared-mime-info-native-0.51-r0: task do_setscene: Started
NOTE: package jacl-native-1.4.1-r0: task do_removebinaries: Started
NOTE: Running task 1025 of 5581 (ID: 4842, virtual:native:/home/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb, do_removebinaries)
NOTE: package shared-mime-info-native-0.51-r0: task do_setscene: Succeeded
NOTE: package jacl-native-1.4.1-r0: task do_removebinaries: Succeeded
NOTE: package jzlib-native-1.0.7-r0: task do_removebinaries: Started
NOTE: package jzlib-native-1.0.7-r0: task do_removebinaries: Succeeded
NOTE: package linux-2.6.38-r4: task do_setscene: Succeeded
NOTE: Running task 1026 of 5581 (ID: 614, /home/oe/openembedded/recipes/linux/linux_2.6.38.bb, do_fetch)
NOTE: package linux-2.6.38-r4: task do_fetch: Started
NOTE: Running task 1027 of 5581 (ID: 1968, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_fetch)
NOTE: package shared-mime-info-native-0.51-r0: task do_fetch: Started
NOTE: Running task 1028 of 5581 (ID: 4859, virtual:native:/home/oe/openembedded/recipes/jacl/jacl_1.4.1.bb, do_patch)
NOTE: package shared-mime-info-native-0.51-r0: task do_fetch: Succeeded
NOTE: package jacl-native-1.4.1-r0: task do_patch: Started
NOTE: package jacl-native-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1029 of 5581 (ID: 4844, virtual:native:/home/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb, do_patch)
NOTE: package jzlib-native-1.0.7-r0: task do_patch: Started
NOTE: package jzlib-native-1.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 5581 (ID: 1961, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_unpack)
NOTE: Running task 1031 of 5581 (ID: 2591, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_setscene)
NOTE: package shared-mime-info-native-0.51-r0: task do_unpack: Started
NOTE: package ant-native-1.7.1-r1: task do_setscene: Started
NOTE: Unpacking ../sources/shared-mime-info-0.51.tar.bz2 to tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/
NOTE: Running task 1032 of 5581 (ID: 4632, /home/oe/openembedded/recipes/gnome/orbit2-native_2.14.12.bb, do_patch)
NOTE: package orbit2-native-2.14.12-r0: task do_patch: Started
NOTE: package shared-mime-info-native-0.51-r0: task do_unpack: Succeeded
NOTE: Applying patch 'configure-lossage.patch' (../openembedded/recipes/gnome/orbit2/configure-lossage.patch)
NOTE: package orbit2-native-2.14.12-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 5581 (ID: 4618, /home/oe/openembedded/recipes/libidl/libidl_0.8.13.bb, do_patch)
NOTE: package libidl-0.8.13-r0: task do_patch: Started
NOTE: package libidl-0.8.13-r0: task do_patch: Succeeded
NOTE: package ant-native-1.7.1-r1: task do_setscene: Succeeded
NOTE: Running task 1034 of 5581 (ID: 3197, /home/oe/openembedded/recipes/policykit/policykit_0.100.bb, do_setscene)
NOTE: package policykit-0.100-r0: task do_setscene: Started
NOTE: Running task 1035 of 5581 (ID: 2590, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_fetch)
NOTE: package ant-native-1.7.1-r1: task do_fetch: Started
NOTE: Running task 1036 of 5581 (ID: 3183, /home/oe/openembedded/recipes/gnome/orbit2_2.14.17.bb, do_setscene)
NOTE: package orbit2-2.14.17-r0: task do_setscene: Started
NOTE: package ant-native-1.7.1-r1: task do_fetch: Succeeded
NOTE: package policykit-0.100-r0: task do_setscene: Succeeded
NOTE: package orbit2-2.14.17-r0: task do_setscene: Succeeded
NOTE: Running task 1037 of 5581 (ID: 3196, /home/oe/openembedded/recipes/policykit/policykit_0.100.bb, do_fetch)
NOTE: package policykit-0.100-r0: task do_fetch: Started
NOTE: Running task 1038 of 5581 (ID: 2583, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_unpack)
NOTE: package policykit-0.100-r0: task do_fetch: Succeeded
NOTE: package ant-native-1.7.1-r1: task do_unpack: Started
NOTE: Unpacking ../sources/apache-ant-1.7.1-src.tar.gz to tmp/work/x86_64-linux/ant-native-1.7.1-r1/
NOTE: Running task 1039 of 5581 (ID: 3182, /home/oe/openembedded/recipes/gnome/orbit2_2.14.17.bb, do_fetch)
NOTE: package orbit2-2.14.17-r0: task do_fetch: Started
NOTE: package orbit2-2.14.17-r0: task do_fetch: Succeeded
NOTE: Running task 1040 of 5581 (ID: 3189, /home/oe/openembedded/recipes/policykit/policykit_0.100.bb, do_unpack)
NOTE: package policykit-0.100-r0: task do_unpack: Started
NOTE: Unpacking ../sources/polkit-0.100.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/policykit-0.100-r0/
NOTE: package policykit-0.100-r0: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/ant/files/ant to tmp/work/x86_64-linux/ant-native-1.7.1-r1/
NOTE: package ant-native-1.7.1-r1: task do_unpack: Succeeded
NOTE: Running task 1041 of 5581 (ID: 3175, /home/oe/openembedded/recipes/gnome/orbit2_2.14.17.bb, do_unpack)
NOTE: package orbit2-2.14.17-r0: task do_unpack: Started
NOTE: Unpacking ../sources/ORBit2-2.14.17.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/orbit2-2.14.17-r0/
NOTE: Running task 1042 of 5581 (ID: 2526, /home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_patch)
NOTE: package linux-2.6.38-r4: task do_fetch: Succeeded
NOTE: package libxt-1_1.1.1-r9.0: task do_patch: Started
NOTE: package libxt-1_1.1.1-r9.0: task do_patch: Succeeded
NOTE: Running task 1043 of 5581 (ID: 3737, /home/oe/openembedded/recipes/xorg-lib/libxv_1.0.6.bb, do_patch)
NOTE: package libxv-1.0.6-r9.0: task do_patch: Started
NOTE: Unpacking ../openembedded/recipes/gnome/files/gtk-doc.m4 to tmp/work/armv5te-angstrom-linux-gnueabi/orbit2-2.14.17-r0/
NOTE: Unpacking ../openembedded/recipes/gnome/files/gtk-doc.make to tmp/work/armv5te-angstrom-linux-gnueabi/orbit2-2.14.17-r0/
NOTE: package orbit2-2.14.17-r0: task do_unpack: Succeeded
NOTE: package libxv-1.0.6-r9.0: task do_patch: Succeeded
NOTE: Running task 1044 of 5581 (ID: 607, /home/oe/openembedded/recipes/linux/linux_2.6.38.bb, do_unpack)
NOTE: Running task 1045 of 5581 (ID: 3723, /home/oe/openembedded/recipes/libtheora/libtheora_1.1.1.bb, do_patch)
NOTE: package linux-2.6.38-r4: task do_unpack: Started
NOTE: package libtheora-1.1.1-r3.0: task do_patch: Started
NOTE: Running task 1046 of 5581 (ID: 3709, /home/oe/openembedded/recipes/cdparanoia/cdparanoia_svn.bb, do_patch)
NOTE: Applying patch 'no-docs.patch' (../openembedded/recipes/libtheora/libtheora-1.1.1/no-docs.patch)
NOTE: Unpacking ../sources/linux-2.6.38.tar.bz2 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/linux-2.6.38-r4/
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_patch: Started
NOTE: Running task 1047 of 5581 (ID: 3681, /home/oe/openembedded/recipes/libmad/libmad_0.15.1b.bb, do_patch)
NOTE: package libmad-0.15.1b-r5: task do_patch: Started
NOTE: package libtheora-1.1.1-r3.0: task do_patch: Succeeded
NOTE: Applying patch 'fixes10.patch' (../openembedded/recipes/cdparanoia/cdparanoia/fixes10.patch)
NOTE: Applying patch 'Makefile.in.patch' (../openembedded/recipes/cdparanoia/cdparanoia/Makefile.in.patch)
NOTE: Applying patch 'add-pkgconfig.patch' (../openembedded/recipes/libmad/files/add-pkgconfig.patch)
NOTE: Applying patch 'mad.diff' (../openembedded/recipes/libmad/files/mad.diff)
NOTE: Applying patch 'mad-mips-h-constraint.patch' (../openembedded/recipes/libmad/files/mad-mips-h-constraint.patch)
NOTE: Applying patch 'interface_Makefile.in.patch' (../openembedded/recipes/cdparanoia/cdparanoia/interface_Makefile.in.patch)
NOTE: Applying patch 'paranoia_Makefile.in.patch' (../openembedded/recipes/cdparanoia/cdparanoia/paranoia_Makefile.in.patch)
NOTE: package libmad-0.15.1b-r5: task do_patch: Succeeded
NOTE: Running task 1048 of 5581 (ID: 3667, /home/oe/openembedded/recipes/libvorbis/libvorbis_1.2.3.bb, do_patch)
NOTE: package libvorbis-1.2.3-r2.1: task do_patch: Started
NOTE: Applying patch 'configure_powerpc-no-fixed-cpu.patch' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/configure_powerpc-no-fixed-cpu.patch)
NOTE: Applying patch 'configure.in.patch' (../openembedded/recipes/cdparanoia/cdparanoia/configure.in.patch)
NOTE: package cdparanoia-10.2+svnr17714-r1: task do_patch: Succeeded
NOTE: Running task 1049 of 5581 (ID: 3653, /home/oe/openembedded/recipes/tremor/tremor_20041119.bb, do_patch)
NOTE: package tremor-20041119-r2: task do_patch: Started
NOTE: Applying patch 'patch-lib_backends.h' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/patch-lib_backends.h)
NOTE: Applying patch 'patch-lib_codebook.c' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/patch-lib_codebook.c)
NOTE: Applying patch 'pkgconfig.patch' (../openembedded/recipes/tremor/tremor/pkgconfig.patch)
NOTE: Running task 1050 of 5581 (ID: 3625, /home/oe/openembedded/recipes/libmikmod/libmikmod_3.1.12.bb, do_patch)
NOTE: package libmikmod-3.1.12-r4: task do_patch: Started
NOTE: package tremor-20041119-r2: task do_patch: Succeeded
NOTE: Applying patch 'patch-lib_modes_residue_44.h' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/patch-lib_modes_residue_44.h)
NOTE: Applying patch 'm4.patch' (../openembedded/recipes/libmikmod/libmikmod/m4.patch)
NOTE: Applying patch 'patch-lib_modes_residue_44u.h' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/patch-lib_modes_residue_44u.h)
NOTE: Applying patch 'autofoo.patch' (../openembedded/recipes/libmikmod/libmikmod/autofoo.patch)
NOTE: Applying patch 'ldflags.patch' (../openembedded/recipes/libmikmod/libmikmod/ldflags.patch)
NOTE: Running task 1051 of 5581 (ID: 3611, /home/oe/openembedded/recipes/faad2/faad2_2.7.bb, do_patch)
NOTE: package faad2-2.7-r0: task do_patch: Started
NOTE: Applying patch 'patch-lib_res0.c' (../openembedded/recipes/libvorbis/libvorbis-1.2.3/patch-lib_res0.c)
NOTE: package faad2-2.7-r0: task do_patch: Succeeded
NOTE: package libvorbis-1.2.3-r2.1: task do_patch: Succeeded
NOTE: Running task 1052 of 5581 (ID: 3597, /home/oe/openembedded/recipes/faac/faac_1.24.bb, do_patch)
NOTE: package faac-1.24-r1: task do_patch: Started
NOTE: Applying patch 'CVE-2010-2971.patch' (../openembedded/recipes/libmikmod/libmikmod/CVE-2010-2971.patch)
NOTE: package libmikmod-3.1.12-r4: task do_patch: Succeeded
NOTE: package faac-1.24-r1: task do_patch: Succeeded
NOTE: Running task 1053 of 5581 (ID: 3583, /home/oe/openembedded/recipes/schroedinger/schroedinger_1.0.9.bb, do_patch)
NOTE: package schroedinger-1.0.9-r1.0: task do_patch: Started
NOTE: Running task 1054 of 5581 (ID: 3576, /home/oe/openembedded/recipes/musicbrainz/libmusicbrainz_3.0.2.bb, do_generate_toolchain_file)
NOTE: Running task 1055 of 5581 (ID: 3554, /home/oe/openembedded/recipes/libmms/libmms_0.6.bb, do_patch)
NOTE: Applying patch 'configure.ac.patch' (../openembedded/recipes/schroedinger/schroedinger/configure.ac.patch)
NOTE: package libmusicbrainz-3.0.2-r1: task do_generate_toolchain_file: Started
NOTE: package libmusicbrainz-3.0.2-r1: task do_generate_toolchain_file: Succeeded
NOTE: package libmms-0.6-r0: task do_patch: Started
NOTE: package libmms-0.6-r0: task do_patch: Succeeded
NOTE: Running task 1056 of 5581 (ID: 3540, /home/oe/openembedded/recipes/vlc/x264_r2245.bb, do_patch)
NOTE: package schroedinger-1.0.9-r1.0: task do_patch: Succeeded
NOTE: package x264-r2245-r8: task do_patch: Started
NOTE: package x264-r2245-r8: task do_patch: Succeeded
NOTE: Running task 1057 of 5581 (ID: 3526, /home/oe/openembedded/recipes/webm/libvpx_0.9.5.bb, do_patch)
NOTE: package libvpx-0.9.5-r6.0: task do_patch: Started
NOTE: Applying patch 'libvpx-configure-support-blank-prefix.patch' (../openembedded/recipes/webm/libvpx/libvpx-configure-support-blank-prefix.patch)
NOTE: Running task 1058 of 5581 (ID: 3512, /home/oe/openembedded/recipes/libsdl/libsdl-x11_1.2.14.bb, do_patch)
NOTE: Applying patch 'CVE-2010-4203.patch' (../openembedded/recipes/webm/libvpx/CVE-2010-4203.patch)
NOTE: package libsdl-x11-1.2.14-r1.8: task do_patch: Started
NOTE: package libsdl-x11-1.2.14-r1.8: task do_patch: Succeeded
NOTE: Running task 1059 of 5581 (ID: 3498, /home/oe/openembedded/recipes/jack/jack_0.118.0.bb, do_patch)
NOTE: package jack-0.118.0-r3: task do_patch: Started
NOTE: package libvpx-0.9.5-r6.0: task do_patch: Succeeded
NOTE: Applying patch 'remove-wrong-host-test.patch' (../openembedded/recipes/jack/files/remove-wrong-host-test.patch)
NOTE: Running task 1060 of 5581 (ID: 3484, /home/oe/openembedded/recipes/gstreamer/gstreamer_0.10.32.bb, do_patch)
NOTE: Running task 1061 of 5581 (ID: 3470, /home/oe/openembedded/recipes/libvisual/libvisual_0.4.0.bb, do_patch)
NOTE: package libvisual-0.4.0-r1: task do_patch: Started
NOTE: package jack-0.118.0-r3: task do_patch: Succeeded
NOTE: package gstreamer-0.10.32-r0: task do_patch: Started
NOTE: Applying patch '0001-add-GstQueryBuffers-query.patch' (../openembedded/recipes/gstreamer/gstreamer/0001-add-GstQueryBuffers-query.patch)
NOTE: Applying patch 'no-libdir.patch' (../openembedded/recipes/libvisual/libvisual-0.4.0/no-libdir.patch)
NOTE: Running task 1062 of 5581 (ID: 3456, /home/oe/openembedded/recipes/xbmc/wavpack_4.60.1.bb, do_patch)
NOTE: package wavpack-4.60.1-r0: task do_patch: Started
NOTE: package libvisual-0.4.0-r1: task do_patch: Succeeded
NOTE: Applying patch '0002-gstevent-add-crop-event.patch' (../openembedded/recipes/gstreamer/gstreamer/0002-gstevent-add-crop-event.patch)
NOTE: Applying patch '0003-basetransform-don-t-do-unnecessary-pad_alloc.patch' (../openembedded/recipes/gstreamer/gstreamer/0003-basetransform-don-t-do-unnecessary-pad_alloc.patch)
NOTE: package wavpack-4.60.1-r0: task do_patch: Succeeded
NOTE: Running task 1063 of 5581 (ID: 3442, /home/oe/openembedded/recipes/libcdio/libcdio_0.82.bb, do_patch)
NOTE: package libcdio-0.82-r4.0: task do_patch: Started
NOTE: package libcdio-0.82-r4.0: task do_patch: Succeeded
NOTE: Running task 1064 of 5581 (ID: 2389, /home/oe/openembedded/recipes/libsndfile/libsndfile1_1.0.24.bb, do_setscene)
NOTE: package gstreamer-0.10.32-r0: task do_patch: Succeeded
NOTE: package libsndfile1-1.0.24-r0: task do_setscene: Started
NOTE: Running task 1065 of 5581 (ID: 2347, /home/oe/openembedded/recipes/gstreamer/gst-plugins-base_0.10.32.bb, do_setscene)
NOTE: Running task 1066 of 5581 (ID: 2123, /home/oe/openembedded/recipes/tcltk/tk_8.5.8.bb, do_setscene)
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_setscene: Started
NOTE: package tk-8.5.8-r3: task do_setscene: Started
NOTE: package libsndfile1-1.0.24-r0: task do_setscene: Succeeded
NOTE: package tk-8.5.8-r3: task do_setscene: Succeeded
NOTE: Running task 1067 of 5581 (ID: 2388, /home/oe/openembedded/recipes/libsndfile/libsndfile1_1.0.24.bb, do_fetch)
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_setscene: Succeeded
NOTE: package libsndfile1-1.0.24-r0: task do_fetch: Started
NOTE: package libsndfile1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 1068 of 5581 (ID: 2346, /home/oe/openembedded/recipes/gstreamer/gst-plugins-base_0.10.32.bb, do_fetch)
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_fetch: Started
NOTE: Running task 1069 of 5581 (ID: 2122, /home/oe/openembedded/recipes/tcltk/tk_8.5.8.bb, do_fetch)
NOTE: Running task 1070 of 5581 (ID: 2381, /home/oe/openembedded/recipes/libsndfile/libsndfile1_1.0.24.bb, do_unpack)
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_fetch: Succeeded
NOTE: package tk-8.5.8-r3: task do_fetch: Started
NOTE: package libsndfile1-1.0.24-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libsndfile-1.0.24.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libsndfile1-1.0.24-r0/
NOTE: package libsndfile1-1.0.24-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 5581 (ID: 2339, /home/oe/openembedded/recipes/gstreamer/gst-plugins-base_0.10.32.bb, do_unpack)
NOTE: package tk-8.5.8-r3: task do_fetch: Succeeded
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_unpack: Started
NOTE: Unpacking ../sources/gst-plugins-base-0.10.32.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gst-plugins-base-0.10.32-r11.1/
NOTE: Running task 1072 of 5581 (ID: 2115, /home/oe/openembedded/recipes/tcltk/tk_8.5.8.bb, do_unpack)
NOTE: package tk-8.5.8-r3: task do_unpack: Started
NOTE: Unpacking ../sources/tk8.5.8-src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/tk-8.5.8-r3/
NOTE: Running task 1073 of 5581 (ID: 2067, /home/oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb, do_setscene)
NOTE: package tk-8.5.8-r3: task do_unpack: Succeeded
NOTE: package gdbm-1.8.3-r5: task do_setscene: Started
NOTE: package gdbm-1.8.3-r5: task do_setscene: Succeeded
NOTE: Running task 1074 of 5581 (ID: 2053, /home/oe/openembedded/recipes/db/db_5.1.19.bb, do_setscene)
NOTE: package db-5.1.19-r2: task do_setscene: Started
NOTE: Running task 1075 of 5581 (ID: 2066, /home/oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb, do_fetch)
NOTE: package gdbm-1.8.3-r5: task do_fetch: Started
NOTE: package gdbm-1.8.3-r5: task do_fetch: Succeeded
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_unpack: Succeeded
NOTE: package db-5.1.19-r2: task do_setscene: Succeeded
NOTE: Running task 1076 of 5581 (ID: 2059, /home/oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb, do_unpack)
NOTE: package gdbm-1.8.3-r5: task do_unpack: Started
NOTE: Unpacking ../sources/gdbm-1.8.3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gdbm-1.8.3-r5/
NOTE: package gdbm-1.8.3-r5: task do_unpack: Succeeded
NOTE: Running task 1077 of 5581 (ID: 3773, /home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_setscene)
NOTE: package regexp-1.5-r1: task do_setscene: Started
NOTE: Running task 1078 of 5581 (ID: 2052, /home/oe/openembedded/recipes/db/db_5.1.19.bb, do_fetch)
NOTE: package db-5.1.19-r2: task do_fetch: Started
NOTE: Running task 1079 of 5581 (ID: 4152, /home/oe/openembedded/recipes/classpath/classpath-native_0.98.bb, do_unpackpost)
NOTE: package regexp-1.5-r1: task do_setscene: Succeeded
NOTE: package classpath-native-0.98-r4: task do_unpackpost: Started
NOTE: package classpath-native-0.98-r4: task do_unpackpost: Succeeded
NOTE: Running task 1080 of 5581 (ID: 3772, /home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_fetch)
NOTE: package regexp-1.5-r1: task do_fetch: Started
NOTE: package regexp-1.5-r1: task do_fetch: Succeeded
NOTE: Running task 1081 of 5581 (ID: 4154, /home/oe/openembedded/recipes/classpath/classpath-native_0.98.bb, do_patch)
NOTE: Running task 1082 of 5581 (ID: 3765, /home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_unpack)
NOTE: package db-5.1.19-r2: task do_fetch: Succeeded
NOTE: package classpath-native-0.98-r4: task do_patch: Started
NOTE: Applying patch 'SimpleName.diff' (../openembedded/recipes/classpath/files/SimpleName.diff)
NOTE: package regexp-1.5-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jakarta-regexp-1.5.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/regexp-1.5-r1/
NOTE: package regexp-1.5-r1: task do_unpack: Succeeded
NOTE: Running task 1083 of 5581 (ID: 2936, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_removebinaries)
NOTE: Running task 1084 of 5581 (ID: 2045, /home/oe/openembedded/recipes/db/db_5.1.19.bb, do_unpack)
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_removebinaries: Started
NOTE: Applying patch 'sun-security-getproperty.patch' (../openembedded/recipes/classpath/classpath-0.98/sun-security-getproperty.patch)
NOTE: package db-5.1.19-r2: task do_unpack: Started
NOTE: Unpacking ../sources/db-5.1.19.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/db-5.1.19-r2/
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_removebinaries: Succeeded
NOTE: Applying patch 'ecj_java_dir.patch' (../openembedded/recipes/classpath/files/ecj_java_dir.patch)
NOTE: Running task 1085 of 5581 (ID: 2935, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_unpackpost)
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/classpath/files/autotools.patch)
NOTE: Applying patch 'miscompilation.patch' (../openembedded/recipes/classpath/files/miscompilation.patch)
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_unpackpost: Started
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_unpackpost: Succeeded
NOTE: Applying patch 'toolwrapper-exithook.patch' (../openembedded/recipes/classpath/files/toolwrapper-exithook.patch)
NOTE: package classpath-native-0.98-r4: task do_patch: Succeeded
NOTE: Running task 1086 of 5581 (ID: 27, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_setscene)
NOTE: Running task 1087 of 5581 (ID: 2938, /home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_patch)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_setscene: Started
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_patch: Started
NOTE: package xml-commons-resolver1.1-1.2-r0: task do_patch: Succeeded
NOTE: package db-5.1.19-r2: task do_unpack: Succeeded
NOTE: Running task 1088 of 5581 (ID: 1232, /home/oe/openembedded/recipes/openssl/openssl_1.0.0d.bb, do_patch)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_setscene: Succeeded
NOTE: package openssl-1.0.0d-r14.0: task do_patch: Started
NOTE: Applying patch 'configure-targets.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/configure-targets.patch)
NOTE: Running task 1089 of 5581 (ID: 2195, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_qa_configure)
NOTE: Applying patch 'shared-libs.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/shared-libs.patch)
NOTE: Applying patch 'debian.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/debian.patch)
NOTE: Applying patch 'oe-ldflags.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/oe-ldflags.patch)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_qa_configure: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_qa_configure: Succeeded
NOTE: Running task 1090 of 5581 (ID: 26, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_fetch)
NOTE: Running task 1091 of 5581 (ID: 2196, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_compile)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_fetch: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_fetch: Succeeded
NOTE: Applying patch 'libdeps-first.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/libdeps-first.patch)
NOTE: Applying patch 'engines-install-in-libdir-ssl.patch' (../openembedded/recipes/openssl/openssl-1.0.0d/engines-install-in-libdir-ssl.patch)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_compile: Started
NOTE: Running task 1092 of 5581 (ID: 19, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_unpack)
NOTE: package openssl-1.0.0d-r14.0: task do_patch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_unpack: Started
NOTE: Unpacking ../sources/opkg-utils_svn.openmoko.org_.trunk.src.host._4747_.tar.gz to tmp/work/x86_64-linux/opkg-utils-native-0.1.8+svnr4747-r6/
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_unpack: Succeeded
NOTE: Running task 1093 of 5581 (ID: 2167, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_qa_configure)
NOTE: Running task 1094 of 5581 (ID: 1962, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_patch)
NOTE: package update-modules-1.0-r10: task do_qa_configure: Started
NOTE: package update-modules-1.0-r10: task do_qa_configure: Succeeded
NOTE: package shared-mime-info-native-0.51-r0: task do_patch: Started
NOTE: package shared-mime-info-native-0.51-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 5581 (ID: 2168, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_compile)
NOTE: package update-modules-1.0-r10: task do_compile: Started
NOTE: package update-modules-1.0-r10: task do_compile: Succeeded
NOTE: Running task 1096 of 5581 (ID: 1624, /home/oe/openembedded/recipes/antlr/antlr-native_2.7.7.bb, do_removebinaries)
NOTE: Running task 1097 of 5581 (ID: 2159, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_install)
NOTE: package antlr-native-2.7.7-r1: task do_removebinaries: Started
NOTE: package antlr-native-2.7.7-r1: task do_removebinaries: Succeeded
NOTE: package update-modules-1.0-r10: task do_install: Started
NOTE: package update-modules-1.0-r10: task do_install: Succeeded
NOTE: Running task 1098 of 5581 (ID: 1626, /home/oe/openembedded/recipes/antlr/antlr-native_2.7.7.bb, do_patch)
NOTE: package antlr-native-2.7.7-r1: task do_patch: Started
NOTE: package antlr-native-2.7.7-r1: task do_patch: Succeeded
NOTE: Running task 1099 of 5581 (ID: 2160, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_populate_sysroot)
NOTE: Running task 1100 of 5581 (ID: 2973, virtual:native:/home/oe/openembedded/recipes/curl/curl_7.21.2.bb, do_setscene)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_compile: Succeeded
NOTE: package update-modules-1.0-r10: task do_populate_sysroot: Started
NOTE: package curl-native-7.21.2-r5.0: task do_setscene: Started
NOTE: Running task 1101 of 5581 (ID: 2187, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_install)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_install: Started
NOTE: package update-modules-1.0-r10: task do_populate_sysroot: Succeeded
NOTE: package curl-native-7.21.2-r5.0: task do_setscene: Succeeded
NOTE: Running task 1102 of 5581 (ID: 4107, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_removebinaries)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_install: Succeeded
NOTE: package commons-net-native-1.4.1-r0: task do_removebinaries: Started
NOTE: package commons-net-native-1.4.1-r0: task do_removebinaries: Succeeded
NOTE: Running task 1103 of 5581 (ID: 2972, virtual:native:/home/oe/openembedded/recipes/curl/curl_7.21.2.bb, do_fetch)
NOTE: Running task 1104 of 5581 (ID: 2188, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_populate_sysroot)
NOTE: Running task 1105 of 5581 (ID: 4106, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_unpackpost)
NOTE: package curl-native-7.21.2-r5.0: task do_fetch: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_populate_sysroot: Started
NOTE: package commons-net-native-1.4.1-r0: task do_unpackpost: Started
NOTE: package commons-net-native-1.4.1-r0: task do_unpackpost: Succeeded
NOTE: Running task 1106 of 5581 (ID: 4109, virtual:native:/home/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb, do_patch)
NOTE: package curl-native-7.21.2-r5.0: task do_fetch: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_populate_sysroot: Succeeded
NOTE: package commons-net-native-1.4.1-r0: task do_patch: Started
NOTE: package commons-net-native-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1107 of 5581 (ID: 2965, virtual:native:/home/oe/openembedded/recipes/curl/curl_7.21.2.bb, do_unpack)
NOTE: Running task 1108 of 5581 (ID: 4091, virtual:native:/home/oe/openembedded/recipes/jdepend/jdepend_2.9.bb, do_removebinaries)
NOTE: package curl-native-7.21.2-r5.0: task do_unpack: Started
NOTE: Unpacking ../sources/curl-7.21.2.tar.bz2 to tmp/work/x86_64-linux/curl-native-7.21.2-r5.0/
NOTE: Running task 1109 of 5581 (ID: 4090, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_unpackpost)
NOTE: package jdepend-native-2.9-r0: task do_removebinaries: Started
NOTE: package junit-native-3.8.2-r0: task do_unpackpost: Started
NOTE: package junit-native-3.8.2-r0: task do_unpackpost: Succeeded
NOTE: package jdepend-native-2.9-r0: task do_removebinaries: Succeeded
NOTE: Running task 1110 of 5581 (ID: 4093, virtual:native:/home/oe/openembedded/recipes/jdepend/jdepend_2.9.bb, do_patch)
NOTE: Running task 1111 of 5581 (ID: 4075, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_removebinaries)
NOTE: package jdepend-native-2.9-r0: task do_patch: Started
NOTE: package jdepend-native-2.9-r0: task do_patch: Succeeded
NOTE: package junit-native-3.8.2-r0: task do_removebinaries: Started
NOTE: package junit-native-3.8.2-r0: task do_removebinaries: Succeeded
NOTE: Running task 1112 of 5581 (ID: 3923, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb, do_removebinaries)
NOTE: package bsf-native-2.4.0-r1: task do_removebinaries: Started
NOTE: package bsf-native-2.4.0-r1: task do_removebinaries: Succeeded
NOTE: Running task 1113 of 5581 (ID: 4077, virtual:native:/home/oe/openembedded/recipes/junit/junit_3.8.2.bb, do_patch)
NOTE: Running task 1114 of 5581 (ID: 3925, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb, do_patch)
NOTE: package junit-native-3.8.2-r0: task do_patch: Started
NOTE: package junit-native-3.8.2-r0: task do_patch: Succeeded
NOTE: package bsf-native-2.4.0-r1: task do_patch: Started
NOTE: package bsf-native-2.4.0-r1: task do_patch: Succeeded
NOTE: package curl-native-7.21.2-r5.0: task do_unpack: Succeeded
NOTE: Running task 1115 of 5581 (ID: 3908, virtual:native:/home/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb, do_removebinaries)
NOTE: Running task 1116 of 5581 (ID: 3190, /home/oe/openembedded/recipes/policykit/policykit_0.100.bb, do_patch)
NOTE: package jsch-native-0.1.40-r2: task do_removebinaries: Started
NOTE: package jsch-native-0.1.40-r2: task do_removebinaries: Succeeded
NOTE: package policykit-0.100-r0: task do_patch: Started
NOTE: package policykit-0.100-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 5581 (ID: 3176, /home/oe/openembedded/recipes/gnome/orbit2_2.14.17.bb, do_patch)
NOTE: package orbit2-2.14.17-r0: task do_patch: Started
NOTE: Running task 1118 of 5581 (ID: 3910, virtual:native:/home/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb, do_patch)
NOTE: package jsch-native-0.1.40-r2: task do_patch: Started
NOTE: package jsch-native-0.1.40-r2: task do_patch: Succeeded
NOTE: Running task 1119 of 5581 (ID: 1661, /home/oe/openembedded/recipes/gnome/gconf_2.28.0.bb, do_setscene)
NOTE: package gconf-2.28.0-r2: task do_setscene: Started
NOTE: Running task 1120 of 5581 (ID: 4274, virtual:native:/home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_setscene)
NOTE: Applying patch 'configure-lossage.patch' (../openembedded/recipes/gnome/orbit2-2.14.17/configure-lossage.patch)
NOTE: package jpeg-native-8b-r1: task do_setscene: Started
NOTE: package jpeg-native-8b-r1: task do_setscene: Succeeded
NOTE: Applying patch 'pkgconfig-fix.patch' (../openembedded/recipes/gnome/orbit2/pkgconfig-fix.patch)
NOTE: Running task 1121 of 5581 (ID: 4273, virtual:native:/home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_fetch)
NOTE: package gconf-2.28.0-r2: task do_setscene: Succeeded
NOTE: package jpeg-native-8b-r1: task do_fetch: Started
NOTE: package jpeg-native-8b-r1: task do_fetch: Succeeded
NOTE: Running task 1122 of 5581 (ID: 1660, /home/oe/openembedded/recipes/gnome/gconf_2.28.0.bb, do_fetch)
NOTE: package gconf-2.28.0-r2: task do_fetch: Started
NOTE: package gconf-2.28.0-r2: task do_fetch: Succeeded
NOTE: Running task 1123 of 5581 (ID: 4266, virtual:native:/home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_unpack)
NOTE: Applying patch 'disable-ipv6.patch' (../openembedded/recipes/gnome/orbit2-2.14.17/disable-ipv6.patch)
NOTE: package jpeg-native-8b-r1: task do_unpack: Started
NOTE: Unpacking ../sources/jpegsrc.v8b.tar.gz to tmp/work/x86_64-linux/jpeg-native-8b-r1/
NOTE: package jpeg-native-8b-r1: task do_unpack: Succeeded
NOTE: Running task 1124 of 5581 (ID: 1653, /home/oe/openembedded/recipes/gnome/gconf_2.28.0.bb, do_unpack)
NOTE: package gconf-2.28.0-r2: task do_unpack: Started
NOTE: Unpacking ../sources/GConf-2.28.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gconf-2.28.0-r2/
NOTE: package orbit2-2.14.17-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 5581 (ID: 4260, virtual:native:/home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_setscene)
NOTE: package giflib-native-4.1.6-r2: task do_setscene: Started
NOTE: Running task 1126 of 5581 (ID: 4218, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_setscene)
NOTE: package libxt-native-1_1.1.1-r9.0: task do_setscene: Started
NOTE: package libxt-native-1_1.1.1-r9.0: task do_setscene: Succeeded
NOTE: Running task 1127 of 5581 (ID: 4217, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_fetch)
NOTE: package libxt-native-1_1.1.1-r9.0: task do_fetch: Started
NOTE: package libxt-native-1_1.1.1-r9.0: task do_fetch: Succeeded
NOTE: package giflib-native-4.1.6-r2: task do_setscene: Succeeded
NOTE: Running task 1128 of 5581 (ID: 4259, virtual:native:/home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_fetch)
NOTE: Running task 1129 of 5581 (ID: 4210, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_unpack)
NOTE: package giflib-native-4.1.6-r2: task do_fetch: Started
NOTE: package gconf-2.28.0-r2: task do_unpack: Succeeded
NOTE: package libxt-native-1_1.1.1-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXt-1.1.1.tar.bz2 to tmp/work/x86_64-linux/libxt-native-1_1.1.1-r9.0/
NOTE: package libxt-native-1_1.1.1-r9.0: task do_unpack: Succeeded
NOTE: Running task 1130 of 5581 (ID: 4146, /home/oe/openembedded/recipes/classpath/classpath-tools-native.bb, do_setscene)
NOTE: Running task 1131 of 5581 (ID: 2382, /home/oe/openembedded/recipes/libsndfile/libsndfile1_1.0.24.bb, do_patch)
NOTE: package libsndfile1-1.0.24-r0: task do_patch: Started
NOTE: package libsndfile1-1.0.24-r0: task do_patch: Succeeded
NOTE: package classpath-tools-native-1.0-r1: task do_setscene: Started
NOTE: Running task 1132 of 5581 (ID: 2340, /home/oe/openembedded/recipes/gstreamer/gst-plugins-base_0.10.32.bb, do_patch)
NOTE: package classpath-tools-native-1.0-r1: task do_setscene: Succeeded
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_patch: Started
NOTE: Applying patch 'ivorbis-thumb.patch' (../openembedded/recipes/gstreamer/gst-plugins-base/ivorbis-thumb.patch)
NOTE: Running task 1133 of 5581 (ID: 4145, /home/oe/openembedded/recipes/classpath/classpath-tools-native.bb, do_fetch)
NOTE: package gst-plugins-base-0.10.32-r11.1: task do_patch: Succeeded
NOTE: package classpath-tools-native-1.0-r1: task do_fetch: Started
NOTE: package classpath-tools-native-1.0-r1: task do_fetch: Succeeded
NOTE: package giflib-native-4.1.6-r2: task do_fetch: Succeeded
NOTE: Running task 1134 of 5581 (ID: 4138, /home/oe/openembedded/recipes/classpath/classpath-tools-native.bb, do_unpack)
NOTE: package classpath-tools-native-1.0-r1: task do_unpack: Started
NOTE: Running task 1135 of 5581 (ID: 2116, /home/oe/openembedded/recipes/tcltk/tk_8.5.8.bb, do_patch)
NOTE: Unpacking ../openembedded/recipes/classpath/classpath-tools-native.bb to tmp/work/x86_64-linux/classpath-tools-native-1.0-r1/
NOTE: package classpath-tools-native-1.0-r1: task do_unpack: Succeeded
NOTE: package tk-8.5.8-r3: task do_patch: Started
NOTE: Applying patch 'confsearch.diff' (../openembedded/recipes/tcltk/tk-8.5.8/confsearch.diff)
NOTE: Running task 1136 of 5581 (ID: 4252, virtual:native:/home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_unpack)
NOTE: package giflib-native-4.1.6-r2: task do_unpack: Started
NOTE: Unpacking ../sources/giflib-4.1.6.tar.bz2 to tmp/work/x86_64-linux/giflib-native-4.1.6-r2/
NOTE: Running task 1137 of 5581 (ID: 2060, /home/oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb, do_patch)
NOTE: package giflib-native-4.1.6-r2: task do_unpack: Succeeded
NOTE: package gdbm-1.8.3-r5: task do_patch: Started
NOTE: Applying patch 'makefile.patch' (../openembedded/recipes/gdbm/gdbm-1.8.3/makefile.patch)
NOTE: Running task 1138 of 5581 (ID: 2046, /home/oe/openembedded/recipes/db/db_5.1.19.bb, do_patch)
NOTE: Applying patch 'libtool-mode.patch' (../openembedded/recipes/gdbm/gdbm-1.8.3/libtool-mode.patch)
NOTE: package db-5.1.19-r2: task do_patch: Started
NOTE: Applying patch 'arm-thumb-mutex_db5.patch' (../openembedded/recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch)
NOTE: package db-5.1.19-r2: task do_patch: Succeeded
NOTE: Applying patch 'manpages.diff' (../openembedded/recipes/tcltk/tk-8.5.8/manpages.diff)
NOTE: Applying patch 'non-linux.diff' (../openembedded/recipes/tcltk/tk-8.5.8/non-linux.diff)
NOTE: Running task 1139 of 5581 (ID: 2575, /home/oe/openembedded/recipes/xorg-lib/libxi_1.4.2.bb, do_setscene)
NOTE: package libxi-1_1.4.2-r9.0: task do_setscene: Started
NOTE: Applying patch 'chmod.patch' (../openembedded/recipes/gdbm/gdbm-1.8.3/chmod.patch)
NOTE: package gdbm-1.8.3-r5: task do_patch: Succeeded
NOTE: Applying patch 'rpath.diff' (../openembedded/recipes/tcltk/tk-8.5.8/rpath.diff)
NOTE: Applying patch 'tklibrary.diff' (../openembedded/recipes/tcltk/tk-8.5.8/tklibrary.diff)
NOTE: Running task 1140 of 5581 (ID: 1041, /home/oe/openembedded/recipes/bluez/bluez4_4.91.bb, do_setscene)
NOTE: package libxi-1_1.4.2-r9.0: task do_setscene: Succeeded
NOTE: Running task 1141 of 5581 (ID: 2574, /home/oe/openembedded/recipes/xorg-lib/libxi_1.4.2.bb, do_fetch)
NOTE: package libxi-1_1.4.2-r9.0: task do_fetch: Started
NOTE: Applying patch 'tkprivate.diff' (../openembedded/recipes/tcltk/tk-8.5.8/tkprivate.diff)
NOTE: Applying patch 'fix-xft.diff' (../openembedded/recipes/tcltk/tk-8.5.8/fix-xft.diff)
NOTE: package bluez4-4.91-r8.1: task do_setscene: Started
NOTE: package libxi-1_1.4.2-r9.0: task do_fetch: Succeeded
NOTE: package bluez4-4.91-r8.1: task do_setscene: Succeeded
NOTE: Running task 1142 of 5581 (ID: 1040, /home/oe/openembedded/recipes/bluez/bluez4_4.91.bb, do_fetch)
NOTE: package bluez4-4.91-r8.1: task do_fetch: Started
NOTE: Running task 1143 of 5581 (ID: 2567, /home/oe/openembedded/recipes/xorg-lib/libxi_1.4.2.bb, do_unpack)
NOTE: package libxi-1_1.4.2-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXi-1.4.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxi-1_1.4.2-r9.0/
NOTE: package tk-8.5.8-r3: task do_patch: Succeeded
NOTE: Running task 1144 of 5581 (ID: 559, /home/oe/openembedded/recipes/python/python_2.6.6.bb, do_setscene)
NOTE: package python-2.6.6-ml12.2: task do_setscene: Started
NOTE: package libxi-1_1.4.2-r9.0: task do_unpack: Succeeded
NOTE: package python-2.6.6-ml12.2: task do_setscene: Succeeded
NOTE: Running task 1145 of 5581 (ID: 1983, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info_0.51.bb, do_setscene)
NOTE: package shared-mime-info-0.51-r2: task do_setscene: Started
NOTE: package bluez4-4.91-r8.1: task do_fetch: Succeeded
NOTE: Running task 1146 of 5581 (ID: 1033, /home/oe/openembedded/recipes/bluez/bluez4_4.91.bb, do_unpack)
NOTE: package bluez4-4.91-r8.1: task do_unpack: Started
NOTE: Unpacking ../sources/bluez-4.91.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/bluez4-4.91-r8.1/
NOTE: Running task 1147 of 5581 (ID: 558, /home/oe/openembedded/recipes/python/python_2.6.6.bb, do_fetch)
NOTE: package python-2.6.6-ml12.2: task do_fetch: Started
NOTE: package shared-mime-info-0.51-r2: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/bluez/files/bluetooth.conf to tmp/work/armv5te-angstrom-linux-gnueabi/bluez4-4.91-r8.1/
NOTE: Running task 1148 of 5581 (ID: 1982, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info_0.51.bb, do_fetch)
NOTE: package bluez4-4.91-r8.1: task do_unpack: Succeeded
NOTE: package python-2.6.6-ml12.2: task do_fetch: Succeeded
NOTE: package shared-mime-info-0.51-r2: task do_fetch: Started
NOTE: package shared-mime-info-0.51-r2: task do_fetch: Succeeded
NOTE: Running task 1149 of 5581 (ID: 1955, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_setscene)
NOTE: Running task 1150 of 5581 (ID: 551, /home/oe/openembedded/recipes/python/python_2.6.6.bb, do_unpack)
NOTE: package gconf-native-2.6.1-r1: task do_setscene: Started
NOTE: package python-2.6.6-ml12.2: task do_unpack: Started
NOTE: Unpacking ../sources/Python-2.6.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/python-2.6.6-ml12.2/
NOTE: Running task 1151 of 5581 (ID: 1975, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info_0.51.bb, do_unpack)
NOTE: package shared-mime-info-0.51-r2: task do_unpack: Started
NOTE: Unpacking ../sources/shared-mime-info-0.51.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/shared-mime-info-0.51-r2/
NOTE: package gconf-native-2.6.1-r1: task do_setscene: Succeeded
NOTE: package shared-mime-info-0.51-r2: task do_unpack: Succeeded
NOTE: Running task 1152 of 5581 (ID: 1954, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_fetch)
NOTE: package gconf-native-2.6.1-r1: task do_fetch: Started
NOTE: package gconf-native-2.6.1-r1: task do_fetch: Succeeded
NOTE: Running task 1153 of 5581 (ID: 1941, /home/oe/openembedded/recipes/gnome/gnome-common_2.28.0.bb, do_setscene)
NOTE: Running task 1154 of 5581 (ID: 1947, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_unpack)
NOTE: package gconf-native-2.6.1-r1: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/gnome/gconf-native_2.6.1.bb to tmp/work/x86_64-linux/gconf-native-2.6.1-r1/
NOTE: package gconf-native-2.6.1-r1: task do_unpack: Succeeded
NOTE: Running task 1155 of 5581 (ID: 3253, /home/oe/openembedded/recipes/xorg-proto/recordproto_1.14.1.bb, do_setscene)
NOTE: package gnome-common-2.28.0-r0: task do_setscene: Started
NOTE: package recordproto-1_1.14.1-r2.0: task do_setscene: Started
NOTE: package gnome-common-2.28.0-r0: task do_setscene: Succeeded
NOTE: package recordproto-1_1.14.1-r2.0: task do_setscene: Succeeded
NOTE: Running task 1156 of 5581 (ID: 1940, /home/oe/openembedded/recipes/gnome/gnome-common_2.28.0.bb, do_fetch)
NOTE: package gnome-common-2.28.0-r0: task do_fetch: Started
NOTE: Running task 1157 of 5581 (ID: 3252, /home/oe/openembedded/recipes/xorg-proto/recordproto_1.14.1.bb, do_fetch)
NOTE: package recordproto-1_1.14.1-r2.0: task do_fetch: Started
NOTE: package gnome-common-2.28.0-r0: task do_fetch: Succeeded
NOTE: package recordproto-1_1.14.1-r2.0: task do_fetch: Succeeded
NOTE: Running task 1158 of 5581 (ID: 1933, /home/oe/openembedded/recipes/gnome/gnome-common_2.28.0.bb, do_unpack)
NOTE: package gnome-common-2.28.0-r0: task do_unpack: Started
NOTE: Unpacking ../sources/gnome-common-2.28.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gnome-common-2.28.0-r0/
NOTE: package gnome-common-2.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 5581 (ID: 3245, /home/oe/openembedded/recipes/xorg-proto/recordproto_1.14.1.bb, do_unpack)
NOTE: package recordproto-1_1.14.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/recordproto-1.14.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/recordproto-1_1.14.1-r2.0/
NOTE: package recordproto-1_1.14.1-r2.0: task do_unpack: Succeeded
NOTE: Running task 1160 of 5581 (ID: 5153, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_setscene)
NOTE: Running task 1161 of 5581 (ID: 20, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_patch)
NOTE: package llvm-common-native-1.0-r3: task do_setscene: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_patch: Started
NOTE: Applying patch 'index-ignore-filenotfound.patch' (../openembedded/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch)
NOTE: package llvm-common-native-1.0-r3: task do_setscene: Succeeded
NOTE: Running task 1162 of 5581 (ID: 5152, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_fetch)
NOTE: package llvm-common-native-1.0-r3: task do_fetch: Started
NOTE: Applying patch 'mtime-int.patch' (../openembedded/recipes/opkg-utils/opkg-utils/mtime-int.patch)
NOTE: package llvm-common-native-1.0-r3: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/python/python-2.6.6/sitecustomize.py to tmp/work/armv5te-angstrom-linux-gnueabi/python-2.6.6-ml12.2/
NOTE: Running task 1163 of 5581 (ID: 5145, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_unpack)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_patch: Succeeded
NOTE: package python-2.6.6-ml12.2: task do_unpack: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/llvm/llvm-common/llvm-config to tmp/work/x86_64-linux/llvm-common-native-1.0-r3/
NOTE: Running task 1164 of 5581 (ID: 2467, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_removebinaries)
NOTE: package xerces-j-2.9.1-r1: task do_removebinaries: Started
NOTE: Running task 1165 of 5581 (ID: 28, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_configure)
NOTE: package llvm-common-native-1.0-r3: task do_unpack: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_configure: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_configure: Succeeded
NOTE: Running task 1166 of 5581 (ID: 2466, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_unpackpost)
NOTE: package xerces-j-2.9.1-r1: task do_removebinaries: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_unpackpost: Started
NOTE: Running task 1167 of 5581 (ID: 3764, /home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_removebinaries)
NOTE: package regexp-1.5-r1: task do_removebinaries: Started
NOTE: Running task 1168 of 5581 (ID: 2966, virtual:native:/home/oe/openembedded/recipes/curl/curl_7.21.2.bb, do_patch)
NOTE: package regexp-1.5-r1: task do_removebinaries: Succeeded
NOTE: package curl-native-7.21.2-r5.0: task do_patch: Started
NOTE: Applying patch 'off_t_abi_fix.patch' (../openembedded/recipes/curl/files/off_t_abi_fix.patch)
NOTE: package curl-native-7.21.2-r5.0: task do_patch: Succeeded
NOTE: Running task 1169 of 5581 (ID: 3766, /home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_patch)
NOTE: package regexp-1.5-r1: task do_patch: Started
NOTE: Running task 1170 of 5581 (ID: 1927, /home/oe/openembedded/recipes/xorg-proto/xineramaproto_1.2.1.bb, do_setscene)
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_setscene: Started
NOTE: package regexp-1.5-r1: task do_patch: Succeeded
NOTE: Running task 1171 of 5581 (ID: 4302, virtual:native:/home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_setscene)
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_setscene: Succeeded
NOTE: package llvm2.7-native-2.7-r11: task do_setscene: Started
NOTE: Running task 1172 of 5581 (ID: 1926, /home/oe/openembedded/recipes/xorg-proto/xineramaproto_1.2.1.bb, do_fetch)
NOTE: package llvm2.7-native-2.7-r11: task do_setscene: Succeeded
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_fetch: Started
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_fetch: Succeeded
NOTE: Running task 1173 of 5581 (ID: 4301, virtual:native:/home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_fetch)
NOTE: package llvm2.7-native-2.7-r11: task do_fetch: Started
NOTE: Running task 1174 of 5581 (ID: 1919, /home/oe/openembedded/recipes/xorg-proto/xineramaproto_1.2.1.bb, do_unpack)
NOTE: package llvm2.7-native-2.7-r11: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/linux/linux-2.6.38/pcontrolg20/defconfig to tmp/work/pcontrolg20-angstrom-linux-gnueabi/linux-2.6.38-r4/
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/xineramaproto-1.2.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/xineramaproto-1_1.2.1-r2.0/
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_unpack: Succeeded
NOTE: package linux-2.6.38-r4: task do_unpack: Succeeded
NOTE: Running task 1175 of 5581 (ID: 4294, virtual:native:/home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_unpack)
NOTE: Running task 1176 of 5581 (ID: 3818, /home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_setscene)
NOTE: package llvm2.7-native-2.7-r11: task do_unpack: Started
NOTE: Unpacking ../sources/llvm-2.7.tgz to tmp/work/x86_64-linux/llvm2.7-native-2.7-r11/
NOTE: package bcel-5.2-r1: task do_setscene: Started
NOTE: Running task 1177 of 5581 (ID: 608, /home/oe/openembedded/recipes/linux/linux_2.6.38.bb, do_patch)
NOTE: package linux-2.6.38-r4: task do_patch: Started
NOTE: package bcel-5.2-r1: task do_setscene: Succeeded
NOTE: Applying patch 'patch-2.6.38.5' (tmp/work/pcontrolg20-angstrom-linux-gnueabi/linux-2.6.38-r4/patch-2.6.38.5)
NOTE: Applying patch 'pcontrolg20_2.6.38.patch' (../openembedded/recipes/linux/linux-2.6.38/pcontrolg20/pcontrolg20_2.6.38.patch)
NOTE: package llvm2.7-native-2.7-r11: task do_unpack: Succeeded
NOTE: Running task 1178 of 5581 (ID: 3817, /home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_fetch)
NOTE: package linux-2.6.38-r4: task do_patch: Succeeded
NOTE: package bcel-5.2-r1: task do_fetch: Started
NOTE: package bcel-5.2-r1: task do_fetch: Succeeded
NOTE: Running task 1179 of 5581 (ID: 3803, /home/oe/openembedded/recipes/cup/cup_0.10k.bb, do_setscene)
NOTE: package cup-0.10k-r1: task do_setscene: Started
NOTE: Running task 1180 of 5581 (ID: 3788, /home/oe/openembedded/recipes/jlex/jlex_1.2.6.bb, do_setscene)
NOTE: Running task 1181 of 5581 (ID: 3810, /home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_unpack)
NOTE: package jlex-1.2.6-r1: task do_setscene: Started
NOTE: package bcel-5.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/bcel-5.2-src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/bcel-5.2-r1/
NOTE: package bcel-5.2-r1: task do_unpack: Succeeded
NOTE: package cup-0.10k-r1: task do_setscene: Succeeded
NOTE: package jlex-1.2.6-r1: task do_setscene: Succeeded
NOTE: Running task 1182 of 5581 (ID: 3802, /home/oe/openembedded/recipes/cup/cup_0.10k.bb, do_fetch)
NOTE: package cup-0.10k-r1: task do_fetch: Started
NOTE: Running task 1183 of 5581 (ID: 3787, /home/oe/openembedded/recipes/jlex/jlex_1.2.6.bb, do_fetch)
NOTE: package cup-0.10k-r1: task do_fetch: Succeeded
NOTE: package xerces-j-2.9.1-r1: task do_unpackpost: Succeeded
NOTE: package jlex-1.2.6-r1: task do_fetch: Started
NOTE: package jlex-1.2.6-r1: task do_fetch: Succeeded
NOTE: Running task 1184 of 5581 (ID: 2582, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_removebinaries)
NOTE: package ant-native-1.7.1-r1: task do_removebinaries: Started
NOTE: package ant-native-1.7.1-r1: task do_removebinaries: Succeeded
NOTE: Running task 1185 of 5581 (ID: 2469, /home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_patch)
NOTE: Running task 1186 of 5581 (ID: 3795, /home/oe/openembedded/recipes/cup/cup_0.10k.bb, do_unpack)
NOTE: package xerces-j-2.9.1-r1: task do_patch: Started
NOTE: package cup-0.10k-r1: task do_unpack: Started
NOTE: Running task 1187 of 5581 (ID: 3780, /home/oe/openembedded/recipes/jlex/jlex_1.2.6.bb, do_unpack)
NOTE: package xerces-j-2.9.1-r1: task do_patch: Succeeded
NOTE: Unpacking ../sources/java_cup_v10k.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/cup-0.10k-r1/
NOTE: Unpacking ../openembedded/recipes/cup/files/cup to tmp/work/armv5te-angstrom-linux-gnueabi/cup-0.10k-r1/
NOTE: package cup-0.10k-r1: task do_unpack: Succeeded
NOTE: package jlex-1.2.6-r1: task do_unpack: Started
NOTE: Unpacking ../sources/Main.java to tmp/work/armv5te-angstrom-linux-gnueabi/jlex-1.2.6-r1/
NOTE: Unpacking ../openembedded/recipes/jlex/files/jlex to tmp/work/armv5te-angstrom-linux-gnueabi/jlex-1.2.6-r1/
NOTE: package jlex-1.2.6-r1: task do_unpack: Succeeded
NOTE: Running task 1188 of 5581 (ID: 2581, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_removecruft)
NOTE: package ant-native-1.7.1-r1: task do_removecruft: Started
NOTE: package ant-native-1.7.1-r1: task do_removecruft: Succeeded
NOTE: Running task 1189 of 5581 (ID: 1351, /home/oe/openembedded/recipes/git/git-native_1.7.3.5.bb, do_setscene)
NOTE: Running task 1190 of 5581 (ID: 1654, /home/oe/openembedded/recipes/gnome/gconf_2.28.0.bb, do_patch)
NOTE: package git-native-1.7.3.5-r0: task do_setscene: Started
NOTE: package gconf-2.28.0-r2: task do_patch: Started
NOTE: Running task 1191 of 5581 (ID: 4267, virtual:native:/home/oe/openembedded/recipes/jpeg/jpeg_8b.bb, do_patch)
NOTE: package gconf-2.28.0-r2: task do_patch: Succeeded
NOTE: package jpeg-native-8b-r1: task do_patch: Started
NOTE: Applying patch '0001-configure-make-jpeg-work-with-older-autotools.patch' (../openembedded/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch)
NOTE: Running task 1192 of 5581 (ID: 2584, /home/oe/openembedded/recipes/ant/ant-native_1.7.1.bb, do_patch)
NOTE: package ant-native-1.7.1-r1: task do_patch: Started
NOTE: package ant-native-1.7.1-r1: task do_patch: Succeeded
NOTE: Running task 1193 of 5581 (ID: 4253, virtual:native:/home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_patch)
NOTE: package giflib-native-4.1.6-r2: task do_patch: Started
NOTE: Running task 1194 of 5581 (ID: 4211, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxt_1.1.1.bb, do_patch)
NOTE: package git-native-1.7.3.5-r0: task do_setscene: Succeeded
NOTE: package giflib-native-4.1.6-r2: task do_patch: Succeeded
NOTE: package jpeg-native-8b-r1: task do_patch: Succeeded
NOTE: package libxt-native-1_1.1.1-r9.0: task do_patch: Started
NOTE: package libxt-native-1_1.1.1-r9.0: task do_patch: Succeeded
NOTE: Running task 1195 of 5581 (ID: 1350, /home/oe/openembedded/recipes/git/git-native_1.7.3.5.bb, do_fetch)
NOTE: package git-native-1.7.3.5-r0: task do_fetch: Started
NOTE: Running task 1196 of 5581 (ID: 4139, /home/oe/openembedded/recipes/classpath/classpath-tools-native.bb, do_patch)
NOTE: package classpath-tools-native-1.0-r1: task do_patch: Started
NOTE: Running task 1197 of 5581 (ID: 2619, /home/oe/openembedded/recipes/icedtea/icedtea6-native_1.7.10.bb, do_setscene)
NOTE: Running task 1198 of 5581 (ID: 2568, /home/oe/openembedded/recipes/xorg-lib/libxi_1.4.2.bb, do_patch)
NOTE: package libxi-1_1.4.2-r9.0: task do_patch: Started
NOTE: package git-native-1.7.3.5-r0: task do_fetch: Succeeded
NOTE: package classpath-tools-native-1.0-r1: task do_patch: Succeeded
NOTE: package icedtea6-native-1.7.10-r4.0: task do_setscene: Started
NOTE: package libxi-1_1.4.2-r9.0: task do_patch: Succeeded
NOTE: Running task 1199 of 5581 (ID: 1343, /home/oe/openembedded/recipes/git/git-native_1.7.3.5.bb, do_unpack)
NOTE: Running task 1200 of 5581 (ID: 3351, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_setscene)
NOTE: package git-native-1.7.3.5-r0: task do_unpack: Started
NOTE: package tzcode-native-2011e-r4.0: task do_setscene: Started
NOTE: Unpacking ../sources/git-1.7.3.5.tar.bz2 to tmp/work/x86_64-linux/git-native-1.7.3.5-r0/
NOTE: Running task 1201 of 5581 (ID: 1034, /home/oe/openembedded/recipes/bluez/bluez4_4.91.bb, do_patch)
NOTE: package bluez4-4.91-r8.1: task do_patch: Started
NOTE: Applying patch 'fix-dfutool-usb-declaration-mismatch.patch' (../openembedded/recipes/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch)
NOTE: package bluez4-4.91-r8.1: task do_patch: Succeeded
NOTE: package icedtea6-native-1.7.10-r4.0: task do_setscene: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_setscene: Succeeded
NOTE: Running task 1202 of 5581 (ID: 2618, /home/oe/openembedded/recipes/icedtea/icedtea6-native_1.7.10.bb, do_fetch)
NOTE: package icedtea6-native-1.7.10-r4.0: task do_fetch: Started
NOTE: Running task 1203 of 5581 (ID: 3350, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_fetch)
NOTE: Running task 1204 of 5581 (ID: 552, /home/oe/openembedded/recipes/python/python_2.6.6.bb, do_patch)
NOTE: package tzcode-native-2011e-r4.0: task do_fetch: Started
NOTE: package tzcode-native-2011e-r4.0: task do_fetch: Succeeded
NOTE: package python-2.6.6-ml12.2: task do_patch: Started
NOTE: Applying patch '00-fix-parallel-make.patch' (../openembedded/recipes/python/python-2.6.6/00-fix-parallel-make.patch)
NOTE: Running task 1205 of 5581 (ID: 3343, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_unpack)
NOTE: package tzcode-native-2011e-r4.0: task do_unpack: Started
NOTE: Unpacking ../sources/tzcode2011e.tar.gz to tmp/work/x86_64-linux/tzcode-native-2011e-r4.0/tzcode-2011e/
NOTE: Unpacking ../sources/tzdata2011e.tar.gz to tmp/work/x86_64-linux/tzcode-native-2011e-r4.0/tzcode-2011e/
NOTE: package tzcode-native-2011e-r4.0: task do_unpack: Succeeded
NOTE: package git-native-1.7.3.5-r0: task do_unpack: Succeeded
NOTE: Applying patch '01-use-proper-tools-for-cross-build.patch' (../openembedded/recipes/python/python-2.6.6/01-use-proper-tools-for-cross-build.patch)
NOTE: Applying patch '02-remove-test-for-cross.patch' (../openembedded/recipes/python/python-2.6.6/02-remove-test-for-cross.patch)
NOTE: Applying patch '03-fix-tkinter-detection.patch' (../openembedded/recipes/python/python-2.6.6/03-fix-tkinter-detection.patch)
NOTE: Running task 1206 of 5581 (ID: 1843, /home/oe/openembedded/recipes/libpcap/libpcap_1.1.1.bb, do_setscene)
NOTE: Applying patch '04-default-is-optimized.patch' (../openembedded/recipes/python/python-2.6.6/04-default-is-optimized.patch)
NOTE: Applying patch '05-enable-ctypes-cross-build.patch' (../openembedded/recipes/python/python-2.6.6/05-enable-ctypes-cross-build.patch)
NOTE: package libpcap-1.1.1-r1: task do_setscene: Started
NOTE: Running task 1207 of 5581 (ID: 1976, /home/oe/openembedded/recipes/shared-mime-info/shared-mime-info_0.51.bb, do_patch)
NOTE: package shared-mime-info-0.51-r2: task do_patch: Started
NOTE: package shared-mime-info-0.51-r2: task do_patch: Succeeded
NOTE: Running task 1208 of 5581 (ID: 1948, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_patch)
NOTE: package gconf-native-2.6.1-r1: task do_patch: Started
NOTE: Applying patch '06-ctypes-libffi-fix-configure.patch' (../openembedded/recipes/python/python-2.6.6/06-ctypes-libffi-fix-configure.patch)
NOTE: package gconf-native-2.6.1-r1: task do_patch: Succeeded
NOTE: Applying patch 'ipv6-cross.patch' (../openembedded/recipes/python/python-2.6.6/ipv6-cross.patch)
NOTE: package icedtea6-native-1.7.10-r4.0: task do_fetch: Succeeded
NOTE: Applying patch 'python-module-rpath-fix.patch' (../openembedded/recipes/python/python-2.6.6/python-module-rpath-fix.patch)
NOTE: package python-2.6.6-ml12.2: task do_patch: Succeeded
NOTE: Running task 1209 of 5581 (ID: 1956, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_configure)
NOTE: package libpcap-1.1.1-r1: task do_setscene: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_configure: Started
NOTE: package gconf-native-2.6.1-r1: task do_configure: Succeeded
NOTE: Running task 1210 of 5581 (ID: 2611, /home/oe/openembedded/recipes/icedtea/icedtea6-native_1.7.10.bb, do_unpack)
NOTE: package icedtea6-native-1.7.10-r4.0: task do_unpack: Started
NOTE: Running task 1211 of 5581 (ID: 1934, /home/oe/openembedded/recipes/gnome/gnome-common_2.28.0.bb, do_patch)
NOTE: package gnome-common-2.28.0-r0: task do_patch: Started
NOTE: Running task 1212 of 5581 (ID: 1842, /home/oe/openembedded/recipes/libpcap/libpcap_1.1.1.bb, do_fetch)
NOTE: Unpacking ../sources/icedtea6-1.7.10.tar.gz to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Applying patch 'omf.patch' (../openembedded/recipes/gnome/gnome-common/omf.patch)
NOTE: package libpcap-1.1.1-r1: task do_fetch: Started
NOTE: package libpcap-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 1213 of 5581 (ID: 3246, /home/oe/openembedded/recipes/xorg-proto/recordproto_1.14.1.bb, do_patch)
NOTE: package recordproto-1_1.14.1-r2.0: task do_patch: Started
NOTE: package recordproto-1_1.14.1-r2.0: task do_patch: Succeeded
NOTE: Running task 1214 of 5581 (ID: 1835, /home/oe/openembedded/recipes/libpcap/libpcap_1.1.1.bb, do_unpack)
NOTE: package libpcap-1.1.1-r1: task do_unpack: Started
NOTE: package gnome-common-2.28.0-r0: task do_patch: Succeeded
NOTE: Unpacking ../sources/libpcap-1.1.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libpcap-1.1.1-r1/
NOTE: package libpcap-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 1215 of 5581 (ID: 5146, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_patch)
NOTE: Unpacking ../sources/openjdk-6-src-b17-14_oct_2009.tar.gz to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/openjdk-src-dir/
NOTE: package llvm-common-native-1.0-r3: task do_patch: Started
NOTE: Running task 1216 of 5581 (ID: 4295, virtual:native:/home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_patch)
NOTE: package llvm-common-native-1.0-r3: task do_patch: Succeeded
NOTE: package llvm2.7-native-2.7-r11: task do_patch: Started
NOTE: Running task 1217 of 5581 (ID: 4288, /home/oe/openembedded/recipes/llvm/llvm-common.bb, do_setscene)
NOTE: Applying patch 'arm_ppc.patch' (../openembedded/recipes/llvm/llvm2.7/arm_ppc.patch)
NOTE: package llvm-common-1.0-r3: task do_setscene: Started
NOTE: Running task 1218 of 5581 (ID: 5154, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_configure)
NOTE: Applying patch 'r97745-llvmPR6480.patch' (../openembedded/recipes/llvm/llvm2.7/r97745-llvmPR6480.patch)
NOTE: package llvm-common-native-1.0-r3: task do_configure: Started
NOTE: package llvm-common-native-1.0-r3: task do_configure: Succeeded
NOTE: Applying patch 'r104558-VFPmisc.patch' (../openembedded/recipes/llvm/llvm2.7/r104558-VFPmisc.patch)
NOTE: Applying patch 'r104587-MOVimm32.patch' (../openembedded/recipes/llvm/llvm2.7/r104587-MOVimm32.patch)
NOTE: package llvm-common-1.0-r3: task do_setscene: Succeeded
NOTE: Running task 1219 of 5581 (ID: 4287, /home/oe/openembedded/recipes/llvm/llvm-common.bb, do_fetch)
NOTE: package llvm-common-1.0-r3: task do_fetch: Started
NOTE: package llvm-common-1.0-r3: task do_fetch: Succeeded
NOTE: Running task 1220 of 5581 (ID: 3860, /home/oe/openembedded/recipes/xorg-proto/printproto_1.0.5.bb, do_setscene)
NOTE: Applying patch 'r104652-VFPLoadStoreMultiple.patch' (../openembedded/recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch)
NOTE: Applying patch 'r104653-BFC-BFI.patch' (../openembedded/recipes/llvm/llvm2.7/r104653-BFC-BFI.patch)
NOTE: package printproto-1_1.0.5-r2.0: task do_setscene: Started
NOTE: Applying patch 'rawMOVLRPC.patch' (../openembedded/recipes/llvm/llvm2.7/rawMOVLRPC.patch)
NOTE: Running task 1221 of 5581 (ID: 4280, /home/oe/openembedded/recipes/llvm/llvm-common.bb, do_unpack)
NOTE: package llvm-common-1.0-r3: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/llvm/llvm-common/llvm-config to tmp/work/armv5te-angstrom-linux-gnueabi/llvm-common-1.0-r3/
NOTE: package llvm-common-1.0-r3: task do_unpack: Succeeded
NOTE: package printproto-1_1.0.5-r2.0: task do_setscene: Succeeded
NOTE: Applying patch 'include-fixes.patch' (../openembedded/recipes/llvm/llvm2.7/include-fixes.patch)
NOTE: Running task 1222 of 5581 (ID: 1675, /home/oe/openembedded/recipes/xorg-lib/libxtst_1.2.0.bb, do_setscene)
NOTE: package libxtst-1_1.2.0-r9.0: task do_setscene: Started
NOTE: package llvm2.7-native-2.7-r11: task do_patch: Succeeded
NOTE: Running task 1223 of 5581 (ID: 3859, /home/oe/openembedded/recipes/xorg-proto/printproto_1.0.5.bb, do_fetch)
NOTE: package printproto-1_1.0.5-r2.0: task do_fetch: Started
NOTE: package printproto-1_1.0.5-r2.0: task do_fetch: Succeeded
NOTE: Running task 1224 of 5581 (ID: 2605, /home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_setscene)
NOTE: package libffi-3.0.9-r0: task do_setscene: Started
NOTE: Running task 1225 of 5581 (ID: 3852, /home/oe/openembedded/recipes/xorg-proto/printproto_1.0.5.bb, do_unpack)
NOTE: package libxtst-1_1.2.0-r9.0: task do_setscene: Succeeded
NOTE: package printproto-1_1.0.5-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/printproto-1.0.5.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/printproto-1_1.0.5-r2.0/
NOTE: Running task 1226 of 5581 (ID: 1674, /home/oe/openembedded/recipes/xorg-lib/libxtst_1.2.0.bb, do_fetch)
NOTE: package libxtst-1_1.2.0-r9.0: task do_fetch: Started
NOTE: package libffi-3.0.9-r0: task do_setscene: Succeeded
NOTE: package printproto-1_1.0.5-r2.0: task do_unpack: Succeeded
NOTE: package libxtst-1_1.2.0-r9.0: task do_fetch: Succeeded
NOTE: Running task 1227 of 5581 (ID: 2604, /home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_fetch)
NOTE: Running task 1228 of 5581 (ID: 29, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_qa_configure)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_qa_configure: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_qa_configure: Succeeded
NOTE: Running task 1229 of 5581 (ID: 1667, /home/oe/openembedded/recipes/xorg-lib/libxtst_1.2.0.bb, do_unpack)
NOTE: package libxtst-1_1.2.0-r9.0: task do_unpack: Started
NOTE: package libffi-3.0.9-r0: task do_fetch: Started
NOTE: package libffi-3.0.9-r0: task do_fetch: Succeeded
NOTE: Unpacking ../sources/libXtst-1.2.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxtst-1_1.2.0-r9.0/
NOTE: Running task 1230 of 5581 (ID: 2597, /home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_unpack)
NOTE: package libxtst-1_1.2.0-r9.0: task do_unpack: Succeeded
NOTE: package libffi-3.0.9-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libffi-3.0.9.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libffi-3.0.9-r0/
NOTE: package libffi-3.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 5581 (ID: 30, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_compile)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_compile: Started
NOTE: Running task 1232 of 5581 (ID: 1920, /home/oe/openembedded/recipes/xorg-proto/xineramaproto_1.2.1.bb, do_patch)
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_patch: Started
NOTE: Running task 1233 of 5581 (ID: 1344, /home/oe/openembedded/recipes/git/git-native_1.7.3.5.bb, do_patch)
NOTE: package git-native-1.7.3.5-r0: task do_patch: Started
NOTE: package xineramaproto-1_1.2.1-r2.0: task do_patch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_compile: Succeeded
NOTE: package git-native-1.7.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 5581 (ID: 1580, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_package)
NOTE: package update-rc.d-native-0.7-r2: task do_package: Started
NOTE: Running task 1235 of 5581 (ID: 2491, /home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_setscene)
NOTE: package update-rc.d-native-0.7-r2: task do_package: Succeeded
NOTE: package rhino-1.7r1-r1: task do_setscene: Started
NOTE: Running task 1236 of 5581 (ID: 21, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_install)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_install: Started
NOTE: Running task 1237 of 5581 (ID: 1083, /home/oe/openembedded/recipes/tasks/task-boot.bb, do_setscene)
NOTE: package task-boot-1.0-r53: task do_setscene: Started
NOTE: package rhino-1.7r1-r1: task do_setscene: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_install: Succeeded
NOTE: Running task 1238 of 5581 (ID: 2490, /home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_fetch)
NOTE: package task-boot-1.0-r53: task do_setscene: Succeeded
NOTE: package rhino-1.7r1-r1: task do_fetch: Started
NOTE: package rhino-1.7r1-r1: task do_fetch: Succeeded
NOTE: Running task 1239 of 5581 (ID: 22, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_populate_sysroot)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_populate_sysroot: Started
NOTE: Legacy staging mode for /home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb
NOTE: Running task 1240 of 5581 (ID: 1082, /home/oe/openembedded/recipes/tasks/task-boot.bb, do_fetch)
NOTE: package task-boot-1.0-r53: task do_fetch: Started
NOTE: package task-boot-1.0-r53: task do_fetch: Succeeded
NOTE: Running task 1241 of 5581 (ID: 2483, /home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_unpack)
NOTE: package rhino-1.7r1-r1: task do_unpack: Started
NOTE: Unpacking ../sources/rhino1_7R1.zip to tmp/work/armv5te-angstrom-linux-gnueabi/rhino-1.7r1-r1/
NOTE: Running task 1242 of 5581 (ID: 1075, /home/oe/openembedded/recipes/tasks/task-boot.bb, do_unpack)
NOTE: package task-boot-1.0-r53: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/tasks/task-boot.bb to tmp/work/pcontrolg20-angstrom-linux-gnueabi/task-boot-1.0-r53/
NOTE: package task-boot-1.0-r53: task do_unpack: Succeeded
NOTE: Running task 1243 of 5581 (ID: 2137, virtual:native:/home/oe/openembedded/recipes/python/python-setuptools_0.6c11.bb, do_setscene)
NOTE: Unpacking ../openembedded/recipes/mozilla/rhino/rhino to tmp/work/armv5te-angstrom-linux-gnueabi/rhino-1.7r1-r1/
NOTE: package python-setuptools-native-0.6c11-ml2: task do_setscene: Started
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-disable-compilation.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Unpacking ../openembedded/recipes/mozilla/rhino/rhino-jsc to tmp/work/armv5te-angstrom-linux-gnueabi/rhino-1.7r1-r1/
NOTE: package rhino-1.7r1-r1: task do_unpack: Succeeded
NOTE: Running task 1244 of 5581 (ID: 2647, /home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_setscene)
NOTE: package llvm2.7-2.7-r11: task do_setscene: Started
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-freetype.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-ecj-fix-zlib.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-make-arch-sane-for-x86.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-jdk-sane-x86-arch.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: Unpacking ../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-unbreak-float.patch to tmp/work/x86_64-linux/icedtea6-native-1.7.10-r4.0/
NOTE: package icedtea6-native-1.7.10-r4.0: task do_unpack: Succeeded
NOTE: Running task 1245 of 5581 (ID: 2612, /home/oe/openembedded/recipes/icedtea/icedtea6-native_1.7.10.bb, do_patch)
NOTE: package icedtea6-native-1.7.10-r4.0: task do_patch: Started
NOTE: Applying patch 'disable-library-checks.patch' (../openembedded/recipes/icedtea/icedtea6-native-1.7.10/disable-library-checks.patch)
NOTE: Applying patch 'icedtea-fix-jar-path.patch' (../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-fix-jar-path.patch)
NOTE: Applying patch 'build-hacks-native.patch' (../openembedded/recipes/icedtea/icedtea6-native-1.7.10/build-hacks-native.patch)
NOTE: Applying patch 'icedtea-sane-x86-arch-name.patch' (../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-sane-x86-arch-name.patch)
NOTE: Applying patch 'icedtea-javac-in.patch' (../openembedded/recipes/icedtea/icedtea6-native-1.7.10/icedtea-javac-in.patch)
NOTE: package icedtea6-native-1.7.10-r4.0: task do_patch: Succeeded
NOTE: Running task 1246 of 5581 (ID: 2460, /home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_setscene)
NOTE: package xalan-j-2.7.1-r4: task do_setscene: Started
NOTE: package python-setuptools-native-0.6c11-ml2: task do_setscene: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_populate_sysroot: Succeeded
NOTE: Running task 1247 of 5581 (ID: 3344, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_patch)
NOTE: package tzcode-native-2011e-r4.0: task do_patch: Started
NOTE: package tzcode-native-2011e-r4.0: task do_patch: Succeeded
NOTE: Running task 1248 of 5581 (ID: 2136, virtual:native:/home/oe/openembedded/recipes/python/python-setuptools_0.6c11.bb, do_fetch)
NOTE: package xalan-j-2.7.1-r4: task do_setscene: Succeeded
NOTE: package llvm2.7-2.7-r11: task do_setscene: Succeeded
NOTE: package python-setuptools-native-0.6c11-ml2: task do_fetch: Started
NOTE: package python-setuptools-native-0.6c11-ml2: task do_fetch: Succeeded
NOTE: Running task 1249 of 5581 (ID: 2646, /home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_fetch)
NOTE: Running task 1250 of 5581 (ID: 2459, /home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_fetch)
NOTE: package llvm2.7-2.7-r11: task do_fetch: Started
NOTE: Running task 1251 of 5581 (ID: 3352, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_configure)
NOTE: package xalan-j-2.7.1-r4: task do_fetch: Started
NOTE: package tzcode-native-2011e-r4.0: task do_configure: Started
NOTE: Running task 1252 of 5581 (ID: 2129, virtual:native:/home/oe/openembedded/recipes/python/python-setuptools_0.6c11.bb, do_unpack)
NOTE: package python-setuptools-native-0.6c11-ml2: task do_unpack: Started
NOTE: Unpacking ../sources/setuptools-0.6c11.tar.gz to tmp/work/x86_64-linux/python-setuptools-native-0.6c11-ml2/
NOTE: package llvm2.7-2.7-r11: task do_fetch: Succeeded
NOTE: package xalan-j-2.7.1-r4: task do_fetch: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_configure: Succeeded
NOTE: package python-setuptools-native-0.6c11-ml2: task do_unpack: Succeeded
NOTE: Running task 1253 of 5581 (ID: 2639, /home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_unpack)
NOTE: Running task 1254 of 5581 (ID: 2452, /home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_unpack)
NOTE: package llvm2.7-2.7-r11: task do_unpack: Started
NOTE: package xalan-j-2.7.1-r4: task do_unpack: Started
NOTE: Running task 1255 of 5581 (ID: 2011, /home/oe/openembedded/recipes/tzdata/tzdata_2011e.bb, do_setscene)
NOTE: Unpacking ../sources/llvm-2.7.tgz to tmp/work/armv5te-angstrom-linux-gnueabi/llvm2.7-2.7-r11/
NOTE: Unpacking ../sources/xalan-j_2_7_1-src.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/xalan-j-2.7.1-r4/
NOTE: Running task 1256 of 5581 (ID: 1899, /home/oe/openembedded/recipes/gnome/libart-lgpl_2.3.20.bb, do_setscene)
NOTE: package tzdata-2011e-r9.0: task do_setscene: Started
NOTE: package libart-lgpl-2.3.20-r5.1: task do_setscene: Started
NOTE: package tzdata-2011e-r9.0: task do_setscene: Succeeded
NOTE: Running task 1257 of 5581 (ID: 2010, /home/oe/openembedded/recipes/tzdata/tzdata_2011e.bb, do_fetch)
NOTE: package tzdata-2011e-r9.0: task do_fetch: Started
NOTE: package tzdata-2011e-r9.0: task do_fetch: Succeeded
NOTE: Running task 1258 of 5581 (ID: 2003, /home/oe/openembedded/recipes/tzdata/tzdata_2011e.bb, do_unpack)
NOTE: package tzdata-2011e-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/tzdata2011e.tar.gz to tmp/work/all-angstrom-linux-gnueabi/tzdata-2011e-r9.0/tzdata-2011e/
NOTE: package tzdata-2011e-r9.0: task do_unpack: Succeeded
NOTE: package libart-lgpl-2.3.20-r5.1: task do_setscene: Succeeded
NOTE: Running task 1259 of 5581 (ID: 1871, /home/oe/openembedded/recipes/libcroco/libcroco_0.6.2.bb, do_setscene)
NOTE: package libcroco-0.6.2-r0: task do_setscene: Started
NOTE: Running task 1260 of 5581 (ID: 1898, /home/oe/openembedded/recipes/gnome/libart-lgpl_2.3.20.bb, do_fetch)
NOTE: package libart-lgpl-2.3.20-r5.1: task do_fetch: Started
NOTE: package libart-lgpl-2.3.20-r5.1: task do_fetch: Succeeded
NOTE: Unpacking ../sources/bsf-src-2.4.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/xalan-j-2.7.1-r4/
NOTE: package libcroco-0.6.2-r0: task do_setscene: Succeeded
NOTE: Running task 1261 of 5581 (ID: 1891, /home/oe/openembedded/recipes/gnome/libart-lgpl_2.3.20.bb, do_unpack)
NOTE: package libart-lgpl-2.3.20-r5.1: task do_unpack: Started
NOTE: Unpacking ../sources/libart_lgpl-2.3.20.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libart-lgpl-2.3.20-r5.1/
NOTE: Running task 1262 of 5581 (ID: 1870, /home/oe/openembedded/recipes/libcroco/libcroco_0.6.2.bb, do_fetch)
NOTE: package libcroco-0.6.2-r0: task do_fetch: Started
NOTE: package xalan-j-2.7.1-r4: task do_unpack: Succeeded
NOTE: package libcroco-0.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1263 of 5581 (ID: 1857, /home/oe/openembedded/recipes/bzip2/bzip2_1.0.6.bb, do_setscene)
NOTE: Unpacking ../openembedded/recipes/gnome/libart-lgpl/arm/art_config.h to tmp/work/armv5te-angstrom-linux-gnueabi/libart-lgpl-2.3.20-r5.1/arm/
NOTE: package llvm2.7-2.7-r11: task do_unpack: Succeeded
NOTE: Running task 1264 of 5581 (ID: 1863, /home/oe/openembedded/recipes/libcroco/libcroco_0.6.2.bb, do_unpack)
NOTE: package libcroco-0.6.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libcroco-0.6.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libcroco-0.6.2-r0/
NOTE: Running task 1265 of 5581 (ID: 1829, /home/oe/openembedded/recipes/lcms/lcms_1.17.bb, do_setscene)
NOTE: package bzip2-1.0.6-r0: task do_setscene: Started
NOTE: package libart-lgpl-2.3.20-r5.1: task do_unpack: Succeeded
NOTE: package lcms-1.17-r2: task do_setscene: Started
NOTE: package libcroco-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 5581 (ID: 1731, /home/oe/openembedded/recipes/gsoap/gsoap-native_2.7.13.bb, do_setscene)
NOTE: Running task 1267 of 5581 (ID: 1618, /home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_setscene)
NOTE: package gsoap-native-2.7.13-r0: task do_setscene: Started
NOTE: package gmp-5.0.1-r1.1: task do_setscene: Started
NOTE: package lcms-1.17-r2: task do_setscene: Succeeded
NOTE: package gsoap-native-2.7.13-r0: task do_setscene: Succeeded
NOTE: package bzip2-1.0.6-r0: task do_setscene: Succeeded
NOTE: Running task 1268 of 5581 (ID: 1856, /home/oe/openembedded/recipes/bzip2/bzip2_1.0.6.bb, do_fetch)
NOTE: Running task 1269 of 5581 (ID: 1828, /home/oe/openembedded/recipes/lcms/lcms_1.17.bb, do_fetch)
NOTE: package bzip2-1.0.6-r0: task do_fetch: Started
NOTE: package gmp-5.0.1-r1.1: task do_setscene: Succeeded
NOTE: package lcms-1.17-r2: task do_fetch: Started
NOTE: package lcms-1.17-r2: task do_fetch: Succeeded
NOTE: package bzip2-1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1270 of 5581 (ID: 1730, /home/oe/openembedded/recipes/gsoap/gsoap-native_2.7.13.bb, do_fetch)
NOTE: package gsoap-native-2.7.13-r0: task do_fetch: Started
NOTE: package gsoap-native-2.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 5581 (ID: 1617, /home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_fetch)
NOTE: Running task 1272 of 5581 (ID: 1849, /home/oe/openembedded/recipes/bzip2/bzip2_1.0.6.bb, do_unpack)
NOTE: package gmp-5.0.1-r1.1: task do_fetch: Started
NOTE: package bzip2-1.0.6-r0: task do_unpack: Started
NOTE: Running task 1273 of 5581 (ID: 1821, /home/oe/openembedded/recipes/lcms/lcms_1.17.bb, do_unpack)
NOTE: package gmp-5.0.1-r1.1: task do_fetch: Succeeded
NOTE: Unpacking ../sources/bzip2-1.0.6.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/bzip2-1.0.6-r0/
NOTE: package bzip2-1.0.6-r0: task do_unpack: Succeeded
NOTE: package lcms-1.17-r2: task do_unpack: Started
NOTE: Unpacking ../sources/lcms-1.17.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/lcms-1.17-r2/
NOTE: package lcms-1.17-r2: task do_unpack: Succeeded
NOTE: Running task 1274 of 5581 (ID: 1723, /home/oe/openembedded/recipes/gsoap/gsoap-native_2.7.13.bb, do_unpack)
NOTE: package gsoap-native-2.7.13-r0: task do_unpack: Started
NOTE: Unpacking ../sources/gsoap_2.7.13.tar.gz to tmp/work/x86_64-linux/gsoap-native-2.7.13-r0/
NOTE: Running task 1275 of 5581 (ID: 1610, /home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_unpack)
NOTE: Running task 1276 of 5581 (ID: 1836, /home/oe/openembedded/recipes/libpcap/libpcap_1.1.1.bb, do_patch)
NOTE: package gmp-5.0.1-r1.1: task do_unpack: Started
NOTE: Unpacking ../sources/gmp-5.0.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/gmp-5.0.1-r1.1/
NOTE: Running task 1277 of 5581 (ID: 1957, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_qa_configure)
NOTE: package libpcap-1.1.1-r1: task do_patch: Started
NOTE: Applying patch 'ieee80215-arphrd.patch' (../openembedded/recipes/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch)
NOTE: package gconf-native-2.6.1-r1: task do_qa_configure: Started
NOTE: package gconf-native-2.6.1-r1: task do_qa_configure: Succeeded
NOTE: package libpcap-1.1.1-r1: task do_patch: Succeeded
NOTE: package gsoap-native-2.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 1278 of 5581 (ID: 1958, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_compile)
NOTE: package gconf-native-2.6.1-r1: task do_compile: Started
NOTE: package gconf-native-2.6.1-r1: task do_compile: Succeeded
NOTE: Running task 1279 of 5581 (ID: 5167, /home/oe/openembedded/recipes/python/python-pygobject-native_2.20.0.bb, do_setscene)
NOTE: Running task 1280 of 5581 (ID: 5155, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_qa_configure)
NOTE: Running task 1281 of 5581 (ID: 1949, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_install)
NOTE: package gconf-native-2.6.1-r1: task do_install: Started
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_setscene: Started
NOTE: package llvm-common-native-1.0-r3: task do_qa_configure: Started
NOTE: package llvm-common-native-1.0-r3: task do_qa_configure: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_install: Succeeded
NOTE: Running task 1282 of 5581 (ID: 5156, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_compile)
NOTE: package gmp-5.0.1-r1.1: task do_unpack: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_compile: Started
NOTE: package llvm-common-native-1.0-r3: task do_compile: Succeeded
NOTE: Running task 1283 of 5581 (ID: 1950, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_populate_sysroot)
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_setscene: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_populate_sysroot: Started
NOTE: Running task 1284 of 5581 (ID: 4303, virtual:native:/home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_generate_toolchain_file)
NOTE: Running task 1285 of 5581 (ID: 5166, /home/oe/openembedded/recipes/python/python-pygobject-native_2.20.0.bb, do_fetch)
NOTE: package llvm2.7-native-2.7-r11: task do_generate_toolchain_file: Started
NOTE: package llvm2.7-native-2.7-r11: task do_generate_toolchain_file: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_populate_sysroot: Succeeded
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_fetch: Started
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_fetch: Succeeded
NOTE: Running task 1286 of 5581 (ID: 5147, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_install)
NOTE: package llvm-common-native-1.0-r3: task do_install: Started
NOTE: package llvm-common-native-1.0-r3: task do_install: Succeeded
NOTE: Running task 1287 of 5581 (ID: 4281, /home/oe/openembedded/recipes/llvm/llvm-common.bb, do_patch)
NOTE: Running task 1288 of 5581 (ID: 3853, /home/oe/openembedded/recipes/xorg-proto/printproto_1.0.5.bb, do_patch)
NOTE: package llvm-common-1.0-r3: task do_patch: Started
NOTE: Running task 1289 of 5581 (ID: 5159, /home/oe/openembedded/recipes/python/python-pygobject-native_2.20.0.bb, do_unpack)
NOTE: package printproto-1_1.0.5-r2.0: task do_patch: Started
NOTE: package printproto-1_1.0.5-r2.0: task do_patch: Succeeded
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_unpack: Started
NOTE: Unpacking ../sources/pygobject-2.20.0.tar.bz2 to tmp/work/x86_64-linux/python-pygobject-native-1_2.20.0-r3/
NOTE: Running task 1290 of 5581 (ID: 5148, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_populate_sysroot)
NOTE: package llvm-common-1.0-r3: task do_patch: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_populate_sysroot: Started
NOTE: Running task 1291 of 5581 (ID: 3809, /home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_removebinaries)
NOTE: Running task 1292 of 5581 (ID: 3794, /home/oe/openembedded/recipes/cup/cup_0.10k.bb, do_removebinaries)
NOTE: package cup-0.10k-r1: task do_removebinaries: Started
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_unpack: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_populate_sysroot: Succeeded
NOTE: package bcel-5.2-r1: task do_removebinaries: Started
NOTE: Running task 1293 of 5581 (ID: 3779, /home/oe/openembedded/recipes/jlex/jlex_1.2.6.bb, do_removebinaries)
NOTE: package bcel-5.2-r1: task do_removebinaries: Succeeded
NOTE: package cup-0.10k-r1: task do_removebinaries: Succeeded
NOTE: Running task 1294 of 5581 (ID: 1668, /home/oe/openembedded/recipes/xorg-lib/libxtst_1.2.0.bb, do_patch)
NOTE: package jlex-1.2.6-r1: task do_removebinaries: Started
NOTE: Running task 1295 of 5581 (ID: 3811, /home/oe/openembedded/recipes/bcel/bcel_5.2.bb, do_patch)
NOTE: package libxtst-1_1.2.0-r9.0: task do_patch: Started
NOTE: package libxtst-1_1.2.0-r9.0: task do_patch: Succeeded
NOTE: package jlex-1.2.6-r1: task do_removebinaries: Succeeded
NOTE: package bcel-5.2-r1: task do_patch: Started
NOTE: package bcel-5.2-r1: task do_patch: Succeeded
NOTE: Running task 1296 of 5581 (ID: 3796, /home/oe/openembedded/recipes/cup/cup_0.10k.bb, do_patch)
NOTE: package cup-0.10k-r1: task do_patch: Started
NOTE: Running task 1297 of 5581 (ID: 3781, /home/oe/openembedded/recipes/jlex/jlex_1.2.6.bb, do_patch)
NOTE: package jlex-1.2.6-r1: task do_patch: Started
NOTE: Running task 1298 of 5581 (ID: 2598, /home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_patch)
NOTE: package cup-0.10k-r1: task do_patch: Succeeded
NOTE: package jlex-1.2.6-r1: task do_patch: Succeeded
NOTE: package libffi-3.0.9-r0: task do_patch: Started
NOTE: package libffi-3.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1299 of 5581 (ID: 2676, virtual:native:/home/oe/openembedded/recipes/qemu/qemu_0.14.0.bb, do_setscene)
NOTE: package qemu-native-0.14.0-r3: task do_setscene: Started
NOTE: Running task 1300 of 5581 (ID: 2662, /home/oe/openembedded/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb, do_setscene)
NOTE: Running task 1301 of 5581 (ID: 2640, /home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_patch)
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_setscene: Started
NOTE: package llvm2.7-2.7-r11: task do_patch: Started
NOTE: Applying patch 'arm_ppc.patch' (../openembedded/recipes/llvm/llvm2.7/arm_ppc.patch)
NOTE: Running task 1302 of 5581 (ID: 2633, /home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_setscene)
NOTE: Applying patch 'r97745-llvmPR6480.patch' (../openembedded/recipes/llvm/llvm2.7/r97745-llvmPR6480.patch)
NOTE: Applying patch 'r104558-VFPmisc.patch' (../openembedded/recipes/llvm/llvm2.7/r104558-VFPmisc.patch)
NOTE: package fastjar-0.98-r4.2: task do_setscene: Started
NOTE: package qemu-native-0.14.0-r3: task do_setscene: Succeeded
NOTE: Applying patch 'r104587-MOVimm32.patch' (../openembedded/recipes/llvm/llvm2.7/r104587-MOVimm32.patch)
NOTE: package fastjar-0.98-r4.2: task do_setscene: Succeeded
NOTE: Running task 1303 of 5581 (ID: 2675, virtual:native:/home/oe/openembedded/recipes/qemu/qemu_0.14.0.bb, do_fetch)
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_setscene: Succeeded
NOTE: Applying patch 'r104652-VFPLoadStoreMultiple.patch' (../openembedded/recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch)
NOTE: Applying patch 'r104653-BFC-BFI.patch' (../openembedded/recipes/llvm/llvm2.7/r104653-BFC-BFI.patch)
NOTE: Applying patch 'rawMOVLRPC.patch' (../openembedded/recipes/llvm/llvm2.7/rawMOVLRPC.patch)
NOTE: package qemu-native-0.14.0-r3: task do_fetch: Started
NOTE: package qemu-native-0.14.0-r3: task do_fetch: Succeeded
NOTE: Running task 1304 of 5581 (ID: 2661, /home/oe/openembedded/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb, do_fetch)
NOTE: Running task 1305 of 5581 (ID: 2632, /home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_fetch)
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_fetch: Started
NOTE: package fastjar-0.98-r4.2: task do_fetch: Started
NOTE: package fastjar-0.98-r4.2: task do_fetch: Succeeded
NOTE: Applying patch 'include-fixes.patch' (../openembedded/recipes/llvm/llvm2.7/include-fixes.patch)
NOTE: package llvm2.7-2.7-r11: task do_patch: Succeeded
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_fetch: Succeeded
NOTE: Running task 1306 of 5581 (ID: 2668, virtual:native:/home/oe/openembedded/recipes/qemu/qemu_0.14.0.bb, do_unpack)
NOTE: package qemu-native-0.14.0-r3: task do_unpack: Started
NOTE: Unpacking ../sources/qemu-0.14.0.tar.gz to tmp/work/x86_64-linux/qemu-native-0.14.0-r3/
NOTE: Running task 1307 of 5581 (ID: 2547, /home/oe/openembedded/recipes/xorg-lib/libxp_1.0.1.bb, do_setscene)
NOTE: Running task 1308 of 5581 (ID: 2654, /home/oe/openembedded/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb, do_unpack)
NOTE: Running task 1309 of 5581 (ID: 2625, /home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_unpack)
NOTE: package libxp-1_1.0.1-r9.0: task do_setscene: Started
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_unpack: Started
NOTE: Unpacking ../sources/cacao-0.99.4.tar.bz2 to tmp/work/x86_64-linux/cacaoh-openjdk-native-0.99.4-r2/
NOTE: package fastjar-0.98-r4.2: task do_unpack: Started
NOTE: Unpacking ../sources/fastjar-0.98.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/fastjar-0.98-r4.2/
NOTE: package fastjar-0.98-r4.2: task do_unpack: Succeeded
NOTE: package qemu-native-0.14.0-r3: task do_unpack: Succeeded
NOTE: Running task 1310 of 5581 (ID: 2519, /home/oe/openembedded/recipes/xorg-lib/libxinerama_1.1.1.bb, do_setscene)
NOTE: package libxp-1_1.0.1-r9.0: task do_setscene: Succeeded
NOTE: package libxinerama-1_1.1.1-r9.0: task do_setscene: Started
NOTE: Running task 1311 of 5581 (ID: 2417, /home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_setscene)
NOTE: package giflib-4.1.6-r2: task do_setscene: Started
NOTE: Running task 1312 of 5581 (ID: 2546, /home/oe/openembedded/recipes/xorg-lib/libxp_1.0.1.bb, do_fetch)
NOTE: package libxp-1_1.0.1-r9.0: task do_fetch: Started
NOTE: package libxp-1_1.0.1-r9.0: task do_fetch: Succeeded
NOTE: package libxinerama-1_1.1.1-r9.0: task do_setscene: Succeeded
NOTE: Running task 1313 of 5581 (ID: 2539, /home/oe/openembedded/recipes/xorg-lib/libxp_1.0.1.bb, do_unpack)
NOTE: package libxp-1_1.0.1-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXp-1.0.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxp-1_1.0.1-r9.0/
NOTE: package libxp-1_1.0.1-r9.0: task do_unpack: Succeeded
NOTE: package giflib-4.1.6-r2: task do_setscene: Succeeded
NOTE: Running task 1314 of 5581 (ID: 2518, /home/oe/openembedded/recipes/xorg-lib/libxinerama_1.1.1.bb, do_fetch)
NOTE: package libxinerama-1_1.1.1-r9.0: task do_fetch: Started
NOTE: package libxinerama-1_1.1.1-r9.0: task do_fetch: Succeeded
NOTE: Running task 1315 of 5581 (ID: 2416, /home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_fetch)
NOTE: Running task 1316 of 5581 (ID: 293, /home/oe/openembedded/recipes/libdaemon/libdaemon_0.14.bb, do_setscene)
NOTE: Running task 1317 of 5581 (ID: 2511, /home/oe/openembedded/recipes/xorg-lib/libxinerama_1.1.1.bb, do_unpack)
NOTE: package giflib-4.1.6-r2: task do_fetch: Started
NOTE: package giflib-4.1.6-r2: task do_fetch: Succeeded
NOTE: package libdaemon-0.14-r0: task do_setscene: Started
NOTE: package libxinerama-1_1.1.1-r9.0: task do_unpack: Started
NOTE: Unpacking ../sources/libXinerama-1.1.1.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libxinerama-1_1.1.1-r9.0/
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_unpack: Succeeded
NOTE: package libxinerama-1_1.1.1-r9.0: task do_unpack: Succeeded
NOTE: Running task 1318 of 5581 (ID: 265, /home/oe/openembedded/recipes/libcap/libcap2_2.20.bb, do_setscene)
NOTE: Running task 1319 of 5581 (ID: 2409, /home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_unpack)
NOTE: package libdaemon-0.14-r0: task do_setscene: Succeeded
NOTE: package libcap2-2.20-r0: task do_setscene: Started
NOTE: package giflib-4.1.6-r2: task do_unpack: Started
NOTE: Unpacking ../sources/giflib-4.1.6.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/giflib-4.1.6-r2/
NOTE: Running task 1320 of 5581 (ID: 292, /home/oe/openembedded/recipes/libdaemon/libdaemon_0.14.bb, do_fetch)
NOTE: package libdaemon-0.14-r0: task do_fetch: Started
NOTE: package libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: package giflib-4.1.6-r2: task do_unpack: Succeeded
NOTE: Running task 1321 of 5581 (ID: 2235, /home/oe/openembedded/recipes/libnl/libnl_2.0.bb, do_setscene)
NOTE: package libnl-1_2.0-r5.0: task do_setscene: Started
NOTE: package libcap2-2.20-r0: task do_setscene: Succeeded
NOTE: Running task 1322 of 5581 (ID: 264, /home/oe/openembedded/recipes/libcap/libcap2_2.20.bb, do_fetch)
NOTE: package libcap2-2.20-r0: task do_fetch: Started
NOTE: Running task 1323 of 5581 (ID: 1076, /home/oe/openembedded/recipes/tasks/task-boot.bb, do_patch)
NOTE: package task-boot-1.0-r53: task do_patch: Started
NOTE: package libcap2-2.20-r0: task do_fetch: Succeeded
NOTE: package task-boot-1.0-r53: task do_patch: Succeeded
NOTE: package libnl-1_2.0-r5.0: task do_setscene: Succeeded
NOTE: Running task 1324 of 5581 (ID: 285, /home/oe/openembedded/recipes/libdaemon/libdaemon_0.14.bb, do_unpack)
NOTE: package libdaemon-0.14-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libdaemon-0.14.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libdaemon-0.14-r0/
NOTE: package libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 5581 (ID: 2234, /home/oe/openembedded/recipes/libnl/libnl_2.0.bb, do_fetch)
NOTE: package libnl-1_2.0-r5.0: task do_fetch: Started
NOTE: Running task 1326 of 5581 (ID: 257, /home/oe/openembedded/recipes/libcap/libcap2_2.20.bb, do_unpack)
NOTE: package libcap2-2.20-r0: task do_unpack: Started
NOTE: Running task 1327 of 5581 (ID: 2130, virtual:native:/home/oe/openembedded/recipes/python/python-setuptools_0.6c11.bb, do_patch)
NOTE: package libnl-1_2.0-r5.0: task do_fetch: Succeeded
NOTE: Unpacking ../sources/libcap-2.20.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libcap2-2.20-r0/
NOTE: package libcap2-2.20-r0: task do_unpack: Succeeded
NOTE: package python-setuptools-native-0.6c11-ml2: task do_patch: Started
NOTE: package python-setuptools-native-0.6c11-ml2: task do_patch: Succeeded
NOTE: Running task 1328 of 5581 (ID: 3353, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_qa_configure)
NOTE: package tzcode-native-2011e-r4.0: task do_qa_configure: Started
NOTE: package tzcode-native-2011e-r4.0: task do_qa_configure: Succeeded
NOTE: Running task 1329 of 5581 (ID: 2227, /home/oe/openembedded/recipes/libnl/libnl_2.0.bb, do_unpack)
NOTE: package libnl-1_2.0-r5.0: task do_unpack: Started
NOTE: Running task 1330 of 5581 (ID: 2004, /home/oe/openembedded/recipes/tzdata/tzdata_2011e.bb, do_patch)
NOTE: Unpacking ../sources/libnl-2.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libnl-1_2.0-r5.0/
NOTE: package tzdata-2011e-r9.0: task do_patch: Started
NOTE: Running task 1331 of 5581 (ID: 1892, /home/oe/openembedded/recipes/gnome/libart-lgpl_2.3.20.bb, do_patch)
NOTE: Running task 1332 of 5581 (ID: 3354, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_compile)
NOTE: package libnl-1_2.0-r5.0: task do_unpack: Succeeded
NOTE: package tzdata-2011e-r9.0: task do_patch: Succeeded
NOTE: package libart-lgpl-2.3.20-r5.1: task do_patch: Started
NOTE: Applying patch 'Makefile.am.patch' (../openembedded/recipes/gnome/libart-lgpl/Makefile.am.patch)
NOTE: package tzcode-native-2011e-r4.0: task do_compile: Started
NOTE: package libart-lgpl-2.3.20-r5.1: task do_patch: Succeeded
NOTE: Running task 1333 of 5581 (ID: 1864, /home/oe/openembedded/recipes/libcroco/libcroco_0.6.2.bb, do_patch)
NOTE: package libcroco-0.6.2-r0: task do_patch: Started
NOTE: Running task 1334 of 5581 (ID: 1850, /home/oe/openembedded/recipes/bzip2/bzip2_1.0.6.bb, do_patch)
NOTE: package libcroco-0.6.2-r0: task do_patch: Succeeded
NOTE: package bzip2-1.0.6-r0: task do_patch: Started
NOTE: Applying patch 'bzip2-1.0.5-autoconfiscated.patch' (../openembedded/recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch)
NOTE: Running task 1335 of 5581 (ID: 1822, /home/oe/openembedded/recipes/lcms/lcms_1.17.bb, do_patch)
NOTE: package lcms-1.17-r2: task do_patch: Started
NOTE: package lcms-1.17-r2: task do_patch: Succeeded
NOTE: Running task 1336 of 5581 (ID: 1724, /home/oe/openembedded/recipes/gsoap/gsoap-native_2.7.13.bb, do_patch)
NOTE: package bzip2-1.0.6-r0: task do_patch: Succeeded
NOTE: package gsoap-native-2.7.13-r0: task do_patch: Started
NOTE: Running task 1337 of 5581 (ID: 1611, /home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_patch)
NOTE: Applying patch 'gsoap-2.7-openssl.patch' (../openembedded/recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch)
NOTE: package gmp-5.0.1-r1.1: task do_patch: Started
NOTE: Running task 1338 of 5581 (ID: 587, /home/oe/openembedded/recipes/rsync/rsync_3.0.6.bb, do_setscene)
NOTE: package rsync-3.0.6-r0: task do_setscene: Started
NOTE: Applying patch 'unused_args.patch' (../openembedded/recipes/gsoap/gsoap-2.7.13/unused_args.patch)
NOTE: Applying patch 'configure.patch' (../openembedded/recipes/gmp/gmp-5.0.1/configure.patch)
NOTE: Applying patch 'amd64.patch' (../openembedded/recipes/gmp/gmp-5.0.1/amd64.patch)
NOTE: package gsoap-native-2.7.13-r0: task do_patch: Succeeded
NOTE: package gmp-5.0.1-r1.1: task do_patch: Succeeded
NOTE: package rsync-3.0.6-r0: task do_setscene: Succeeded
NOTE: Running task 1339 of 5581 (ID: 573, /home/oe/openembedded/recipes/python/python-pyserial_2.4.bb, do_setscene)
NOTE: package python-pyserial-2.4-ml2: task do_setscene: Started
NOTE: Running task 1340 of 5581 (ID: 517, /home/oe/openembedded/recipes/ntp/ntp_4.2.6p3.bb, do_setscene)
NOTE: package ntp-4.2.6p3-r2: task do_setscene: Started
NOTE: Running task 1341 of 5581 (ID: 586, /home/oe/openembedded/recipes/rsync/rsync_3.0.6.bb, do_fetch)
NOTE: package rsync-3.0.6-r0: task do_fetch: Started
NOTE: package python-pyserial-2.4-ml2: task do_setscene: Succeeded
NOTE: package rsync-3.0.6-r0: task do_fetch: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_compile: Succeeded
NOTE: Running task 1342 of 5581 (ID: 2866, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_install)
NOTE: package perl-native-5.10.1-r11: task do_install: Started
NOTE: Running task 1343 of 5581 (ID: 572, /home/oe/openembedded/recipes/python/python-pyserial_2.4.bb, do_fetch)
NOTE: package ntp-4.2.6p3-r2: task do_setscene: Succeeded
NOTE: Running task 1344 of 5581 (ID: 579, /home/oe/openembedded/recipes/rsync/rsync_3.0.6.bb, do_unpack)
NOTE: package rsync-3.0.6-r0: task do_unpack: Started
NOTE: package python-pyserial-2.4-ml2: task do_fetch: Started
NOTE: package python-pyserial-2.4-ml2: task do_fetch: Succeeded
NOTE: Unpacking ../sources/rsync-3.0.6.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/rsync-3.0.6-r0/
NOTE: Unpacking ../openembedded/recipes/rsync/files/rsyncd.conf to tmp/work/armv5te-angstrom-linux-gnueabi/rsync-3.0.6-r0/
NOTE: package rsync-3.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1345 of 5581 (ID: 516, /home/oe/openembedded/recipes/ntp/ntp_4.2.6p3.bb, do_fetch)
NOTE: Running task 1346 of 5581 (ID: 565, /home/oe/openembedded/recipes/python/python-pyserial_2.4.bb, do_unpack)
NOTE: package ntp-4.2.6p3-r2: task do_fetch: Started
NOTE: package python-pyserial-2.4-ml2: task do_unpack: Started
NOTE: Unpacking ../sources/pyserial-2.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/python-pyserial-2.4-ml2/
NOTE: package python-pyserial-2.4-ml2: task do_unpack: Succeeded
NOTE: Running task 1347 of 5581 (ID: 475, /home/oe/build/recipes/libuio_0.2.bb, do_setscene)
NOTE: package libuio-0.2-r0: task do_setscene: Started
NOTE: package ntp-4.2.6p3-r2: task do_fetch: Succeeded
NOTE: Running task 1348 of 5581 (ID: 223, /home/oe/openembedded/recipes/joe/joe_3.1.bb, do_setscene)
NOTE: package joe-3.1-r3: task do_setscene: Started
NOTE: package tzcode-native-2011e-r4.0: task do_compile: Succeeded
NOTE: Running task 1349 of 5581 (ID: 509, /home/oe/openembedded/recipes/ntp/ntp_4.2.6p3.bb, do_unpack)
NOTE: package ntp-4.2.6p3-r2: task do_unpack: Started
NOTE: package libuio-0.2-r0: task do_setscene: Succeeded
NOTE: package joe-3.1-r3: task do_setscene: Succeeded
NOTE: Unpacking ../sources/ntp-4.2.6p3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/ntp-4.2.6p3-r2/
NOTE: Running task 1350 of 5581 (ID: 3345, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_install)
NOTE: package tzcode-native-2011e-r4.0: task do_install: Started
NOTE: Running task 1351 of 5581 (ID: 474, /home/oe/build/recipes/libuio_0.2.bb, do_fetch)
NOTE: Unpacking ../openembedded/recipes/ntp/files/ntpd to tmp/work/armv5te-angstrom-linux-gnueabi/ntp-4.2.6p3-r2/
NOTE: Running task 1352 of 5581 (ID: 222, /home/oe/openembedded/recipes/joe/joe_3.1.bb, do_fetch)
NOTE: package joe-3.1-r3: task do_fetch: Started
NOTE: package tzcode-native-2011e-r4.0: task do_install: Succeeded
NOTE: package libuio-0.2-r0: task do_fetch: Started
NOTE: package libuio-0.2-r0: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/ntp/files/ntp.conf to tmp/work/armv5te-angstrom-linux-gnueabi/ntp-4.2.6p3-r2/
NOTE: Unpacking ../openembedded/recipes/ntp/files/ntpdate to tmp/work/armv5te-angstrom-linux-gnueabi/ntp-4.2.6p3-r2/
NOTE: package ntp-4.2.6p3-r2: task do_unpack: Succeeded
NOTE: package joe-3.1-r3: task do_fetch: Succeeded
NOTE: Running task 1353 of 5581 (ID: 167, /home/oe/openembedded/recipes/gdb/gdbserver_7.2.bb, do_setscene)
NOTE: Running task 1354 of 5581 (ID: 3346, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_populate_sysroot)
NOTE: package gdbserver-7.2-r9.0: task do_setscene: Started
NOTE: package tzcode-native-2011e-r4.0: task do_populate_sysroot: Started
NOTE: Running task 1355 of 5581 (ID: 467, /home/oe/build/recipes/libuio_0.2.bb, do_unpack)
NOTE: Running task 1356 of 5581 (ID: 215, /home/oe/openembedded/recipes/joe/joe_3.1.bb, do_unpack)
NOTE: package joe-3.1-r3: task do_unpack: Started
NOTE: package libuio-0.2-r0: task do_unpack: Started
NOTE: Unpacking recipes/libuio-0.2.tgz to tmp/work/armv5te-angstrom-linux-gnueabi/libuio-0.2-r0/
NOTE: Unpacking ../sources/joe-3.1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/joe-3.1-r3/
NOTE: package joe-3.1-r3: task do_unpack: Succeeded
NOTE: package gdbserver-7.2-r9.0: task do_setscene: Succeeded
NOTE: package libuio-0.2-r0: task do_unpack: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1357 of 5581 (ID: 166, /home/oe/openembedded/recipes/gdb/gdbserver_7.2.bb, do_fetch)
NOTE: package gdbserver-7.2-r9.0: task do_fetch: Started
NOTE: Running task 1358 of 5581 (ID: 125, /home/oe/openembedded/recipes/tasks/task-base.bb, do_setscene)
NOTE: package task-base-1.0-r96: task do_setscene: Started
NOTE: Running task 1359 of 5581 (ID: 5160, /home/oe/openembedded/recipes/python/python-pygobject-native_2.20.0.bb, do_patch)
NOTE: Running task 1360 of 5581 (ID: 2263, /home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_setscene)
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_patch: Started
NOTE: package python-pygobject-native-1_2.20.0-r3: task do_patch: Succeeded
NOTE: package makedevs-1.0.0-r10: task do_setscene: Started
NOTE: package task-base-1.0-r96: task do_setscene: Succeeded
NOTE: Running task 1361 of 5581 (ID: 545, /home/oe/openembedded/recipes/openvpn/openvpn_2.1.0.bb, do_setscene)
NOTE: package openvpn-2.1.0-r2.0: task do_setscene: Started
NOTE: package makedevs-1.0.0-r10: task do_setscene: Succeeded
NOTE: package gdbserver-7.2-r9.0: task do_fetch: Succeeded
NOTE: Running task 1362 of 5581 (ID: 124, /home/oe/openembedded/recipes/tasks/task-base.bb, do_fetch)
NOTE: package task-base-1.0-r96: task do_fetch: Started
NOTE: package task-base-1.0-r96: task do_fetch: Succeeded
NOTE: Running task 1363 of 5581 (ID: 2262, /home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_fetch)
NOTE: package openvpn-2.1.0-r2.0: task do_setscene: Succeeded
NOTE: package makedevs-1.0.0-r10: task do_fetch: Started
NOTE: Running task 1364 of 5581 (ID: 159, /home/oe/openembedded/recipes/gdb/gdbserver_7.2.bb, do_unpack)
NOTE: Running task 1365 of 5581 (ID: 117, /home/oe/openembedded/recipes/tasks/task-base.bb, do_unpack)
NOTE: package gdbserver-7.2-r9.0: task do_unpack: Started
NOTE: package task-base-1.0-r96: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/tasks/task-base.bb to tmp/work/pcontrolg20-angstrom-linux-gnueabi/task-base-1.0-r96/
NOTE: package task-base-1.0-r96: task do_unpack: Succeeded
NOTE: package makedevs-1.0.0-r10: task do_fetch: Succeeded
NOTE: Unpacking ../sources/gdb-7.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gdbserver-7.2-r9.0/
NOTE: Running task 1366 of 5581 (ID: 544, /home/oe/openembedded/recipes/openvpn/openvpn_2.1.0.bb, do_fetch)
NOTE: package openvpn-2.1.0-r2.0: task do_fetch: Started
NOTE: Running task 1367 of 5581 (ID: 2255, /home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_unpack)
NOTE: package makedevs-1.0.0-r10: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/makedevs/makedevs-1.0.0/makedevs.c to tmp/work/armv5te-angstrom-linux-gnueabi/makedevs-1.0.0-r10/
NOTE: package makedevs-1.0.0-r10: task do_unpack: Succeeded
NOTE: Running task 1368 of 5581 (ID: 531, /home/oe/openembedded/recipes/openntpd/openntpd_3.9p1.bb, do_setscene)
NOTE: package openntpd-3.9p1-r1: task do_setscene: Started
NOTE: package openvpn-2.1.0-r2.0: task do_fetch: Succeeded
NOTE: Running task 1369 of 5581 (ID: 537, /home/oe/openembedded/recipes/openvpn/openvpn_2.1.0.bb, do_unpack)
NOTE: package openvpn-2.1.0-r2.0: task do_unpack: Started
NOTE: Unpacking ../sources/openvpn-2.1.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openvpn-2.1.0-r2.0/
NOTE: Unpacking ../openembedded/recipes/openvpn/files/openvpn to tmp/work/armv5te-angstrom-linux-gnueabi/openvpn-2.1.0-r2.0/
NOTE: package openvpn-2.1.0-r2.0: task do_unpack: Succeeded
NOTE: Running task 1370 of 5581 (ID: 503, /home/oe/openembedded/recipes/libzip/libzip_0.9.bb, do_setscene)
NOTE: package libzip-0.9-r1: task do_setscene: Started
NOTE: package openntpd-3.9p1-r1: task do_setscene: Succeeded
NOTE: Running task 1371 of 5581 (ID: 530, /home/oe/openembedded/recipes/openntpd/openntpd_3.9p1.bb, do_fetch)
NOTE: Running task 1372 of 5581 (ID: 461, /home/oe/openembedded/recipes/libungif/libungif_4.1.3.bb, do_setscene)
NOTE: package libungif-4.1.3-r3: task do_setscene: Started
NOTE: package openntpd-3.9p1-r1: task do_fetch: Started
NOTE: package openntpd-3.9p1-r1: task do_fetch: Succeeded
NOTE: package libzip-0.9-r1: task do_setscene: Succeeded
NOTE: Running task 1373 of 5581 (ID: 523, /home/oe/openembedded/recipes/openntpd/openntpd_3.9p1.bb, do_unpack)
NOTE: package openntpd-3.9p1-r1: task do_unpack: Started
NOTE: package libungif-4.1.3-r3: task do_setscene: Succeeded
NOTE: Unpacking ../sources/openntpd-3.9p1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openntpd-3.9p1-r1/
NOTE: Unpacking ../openembedded/recipes/openntpd/files/init to tmp/work/armv5te-angstrom-linux-gnueabi/openntpd-3.9p1-r1/
NOTE: package openntpd-3.9p1-r1: task do_unpack: Succeeded
NOTE: Running task 1374 of 5581 (ID: 502, /home/oe/openembedded/recipes/libzip/libzip_0.9.bb, do_fetch)
NOTE: Running task 1375 of 5581 (ID: 447, /home/oe/openembedded/recipes/libssh/libssh_0.2.bb, do_setscene)
NOTE: package libzip-0.9-r1: task do_fetch: Started
NOTE: package libssh-0.2-r0: task do_setscene: Started
NOTE: package libzip-0.9-r1: task do_fetch: Succeeded
NOTE: package gdbserver-7.2-r9.0: task do_unpack: Succeeded
NOTE: Running task 1376 of 5581 (ID: 460, /home/oe/openembedded/recipes/libungif/libungif_4.1.3.bb, do_fetch)
NOTE: package libungif-4.1.3-r3: task do_fetch: Started
NOTE: package libungif-4.1.3-r3: task do_fetch: Succeeded
NOTE: Running task 1377 of 5581 (ID: 433, /home/oe/openembedded/recipes/librsync/librsync_0.9.7.bb, do_setscene)
NOTE: Running task 1378 of 5581 (ID: 495, /home/oe/openembedded/recipes/libzip/libzip_0.9.bb, do_unpack)
NOTE: Running task 1379 of 5581 (ID: 453, /home/oe/openembedded/recipes/libungif/libungif_4.1.3.bb, do_unpack)
NOTE: package libungif-4.1.3-r3: task do_unpack: Started
NOTE: package librsync-0.9.7-r0: task do_setscene: Started
NOTE: package libzip-0.9-r1: task do_unpack: Started
NOTE: Unpacking ../sources/libzip-0.9.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libzip-0.9-r1/
NOTE: Unpacking ../sources/libungif-4.1.3.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libungif-4.1.3-r3/
NOTE: package libungif-4.1.3-r3: task do_unpack: Succeeded
NOTE: package libssh-0.2-r0: task do_setscene: Succeeded
NOTE: package libzip-0.9-r1: task do_unpack: Succeeded
NOTE: package librsync-0.9.7-r0: task do_setscene: Succeeded
NOTE: Running task 1380 of 5581 (ID: 446, /home/oe/openembedded/recipes/libssh/libssh_0.2.bb, do_fetch)
NOTE: package libssh-0.2-r0: task do_fetch: Started
NOTE: Running task 1381 of 5581 (ID: 419, /home/oe/openembedded/recipes/librsvg/librsvg_2.26.2.bb, do_setscene)
NOTE: package librsvg-2.26.2-r1: task do_setscene: Started
NOTE: Running task 1382 of 5581 (ID: 432, /home/oe/openembedded/recipes/librsync/librsync_0.9.7.bb, do_fetch)
NOTE: package libssh-0.2-r0: task do_fetch: Succeeded
NOTE: package librsync-0.9.7-r0: task do_fetch: Started
NOTE: package librsync-0.9.7-r0: task do_fetch: Succeeded
NOTE: Running task 1383 of 5581 (ID: 405, /home/oe/openembedded/recipes/librs232/librs232_1.0.2.bb, do_setscene)
NOTE: package librs232-1.0.2-r0: task do_setscene: Started
NOTE: Running task 1384 of 5581 (ID: 439, /home/oe/openembedded/recipes/libssh/libssh_0.2.bb, do_unpack)
NOTE: package libssh-0.2-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libssh-0.2.tgz to tmp/work/armv5te-angstrom-linux-gnueabi/libssh-0.2-r0/
NOTE: package libssh-0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 5581 (ID: 425, /home/oe/openembedded/recipes/librsync/librsync_0.9.7.bb, do_unpack)
NOTE: package librsync-0.9.7-r0: task do_unpack: Started
NOTE: package librsvg-2.26.2-r1: task do_setscene: Succeeded
NOTE: Unpacking ../sources/librsync-0.9.7.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/librsync-0.9.7-r0/
NOTE: package librsync-0.9.7-r0: task do_unpack: Succeeded
NOTE: package librs232-1.0.2-r0: task do_setscene: Succeeded
NOTE: Running task 1386 of 5581 (ID: 418, /home/oe/openembedded/recipes/librsvg/librsvg_2.26.2.bb, do_fetch)
NOTE: Running task 1387 of 5581 (ID: 391, /home/oe/openembedded/recipes/liboop/liboop_1.0.bb, do_setscene)
NOTE: package librsvg-2.26.2-r1: task do_fetch: Started
NOTE: package liboop-1.0-r0: task do_setscene: Started
NOTE: Running task 1388 of 5581 (ID: 377, /home/oe/openembedded/recipes/libol/libol_0.3.18.bb, do_setscene)
NOTE: package libol-0.3.18-r9: task do_setscene: Started
NOTE: package librsvg-2.26.2-r1: task do_fetch: Succeeded
NOTE: Running task 1389 of 5581 (ID: 349, /home/oe/openembedded/recipes/libnet/libnet_1.1.2.1.bb, do_setscene)
NOTE: package libnet-1.1.2.1-r4: task do_setscene: Started
NOTE: Running task 1390 of 5581 (ID: 411, /home/oe/openembedded/recipes/librsvg/librsvg_2.26.2.bb, do_unpack)
NOTE: package librsvg-2.26.2-r1: task do_unpack: Started
NOTE: package liboop-1.0-r0: task do_setscene: Succeeded
NOTE: Unpacking ../sources/librsvg-2.26.2.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/librsvg-2.26.2-r1/
NOTE: package librsvg-2.26.2-r1: task do_unpack: Succeeded
NOTE: package libol-0.3.18-r9: task do_setscene: Succeeded
NOTE: Running task 1391 of 5581 (ID: 390, /home/oe/openembedded/recipes/liboop/liboop_1.0.bb, do_fetch)
NOTE: package liboop-1.0-r0: task do_fetch: Started
NOTE: package libnet-1.1.2.1-r4: task do_setscene: Succeeded
NOTE: package liboop-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1392 of 5581 (ID: 376, /home/oe/openembedded/recipes/libol/libol_0.3.18.bb, do_fetch)
NOTE: package libol-0.3.18-r9: task do_fetch: Started
NOTE: Running task 1393 of 5581 (ID: 348, /home/oe/openembedded/recipes/libnet/libnet_1.1.2.1.bb, do_fetch)
NOTE: package libnet-1.1.2.1-r4: task do_fetch: Started
NOTE: Running task 1394 of 5581 (ID: 335, /home/oe/openembedded/recipes/libmng/libmng_1.0.8.bb, do_setscene)
NOTE: package libol-0.3.18-r9: task do_fetch: Succeeded
NOTE: package libnet-1.1.2.1-r4: task do_fetch: Succeeded
NOTE: package libmng-1.0.8-r1: task do_setscene: Started
NOTE: Running task 1395 of 5581 (ID: 383, /home/oe/openembedded/recipes/liboop/liboop_1.0.bb, do_unpack)
NOTE: package liboop-1.0-r0: task do_unpack: Started
NOTE: Unpacking ../sources/liboop-1.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/liboop-1.0-r0/
NOTE: package liboop-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 5581 (ID: 369, /home/oe/openembedded/recipes/libol/libol_0.3.18.bb, do_unpack)
NOTE: package libol-0.3.18-r9: task do_unpack: Started
NOTE: Running task 1397 of 5581 (ID: 341, /home/oe/openembedded/recipes/libnet/libnet_1.1.2.1.bb, do_unpack)
NOTE: Unpacking ../sources/libol-0.3.18.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libol-0.3.18-r9/
NOTE: package libol-0.3.18-r9: task do_unpack: Succeeded
NOTE: package libnet-1.1.2.1-r4: task do_unpack: Started
NOTE: Unpacking ../sources/libnet_1.1.2.1.orig.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libnet-1.1.2.1-r4/
NOTE: package libnet-1.1.2.1-r4: task do_unpack: Succeeded
NOTE: Running task 1398 of 5581 (ID: 321, /home/oe/openembedded/recipes/libftdi/libftdi_0.18.bb, do_setscene)
NOTE: package libmng-1.0.8-r1: task do_setscene: Succeeded
NOTE: package libftdi-0.18-r0: task do_setscene: Started
NOTE: Running task 1399 of 5581 (ID: 334, /home/oe/openembedded/recipes/libmng/libmng_1.0.8.bb, do_fetch)
NOTE: package libmng-1.0.8-r1: task do_fetch: Started
NOTE: Running task 1400 of 5581 (ID: 307, /home/oe/openembedded/recipes/libevent/libevent_2.0.10-stable.bb, do_setscene)
NOTE: package libmng-1.0.8-r1: task do_fetch: Succeeded
NOTE: package libevent-2.0.10-stable-r0: task do_setscene: Started
NOTE: Running task 1401 of 5581 (ID: 279, /home/oe/openembedded/recipes/libconfig/libconfig_1.3.2.bb, do_setscene)
NOTE: package libconfig-1.3.2-r1: task do_setscene: Started
NOTE: package libftdi-0.18-r0: task do_setscene: Succeeded
NOTE: Running task 1402 of 5581 (ID: 327, /home/oe/openembedded/recipes/libmng/libmng_1.0.8.bb, do_unpack)
NOTE: package libmng-1.0.8-r1: task do_unpack: Started
NOTE: package libconfig-1.3.2-r1: task do_setscene: Succeeded
NOTE: Unpacking ../sources/libmng-1.0.8.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libmng-1.0.8-r1/
NOTE: package libmng-1.0.8-r1: task do_unpack: Succeeded
NOTE: Running task 1403 of 5581 (ID: 320, /home/oe/openembedded/recipes/libftdi/libftdi_0.18.bb, do_fetch)
NOTE: package libevent-2.0.10-stable-r0: task do_setscene: Succeeded
NOTE: Running task 1404 of 5581 (ID: 278, /home/oe/openembedded/recipes/libconfig/libconfig_1.3.2.bb, do_fetch)
NOTE: Running task 1405 of 5581 (ID: 251, /home/oe/openembedded/recipes/libaio/libaio_0.3.107.bb, do_setscene)
NOTE: package libftdi-0.18-r0: task do_fetch: Started
NOTE: package libconfig-1.3.2-r1: task do_fetch: Started
NOTE: package libaio-0.3.107-r0: task do_setscene: Started
NOTE: package libftdi-0.18-r0: task do_fetch: Succeeded
NOTE: package libconfig-1.3.2-r1: task do_fetch: Succeeded
NOTE: Running task 1406 of 5581 (ID: 306, /home/oe/openembedded/recipes/libevent/libevent_2.0.10-stable.bb, do_fetch)
NOTE: package libevent-2.0.10-stable-r0: task do_fetch: Started
NOTE: package libevent-2.0.10-stable-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 5581 (ID: 313, /home/oe/openembedded/recipes/libftdi/libftdi_0.18.bb, do_unpack)
NOTE: Running task 1408 of 5581 (ID: 271, /home/oe/openembedded/recipes/libconfig/libconfig_1.3.2.bb, do_unpack)
NOTE: package libaio-0.3.107-r0: task do_setscene: Succeeded
NOTE: package libftdi-0.18-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libftdi-0.18.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libftdi-0.18-r0/
NOTE: package libftdi-0.18-r0: task do_unpack: Succeeded
NOTE: package libconfig-1.3.2-r1: task do_unpack: Started
NOTE: Unpacking ../sources/libconfig-1.3.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libconfig-1.3.2-r1/
NOTE: package libconfig-1.3.2-r1: task do_unpack: Succeeded
NOTE: Running task 1409 of 5581 (ID: 299, /home/oe/openembedded/recipes/libevent/libevent_2.0.10-stable.bb, do_unpack)
NOTE: package libevent-2.0.10-stable-r0: task do_unpack: Started
NOTE: Unpacking ../sources/libevent-2.0.10-stable.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libevent-2.0.10-stable-r0/
NOTE: package libevent-2.0.10-stable-r0: task do_unpack: Succeeded
NOTE: Running task 1410 of 5581 (ID: 250, /home/oe/openembedded/recipes/libaio/libaio_0.3.107.bb, do_fetch)
NOTE: Running task 1411 of 5581 (ID: 237, /home/oe/openembedded/recipes/json-glib/json-glib_0.10.4.bb, do_setscene)
NOTE: package libaio-0.3.107-r0: task do_fetch: Started
NOTE: Running task 1412 of 5581 (ID: 209, /home/oe/openembedded/recipes/helloworld/helloworld_1.0.0.bb, do_setscene)
NOTE: package json-glib-0.10.4-r1: task do_setscene: Started
NOTE: Running task 1413 of 5581 (ID: 195, /home/oe/openembedded/recipes/gsoap/gsoap_2.7.13.bb, do_setscene)
NOTE: package gsoap-2.7.13-r0: task do_setscene: Started
NOTE: package helloworld-1.0.0-r1: task do_setscene: Started
NOTE: package libaio-0.3.107-r0: task do_fetch: Succeeded
NOTE: Running task 1414 of 5581 (ID: 243, /home/oe/openembedded/recipes/libaio/libaio_0.3.107.bb, do_unpack)
NOTE: package libaio-0.3.107-r0: task do_unpack: Started
NOTE: package json-glib-0.10.4-r1: task do_setscene: Succeeded
NOTE: Unpacking ../sources/libaio_0.3.107.orig.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libaio-0.3.107-r0/
NOTE: package libaio-0.3.107-r0: task do_unpack: Succeeded
NOTE: Running task 1415 of 5581 (ID: 236, /home/oe/openembedded/recipes/json-glib/json-glib_0.10.4.bb, do_fetch)
NOTE: package gsoap-2.7.13-r0: task do_setscene: Succeeded
NOTE: package helloworld-1.0.0-r1: task do_setscene: Succeeded
NOTE: package json-glib-0.10.4-r1: task do_fetch: Started
NOTE: package json-glib-0.10.4-r1: task do_fetch: Succeeded
NOTE: Running task 1416 of 5581 (ID: 181, /home/oe/openembedded/recipes/gdb/gdb-cross_7.2.bb, do_setscene)
NOTE: package gdb-cross-7.2-r9.0: task do_setscene: Started
NOTE: Running task 1417 of 5581 (ID: 208, /home/oe/openembedded/recipes/helloworld/helloworld_1.0.0.bb, do_fetch)
NOTE: package helloworld-1.0.0-r1: task do_fetch: Started
NOTE: Running task 1418 of 5581 (ID: 194, /home/oe/openembedded/recipes/gsoap/gsoap_2.7.13.bb, do_fetch)
NOTE: Running task 1419 of 5581 (ID: 229, /home/oe/openembedded/recipes/json-glib/json-glib_0.10.4.bb, do_unpack)
NOTE: package json-glib-0.10.4-r1: task do_unpack: Started
NOTE: package gdb-cross-7.2-r9.0: task do_setscene: Succeeded
NOTE: package helloworld-1.0.0-r1: task do_fetch: Succeeded
NOTE: package gsoap-2.7.13-r0: task do_fetch: Started
NOTE: package gsoap-2.7.13-r0: task do_fetch: Succeeded
NOTE: Unpacking ../sources/json-glib-0.10.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/json-glib-0.10.4-r1/
NOTE: package json-glib-0.10.4-r1: task do_unpack: Succeeded
NOTE: Running task 1420 of 5581 (ID: 180, /home/oe/openembedded/recipes/gdb/gdb-cross_7.2.bb, do_fetch)
NOTE: Running task 1421 of 5581 (ID: 201, /home/oe/openembedded/recipes/helloworld/helloworld_1.0.0.bb, do_unpack)
NOTE: package helloworld-1.0.0-r1: task do_unpack: Started
NOTE: Running task 1422 of 5581 (ID: 187, /home/oe/openembedded/recipes/gsoap/gsoap_2.7.13.bb, do_unpack)
NOTE: package gdb-cross-7.2-r9.0: task do_fetch: Started
NOTE: Unpacking ../openembedded/recipes/helloworld/helloworld_1.0.0.bb to tmp/work/armv5te-angstrom-linux-gnueabi/helloworld-1.0.0-r1/
NOTE: package helloworld-1.0.0-r1: task do_unpack: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_install: Succeeded
NOTE: package gsoap-2.7.13-r0: task do_unpack: Started
NOTE: Unpacking ../sources/gsoap_2.7.13.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gsoap-2.7.13-r0/
NOTE: Running task 1423 of 5581 (ID: 153, /home/oe/openembedded/recipes/classpath/classpath_0.98.bb, do_setscene)
NOTE: package classpath-0.98-r4: task do_setscene: Started
NOTE: Running task 1424 of 5581 (ID: 2867, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_populate_sysroot)
NOTE: package gsoap-2.7.13-r0: task do_unpack: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_populate_sysroot: Started
NOTE: Running task 1425 of 5581 (ID: 2876, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_package)
NOTE: package perl-native-5.10.1-r11: task do_package: Started
NOTE: package gdb-cross-7.2-r9.0: task do_fetch: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_package: Succeeded
NOTE: Running task 1426 of 5581 (ID: 173, /home/oe/openembedded/recipes/gdb/gdb-cross_7.2.bb, do_unpack)
NOTE: package classpath-0.98-r4: task do_setscene: Succeeded
NOTE: package gdb-cross-7.2-r9.0: task do_unpack: Started
NOTE: Running task 1427 of 5581 (ID: 139, /home/oe/openembedded/recipes/bind/bind_9.3.6.bb, do_setscene)
NOTE: Running task 1428 of 5581 (ID: 2249, /home/oe/openembedded/recipes/libcap/libcap_1.10.bb, do_setscene)
NOTE: Unpacking ../sources/gdb-7.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gdb-cross-7.2-r9.0/
NOTE: package bind-9.3.6-r1: task do_setscene: Started
NOTE: Running task 1429 of 5581 (ID: 152, /home/oe/openembedded/recipes/classpath/classpath_0.98.bb, do_fetch)
NOTE: package classpath-0.98-r4: task do_fetch: Started
NOTE: package libcap-1.10-r3: task do_setscene: Started
NOTE: package classpath-0.98-r4: task do_fetch: Succeeded
NOTE: Running task 1430 of 5581 (ID: 145, /home/oe/openembedded/recipes/classpath/classpath_0.98.bb, do_unpack)
NOTE: package classpath-0.98-r4: task do_unpack: Started
NOTE: package bind-9.3.6-r1: task do_setscene: Succeeded
NOTE: package libcap-1.10-r3: task do_setscene: Succeeded
NOTE: Unpacking ../sources/classpath-0.98.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r4/
NOTE: Running task 1431 of 5581 (ID: 138, /home/oe/openembedded/recipes/bind/bind_9.3.6.bb, do_fetch)
NOTE: package bind-9.3.6-r1: task do_fetch: Started
NOTE: Running task 1432 of 5581 (ID: 2248, /home/oe/openembedded/recipes/libcap/libcap_1.10.bb, do_fetch)
NOTE: package libcap-1.10-r3: task do_fetch: Started
NOTE: package libcap-1.10-r3: task do_fetch: Succeeded
NOTE: package bind-9.3.6-r1: task do_fetch: Succeeded
NOTE: Running task 1433 of 5581 (ID: 2241, /home/oe/openembedded/recipes/libcap/libcap_1.10.bb, do_unpack)
NOTE: package libcap-1.10-r3: task do_unpack: Started
NOTE: Unpacking ../sources/libcap-1.10.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libcap-1.10-r3/
NOTE: package libcap-1.10-r3: task do_unpack: Succeeded
NOTE: Running task 1434 of 5581 (ID: 131, /home/oe/openembedded/recipes/bind/bind_9.3.6.bb, do_unpack)
NOTE: package bind-9.3.6-r1: task do_unpack: Started
NOTE: Unpacking ../sources/bind-9.3.6.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/bind-9.3.6-r1/
NOTE: Running task 1435 of 5581 (ID: 2221, /home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_setscene)
NOTE: package lzo2-2.03-r0: task do_setscene: Started
NOTE: package lzo2-2.03-r0: task do_setscene: Succeeded
NOTE: package bind-9.3.6-r1: task do_unpack: Succeeded
NOTE: Running task 1436 of 5581 (ID: 2207, /home/oe/openembedded/recipes/libpcre/libpcre_8.10.bb, do_setscene)
NOTE: Running task 1437 of 5581 (ID: 2220, /home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_fetch)
NOTE: package lzo2-2.03-r0: task do_fetch: Started
NOTE: package libpcre-8.10-r0: task do_setscene: Started
NOTE: package classpath-0.98-r4: task do_unpack: Succeeded
NOTE: Running task 1438 of 5581 (ID: 999, /home/oe/openembedded/recipes/ppp/ppp_2.4.3.bb, do_setscene)
NOTE: package gdb-cross-7.2-r9.0: task do_unpack: Succeeded
NOTE: Running task 1439 of 5581 (ID: 2482, /home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_removebinaries)
NOTE: package rhino-1.7r1-r1: task do_removebinaries: Started
NOTE: package ppp-2.4.3-r9: task do_setscene: Started
NOTE: package rhino-1.7r1-r1: task do_removebinaries: Succeeded
NOTE: package ppp-2.4.3-r9: task do_setscene: Succeeded
NOTE: Running task 1440 of 5581 (ID: 2484, /home/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb, do_patch)
NOTE: package libpcre-8.10-r0: task do_setscene: Succeeded
NOTE: package rhino-1.7r1-r1: task do_patch: Started
NOTE: package rhino-1.7r1-r1: task do_patch: Succeeded
NOTE: Running task 1441 of 5581 (ID: 2206, /home/oe/openembedded/recipes/libpcre/libpcre_8.10.bb, do_fetch)
NOTE: Running task 1442 of 5581 (ID: 998, /home/oe/openembedded/recipes/ppp/ppp_2.4.3.bb, do_fetch)
NOTE: package libpcre-8.10-r0: task do_fetch: Started
NOTE: package ppp-2.4.3-r9: task do_fetch: Started
NOTE: Running task 1443 of 5581 (ID: 2669, virtual:native:/home/oe/openembedded/recipes/qemu/qemu_0.14.0.bb, do_patch)
NOTE: package lzo2-2.03-r0: task do_fetch: Succeeded
NOTE: package ppp-2.4.3-r9: task do_fetch: Succeeded
NOTE: package libpcre-8.10-r0: task do_fetch: Succeeded
NOTE: package qemu-native-0.14.0-r3: task do_patch: Started
NOTE: Applying patch 'leftover.patch' (../openembedded/recipes/qemu/qemu-0.14.0/leftover.patch)
NOTE: Applying patch '91-oh-sdl-cursor.patch' (../openembedded/recipes/qemu/qemu-0.14.0/91-oh-sdl-cursor.patch)
NOTE: Applying patch 'fix_baum_c_compilation.patch' (../openembedded/recipes/qemu/qemu-0.14.0/fix_baum_c_compilation.patch)
NOTE: Running task 1444 of 5581 (ID: 2213, /home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_unpack)
NOTE: Running task 1445 of 5581 (ID: 2199, /home/oe/openembedded/recipes/libpcre/libpcre_8.10.bb, do_unpack)
NOTE: Running task 1446 of 5581 (ID: 991, /home/oe/openembedded/recipes/ppp/ppp_2.4.3.bb, do_unpack)
NOTE: package ppp-2.4.3-r9: task do_unpack: Started
NOTE: Applying patch 'fallback.to.safe.mmap_min_addr.patch' (../openembedded/recipes/qemu/qemu-0.14.0/fallback.to.safe.mmap_min_addr.patch)
NOTE: package lzo2-2.03-r0: task do_unpack: Started
NOTE: Unpacking ../sources/lzo-2.03.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/lzo2-2.03-r0/
NOTE: package lzo2-2.03-r0: task do_unpack: Succeeded
NOTE: package libpcre-8.10-r0: task do_unpack: Started
NOTE: Unpacking ../sources/pcre-8.10.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libpcre-8.10-r0/
NOTE: Unpacking ../sources/ppp-2.4.3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/pon to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Running task 1447 of 5581 (ID: 2655, /home/oe/openembedded/recipes/cacao/cacaoh-openjdk-native_0.99.4.bb, do_patch)
NOTE: Applying patch 'spice-qxl-locking-fix-for-qemu-kvm.patch' (../openembedded/recipes/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch)
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_patch: Started
NOTE: package cacaoh-openjdk-native-0.99.4-r2: task do_patch: Succeeded
NOTE: Unpacking ../openembedded/recipes/ppp/files/poff to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/init to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/ip-up to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/ip-down to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/08setupdns to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: Unpacking ../openembedded/recipes/ppp/files/92removedns to tmp/work/armv5te-angstrom-linux-gnueabi/ppp-2.4.3-r9/
NOTE: package ppp-2.4.3-r9: task do_unpack: Succeeded
NOTE: Applying patch 'Detect-and-use-GCC-atomic-builtins-for-locking.patch' (../openembedded/recipes/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch)
NOTE: package libpcre-8.10-r0: task do_unpack: Succeeded
NOTE: Running task 1448 of 5581 (ID: 2648, /home/oe/openembedded/recipes/llvm/llvm2.7_2.7.bb, do_generate_toolchain_file)
NOTE: package llvm2.7-2.7-r11: task do_generate_toolchain_file: Started
NOTE: package llvm2.7-2.7-r11: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1449 of 5581 (ID: 2626, /home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_patch)
NOTE: Running task 1450 of 5581 (ID: 2540, /home/oe/openembedded/recipes/xorg-lib/libxp_1.0.1.bb, do_patch)
NOTE: package libxp-1_1.0.1-r9.0: task do_patch: Started
NOTE: package libxp-1_1.0.1-r9.0: task do_patch: Succeeded
NOTE: package fastjar-0.98-r4.2: task do_patch: Started
NOTE: Applying patch 'jartool.patch' (../openembedded/recipes/fastjar/files/jartool.patch)
NOTE: Running task 1451 of 5581 (ID: 2512, /home/oe/openembedded/recipes/xorg-lib/libxinerama_1.1.1.bb, do_patch)
NOTE: package libxinerama-1_1.1.1-r9.0: task do_patch: Started
NOTE: Applying patch 'larger_default_ram_size.patch' (../openembedded/recipes/qemu/qemu-0.14.0/larger_default_ram_size.patch)
NOTE: package qemu-native-0.14.0-r3: task do_patch: Succeeded
NOTE: package libxinerama-1_1.1.1-r9.0: task do_patch: Succeeded
NOTE: Running task 1452 of 5581 (ID: 2451, /home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_removebinaries)
NOTE: Running task 1453 of 5581 (ID: 2410, /home/oe/openembedded/recipes/giflib/giflib_4.1.6.bb, do_patch)
NOTE: package xalan-j-2.7.1-r4: task do_removebinaries: Started
NOTE: package fastjar-0.98-r4.2: task do_patch: Succeeded
NOTE: package giflib-4.1.6-r2: task do_patch: Started
NOTE: package giflib-4.1.6-r2: task do_patch: Succeeded
NOTE: Running task 1454 of 5581 (ID: 4373, /home/oe/openembedded/recipes/python/python-pygobject_2.20.0.bb, do_setscene)
NOTE: package xalan-j-2.7.1-r4: task do_removebinaries: Succeeded
NOTE: package python-pygobject-1_2.20.0-r3: task do_setscene: Started
NOTE: Running task 1455 of 5581 (ID: 4359, /home/oe/openembedded/recipes/python/python-pycairo_1.8.0.bb, do_setscene)
NOTE: Running task 1456 of 5581 (ID: 286, /home/oe/openembedded/recipes/libdaemon/libdaemon_0.14.bb, do_patch)
NOTE: package python-pycairo-1.8.0-ml4: task do_setscene: Started
NOTE: package libdaemon-0.14-r0: task do_patch: Started
NOTE: package libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 5581 (ID: 2453, /home/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb, do_patch)
NOTE: package xalan-j-2.7.1-r4: task do_patch: Started
NOTE: package xalan-j-2.7.1-r4: task do_patch: Succeeded
NOTE: package python-pygobject-1_2.20.0-r3: task do_setscene: Succeeded
NOTE: Running task 1458 of 5581 (ID: 4372, /home/oe/openembedded/recipes/python/python-pygobject_2.20.0.bb, do_fetch)
NOTE: Running task 1459 of 5581 (ID: 258, /home/oe/openembedded/recipes/libcap/libcap2_2.20.bb, do_patch)
NOTE: package libcap2-2.20-r0: task do_patch: Started
NOTE: package python-pygobject-1_2.20.0-r3: task do_fetch: Started
NOTE: Applying patch 'make.patch' (../openembedded/recipes/libcap/libcap2/make.patch)
NOTE: package python-pygobject-1_2.20.0-r3: task do_fetch: Succeeded
NOTE: package python-pycairo-1.8.0-ml4: task do_setscene: Succeeded
NOTE: Running task 1460 of 5581 (ID: 4345, /home/oe/openembedded/recipes/libglade/libglade_2.6.4.bb, do_setscene)
NOTE: Running task 1461 of 5581 (ID: 4358, /home/oe/openembedded/recipes/python/python-pycairo_1.8.0.bb, do_fetch)
NOTE: package python-pycairo-1.8.0-ml4: task do_fetch: Started
NOTE: Running task 1462 of 5581 (ID: 4365, /home/oe/openembedded/recipes/python/python-pygobject_2.20.0.bb, do_unpack)
NOTE: package python-pygobject-1_2.20.0-r3: task do_unpack: Started
NOTE: Unpacking ../sources/pygobject-2.20.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/python-pygobject-1_2.20.0-r3/
NOTE: package python-pygobject-1_2.20.0-r3: task do_unpack: Succeeded
NOTE: package libcap2-2.20-r0: task do_patch: Succeeded
NOTE: package libglade-2.6.4-r0: task do_setscene: Started
NOTE: Running task 1463 of 5581 (ID: 4331, virtual:native:/home/oe/openembedded/recipes/python/python-epydoc_3.0.1.bb, do_setscene)
NOTE: Running task 1464 of 5581 (ID: 4317, virtual:native:/home/oe/openembedded/recipes/python/python-pyrex_0.9.8.5.bb, do_setscene)
NOTE: package libglade-2.6.4-r0: task do_setscene: Succeeded
NOTE: Running task 1465 of 5581 (ID: 4344, /home/oe/openembedded/recipes/libglade/libglade_2.6.4.bb, do_fetch)
NOTE: package libglade-2.6.4-r0: task do_fetch: Started
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_setscene: Started
NOTE: package python-epydoc-native-3.0.1-r2: task do_setscene: Started
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_setscene: Succeeded
NOTE: package python-epydoc-native-3.0.1-r2: task do_setscene: Succeeded
NOTE: Running task 1466 of 5581 (ID: 4330, virtual:native:/home/oe/openembedded/recipes/python/python-epydoc_3.0.1.bb, do_fetch)
NOTE: package python-pycairo-1.8.0-ml4: task do_fetch: Succeeded
NOTE: package libglade-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 5581 (ID: 4316, virtual:native:/home/oe/openembedded/recipes/python/python-pyrex_0.9.8.5.bb, do_fetch)
NOTE: package python-epydoc-native-3.0.1-r2: task do_fetch: Started
NOTE: package python-epydoc-native-3.0.1-r2: task do_fetch: Succeeded
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_fetch: Started
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_fetch: Succeeded
NOTE: Running task 1468 of 5581 (ID: 4351, /home/oe/openembedded/recipes/python/python-pycairo_1.8.0.bb, do_unpack)
NOTE: Running task 1469 of 5581 (ID: 4337, /home/oe/openembedded/recipes/libglade/libglade_2.6.4.bb, do_unpack)
NOTE: package python-pycairo-1.8.0-ml4: task do_unpack: Started
NOTE: Unpacking ../sources/pycairo-1.8.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/python-pycairo-1.8.0-ml4/
NOTE: package libglade-2.6.4-r0: task do_unpack: Started
NOTE: Running task 1470 of 5581 (ID: 4323, virtual:native:/home/oe/openembedded/recipes/python/python-epydoc_3.0.1.bb, do_unpack)
NOTE: Running task 1471 of 5581 (ID: 4309, virtual:native:/home/oe/openembedded/recipes/python/python-pyrex_0.9.8.5.bb, do_unpack)
NOTE: package python-pycairo-1.8.0-ml4: task do_unpack: Succeeded
NOTE: Unpacking ../sources/libglade-2.6.4.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/libglade-2.6.4-r0/
NOTE: package python-epydoc-native-3.0.1-r2: task do_unpack: Started
NOTE: Unpacking ../sources/epydoc-3.0.1.tar.gz to tmp/work/x86_64-linux/python-epydoc-native-3.0.1-r2/
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_unpack: Started
NOTE: Unpacking ../sources/Pyrex-0.9.8.5.tar.gz to tmp/work/x86_64-linux/python-pyrex-native-0.9.8.5-ml2/
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_unpack: Succeeded
NOTE: package libglade-2.6.4-r0: task do_unpack: Succeeded
NOTE: package python-epydoc-native-3.0.1-r2: task do_unpack: Succeeded
NOTE: Running task 1472 of 5581 (ID: 2228, /home/oe/openembedded/recipes/libnl/libnl_2.0.bb, do_patch)
NOTE: Running task 1473 of 5581 (ID: 1195, /home/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.5.bb, do_setscene)
NOTE: package libnl-1_2.0-r5.0: task do_patch: Started
NOTE: Running task 1474 of 5581 (ID: 3215, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_package)
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_setscene: Started
NOTE: Running task 1475 of 5581 (ID: 580, /home/oe/openembedded/recipes/rsync/rsync_3.0.6.bb, do_patch)
NOTE: package rsync-3.0.6-r0: task do_patch: Started
NOTE: package gtk-doc-native-1.0-r3: task do_package: Started
NOTE: package gtk-doc-native-1.0-r3: task do_package: Succeeded
NOTE: Applying patch 'fix-pc-file.patch' (../openembedded/recipes/libnl/libnl/fix-pc-file.patch)
NOTE: Applying patch 'm4.patch' (../openembedded/recipes/rsync/files/m4.patch)
NOTE: Running task 1476 of 5581 (ID: 566, /home/oe/openembedded/recipes/python/python-pyserial_2.4.bb, do_patch)
NOTE: package python-pyserial-2.4-ml2: task do_patch: Started
NOTE: Applying patch 'fix-pktloc-dep-race.patch' (../openembedded/recipes/libnl/libnl/fix-pktloc-dep-race.patch)
NOTE: package python-pyserial-2.4-ml2: task do_patch: Succeeded
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_setscene: Succeeded
NOTE: package rsync-3.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1477 of 5581 (ID: 510, /home/oe/openembedded/recipes/ntp/ntp_4.2.6p3.bb, do_patch)
NOTE: package ntp-4.2.6p3-r2: task do_patch: Started
NOTE: Applying patch 'tickadj.c.patch' (../openembedded/recipes/ntp/files/tickadj.c.patch)
NOTE: Running task 1478 of 5581 (ID: 1194, /home/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.5.bb, do_fetch)
NOTE: Running task 1479 of 5581 (ID: 468, /home/oe/build/recipes/libuio_0.2.bb, do_patch)
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_fetch: Started
NOTE: package libuio-0.2-r0: task do_patch: Started
NOTE: package libuio-0.2-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 5581 (ID: 216, /home/oe/openembedded/recipes/joe/joe_3.1.bb, do_patch)
NOTE: package joe-3.1-r3: task do_patch: Started
NOTE: package joe-3.1-r3: task do_patch: Succeeded
NOTE: Running task 1481 of 5581 (ID: 160, /home/oe/openembedded/recipes/gdb/gdbserver_7.2.bb, do_patch)
NOTE: package gdbserver-7.2-r9.0: task do_patch: Started
NOTE: Applying patch 'kill_arm_map_symbols.patch' (../openembedded/recipes/gdb/files/kill_arm_map_symbols.patch)
NOTE: Applying patch 'ntp-4.2.4_p6-nano.patch' (../openembedded/recipes/ntp/files/ntp-4.2.4_p6-nano.patch)
NOTE: package libnl-1_2.0-r5.0: task do_patch: Succeeded
NOTE: Applying patch 'gdbserver-cflags-last.diff' (../openembedded/recipes/gdb/gdb-7.2/gdbserver-cflags-last.diff)
NOTE: Running task 1482 of 5581 (ID: 118, /home/oe/openembedded/recipes/tasks/task-base.bb, do_patch)
NOTE: package task-base-1.0-r96: task do_patch: Started
NOTE: package task-base-1.0-r96: task do_patch: Succeeded
NOTE: Running task 1483 of 5581 (ID: 1379, virtual:native:/home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_setscene)
NOTE: package lzo2-native-2.03-r0: task do_setscene: Started
NOTE: package lzo2-native-2.03-r0: task do_setscene: Succeeded
NOTE: package ntp-4.2.6p3-r2: task do_patch: Succeeded
NOTE: Running task 1484 of 5581 (ID: 1225, /home/oe/openembedded/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb, do_setscene)
NOTE: Running task 1485 of 5581 (ID: 1378, virtual:native:/home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_fetch)
NOTE: package lzo2-native-2.03-r0: task do_fetch: Started
NOTE: package lzo2-native-2.03-r0: task do_fetch: Succeeded
NOTE: Running task 1486 of 5581 (ID: 1371, virtual:native:/home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_unpack)
NOTE: package lzo2-native-2.03-r0: task do_unpack: Started
NOTE: Unpacking ../sources/lzo-2.03.tar.gz to tmp/work/x86_64-linux/lzo2-native-2.03-r0/
NOTE: package lzo2-native-2.03-r0: task do_unpack: Succeeded
NOTE: package hicolor-icon-theme-0.11-r1: task do_setscene: Started
NOTE: package gdbserver-7.2-r9.0: task do_patch: Succeeded
NOTE: Running task 1487 of 5581 (ID: 2256, /home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_patch)
NOTE: package makedevs-1.0.0-r10: task do_patch: Started
NOTE: package makedevs-1.0.0-r10: task do_patch: Succeeded
NOTE: Running task 1488 of 5581 (ID: 538, /home/oe/openembedded/recipes/openvpn/openvpn_2.1.0.bb, do_patch)
NOTE: package openvpn-2.1.0-r2.0: task do_patch: Started
NOTE: package openvpn-2.1.0-r2.0: task do_patch: Succeeded
NOTE: Running task 1489 of 5581 (ID: 524, /home/oe/openembedded/recipes/openntpd/openntpd_3.9p1.bb, do_patch)
NOTE: package openntpd-3.9p1-r1: task do_patch: Started
NOTE: Applying patch 'adjtimex-3.9p1.patch' (../openembedded/recipes/openntpd/files/adjtimex-3.9p1.patch)
NOTE: package openntpd-3.9p1-r1: task do_patch: Succeeded
NOTE: package hicolor-icon-theme-0.11-r1: task do_setscene: Succeeded
NOTE: Running task 1490 of 5581 (ID: 496, /home/oe/openembedded/recipes/libzip/libzip_0.9.bb, do_patch)
NOTE: package libzip-0.9-r1: task do_patch: Started
NOTE: package libzip-0.9-r1: task do_patch: Succeeded
NOTE: Running task 1491 of 5581 (ID: 1224, /home/oe/openembedded/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb, do_fetch)
NOTE: package hicolor-icon-theme-0.11-r1: task do_fetch: Started
NOTE: Running task 1492 of 5581 (ID: 454, /home/oe/openembedded/recipes/libungif/libungif_4.1.3.bb, do_patch)
NOTE: package hicolor-icon-theme-0.11-r1: task do_fetch: Succeeded
NOTE: package libungif-4.1.3-r3: task do_patch: Started
NOTE: package libungif-4.1.3-r3: task do_patch: Succeeded
NOTE: Running task 1493 of 5581 (ID: 440, /home/oe/openembedded/recipes/libssh/libssh_0.2.bb, do_patch)
NOTE: package libssh-0.2-r0: task do_patch: Started
NOTE: Applying patch 'libssh_libdir_fix.patch' (../openembedded/recipes/libssh/files/libssh_libdir_fix.patch)
NOTE: Running task 1494 of 5581 (ID: 1217, /home/oe/openembedded/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb, do_unpack)
NOTE: package hicolor-icon-theme-0.11-r1: task do_unpack: Started
NOTE: Unpacking ../sources/hicolor-icon-theme-0.11.tar.gz to tmp/work/all-angstrom-linux-gnueabi/hicolor-icon-theme-0.11-r1/
NOTE: Running task 1495 of 5581 (ID: 426, /home/oe/openembedded/recipes/librsync/librsync_0.9.7.bb, do_patch)
NOTE: package librsync-0.9.7-r0: task do_patch: Started
NOTE: package hicolor-icon-theme-0.11-r1: task do_unpack: Succeeded
NOTE: package librsync-0.9.7-r0: task do_patch: Succeeded
NOTE: package libssh-0.2-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 5581 (ID: 412, /home/oe/openembedded/recipes/librsvg/librsvg_2.26.2.bb, do_patch)
NOTE: package librsvg-2.26.2-r1: task do_patch: Started
NOTE: Running task 1497 of 5581 (ID: 384, /home/oe/openembedded/recipes/liboop/liboop_1.0.bb, do_patch)
NOTE: package liboop-1.0-r0: task do_patch: Started
NOTE: Running task 1498 of 5581 (ID: 370, /home/oe/openembedded/recipes/libol/libol_0.3.18.bb, do_patch)
NOTE: package libol-0.3.18-r9: task do_patch: Started
NOTE: package librsvg-2.26.2-r1: task do_patch: Succeeded
NOTE: package liboop-1.0-r0: task do_patch: Succeeded
NOTE: package libol-0.3.18-r9: task do_patch: Succeeded
NOTE: Running task 1499 of 5581 (ID: 342, /home/oe/openembedded/recipes/libnet/libnet_1.1.2.1.bb, do_patch)
NOTE: Running task 1500 of 5581 (ID: 328, /home/oe/openembedded/recipes/libmng/libmng_1.0.8.bb, do_patch)
NOTE: package libnet-1.1.2.1-r4: task do_patch: Started
NOTE: package libmng-1.0.8-r1: task do_patch: Started
NOTE: Applying patch 'ldflags.patch' (../openembedded/recipes/libmng/libmng/ldflags.patch)
NOTE: Applying patch 'support-uclibc.patch' (../openembedded/recipes/libnet/libnet-1.1.2.1/support-uclibc.patch)
NOTE: Running task 1501 of 5581 (ID: 314, /home/oe/openembedded/recipes/libftdi/libftdi_0.18.bb, do_patch)
NOTE: package libftdi-0.18-r0: task do_patch: Started
NOTE: Applying patch 'libtool-m4.patch' (../openembedded/recipes/libftdi/libftdi-0.18/libtool-m4.patch)
NOTE: package libmng-1.0.8-r1: task do_patch: Succeeded
NOTE: Applying patch 'fix-endianess-test.patch' (../openembedded/recipes/libnet/libnet-1.1.2.1/fix-endianess-test.patch)
NOTE: Running task 1502 of 5581 (ID: 300, /home/oe/openembedded/recipes/libevent/libevent_2.0.10-stable.bb, do_patch)
NOTE: package libevent-2.0.10-stable-r0: task do_patch: Started
NOTE: package libevent-2.0.10-stable-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 5581 (ID: 272, /home/oe/openembedded/recipes/libconfig/libconfig_1.3.2.bb, do_patch)
NOTE: package libconfig-1.3.2-r1: task do_patch: Started
NOTE: Applying patch 'new-autotools.patch' (../openembedded/recipes/libnet/libnet-1.1.2.1/new-autotools.patch)
NOTE: Applying patch 'libconfig.newer.automake-1.11.patch' (../openembedded/recipes/libconfig/libconfig-1.3.2/libconfig.newer.automake-1.11.patch)
NOTE: package libconfig-1.3.2-r1: task do_patch: Succeeded
NOTE: package libftdi-0.18-r0: task do_patch: Succeeded
NOTE: Running task 1504 of 5581 (ID: 244, /home/oe/openembedded/recipes/libaio/libaio_0.3.107.bb, do_patch)
NOTE: package libaio-0.3.107-r0: task do_patch: Started
NOTE: Applying patch '00_arches.patch' (../openembedded/recipes/libaio/libaio-0.3.106/00_arches.patch)
NOTE: package libnet-1.1.2.1-r4: task do_patch: Succeeded
NOTE: Running task 1505 of 5581 (ID: 230, /home/oe/openembedded/recipes/json-glib/json-glib_0.10.4.bb, do_patch)
NOTE: package json-glib-0.10.4-r1: task do_patch: Started
NOTE: package json-glib-0.10.4-r1: task do_patch: Succeeded
NOTE: Applying patch 'destdir.patch' (../openembedded/recipes/libaio/libaio-0.3.106/destdir.patch)
NOTE: Running task 1506 of 5581 (ID: 202, /home/oe/openembedded/recipes/helloworld/helloworld_1.0.0.bb, do_patch)
NOTE: package libaio-0.3.107-r0: task do_patch: Succeeded
NOTE: package helloworld-1.0.0-r1: task do_patch: Started
NOTE: package helloworld-1.0.0-r1: task do_patch: Succeeded
NOTE: Running task 1507 of 5581 (ID: 188, /home/oe/openembedded/recipes/gsoap/gsoap_2.7.13.bb, do_patch)
NOTE: package gsoap-2.7.13-r0: task do_patch: Started
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_fetch: Succeeded
NOTE: Applying patch 'gsoap-2.7-openssl.patch' (../openembedded/recipes/gsoap/gsoap-2.7.13/gsoap-2.7-openssl.patch)
NOTE: Running task 1508 of 5581 (ID: 174, /home/oe/openembedded/recipes/gdb/gdb-cross_7.2.bb, do_patch)
NOTE: Applying patch 'unused_args.patch' (../openembedded/recipes/gsoap/gsoap-2.7.13/unused_args.patch)
NOTE: package gdb-cross-7.2-r9.0: task do_patch: Started
NOTE: Running task 1509 of 5581 (ID: 1187, /home/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.5.bb, do_unpack)
NOTE: Applying patch 'gdb-6.8-fix-compile-karmic.patch' (../openembedded/recipes/gdb/gdb-7.2/gdb-6.8-fix-compile-karmic.patch)
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_unpack: Started
NOTE: Unpacking ../sources/icedtea6-1.8.5.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Running task 1510 of 5581 (ID: 146, /home/oe/openembedded/recipes/classpath/classpath_0.98.bb, do_patch)
NOTE: package classpath-0.98-r4: task do_patch: Started
NOTE: package gsoap-2.7.13-r0: task do_patch: Succeeded
NOTE: Applying patch 'SimpleName.diff' (../openembedded/recipes/classpath/files/SimpleName.diff)
NOTE: Running task 1511 of 5581 (ID: 132, /home/oe/openembedded/recipes/bind/bind_9.3.6.bb, do_patch)
NOTE: package bind-9.3.6-r1: task do_patch: Started
NOTE: Applying patch 'gdb-fix-sim-ppc.patch' (../openembedded/recipes/gdb/files/gdb-fix-sim-ppc.patch)
NOTE: Applying patch 'ecj_java_dir.patch' (../openembedded/recipes/classpath/files/ecj_java_dir.patch)
NOTE: Applying patch 'conf.patch' (../openembedded/recipes/bind/bind-9.3.6/conf.patch)
NOTE: Applying patch 'configure.in.patch' (../openembedded/recipes/bind/bind-9.3.6/configure.in.patch)
NOTE: package bind-9.3.6-r1: task do_patch: Succeeded
NOTE: package gdb-cross-7.2-r9.0: task do_patch: Succeeded
NOTE: Unpacking ../sources/openjdk-6-src-b18-16_feb_2010.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/openjdk-src-dir/
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/classpath/files/autotools.patch)
NOTE: Applying patch 'fix-gmp.patch' (../openembedded/recipes/classpath/files/fix-gmp.patch)
NOTE: Applying patch 'toolwrapper-exithook.patch' (../openembedded/recipes/classpath/files/toolwrapper-exithook.patch)
NOTE: Running task 1512 of 5581 (ID: 2242, /home/oe/openembedded/recipes/libcap/libcap_1.10.bb, do_patch)
NOTE: Running task 1513 of 5581 (ID: 2214, /home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_patch)
NOTE: package classpath-0.98-r4: task do_patch: Succeeded
NOTE: package libcap-1.10-r3: task do_patch: Started
NOTE: Applying patch 'makenames.patch' (../openembedded/recipes/libcap/libcap-1.10/makenames.patch)
NOTE: package lzo2-2.03-r0: task do_patch: Started
NOTE: package lzo2-2.03-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 5581 (ID: 2200, /home/oe/openembedded/recipes/libpcre/libpcre_8.10.bb, do_patch)
NOTE: Applying patch 'make.patch' (../openembedded/recipes/libcap/libcap-1.10/make.patch)
NOTE: Running task 1515 of 5581 (ID: 992, /home/oe/openembedded/recipes/ppp/ppp_2.4.3.bb, do_patch)
NOTE: package ppp-2.4.3-r9: task do_patch: Started
NOTE: package libpcre-8.10-r0: task do_patch: Started
NOTE: Applying patch 'pcre-cross.patch' (../openembedded/recipes/libpcre/files/pcre-cross.patch)
NOTE: Applying patch 'syscall.patch' (../openembedded/recipes/libcap/libcap-1.10/syscall.patch)
NOTE: Applying patch 'ppp-2.4.3-mppe-mppc-1.1.patch' (../openembedded/recipes/ppp/ppp-2.4.3/ppp-2.4.3-mppe-mppc-1.1.patch)
NOTE: Applying patch 'makefile.patch' (../openembedded/recipes/ppp/ppp-2.4.3/makefile.patch)
NOTE: package libpcre-8.10-r0: task do_patch: Succeeded
NOTE: package libcap-1.10-r3: task do_patch: Succeeded
NOTE: Applying patch 'cifdefroute.patch' (../openembedded/recipes/ppp/ppp-2.4.3/cifdefroute.patch)
NOTE: Running task 1516 of 5581 (ID: 663, /home/oe/openembedded/recipes/lsof/lsof_4.83.bb, do_setscene)
NOTE: package lsof-4.83-r2: task do_setscene: Started
NOTE: Applying patch 'pppd-resolv-varrun.patch' (../openembedded/recipes/ppp/ppp-2.4.3/pppd-resolv-varrun.patch)
NOTE: Running task 1517 of 5581 (ID: 4366, /home/oe/openembedded/recipes/python/python-pygobject_2.20.0.bb, do_patch)
NOTE: Applying patch 'plugins-fix-CC.patch' (../openembedded/recipes/ppp/ppp-2.4.3/plugins-fix-CC.patch)
NOTE: Applying patch 'pppoatm-makefile.patch' (../openembedded/recipes/ppp/ppp-2.4.3/pppoatm-makefile.patch)
NOTE: package python-pygobject-1_2.20.0-r3: task do_patch: Started
NOTE: Applying patch 'generate-constants.patch' (../openembedded/recipes/python/python-pygobject/generate-constants.patch)
NOTE: package python-pygobject-1_2.20.0-r3: task do_patch: Succeeded
NOTE: package lsof-4.83-r2: task do_setscene: Succeeded
NOTE: Applying patch 'enable-ipv6.patch' (../openembedded/recipes/ppp/ppp-2.4.3/enable-ipv6.patch)
NOTE: Applying patch 'makefile-remove-hard-usr-reference.patch' (../openembedded/recipes/ppp/ppp-2.4.3/makefile-remove-hard-usr-reference.patch)
NOTE: Running task 1518 of 5581 (ID: 4352, /home/oe/openembedded/recipes/python/python-pycairo_1.8.0.bb, do_patch)
NOTE: package python-pycairo-1.8.0-ml4: task do_patch: Started
NOTE: Applying patch 'fix-setup-py.patch' (../openembedded/recipes/python/python-pycairo/fix-setup-py.patch)
NOTE: Running task 1519 of 5581 (ID: 662, /home/oe/openembedded/recipes/lsof/lsof_4.83.bb, do_fetch)
NOTE: package lsof-4.83-r2: task do_fetch: Started
NOTE: Applying patch 'ldflags.patch' (../openembedded/recipes/ppp/ppp-2.4.3/ldflags.patch)
NOTE: package ppp-2.4.3-r9: task do_patch: Succeeded
NOTE: package python-pycairo-1.8.0-ml4: task do_patch: Succeeded
NOTE: package lsof-4.83-r2: task do_fetch: Succeeded
NOTE: Running task 1520 of 5581 (ID: 10, /home/oe/build/recipes/pcontrolg20-image.bb, do_setscene)
NOTE: Running task 1521 of 5581 (ID: 845, /home/oe/openembedded/recipes/opkg/opkg_svn.bb, do_setscene)
NOTE: package pcontrolg20-image-1.0-r0: task do_setscene: Started
NOTE: package pcontrolg20-image-1.0-r0: task do_setscene: Succeeded
NOTE: package opkg-0.1.8+svnr609-r5: task do_setscene: Started
NOTE: Running task 1522 of 5581 (ID: 655, /home/oe/openembedded/recipes/lsof/lsof_4.83.bb, do_unpack)
NOTE: package lsof-4.83-r2: task do_unpack: Started
NOTE: Unpacking ../sources/lsof_4.83.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/lsof-4.83-r2/
NOTE: Running task 1523 of 5581 (ID: 8, /home/oe/build/recipes/pcontrolg20-image.bb, do_fetch)
NOTE: package opkg-0.1.8+svnr609-r5: task do_setscene: Succeeded
NOTE: package lsof-4.83-r2: task do_unpack: Succeeded
NOTE: package pcontrolg20-image-1.0-r0: task do_fetch: Started
NOTE: package pcontrolg20-image-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 5581 (ID: 844, /home/oe/openembedded/recipes/opkg/opkg_svn.bb, do_fetch)
NOTE: package opkg-0.1.8+svnr609-r5: task do_fetch: Started
NOTE: Running task 1525 of 5581 (ID: 4338, /home/oe/openembedded/recipes/libglade/libglade_2.6.4.bb, do_patch)
NOTE: package opkg-0.1.8+svnr609-r5: task do_fetch: Succeeded
NOTE: package libglade-2.6.4-r0: task do_patch: Started
NOTE: Applying patch 'glade-cruft.patch' (../openembedded/recipes/libglade/files/glade-cruft.patch)
NOTE: Running task 1526 of 5581 (ID: 0, /home/oe/build/recipes/pcontrolg20-image.bb, do_unpack)
NOTE: package pcontrolg20-image-1.0-r0: task do_unpack: Started
NOTE: Unpacking recipes/pcontrolg20-image/auth_keys to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/dokernel.py to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/hosts to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/install-modules to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/interfaces to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Running task 1527 of 5581 (ID: 837, /home/oe/openembedded/recipes/opkg/opkg_svn.bb, do_unpack)
NOTE: package opkg-0.1.8+svnr609-r5: task do_unpack: Started
NOTE: Applying patch 'no-xml2.patch' (../openembedded/recipes/libglade/files/no-xml2.patch)
NOTE: package libglade-2.6.4-r0: task do_patch: Succeeded
NOTE: Unpacking recipes/pcontrolg20-image/known_hosts to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/modutils.pcontrol to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: Unpacking recipes/pcontrolg20-image/syslog.conf to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pcontrolg20-image-1.0-r0/
NOTE: package pcontrolg20-image-1.0-r0: task do_unpack: Succeeded
NOTE: Unpacking ../sources/trunk_opkg.googlecode.com_.svn_609_.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/opkg-0.1.8+svnr609-r5/
NOTE: Unpacking ../openembedded/recipes/opkg/files/configure to tmp/work/armv5te-angstrom-linux-gnueabi/opkg-0.1.8+svnr609-r5/
NOTE: package opkg-0.1.8+svnr609-r5: task do_unpack: Succeeded
NOTE: Running task 1528 of 5581 (ID: 4324, virtual:native:/home/oe/openembedded/recipes/python/python-epydoc_3.0.1.bb, do_patch)
NOTE: package python-epydoc-native-3.0.1-r2: task do_patch: Started
NOTE: Running task 1529 of 5581 (ID: 4310, virtual:native:/home/oe/openembedded/recipes/python/python-pyrex_0.9.8.5.bb, do_patch)
NOTE: Running task 1530 of 5581 (ID: 1125, /home/oe/openembedded/recipes/module-init-tools/module-init-tools_3.12.bb, do_setscene)
NOTE: package python-epydoc-native-3.0.1-r2: task do_patch: Succeeded
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_patch: Started
NOTE: Applying patch 'pyrex-fix-optimized-mode.patch' (../openembedded/recipes/python/python-pyrex-0.9.8.5/pyrex-fix-optimized-mode.patch)
NOTE: Unpacking ../sources/jdk6-jaxws-2009_10_27.zip to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: package module-init-tools-3.12-r6: task do_setscene: Started
NOTE: Running task 1531 of 5581 (ID: 873, /home/oe/openembedded/recipes/angstrom/angstrom-feed-configs.bb, do_setscene)
NOTE: package python-pyrex-native-0.9.8.5-ml2: task do_patch: Succeeded
NOTE: package angstrom-feed-configs-1.0-r14: task do_setscene: Started
NOTE: package module-init-tools-3.12-r6: task do_setscene: Succeeded
NOTE: Running task 1532 of 5581 (ID: 859, /home/oe/openembedded/recipes/angstrom/angstrom-version.bb, do_setscene)
NOTE: package angstrom-version-2_v2011.05-r9: task do_setscene: Started
NOTE: package angstrom-feed-configs-1.0-r14: task do_setscene: Succeeded
NOTE: Unpacking ../sources/jdk6-jaf-2009_10_27.zip to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../sources/jdk6-jaxp-2009_10_13.zip to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: package angstrom-version-2_v2011.05-r9: task do_setscene: Succeeded
NOTE: Running task 1533 of 5581 (ID: 1124, /home/oe/openembedded/recipes/module-init-tools/module-init-tools_3.12.bb, do_fetch)
NOTE: package module-init-tools-3.12-r6: task do_fetch: Started
NOTE: package module-init-tools-3.12-r6: task do_fetch: Succeeded
NOTE: Running task 1534 of 5581 (ID: 872, /home/oe/openembedded/recipes/angstrom/angstrom-feed-configs.bb, do_fetch)
NOTE: package angstrom-feed-configs-1.0-r14: task do_fetch: Started
NOTE: Running task 1535 of 5581 (ID: 858, /home/oe/openembedded/recipes/angstrom/angstrom-version.bb, do_fetch)
NOTE: Running task 1536 of 5581 (ID: 1117, /home/oe/openembedded/recipes/module-init-tools/module-init-tools_3.12.bb, do_unpack)
NOTE: Unpacking ../sources/cacao-0.99.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: package angstrom-feed-configs-1.0-r14: task do_fetch: Succeeded
NOTE: package angstrom-version-2_v2011.05-r9: task do_fetch: Started
NOTE: package angstrom-version-2_v2011.05-r9: task do_fetch: Succeeded
NOTE: package module-init-tools-3.12-r6: task do_unpack: Started
NOTE: Unpacking ../sources/module-init-tools-3.12.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/module-init-tools-3.12-r6/
NOTE: Running task 1537 of 5581 (ID: 865, /home/oe/openembedded/recipes/angstrom/angstrom-feed-configs.bb, do_unpack)
NOTE: package module-init-tools-3.12-r6: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: package angstrom-feed-configs-1.0-r14: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-feed-configs.bb to tmp/work/pcontrolg20-angstrom-linux-gnueabi/angstrom-feed-configs-1.0-r14/
NOTE: package angstrom-feed-configs-1.0-r14: task do_unpack: Succeeded
NOTE: Running task 1538 of 5581 (ID: 851, /home/oe/openembedded/recipes/angstrom/angstrom-version.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: Unpacking ../openembedded/recipes/openjdk/files/jvm.cfg to tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8.5-r11.1/
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_unpack: Succeeded
NOTE: package angstrom-version-2_v2011.05-r9: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-version/lsb_release to tmp/work/pcontrolg20-angstrom-linux-gnueabi/angstrom-version-2_v2011.05-r9/
NOTE: package angstrom-version-2_v2011.05-r9: task do_unpack: Succeeded
NOTE: Running task 1539 of 5581 (ID: 817, /home/oe/openembedded/recipes/sysvinit/sysvinit_2.86.bb, do_setscene)
NOTE: Running task 1540 of 5581 (ID: 761, /home/oe/openembedded/recipes/setserial/setserial_2.17.bb, do_setscene)
NOTE: package sysvinit-2.86-r64: task do_setscene: Started
NOTE: Running task 1541 of 5581 (ID: 648, /home/oe/openembedded/recipes/lrzsz/lrzsz_0.12.20.bb, do_setscene)
NOTE: package setserial-2.17-r3: task do_setscene: Started
NOTE: package lrzsz-0.12.20-r4: task do_setscene: Started
NOTE: Running task 1542 of 5581 (ID: 1188, /home/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.5.bb, do_patch)
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_patch: Started
NOTE: Applying patch 'build-hacks.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch)
NOTE: Applying patch 'zero-cmpswap-long.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch)
NOTE: package sysvinit-2.86-r64: task do_setscene: Succeeded
NOTE: package setserial-2.17-r3: task do_setscene: Succeeded
NOTE: package lrzsz-0.12.20-r4: task do_setscene: Succeeded
NOTE: Applying patch 'fix_hotspot_crosscompile.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch)
NOTE: Applying patch 'mkbc_returncode.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch)
NOTE: Applying patch 'icedtea-fix-jar-command.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8.5/icedtea-fix-jar-command.patch)
NOTE: Running task 1543 of 5581 (ID: 816, /home/oe/openembedded/recipes/sysvinit/sysvinit_2.86.bb, do_fetch)
NOTE: Running task 1544 of 5581 (ID: 760, /home/oe/openembedded/recipes/setserial/setserial_2.17.bb, do_fetch)
NOTE: package sysvinit-2.86-r64: task do_fetch: Started
NOTE: Applying patch 'fix-llvm-libs.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch)
NOTE: Applying patch 'shark-build-openjdkdir.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch)
NOTE: package setserial-2.17-r3: task do_fetch: Started
NOTE: package setserial-2.17-r3: task do_fetch: Succeeded
NOTE: Running task 1545 of 5581 (ID: 647, /home/oe/openembedded/recipes/lrzsz/lrzsz_0.12.20.bb, do_fetch)
NOTE: package lrzsz-0.12.20-r4: task do_fetch: Started
NOTE: package sysvinit-2.86-r64: task do_fetch: Succeeded
NOTE: package lrzsz-0.12.20-r4: task do_fetch: Succeeded
NOTE: Running task 1546 of 5581 (ID: 809, /home/oe/openembedded/recipes/sysvinit/sysvinit_2.86.bb, do_unpack)
NOTE: Applying patch 'shark-arm-linux-cpu-detection.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch)
NOTE: package sysvinit-2.86-r64: task do_unpack: Started
NOTE: Running task 1547 of 5581 (ID: 753, /home/oe/openembedded/recipes/setserial/setserial_2.17.bb, do_unpack)
NOTE: Applying patch 'cacao-libtoolize.patch' (../openembedded/recipes/openjdk/openjdk-6-6b18-1.8.5/cacao-libtoolize.patch)
NOTE: Running task 1548 of 5581 (ID: 640, /home/oe/openembedded/recipes/lrzsz/lrzsz_0.12.20.bb, do_unpack)
NOTE: package lrzsz-0.12.20-r4: task do_unpack: Started
NOTE: Unpacking ../sources/sysvinit-2.86.tar.gz to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/need to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/provide to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/inittab to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/rcS-default to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: package setserial-2.17-r3: task do_unpack: Started
NOTE: Unpacking ../sources/setserial-2.17.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/setserial-2.17-r3/
NOTE: package setserial-2.17-r3: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/angstrom/rc to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/angstrom/rcS to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: Unpacking ../openembedded/recipes/sysvinit/sysvinit/bootlogd.init to tmp/work/pcontrolg20-angstrom-linux-gnueabi/sysvinit-2.86-r64/
NOTE: package sysvinit-2.86-r64: task do_unpack: Succeeded
NOTE: package openjdk-6-jre-6b18-1.8.5-r11.1: task do_patch: Succeeded
NOTE: Unpacking ../sources/lrzsz-0.12.20.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/lrzsz-0.12.20-r4/
NOTE: package lrzsz-0.12.20-r4: task do_unpack: Succeeded
NOTE: Running task 1549 of 5581 (ID: 887, /home/oe/openembedded/recipes/opkg/opkg-collateral.bb, do_setscene)
NOTE: package opkg-collateral-1.0-r3: task do_setscene: Started
NOTE: Running task 1550 of 5581 (ID: 831, /home/oe/openembedded/recipes/tinylogin/tinylogin_1.4.bb, do_setscene)
NOTE: package tinylogin-1.4-r7: task do_setscene: Started
NOTE: Running task 1551 of 5581 (ID: 789, /home/oe/openembedded/recipes/initscripts/initscripts_1.0.bb, do_setscene)
NOTE: Running task 1552 of 5581 (ID: 775, /home/oe/openembedded/recipes/vsftpd/vsftpd_2.0.5.bb, do_setscene)
NOTE: package vsftpd-2.0.5-r4: task do_setscene: Started
NOTE: package initscripts-1.0-r128: task do_setscene: Started
NOTE: package opkg-collateral-1.0-r3: task do_setscene: Succeeded
NOTE: package vsftpd-2.0.5-r4: task do_setscene: Succeeded
NOTE: package tinylogin-1.4-r7: task do_setscene: Succeeded
NOTE: package initscripts-1.0-r128: task do_setscene: Succeeded
NOTE: Running task 1553 of 5581 (ID: 886, /home/oe/openembedded/recipes/opkg/opkg-collateral.bb, do_fetch)
NOTE: Running task 1554 of 5581 (ID: 830, /home/oe/openembedded/recipes/tinylogin/tinylogin_1.4.bb, do_fetch)
NOTE: package opkg-collateral-1.0-r3: task do_fetch: Started
NOTE: Running task 1555 of 5581 (ID: 788, /home/oe/openembedded/recipes/initscripts/initscripts_1.0.bb, do_fetch)
NOTE: package tinylogin-1.4-r7: task do_fetch: Started
NOTE: package initscripts-1.0-r128: task do_fetch: Started
NOTE: package initscripts-1.0-r128: task do_fetch: Succeeded
NOTE: Running task 1556 of 5581 (ID: 774, /home/oe/openembedded/recipes/vsftpd/vsftpd_2.0.5.bb, do_fetch)
NOTE: package vsftpd-2.0.5-r4: task do_fetch: Started
NOTE: package tinylogin-1.4-r7: task do_fetch: Succeeded
NOTE: package opkg-collateral-1.0-r3: task do_fetch: Succeeded
NOTE: package vsftpd-2.0.5-r4: task do_fetch: Succeeded
NOTE: Running task 1557 of 5581 (ID: 879, /home/oe/openembedded/recipes/opkg/opkg-collateral.bb, do_unpack)
NOTE: package opkg-collateral-1.0-r3: task do_unpack: Started
NOTE: Running task 1558 of 5581 (ID: 823, /home/oe/openembedded/recipes/tinylogin/tinylogin_1.4.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/opkg/opkg-collateral/opkg.conf.comments to tmp/work/all-angstrom-linux-gnueabi/opkg-collateral-1.0-r3/
NOTE: package tinylogin-1.4-r7: task do_unpack: Started
NOTE: Running task 1559 of 5581 (ID: 781, /home/oe/openembedded/recipes/initscripts/initscripts_1.0.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/opkg/opkg-collateral/lists to tmp/work/all-angstrom-linux-gnueabi/opkg-collateral-1.0-r3/
NOTE: Unpacking ../openembedded/recipes/opkg/opkg-collateral/dest to tmp/work/all-angstrom-linux-gnueabi/opkg-collateral-1.0-r3/
NOTE: Unpacking ../openembedded/recipes/opkg/opkg-collateral/tmp_dir to tmp/work/all-angstrom-linux-gnueabi/opkg-collateral-1.0-r3/
NOTE: Unpacking ../openembedded/recipes/opkg/opkg-collateral/src to tmp/work/all-angstrom-linux-gnueabi/opkg-collateral-1.0-r3/
NOTE: Unpacking ../sources/tinylogin-1.4.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/tinylogin-1.4-r7/
NOTE: package tinylogin-1.4-r7: task do_unpack: Succeeded
NOTE: package initscripts-1.0-r128: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/initscripts/files/functions to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/halt to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/ramdisk to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Running task 1560 of 5581 (ID: 767, /home/oe/openembedded/recipes/vsftpd/vsftpd_2.0.5.bb, do_unpack)
NOTE: package vsftpd-2.0.5-r4: task do_unpack: Started
NOTE: package opkg-collateral-1.0-r3: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/initscripts/files/umountfs to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/devices to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/devpts.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/devpts to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../sources/vsftpd-2.0.5.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/vsftpd-2.0.5-r4/
NOTE: Unpacking ../openembedded/recipes/vsftpd/files/init to tmp/work/armv5te-angstrom-linux-gnueabi/vsftpd-2.0.5-r4/
NOTE: Unpacking ../openembedded/recipes/vsftpd/files/vsftpd.conf to tmp/work/armv5te-angstrom-linux-gnueabi/vsftpd-2.0.5-r4/
NOTE: package vsftpd-2.0.5-r4: task do_unpack: Succeeded
NOTE: Running task 1561 of 5581 (ID: 747, /home/oe/openembedded/recipes/pstree/pstree_2.33.bb, do_setscene)
NOTE: Unpacking ../openembedded/recipes/initscripts/files/hostname.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/mountall.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/banner to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/finish.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/bootmisc.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/mountnfs.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/reboot to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/checkfs.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/single to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/sendsigs to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/urandom to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/rmnologin to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/checkroot to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/umountnfs.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/sysfs.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/device_table.txt to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/initscripts-1.0/populate-volatile.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/volatiles to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/save-rtc.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/save-rtc-uclibc.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: Unpacking ../openembedded/recipes/initscripts/files/arm/alignment.sh to tmp/work/armv5te-angstrom-linux-gnueabi/initscripts-1.0-r128/
NOTE: package initscripts-1.0-r128: task do_unpack: Succeeded
NOTE: package pstree-2.33-r0: task do_setscene: Started
NOTE: Running task 1562 of 5581 (ID: 733, /home/oe/openembedded/recipes/picocom/picocom_1.4.bb, do_setscene)
NOTE: package picocom-1.4-r2: task do_setscene: Started
NOTE: Running task 1563 of 5581 (ID: 719, /home/oe/openembedded/recipes/nano/nano_2.2.5.bb, do_setscene)
NOTE: package nano-2.2.5-r2.0: task do_setscene: Started
NOTE: Running task 1564 of 5581 (ID: 705, /home/oe/openembedded/recipes/mtd/mtd-utils_1.4.4.bb, do_setscene)
NOTE: package picocom-1.4-r2: task do_setscene: Succeeded
NOTE: package mtd-utils-1.4.4-r0: task do_setscene: Started
NOTE: package pstree-2.33-r0: task do_setscene: Succeeded
NOTE: package nano-2.2.5-r2.0: task do_setscene: Succeeded
NOTE: package mtd-utils-1.4.4-r0: task do_setscene: Succeeded
NOTE: Running task 1565 of 5581 (ID: 746, /home/oe/openembedded/recipes/pstree/pstree_2.33.bb, do_fetch)
NOTE: package pstree-2.33-r0: task do_fetch: Started
NOTE: Running task 1566 of 5581 (ID: 732, /home/oe/openembedded/recipes/picocom/picocom_1.4.bb, do_fetch)
NOTE: package picocom-1.4-r2: task do_fetch: Started
NOTE: Running task 1567 of 5581 (ID: 718, /home/oe/openembedded/recipes/nano/nano_2.2.5.bb, do_fetch)
NOTE: package pstree-2.33-r0: task do_fetch: Succeeded
NOTE: package picocom-1.4-r2: task do_fetch: Succeeded
NOTE: package nano-2.2.5-r2.0: task do_fetch: Started
NOTE: package nano-2.2.5-r2.0: task do_fetch: Succeeded
NOTE: Running task 1568 of 5581 (ID: 691, /home/oe/openembedded/recipes/mii-diag/mii-diag_2.11.bb, do_setscene)
NOTE: package mii-diag-2.11-r4: task do_setscene: Started
NOTE: Running task 1569 of 5581 (ID: 739, /home/oe/openembedded/recipes/pstree/pstree_2.33.bb, do_unpack)
NOTE: package pstree-2.33-r0: task do_unpack: Started
NOTE: Running task 1570 of 5581 (ID: 725, /home/oe/openembedded/recipes/picocom/picocom_1.4.bb, do_unpack)
NOTE: package picocom-1.4-r2: task do_unpack: Started
NOTE: Unpacking ../sources/pstree-2.33.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/pstree-2.33-r0/
NOTE: package pstree-2.33-r0: task do_unpack: Succeeded
NOTE: Unpacking ../sources/picocom-1.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/picocom-1.4-r2/
NOTE: package picocom-1.4-r2: task do_unpack: Succeeded
NOTE: Running task 1571 of 5581 (ID: 711, /home/oe/openembedded/recipes/nano/nano_2.2.5.bb, do_unpack)
NOTE: package nano-2.2.5-r2.0: task do_unpack: Started
NOTE: package mii-diag-2.11-r4: task do_setscene: Succeeded
NOTE: Unpacking ../sources/nano-2.2.5.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/nano-2.2.5-r2.0/
NOTE: package nano-2.2.5-r2.0: task do_unpack: Succeeded
NOTE: Running task 1572 of 5581 (ID: 677, /home/oe/openembedded/recipes/memedit/memedit_0.7.bb, do_setscene)
NOTE: Running task 1573 of 5581 (ID: 690, /home/oe/openembedded/recipes/mii-diag/mii-diag_2.11.bb, do_fetch)
NOTE: package mii-diag-2.11-r4: task do_fetch: Started
NOTE: package memedit-0.7-r0: task do_setscene: Started
NOTE: Running task 1574 of 5581 (ID: 634, /home/oe/openembedded/recipes/lighttpd/lighttpd_1.4.26.bb, do_setscene)
NOTE: package mii-diag-2.11-r4: task do_fetch: Succeeded
NOTE: package lighttpd-1.4.26-r9.0: task do_setscene: Started
NOTE: Running task 1575 of 5581 (ID: 1372, virtual:native:/home/oe/openembedded/recipes/lzo/lzo2_2.03.bb, do_patch)
NOTE: package lzo2-native-2.03-r0: task do_patch: Started
NOTE: package lzo2-native-2.03-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 5581 (ID: 683, /home/oe/openembedded/recipes/mii-diag/mii-diag_2.11.bb, do_unpack)
NOTE: package mii-diag-2.11-r4: task do_unpack: Started
NOTE: Running task 1577 of 5581 (ID: 1218, /home/oe/openembedded/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb, do_patch)
NOTE: Unpacking ../openembedded/recipes/mii-diag/mii-diag-2.11/mii-diag.c to tmp/work/armv5te-angstrom-linux-gnueabi/mii-diag-2.11-r4/
NOTE: Unpacking ../openembedded/recipes/mii-diag/mii-diag-2.11/libmii.c to tmp/work/armv5te-angstrom-linux-gnueabi/mii-diag-2.11-r4/
NOTE: package mii-diag-2.11-r4: task do_unpack: Succeeded
NOTE: package memedit-0.7-r0: task do_setscene: Succeeded
NOTE: package hicolor-icon-theme-0.11-r1: task do_patch: Started
NOTE: package hicolor-icon-theme-0.11-r1: task do_patch: Succeeded
NOTE: package lighttpd-1.4.26-r9.0: task do_setscene: Succeeded
NOTE: Running task 1578 of 5581 (ID: 676, /home/oe/openembedded/recipes/memedit/memedit_0.7.bb, do_fetch)
NOTE: package memedit-0.7-r0: task do_fetch: Started
NOTE: Running task 1579 of 5581 (ID: 5181, /home/oe/openembedded/recipes/pointercal/pointercal_0.0.bb, do_setscene)
NOTE: package pointercal-0.0-r22: task do_setscene: Started
NOTE: Running task 1580 of 5581 (ID: 633, /home/oe/openembedded/recipes/lighttpd/lighttpd_1.4.26.bb, do_fetch)
NOTE: Running task 1581 of 5581 (ID: 4415, /home/oe/openembedded/recipes/font-update-common/font-update-common_0.1.bb, do_setscene)
NOTE: package memedit-0.7-r0: task do_fetch: Succeeded
NOTE: package lighttpd-1.4.26-r9.0: task do_fetch: Started
NOTE: package lighttpd-1.4.26-r9.0: task do_fetch: Succeeded
NOTE: package font-update-common-0.1-r1: task do_setscene: Started
NOTE: Running task 1582 of 5581 (ID: 669, /home/oe/openembedded/recipes/memedit/memedit_0.7.bb, do_unpack)
NOTE: package memedit-0.7-r0: task do_unpack: Started
NOTE: Unpacking ../sources/memedit-0.7.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/memedit-0.7-r0/
NOTE: package memedit-0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1583 of 5581 (ID: 626, /home/oe/openembedded/recipes/lighttpd/lighttpd_1.4.26.bb, do_unpack)
NOTE: package lighttpd-1.4.26-r9.0: task do_unpack: Started
NOTE: package pointercal-0.0-r22: task do_setscene: Succeeded
NOTE: Unpacking ../sources/lighttpd-1.4.26.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/lighttpd-1.4.26-r9.0/
NOTE: Unpacking ../openembedded/recipes/lighttpd/lighttpd/index.html to tmp/work/armv5te-angstrom-linux-gnueabi/lighttpd-1.4.26-r9.0/
NOTE: Unpacking ../openembedded/recipes/lighttpd/lighttpd/lighttpd.conf to tmp/work/armv5te-angstrom-linux-gnueabi/lighttpd-1.4.26-r9.0/
NOTE: Unpacking ../openembedded/recipes/lighttpd/lighttpd/lighttpd to tmp/work/armv5te-angstrom-linux-gnueabi/lighttpd-1.4.26-r9.0/
NOTE: package lighttpd-1.4.26-r9.0: task do_unpack: Succeeded
NOTE: package font-update-common-0.1-r1: task do_setscene: Succeeded
NOTE: Running task 1584 of 5581 (ID: 5180, /home/oe/openembedded/recipes/pointercal/pointercal_0.0.bb, do_fetch)
NOTE: package pointercal-0.0-r22: task do_fetch: Started
NOTE: Running task 1585 of 5581 (ID: 4401, /home/oe/openembedded/recipes/zeroconf/zeroconf_0.9.bb, do_setscene)
NOTE: package pointercal-0.0-r22: task do_fetch: Succeeded
NOTE: Running task 1586 of 5581 (ID: 2900, /home/oe/openembedded/recipes/pam/libpam-base-files.bb, do_setscene)
NOTE: Running task 1587 of 5581 (ID: 4414, /home/oe/openembedded/recipes/font-update-common/font-update-common_0.1.bb, do_fetch)
NOTE: package zeroconf-0.9-r2: task do_setscene: Started
NOTE: package libpam-base-files-1.0-r7: task do_setscene: Started
NOTE: package font-update-common-0.1-r1: task do_fetch: Started
NOTE: package font-update-common-0.1-r1: task do_fetch: Succeeded
NOTE: Running task 1588 of 5581 (ID: 5173, /home/oe/openembedded/recipes/pointercal/pointercal_0.0.bb, do_unpack)
NOTE: package zeroconf-0.9-r2: task do_setscene: Succeeded
NOTE: package libpam-base-files-1.0-r7: task do_setscene: Succeeded
NOTE: Running task 1589 of 5581 (ID: 4407, /home/oe/openembedded/recipes/font-update-common/font-update-common_0.1.bb, do_unpack)
NOTE: package pointercal-0.0-r22: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/pointercal/files/pointercal to tmp/work/pcontrolg20-angstrom-linux-gnueabi/pointercal-0.0-r22/
NOTE: package pointercal-0.0-r22: task do_unpack: Succeeded
NOTE: package font-update-common-0.1-r1: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/font-update-common/files/update-fonts to tmp/work/all-angstrom-linux-gnueabi/font-update-common-0.1-r1/
NOTE: package font-update-common-0.1-r1: task do_unpack: Succeeded
NOTE: Running task 1590 of 5581 (ID: 4400, /home/oe/openembedded/recipes/zeroconf/zeroconf_0.9.bb, do_fetch)
NOTE: package zeroconf-0.9-r2: task do_fetch: Started
NOTE: Running task 1591 of 5581 (ID: 2899, /home/oe/openembedded/recipes/pam/libpam-base-files.bb, do_fetch)
NOTE: package libpam-base-files-1.0-r7: task do_fetch: Started
NOTE: Running task 1592 of 5581 (ID: 2886, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_setscene)
NOTE: Running task 1593 of 5581 (ID: 2844, /home/oe/openembedded/recipes/libnss-mdns/libnss-mdns_0.10.bb, do_setscene)
NOTE: package zeroconf-0.9-r2: task do_fetch: Succeeded
NOTE: package libpam-base-files-1.0-r7: task do_fetch: Succeeded
NOTE: package ttf-dejavu-2.23-r3: task do_setscene: Started
NOTE: package libnss-mdns-0.10-r0: task do_setscene: Started
NOTE: Running task 1594 of 5581 (ID: 4393, /home/oe/openembedded/recipes/zeroconf/zeroconf_0.9.bb, do_unpack)
NOTE: package zeroconf-0.9-r2: task do_unpack: Started
NOTE: Unpacking ../sources/zeroconf-0.9.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/zeroconf-0.9-r2/
NOTE: Unpacking ../openembedded/recipes/zeroconf/zeroconf-0.9/zeroconf-default to tmp/work/armv5te-angstrom-linux-gnueabi/zeroconf-0.9-r2/
NOTE: Running task 1595 of 5581 (ID: 2892, /home/oe/openembedded/recipes/pam/libpam-base-files.bb, do_unpack)
NOTE: package libpam-base-files-1.0-r7: task do_unpack: Started
NOTE: package ttf-dejavu-2.23-r3: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/zeroconf/zeroconf-0.9/debian-zeroconf to tmp/work/armv5te-angstrom-linux-gnueabi/zeroconf-0.9-r2/
NOTE: package zeroconf-0.9-r2: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/libcupsys2 to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/sesman to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: package libnss-mdns-0.10-r0: task do_setscene: Succeeded
NOTE: Running task 1596 of 5581 (ID: 2885, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_fetch)
NOTE: package ttf-dejavu-2.23-r3: task do_fetch: Started
NOTE: Running task 1597 of 5581 (ID: 2830, /home/oe/openembedded/recipes/python/python-pygtk_2.16.0.bb, do_setscene)
NOTE: package ttf-dejavu-2.23-r3: task do_fetch: Succeeded
NOTE: package python-pygtk-2.16.0-r3: task do_setscene: Started
NOTE: Running task 1598 of 5581 (ID: 2843, /home/oe/openembedded/recipes/libnss-mdns/libnss-mdns_0.10.bb, do_fetch)
NOTE: package libnss-mdns-0.10-r0: task do_fetch: Started
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/other to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/ppp to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/cron to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/common-password to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: package libnss-mdns-0.10-r0: task do_fetch: Succeeded
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/atd to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/common-auth to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/common-account to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/common-session to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/sshd to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/common-session-noninteractive to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Unpacking ../openembedded/recipes/pam/libpam-base-files/pam.d/cvs to tmp/work/armv5te-angstrom-linux-gnueabi/libpam-base-files-1.0-r7/pam.d/
NOTE: Running task 1599 of 5581 (ID: 2878, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_unpack)
NOTE: package ttf-dejavu-2.23-r3: task do_unpack: Started
NOTE: package libpam-base-files-1.0-r7: task do_unpack: Succeeded
NOTE: Unpacking ../sources/dejavu-fonts-ttf-2.23.tar.bz2 to tmp/work/all-angstrom-linux-gnueabi/ttf-dejavu-2.23-r3/
NOTE: Running task 1600 of 5581 (ID: 2836, /home/oe/openembedded/recipes/libnss-mdns/libnss-mdns_0.10.bb, do_unpack)
NOTE: package libnss-mdns-0.10-r0: task do_unpack: Started
NOTE: Unpacking ../sources/nss-mdns-0.10.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/libnss-mdns-0.10-r0/
NOTE: package libnss-mdns-0.10-r0: task do_unpack: Succeeded
NOTE: package python-pygtk-2.16.0-r3: task do_setscene: Succeeded
NOTE: Running task 1601 of 5581 (ID: 2816, /home/oe/openembedded/recipes/python/python-dbus_0.83.2.bb, do_setscene)
NOTE: package python-dbus-0.83.2-ml0: task do_setscene: Started
NOTE: Running task 1602 of 5581 (ID: 2802, /home/oe/openembedded/recipes/netbase/netbase_4.21.bb, do_setscene)
NOTE: package netbase-4.21-r51: task do_setscene: Started
NOTE: Running task 1603 of 5581 (ID: 2829, /home/oe/openembedded/recipes/python/python-pygtk_2.16.0.bb, do_fetch)
NOTE: package python-pygtk-2.16.0-r3: task do_fetch: Started
NOTE: package python-dbus-0.83.2-ml0: task do_setscene: Succeeded
NOTE: Running task 1604 of 5581 (ID: 2815, /home/oe/openembedded/recipes/python/python-dbus_0.83.2.bb, do_fetch)
NOTE: package python-dbus-0.83.2-ml0: task do_fetch: Started
NOTE: Unpacking ../openembedded/recipes/ttf-fonts/ttf-dejavu/30-dejavu-aliases.conf to tmp/work/all-angstrom-linux-gnueabi/ttf-dejavu-2.23-r3/
NOTE: package netbase-4.21-r51: task do_setscene: Succeeded
NOTE: package ttf-dejavu-2.23-r3: task do_unpack: Succeeded
NOTE: Running task 1605 of 5581 (ID: 2801, /home/oe/openembedded/recipes/netbase/netbase_4.21.bb, do_fetch)
NOTE: package netbase-4.21-r51: task do_fetch: Started
NOTE: package python-pygtk-2.16.0-r3: task do_fetch: Succeeded
NOTE: package python-dbus-0.83.2-ml0: task do_fetch: Succeeded
NOTE: package netbase-4.21-r51: task do_fetch: Succeeded
NOTE: Running task 1606 of 5581 (ID: 2788, /home/oe/openembedded/recipes/modutils/modutils-initscripts.bb, do_setscene)
NOTE: Running task 1607 of 5581 (ID: 2822, /home/oe/openembedded/recipes/python/python-pygtk_2.16.0.bb, do_unpack)
NOTE: Running task 1608 of 5581 (ID: 2808, /home/oe/openembedded/recipes/python/python-dbus_0.83.2.bb, do_unpack)
NOTE: package python-pygtk-2.16.0-r3: task do_unpack: Started
NOTE: package modutils-initscripts-1.0-r4: task do_setscene: Started
NOTE: Running task 1609 of 5581 (ID: 2794, /home/oe/openembedded/recipes/netbase/netbase_4.21.bb, do_unpack)
NOTE: package netbase-4.21-r51: task do_unpack: Started
NOTE: package python-dbus-0.83.2-ml0: task do_unpack: Started
NOTE: Unpacking ../sources/dbus-python-0.83.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/python-dbus-0.83.2-ml0/
NOTE: package python-dbus-0.83.2-ml0: task do_unpack: Succeeded
NOTE: Unpacking ../sources/pygtk-2.16.0.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/python-pygtk-2.16.0-r3/
NOTE: Unpacking ../sources/netbase-4.21.tar.gz to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/options to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/init to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/pcontrolg20/hosts to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/pcontrolg20/interfaces to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/if-pre-up.d to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/if-up.d to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/if-down.d to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Unpacking ../openembedded/recipes/netbase/netbase/if-post-down.d to tmp/work/pcontrolg20-angstrom-linux-gnueabi/netbase-4.21-r51/
NOTE: Running task 1610 of 5581 (ID: 2774, /home/oe/openembedded/recipes/busybox/busybox_1.18.4.bb, do_setscene)
NOTE: package busybox-1.18.4-r43.2: task do_setscene: Started
NOTE: package netbase-4.21-r51: task do_unpack: Succeeded
NOTE: package modutils-initscripts-1.0-r4: task do_setscene: Succeeded
NOTE: Running task 1611 of 5581 (ID: 2760, /home/oe/openembedded/recipes/base-passwd/base-passwd_3.5.20.bb, do_setscene)
NOTE: package base-passwd-3.5.20-r1: task do_setscene: Started
NOTE: Running task 1612 of 5581 (ID: 2787, /home/oe/openembedded/recipes/modutils/modutils-initscripts.bb, do_fetch)
NOTE: package base-passwd-3.5.20-r1: task do_setscene: Succeeded
NOTE: package busybox-1.18.4-r43.2: task do_setscene: Succeeded
NOTE: package modutils-initscripts-1.0-r4: task do_fetch: Started
NOTE: package modutils-initscripts-1.0-r4: task do_fetch: Succeeded
NOTE: Running task 1613 of 5581 (ID: 2773, /home/oe/openembedded/recipes/busybox/busybox_1.18.4.bb, do_fetch)
NOTE: package busybox-1.18.4-r43.2: task do_fetch: Started
NOTE: Running task 1614 of 5581 (ID: 2759, /home/oe/openembedded/recipes/base-passwd/base-passwd_3.5.20.bb, do_fetch)
NOTE: package busybox-1.18.4-r43.2: task do_fetch: Succeeded
NOTE: package base-passwd-3.5.20-r1: task do_fetch: Started
NOTE: package base-passwd-3.5.20-r1: task do_fetch: Succeeded
NOTE: Running task 1615 of 5581 (ID: 2780, /home/oe/openembedded/recipes/modutils/modutils-initscripts.bb, do_unpack)
NOTE: package modutils-initscripts-1.0-r4: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/modutils/files/modutils.sh to tmp/work/armv5te-angstrom-linux-gnueabi/modutils-initscripts-1.0-r4/
NOTE: package modutils-initscripts-1.0-r4: task do_unpack: Succeeded
NOTE: Running task 1616 of 5581 (ID: 2766, /home/oe/openembedded/recipes/busybox/busybox_1.18.4.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/python/python-pygtk/acinclude.m4 to tmp/work/armv5te-angstrom-linux-gnueabi/python-pygtk-2.16.0-r3/
NOTE: package busybox-1.18.4-r43.2: task do_unpack: Started
NOTE: Running task 1617 of 5581 (ID: 2752, /home/oe/openembedded/recipes/base-passwd/base-passwd_3.5.20.bb, do_unpack)
NOTE: Running task 1618 of 5581 (ID: 2746, /home/oe/openembedded/recipes/base-files/base-files_3.0.14.bb, do_setscene)
NOTE: package python-pygtk-2.16.0-r3: task do_unpack: Succeeded
NOTE: Unpacking ../sources/busybox-1.18.4.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: package base-passwd-3.5.20-r1: task do_unpack: Started
NOTE: Unpacking ../sources/base-passwd_3.5.20.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/base-passwd-3.5.20-r1/
NOTE: package base-passwd-3.5.20-r1: task do_unpack: Succeeded
NOTE: package base-files-3.0.14-r103: task do_setscene: Started
NOTE: Running task 1619 of 5581 (ID: 2732, /home/oe/openembedded/recipes/stat/stat_3.3.bb, do_setscene)
NOTE: package stat-3.3-r1: task do_setscene: Started
NOTE: Running task 1620 of 5581 (ID: 2718, /home/oe/openembedded/recipes/gawk/gawk_3.1.4.bb, do_setscene)
NOTE: package gawk-3.1.4-r4: task do_setscene: Started
NOTE: package base-files-3.0.14-r103: task do_setscene: Succeeded
NOTE: package stat-3.3-r1: task do_setscene: Succeeded
NOTE: Running task 1621 of 5581 (ID: 2745, /home/oe/openembedded/recipes/base-files/base-files_3.0.14.bb, do_fetch)
NOTE: package base-files-3.0.14-r103: task do_fetch: Started
NOTE: package gawk-3.1.4-r4: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/busybox/files/find-touchscreen.sh to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/busybox-cron to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/busybox-httpd to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/busybox-udhcpd to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/default.script to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/simple.script to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/group to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/hwclock.sh to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/hwclock-default to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/inetd to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/inetd.conf to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/mount.busybox to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/mountall to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/passwd to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/shadow to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/syslog to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/syslog.conf to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/umount.busybox to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/busybox-1.18.4/defconfig to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/mdev to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/mdev.conf to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: Unpacking ../openembedded/recipes/busybox/files/usb.sh to tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.18.4-r43.2/
NOTE: package busybox-1.18.4-r43.2: task do_unpack: Succeeded
NOTE: package base-files-3.0.14-r103: task do_fetch: Succeeded
NOTE: Running task 1622 of 5581 (ID: 2704, /home/oe/openembedded/recipes/bash/bash_3.2.bb, do_setscene)
NOTE: package bash-3.2-r12: task do_setscene: Started
NOTE: Running task 1623 of 5581 (ID: 2731, /home/oe/openembedded/recipes/stat/stat_3.3.bb, do_fetch)
NOTE: package stat-3.3-r1: task do_fetch: Started
NOTE: Running task 1624 of 5581 (ID: 2717, /home/oe/openembedded/recipes/gawk/gawk_3.1.4.bb, do_fetch)
NOTE: package stat-3.3-r1: task do_fetch: Succeeded
NOTE: package gawk-3.1.4-r4: task do_fetch: Started
NOTE: package gawk-3.1.4-r4: task do_fetch: Succeeded
NOTE: Running task 1625 of 5581 (ID: 2738, /home/oe/openembedded/recipes/base-files/base-files_3.0.14.bb, do_unpack)
NOTE: package base-files-3.0.14-r103: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/nsswitch.conf to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/motd to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/inputrc to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/host.conf to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/profile to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/profile.d to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Running task 1626 of 5581 (ID: 2724, /home/oe/openembedded/recipes/stat/stat_3.3.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/fstab to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/filesystems to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/angstrom/issue.net to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/angstrom/issue to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/usbd to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/share/dot.bashrc to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/share/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/share/dot.profile to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/share/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/BSD to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/GPL-2 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/GPL-3 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/LGPL-2 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/LGPL-2.1 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/LGPL-3 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/GFDL-1.2 to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: Unpacking ../openembedded/recipes/base-files/base-files/licenses/Artistic to tmp/work/pcontrolg20-angstrom-linux-gnueabi/base-files-3.0.14-r103/licenses/
NOTE: package base-files-3.0.14-r103: task do_unpack: Succeeded
NOTE: package stat-3.3-r1: task do_unpack: Started
NOTE: Running task 1627 of 5581 (ID: 2710, /home/oe/openembedded/recipes/gawk/gawk_3.1.4.bb, do_unpack)
NOTE: Unpacking ../sources/stat-3.3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/stat-3.3-r1/
NOTE: package stat-3.3-r1: task do_unpack: Succeeded
NOTE: package gawk-3.1.4-r4: task do_unpack: Started
NOTE: Unpacking ../sources/gawk-3.1.4.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/gawk-3.1.4-r4/
NOTE: package bash-3.2-r12: task do_setscene: Succeeded
NOTE: Running task 1628 of 5581 (ID: 1167, /home/oe/openembedded/recipes/openssh/openssh_5.6p1.bb, do_setscene)
NOTE: package openssh-5.6p1-r9.0: task do_setscene: Started
NOTE: package gawk-3.1.4-r4: task do_unpack: Succeeded
NOTE: Running task 1629 of 5581 (ID: 1153, /home/oe/openembedded/recipes/avahi/avahi_0.6.30.bb, do_setscene)
NOTE: Running task 1630 of 5581 (ID: 2703, /home/oe/openembedded/recipes/bash/bash_3.2.bb, do_fetch)
NOTE: package avahi-0.6.30-r13.1: task do_setscene: Started
NOTE: Running task 1631 of 5581 (ID: 1139, /home/oe/openembedded/recipes/usb-gadget-mode/usb-gadget-mode.bb, do_setscene)
NOTE: package bash-3.2-r12: task do_fetch: Started
NOTE: package usb-gadget-mode-0.0.2-r8: task do_setscene: Started
NOTE: package avahi-0.6.30-r13.1: task do_setscene: Succeeded
NOTE: package openssh-5.6p1-r9.0: task do_setscene: Succeeded
NOTE: Running task 1632 of 5581 (ID: 1152, /home/oe/openembedded/recipes/avahi/avahi_0.6.30.bb, do_fetch)
NOTE: package avahi-0.6.30-r13.1: task do_fetch: Started
NOTE: package usb-gadget-mode-0.0.2-r8: task do_setscene: Succeeded
NOTE: package avahi-0.6.30-r13.1: task do_fetch: Succeeded
NOTE: Running task 1633 of 5581 (ID: 1166, /home/oe/openembedded/recipes/openssh/openssh_5.6p1.bb, do_fetch)
NOTE: package openssh-5.6p1-r9.0: task do_fetch: Started
NOTE: Running task 1634 of 5581 (ID: 1145, /home/oe/openembedded/recipes/avahi/avahi_0.6.30.bb, do_unpack)
NOTE: package openssh-5.6p1-r9.0: task do_fetch: Succeeded
NOTE: package avahi-0.6.30-r13.1: task do_unpack: Started
NOTE: Unpacking ../sources/avahi-0.6.30.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/avahi-0.6.30-r13.1/
NOTE: Unpacking ../openembedded/recipes/avahi/files/00avahi-autoipd to tmp/work/armv5te-angstrom-linux-gnueabi/avahi-0.6.30-r13.1/
NOTE: Unpacking ../openembedded/recipes/avahi/files/99avahi-autoipd to tmp/work/armv5te-angstrom-linux-gnueabi/avahi-0.6.30-r13.1/
NOTE: Running task 1635 of 5581 (ID: 1138, /home/oe/openembedded/recipes/usb-gadget-mode/usb-gadget-mode.bb, do_fetch)
NOTE: package bash-3.2-r12: task do_fetch: Succeeded
NOTE: package avahi-0.6.30-r13.1: task do_unpack: Succeeded
NOTE: package usb-gadget-mode-0.0.2-r8: task do_fetch: Started
NOTE: package usb-gadget-mode-0.0.2-r8: task do_fetch: Succeeded
NOTE: Running task 1636 of 5581 (ID: 2696, /home/oe/openembedded/recipes/bash/bash_3.2.bb, do_unpack)
NOTE: package bash-3.2-r12: task do_unpack: Started
NOTE: Running task 1637 of 5581 (ID: 1159, /home/oe/openembedded/recipes/openssh/openssh_5.6p1.bb, do_unpack)
NOTE: package openssh-5.6p1-r9.0: task do_unpack: Started
NOTE: Running task 1638 of 5581 (ID: 1111, /home/oe/openembedded/recipes/sysfsutils/sysfsutils_2.1.0.bb, do_setscene)
NOTE: Running task 1639 of 5581 (ID: 1131, /home/oe/openembedded/recipes/usb-gadget-mode/usb-gadget-mode.bb, do_unpack)
NOTE: Unpacking ../sources/bash-3.2.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/bash-3.2-r12/
NOTE: Unpacking ../sources/openssh-5.6p1.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/openssh-5.6p1-r9.0/
NOTE: Unpacking ../openembedded/recipes/openssh/openssh-5.6p1/sshd_config to tmp/work/armv5te-angstrom-linux-gnueabi/openssh-5.6p1-r9.0/
NOTE: package sysfsutils-2.1.0-r3: task do_setscene: Started
NOTE: package usb-gadget-mode-0.0.2-r8: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/usb-gadget-mode/files/usb-gadget.conf to tmp/work/pcontrolg20-angstrom-linux-gnueabi/usb-gadget-mode-0.0.2-r8/
NOTE: Unpacking ../openembedded/recipes/usb-gadget-mode/files/usb-gadget to tmp/work/pcontrolg20-angstrom-linux-gnueabi/usb-gadget-mode-0.0.2-r8/
NOTE: Unpacking ../openembedded/recipes/usb-gadget-mode/files/usb-gadget.init to tmp/work/pcontrolg20-angstrom-linux-gnueabi/usb-gadget-mode-0.0.2-r8/
NOTE: package usb-gadget-mode-0.0.2-r8: task do_unpack: Succeeded
NOTE: Unpacking ../openembedded/recipes/openssh/openssh-5.6p1/ssh_config to tmp/work/armv5te-angstrom-linux-gnueabi/openssh-5.6p1-r9.0/
NOTE: Unpacking ../openembedded/recipes/openssh/files/init to tmp/work/armv5te-angstrom-linux-gnueabi/openssh-5.6p1-r9.0/
NOTE: Running task 1640 of 5581 (ID: 1097, /home/oe/openembedded/recipes/dropbear/dropbear_0.52.bb, do_setscene)
NOTE: package dropbear-0.52-r7.0: task do_setscene: Started
NOTE: package bash-3.2-r12: task do_unpack: Succeeded
NOTE: package openssh-5.6p1-r9.0: task do_unpack: Succeeded
NOTE: package sysfsutils-2.1.0-r3: task do_setscene: Succeeded
NOTE: Running task 1641 of 5581 (ID: 1069, /home/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.14.bb, do_setscene)
NOTE: Running task 1642 of 5581 (ID: 1055, /home/oe/openembedded/recipes/hdparm/hdparm_9.35.bb, do_setscene)
NOTE: Running task 1643 of 5581 (ID: 1110, /home/oe/openembedded/recipes/sysfsutils/sysfsutils_2.1.0.bb, do_fetch)
NOTE: package sysfsutils-2.1.0-r3: task do_fetch: Started
NOTE: package e2fsprogs-1.41.14-r30: task do_setscene: Started
NOTE: package hdparm-9.35-r0: task do_setscene: Started
NOTE: package sysfsutils-2.1.0-r3: task do_fetch: Succeeded
NOTE: Running task 1644 of 5581 (ID: 1103, /home/oe/openembedded/recipes/sysfsutils/sysfsutils_2.1.0.bb, do_unpack)
NOTE: package sysfsutils-2.1.0-r3: task do_unpack: Started
NOTE: package dropbear-0.52-r7.0: task do_setscene: Succeeded
NOTE: package hdparm-9.35-r0: task do_setscene: Succeeded
NOTE: Unpacking ../sources/sysfsutils-2.1.0.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/sysfsutils-2.1.0-r3/
NOTE: package sysfsutils-2.1.0-r3: task do_unpack: Succeeded
NOTE: Running task 1645 of 5581 (ID: 1096, /home/oe/openembedded/recipes/dropbear/dropbear_0.52.bb, do_fetch)
NOTE: package dropbear-0.52-r7.0: task do_fetch: Started
NOTE: Running task 1646 of 5581 (ID: 1027, /home/oe/openembedded/recipes/blueprobe/blueprobe_0.18.bb, do_setscene)
NOTE: package e2fsprogs-1.41.14-r30: task do_setscene: Succeeded
NOTE: package dropbear-0.52-r7.0: task do_fetch: Succeeded
NOTE: Running task 1647 of 5581 (ID: 1054, /home/oe/openembedded/recipes/hdparm/hdparm_9.35.bb, do_fetch)
NOTE: package hdparm-9.35-r0: task do_fetch: Started
NOTE: package hdparm-9.35-r0: task do_fetch: Succeeded
NOTE: package blueprobe-0.18-r6: task do_setscene: Started
NOTE: Running task 1648 of 5581 (ID: 1068, /home/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.14.bb, do_fetch)
NOTE: package e2fsprogs-1.41.14-r30: task do_fetch: Started
NOTE: Running task 1649 of 5581 (ID: 1089, /home/oe/openembedded/recipes/dropbear/dropbear_0.52.bb, do_unpack)
NOTE: package e2fsprogs-1.41.14-r30: task do_fetch: Succeeded
NOTE: package dropbear-0.52-r7.0: task do_unpack: Started
NOTE: Unpacking ../sources/dropbear-0.52.tar.bz2 to tmp/work/armv5te-angstrom-linux-gnueabi/dropbear-0.52-r7.0/
NOTE: Running task 1650 of 5581 (ID: 1047, /home/oe/openembedded/recipes/hdparm/hdparm_9.35.bb, do_unpack)
NOTE: package hdparm-9.35-r0: task do_unpack: Started
NOTE: package blueprobe-0.18-r6: task do_setscene: Succeeded
NOTE: Unpacking ../sources/hdparm-9.35.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/hdparm-9.35-r0/
NOTE: package hdparm-9.35-r0: task do_unpack: Succeeded
NOTE: Running task 1651 of 5581 (ID: 1061, /home/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.14.bb, do_unpack)
NOTE: package e2fsprogs-1.41.14-r30: task do_unpack: Started
NOTE: Running task 1652 of 5581 (ID: 1026, /home/oe/openembedded/recipes/blueprobe/blueprobe_0.18.bb, do_fetch)
NOTE: Unpacking ../sources/e2fsprogs-1.41.14.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.41.14-r30/
NOTE: package blueprobe-0.18-r6: task do_fetch: Started
NOTE: package blueprobe-0.18-r6: task do_fetch: Succeeded
NOTE: Running task 1653 of 5581 (ID: 1013, /home/oe/openembedded/recipes/ppp-dialin/ppp-dialin_0.1.bb, do_setscene)
NOTE: package ppp-dialin-0.1-r7: task do_setscene: Started
NOTE: Running task 1654 of 5581 (ID: 1019, /home/oe/openembedded/recipes/blueprobe/blueprobe_0.18.bb, do_unpack)
NOTE: package blueprobe-0.18-r6: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/dropbear/dropbear-0.52/allow-nopw.patch to tmp/work/armv5te-angstrom-linux-gnueabi/dropbear-0.52-r7.0/
NOTE: Unpacking ../openembedded/recipes/dropbear/dropbear/init to tmp/work/armv5te-angstrom-linux-gnueabi/dropbear-0.52-r7.0/
NOTE: Unpacking ../openembedded/recipes/dropbear/dropbear/default to tmp/work/armv5te-angstrom-linux-gnueabi/dropbear-0.52-r7.0/
NOTE: package dropbear-0.52-r7.0: task do_unpack: Succeeded
NOTE: package e2fsprogs-1.41.14-r30: task do_unpack: Succeeded
NOTE: Unpacking ../sources/blueprobe-0.18.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/blueprobe-0.18-r6/
NOTE: package blueprobe-0.18-r6: task do_unpack: Succeeded
NOTE: package ppp-dialin-0.1-r7: task do_setscene: Succeeded
NOTE: Running task 1655 of 5581 (ID: 971, /home/oe/openembedded/recipes/angstrom/angstrom-libc-fixup-hack.bb, do_setscene)
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_setscene: Started
NOTE: Running task 1656 of 5581 (ID: 943, /home/oe/openembedded/recipes/portmap/portmap_6.0.bb, do_setscene)
NOTE: package portmap-6.0-r5: task do_setscene: Started
NOTE: Running task 1657 of 5581 (ID: 1012, /home/oe/openembedded/recipes/ppp-dialin/ppp-dialin_0.1.bb, do_fetch)
NOTE: package ppp-dialin-0.1-r7: task do_fetch: Started
NOTE: package ppp-dialin-0.1-r7: task do_fetch: Succeeded
NOTE: Running task 1658 of 5581 (ID: 929, /home/oe/openembedded/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_setscene)
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_setscene: Started
NOTE: Running task 1659 of 5581 (ID: 1005, /home/oe/openembedded/recipes/ppp-dialin/ppp-dialin_0.1.bb, do_unpack)
NOTE: package ppp-dialin-0.1-r7: task do_unpack: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_setscene: Succeeded
NOTE: Unpacking ../openembedded/recipes/ppp-dialin/files/host-peer to tmp/work/all-angstrom-linux-gnueabi/ppp-dialin-0.1-r7/
NOTE: Unpacking ../openembedded/recipes/ppp-dialin/files/ppp-dialin to tmp/work/all-angstrom-linux-gnueabi/ppp-dialin-0.1-r7/
NOTE: package ppp-dialin-0.1-r7: task do_unpack: Succeeded
NOTE: Running task 1660 of 5581 (ID: 970, /home/oe/openembedded/recipes/angstrom/angstrom-libc-fixup-hack.bb, do_fetch)
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_setscene: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_fetch: Started
NOTE: Running task 1661 of 5581 (ID: 915, /home/oe/openembedded/recipes/wireless-tools/wireless-tools_29.bb, do_setscene)
NOTE: package portmap-6.0-r5: task do_setscene: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_fetch: Succeeded
NOTE: package wireless-tools-29-r5: task do_setscene: Started
NOTE: Running task 1662 of 5581 (ID: 928, /home/oe/openembedded/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_fetch)
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_fetch: Started
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_fetch: Succeeded
NOTE: Running task 1663 of 5581 (ID: 942, /home/oe/openembedded/recipes/portmap/portmap_6.0.bb, do_fetch)
NOTE: package portmap-6.0-r5: task do_fetch: Started
NOTE: Running task 1664 of 5581 (ID: 963, /home/oe/openembedded/recipes/angstrom/angstrom-libc-fixup-hack.bb, do_unpack)
NOTE: package portmap-6.0-r5: task do_fetch: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-libc-fixup-hack.bb to tmp/work/all-angstrom-linux-gnueabi/angstrom-libc-fixup-hack-1.0-r0/
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1665 of 5581 (ID: 921, /home/oe/openembedded/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_unpack)
NOTE: package wireless-tools-29-r5: task do_setscene: Succeeded
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_unpack: Started
NOTE: Unpacking ../sources/wpa_supplicant-0.7.3.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/defconfig to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/defaults-sane to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Running task 1666 of 5581 (ID: 914, /home/oe/openembedded/recipes/wireless-tools/wireless-tools_29.bb, do_fetch)
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa-supplicant.sh to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf-sane to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: Unpacking ../openembedded/recipes/wpa-supplicant/wpa-supplicant-0.7.3/99_wpa_supplicant to tmp/work/armv5te-angstrom-linux-gnueabi/wpa-supplicant-0.7.3-r7.1/
NOTE: package wireless-tools-29-r5: task do_fetch: Started
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_unpack: Succeeded
NOTE: Running task 1667 of 5581 (ID: 935, /home/oe/openembedded/recipes/portmap/portmap_6.0.bb, do_unpack)
NOTE: Running task 1668 of 5581 (ID: 2197, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_package)
NOTE: package portmap-6.0-r5: task do_unpack: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package: Succeeded
NOTE: package wireless-tools-29-r5: task do_fetch: Succeeded
NOTE: Running task 1669 of 5581 (ID: 838, /home/oe/openembedded/recipes/opkg/opkg_svn.bb, do_patch)
NOTE: package opkg-0.1.8+svnr609-r5: task do_patch: Started
NOTE: package opkg-0.1.8+svnr609-r5: task do_patch: Succeeded
NOTE: Unpacking ../sources/portmap-6.0.tgz to tmp/work/armv5te-angstrom-linux-gnueabi/portmap-6.0-r5/
NOTE: Unpacking ../openembedded/recipes/portmap/files/portmap.init to tmp/work/armv5te-angstrom-linux-gnueabi/portmap-6.0-r5/
NOTE: package portmap-6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1670 of 5581 (ID: 907, /home/oe/openembedded/recipes/wireless-tools/wireless-tools_29.bb, do_unpack)
NOTE: package wireless-tools-29-r5: task do_unpack: Started
NOTE: Running task 1671 of 5581 (ID: 1, /home/oe/build/recipes/pcontrolg20-image.bb, do_patch)
NOTE: Unpacking ../sources/wireless_tools.29.tar.gz to tmp/work/armv5te-angstrom-linux-gnueabi/wireless-tools-29-r5/
NOTE: package pcontrolg20-image-1.0-r0: task do_patch: Started
NOTE: Running task 1672 of 5581 (ID: 1118, /home/oe/openembedded/recipes/module-init-tools/module-init-tools_3.12.bb, do_patch)
NOTE: Unpacking ../openembedded/recipes/wireless-tools/wireless-tools/wireless-tools.if-pre-up to tmp/work/armv5te-angstrom-linux-gnueabi/wireless-tools-29-r5/
NOTE: Unpacking ../openembedded/recipes/wireless-tools/wireless-tools/zzz-wireless.if-pre-up to tmp/work/armv5te-angstrom-linux-gnueabi/wireless-tools-29-r5/
NOTE: package wireless-tools-29-r5: task do_unpack: Succeeded
NOTE: package pcontrolg20-image-1.0-r0: task do_patch: Succeeded
NOTE: package module-init-tools-3.12-r6: task do_patch: Started
NOTE: package module-init-tools-3.12-r6: task do_patch: Succeeded
NOTE: Running task 1673 of 5581 (ID: 866, /home/oe/openembedded/recipes/angstrom/angstrom-feed-configs.bb, do_patch)
NOTE: package angstrom-feed-configs-1.0-r14: task do_patch: Started
NOTE: package angstrom-feed-configs-1.0-r14: task do_patch: Succeeded
NOTE: Running task 1674 of 5581 (ID: 852, /home/oe/openembedded/recipes/angstrom/angstrom-version.bb, do_patch)
NOTE: package angstrom-version-2_v2011.05-r9: task do_patch: Started
NOTE: Running task 1675 of 5581 (ID: 810, /home/oe/openembedded/recipes/sysvinit/sysvinit_2.86.bb, do_patch)
NOTE: Running task 1676 of 5581 (ID: 754, /home/oe/openembedded/recipes/setserial/setserial_2.17.bb, do_patch)
NOTE: package sysvinit-2.86-r64: task do_patch: Started
NOTE: package setserial-2.17-r3: task do_patch: Started
NOTE: Applying patch 'addflags.patch' (../openembedded/recipes/setserial/files/addflags.patch)
NOTE: Running task 1677 of 5581 (ID: 641, /home/oe/openembedded/recipes/lrzsz/lrzsz_0.12.20.bb, do_patch)
NOTE: package lrzsz-0.12.20-r4: task do_patch: Started
NOTE: package angstrom-version-2_v2011.05-r9: task do_patch: Succeeded
NOTE: Applying patch 'install.patch' (../openembedded/recipes/sysvinit/sysvinit-2.86/install.patch)
NOTE: Applying patch 'autotools.patch' (../openembedded/recipes/lrzsz/lrzsz-0.12.20/autotools.patch)
NOTE: package sysvinit-2.86-r64: task do_patch: Succeeded
NOTE: package setserial-2.17-r3: task do_patch: Succeeded
NOTE: Running task 1678 of 5581 (ID: 83, virtual:native:/home/oe/openembedded/recipes/mtd/mtd-utils_1.4.4.bb, do_setscene)
NOTE: Running task 1679 of 5581 (ID: 55, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_setscene)
NOTE: Applying patch 'makefile.patch' (../openembedded/recipes/lrzsz/lrzsz-0.12.20/makefile.patch)
NOTE: Applying patch 'gettext.patch' (../openembedded/recipes/lrzsz/lrzsz-0.12.20/gettext.patch)
NOTE: package mtd-utils-native-1.4.4-r0: task do_setscene: Started
NOTE: package makedevs-native-1.0.0-r10: task do_setscene: Started
NOTE: package makedevs-native-1.0.0-r10: task do_setscene: Succeeded
NOTE: package lrzsz-0.12.20-r4: task do_patch: Succeeded
NOTE: Running task 1680 of 5581 (ID: 41, /home/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do_setscene)
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_setscene: Started
NOTE: Running task 1681 of 5581 (ID: 1959, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_package)
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_setscene: Succeeded
NOTE: package mtd-utils-native-1.4.4-r0: task do_setscene: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_package: Started
NOTE: package gconf-native-2.6.1-r1: task do_package: Succeeded
NOTE: Running task 1682 of 5581 (ID: 54, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_fetch)
NOTE: package makedevs-native-1.0.0-r10: task do_fetch: Started
NOTE: package makedevs-native-1.0.0-r10: task do_fetch: Succeeded
NOTE: Running task 1683 of 5581 (ID: 880, /home/oe/openembedded/recipes/opkg/opkg-collateral.bb, do_patch)
NOTE: package opkg-collateral-1.0-r3: task do_patch: Started
NOTE: Running task 1684 of 5581 (ID: 40, /home/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do_fetch)
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_fetch: Started
NOTE: Running task 1685 of 5581 (ID: 824, /home/oe/openembedded/recipes/tinylogin/tinylogin_1.4.bb, do_patch)
NOTE: Running task 1686 of 5581 (ID: 47, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_unpack)
NOTE: package opkg-collateral-1.0-r3: task do_patch: Succeeded
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_fetch: Succeeded
NOTE: package tinylogin-1.4-r7: task do_patch: Started
NOTE: Applying patch 'cvs-20040608.patch' (../openembedded/recipes/tinylogin/tinylogin-1.4/cvs-20040608.patch)
NOTE: package makedevs-native-1.0.0-r10: task do_unpack: Started
NOTE: Unpacking ../openembedded/recipes/makedevs/makedevs-1.0.0/makedevs.c to tmp/work/x86_64-linux/makedevs-native-1.0.0-r10/
NOTE: package makedevs-native-1.0.0-r10: task do_unpack: Succeeded
NOTE: Running task 1687 of 5581 (ID: 782, /home/oe/openembedded/recipes/initscripts/initscripts_1.0.bb, do_patch)
NOTE: Applying patch 'add-system.patch' (../openembedded/recipes/tinylogin/tinylogin-1.4/add-system.patch)
NOTE: package initscripts-1.0-r128: task do_patch: Started
NOTE: Running task 1688 of 5581 (ID: 33, /home/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do_unpack)
NOTE: Running task 1689 of 5581 (ID: 768, /home/oe/openembedded/recipes/vsftpd/vsftpd_2.0.5.bb, do_patch)
NOTE: package initscripts-1.0-r128: task do_patch: Succeeded
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_unpack: Started
NOTE: Unpacking ../sources/trunk_opkg.googlecode.com_.svn_609_.tar.gz to tmp/work/x86_64-linux/opkg-native-0.1.8+svnr609-r5/
NOTE: Unpacking ../openembedded/recipes/opkg/files/configure to tmp/work/x86_64-linux/opkg-native-0.1.8+svnr609-r5/
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_unpack: Succeeded
NOTE: Applying patch 'adduser-empty_pwd.patch' (../openembedded/recipes/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch)
NOTE: Applying patch 'remove-index.patch' (../openembedded/recipes/tinylogin/tinylogin-1.4/remove-index.patch)
NOTE: package vsftpd-2.0.5-r4: task do_patch: Started
NOTE: Applying patch 'makefile.patch' (../openembedded/recipes/vsftpd/vsftpd-2.0.5/makefile.patch)
NOTE: Running task 1690 of 5581 (ID: 740, /home/oe/openembedded/recipes/pstree/pstree_2.33.bb, do_patch)
NOTE: Applying patch 'nopam.patch' (../openembedded/recipes/vsftpd/vsftpd-2.0.5/nopam.patch)
NOTE: package pstree-2.33-r0: task do_patch: Started
NOTE: package pstree-2.33-r0: task do_patch: Succeeded
NOTE: Running task 1691 of 5581 (ID: 726, /home/oe/openembedded/recipes/picocom/picocom_1.4.bb, do_patch)
NOTE: package picocom-1.4-r2: task do_patch: Started
NOTE: package tinylogin-1.4-r7: task do_patch: Succeeded
NOTE: Applying patch 'syscall.patch' (../openembedded/recipes/vsftpd/vsftpd-2.0.5/syscall.patch)
NOTE: package vsftpd-2.0.5-r4: task do_patch: Succeeded
NOTE: Applying patch 'nolock.patch' (../openembedded/recipes/picocom/picocom/nolock.patch)
NOTE: Running task 1692 of 5581 (ID: 712, /home/oe/openembedded/recipes/nano/nano_2.2.5.bb, do_patch)
NOTE: Applying patch 'gcc4.patch' (../openembedded/recipes/picocom/picocom/gcc4.patch)
NOTE: package nano-2.2.5-r2.0: task do_patch: Started
NOTE: Running task 1693 of 5581 (ID: 684, /home/oe/openembedded/recipes/mii-diag/mii-diag_2.11.bb, do_patch)
NOTE: package mii-diag-2.11-r4: task do_patch: Started
NOTE: Applying patch 'ncursesw.includedir.patch' (../openembedded/recipes/nano/nano-2.2.5/ncursesw.includedir.patch)
NOTE: package nano-2.2.5-r2.0: task do_patch: Succeeded
NOTE: Running task 1694 of 5581 (ID: 670, /home/oe/openembedded/recipes/memedit/memedit_0.7.bb, do_patch)
NOTE: package memedit-0.7-r0: task do_patch: Started
NOTE: package mii-diag-2.11-r4: task do_patch: Succeeded
NOTE: package picocom-1.4-r2: task do_patch: Succeeded
NOTE: package memedit-0.7-r0: task do_patch: Succeeded
NOTE: Running task 1695 of 5581 (ID: 654, /home/oe/openembedded/recipes/lsof/lsof_4.83.bb, do_unpackpost)
NOTE: package lsof-4.83-r2: task do_unpackpost: Started
NOTE: Running task 1696 of 5581 (ID: 627, /home/oe/openembedded/recipes/lighttpd/lighttpd_1.4.26.bb, do_patch)
NOTE: package lighttpd-1.4.26-r9.0: task do_patch: Started
NOTE: Running task 1697 of 5581 (ID: 1608, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_package)
NOTE: package lsof-4.83-r2: task do_unpackpost: Succeeded
NOTE: package lighttpd-1.4.26-r9.0: task do_patch: Succeeded
NOTE: package zip-native-2.32-r2: task do_package: Started
NOTE: package zip-native-2.32-r2: task do_package: Succeeded
NOTE: Running task 1698 of 5581 (ID: 5174, /home/oe/openembedded/recipes/pointercal/pointercal_0.0.bb, do_patch)
NOTE: package pointercal-0.0-r22: task do_patch: Started
NOTE: package pointercal-0.0-r22: task do_patch: Succeeded
NOTE: Running task 1699 of 5581 (ID: 656, /home/oe/openembedded/recipes/lsof/lsof_4.83.bb, do_patch)
NOTE: package lsof-4.83-r2: task do_patch: Started
NOTE: Running task 1700 of 5581 (ID: 4408, /home/oe/openembedded/recipes/font-update-common/font-update-common_0.1.bb, do_patch)
NOTE: package font-update-common-0.1-r1: task do_patch: Started
NOTE: Running task 1701 of 5581 (ID: 4394, /home/oe/openembedded/recipes/zeroconf/zeroconf_0.9.bb, do_patch)
NOTE: package lsof-4.83-r2: task do_patch: Succeeded
NOTE: package font-update-common-0.1-r1: task do_patch: Succeeded
NOTE: package zeroconf-0.9-r2: task do_patch: Started
NOTE: Applying patch 'zeroconf-ldflags.patch' (../openembedded/recipes/zeroconf/zeroconf-0.9/zeroconf-ldflags.patch)
NOTE: Running task 1702 of 5581 (ID: 2893, /home/oe/openembedded/recipes/pam/libpam-base-files.bb, do_patch)
NOTE: package libpam-base-files-1.0-r7: task do_patch: Started
NOTE: package libpam-base-files-1.0-r7: task do_patch: Succeeded
NOTE: Applying patch 'zeroconf-limits.h.patch' (../openembedded/recipes/zeroconf/zeroconf-0.9/zeroconf-limits.h.patch)
NOTE: Running task 1703 of 5581 (ID: 2879, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_patch)
NOTE: package ttf-dejavu-2.23-r3: task do_patch: Started
NOTE: Running task 1704 of 5581 (ID: 2837, /home/oe/openembedded/recipes/libnss-mdns/libnss-mdns_0.10.bb, do_patch)
NOTE: package zeroconf-0.9-r2: task do_patch: Succeeded
NOTE: package ttf-dejavu-2.23-r3: task do_patch: Succeeded
NOTE: package libnss-mdns-0.10-r0: task do_patch: Started
NOTE: package libnss-mdns-0.10-r0: task do_patch: Succeeded
NOTE: Running task 1705 of 5581 (ID: 2823, /home/oe/openembedded/recipes/python/python-pygtk_2.16.0.bb, do_patch)
NOTE: package python-pygtk-2.16.0-r3: task do_patch: Started
NOTE: Applying patch 'fix-gtkunixprint.patch' (../openembedded/recipes/python/python-pygtk/fix-gtkunixprint.patch)
NOTE: Running task 1706 of 5581 (ID: 2809, /home/oe/openembedded/recipes/python/python-dbus_0.83.2.bb, do_patch)
NOTE: package python-dbus-0.83.2-ml0: task do_patch: Started
NOTE: Running task 1707 of 5581 (ID: 2887, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_configure)
NOTE: package python-dbus-0.83.2-ml0: task do_patch: Succeeded
NOTE: package ttf-dejavu-2.23-r3: task do_configure: Started
NOTE: package ttf-dejavu-2.23-r3: task do_configure: Succeeded
NOTE: Running task 1708 of 5581 (ID: 2795, /home/oe/openembedded/recipes/netbase/netbase_4.21.bb, do_patch)
NOTE: package netbase-4.21-r51: task do_patch: Started
NOTE: package python-pygtk-2.16.0-r3: task do_patch: Succeeded
NOTE: package netbase-4.21-r51: task do_patch: Succeeded
NOTE: Running task 1709 of 5581 (ID: 2781, /home/oe/openembedded/recipes/modutils/modutils-initscripts.bb, do_patch)
NOTE: package modutils-initscripts-1.0-r4: task do_patch: Started
NOTE: Running task 1710 of 5581 (ID: 2767, /home/oe/openembedded/recipes/busybox/busybox_1.18.4.bb, do_patch)
NOTE: Running task 1711 of 5581 (ID: 2753, /home/oe/openembedded/recipes/base-passwd/base-passwd_3.5.20.bb, do_patch)
NOTE: package modutils-initscripts-1.0-r4: task do_patch: Succeeded
NOTE: package busybox-1.18.4-r43.2: task do_patch: Started
NOTE: Applying patch 'fdisk_nios2.patch' (../openembedded/recipes/busybox/busybox-1.18.4/fdisk_nios2.patch)
NOTE: package base-passwd-3.5.20-r1: task do_patch: Started
NOTE: Applying patch 'nobash.patch' (../openembedded/recipes/base-passwd/files/nobash.patch)
NOTE: Running task 1712 of 5581 (ID: 2739, /home/oe/openembedded/recipes/base-files/base-files_3.0.14.bb, do_patch)
NOTE: package base-files-3.0.14-r103: task do_patch: Started
NOTE: package base-files-3.0.14-r103: task do_patch: Succeeded
NOTE: Running task 1713 of 5581 (ID: 2725, /home/oe/openembedded/recipes/stat/stat_3.3.bb, do_patch)
NOTE: Applying patch 'udhcpscript.patch' (../openembedded/recipes/busybox/busybox-1.18.4/udhcpscript.patch)
NOTE: Applying patch 'root-home.patch' (../openembedded/recipes/base-passwd/files/root-home.patch)
NOTE: Applying patch 'mysql.patch' (../openembedded/recipes/base-passwd/files/mysql.patch)
NOTE: package stat-3.3-r1: task do_patch: Started
NOTE: package stat-3.3-r1: task do_patch: Succeeded
NOTE: Running task 1714 of 5581 (ID: 2711, /home/oe/openembedded/recipes/gawk/gawk_3.1.4.bb, do_patch)
NOTE: Applying patch 'udhcpc-fix-nfsroot.patch' (../openembedded/recipes/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch)
NOTE: package gawk-3.1.4-r4: task do_patch: Started
NOTE: package gawk-3.1.4-r4: task do_patch: Succeeded
NOTE: Running task 1715 of 5581 (ID: 2697, /home/oe/openembedded/recipes/bash/bash_3.2.bb, do_patch)
NOTE: Running task 1716 of 5581 (ID: 1160, /home/oe/openembedded/recipes/openssh/openssh_5.6p1.bb, do_patch)
NOTE: package openssh-5.6p1-r9.0: task do_patch: Started
NOTE: Applying patch 'udhcpc-new-nfsroot.patch' (../openembedded/recipes/busybox/busybox-1.18.4/udhcpc-new-nfsroot.patch)
NOTE: Applying patch 'B921600.patch' (../openembedded/recipes/busybox/busybox-1.18.4/B921600.patch)
NOTE: package base-passwd-3.5.20-r1: task do_patch: Succeeded
NOTE: package bash-3.2-r12: task do_patch: Started
NOTE: Applying patch 'builtins.patch' (../openembedded/recipes/bash/files/builtins.patch)
NOTE: Applying patch 'openssh-5.2-sftp-server-nolibcrypto.patch' (../openembedded/recipes/openssh/openssh-5.6p1/openssh-5.2-sftp-server-nolibcrypto.patch)
NOTE: package openssh-5.6p1-r9.0: task do_patch: Succeeded
NOTE: Applying patch 'get_header_tar.patch' (../openembedded/recipes/busybox/busybox-1.18.4/get_header_tar.patch)
NOTE: Applying patch 'busybox-appletlib-dependency.patch' (../openembedded/recipes/busybox/files/busybox-appletlib-dependency.patch)
NOTE: Applying patch 'bash32-001' (../sources/bash32-001)
NOTE: Applying patch 'bash32-002' (../sources/bash32-002)
NOTE: Applying patch 'bash32-003' (../sources/bash32-003)
NOTE: Running task 1717 of 5581 (ID: 1146, /home/oe/openembedded/recipes/avahi/avahi_0.6.30.bb, do_patch)
NOTE: package avahi-0.6.30-r13.1: task do_patch: Started
NOTE: package avahi-0.6.30-r13.1: task do_patch: Succeeded
NOTE: Applying patch 'fix-iptunnel-location.patch' (../openembedded/recipes/busybox/busybox-1.18.4/fix-iptunnel-location.patch)
NOTE: Running task 1718 of 5581 (ID: 1132, /home/oe/openembedded/recipes/usb-gadget-mode/usb-gadget-mode.bb, do_patch)
NOTE: Applying patch 'busybox-1.18.4-hush.patch' (../sources/busybox-1.18.4-hush.patch)
NOTE: Applying patch 'bash32-004' (../sources/bash32-004)
NOTE: Applying patch 'bash32-005' (../sources/bash32-005)
NOTE: package usb-gadget-mode-0.0.2-r8: task do_patch: Started
NOTE: package usb-gadget-mode-0.0.2-r8: task do_patch: Succeeded
NOTE: Running task 1719 of 5581 (ID: 1104, /home/oe/openembedded/recipes/sysfsutils/sysfsutils_2.1.0.bb, do_patch)
NOTE: package sysfsutils-2.1.0-r3: task do_patch: Started
NOTE: package busybox-1.18.4-r43.2: task do_patch: Succeeded
NOTE: Applying patch 'get_mnt_path_check.patch' (../openembedded/recipes/sysfsutils/sysfsutils-2.1.0/get_mnt_path_check.patch)
NOTE: Running task 1720 of 5581 (ID: 1090, /home/oe/openembedded/recipes/dropbear/dropbear_0.52.bb, do_patch)
NOTE: package dropbear-0.52-r7.0: task do_patch: Started
NOTE: Applying patch 'bash32-006' (../sources/bash32-006)
NOTE: Applying patch 'bash32-007' (../sources/bash32-007)
NOTE: Applying patch 'bash32-008' (../sources/bash32-008)
NOTE: package sysfsutils-2.1.0-r3: task do_patch: Succeeded
NOTE: Applying patch 'urandom-xauth-changes-to-options.h.patch' (../openembedded/recipes/dropbear/dropbear-0.52/urandom-xauth-changes-to-options.h.patch)
NOTE: Applying patch 'configure.patch' (../openembedded/recipes/dropbear/dropbear-0.52/configure.patch)
NOTE: Running task 1721 of 5581 (ID: 1062, /home/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.14.bb, do_patch)
NOTE: Running task 1722 of 5581 (ID: 1048, /home/oe/openembedded/recipes/hdparm/hdparm_9.35.bb, do_patch)
NOTE: package hdparm-9.35-r0: task do_patch: Started
NOTE: Applying patch 'fix-2kb-keys.patch' (../openembedded/recipes/dropbear/dropbear-0.52/fix-2kb-keys.patch)
NOTE: Applying patch 'no-host-lookup.patch' (../openembedded/recipes/dropbear/dropbear-0.52/no-host-lookup.patch)
NOTE: Applying patch 'bash32-009' (../sources/bash32-009)
NOTE: Applying patch 'bash32-010' (../sources/bash32-010)
NOTE: package e2fsprogs-1.41.14-r30: task do_patch: Started
NOTE: Applying patch 'llseek-uclibc.patch' (../openembedded/recipes/e2fsprogs/files/llseek-uclibc.patch)
NOTE: package hdparm-9.35-r0: task do_patch: Succeeded
NOTE: package dropbear-0.52-r7.0: task do_patch: Succeeded
NOTE: Applying patch 'bash32-011' (../sources/bash32-011)
NOTE: Applying patch 'bash32-012' (../sources/bash32-012)
NOTE: package e2fsprogs-1.41.14-r30: task do_patch: Succeeded
NOTE: Running task 1723 of 5581 (ID: 1020, /home/oe/openembedded/recipes/blueprobe/blueprobe_0.18.bb, do_patch)
NOTE: package blueprobe-0.18-r6: task do_patch: Started
NOTE: Applying patch 'fix-makefile.patch' (../openembedded/recipes/blueprobe/blueprobe-0.18/fix-makefile.patch)
NOTE: Applying patch 'h4000.patch' (../openembedded/recipes/blueprobe/blueprobe-0.18/h4000.patch)
NOTE: Running task 1724 of 5581 (ID: 1006, /home/oe/openembedded/recipes/ppp-dialin/ppp-dialin_0.1.bb, do_patch)
NOTE: package ppp-dialin-0.1-r7: task do_patch: Started
NOTE: package ppp-dialin-0.1-r7: task do_patch: Succeeded
NOTE: Applying patch 'bash32-013' (../sources/bash32-013)
NOTE: Applying patch 'bash32-014' (../sources/bash32-014)
NOTE: Applying patch 'uclibc-fix.patch' (../openembedded/recipes/blueprobe/blueprobe-0.18/uclibc-fix.patch)
NOTE: Applying patch 'rx3000.patch' (../openembedded/recipes/blueprobe/files/rx3000.patch)
NOTE: Running task 1725 of 5581 (ID: 964, /home/oe/openembedded/recipes/angstrom/angstrom-libc-fixup-hack.bb, do_patch)
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_patch: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_patch: Succeeded
NOTE: Applying patch 'bash32-015' (../sources/bash32-015)
NOTE: Running task 1726 of 5581 (ID: 936, /home/oe/openembedded/recipes/portmap/portmap_6.0.bb, do_patch)
NOTE: Running task 1727 of 5581 (ID: 922, /home/oe/openembedded/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_patch)
NOTE: package portmap-6.0-r5: task do_patch: Started
NOTE: Applying patch 'destdir-no-strip.patch' (../openembedded/recipes/portmap/portmap-6.0/destdir-no-strip.patch)
NOTE: Applying patch 'bash32-016' (../sources/bash32-016)
NOTE: Applying patch 'bash32-017' (../sources/bash32-017)
NOTE: package blueprobe-0.18-r6: task do_patch: Succeeded
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_patch: Started
NOTE: package wpa-supplicant-0.7.3-r7.1: task do_patch: Succeeded
NOTE: Applying patch 'no-tcpd-support.patch' (../openembedded/recipes/portmap/portmap-6.0/no-tcpd-support.patch)
NOTE: Running task 1728 of 5581 (ID: 908, /home/oe/openembedded/recipes/wireless-tools/wireless-tools_29.bb, do_patch)
NOTE: Running task 1729 of 5581 (ID: 48, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_patch)
NOTE: Applying patch 'no-libwrap.patch' (../openembedded/recipes/portmap/portmap-6.0/no-libwrap.patch)
NOTE: Applying patch 'bash32-018' (../sources/bash32-018)
NOTE: Applying patch 'bash32-019' (../sources/bash32-019)
NOTE: package wireless-tools-29-r5: task do_patch: Started
NOTE: Applying patch 'man.patch' (../openembedded/recipes/wireless-tools/wireless-tools/man.patch)
NOTE: package makedevs-native-1.0.0-r10: task do_patch: Started
NOTE: package makedevs-native-1.0.0-r10: task do_patch: Succeeded
NOTE: package portmap-6.0-r5: task do_patch: Succeeded
NOTE: Applying patch 'bash32-020' (../sources/bash32-020)
NOTE: Applying patch 'bash32-021' (../sources/bash32-021)
NOTE: Applying patch 'bash32-022' (../sources/bash32-022)
NOTE: Running task 1730 of 5581 (ID: 56, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_configure)
NOTE: Applying patch 'shared_lib_ldflags.patch' (../openembedded/recipes/wireless-tools/wireless-tools/shared_lib_ldflags.patch)
NOTE: package wireless-tools-29-r5: task do_patch: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_configure: Started
NOTE: Running task 1731 of 5581 (ID: 34, /home/oe/openembedded/recipes/opkg/opkg-native_svn.bb, do_patch)
NOTE: Applying patch 'bash32-023' (../sources/bash32-023)
NOTE: Applying patch 'bash32-024' (../sources/bash32-024)
NOTE: Applying patch 'bash32-025' (../sources/bash32-025)
NOTE: package makedevs-native-1.0.0-r10: task do_configure: Succeeded
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_patch: Started
NOTE: package opkg-native-0.1.8+svnr609-r5: task do_patch: Succeeded
NOTE: Running task 1732 of 5581 (ID: 3355, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_package)
NOTE: package tzcode-native-2011e-r4.0: task do_package: Started
NOTE: package tzcode-native-2011e-r4.0: task do_package: Succeeded
NOTE: Running task 1733 of 5581 (ID: 2888, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_qa_configure)
NOTE: Applying patch 'bash32-026' (../sources/bash32-026)
NOTE: Running task 1734 of 5581 (ID: 57, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_qa_configure)
NOTE: package ttf-dejavu-2.23-r3: task do_qa_configure: Started
NOTE: Applying patch 'bash32-027' (../sources/bash32-027)
NOTE: Applying patch 'bash32-028' (../sources/bash32-028)
NOTE: package makedevs-native-1.0.0-r10: task do_qa_configure: Started
NOTE: package makedevs-native-1.0.0-r10: task do_qa_configure: Succeeded
NOTE: Running task 1735 of 5581 (ID: 2862, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_package)
NOTE: package m4-native-1.4.14-r0.1: task do_package: Started
NOTE: package ttf-dejavu-2.23-r3: task do_qa_configure: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_package: Succeeded
NOTE: Running task 1736 of 5581 (ID: 2889, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_compile)
NOTE: package ttf-dejavu-2.23-r3: task do_compile: Started
NOTE: Running task 1737 of 5581 (ID: 58, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_compile)
NOTE: Applying patch 'bash32-029' (../sources/bash32-029)
NOTE: package makedevs-native-1.0.0-r10: task do_compile: Started
NOTE: Applying patch 'bash32-030' (../sources/bash32-030)
NOTE: Running task 1738 of 5581 (ID: 5157, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_package)
NOTE: package llvm-common-native-1.0-r3: task do_package: Started
NOTE: package llvm-common-native-1.0-r3: task do_package: Succeeded
NOTE: Running task 1739 of 5581 (ID: 2001, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_package)
NOTE: package ttf-dejavu-2.23-r3: task do_compile: Succeeded
NOTE: Applying patch 'bash32-031' (../sources/bash32-031)
NOTE: Applying patch 'bash32-032' (../sources/bash32-032)
NOTE: Applying patch 'bash32-033' (../sources/bash32-033)
NOTE: package unzip-native-552-r3: task do_package: Started
NOTE: package unzip-native-552-r3: task do_package: Succeeded
NOTE: Running task 1740 of 5581 (ID: 2880, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_install)
NOTE: Running task 1741 of 5581 (ID: 1411, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_package)
NOTE: Applying patch 'bash32-034' (../sources/bash32-034)
NOTE: Applying patch 'bash32-035' (../sources/bash32-035)
NOTE: package ttf-dejavu-2.23-r3: task do_install: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_package: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_package: Succeeded
NOTE: Applying patch 'bash32-036' (../sources/bash32-036)
NOTE: Applying patch 'bash32-037' (../sources/bash32-037)
NOTE: Applying patch 'bash32-038' (../sources/bash32-038)
NOTE: Running task 1742 of 5581 (ID: 1271, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_package)
NOTE: package ttf-dejavu-2.23-r3: task do_install: Succeeded
NOTE: Applying patch 'bash32-039' (../sources/bash32-039)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package: Started
NOTE: Running task 1743 of 5581 (ID: 2881, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_populate_sysroot)
NOTE: package ttf-dejavu-2.23-r3: task do_populate_sysroot: Started
NOTE: package ttf-dejavu-2.23-r3: task do_populate_sysroot: Succeeded
NOTE: Applying patch 'default_path.patch' (../openembedded/recipes/bash/files/default_path.patch)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package: Succeeded
NOTE: Running task 1744 of 5581 (ID: 1257, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_package)
NOTE: package quilt-native-0.48-r7.1: task do_package: Started
NOTE: package quilt-native-0.48-r7.1: task do_package: Succeeded
NOTE: Running task 1745 of 5581 (ID: 31, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_package)
NOTE: package bash-3.2-r12: task do_patch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package: Succeeded
NOTE: Running task 1746 of 5581 (ID: 5158, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_package_write_ipk)
NOTE: Running task 1747 of 5581 (ID: 3356, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_package_write_ipk)
NOTE: package llvm-common-native-1.0-r3: task do_package_write_ipk: Started
NOTE: Running task 1748 of 5581 (ID: 3244, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_package_write_ipk)
NOTE: package llvm-common-native-1.0-r3: task do_package_write_ipk: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_package_write_ipk: Started
NOTE: package tzcode-native-2011e-r4.0: task do_package_write_ipk: Succeeded
NOTE: package xorg-headers-native-1.0-r2: task do_package_write_ipk: Started
NOTE: package xorg-headers-native-1.0-r2: task do_package_write_ipk: Succeeded
NOTE: Running task 1749 of 5581 (ID: 3216, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_package_write_ipk)
NOTE: package gtk-doc-native-1.0-r3: task do_package_write_ipk: Started
NOTE: Running task 1750 of 5581 (ID: 2877, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_package_write_ipk)
NOTE: package gtk-doc-native-1.0-r3: task do_package_write_ipk: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_package_write_ipk: Started
NOTE: package perl-native-5.10.1-r11: task do_package_write_ipk: Succeeded
NOTE: Running task 1751 of 5581 (ID: 2863, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_package_write_ipk)
NOTE: package makedevs-native-1.0.0-r10: task do_compile: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_package_write_ipk: Started
NOTE: package m4-native-1.4.14-r0.1: task do_package_write_ipk: Succeeded
NOTE: Running task 1752 of 5581 (ID: 2296, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_package_write_ipk)
NOTE: Running task 1753 of 5581 (ID: 2198, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_package_write_ipk)
NOTE: package unifdef-native-2.6-0: task do_package_write_ipk: Started
NOTE: Running task 1754 of 5581 (ID: 49, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_install)
NOTE: package unifdef-native-2.6-0: task do_package_write_ipk: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_write_ipk: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_write_ipk: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_install: Started
NOTE: package makedevs-native-1.0.0-r10: task do_install: Succeeded
NOTE: Running task 1755 of 5581 (ID: 2002, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_package_write_ipk)
NOTE: package unzip-native-552-r3: task do_package_write_ipk: Started
NOTE: package unzip-native-552-r3: task do_package_write_ipk: Succeeded
NOTE: Running task 1756 of 5581 (ID: 1960, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_package_write_ipk)
NOTE: package gconf-native-2.6.1-r1: task do_package_write_ipk: Started
NOTE: Running task 1757 of 5581 (ID: 1609, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_package_write_ipk)
NOTE: Running task 1758 of 5581 (ID: 59, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_package)
NOTE: package gconf-native-2.6.1-r1: task do_package_write_ipk: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_package: Started
NOTE: package makedevs-native-1.0.0-r10: task do_package: Succeeded
NOTE: package zip-native-2.32-r2: task do_package_write_ipk: Started
NOTE: package zip-native-2.32-r2: task do_package_write_ipk: Succeeded
NOTE: Running task 1759 of 5581 (ID: 50, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_populate_sysroot)
NOTE: package makedevs-native-1.0.0-r10: task do_populate_sysroot: Started
NOTE: Running task 1760 of 5581 (ID: 1581, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_package_write_ipk)
NOTE: Running task 1761 of 5581 (ID: 1412, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_package_write_ipk)
NOTE: package update-rc.d-native-0.7-r2: task do_package_write_ipk: Started
NOTE: package update-rc.d-native-0.7-r2: task do_package_write_ipk: Succeeded
NOTE: Running task 1762 of 5581 (ID: 1342, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_package_write_ipk)
NOTE: package pax-utils-native-0.1.19-r2: task do_package_write_ipk: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_package_write_ipk: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_populate_sysroot: Succeeded
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_write_ipk: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_write_ipk: Succeeded
NOTE: Running task 1763 of 5581 (ID: 1272, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_package_write_ipk)
NOTE: Running task 1764 of 5581 (ID: 1258, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_package_write_ipk)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_write_ipk: Started
NOTE: package quilt-native-0.48-r7.1: task do_package_write_ipk: Started
NOTE: Running task 1765 of 5581 (ID: 60, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_package_write_ipk)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_write_ipk: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_package_write_ipk: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_package_write_ipk: Started
NOTE: package makedevs-native-1.0.0-r10: task do_package_write_ipk: Succeeded
NOTE: Running task 1766 of 5581 (ID: 32, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_package_write_ipk)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_write_ipk: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_write_ipk: Succeeded
NOTE: Running task 1767 of 5581 (ID: 5150, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_package_write)
NOTE: package llvm-common-native-1.0-r3: task do_package_write: Started
NOTE: Running task 1768 of 5581 (ID: 5149, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_qa_staging)
NOTE: package llvm-common-native-1.0-r3: task do_qa_staging: Started
NOTE: Running task 1769 of 5581 (ID: 3348, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_package_write)
NOTE: package llvm-common-native-1.0-r3: task do_package_write: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_qa_staging: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_package_write: Started
NOTE: package tzcode-native-2011e-r4.0: task do_package_write: Succeeded
NOTE: Running task 1770 of 5581 (ID: 3347, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_qa_staging)
NOTE: package tzcode-native-2011e-r4.0: task do_qa_staging: Started
NOTE: package tzcode-native-2011e-r4.0: task do_qa_staging: Succeeded
NOTE: Running task 1771 of 5581 (ID: 3236, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_package_write)
NOTE: Running task 1772 of 5581 (ID: 5151, virtual:native:/home/oe/openembedded/recipes/llvm/llvm-common.bb, do_package_stage)
NOTE: package xorg-headers-native-1.0-r2: task do_package_write: Started
NOTE: package llvm-common-native-1.0-r3: task do_package_stage: Started
NOTE: Running task 1773 of 5581 (ID: 3235, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_qa_staging)
NOTE: package xorg-headers-native-1.0-r2: task do_qa_staging: Started
NOTE: Running task 1774 of 5581 (ID: 3349, /home/oe/openembedded/recipes/tzcode/tzcode-native_2011e.bb, do_package_stage)
NOTE: package tzcode-native-2011e-r4.0: task do_package_stage: Started
NOTE: package xorg-headers-native-1.0-r2: task do_qa_staging: Succeeded
NOTE: package xorg-headers-native-1.0-r2: task do_package_write: Succeeded
NOTE: Running task 1775 of 5581 (ID: 3208, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_package_write)
NOTE: Running task 1776 of 5581 (ID: 3237, /home/oe/openembedded/recipes/xorg-lib/xorg-headers-native.bb, do_package_stage)
NOTE: package gtk-doc-native-1.0-r3: task do_package_write: Started
NOTE: package gtk-doc-native-1.0-r3: task do_package_write: Succeeded
NOTE: package xorg-headers-native-1.0-r2: task do_package_stage: Started
NOTE: Running task 1777 of 5581 (ID: 3207, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_qa_staging)
NOTE: package gtk-doc-native-1.0-r3: task do_qa_staging: Started
NOTE: package gtk-doc-native-1.0-r3: task do_qa_staging: Succeeded
NOTE: Running task 1778 of 5581 (ID: 3209, virtual:native:/home/oe/openembedded/recipes/gtk-doc/gtk-doc.bb, do_package_stage)
NOTE: package gtk-doc-native-1.0-r3: task do_package_stage: Started
NOTE: package gtk-doc-native-1.0-r3: task do_package_stage: Succeeded
NOTE: package xorg-headers-native-1.0-r2: task do_package_stage: Succeeded
NOTE: package llvm-common-native-1.0-r3: task do_package_stage: Succeeded
NOTE: package tzcode-native-2011e-r4.0: task do_package_stage: Succeeded
NOTE: Running task 1779 of 5581 (ID: 2882, /home/oe/openembedded/recipes/ttf-fonts/ttf-dejavu_2.23.bb, do_qa_staging)
NOTE: package ttf-dejavu-2.23-r3: task do_qa_staging: Started
NOTE: Running task 1780 of 5581 (ID: 2869, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_package_write)
NOTE: package ttf-dejavu-2.23-r3: task do_qa_staging: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_package_write: Started
NOTE: Running task 1781 of 5581 (ID: 2855, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_package_write)
NOTE: package m4-native-1.4.14-r0.1: task do_package_write: Started
NOTE: Running task 1782 of 5581 (ID: 2854, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_qa_staging)
NOTE: package perl-native-5.10.1-r11: task do_package_write: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_package_write: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_qa_staging: Started
NOTE: package m4-native-1.4.14-r0.1: task do_qa_staging: Succeeded
NOTE: Running task 1783 of 5581 (ID: 2288, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_package_write)
NOTE: package unifdef-native-2.6-0: task do_package_write: Started
NOTE: package unifdef-native-2.6-0: task do_package_write: Succeeded
NOTE: Running task 1784 of 5581 (ID: 2287, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_qa_staging)
NOTE: Running task 1785 of 5581 (ID: 2190, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_package_write)
NOTE: Running task 1786 of 5581 (ID: 2856, /home/oe/openembedded/recipes/m4/m4-native_1.4.14.bb, do_package_stage)
NOTE: package unifdef-native-2.6-0: task do_qa_staging: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_write: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_write: Succeeded
NOTE: package m4-native-1.4.14-r0.1: task do_package_stage: Started
NOTE: Running task 1787 of 5581 (ID: 2189, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_qa_staging)
NOTE: package unifdef-native-2.6-0: task do_qa_staging: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_qa_staging: Started
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_qa_staging: Succeeded
NOTE: Running task 1788 of 5581 (ID: 2289, virtual:native:/home/oe/openembedded/recipes/unifdef/unifdef_2.6.bb, do_package_stage)
NOTE: Running task 1789 of 5581 (ID: 2161, /home/oe/openembedded/recipes/update-modules/update-modules_1.0.bb, do_qa_staging)
NOTE: package unifdef-native-2.6-0: task do_package_stage: Started
NOTE: package update-modules-1.0-r10: task do_qa_staging: Started
NOTE: package update-modules-1.0-r10: task do_qa_staging: Succeeded
NOTE: Running task 1790 of 5581 (ID: 2191, virtual:native:/home/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb, do_package_stage)
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_stage: Started
NOTE: package m4-native-1.4.14-r0.1: task do_package_stage: Succeeded
NOTE: Running task 1791 of 5581 (ID: 1994, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_package_write)
NOTE: package unzip-native-552-r3: task do_package_write: Started
NOTE: package unzip-native-552-r3: task do_package_write: Succeeded
NOTE: Running task 1792 of 5581 (ID: 1993, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_qa_staging)
NOTE: Running task 1793 of 5581 (ID: 1952, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_package_write)
NOTE: package unifdef-native-2.6-0: task do_package_stage: Succeeded
NOTE: package unzip-native-552-r3: task do_qa_staging: Started
NOTE: package unzip-native-552-r3: task do_qa_staging: Succeeded
NOTE: package u-boot-mkimage-native-1.3.2-r3: task do_package_stage: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_package_write: Started
NOTE: package gconf-native-2.6.1-r1: task do_package_write: Succeeded
NOTE: Running task 1794 of 5581 (ID: 1951, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_qa_staging)
NOTE: package gconf-native-2.6.1-r1: task do_qa_staging: Started
NOTE: Running task 1795 of 5581 (ID: 1601, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_package_write)
NOTE: package gconf-native-2.6.1-r1: task do_qa_staging: Succeeded
NOTE: package zip-native-2.32-r2: task do_package_write: Started
NOTE: Running task 1796 of 5581 (ID: 1995, virtual:native:/home/oe/openembedded/recipes/unzip/unzip_552.bb, do_package_stage)
NOTE: package zip-native-2.32-r2: task do_package_write: Succeeded
NOTE: package unzip-native-552-r3: task do_package_stage: Started
NOTE: Running task 1797 of 5581 (ID: 1600, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_qa_staging)
NOTE: package zip-native-2.32-r2: task do_qa_staging: Started
NOTE: package zip-native-2.32-r2: task do_qa_staging: Succeeded
NOTE: Running task 1798 of 5581 (ID: 1953, /home/oe/openembedded/recipes/gnome/gconf-native_2.6.1.bb, do_package_stage)
NOTE: package gconf-native-2.6.1-r1: task do_package_stage: Started
NOTE: Running task 1799 of 5581 (ID: 1573, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_package_write)
NOTE: package update-rc.d-native-0.7-r2: task do_package_write: Started
NOTE: Running task 1800 of 5581 (ID: 1602, virtual:native:/home/oe/openembedded/recipes/zip/zip_2.32.bb, do_package_stage)
NOTE: package update-rc.d-native-0.7-r2: task do_package_write: Succeeded
NOTE: package zip-native-2.32-r2: task do_package_stage: Started
NOTE: package unzip-native-552-r3: task do_package_stage: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_package_stage: Succeeded
NOTE: Running task 1801 of 5581 (ID: 1572, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_qa_staging)
NOTE: Running task 1802 of 5581 (ID: 1404, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_package_write)
NOTE: package update-rc.d-native-0.7-r2: task do_qa_staging: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_package_write: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_package_write: Succeeded
NOTE: package update-rc.d-native-0.7-r2: task do_qa_staging: Succeeded
NOTE: Running task 1803 of 5581 (ID: 1403, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_qa_staging)
NOTE: package zip-native-2.32-r2: task do_package_stage: Succeeded
NOTE: package pax-utils-native-0.1.19-r2: task do_qa_staging: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_qa_staging: Succeeded
NOTE: Running task 1804 of 5581 (ID: 1334, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_package_write)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_write: Started
NOTE: Running task 1805 of 5581 (ID: 1574, virtual:native:/home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_package_stage)
NOTE: package update-rc.d-native-0.7-r2: task do_package_stage: Started
NOTE: Running task 1806 of 5581 (ID: 1333, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_qa_staging)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_write: Succeeded
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_qa_staging: Started
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_qa_staging: Succeeded
NOTE: Running task 1807 of 5581 (ID: 1405, virtual:native:/home/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb, do_package_stage)
NOTE: package pax-utils-native-0.1.19-r2: task do_package_stage: Started
NOTE: Running task 1808 of 5581 (ID: 1264, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_package_write)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_write: Started
NOTE: Running task 1809 of 5581 (ID: 1335, virtual:native:/home/oe/openembedded/recipes/gnu-config/gnu-config_git.bb, do_package_stage)
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_write: Succeeded
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_stage: Started
NOTE: package update-rc.d-native-0.7-r2: task do_package_stage: Succeeded
NOTE: Running task 1810 of 5581 (ID: 1263, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_qa_staging)
NOTE: package pax-utils-native-0.1.19-r2: task do_package_stage: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_qa_staging: Started
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_qa_staging: Succeeded
NOTE: Running task 1811 of 5581 (ID: 1250, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_package_write)
NOTE: package quilt-native-0.48-r7.1: task do_package_write: Started
NOTE: package quilt-native-0.48-r7.1: task do_package_write: Succeeded
NOTE: Running task 1812 of 5581 (ID: 1249, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_qa_staging)
NOTE: package quilt-native-0.48-r7.1: task do_qa_staging: Started
NOTE: Running task 1813 of 5581 (ID: 1265, virtual:native:/home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_package_stage)
NOTE: package gnu-config-native-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: task do_package_stage: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_qa_staging: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_stage: Started
NOTE: Running task 1814 of 5581 (ID: 1177, /home/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_qa_staging)
NOTE: package update-rc.d-0.7-r2: task do_qa_staging: Started
NOTE: package update-rc.d-0.7-r2: task do_qa_staging: Succeeded
NOTE: Running task 1815 of 5581 (ID: 897, /home/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb, do_qa_staging)
NOTE: package linux-libc-headers-2.6.37-r0: task do_qa_staging: Started
NOTE: Running task 1816 of 5581 (ID: 1251, /home/oe/openembedded/recipes/quilt/quilt-native_0.48.bb, do_package_stage)
NOTE: package linux-libc-headers-2.6.37-r0: task do_qa_staging: Succeeded
NOTE: package quilt-native-0.48-r7.1: task do_package_stage: Started
NOTE: Running task 1817 of 5581 (ID: 52, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_package_write)
NOTE: package makedevs-native-1.0.0-r10: task do_package_write: Started
NOTE: package makedevs-native-1.0.0-r10: task do_package_write: Succeeded
NOTE: Running task 1818 of 5581 (ID: 51, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_qa_staging)
NOTE: package makedevs-native-1.0.0-r10: task do_qa_staging: Started
NOTE: package makedevs-native-1.0.0-r10: task do_qa_staging: Succeeded
NOTE: Running task 1819 of 5581 (ID: 24, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_package_write)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_write: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_write: Succeeded
NOTE: Running task 1820 of 5581 (ID: 53, virtual:native:/home/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb, do_package_stage)
NOTE: package makedevs-native-1.0.0-r10: task do_package_stage: Started
NOTE: Running task 1821 of 5581 (ID: 23, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_qa_staging)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_qa_staging: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_qa_staging: Succeeded
NOTE: Running task 1822 of 5581 (ID: 25, virtual:native:/home/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb, do_package_stage)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_stage: Started
NOTE: package quilt-native-0.48-r7.1: task do_package_stage: Succeeded
NOTE: package makedevs-native-1.0.0-r10: task do_package_stage: Succeeded
NOTE: package linux-libc-headers-native-2.6.37-r0: task do_package_stage: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r6: task do_package_stage: Succeeded
NOTE: Running task 1823 of 5581 (ID: 16, /home/oe/build/recipes/pcontrolg20-image.bb, do_distribute_sources)
NOTE: package pcontrolg20-image-1.0-r0: task do_distribute_sources: Started
NOTE: package pcontrolg20-image-1.0-r0: task do_distribute_sources: Succeeded
NOTE: package perl-native-5.10.1-r11: task do_populate_sysroot: Succeeded
NOTE: Running task 1824 of 5581 (ID: 1296, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_configure)
NOTE: Running task 1825 of 5581 (ID: 2868, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_qa_staging)
NOTE: package autoconf-native-2.65-r14.1: task do_configure: Started
NOTE: package perl-native-5.10.1-r11: task do_qa_staging: Started
NOTE: package perl-native-5.10.1-r11: task do_qa_staging: Succeeded
NOTE: Running task 1826 of 5581 (ID: 2870, /home/oe/openembedded/recipes/perl/perl-native_5.10.1.bb, do_package_stage)
NOTE: package perl-native-5.10.1-r11: task do_package_stage: Started
NOTE: package autoconf-native-2.65-r14.1: task do_configure: Succeeded
NOTE: Running task 1827 of 5581 (ID: 1297, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_qa_configure)
NOTE: package autoconf-native-2.65-r14.1: task do_qa_configure: Started
NOTE: package perl-native-5.10.1-r11: task do_package_stage: Succeeded
NOTE: package autoconf-native-2.65-r14.1: task do_qa_configure: Succeeded
NOTE: Running task 1828 of 5581 (ID: 1298, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_compile)
NOTE: package autoconf-native-2.65-r14.1: task do_compile: Started
NOTE: package autoconf-native-2.65-r14.1: task do_compile: Succeeded
NOTE: Running task 1829 of 5581 (ID: 1289, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_install)
NOTE: package autoconf-native-2.65-r14.1: task do_install: Started
NOTE: package autoconf-native-2.65-r14.1: task do_install: Succeeded
NOTE: Running task 1830 of 5581 (ID: 1290, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_populate_sysroot)
NOTE: Running task 1831 of 5581 (ID: 1299, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_package)
NOTE: package autoconf-native-2.65-r14.1: task do_populate_sysroot: Started
NOTE: package autoconf-native-2.65-r14.1: task do_package: Started
NOTE: package autoconf-native-2.65-r14.1: task do_package: Succeeded
NOTE: Running task 1832 of 5581 (ID: 1300, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_package_write_ipk)
NOTE: package autoconf-native-2.65-r14.1: task do_package_write_ipk: Started
NOTE: package autoconf-native-2.65-r14.1: task do_package_write_ipk: Succeeded
NOTE: Running task 1833 of 5581 (ID: 1292, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_package_write)
NOTE: package autoconf-native-2.65-r14.1: task do_populate_sysroot: Succeeded
NOTE: package autoconf-native-2.65-r14.1: task do_package_write: Started
NOTE: package autoconf-native-2.65-r14.1: task do_package_write: Succeeded
NOTE: Running task 1834 of 5581 (ID: 1310, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_configure)
NOTE: Running task 1835 of 5581 (ID: 1291, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_qa_staging)
NOTE: package automake-native-1.11.1-r5.2: task do_configure: Started
NOTE: package autoconf-native-2.65-r14.1: task do_qa_staging: Started
NOTE: package autoconf-native-2.65-r14.1: task do_qa_staging: Succeeded
NOTE: Running task 1836 of 5581 (ID: 1293, virtual:native:/home/oe/openembedded/recipes/autoconf/autoconf_2.65.bb, do_package_stage)
NOTE: package autoconf-native-2.65-r14.1: task do_package_stage: Started
NOTE: package autoconf-native-2.65-r14.1: task do_package_stage: Succeeded
NOTE: package automake-native-1.11.1-r5.2: task do_configure: Succeeded
NOTE: Running task 1837 of 5581 (ID: 1311, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_qa_configure)
NOTE: package automake-native-1.11.1-r5.2: task do_qa_configure: Started
NOTE: package automake-native-1.11.1-r5.2: task do_qa_configure: Succeeded
NOTE: Running task 1838 of 5581 (ID: 1312, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_compile)
NOTE: package automake-native-1.11.1-r5.2: task do_compile: Started
NOTE: package automake-native-1.11.1-r5.2: task do_compile: Succeeded
NOTE: Running task 1839 of 5581 (ID: 1303, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_install)
NOTE: package automake-native-1.11.1-r5.2: task do_install: Started
NOTE: package automake-native-1.11.1-r5.2: task do_install: Succeeded
NOTE: Running task 1840 of 5581 (ID: 1304, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_populate_sysroot)
NOTE: Running task 1841 of 5581 (ID: 1313, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_package)
NOTE: package automake-native-1.11.1-r5.2: task do_populate_sysroot: Started
NOTE: package automake-native-1.11.1-r5.2: task do_package: Started
NOTE: package automake-native-1.11.1-r5.2: task do_package: Succeeded
NOTE: Running task 1842 of 5581 (ID: 1314, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_package_write_ipk)
NOTE: package automake-native-1.11.1-r5.2: task do_populate_sysroot: Succeeded
NOTE: package automake-native-1.11.1-r5.2: task do_package_write_ipk: Started
NOTE: package automake-native-1.11.1-r5.2: task do_package_write_ipk: Succeeded
NOTE: Running task 1843 of 5581 (ID: 1324, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_configure)
NOTE: Running task 1844 of 5581 (ID: 1305, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_qa_staging)
NOTE: package libtool-native-2.4-r28.1: task do_configure: Started
NOTE: Running task 1845 of 5581 (ID: 1306, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_package_write)
NOTE: package automake-native-1.11.1-r5.2: task do_package_write: Started
NOTE: package automake-native-1.11.1-r5.2: task do_package_write: Succeeded
NOTE: package automake-native-1.11.1-r5.2: task do_qa_staging: Started
NOTE: package automake-native-1.11.1-r5.2: task do_qa_staging: Succeeded
NOTE: Running task 1846 of 5581 (ID: 1307, virtual:native:/home/oe/openembedded/recipes/automake/automake_1.11.1.bb, do_package_stage)
NOTE: package automake-native-1.11.1-r5.2: task do_package_stage: Started
NOTE: package automake-native-1.11.1-r5.2: task do_package_stage: Succeeded
NOTE: package libtool-native-2.4-r28.1: task do_configure: Succeeded
NOTE: Running task 1847 of 5581 (ID: 1325, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_qa_configure)
NOTE: package libtool-native-2.4-r28.1: task do_qa_configure: Started
NOTE: package libtool-native-2.4-r28.1: task do_qa_configure: Succeeded
NOTE: Running task 1848 of 5581 (ID: 1326, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_compile)
NOTE: package libtool-native-2.4-r28.1: task do_compile: Started
NOTE: package libtool-native-2.4-r28.1: task do_compile: Succeeded
NOTE: Running task 1849 of 5581 (ID: 1317, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_install)
NOTE: package libtool-native-2.4-r28.1: task do_install: Started
NOTE: package libtool-native-2.4-r28.1: task do_install: Succeeded
NOTE: Running task 1851 of 5581 (ID: 1327, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_package)
NOTE: Running task 1850 of 5581 (ID: 1318, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_populate_sysroot)
NOTE: package libtool-native-2.4-r28.1: task do_package: Started
NOTE: package libtool-native-2.4-r28.1: task do_package: Succeeded
NOTE: package libtool-native-2.4-r28.1: task do_populate_sysroot: Started
NOTE: Running task 1852 of 5581 (ID: 1328, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_package_write_ipk)
NOTE: package libtool-native-2.4-r28.1: task do_package_write_ipk: Started
NOTE: package libtool-native-2.4-r28.1: task do_package_write_ipk: Succeeded
NOTE: Running task 1853 of 5581 (ID: 1320, /home/oe/openembedded/recipes/libtool/libtool-native_2.4.bb, do_package_write)
NOTE: package libtool-native-2.4-r28.1: task do_package_write: Started
NOTE: package libtool-native-2.4-r28.1: task do_package_write: Succeeded
NOTE: package libtool-native-2.4-r28.1: task do_populate_sysroot: Succeeded
NOTE: Running task 1854 of 5581 (ID: 1690, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_configure)
NOTE: Running task 1855 of 5581 (ID: 1282, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_configure)
NOTE: Running task 1856 of 5581 (ID: 1366, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_configure)
NOTE: Running task 1857 of 5581 (ID: 1479, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_configure)
NOTE: package ncurses-native-5.9-r1: task do_configure: Started
NOTE: Running task 1858 of 5581 (ID: 1507, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_configure)
NOTE: package pkgconfig-native-0.23-r8.1: task do_configure: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_configure: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_configure: Started
NOTE: package libelf-native-0.8.13-r1: task do_configure: Started
NOTE: package libelf-native-0.8.13-r1: task do_configure: Succeeded
NOTE: Running task 1859 of 5581 (ID: 1508, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_qa_configure)
NOTE: package libelf-native-0.8.13-r1: task do_qa_configure: Started
NOTE: package libelf-native-0.8.13-r1: task do_qa_configure: Succeeded
NOTE: Running task 1860 of 5581 (ID: 1509, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_compile)
NOTE: package libelf-native-0.8.13-r1: task do_compile: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_configure: Succeeded
NOTE: Running task 1861 of 5581 (ID: 1367, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_qa_configure)
NOTE: package zlib-native-1.2.3-r7.0: task do_qa_configure: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_qa_configure: Succeeded
NOTE: Running task 1862 of 5581 (ID: 1368, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_compile)
NOTE: package zlib-native-1.2.3-r7.0: task do_compile: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_compile: Succeeded
NOTE: Running task 1863 of 5581 (ID: 1359, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_install)
NOTE: package zlib-native-1.2.3-r7.0: task do_install: Started
NOTE: package libelf-native-0.8.13-r1: task do_compile: Succeeded
NOTE: package zlib-native-1.2.3-r7.0: task do_install: Succeeded
NOTE: Running task 1864 of 5581 (ID: 1360, virtual:native:/home/oe/openembedded/recipes/zlib/zlib_1.2.3.bb, do_populate_sysroot)
NOTE: package zlib-native-1.2.3-r7.0: task do_populate_sysroot: Started
NOTE: Running task 1865 of 5581 (ID: 1500, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_install)
NOTE: package libelf-native-0.8.13-r1: task do_install: Started
NOTE: package zlib-native-1.2.3-r7.0: task do_populate_sysroot: Succeeded
NOTE: package libelf-native-0.8.13-r1: task do_install: Succeeded
NOTE: Running task 1866 of 5581 (ID: 1549, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_configure)
NOTE: Running task 1867 of 5581 (ID: 1501, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_populate_sysroot)
NOTE: package cross-localedef-native-2.12-r1: task do_configure: Started
NOTE: package libelf-native-0.8.13-r1: task do_populate_sysroot: Started
NOTE: package libelf-native-0.8.13-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1868 of 5581 (ID: 1535, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_configure)
NOTE: package gperf-native-3.0.3-r0: task do_configure: Started
NOTE: package ncurses-native-5.9-r1: task do_configure: Succeeded
NOTE: Running task 1869 of 5581 (ID: 1691, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_qa_configure)
NOTE: package cross-localedef-native-2.12-r1: task do_configure: Succeeded
NOTE: package ncurses-native-5.9-r1: task do_qa_configure: Started
NOTE: package ncurses-native-5.9-r1: task do_qa_configure: Succeeded
NOTE: Running task 1870 of 5581 (ID: 1550, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_qa_configure)
NOTE: package cross-localedef-native-2.12-r1: task do_qa_configure: Started
NOTE: Running task 1871 of 5581 (ID: 1692, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_compile)
NOTE: package ncurses-native-5.9-r1: task do_compile: Started
NOTE: package cross-localedef-native-2.12-r1: task do_qa_configure: Succeeded
NOTE: Running task 1872 of 5581 (ID: 1551, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_compile)
NOTE: package cross-localedef-native-2.12-r1: task do_compile: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_configure: Succeeded
NOTE: Running task 1873 of 5581 (ID: 1283, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_qa_configure)
NOTE: package pkgconfig-native-0.23-r8.1: task do_qa_configure: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_qa_configure: Succeeded
NOTE: Running task 1874 of 5581 (ID: 1284, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_compile)
NOTE: package pkgconfig-native-0.23-r8.1: task do_compile: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_configure: Succeeded
NOTE: Running task 1875 of 5581 (ID: 1480, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_qa_configure)
NOTE: package gmp-native-5.0.1-r1.1: task do_qa_configure: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_qa_configure: Succeeded
NOTE: package gperf-native-3.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 5581 (ID: 1536, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_qa_configure)
NOTE: package gperf-native-3.0.3-r0: task do_qa_configure: Started
NOTE: Running task 1877 of 5581 (ID: 1481, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_compile)
NOTE: package gperf-native-3.0.3-r0: task do_qa_configure: Succeeded
NOTE: package gmp-native-5.0.1-r1.1: task do_compile: Started
NOTE: Running task 1878 of 5581 (ID: 1537, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_compile)
NOTE: package gperf-native-3.0.3-r0: task do_compile: Started
NOTE: package cross-localedef-native-2.12-r1: task do_compile: Succeeded
NOTE: Running task 1879 of 5581 (ID: 1542, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_install)
NOTE: package cross-localedef-native-2.12-r1: task do_install: Started
NOTE: package cross-localedef-native-2.12-r1: task do_install: Succeeded
NOTE: Running task 1880 of 5581 (ID: 1543, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_populate_sysroot)
NOTE: package cross-localedef-native-2.12-r1: task do_populate_sysroot: Started
NOTE: package cross-localedef-native-2.12-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 5581 (ID: 1394, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_configure)
NOTE: package file-native-5.05-r2.0: task do_configure: Started
NOTE: package gperf-native-3.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 5581 (ID: 1528, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_install)
NOTE: package gperf-native-3.0.3-r0: task do_install: Started
NOTE: package gperf-native-3.0.3-r0: task do_install: Succeeded
NOTE: Running task 1883 of 5581 (ID: 1529, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_populate_sysroot)
NOTE: package gperf-native-3.0.3-r0: task do_populate_sysroot: Started
NOTE: package gperf-native-3.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1884 of 5581 (ID: 1591, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_configure)
NOTE: package fastjar-native-0.98-r4.2: task do_configure: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_compile: Succeeded
NOTE: Running task 1885 of 5581 (ID: 1275, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_install)
NOTE: package pkgconfig-native-0.23-r8.1: task do_install: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_install: Succeeded
NOTE: Running task 1886 of 5581 (ID: 1276, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_populate_sysroot)
NOTE: package pkgconfig-native-0.23-r8.1: task do_populate_sysroot: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_populate_sysroot: Succeeded
NOTE: Running task 1887 of 5581 (ID: 2960, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_configure)
NOTE: package openssl-native-1.0.0d-r14.0: task do_configure: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_configure: Succeeded
NOTE: Running task 1888 of 5581 (ID: 3366, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_configure)
NOTE: package bzip2-full-native-1.0.6-r0: task do_configure: Started
NOTE: package file-native-5.05-r2.0: task do_configure: Succeeded
NOTE: Running task 1889 of 5581 (ID: 2961, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_qa_configure)
NOTE: package openssl-native-1.0.0d-r14.0: task do_qa_configure: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_qa_configure: Succeeded
NOTE: Running task 1890 of 5581 (ID: 2962, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_compile)
NOTE: package openssl-native-1.0.0d-r14.0: task do_compile: Started
NOTE: package fastjar-native-0.98-r4.2: task do_configure: Succeeded
NOTE: Running task 1891 of 5581 (ID: 5000, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_configure)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_configure: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 5581 (ID: 3367, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_qa_configure)
NOTE: package bzip2-full-native-1.0.6-r0: task do_qa_configure: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_qa_configure: Succeeded
NOTE: Running task 1893 of 5581 (ID: 3368, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_compile)
NOTE: package bzip2-full-native-1.0.6-r0: task do_compile: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_configure: Succeeded
NOTE: Running task 1894 of 5581 (ID: 5001, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_qa_configure)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_qa_configure: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1895 of 5581 (ID: 5002, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_compile)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_compile: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_compile: Succeeded
NOTE: Running task 1896 of 5581 (ID: 4993, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_install)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_install: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_install: Succeeded
NOTE: Running task 1897 of 5581 (ID: 4994, virtual:native:/home/oe/openembedded/recipes/xorg-util/util-macros_1.13.0.bb, do_populate_sysroot)
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_populate_sysroot: Started
NOTE: package util-macros-native-1_1.13.0-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1898 of 5581 (ID: 4205, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_configure)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_configure: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 5581 (ID: 3359, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_install)
NOTE: package bzip2-full-native-1.0.6-r0: task do_install: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_install: Succeeded
NOTE: Running task 1900 of 5581 (ID: 3360, /home/oe/openembedded/recipes/bzip2/bzip2-full-native_1.0.6.bb, do_populate_sysroot)
NOTE: package bzip2-full-native-1.0.6-r0: task do_populate_sysroot: Started
NOTE: package bzip2-full-native-1.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1901 of 5581 (ID: 5014, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_configure)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_configure: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_configure: Succeeded
NOTE: Running task 1902 of 5581 (ID: 4206, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_qa_configure)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_qa_configure: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1903 of 5581 (ID: 4207, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_compile)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_compile: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_configure: Succeeded
NOTE: Running task 1904 of 5581 (ID: 5492, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_configure)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_configure: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_compile: Succeeded
NOTE: Running task 1905 of 5581 (ID: 4198, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_install)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_configure: Succeeded
NOTE: package xproto-native-1_7.0.21-r2.0: task do_install: Started
NOTE: Running task 1906 of 5581 (ID: 1395, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_qa_configure)
NOTE: package file-native-5.05-r2.0: task do_qa_configure: Started
NOTE: package file-native-5.05-r2.0: task do_qa_configure: Succeeded
NOTE: package xproto-native-1_7.0.21-r2.0: task do_install: Succeeded
NOTE: Running task 1907 of 5581 (ID: 1396, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_compile)
NOTE: package file-native-5.05-r2.0: task do_compile: Started
NOTE: Running task 1908 of 5581 (ID: 4199, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xproto_7.0.21.bb, do_populate_sysroot)
NOTE: package xproto-native-1_7.0.21-r2.0: task do_populate_sysroot: Started
NOTE: package xproto-native-1_7.0.21-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1909 of 5581 (ID: 5042, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_configure)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_configure: Started
NOTE: package file-native-5.05-r2.0: task do_compile: Succeeded
NOTE: Running task 1910 of 5581 (ID: 1387, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_install)
NOTE: package file-native-5.05-r2.0: task do_install: Started
NOTE: package file-native-5.05-r2.0: task do_install: Succeeded
NOTE: Running task 1911 of 5581 (ID: 1388, virtual:native:/home/oe/openembedded/recipes/file/file_5.05.bb, do_populate_sysroot)
NOTE: package file-native-5.05-r2.0: task do_populate_sysroot: Started
NOTE: package file-native-5.05-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1912 of 5581 (ID: 1592, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_qa_configure)
NOTE: package fastjar-native-0.98-r4.2: task do_qa_configure: Started
NOTE: package fastjar-native-0.98-r4.2: task do_qa_configure: Succeeded
NOTE: Running task 1913 of 5581 (ID: 1593, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_compile)
NOTE: package fastjar-native-0.98-r4.2: task do_compile: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_compile: Succeeded
NOTE: Running task 1914 of 5581 (ID: 1472, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_install)
NOTE: package gmp-native-5.0.1-r1.1: task do_install: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_install: Succeeded
NOTE: Running task 1915 of 5581 (ID: 1473, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_populate_sysroot)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_configure: Succeeded
NOTE: package gmp-native-5.0.1-r1.1: task do_populate_sysroot: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_populate_sysroot: Succeeded
NOTE: Running task 1916 of 5581 (ID: 5043, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_qa_configure)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_qa_configure: Started
NOTE: package libxau-native-1_1.0.6-r9.0: task do_qa_configure: Succeeded
NOTE: Running task 1917 of 5581 (ID: 1465, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_configure)
NOTE: package mpfr-native-3.0.0-r3.1: task do_configure: Started
NOTE: Running task 1918 of 5581 (ID: 5044, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_compile)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_compile: Started
NOTE: package libxau-native-1_1.0.6-r9.0: task do_compile: Succeeded
NOTE: package fastjar-native-0.98-r4.2: task do_compile: Succeeded
NOTE: Running task 1919 of 5581 (ID: 1584, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_install)
NOTE: package fastjar-native-0.98-r4.2: task do_install: Started
NOTE: Running task 1920 of 5581 (ID: 5035, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_install)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_install: Started
NOTE: package fastjar-native-0.98-r4.2: task do_install: Succeeded
NOTE: package libxau-native-1_1.0.6-r9.0: task do_install: Succeeded
NOTE: Running task 1921 of 5581 (ID: 1585, virtual:native:/home/oe/openembedded/recipes/fastjar/fastjar_0.98.bb, do_populate_sysroot)
NOTE: package fastjar-native-0.98-r4.2: task do_populate_sysroot: Started
NOTE: Running task 1922 of 5581 (ID: 5036, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb, do_populate_sysroot)
NOTE: package libxau-native-1_1.0.6-r9.0: task do_populate_sysroot: Started
NOTE: package fastjar-native-0.98-r4.2: task do_populate_sysroot: Succeeded
NOTE: Running task 1923 of 5581 (ID: 5015, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_qa_configure)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_qa_configure: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_qa_configure: Succeeded
NOTE: package libxau-native-1_1.0.6-r9.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1924 of 5581 (ID: 5070, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_configure)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_configure: Started
NOTE: Running task 1925 of 5581 (ID: 5016, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_compile)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_compile: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_compile: Succeeded
NOTE: Running task 1926 of 5581 (ID: 2953, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_install)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_compile: Succeeded
NOTE: package openssl-native-1.0.0d-r14.0: task do_install: Started
NOTE: Running task 1927 of 5581 (ID: 5007, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_install)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_install: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_install: Succeeded
NOTE: Running task 1928 of 5581 (ID: 5008, virtual:native:/home/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb, do_populate_sysroot)
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_populate_sysroot: Started
NOTE: package xtrans-native-1_1.2.6-r9.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1929 of 5581 (ID: 5028, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_configure)
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_configure: Started
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_configure: Succeeded
NOTE: package ncurses-native-5.9-r1: task do_compile: Succeeded
NOTE: Running task 1930 of 5581 (ID: 1683, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_install)
NOTE: Running task 1931 of 5581 (ID: 5112, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_configure)
NOTE: package ncurses-native-5.9-r1: task do_install: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_configure: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_configure: Succeeded
NOTE: Running task 1932 of 5581 (ID: 1466, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_qa_configure)
NOTE: package mpfr-native-3.0.0-r3.1: task do_qa_configure: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_qa_configure: Succeeded
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_configure: Succeeded
NOTE: Running task 1933 of 5581 (ID: 1467, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_compile)
NOTE: package mpfr-native-3.0.0-r3.1: task do_compile: Started
NOTE: Running task 1934 of 5581 (ID: 5493, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_qa_configure)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_qa_configure: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1935 of 5581 (ID: 5494, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_compile)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_compile: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_compile: Succeeded
NOTE: Running task 1936 of 5581 (ID: 5485, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_install)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_install: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_install: Succeeded
NOTE: Running task 1937 of 5581 (ID: 5486, virtual:native:/home/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb, do_populate_sysroot)
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_populate_sysroot: Started
NOTE: package libpthread-stubs-native-0.2-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 5581 (ID: 5126, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_configure)
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_configure: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_configure: Succeeded
NOTE: Running task 1939 of 5581 (ID: 5098, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_configure)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_configure: Started
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_configure: Succeeded
NOTE: Running task 1940 of 5581 (ID: 5084, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_configure)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_configure: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_configure: Succeeded
NOTE: Running task 1941 of 5581 (ID: 5056, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_configure)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_configure: Started
NOTE: package ncurses-native-5.9-r1: task do_install: Succeeded
NOTE: Running task 1942 of 5581 (ID: 1684, virtual:native:/home/oe/openembedded/recipes/ncurses/ncurses_5.9.bb, do_populate_sysroot)
NOTE: package ncurses-native-5.9-r1: task do_populate_sysroot: Started
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_configure: Succeeded
NOTE: Running task 1943 of 5581 (ID: 5448, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_configure)
NOTE: package libice-native-1_1.0.7-r9.0: task do_configure: Started
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_configure: Succeeded
NOTE: Running task 1944 of 5581 (ID: 1704, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_configure)
NOTE: package expat-native-2.0.1-r3.0: task do_configure: Started
NOTE: package ncurses-native-5.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1945 of 5581 (ID: 3380, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_configure)
NOTE: package readline-native-5.2-r8: task do_configure: Started
NOTE: package readline-native-5.2-r8: task do_configure: Succeeded
NOTE: Running task 1946 of 5581 (ID: 3381, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_qa_configure)
NOTE: package readline-native-5.2-r8: task do_qa_configure: Started
NOTE: package readline-native-5.2-r8: task do_qa_configure: Succeeded
NOTE: package expat-native-2.0.1-r3.0: task do_configure: Succeeded
NOTE: Running task 1947 of 5581 (ID: 3382, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_compile)
NOTE: package readline-native-5.2-r8: task do_compile: Started
NOTE: Running task 1948 of 5581 (ID: 1538, virtual:native:/home/oe/openembedded/recipes/gperf/gperf_3.0.3.bb, do_package)
NOTE: package gperf-native-3.0.3-r0: task do_package: Started
NOTE: package gperf-native-3.0.3-r0: task do_package: Succeeded
NOTE: Running task 1949 of 5581 (ID: 1552, /home/oe/openembedded/recipes/eglibc/cross-localedef-native_2.12.bb, do_package)
NOTE: package cross-localedef-native-2.12-r1: task do_package: Started
NOTE: package cross-localedef-native-2.12-r1: task do_package: Succeeded
NOTE: Running task 1950 of 5581 (ID: 5562, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_configure)
NOTE: package jikes-native-1.22-r3: task do_configure: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_configure: Succeeded
NOTE: Running task 1951 of 5581 (ID: 5071, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_qa_configure)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_qa_configure: Started
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1952 of 5581 (ID: 5072, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_compile)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_compile: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_install: Succeeded
NOTE: Running task 1953 of 5581 (ID: 2954, /home/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb, do_populate_sysroot)
NOTE: package openssl-native-1.0.0d-r14.0: task do_populate_sysroot: Started
NOTE: package openssl-native-1.0.0d-r14.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1954 of 5581 (ID: 5029, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_qa_configure)
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_qa_configure: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_qa_configure: Succeeded
NOTE: Running task 1955 of 5581 (ID: 5030, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_compile)
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_compile: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_compile: Succeeded
NOTE: package readline-native-5.2-r8: task do_compile: Succeeded
NOTE: Running task 1956 of 5581 (ID: 3373, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_install)
NOTE: Running task 1957 of 5581 (ID: 5021, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_install)
NOTE: package readline-native-5.2-r8: task do_install: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_install: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_install: Succeeded
NOTE: Running task 1958 of 5581 (ID: 5022, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb, do_populate_sysroot)
NOTE: package readline-native-5.2-r8: task do_install: Succeeded
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_populate_sysroot: Started
NOTE: Running task 1959 of 5581 (ID: 3374, virtual:native:/home/oe/openembedded/recipes/readline/readline_5.2.bb, do_populate_sysroot)
NOTE: package readline-native-5.2-r8: task do_populate_sysroot: Started
NOTE: package libxdmcp-native-1_1.1.0-r9.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1960 of 5581 (ID: 5113, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_qa_configure)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_qa_configure: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_qa_configure: Succeeded
NOTE: package readline-native-5.2-r8: task do_populate_sysroot: Succeeded
NOTE: Running task 1961 of 5581 (ID: 3394, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_configure)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_configure: Started
NOTE: Running task 1962 of 5581 (ID: 5114, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_compile)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_compile: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_compile: Succeeded
NOTE: Running task 1963 of 5581 (ID: 5105, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_install)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_install: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_install: Succeeded
NOTE: Running task 1964 of 5581 (ID: 5106, virtual:native:/home/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb, do_populate_sysroot)
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_populate_sysroot: Started
NOTE: package kbproto-native-1_1.0.5-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1965 of 5581 (ID: 5127, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_qa_configure)
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_qa_configure: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1966 of 5581 (ID: 5128, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_compile)
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_compile: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_compile: Succeeded
NOTE: Running task 1967 of 5581 (ID: 5119, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_install)
NOTE: package jikes-native-1.22-r3: task do_configure: Succeeded
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_install: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_install: Succeeded
NOTE: Running task 1968 of 5581 (ID: 5099, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_qa_configure)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_qa_configure: Started
NOTE: Running task 1969 of 5581 (ID: 5085, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_qa_configure)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_qa_configure: Succeeded
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_qa_configure: Started
NOTE: Running task 1970 of 5581 (ID: 5100, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_compile)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_qa_configure: Succeeded
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_compile: Started
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_compile: Succeeded
NOTE: Running task 1971 of 5581 (ID: 5086, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_compile)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_compile: Started
NOTE: Running task 1972 of 5581 (ID: 5091, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_install)
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_install: Started
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_install: Succeeded
NOTE: Running task 1973 of 5581 (ID: 5057, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_qa_configure)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_qa_configure: Started
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_qa_configure: Succeeded
NOTE: Running task 1974 of 5581 (ID: 5058, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_compile)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_compile: Succeeded
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_compile: Started
NOTE: Running task 1975 of 5581 (ID: 5077, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_install)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_install: Started
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_install: Succeeded
NOTE: Running task 1976 of 5581 (ID: 5120, virtual:native:/home/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb, do_populate_sysroot)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_compile: Succeeded
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_populate_sysroot: Started
NOTE: Running task 1977 of 5581 (ID: 5063, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_install)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_install: Started
NOTE: package inputproto-native-1_2.0.1-r2.0: task do_populate_sysroot: Succeeded
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_compile: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_install: Succeeded
NOTE: Running task 1978 of 5581 (ID: 5049, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_install)
NOTE: Running task 1979 of 5581 (ID: 5092, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb, do_populate_sysroot)
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_install: Started
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_populate_sysroot: Started
NOTE: Running task 1980 of 5581 (ID: 5064, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xextproto_7.2.0.bb, do_populate_sysroot)
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_populate_sysroot: Started
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_install: Succeeded
NOTE: package xf86bigfontproto-native-1_1.2.0-r2.0: task do_populate_sysroot: Succeeded
NOTE: package xextproto-native-1_7.2.0-r2.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1981 of 5581 (ID: 5078, virtual:native:/home/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb, do_populate_sysroot)
NOTE: Running task 1982 of 5581 (ID: 5050, virtual:native:/home/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb, do_populate_sysroot)
NOTE: Running task 1983 of 5581 (ID: 5449, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_qa_configure)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_populate_sysroot: Started
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_populate_sysroot: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_qa_configure: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_qa_configure: Succeeded
NOTE: Running task 1984 of 5581 (ID: 5450, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_compile)
NOTE: package xcmiscproto-native-1_1.2.1-r2.0: task do_populate_sysroot: Succeeded
NOTE: package bigreqsproto-native-1_1.1.1-r2.0: task do_populate_sysroot: Succeeded
NOTE: package libice-native-1_1.0.7-r9.0: task do_compile: Started
NOTE: Running task 1985 of 5581 (ID: 4912, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_configure)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_configure: Started
NOTE: Running task 1986 of 5581 (ID: 1705, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_qa_configure)
NOTE: package expat-native-2.0.1-r3.0: task do_qa_configure: Started
NOTE: package expat-native-2.0.1-r3.0: task do_qa_configure: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_configure: Succeeded
NOTE: Running task 1987 of 5581 (ID: 1706, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_compile)
NOTE: package expat-native-2.0.1-r3.0: task do_compile: Started
NOTE: Running task 1988 of 5581 (ID: 4010, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_configure)
NOTE: package gnujaf-native-1.1.1-r2: task do_configure: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_compile: Succeeded
NOTE: Running task 1989 of 5581 (ID: 1458, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_install)
NOTE: package mpfr-native-3.0.0-r3.1: task do_install: Started
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_configure: Succeeded
NOTE: package mpfr-native-3.0.0-r3.1: task do_install: Succeeded
NOTE: Running task 1990 of 5581 (ID: 3395, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_qa_configure)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_qa_configure: Started
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_qa_configure: Succeeded
NOTE: Running task 1991 of 5581 (ID: 1459, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_populate_sysroot)
NOTE: package mpfr-native-3.0.0-r3.1: task do_populate_sysroot: Started
NOTE: Running task 1992 of 5581 (ID: 3396, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_compile)
NOTE: package mpfr-native-3.0.0-r3.1: task do_populate_sysroot: Succeeded
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_compile: Started
NOTE: Running task 1993 of 5581 (ID: 1493, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_configure)
NOTE: package libmpc-native-0.8.2-r1: task do_configure: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_configure: Succeeded
NOTE: Running task 1994 of 5581 (ID: 1510, virtual:native:/home/oe/openembedded/recipes/libelf/libelf_0.8.13.bb, do_package)
NOTE: package libelf-native-0.8.13-r1: task do_package: Started
NOTE: package libelf-native-0.8.13-r1: task do_package: Succeeded
NOTE: Running task 1995 of 5581 (ID: 1482, virtual:native:/home/oe/openembedded/recipes/gmp/gmp_5.0.1.bb, do_package)
NOTE: package gmp-native-5.0.1-r1.1: task do_package: Started
NOTE: package gmp-native-5.0.1-r1.1: task do_package: Succeeded
NOTE: Running task 1996 of 5581 (ID: 1468, virtual:native:/home/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb, do_package)
NOTE: package mpfr-native-3.0.0-r3.1: task do_package: Started
NOTE: package mpfr-native-3.0.0-r3.1: task do_package: Succeeded
NOTE: Running task 1997 of 5581 (ID: 4247, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_configure)
NOTE: package freetype-native-2.4.3-r1: task do_configure: Started
NOTE: package expat-native-2.0.1-r3.0: task do_compile: Succeeded
NOTE: Running task 1998 of 5581 (ID: 1697, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_install)
NOTE: package expat-native-2.0.1-r3.0: task do_install: Started
NOTE: package expat-native-2.0.1-r3.0: task do_install: Succeeded
NOTE: Running task 1999 of 5581 (ID: 1698, virtual:native:/home/oe/openembedded/recipes/expat/expat_2.0.1.bb, do_populate_sysroot)
NOTE: package expat-native-2.0.1-r3.0: task do_populate_sysroot: Started
NOTE: package expat-native-2.0.1-r3.0: task do_populate_sysroot: Succeeded
NOTE: Running task 2000 of 5581 (ID: 5563, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_qa_configure)
NOTE: package jikes-native-1.22-r3: task do_qa_configure: Started
NOTE: package jikes-native-1.22-r3: task do_qa_configure: Succeeded
NOTE: Running task 2001 of 5581 (ID: 5564, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_compile)
NOTE: package jikes-native-1.22-r3: task do_compile: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_compile: Succeeded
NOTE: Running task 2002 of 5581 (ID: 5441, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_install)
NOTE: package libice-native-1_1.0.7-r9.0: task do_install: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_install: Succeeded
NOTE: Running task 2003 of 5581 (ID: 5442, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb, do_populate_sysroot)
NOTE: package libice-native-1_1.0.7-r9.0: task do_populate_sysroot: Started
NOTE: package libice-native-1_1.0.7-r9.0: task do_populate_sysroot: Succeeded
NOTE: Running task 2004 of 5581 (ID: 5140, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_configure)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_configure: Started
NOTE: package freetype-native-2.4.3-r1: task do_configure: Succeeded
NOTE: Running task 2005 of 5581 (ID: 4927, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_configure)
NOTE: package inetlib-native-1.1.1-r2: task do_configure: Started
NOTE: package libmpc-native-0.8.2-r1: task do_configure: Succeeded
NOTE: Running task 2006 of 5581 (ID: 1494, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_qa_configure)
NOTE: package libmpc-native-0.8.2-r1: task do_qa_configure: Started
NOTE: package libmpc-native-0.8.2-r1: task do_qa_configure: Succeeded
NOTE: Running task 2007 of 5581 (ID: 1495, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_compile)
NOTE: package libmpc-native-0.8.2-r1: task do_compile: Started
NOTE: package inetlib-native-1.1.1-r2: task do_configure: Succeeded
NOTE: Running task 2008 of 5581 (ID: 4913, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_qa_configure)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_qa_configure: Started
NOTE: package jaxp1.3-native-1.3.04-r1: task do_qa_configure: Succeeded
NOTE: Running task 2009 of 5581 (ID: 4914, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_compile)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_compile: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_configure: Succeeded
NOTE: Running task 2010 of 5581 (ID: 4542, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_configure)
NOTE: package libpng-native-1.2.44-r3.0: task do_configure: Started
NOTE: package jaxp1.3-native-1.3.04-r1: task do_compile: Succeeded
NOTE: Running task 2011 of 5581 (ID: 4905, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_install)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_install: Started
NOTE: package libmpc-native-0.8.2-r1: task do_compile: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_install: Succeeded
NOTE: Running task 2012 of 5581 (ID: 1486, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_install)
NOTE: package libmpc-native-0.8.2-r1: task do_install: Started
NOTE: Running task 2013 of 5581 (ID: 4906, virtual:native:/home/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb, do_populate_sysroot)
NOTE: package jaxp1.3-native-1.3.04-r1: task do_populate_sysroot: Started
NOTE: package libmpc-native-0.8.2-r1: task do_install: Succeeded
NOTE: package jaxp1.3-native-1.3.04-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2014 of 5581 (ID: 1487, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_populate_sysroot)
NOTE: package libmpc-native-0.8.2-r1: task do_populate_sysroot: Started
NOTE: Running task 2015 of 5581 (ID: 1496, virtual:native:/home/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb, do_package)
NOTE: package libmpc-native-0.8.2-r1: task do_package: Started
NOTE: package libmpc-native-0.8.2-r1: task do_package: Succeeded
NOTE: Running task 2016 of 5581 (ID: 4011, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_qa_configure)
NOTE: package gnujaf-native-1.1.1-r2: task do_qa_configure: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_qa_configure: Succeeded
NOTE: package libmpc-native-0.8.2-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2017 of 5581 (ID: 4012, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_compile)
NOTE: package gnujaf-native-1.1.1-r2: task do_compile: Started
NOTE: Running task 2018 of 5581 (ID: 4248, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_qa_configure)
NOTE: package freetype-native-2.4.3-r1: task do_qa_configure: Started
NOTE: package freetype-native-2.4.3-r1: task do_qa_configure: Succeeded
NOTE: Running task 2019 of 5581 (ID: 4249, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_compile)
NOTE: package freetype-native-2.4.3-r1: task do_compile: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_compile: Succeeded
NOTE: Running task 2020 of 5581 (ID: 4003, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_install)
NOTE: package gnujaf-native-1.1.1-r2: task do_install: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_install: Succeeded
NOTE: Running task 2021 of 5581 (ID: 4004, virtual:native:/home/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb, do_populate_sysroot)
NOTE: package gnujaf-native-1.1.1-r2: task do_populate_sysroot: Started
NOTE: package gnujaf-native-1.1.1-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2022 of 5581 (ID: 5210, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_configure)
NOTE: package pixman-native-0.22.0-r5.1: task do_configure: Started
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_compile: Succeeded
NOTE: Running task 2023 of 5581 (ID: 3387, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_install)
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_install: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_configure: Succeeded
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_install: Succeeded
NOTE: Running task 2024 of 5581 (ID: 1285, /home/oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.23.bb, do_package)
NOTE: Running task 2025 of 5581 (ID: 3388, virtual:native:/home/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb, do_populate_sysroot)
NOTE: package pkgconfig-native-0.23-r8.1: task do_package: Started
NOTE: package pkgconfig-native-0.23-r8.1: task do_package: Succeeded
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_populate_sysroot: Started
NOTE: Running task 2026 of 5581 (ID: 5141, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_qa_configure)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_qa_configure: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_qa_configure: Succeeded
NOTE: Running task 2027 of 5581 (ID: 5142, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_compile)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_compile: Started
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_populate_sysroot: Succeeded
NOTE: Running task 2028 of 5581 (ID: 2040, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_configure)
NOTE: package python-native-2.6.6-ml12.0: task do_configure: Started
NOTE: package pixman-native-0.22.0-r5.1: task do_configure: Succeeded
NOTE: Running task 2029 of 5581 (ID: 3980, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_configure)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_configure: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 5581 (ID: 4928, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_qa_configure)
NOTE: package inetlib-native-1.1.1-r2: task do_qa_configure: Started
NOTE: package inetlib-native-1.1.1-r2: task do_qa_configure: Succeeded
NOTE: Running task 2031 of 5581 (ID: 4929, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_compile)
NOTE: package inetlib-native-1.1.1-r2: task do_compile: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_compile: Succeeded
NOTE: Running task 2032 of 5581 (ID: 5133, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_install)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_install: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_install: Succeeded
NOTE: Running task 2033 of 5581 (ID: 5134, virtual:native:/home/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb, do_populate_sysroot)
NOTE: package libsm-native-1_1.2.0-r9.0: task do_populate_sysroot: Started
NOTE: package libsm-native-1_1.2.0-r9.0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 5581 (ID: 4543, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_qa_configure)
NOTE: package libpng-native-1.2.44-r3.0: task do_qa_configure: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_qa_configure: Succeeded
NOTE: Running task 2035 of 5581 (ID: 4544, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_compile)
NOTE: package libpng-native-1.2.44-r3.0: task do_compile: Started
NOTE: package freetype-native-2.4.3-r1: task do_compile: Succeeded
NOTE: Running task 2036 of 5581 (ID: 4240, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_install)
NOTE: package freetype-native-2.4.3-r1: task do_install: Started
NOTE: package freetype-native-2.4.3-r1: task do_install: Succeeded
NOTE: Running task 2037 of 5581 (ID: 4241, virtual:native:/home/oe/openembedded/recipes/freetype/freetype_2.4.3.bb, do_populate_sysroot)
NOTE: package freetype-native-2.4.3-r1: task do_populate_sysroot: Started
NOTE: package freetype-native-2.4.3-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2038 of 5581 (ID: 5224, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_configure)
NOTE: package fontconfig-native-2.6.0-r4: task do_configure: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_compile: Succeeded
NOTE: Running task 2039 of 5581 (ID: 4535, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_install)
NOTE: package libpng-native-1.2.44-r3.0: task do_install: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_install: Succeeded
NOTE: Running task 2040 of 5581 (ID: 4536, virtual:native:/home/oe/openembedded/recipes/libpng/libpng_1.2.44.bb, do_populate_sysroot)
NOTE: package libpng-native-1.2.44-r3.0: task do_populate_sysroot: Started
NOTE: package libpng-native-1.2.44-r3.0: task do_populate_sysroot: Succeeded
NOTE: Running task 2041 of 5581 (ID: 5211, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_qa_configure)
NOTE: package jikes-native-1.22-r3: task do_compile: Succeeded
NOTE: package pixman-native-0.22.0-r5.1: task do_qa_configure: Started
NOTE: package pixman-native-0.22.0-r5.1: task do_qa_configure: Succeeded
NOTE: Running task 2042 of 5581 (ID: 5212, virtual:native:/home/oe/openembedded/recipes/xorg-lib/pixman_0.22.0.bb, do_compile)
NOTE: package pixman-native-0.22.0-r5.1: task do_compile: Started
NOTE: Running task 2043 of 5581 (ID: 5555, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_install)
NOTE: package jikes-native-1.22-r3: task do_install: Started
NOTE: package python-native-2.6.6-ml12.0: task do_configure: Succeeded
NOTE: package jikes-native-1.22-r3: task do_install: Succeeded
NOTE: Running task 2044 of 5581 (ID: 2041, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_qa_configure)
NOTE: package python-native-2.6.6-ml12.0: task do_qa_configure: Started
NOTE: Running task 2045 of 5581 (ID: 5556, virtual:native:/home/oe/openembedded/recipes/jikes/jikes_1.22.bb, do_populate_sysroot)
NOTE: package jikes-native-1.22-r3: task do_populate_sysroot: Started
NOTE: package python-native-2.6.6-ml12.0: task do_qa_configure: Succeeded
NOTE: package jikes-native-1.22-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 2046 of 5581 (ID: 2042, /home/oe/openembedded/recipes/python/python-native_2.6.6.bb, do_compile)
NOTE: package python-native-2.6.6-ml12.0: task do_compile: Started
NOTE: Running task 2047 of 5581 (ID: 3981, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_qa_configure)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_qa_configure: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_qa_configure: Succeeded
NOTE: Running task 2048 of 5581 (ID: 3982, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_compile)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_compile: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2049 of 5581 (ID: 3973, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_install)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_install: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 5581 (ID: 3974, virtual:native:/home/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb, do_populate_sysroot)
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_populate_sysroot: Started
NOTE: package xml-commons-resolver1.1-native-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 5581 (ID: 3964, virtual:native:/home/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb, do_configure)
NOTE: package xerces-j-native-2.9.1-r1: task do_configure: Started
NOTE: package xerces-j-native-2.9.1-r1: task do_configure: Succeeded
NOTE: Running task 2052 of 5581 (ID: 4040, virtual:native:/home/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb, do_configure)
NOTE: package regexp-native-1.5-r1: task do_configure: Started
NOTE: package regexp-native-1.5-r1: task do_configure: Succeeded
NOTE: Running task 2053 of 5581 (ID: 5238, virtual:native:/home/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb, do_configure)
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_configure: Started
NOTE: package inetlib-native-1.1.1-r2: task do_compile: Succeeded
NOTE: Running task 2054 of 5581 (ID: 4920, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_install)
NOTE: package inetlib-native-1.1.1-r2: task do_install: Started
NOTE: package inetlib-native-1.1.1-r2: task do_install: Succeeded
NOTE: Running task 2055 of 5581 (ID: 4921, virtual:native:/home/oe/openembedded/recipes/classpathx/inetlib_1.1.1.bb, do_populate_sysroot)
NOTE: package inetlib-native-1.1.1-r2: task do_populate_sysroot: Started
NOTE: package inetlib-native-1.1.1-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 5581 (ID: 3995, virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_configure)
NOTE: package gnumail-native-1.1.2-r2: task do_configure: Started
NOTE: package renderproto-native-1_0.11.1-r2.0: task do_configure: Succeeded
NOTE: Running task 2057 of 5581 (ID: 5506, virtual:native:/home/oe/openembedded/recipes/libffi/libffi_3.0.9.bb, do_configure)
NOTE: package libffi-native-3.0.9-r0: task do_configure: Started
NOTE: package fontconfig-native-2.6.0-r4: task do_configure: Succeeded
NOTE: Running task 2058 of 5581 (ID: 5225, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_qa_configure)
NOTE: package fontconfig-native-2.6.0-r4: task do_qa_configure: Started
NOTE: package fontconfig-native-2.6.0-r4: task do_qa_configure: Succeeded
NOTE: Running task 2059 of 5581 (ID: 5226, /home/oe/openembedded/recipes/fontconfig/fontconfig-native_2.6.0.bb, do_compile)
NOTE: package fontconfig-native-2.6.0-r4: task do_compile: Started
ERROR: Task 3995 (virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_configure) failed with 256
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed', '/home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/temp/log.do_configure.3751')
ERROR: Logfile of failure stored in: /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/temp/log.do_configure.3751
Log data follows:
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal -I /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: running: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf --include=/home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ --include=/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 --include=/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force --warnings=cross
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| configure: WARNING: unrecognized options: --with-libtool-sysroot, --enable-largefile, --disable-nls, --enable-ipv6
| checking for a BSD-compatible install... /home/oe/openembedded/bin/install -c
| checking whether build environment is sane... yes
| checking for a thread-safe mkdir -p... /bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking if /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac works... configure: error: The Java compiler /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac failed (see config.log, check the CLASSPATH?)
NOTE: package gnumail-native-1.1.2-r2: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb do_configure failed
ERROR: Task 3995 (virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb, do_configure) failed with 256
Waiting for 4 active tasks to finish:
1: fontconfig-native-2.6.0-r4 do_compile (pid 6563)
2: libffi-native-3.0.9-r0 do_configure (pid 5351)
3: pixman-native-0.22.0-r5.1 do_compile (pid 32756)
4: python-native-2.6.6-ml12.0 do_compile (pid 853)
Waiting for 3 active tasks to finish:
1: fontconfig-native-2.6.0-r4 do_compile (pid 6563)
2: pixman-native-0.22.0-r5.1 do_compile (pid 32756)
3: python-native-2.6.6-ml12.0 do_compile (pid 853)
NOTE: package libffi-native-3.0.9-r0: task do_configure: Succeeded
Waiting for 2 active tasks to finish:
1: pixman-native-0.22.0-r5.1 do_compile (pid 32756)
2: python-native-2.6.6-ml12.0 do_compile (pid 853)
NOTE: package fontconfig-native-2.6.0-r4: task do_compile: Succeeded
Waiting for 1 active tasks to finish:
1: python-native-2.6.6-ml12.0 do_compile (pid 853)
NOTE: package pixman-native-0.22.0-r5.1: task do_compile: Succeeded
ERROR: 'virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb' failed
NOTE: package python-native-2.6.6-ml12.0: task do_compile: Succeeded
ERROR: 'virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb' failed
ERROR: 'virtual:native:/home/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb' failed

--Boundary-00=_Zdm2N+QF47DK0Dn--
