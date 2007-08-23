Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IO7yo-0001D8-0c
	for openembedded-devel@openembedded.org; Thu, 23 Aug 2007 10:23:50 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7N8MXj1022732 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 10:22:33 +0200
Message-ID: <46CD43DF.1030603@dominion.kabel.utwente.nl>
Date: Thu, 23 Aug 2007 10:22:55 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamCheck: spam, SpamAssassin (score=7.303, vereist 5,
	BAYES_50 0.00, FORGED_RCVD_HELO 0.14, J_CHICKENPOX_25 0.60,
	J_CHICKENPOX_32 0.60, J_CHICKENPOX_47 0.60, J_CHICKENPOX_65 0.60,
	LG_4C_2V_3C 0.05, OACYS_CONS_6 1.00, OACYS_HASH 1.00,
	OACYS_SINGLE 0.10, TW_BG 0.08, TW_BX 0.08, TW_DB 0.08, TW_EG 0.08,
	TW_FL 0.08, TW_GD 0.08, TW_GF 0.08, TW_GT 0.08, TW_GV 0.08,
	TW_IB 0.08, TW_KG 0.08, TW_KX 0.08, TW_MM 0.08, TW_MV 0.08,
	TW_QE 0.08, TW_RX 0.08, TW_SJ 0.08, TW_SV 0.08, TW_TK 0.08,
	TW_YG 0.08, TW_YQ 0.08, _UT_ANATRIM_FAT 1.00)
X-UTwente-MailScanner-SpamScore: sssssss
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: Yes
Subject: OE weekly Changelog
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 08:23:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Laibsch@openembedded.org:
    zten: correct md5sum.  Closes 2808.

cbrake@openembedded.org:
    compulab-pxa270.conf: use angstrom-minimal-image-with-mtd-utils
    angstrom-minimal-image-with-mtd-utils.bb: add image
    compulab-pxa270.conf: remove MACHINE_ESSENTIAL_EXTRA_RDEPENDS and replace with
documentation
    compulab-pxa270.conf: fix serial console setup for 2.6.22 kernel,
    compulab-pxa270_2.6.22.bb: fix issues caused by inclusion of linux.inc

crofton@openembedded.org:
    ltp_20070228.bb : Apply patch from bug #2078. Move .debug directories to debug package.
    linux-omap2 : Drop lcd patch from kernel bb file. Patch is in git now.
    davinci-dvevm : Fix UBOOT_MACHINE. It needs the _config.
    u-boot : Update SRC_URI to the Denx ftp server.
    uboot-utils : Update SRC_URI to ftp.denx.de.
    linux-gumstix : Add dependency on uboot-utils. This builds mkimage so kernel build
completes.
    uboot-utils : Eliminate non-working builds. Package now builds and installs mkimage.

crofton@openembedded.org,koen@openembedded.org:
    linux.inc : Need uboot-mkimage to build uImage for gumstix kernel.

linux.inc: require mkimage for gumstix

daniel@openembedded.org:
    linux-gta01: Reflect svn path changes between 2.6.21 and 2.6.22 patchset
    disapproval of revision 'c4778a747ca17f52ef9afa2e2c5254081401273a'
    linux-gta01: Reflect svn path changes between 2.6.21 and 2.6.22 patchset
    linux-gta01: Add version 2.6.21.6 from OpenMoko svn overlay.
    uboot-openmoko_svn.bb: Use temporary stable patch branch for pinned u-boot revision
    matchbox-keyboard-inputmethod_svn.bb: Reduce font size for fic-gta01

eha@doredevelopment.dk:
    net-snmp: Add 5.4.1

freyther@openembedded.org:
    classes/tinderclient.bbclass: add the missing 'g'
    classes/seppuku.bbclass: We can't handle NoProvider for, don't handle it properly,
more debugging added
    classes/tinderclient.bbclass: Assert for not None when posting, do not handle MsgNote
    disapproval of revision '5f324e98b61ec50554d929eb59723aaef495ef64'
    classes/sanity.bbclass: Check stty settings and complain when tostop is present

hrw@openembedded.org:
    qemu: remove stripping during do_stage - close #2831
    sane-srcdates: fix qemu date
    qemu: let 20070613 be default
    qemu: added 20070613 version from Poky - this works on 32 and 64 bit machines
    qemu-qop-nogfx-native: dropped
    freetype: added 2.3.5 from Poky (target and native)
    KERNEL_IMAGETYPE cleanup
    angstrom-glibc: prefer glibc-initial
    task-python-everything: remove python-pyode which is in nonworking
    python-gammu: unbreak it - we have recent gammu now
    gammu: updated to 1.13.0
    tiff: more granulated packaging
    site/ix86-common: added glib_cv_sizeof_system_thread definition to get glib 1.2 built
    tar: drop VERY OLD recipe which is not used since BitBake was created
    tar: added 1.18
    task-python-everything: removed python-crypto as it does not build (acked by Mickeyl)
    xserver-xorg: apply drmfix.patch to get rid of /usr/include/drm
    xorg-xserver: fetch from individual releases dir
    makedepend(-native): fix DEPENDS (taken from Poky) - close #2723
    python-pygtk-1.2: fix build on amd64
    python-pyode: depend on ode

ifaistos@openembedded.org:
    packages/linux/linux-ml403-slab-2.6.x_git.bb : Make sure git-native builds before the
    packages/linux/linux-ml403-slab-2.6.x_git.bb :Add DEPENDS="git-native" to use native git
    packages/linux/linux-ml403-mvista-2.6.x_git.bb : Add DEPENDS="git-native" to use
native git
    conf/machine/xilinx-ml403.conf : Set default kernel for the xilinx ml403 the one build
    packages/linux/linux-ml403-slab-2.6.x_git.bb : Add kernel recipe for xilinx ml403 board
    packages/linux/linux-ml403-mvista-2.6.x_git.bb : Add kernel for the xilinx ml403 board
based
    classes/xilinx-bsp.bbclass : Add a class to handle xilinx kernel requirments
    conf/machine/include/tune-ppc440e.conf and tune-ppc603e : Add -mhard-float gcc switch as

koen@openembedded.org:
    midori: update to 0.0.5
    gsmd: fix packaging
    gstreamer: add depends on directfb (should fix #2802)
    sane-backends: update to 1.0.17
    gphoto2: update to 2.4.0
    libgphoto2: add 2.4.0
    angstrom 2008: catch up with glibc 2.6.1
    glibc: update to 2.6.1
    abiword*: update to 2.5.2
    wv: add libgsf to depends
    linux 2.6.21: remove localversion for gumstix to get module deps working properly
    gumstix: make uboot entry point overridable per machine
    gumstix: update machine file for new kernel
    linux 2.6.21: add gumstix support
    geoclue: enable system bus and gpsd
    libmokojounal2: inherit lib_package to fix packaging
    glibc-2.6: remove ppc-nofpu patched, as they seem to have been applied

lenehan@openembedded.org:
    net-snmp 5.4.1: Add missing patch.
    clamav 0.91.1: Remove the DEFAULT_PREFERENCE that I forgot to remove before
    clamsmtp/havp/p3scan: Bump PR to get them to rebuild against the latest clamav.
    clamav 0.91.1: Add the latest version 0.91.1.
    netbase 4.2.1: Make /etc/services, /etc/protocols and /etc/rpc as conffiles.
    iana-etc 2.20: Don't install as /etc/services and /etc/protocols as these
    net-snmp 5.4.1: Minor updates:
    iproute2 2.6.22: Fix the uclibc build of the latest iproute2.
    quagga: Added version 0.99.8, dropped 0.99.4.
    iproute2: Drop some older versions.
    iproute2: Add latest version 2.6.22. Also move the settings of S into the

lenehan@twibble.org:
    ntop: fix compilation issue (bug #1993)

likewise@openembedded.org:
    linux-x86-2.6.20: Use ARCH override, not MACHINE override to bring in correct
defconfig. Should be safe for current i?86-generic machines.
    makedevs: Add support for creating directories.

mickeyl@openembedded.org:
    python-evas: bump PR as per distutils change
    distutils.bbclass: always install staging directory before calling python
    sane-srcdates: pinpoint OpenMoko U-Boot patches
    python-[ecore|edje|emotion|evas]: bump PR as per recent distutils.bbclass change
    classes/distutils.bbclass: remove easy-install.pth, since this ends up in every
package and Python 2.5 seems to be able to import .egg packages even
    add python-openmoko, Python Bindings to the OpenMoko Phone Platform Libraries
    python-lxml: add patch to make it use pkgconfig instead of binconfig to detect its
dependencies
    python-efl.inc: bump PV
    python-evas: make it build reliably (again)
    classes/distutils.bbclass: add a staging task (to be called explicitly)
    evas/ecore: reinstantiate configure patches - without them EFL picks up wrong CFLAGS/LIBS
    libpng[-native]: update to 1.2.19
    openmoko-terminal2: enable antialiasing again, reduce menu bar font
    evas.inc: configure patch no longer applies, seems to be no longer necessary as well
    sane-srcdates: fix typo in value for eds-dbus
    sane-srcdates: include common variable for EFL
    mrxvt: change default fonts and allow more smaller fonts
    openmoko-terminal2: lower font size
    sane-srcdates: add entries for python EFL bindings
    ode / python-pyode: move to nonworking, needs a lot of gcc4 fixes to compile again
    libsdl-net: update to 1.2.7
    task-openmoko: add gpe-scap
    task-python-everything: catch up with python-pytester name change
    disapproval of revision '7dbcd6b1eac989239df942a9072b3fe7044e977c'
    task-openmoko: include gpe-scap
    python-pytester: fix SRCNAME to make it fetch
    python-pygtk-1.2: catch up with renaming
    initscripts: add a functions script that is supposed to be sourced from individual
init scripts providing some useful functions.
    remove openmoko-srcdate-now.inc
    openmoko.conf: remove svnnow, fix typo in feed addresses
    openmoko.conf: set feed URIs for P1-August-Snapshot
    gst-plugin-pulse: bypass libtool install (bogus for plugins)
    add gst-plugin-pulse, GStreamer plugins to use pulseaudio as source and sink
    gst-meta-base: add id3demux plugin
    python-pyqt: unbreak syntax
    python-pyqt: set BROKEN and give some hints where to look to fix
    sip/python-sip/python-pyqt: revamp naming, start to work on a current PyQt that builds
against Qt-X11 4.3.0
    add alsa controller and PCM plugins
    gpsd: compile python extension. upstream vendor included x86 binary in tarball
(tss...). fixes #1665
    openmoko2-contacts: add some missing dependencies (AGAIN, who is doing bogus merges
lately?)
    libxml2-native: catch up with python2.5 update
    task-python-everything: add pyode
    task-python-everything: fix python-cairo typo

pH5@openembedded.org:
    matchbox-keyboard{,-inputmethod}: fix RPROVIDES
    libgsmd: remove band-aid, gsmd.h / linux_list.h issue fixed upstream
    libgsmd: band-aid. stage common/linux_list.h and fix up the mlbuf
    linux-handhelds-2.6: update magician defconfig for pasic3 changes
    task-openmoko: remove -debug and -native-sdk task packages, they are
    task-openmoko: inherit task.bbclass to enable generation of -dbg and
    task-openmoko: split out -debug and -native-sdk tasks into own recipes
    task.bbclass: add a task class that sets common task recipe
    libgsmd: package bcm vendor plugin
    scummvm-0.9.1: update packaging, make default, openmoko integration
    scummvm.inc: improve DESCRIPTION, add HOMEPAGE
    duma: add duma-2.5.7, a red-zone memory allocator
    scummvm: use autotools' do_install, improve packaging
    gtk+-2.10.14: package printbackends -dev and -dbg files

philippe@openembedded.org:
    matchbox-keyboard_svn: fix compilation issues due to oudated patches (fixes bug #2796)
    gtk-webcore: move fixed svn date to a newer and compiling date

polyonymous@openembedded.org:
    qemu-native: thanks, hrw, but please, pick up my gcc3 too! ;-)
    qt-x11-free 4.3.0: removed bashism, closes bug #2816

rpurdie@openembedded.org:
    image.bbclass: Add the mkdir back in a different form. This proves nobody uses
USE_DEVFS and we should consider removing it,
    image/rootfs_ipk: Remove uneeded mkdir calls
    device_tables: Remove bogus /bin/ entries (never did anything, recent makedevs fixes
showed up the problem though). Also create /dev directory before populating
    rm_work.bbclass: Add missing dependency
    rm_work.bbclass: Split up the dependency chain to resolve dependency conflicts
    rm_work: Fix to work with bitbake 1.8. Changes to make this optimal need 1.8.8 so
they're in comments for now

rwhitby@nslu2-linux.org:
    slugos-packages: Sorted out some more building and non-building packages.  Promoted mysql.
    slugos-packages: We no longer support uclibc in SlugOS
    task-mokogateway: ftdi-eeprom is not required
    slugos.inc: Added gdk-pixbuf provider stuff (I have no idea why this isn't the default
somewhere)
    apex: Ensure that CMDLINE_DEBUG is initialised to something
    slugos-packages: add apex-env, fconfig and fis
    unslung-kernel: Create the correctly named kernel for use with nslu2-image.bbclass
    nslu2-image: Now that we use apex, we can use the generic ixp4xx image, and allow
people to change the RAM size with apex-env - we should be able to make fatslugs work from
our standard images now
    apex-env: New package to modify an apex bootloader environment
    fis: Updated to use nslu2-linux svn source
    slugos: openssh 4.6p1 is now the default
    nslu2-image: Use apex to support larger images.
    apex: Enabled support for 16MiB NSLU2 support
    openssh: Made version 4.6p1 the default, after a week of testing.

stefan@openembedded.org:
    fic-gta01.conf: Drop dependency on sjf2410-linux-native to let OpenMoko build on
    disapproval of revision 'badf9d8b62f79360108e71d3657a6dd7abe98d03'
    fic-gta01.conf: Drop EXTRA_IMAGEDEPENDS on sjf2410-linux-native to let the
    initscripts: Fix script name in save-rtc.sh (Closes OpenMoko bug #725)
    alsa-state.bb: Bump forgotten RP and clean up some trailing whitespaces.
    fic-gta01 alsa-statefiles: Merge the tweaking from Daniel Willmann for a better
phonecall experience.
    libgsmd: Catch up with upstream changes. All patches are applied now.
    task-openmoko: Use matchbox-keyboard-inputmethod
    matchbox-keyboard-inputmethod: Add matchbox-keyboard variant with gtk

woglinde2@openembedded.org:
    kxml2: more unification of recipe
    classpath-minimal: rework recpies and using share/java
    kxml2: adding recipe for kxml2



Bugs fixed:
bug_id resolution	 short_desc
1530 FIXED	 Bug in uri_replace with urls without a path
97 FIXED	 BBINCLUDELOGS should have option to display only XX last lines
1072 FIXED	 malformed PREFERRED_PROVIDERS make bitbake crash
1511 WONTFIX	 bitbake should escape variables
1627 FIXED	 RFE: niceness level
2108 FIXED	 Dependency error lacks information
2514 FIXED	 bitbake seems to forgot to build some dependencies at times
2773 FIXED	 bitbake 1.8 svn: KeyError: type object 'C' has no attribute '_append__mutable__'
2792 FIXED	 Dependency resolution is broken in Bitbake
2808 FIXED	 zten bb file seems to have wrong md5sum
773 FIXED	 sudo 1.6.8p12-r4 binary need to have suid bit set
1126 WONTFIX	 updated bb file for x11vnc 0.8.1
1432 WORKSFORME	 gpe-image fails to find glibc-localedata-i18n
1991 WORKSFORME	 librsvg-2.16.0 build fails: QA Issue: non debug package contains .debug
directory
1993 FIXED	 ntop 3.0 fails do_configure
2038 WORKSFORME	 gtk-webcore (osb-nrcore_0.5.0.bb) doesn't compile against gtk+2.6.10
2040 WORKSFORME	 gnome-doc-utils_0.7.1.bb build failed (depend on xlstproc)
2304 FIXED	 texinfo fails to build
2358 FIXED	 osb-nrcit-0.5.0+cvs20060212-r0 fails to compile
2505 FIXED	 netbase has files that are already provided by iana-etc
2531 FIXED	 gpsd_2.34-r3 fails
2589 FIXED	 qemu-native sigsegvs on amd64 while generating glibc locales
2708 WORKSFORME	 Package gtk+-2.10.14-r1 fails to compile
2723 FIXED	 makedepend do_compile problem: No rule to make target
`makedepend.@APP_MAN_SUFFIX@'
2731 WONTFIX	 efl does not build
2746 FIXED	 libgsmd_svn.bb uses SRCREV instead of SRCDATE
2748 INVALID	 librsvg fails to build
2755 FIXED	 Perl's Cross/Makefile re-uses TOPDIR from environment
2793 WORKSFORME	 change SRC_URI
2794 WORKSFORME	 Unable to fetch source for intltool
2796 FIXED	 Build of matchbox-keyboard fails
2800 FIXED	 angstrom-x11-image-1.0-r11-do_rootfs
2802 DUPLICATE	 gst-plugins-bad-0.10.5-r0-do_compile
2803 FIXED	 xserver-xorg-1.3.0.0-r0-do_fetch
2812 FIXED	 libmokogsmd2-0.1.0+svnr2703-r1-do_configure
2814 WORKSFORME	 webkit-gtk-0.0+svnr25169-r25169-r1-do_install
2816 FIXED	 qt4-x11-free
2817 FIXED	 abiword-2.5.2-r0-do_configure
2818 FIXED	 abiword-embedded-2.5.2-r0-do_configure
2819 DUPLICATE	 [patch] qt4-x11-free-4.3.0 - for loop in do_stage is not compatible with SH
2820 FIXED	 do_make_rootfs fails on makedevs
2821 FIXED	 wv-1.2.0-r0-do_configure
2822 FIXED	 abiword-embedded-2.5.2-r0-do_compile
2823 FIXED	 abiword-plugins-2.5.2-r0-do_configure
2824 INVALID	 abiword-embedded-2.5.2-r0-do_install
2825 INVALID	 abiword-plugins-2.4.6-r0-do_compile
2826 FIXED	 openmoko-dialer2-0.1.0+svnr2782-r2-do_compile
2827 DUPLICATE	 openmoko-dialer2-0.1.0+svnr2784-r2-do_compile
2828 DUPLICATE	 openmoko-dialer2-0.1.0+svnr2790-r2-do_compile
2831 FIXED	 qemu-native-0.9.0+cvs20070613-r4-do_populate_staging


Bugs opened:
bug_id resolution	 short_desc
2774 	 python-egenix-mx-base-2.0.6-r1-do_patch
2775 	 python-formencode-0.4-r0-do_fetch
2776 	 python-gammu-0.21-ml0-do_compile
2777 	 packages eflpp resp. edje fail to build
2778 	 python-m2crypto-0.13.1-r0-do_compile
2779 	 nmap does not work as root when built with gcc4
2780 	 mysql-4.1.18-r2-do_compile
2781 	 python-soappy-0.11.3-r0-do_compile
2782 	 python-pyode-1.0.0-r0-do_compile
2783 	 python-sip4-4.4.5-ml0-do_compile
2784 	 python-pyqt4-4.2-ml0-do_generate
2785 	 evas-0.9.9+cvs20070721-r0-do_configure
2786 	 directfb-1.0.0-r5-do_rm_work
2787 	 python-ecore-0.0.0+cvs20070816-r0-do_compile
2788 	 python-evas-0.0.0+cvs20070816-r0-do_compile
2789 	 python-pytest-0.6.0-ml0-do_fetch
2790 	 python-sword-1.5.9-r0-do_compile
2791 	 python24-native-2.4.0-r2-do_compile
2795 	 busybox-1.2.1 failed to build
2797 	 kernel-module-sharpsl-rc make kernel panic.
2798 	 machine qemuarm ext2 image
2799 	 NFS Utils are broken - statd is not started so no locking
2801 	 foo
2804 	 Updating the version of gtkmm library.
2805 	 Updating librsvg
2806 	 openldap-2.3.11-r4  fails to build on debian etch - perhaps due to new automake?
2807 	 rxvt-unicode fail compile terminfo
2809 	 zudoku .bb did not install & package all necessary files
2810 	 at daemon: /var/spool/at is not created on installation
2811 	 gpe-clock alarm resume disables keyboard when gpe-lock is used
2813 	 libsdl-net fails sanity checks in configure
2815 	 net-snmp fails to compile on slugos/arm
2829 	 Gumstix-Verdex Angstrom Distribution Issues
2830 	 linux-2.6.21-r6-do_unpack
2832 	 gpe-irc segfaults
2834 	 horizon fails to start due to bad hardcoded path
2835 	 Kazehakase segfaults when attempting to open a webpage
2836 	 gpe-gallery segfaults during image manipulation

In total 38 bugs have been created and 50 bugs were closed.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGzUPfMkyGM64RGpERAnHlAJ9TcWycgwg1Bzfi4HAWO3qfPmjQvQCfVYUf
/HAq/cIBc2jtn1WxMNodQhs=
=TnYK
-----END PGP SIGNATURE-----


