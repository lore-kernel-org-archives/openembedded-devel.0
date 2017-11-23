Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B97F7786FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANC9K4N014609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:09:20 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:19 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:01 -0500
Message-ID: <4be758d52d96dd4acf41bf4f32d7a4fe184c71eb.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/15] meta-installer: create layer
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:20 -0000
Content-Type: text/plain

Create meta-installer as a collection of installation
programs based on OE platform.

The target installer 'anaconda' has been maintained by
Wind River for several years, and now we want to contribute
it to OE community.

There are two images in target installer, one is target
image which to be installed to target, another is installer
image which to do the installation. Each image requires a
standalone build.

For target build, enable it by DISTRO_FEATURES_append = "
anaconda-support";

For host build, enable it by DISTRO = "anaconda"

Without above setting, the anaconda installer does not work even
though including meta-installer, and the other installer programs
in this layer will not be influenced by anaconda.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-installer/COPYING.MIT     |  17 ++
 meta-installer/README          |  47 ++++
 meta-installer/README.anaconda | 341 ++++++++++++++++++++++++++
 meta-installer/conf/layer.conf |  29 +++
 meta-installer/licenses/FLTK   | 530 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 964 insertions(+)
 create mode 100644 meta-installer/COPYING.MIT
 create mode 100644 meta-installer/README
 create mode 100644 meta-installer/README.anaconda
 create mode 100644 meta-installer/conf/layer.conf
 create mode 100644 meta-installer/licenses/FLTK

diff --git a/meta-installer/COPYING.MIT b/meta-installer/COPYING.MIT
new file mode 100644
index 0000000..89de354
--- /dev/null
+++ b/meta-installer/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta-installer/README b/meta-installer/README
new file mode 100644
index 0000000..9b2f5d0
--- /dev/null
+++ b/meta-installer/README
@@ -0,0 +1,47 @@
+meat-installer
+============
+This layer provides a collection of installation programs
+based on OE platform.
+
+One implementation is the target installer 'anaconda', see
+README.anaconda for details
+
+Dependencies
+------------
+URI: git://github.com/openembedded/openembedded-core.git
+branch: master
+revision: HEAD
+
+URI: git://github.com/openembedded/bitbake.git
+branch: master
+revision: HEAD
+
+URI: git://github.com/openembedded/meta-openembedded.git
+layers: meta-filesystems, meta-gnome, meta-python,
+        meta-oe, meta-networking, and meta-initramfs
+branch: master
+revision: HEAD
+
+Maintenance
+-----------
+anaconda: See README.anaconda for details
+
+Contributing
+-----------
+The meta-openembedded mailinglist
+(openembedded-devel@lists.openembedded.org) is used for questions,
+comments and patch review. It is subscriber only, so please register
+before posting.
+
+Send pull requests to openembedded-devel@lists.openembedded.org with
+'[meta-installer]' in the subject.
+
+When sending single patches, please use something like:
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-installer][PATCH'
+
+License
+-------
+
+All metadata is MIT licensed unless otherwise stated. Source code included
+in tree for individual recipes is under the LICENSE stated in each recipe
+(.bb file) unless otherwise stated.
diff --git a/meta-installer/README.anaconda b/meta-installer/README.anaconda
new file mode 100644
index 0000000..22f24d3
--- /dev/null
+++ b/meta-installer/README.anaconda
@@ -0,0 +1,341 @@
+Introduction
+-----------
+The anaconda is from fedora, which is the installer of
+distribution Fedora, RedHat and Centos.
+(https://fedoraproject.org/wiki/Anaconda)
+
+There are two builds required, one is target build,
+another is host build.
+
+The image/packages of target build is installed on the
+target hard disk as user requirements.
+
+The image of host build is to run a installer program (anaconda)
+and install image/packages of target build to hard disk.
+
+Maintenance
+-----------
+Maintainers: Hongxu Jia <jiahongxujia@163.com> | <hongxu.jia@windriver.com>
+             Robert Yang <liezhi.yang@windriver.com>
+             Mark Hatle <mark.hatle@windriver.com>
+
+Limitation
+-----------
+1) Since OE use grub-efi to generate live image, the compatible host
+   is i.86|x86_64
+   (Set MACHINE = "qemux86-64|qemux86" in default build)
+
+2) The target installer based on fedora 26, so it requires:
+   - systemd as init manager
+   - python3
+   - dnf2/rpm4
+   - gobject-introspection which requires qemu-usermode
+     in MACHINE_FEATURES
+
+Building the target installer
+-----------
+1. Summary
+   The target installer is enabled by including this layer.
+   There are two images in target installer, one is target
+   image which to be installed to target, another is installer image
+   which to do the installation.
+
+   A target image requires specific components to be compatible with
+   the installer. To install these components set
+   DISTRO_FEATURES_append = " anaconda-support" in local.conf
+
+   For installer image, you are not supposed to change the 'DISTRO'
+   setting in target build directory. It may work, but it's not
+   recommended. Instead we should recommend the user run a
+   oe-init-build-env and create a new build directory for the installer.
+   Set DISTRO = 'anaconda' in local.conf file.
+
+   There are two kinds of installer builds: "Image Based Install" and
+   "Package Based Install". The former is to install a prebuilt image,
+   the latter is to install RPM packages.
+
+   For Image Based Install, set INSTALLER_TARGET_BUILD =
+   '<target-build-image>' in local.conf to specify an .ext2, .ext3,
+   or ext4 image file, then the installer will copy this image to the
+   target.
+
+   For Package Based Install,  set INSTALLER_TARGET_BUILD =
+   '<target-build-topdir>' to specify the path to target build directory
+   that will supply RPMs, and INSTALLER_TARGET_IMAGE = '<target-image-pn>'
+   to specify the image recipe name, then the installer will install its
+   RPMs to the target;
+
+2. Two main use cases
+   2.1 Installer image with ext2, ext3 or ext4 image from the target
+       build to be copied to local disk.
+
+   2.2 Installer image with RPMs from the target build to be installed
+       to local disk.
+
+   Note: Each option requires two builds, one is for the target build,
+         the other one is for the installer itself. The build and installer
+         board (BSP) configuration should be the same.
+
+3. Examples for the use cases
+   The following example is to install a target image core-image-minimal
+   by host image core-image-install.
+
+   3.1 Image Based Install
+       3.1.1 Clone away
+
+           $ mkdir <installer-project>
+           $ cd <installer-project>
+           $ git clone git://git.openembedded.org/meta-openembedded
+           $ git clone git://git.openembedded.org/openembedded-core oe-core
+           $ cd oe-core
+           $ git clone git://git.openembedded.org/bitbake
+
+       3.1.2 Prepare target build
+
+           $ . <installer-project>/oe-core/oe-init-build-env <target_build>
+
+           The build requires 'anaconda-support' in DISTRO_FEATURES to
+           help installation. It also requires RPM packages and systemd
+           init manager. Edit conf/local.conf to use:
+           $ echo 'DISTRO_FEATURES_append = " anaconda-support"' >> conf/local.conf
+           $ echo 'PACKAGE_CLASSES = "package_rpm"' >> conf/local.conf
+           $ echo 'VIRTUAL-RUNTIME_init_manager = "systemd"' >> conf/local.conf
+           $ echo 'DISTRO_FEATURES_append = " systemd"' >> conf/local.conf
+           $ echo 'DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"' >> conf/local.conf
+
+           Edit conf/bblayers.conf to include other layers
+           BBLAYERS ?= " \
+               <installer-project>/oe-core/meta \
+               <installer-project>/meta-openembedded/meta-python \
+               <installer-project>/meta-openembedded/meta-gnome \
+               <installer-project>/meta-openembedded/meta-filesystems \
+               <installer-project>/meta-openembedded/meta-oe \
+               <installer-project>/meta-openembedded/meta-networking \
+               <installer-project>/meta-openembedded/meta-initramfs \
+               <installer-project>/meta-openembedded/meta-installer \
+           "
+
+       3.1.3 Build target image in <target_build>.
+
+           $ bitbake core-image-minimal
+
+       3.1.4 Prepare installer build.
+           $ . <installer-project>/oe-core/oe-init-build-env <installer_build>
+
+           The build requires DISTRO = "anaconda", location of target image.
+           Edit conf/local.conf to use:
+           $ echo 'PACKAGE_CLASSES = "package_rpm"' >> conf/local.conf
+           $ echo 'DISTRO = "anaconda"' >> conf/local.conf
+           $ echo 'INSTALLER_TARGET_BUILD = "<target_build>/tmp-glibc/deploy/images/qemux86/core-image-minimal-qemux86.ext4"' >> conf/local.conf
+
+           Edit conf/bblayers.conf to include other layers
+           BBLAYERS ?= " \
+               <installer-project>/oe-core/meta \
+               <installer-project>/meta-openembedded/meta-python \
+               <installer-project>/meta-openembedded/meta-gnome \
+               <installer-project>/meta-openembedded/meta-filesystems \
+               <installer-project>/meta-openembedded/meta-oe \
+               <installer-project>/meta-openembedded/meta-networking \
+               <installer-project>/meta-openembedded/meta-initramfs \
+               <installer-project>/meta-openembedded/meta-installer \
+           "
+
+       3.1.5 Build installer image in installer_build.
+
+           $ bitbake core-image-anaconda
+
+   3.2 Package Based Install
+       3.2.1 Clone away
+             The same with 3.1.1
+
+       3.2.2 Prepare target build
+             The same with 3.1.2
+
+       3.2.3 Build target image in <target_build>.
+             The same with 3.1.3
+
+       3.2.4 Prepare installer build.
+           $ . <installer-project>/oe-core/oe-init-build-env <installer_build>
+
+           The build requires DISTRO = "anaconda", location of target build
+           and recipe name of target image.
+           Edit conf/local.conf to use:
+           $ echo 'PACKAGE_CLASSES = "package_rpm"' >> conf/local.conf
+           $ echo 'DISTRO = "anaconda"' >> conf/local.conf
+           $ echo 'INSTALLER_TARGET_BUILD = "<target_build>"' >> conf/local.conf
+           $ echo 'INSTALLER_TARGET_IMAGE = "core-image-minimal"' >> conf/local.conf
+
+           Edit conf/bblayers.conf to include other layers
+           BBLAYERS ?= " \
+               <installer-project>/oe-core/meta \
+               <installer-project>/meta-openembedded/meta-python \
+               <installer-project>/meta-openembedded/meta-gnome \
+               <installer-project>/meta-openembedded/meta-filesystems \
+               <installer-project>/meta-openembedded/meta-oe \
+               <installer-project>/meta-openembedded/meta-networking \
+               <installer-project>/meta-openembedded/meta-initramfs \
+               <installer-project>/meta-openembedded/meta-installer \
+           "
+
+       3.2.4 Build installer image in installer_build.
+             The same with 3.1.4
+
+4. Install
+   4.1 Burn the output ISO to a DVD or dd it to a USB disk, and use it to
+       boot the target board and start the install.
+
+   4.2 Use qemu for testing
+       Build target installer with machine of qemux86
+
+       Create the qemu disk:
+       $ <installer_build>/tmp-glibc/sysroots-components/x86_64/qemu-native/usr/bin/qemu-img create -f qcow hd0.vdisk 5000M
+
+       Start qemu with installer image:
+       $ runqemu qemux86 core-image-anaconda iso slirp kvm qemuparams="-drive file=hd0.vdisk,if=virtio,format=qcow"
+
+       Add "-vnc :4" to qemuparams to start a VNC capable session.
+       Add "-m 1024" to qemuparams to allocate enough memory.
+
+       Start qemu with installed target:
+       $ runqemu qemux86 core-image-anaconda iso slirp kvm qemuparams="-drive file=hd0.vdisk,if=virtio,format=qcow -boot menu=on"
+
+       Run vncviewer to connect VNC capable session.
+       $ vncviewer <host-ip-address>:4
+
+       Add "-boot menu=on" to qemuparams and run vncviewer to connect,
+       press ESC key, manually choose "2. Virtio disk" "to boot from hard disk.
+
+   4.3 Use virtualbox for testing
+       4.3.1 Prepare virtualbox
+             Take Ubuntu 16.04 for example, the virtualbox is 5.0.40
+             sudo apt-get install virtualbox
+
+       4.3.2 Create virtual machine
+             'New'-> Name:***
+                     Type:Linux
+                     Version:Linux 2.6/3.x/4.x(32 bit)
+                     Memory size: 1024MB
+                     Hard disk: Create a virtual hard disk now
+             'Create'-> VDI(Virtualbox Disk Image)
+
+       4.3.3 Add ISO storage to virtual machine
+             Select newly created virtual machine
+             'Setting'-> 'Storage'-> 'Controller:SATA'->
+             'Adds optical drive' -> 'Choose disk' ->
+             'core-image-anaconda-qemux86.iso'
+
+             Remove IDE Empty optical
+             'Setting'-> 'Storage'-> 'Controller:IDE'->
+             'Empyt' -> Removes selected storage attachment
+
+       4.3.4 Config net for virtual machine
+             Select newly created virtual machine
+             'Setting'-> 'Network'-> 'Enable Network Adapter'->
+             'Attached to: Bridged Adapter'-> 'Name: eno1'
+
+       4.3.5 Add serial port to virtual machine
+             Select newly created virtual machine
+             'Setting'-> 'Serial Ports'-> 'Port 1'->
+             'Enable Serial Port'-> Port Number: COM1
+                                    Port Mode: Host Pipe
+                                    Unselect 'Connect to existing pipe/socket'
+                                    Path/Address: /tmp/pipe
+
+       4.3.6 Use minicom to connect virtual machine's serial port
+             sudo minicom -s
+             'Serial port setup'->
+             'A -    Serial Device      : unix#/tmp/pipe'->
+             'Exit'
+
+       4.3.7 Start virtual machine
+             Select newly created virtual machine-> 'Start'
+
+             After the installation finished, delete ISO storage and
+             start virtual machine again to check the installed target.
+
+   4.4 Need 1G memory size at least
+       While starting qemu/virtualbox/vmware for testing, please make
+       sure virtual machine has 1G memory at least.
+
+5. Use custom installer.conf
+   The second build can use installer.conf to help speed up the build
+   process when package based installs, the user can set WRL_INSTALLER_CONF
+   in the conf file, for example:
+
+   edit local.conf
+   WRL_INSTALLER_CONF = "/my/installer.conf"
+
+   You can customize the contents of installer.conf when needed, for example,
+   add packages that you will like to install, but if you do, you must ensure
+   that the added packages are in the target build (target_build).
+
+   To do this, use the file /.buildstamp after the installation and edit it
+   for later installs.
+
+6. Perform the kickstart installation
+   The installer can support kickstart installs. To do this, use the ks file
+   from /root/anaconda-ks.cfg after the installation and edit it for later
+   installs. You can specify the ks file by setting KICKSTART_FILE in the conf
+   file, for example:
+
+   KICKSTART_FILE = "/my/anaconda-ks.cfg"
+
+   Then the second build will take it and start the kickstart installs
+   by default when you start the target with installer image.
+
+7. About Grub version
+   The current installer only supports grub 2.
+
+8. How to create RPM metadata in build
+   bitbake package-index
+
+   There is a repodata in deploy dir:
+   $ find tmp-glibc/deploy/rpm/ -name repodata
+   tmp-glibc/deploy/rpm/repodata
+
+9. Put multiple target builds into one installer image
+   9.1 Create and build multiple target build projects.
+       Refer to section 3.1.1 on how to setup and build each target project.
+       In this example, the projects are named target_build1, target_build2 and
+       target_build3. The target_build1 and target_build2 are build dirs,
+       target_build3 is ext4 file. Build 'core-image-sato' in
+       target_build1 and build 'core-image-minimal' in target_build2.
+
+   9.2 Edit local.conf, use variable INSTALLER_TARGET_BUILD to point to
+       "<target_build1> <target_build2> <target_build3>", and set
+       INSTALLER_TARGET_IMAGE = "core-image-sato core-image-minimal",
+       the space is the separator:
+
+       $ bitbake core-image-anaconda
+
+       Then the installer image will contain all target builds specified,
+       including target_build1, target_build2 and target_build3.
+
+       When you boot the installer image, you will get a selection menu:
+       NOTE: target_buildX is the basename of project
+
+       =============== Found the following products ===============
+       1) DISTRO1    target_build1    DISTRO_NAME1    DISTRO_VERION1
+       2) DISTRO2    target_build2    DISTRO_NAME2    DISTRO_VERION2
+       3) <target_build3-ext4-file>-3
+
+       Please enter your choice (0 to quit):
+
+       NOTE: You need to use a proper name for the target build project
+             since its basename will be used in the selection menus.
+
+       NOTE: The number of the entries in WRL_INSTALLER_CONF or
+             KICKSTART_FILE must be the same as the number of target build
+             projects.
+             For example, if you want to use WRL_INSTALLER_CONF or
+             KICKSTART_FILE for target_build1, target_build2 and
+             target_build3, set each of the three in the conf file.
+
+             WRL_INSTALLER_CONF = "/my/target1.conf /my/target2.conf \
+                                    /my/target3.conf"
+             KICKSTART_FILE = "/my/target1.ks /my/target2.ks \
+                               /my/target3.ks"
+
+             Then target_build1 will use /my/target1.conf and /my/target1.ks,
+             target_build2 and target_build3 will work similarly.
+
diff --git a/meta-installer/conf/layer.conf b/meta-installer/conf/layer.conf
new file mode 100644
index 0000000..2788d1c
--- /dev/null
+++ b/meta-installer/conf/layer.conf
@@ -0,0 +1,29 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH =. "${LAYERDIR}:"
+
+# We have a packages directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-installer"
+BBFILE_PATTERN_meta-installer = "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-installer = "10"
+
+LAYERVERSION_meta-installer = "2"
+
+LAYERDEPENDS_meta-installer = " \
+    core \
+    openembedded-layer \
+    filesystems-layer \
+    gnome-layer \
+    meta-python \
+    networking-layer \
+    meta-initramfs \
+"
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
+SRC_DISTRIBUTE_LICENSES += "X11"
+SRC_DISTRIBUTE_LICENSES += "FLTK"
+
+LAYER_PATH_meta-installer = "${LAYERDIR}"
+
diff --git a/meta-installer/licenses/FLTK b/meta-installer/licenses/FLTK
new file mode 100644
index 0000000..9542075
--- /dev/null
+++ b/meta-installer/licenses/FLTK
@@ -0,0 +1,530 @@
+                             FLTK License
+                           December 11, 2001
+
+The FLTK library and included programs are provided under the terms
+of the GNU Library General Public License (LGPL) with the following
+exceptions:
+
+    1. Modifications to the FLTK configure script, config
+       header file, and makefiles by themselves to support
+       a specific platform do not constitute a modified or
+       derivative work.
+
+      The authors do request that such modifications be
+      contributed to the FLTK project - send all contributions
+      through the "Software Trouble Report" on the following page:
+ 
+           http://www.fltk.org/str.php
+
+    2. Widgets that are subclassed from FLTK widgets do not
+       constitute a derivative work.
+
+    3. Static linking of applications and widgets to the
+       FLTK library does not constitute a derivative work
+       and does not require the author to provide source
+       code for the application or widget, use the shared
+       FLTK libraries, or link their applications or
+       widgets against a user-supplied version of FLTK.
+
+       If you link the application or widget to a modified
+       version of FLTK, then the changes to FLTK must be
+       provided under the terms of the LGPL in sections
+       1, 2, and 4.
+
+    4. You do not have to provide a copy of the FLTK license
+       with programs that are linked to the FLTK library, nor
+       do you have to identify the FLTK license in your
+       program or documentation as required by section 6
+       of the LGPL.
+
+       However, programs must still identify their use of FLTK.
+       The following example statement can be included in user
+       documentation to satisfy this requirement:
+
+           [program/widget] is based in part on the work of
+           the FLTK project (http://www.fltk.org).
+
+-----------------------------------------------------------------------
+
+		  GNU LIBRARY GENERAL PUBLIC LICENSE
+			 Version 2, June 1991
+
+	  Copyright (C) 1991 Free Software Foundation, Inc.
+       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+     Everyone is permitted to copy and distribute verbatim copies
+      of this license document, but changing it is not allowed.
+
+    [This is the first released version of the library GPL.  It is
+   numbered 2 because it goes with version 2 of the ordinary GPL.]
+
+			       Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+Licenses are intended to guarantee your freedom to share and change
+free software--to make sure the software is free for all its users.
+
+  This license, the Library General Public License, applies to some
+specially designated Free Software Foundation software, and to any
+other libraries whose authors decide to use it.  You can use it for
+your libraries, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if
+you distribute copies of the library, or if you modify it.
+
+  For example, if you distribute copies of the library, whether gratis
+or for a fee, you must give the recipients all the rights that we gave
+you.  You must make sure that they, too, receive or can get the source
+code.  If you link a program with the library, you must provide
+complete object files to the recipients so that they can relink them
+with the library, after making changes to the library and recompiling
+it.  And you must show them these terms so they know their rights.
+
+  Our method of protecting your rights has two steps: (1) copyright
+the library, and (2) offer you this license which gives you legal
+permission to copy, distribute and/or modify the library.
+
+  Also, for each distributor's protection, we want to make certain
+that everyone understands that there is no warranty for this free
+library.  If the library is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original
+version, so that any problems introduced by others will not reflect on
+the original authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that companies distributing free
+software will individually obtain patent licenses, thus in effect
+transforming the program into proprietary software.  To prevent this,
+we have made it clear that any patent must be licensed for everyone's
+free use or not licensed at all.
+
+  Most GNU software, including some libraries, is covered by the ordinary
+GNU General Public License, which was designed for utility programs.  This
+license, the GNU Library General Public License, applies to certain
+designated libraries.  This license is quite different from the ordinary
+one; be sure to read it in full, and don't assume that anything in it is
+the same as in the ordinary license.
+
+  The reason we have a separate public license for some libraries is that
+they blur the distinction we usually make between modifying or adding to a
+program and simply using it.  Linking a program with a library, without
+changing the library, is in some sense simply using the library, and is
+analogous to running a utility program or application program.  However, in
+a textual and legal sense, the linked executable is a combined work, a
+derivative of the original library, and the ordinary General Public License
+treats it as such.
+
+  Because of this blurred distinction, using the ordinary General
+Public License for libraries did not effectively promote software
+sharing, because most developers did not use the libraries.  We
+concluded that weaker conditions might promote sharing better.
+
+  However, unrestricted linking of non-free programs would deprive the
+users of those programs of all benefit from the free status of the
+libraries themselves.  This Library General Public License is intended to
+permit developers of non-free programs to use free libraries, while
+preserving your freedom as a user of such programs to change the free
+libraries that are incorporated in them.  (We have not seen how to achieve
+this as regards changes in header files, but we have achieved it as regards
+changes in the actual functions of the Library.)  The hope is that this
+will lead to faster development of free libraries.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.  Pay close attention to the difference between a
+"work based on the library" and a "work that uses the library".  The
+former contains code derived from the library, while the latter only
+works together with the library.
+
+  Note that it is possible for a library to be covered by the ordinary
+General Public License rather than by this special one.
+
+		  GNU LIBRARY GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License Agreement applies to any software library which
+contains a notice placed by the copyright holder or other authorized
+party saying it may be distributed under the terms of this Library
+General Public License (also called "this License").  Each licensee is
+addressed as "you".
+
+  A "library" means a collection of software functions and/or data
+prepared so as to be conveniently linked with application programs
+(which use some of those functions and data) to form executables.
+
+  The "Library", below, refers to any such software library or work
+which has been distributed under these terms.  A "work based on the
+Library" means either the Library or any derivative work under
+copyright law: that is to say, a work containing the Library or a
+portion of it, either verbatim or with modifications and/or translated
+straightforwardly into another language.  (Hereinafter, translation is
+included without limitation in the term "modification".)
+
+  "Source code" for a work means the preferred form of the work for
+making modifications to it.  For a library, complete source code means
+all the source code for all modules it contains, plus any associated
+interface definition files, plus the scripts used to control compilation
+and installation of the library.
+
+  Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running a program using the Library is not restricted, and output from
+such a program is covered only if its contents constitute a work based
+on the Library (independent of the use of the Library in a tool for
+writing it).  Whether that is true depends on what the Library does
+and what the program that uses the Library does.
+
+  1. You may copy and distribute verbatim copies of the Library's
+complete source code as you receive it, in any medium, provided that
+you conspicuously and appropriately publish on each copy an
+appropriate copyright notice and disclaimer of warranty; keep intact
+all the notices that refer to this License and to the absence of any
+warranty; and distribute a copy of this License along with the
+Library.
+
+  You may charge a fee for the physical act of transferring a copy,
+and you may at your option offer warranty protection in exchange for a
+fee.
+
+  2. You may modify your copy or copies of the Library or any portion
+of it, thus forming a work based on the Library, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) The modified work must itself be a software library.
+
+    b) You must cause the files modified to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    c) You must cause the whole of the work to be licensed at no
+    charge to all third parties under the terms of this License.
+
+    d) If a facility in the modified Library refers to a function or a
+    table of data to be supplied by an application program that uses
+    the facility, other than as an argument passed when the facility
+    is invoked, then you must make a good faith effort to ensure that,
+    in the event an application does not supply such function or
+    table, the facility still operates, and performs whatever part of
+    its purpose remains meaningful.
+
+    (For example, a function in a library to compute square roots has
+    a purpose that is entirely well-defined independent of the
+    application.  Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must
+    be optional: if the application does not supply it, the square
+    root function must still compute square roots.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Library,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Library, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Library.
+
+In addition, mere aggregation of another work not based on the Library
+with the Library (or with a work based on the Library) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may opt to apply the terms of the ordinary GNU General Public
+License instead of this License to a given copy of the Library.  To do
+this, you must alter all the notices that refer to this License, so
+that they refer to the ordinary GNU General Public License, version 2,
+instead of to this License.  (If a newer version than version 2 of the
+ordinary GNU General Public License has appeared, then you can specify
+that version instead if you wish.)  Do not make any other change in
+these notices.
+
+  Once this change is made in a given copy, it is irreversible for
+that copy, so the ordinary GNU General Public License applies to all
+subsequent copies and derivative works made from that copy.
+
+  This option is useful when you wish to copy part of the code of
+the Library into a program that is not a library.
+
+  4. You may copy and distribute the Library (or a portion or
+derivative of it, under Section 2) in object code or executable form
+under the terms of Sections 1 and 2 above provided that you accompany
+it with the complete corresponding machine-readable source code, which
+must be distributed under the terms of Sections 1 and 2 above on a
+medium customarily used for software interchange.
+
+  If distribution of object code is made by offering access to copy
+from a designated place, then offering equivalent access to copy the
+source code from the same place satisfies the requirement to
+distribute the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  5. A program that contains no derivative of any portion of the
+Library, but is designed to work with the Library by being compiled or
+linked with it, is called a "work that uses the Library".  Such a
+work, in isolation, is not a derivative work of the Library, and
+therefore falls outside the scope of this License.
+
+  However, linking a "work that uses the Library" with the Library
+creates an executable that is a derivative of the Library (because it
+contains portions of the Library), rather than a "work that uses the
+library".  The executable is therefore covered by this License.
+Section 6 states terms for distribution of such executables.
+
+  When a "work that uses the Library" uses material from a header file
+that is part of the Library, the object code for the work may be a
+derivative work of the Library even though the source code is not.
+Whether this is true is especially significant if the work can be
+linked without the Library, or if the work is itself a library.  The
+threshold for this to be true is not precisely defined by law.
+
+  If such an object file uses only numerical parameters, data
+structure layouts and accessors, and small macros and small inline
+functions (ten lines or less in length), then the use of the object
+file is unrestricted, regardless of whether it is legally a derivative
+work.  (Executables containing this object code plus portions of the
+Library will still fall under Section 6.)
+
+  Otherwise, if the work is a derivative of the Library, you may
+distribute the object code for the work under the terms of Section 6.
+Any executables containing that work also fall under Section 6,
+whether or not they are linked directly with the Library itself.
+
+  6. As an exception to the Sections above, you may also compile or
+link a "work that uses the Library" with the Library to produce a
+work containing portions of the Library, and distribute that work
+under terms of your choice, provided that the terms permit
+modification of the work for the customer's own use and reverse
+engineering for debugging such modifications.
+
+  You must give prominent notice with each copy of the work that the
+Library is used in it and that the Library and its use are covered by
+this License.  You must supply a copy of this License.  If the work
+during execution displays copyright notices, you must include the
+copyright notice for the Library among them, as well as a reference
+directing the user to the copy of this License.  Also, you must do one
+of these things:
+
+    a) Accompany the work with the complete corresponding
+    machine-readable source code for the Library including whatever
+    changes were used in the work (which must be distributed under
+    Sections 1 and 2 above); and, if the work is an executable linked
+    with the Library, with the complete machine-readable "work that
+    uses the Library", as object code and/or source code, so that the
+    user can modify the Library and then relink to produce a modified
+    executable containing the modified Library.  (It is understood
+    that the user who changes the contents of definitions files in the
+    Library will not necessarily be able to recompile the application
+    to use the modified definitions.)
+
+    b) Accompany the work with a written offer, valid for at
+    least three years, to give the same user the materials
+    specified in Subsection 6a, above, for a charge no more
+    than the cost of performing this distribution.
+
+    c) If distribution of the work is made by offering access to copy
+    from a designated place, offer equivalent access to copy the above
+    specified materials from the same place.
+
+    d) Verify that the user has already received a copy of these
+    materials or that you have already sent this user a copy.
+
+  For an executable, the required form of the "work that uses the
+Library" must include any data and utility programs needed for
+reproducing the executable from it.  However, as a special exception,
+the source code distributed need not include anything that is normally
+distributed (in either source or binary form) with the major
+components (compiler, kernel, and so on) of the operating system on
+which the executable runs, unless that component itself accompanies
+the executable.
+
+  It may happen that this requirement contradicts the license
+restrictions of other proprietary libraries that do not normally
+accompany the operating system.  Such a contradiction means you cannot
+use both them and the Library together in an executable that you
+distribute.
+
+  7. You may place library facilities that are a work based on the
+Library side-by-side in a single library together with other library
+facilities not covered by this License, and distribute such a combined
+library, provided that the separate distribution of the work based on
+the Library and of the other library facilities is otherwise
+permitted, and provided that you do these two things:
+
+    a) Accompany the combined library with a copy of the same work
+    based on the Library, uncombined with any other library
+    facilities.  This must be distributed under the terms of the
+    Sections above.
+
+    b) Give prominent notice with the combined library of the fact
+    that part of it is a work based on the Library, and explaining
+    where to find the accompanying uncombined form of the same work.
+
+  8. You may not copy, modify, sublicense, link with, or distribute
+the Library except as expressly provided under this License.  Any
+attempt otherwise to copy, modify, sublicense, link with, or
+distribute the Library is void, and will automatically terminate your
+rights under this License.  However, parties who have received copies,
+or rights, from you under this License will not have their licenses
+terminated so long as such parties remain in full compliance.
+
+  9. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Library or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Library (or any work based on the
+Library), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+  10. Each time you redistribute the Library (or any work based on the
+Library), the recipient automatically receives a license from the
+original licensor to copy, distribute, link with or modify the Library
+subject to these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  11. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Library at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Library by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  12. If the distribution and/or use of the Library is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Library under this License may add
+an explicit geographical distribution limitation excluding those countries,
+so that distribution is permitted only in or among countries not thus
+excluded.  In such case, this License incorporates the limitation as if
+written in the body of this License.
+
+  13. The Free Software Foundation may publish revised and/or new
+versions of the Library General Public License from time to time.
+Such new versions will be similar in spirit to the present version,
+but may differ in detail to address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Library
+specifies a version number of this License which applies to it and
+"any later version", you have the option of following the terms and
+conditions either of that version or of any later version published by
+the Free Software Foundation.  If the Library does not specify a
+license version number, you may choose any version ever published by
+the Free Software Foundation.
+
+  14. If you wish to incorporate parts of the Library into other free
+programs whose distribution conditions are incompatible with these,
+write to the author to ask for permission.  For software which is
+copyrighted by the Free Software Foundation, write to the Free
+Software Foundation; we sometimes make exceptions for this.  Our
+decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+			    NO WARRANTY
+
+  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+     Appendix: How to Apply These Terms to Your New Libraries
+
+  If you develop a new library, and you want it to be of the greatest
+possible use to the public, we recommend making it free software that
+everyone can redistribute and change.  You can do so by permitting
+redistribution under these terms (or, alternatively, under the terms of the
+ordinary General Public License).
+
+  To apply these terms, attach the following notices to the library.  It is
+safest to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least the
+"copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the library's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Library General Public
+    License as published by the Free Software Foundation; either
+    version 2 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Library General Public License for more details.
+
+    You should have received a copy of the GNU Library General Public
+    License along with this library; if not, write to the Free
+    Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the library, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+
+  <signature of Ty Coon>, 1 April 1990
+  Ty Coon, President of Vice
+
+That's all there is to it!
-- 
2.8.1


