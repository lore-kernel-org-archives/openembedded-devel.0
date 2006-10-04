Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV3EY-00048t-7I for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 11:40:10 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 8AE7D401B45; Wed,  4 Oct 2006 02:09:07 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004090907.8AE7D401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 02:09:07 -0700 (PDT)
Subject: [Bug 1450] New: How to make a Angstrom-bootsrap-image for HTC Universal.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2006 09:40:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1450

           Summary: How to make a Angstrom-bootsrap-image for HTC Universal.
           Product: Openembedded
           Version: Angstrom
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: goxboxlive@gmail.com
         QAContact: tinderbox-oe@gmx.net


This is what i have to do to get the Angstrom-bootstrap-image to compile and
boot.
I have also added a directory in
"org.openembedded.dev/packages/linux/handhelds-pxa-2.6" named "htcuniversal"
with the kernel .config file named "defconfig" so the htcuniversal kernel will
compile. But i have to edit the file so it enables "EABI" compiling. EABI
compile is not default in the htcuniversal_defconfig file.

Feel free to ask me if there is something else that seems strange about my
settings. You can reach me at goxboxlive (at) gmail (dot) com.





cat htcuniversal_diff.txt | more
#
# old_revision [af4d9707539caa3779d9e1f65550a1cc2545f65d]
#
# patch "classes/qmake-base.bbclass"
#  from [2209a3c8b57687cbb1f4a1fea4f02ea2891f757b]
#    to [a1cc1475871cae1e8d44e61094adc989bc732030]
#
# patch "conf/distro/angstrom-2007.1.conf"
#  from [5759bf609f720aa3632f6496da0e6944b2a985a7]
#    to [ef9667c9af5f7640fe03427a5d9d76fd8001ba1e]
#
# patch "conf/distro/include/angstrom.inc"
#  from [30528adb2f5d1da8dda333d646b63273227c05d3]
#    to [c7f9e6d6dd3a43d54604ed896c440547146169a5]
#
# patch "conf/machine/htcuniversal.conf"
#  from [9a42447d4f53e3b3903ca84a8ede7b05eb0e2cfe]
#    to [34cc7a49275f9e819d3d8bc032fedff495ebe22c]
#
# patch "packages/angstrom/task-angstrom.bb"
#  from [7d16a50943e3850a04f09bc07ccb1233b06e4222]
#    to [cb94a710955eb7ea53cca1fc1e54220b0a7d987e]
#
# patch "packages/linux/handhelds-pxa-2.6.inc"
#  from [2aa51807cba56321605b9780093b61ebe6a786b2]
#    to [db210644cca1fef7855df785a2b6c5e086c8f531]
#
# patch "packages/linux/handhelds-pxa-2.6_cvs.bb"
#  from [eb39a257732af4f0c253b4f56bfc2e809557c8bb]
#    to [8e268e2a206ea5ed86e8d5f072a27affa20ff92d]
#
# patch "packages/qte/qte-common_2.3.10.inc"
#  from [4f538c98a8b3a59f8ed54758e402445e75aaf19b]
#    to [7635582258f158faedb56b7c64299c299ce5d221]
#
# patch "packages/sysvinit/sysvinit/htcuniversal/inittab"
#  from [83615db1e56c3eadd61d8ade7a14b59a59f0e723]
#    to [ef193f8fac71d2d8dfeb4249036ed3084bc6f420]
#
# patch "packages/tasks/task-base.bb"
#  from [0618e0eff302aa26304b7f2f0e5e9c879b5d130f]
#    to [faf609e1d9592fc9e336cfcf995eab0b6857311a]
#
# patch "packages/xcalibrate/xcalibrate_cvs.bb"
#  from [99231ffe530f6950e833361265e6ce56350f08ad]
#    to [498ba25f3be47ef95f434165d57c93930eb23209]
#
============================================================
--- classes/qmake-base.bbclass  2209a3c8b57687cbb1f4a1fea4f02ea2891f757b
+++ classes/qmake-base.bbclass  a1cc1475871cae1e8d44e61094adc989bc732030
@@ -11,7 +11,8 @@ export OE_QMAKE_LDFLAGS="${LDFLAGS}"
 export OE_QMAKE_CXX="${CXX}"
 export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti ${CXXFLAGS}"
 export OE_QMAKE_LDFLAGS="${LDFLAGS}"
-export OE_QMAKE_LINK="${CCLD}"
+#export OE_QMAKE_LINK="${CCLD}"
+export OE_QMAKE_LINK="${CXX}"
 export OE_QMAKE_AR="${AR}"
 export OE_QMAKE_STRIP="${STRIP}"
 export OE_QMAKE_UIC="${STAGING_BINDIR}/uic"
============================================================
--- conf/distro/angstrom-2007.1.conf   
5759bf609f720aa3632f6496da0e6944b2a985a7
+++ conf/distro/angstrom-2007.1.conf   
ef9667c9af5f7640fe03427a5d9d76fd8001ba1e
@@ -27,8 +27,9 @@ FEED_URIS += " \

 #SRCDATE = "20060630"
 #SRCDATE_handhelds-pxa-2.6 = "20060622"
-PREFERRED_VERSION_handhelds-pxa-2.6 = "2.6.16-hh5"
-PREFERRED_PROVIDER_hostap-modules_ipaq-pxa270 = "hostap-modules"
+#PREFERRED_VERSION_handhelds-pxa-2.6 = "2.6.16-hh5"
+#PREFERRED_PROVIDER_hostap-modules_ipaq-pxa270 = "hostap-modules"
+PREFERRED_VERSION_handhelds-pxa-2.6 = "2.6.17-hh1+cvs${SRCDATE}"


 SRCDATE_gconf-dbus = "20060719"
@@ -131,7 +132,7 @@ PREFERRED_VERSION_gstreamer ?= "0.10.6"
 PREFERRED_VERSION_dbus ?= "0.92"
 PREFERRED_VERSION_gstreamer ?= "0.10.6"

-PREFERRED_PROVIDER_hostap-conf ?= "hostap-conf"
+#PREFERRED_PROVIDER_hostap-conf ?= "hostap-conf"
 PREFERRED_PROVIDER_hostap-modules_h2200 ?= "hostap-modules"
 PREFERRED_PROVIDER_hostap-modules_hx4700 ?= "hostap-modules"
 PREFERRED_VERSION_hostap-modules ?= "0.4.7"
============================================================
--- conf/distro/include/angstrom.inc   
30528adb2f5d1da8dda333d646b63273227c05d3
+++ conf/distro/include/angstrom.inc   
c7f9e6d6dd3a43d54604ed896c440547146169a5
@@ -39,4 +39,4 @@ DISTRO_CHECK := "${@bb.data.getVar("DIST
 DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove
this line or set a dummy DISTRO_VERSION
if you really want to build an unversioned distro')}"

 # We want images supporting the following features (for task-base)
+DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 irda usbgadget
usbhost"
-DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 irda pcmcia
usbgadget usbhost"
============================================================
--- conf/machine/htcuniversal.conf     
9a42447d4f53e3b3903ca84a8ede7b05eb0e2cfe
+++ conf/machine/htcuniversal.conf     
34cc7a49275f9e819d3d8bc032fedff495ebe22c
@@ -14,7 +14,7 @@ BOOTSTRAP_EXTRA_RDEPENDS_append = " udev
 BOOTMODULES_RRECOMMENDS = "${@linux_module_packages('${PXA270_MODULES}', d)}
${@linux_module_packages('${UN_MODULES}'
, d)}"
 BOOTSTRAP_EXTRA_RRECOMMENDS += " ${BOOTMODULES_RRECOMMENDS}"
 BOOTSTRAP_EXTRA_RDEPENDS_append = " udev"
-BOOTSTRAP_EXTRA_RDEPENDS_append = " module-init-tools detect-stylus"
+BOOTSTRAP_EXTRA_RDEPENDS_append = " module-init-tools "
 BOOTSTRAP_EXTRA_RDEPENDS_append = " tiinit acx-firmware"

 PXA270_MODULES = "acx g_ether g_file_storage pxa27x_udc bsd_comp \
============================================================

+++ packages/angstrom/task-angstrom.bb 
cb94a710955eb7ea53cca1fc1e54220b0a7d987e
@@ -8,7 +8,7 @@ EXTRA_STUFF ?= ""
 DEBUG_APPS ?= ""
 DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace gdb
procps",d)}'
 EXTRA_STUFF ?= ""
-PCMCIA_MANAGER ?= "pcmciautils"
+#PCMCIA_MANAGER ?= "pcmciautils"

 PACKAGES = "\
     angstrom-base-depends \
@@ -28,9 +28,10 @@ RDEPENDS_angstrom-base-depends = "\
     util-linux-mount util-linux-umount \
     ${EXTRA_STUFF} \
     ${DEBUG_APPS} \
-    ${PCMCIA_MANAGER} \
 "
+#    ${PCMCIA_MANAGER} \

+
 RDEPENDS_angstrom-base-depends_append_ipaq-pxa270 = " tiinit acx-firmware "
 RDEPENDS_angstrom-base-depends_append_h4000 = " tiinit acx-firmware "
 RDEPENDS_angstrom-base-depends_append_htcuniversal = " tiinit acx-firmware "
============================================================
--- packages/linux/handhelds-pxa-2.6.inc       
2aa51807cba56321605b9780093b61ebe6a786b2
+++ packages/linux/handhelds-pxa-2.6.inc       
db210644cca1fef7855df785a2b6c5e086c8f531
@@ -8,8 +8,6 @@ SRC_URI = "${HANDHELDS_CVS};module=linux
 FILESDIR =
"${@os.path.dirname(bb.data.getVar('FILE',d,1))}/handhelds-pxa-${PV}"

 SRC_URI = "${HANDHELDS_CVS};module=linux/kernel26;tag=${@'K' +
bb.data.getVar('PV',d,1).replace('.', '-')} \
-           file://24-hostap_cs_id.diff;patch=1 \
-           file://hrw-pcmcia-ids-r2.patch;patch=1 \
           file://defconfig"

 S = "${WORKDIR}/kernel26"
============================================================
--- packages/linux/handhelds-pxa-2.6_cvs.bb    
eb39a257732af4f0c253b4f56bfc2e809557c8bb
+++ packages/linux/handhelds-pxa-2.6_cvs.bb    
8e268e2a206ea5ed86e8d5f072a27affa20ff92d
@@ -11,8 +11,6 @@ SRC_URI = "${HANDHELDS_CVS};module=linux
 FILESDIR =
"${@os.path.dirname(bb.data.getVar('FILE',d,1))}/handhelds-pxa-${PV}"

 SRC_URI = "${HANDHELDS_CVS};module=linux/kernel26  \
-           file://24-hostap_cs_id.diff;patch=1 \
-           file://hrw-pcmcia-ids-r2.patch;patch=1 \
            file://hx-iwmmxt.patch;patch=1;maxdate=20060807 \
           file://defconfig"

============================================================
--- packages/qte/qte-common_2.3.10.inc 
4f538c98a8b3a59f8ed54758e402445e75aaf19b
+++ packages/qte/qte-common_2.3.10.inc 
7635582258f158faedb56b7c64299c299ce5d221
@@ -18,12 +18,12 @@ SRC_URI = "ftp://ftp.trolltech.com/pub/q
           file://no-moc.patch;patch=1 \
           file://gcc3.patch;patch=1 \
           file://gcc4.patch;patch=1 \
-          file://c700-hardware.patch;patch=1 \
+#         file://c700-hardware.patch;patch=1 \
           file://encoding.patch;patch=1 \
           file://fix-qgfxraster.patch;patch=1 \
           file://qt-visibility.patch;patch=1 \
           file://tslib.patch;patch=1 \
-          file://simpad.patch;patch=1 \
+#         file://simpad.patch;patch=1 \
           file://handhelds.patch;patch=1 \
           file://qiconview-speed.patch;patch=1 \
           file://qtabbar.patch;patch=1 \
@@ -33,10 +33,10 @@ SRC_URI = "ftp://ftp.trolltech.com/pub/q
           file://fix-linuxfb-offscreenoverflow.patch;patch=1 \
           file://fix-qscreen-sync.patch;patch=1 \
           file://improve-calibration-r0.patch;patch=1 \
-          file://key.patch;patch=1 \
+#         file://key.patch;patch=1 \
           file://bidimetrics.patch;patch=5 \
           file://fix-native-build.patch;patch=1 \
-          file://simpad-defaultkbd.patch;patch=1 \
+#         file://simpad-defaultkbd.patch;patch=1 \
           file://fix-errno-exception-spec.patch;patch=1 \
           file://sharp_char.h \
           file://switches.h "
@@ -44,27 +44,27 @@ SRC_URI = "ftp://ftp.trolltech.com/pub/q
 #
 # add device specific patches here
 #
-SRC_URI_append_simpad       = "file://devfs.patch;patch=1 "
-SRC_URI_append_c7x0         = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
-                               file://c7x0-w100-accel.patch;patch=1
file://suspend-resume-hooks.patch;patch=1 "
-SRC_URI_append_spitz        = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
-                               file://kernel-keymap-CXK.patch;patch=1 "
-SRC_URI_append_akita        = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
-                               file://kernel-keymap-CXK.patch;patch=1 "
-SRC_URI_append_poodle       = "file://kernel-keymap.patch;patch=1;pnum=0 "
-SRC_URI_append_a780         = "file://kernel-keymap.patch;patch=1;pnum=0 "
-SRC_URI_append_e680         = "file://kernel-keymap.patch;patch=1;pnum=0 "
-SRC_URI_append_tosa         = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-tosa.patch;patch=1 "
-SRC_URI_append_jornada7xx   = "file://kernel-keymap.patch;patch=1;pnum=0
file://ipaq_sound_fix.patch;patch=1 "
-SRC_URI_append_jornada56x   = "file://kernel-keymap.patch;patch=1;pnum=0
file://ipaq_sound_fix.patch;patch=1 "
-SRC_URI_append_mnci         = "file://devfs.patch;patch=1 \
-                               file://mnci.patch;patch=1 \
-                               file://mnci-touchscreen.patch;patch=1 \
-                               file://qkeyboard_qws.h \
-                               file://qkeyboard_qws.cpp "
-SRC_URI_append_h3600        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "
-SRC_URI_append_h3900        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "
-SRC_URI_append_h1910        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "
+#SRC_URI_append_simpad       = "file://devfs.patch;patch=1 "
+#SRC_URI_append_c7x0         = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
+#                               file://c7x0-w100-accel.patch;patch=1
file://suspend-resume-hooks.patch;patch=1 "
+#SRC_URI_append_spitz        = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
+#                               file://kernel-keymap-CXK.patch;patch=1 "
+#SRC_URI_append_akita        = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-corgi.patch;patch=1 \
+#                               file://kernel-keymap-CXK.patch;patch=1 "
+#SRC_URI_append_poodle       = "file://kernel-keymap.patch;patch=1;pnum=0 "
+#SRC_URI_append_a780         = "file://kernel-keymap.patch;patch=1;pnum=0 "
+#SRC_URI_append_e680         = "file://kernel-keymap.patch;patch=1;pnum=0 "
+#SRC_URI_append_tosa         = "file://kernel-keymap.patch;patch=1;pnum=0
file://kernel-keymap-tosa.patch;patch=1 "
+#SRC_URI_append_jornada7xx   = "file://kernel-keymap.patch;patch=1;pnum=0
file://ipaq_sound_fix.patch;patch=1 "
+#SRC_URI_append_jornada56x   = "file://kernel-keymap.patch;patch=1;pnum=0
file://ipaq_sound_fix.patch;patch=1 "
+#SRC_URI_append_mnci         = "file://devfs.patch;patch=1 \
+#                               file://mnci.patch;patch=1 \
+#                               file://mnci-touchscreen.patch;patch=1 \
+#                               file://qkeyboard_qws.h \
+#                               file://qkeyboard_qws.cpp "
+#SRC_URI_append_h3600        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "
+#SRC_URI_append_h3900        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "
+#SRC_URI_append_h1910        = "file://ipaq-keyboard.patch;patch=1
file://ipaq_sound_fix.patch;patch=1 "


 S = "${WORKDIR}/qt-${PV}"
============================================================
--- packages/sysvinit/sysvinit/htcuniversal/inittab    
83615db1e56c3eadd61d8ade7a14b59a59f0e723
+++ packages/sysvinit/sysvinit/htcuniversal/inittab    
ef193f8fac71d2d8dfeb4249036ed3084bc6f420
@@ -20,7 +20,7 @@ l0:0:wait:/etc/init.d/rc 0
 # Runlevel 6 is reboot.

 l0:0:wait:/etc/init.d/rc 0
-l1:1:wait:/etc/init.d/rc 1
+#l1:1:wait:/etc/init.d/rc 1
 l2:2:wait:/etc/init.d/rc 2
 l3:3:wait:/etc/init.d/rc 3
 l4:4:wait:/etc/init.d/rc 4
============================================================
--- packages/tasks/task-base.bb 0618e0eff302aa26304b7f2f0e5e9c879b5d130f
+++ packages/tasks/task-base.bb faf609e1d9592fc9e336cfcf995eab0b6857311a
@@ -56,7 +56,6 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth",
d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pcmcia", d)}
\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget",
d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost",
d)}"

@@ -73,7 +72,6 @@ RDEPENDS_task-base = "\
     ${@base_contains("COMBINED_FEATURES", "alsa",
"${task-base-alsa-rdepends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "ext2",
"${task-base-ext2-rdepends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "irda",
"${task-base-irda-rdepends}", "",d)} \
-    ${@base_contains("COMBINED_FEATURES", "pcmcia",
"${task-base-pcmcia-rdepends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "usbhost",
"${task-base-usbhost-rdepends}", "",d)} \
     ${@base_contains("DISTRO_FEATURES", "nfs", "${task-distro-nfs-rdepends}",
"",d)} \
     ${@base_contains("DISTRO_FEATURES", "ipsec",
"${task-distro-ipsec-rdepends}", "",d)} \
@@ -86,7 +84,6 @@ RRECOMMENDS_task-base = "\
 RRECOMMENDS_task-base = "\
     ${@base_contains("MACHINE_FEATURES", "kernel26",
"${task-base-kernel26-extras-rrecommends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "alsa",
"${task-base-alsa-rrecommends}", "",d)} \
-    ${@base_contains("COMBINED_FEATURES", "pcmcia",
"${task-base-pcmcia-rrecommends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "bluetooth",
"${task-base-bluetooth-rrecommends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "irda",
"${task-base-irda-rrecommends}", "",d)} \
     ${@base_contains("COMBINED_FEATURES", "usbgadget",
"${task-base-usbgadget-rrecommends}", "",d)} \
@@ -109,7 +106,6 @@ RDEPENDS_task-base-oh-minimal = "\
     kernel \
     ${@base_contains("MACHINE_FEATURES", "kernel26",
"${task-base-kernel26-rdepends}", "",d)} \
     ${@base_contains("MACHINE_FEATURES", "apm", "${task-base-apm-rdepends}",
"",d)} \
-    ${@base_contains("COMBINED_FEATURES", "pcmcia", "${PCMCIA_MANAGER}",
"",d)} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

 RRECOMMENDS_task-base-minimal = "\
@@ -172,23 +168,23 @@ task-base-alsa-rrecommends = "\
     kernel-module-snd-mixer-oss \
     kernel-module-snd-pcm-oss"

-task-base-pcmcia-rdepends = "\
-    ${PCMCIA_MANAGER} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "prism3-firmware", "",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "prism3-support", "",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "spectrum-fw", "",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "hostap-conf", "",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "orinoco-conf", "",d)}"
+#task-base-pcmcia-rdepends = "\
+#    ${PCMCIA_MANAGER} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "prism3-firmware", "",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "prism3-support", "",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "spectrum-fw", "",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "hostap-conf", "",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "orinoco-conf", "",d)}"

-task-base-pcmcia-rrecommends = "\
-    kernel-module-pcmcia \
-    kernel-module-airo-cs \
-    kernel-module-pcnet-cs \
-    kernel-module-serial-cs \
-    kernel-module-ide-cs \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-hostap-cs",
"",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-orinoco-cs",
"",d)} \
-    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-spectrum-cs",
"",d)}"
+#task-base-pcmcia-rrecommends = "\
+#    kernel-module-pcmcia \
+#    kernel-module-airo-cs \
+#    kernel-module-pcnet-cs \
+#    kernel-module-serial-cs \
+#    kernel-module-ide-cs \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-hostap-cs",
"",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-orinoco-cs",
"",d)} \
+#    ${@base_contains("DISTRO_FEATURES", "wifi", "kernel-module-spectrum-cs",
"",d)}"

 task-base-bluetooth-rrecommends = "\
     kernel-module-bluetooth \
============================================================
--- packages/xcalibrate/xcalibrate_cvs.bb      
99231ffe530f6950e833361265e6ce56350f08ad
+++ packages/xcalibrate/xcalibrate_cvs.bb      
498ba25f3be47ef95f434165d57c93930eb23209
@@ -14,3 +14,6 @@ do_stage() {
 do_stage() {
        autotools_stage_all
 }
+
+
+


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


