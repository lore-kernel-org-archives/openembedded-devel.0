Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D35A77886C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9irS013315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:44 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:12 -0500
Message-ID: <3c85238dba66191e55ba64d13d0a3e09ba0792fc.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/15] meta-installer: add recipe anaconda-init
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:44 -0000
Content-Type: text/plain

The init script to boot anaconda at startup.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../anaconda-init/anaconda-init.bb                 |  77 +++++
 .../anaconda-init/anaconda-init/COPYING            | 339 +++++++++++++++++++
 .../anaconda-init/anaconda-init/Xusername          |   1 +
 .../anaconda-init/anaconda-init/anaconda-init      | 362 +++++++++++++++++++++
 .../anaconda-init/anaconda-init-screen@.service    |  22 ++
 .../anaconda-init/anaconda-init.service            |  13 +
 .../anaconda-init/anaconda-init.target             |   6 +
 7 files changed, 820 insertions(+)
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init.bb
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/COPYING
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/Xusername
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init-screen@.service
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.service
 create mode 100644 meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.target

diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init.bb b/meta-installer/recipes-installer/anaconda-init/anaconda-init.bb
new file mode 100644
index 0000000..a7da0c5
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init.bb
@@ -0,0 +1,77 @@
+DESCRIPTION = "Simple Init Script for Anaconda"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "file://anaconda-init \
+           file://anaconda-init.service \
+           file://anaconda-init-screen@.service \
+           file://anaconda-init.target \
+           file://Xusername \
+           file://COPYING"
+
+S = "${WORKDIR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# For nm-online
+#RDEPENDS_${PN} = "networkmanager-tests"
+
+# For mount -oloop=/dev/loopX, busybox's mount doesn't support this.
+RDEPENDS_${PN} = "util-linux"
+
+# While systemd, we need screen to control anaconda-init first boot
+RDEPENDS_${PN} += " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'screen', '', d)} \
+"
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "anaconda-init.service \
+                         anaconda-init-screen@.service \
+                         anaconda-init.target \
+"
+
+CLEANBROKEN = "1"
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install -m 0755 ${WORKDIR}/anaconda-init ${D}${sbindir}/anaconda-init
+    if [ -n "${EULA_DIR}" ]; then
+        sed -i "s#@EULA_DIR@#${EULA_DIR}#g" ${D}${sbindir}/anaconda-init
+    else
+        bbwarn "EULA_DIR is NULL, please set it in a local conf"
+        bbwarn "The EULA_DIR helps user to locate End User License Agreement during image installation"
+        sed -i "s#@EULA_DIR@##g" ${D}${sbindir}/anaconda-init
+    fi
+    install -d ${D}/${sysconfdir}
+    install -d ${D}/${sysconfdir}/init.d
+    ln -sf ${sbindir}/anaconda-init ${D}/${sysconfdir}/init.d/anaconda-init
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/anaconda-init.service \
+                    ${WORKDIR}/anaconda-init-screen@.service \
+                    ${WORKDIR}/anaconda-init.target \
+               ${D}${systemd_unitdir}/system
+
+
+    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@ROOT_HOME@,${ROOT_HOME},g' ${D}${systemd_unitdir}/system/anaconda-init.service \
+                                                                           ${D}${systemd_unitdir}/system/anaconda-init-screen@.service
+    if [ "${ROOTLESS_X}" = "1" ] ; then
+        install -d ${D}/etc/X11
+        install Xusername ${D}/etc/X11
+    fi
+}
+
+inherit update-rc.d useradd
+
+INITSCRIPT_NAME = "anaconda-init"
+INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 20 0 1 6 ."
+
+# Use fixed Xusername of xuser for now, this will need to be
+# fixed if the Xusername changes from xuser
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--create-home \
+                       --groups video,tty,audio \
+                       --user-group xuser"
+
+# Location of End User License Agreement
+EULA_DIR ??= ""
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/COPYING b/meta-installer/recipes-installer/anaconda-init/anaconda-init/COPYING
new file mode 100644
index 0000000..d511905
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/COPYING
@@ -0,0 +1,339 @@
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Lesser General Public License instead.)  You can apply it to
+your programs, too.
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
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
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
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, write to the Free Software Foundation, Inc.,
+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Lesser General
+Public License instead of this License.
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/Xusername b/meta-installer/recipes-installer/anaconda-init/anaconda-init/Xusername
new file mode 100644
index 0000000..7060e5e
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/Xusername
@@ -0,0 +1 @@
+xuser
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init
new file mode 100644
index 0000000..f9afc44
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init
@@ -0,0 +1,362 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: xserver
+# Required-Start: $local_fs $remote_fs dbus
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+# Don't reboot when failed
+stoponfail="1"
+EXTRA_ENVS="LANG=$LANG "
+EULA_DIR="@EULA_DIR@"
+EXTRA_ENVS="$EXTRA_ENVS EULA_DIR=$EULA_DIR"
+
+export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
+
+[ -z "$CMDLINE" ] && read CMDLINE < /proc/cmdline
+for x in $CMDLINE; do
+        case $x in
+        cmdline)
+            cmdline=1
+            ;;
+        headless)
+            headless=1
+            ;;
+        kbdtype=*)
+            kbdtype="${x#kbdtype=}"
+            ;;
+        keymap=*)
+            keymap="${x#keymap=}"
+            ;;
+        ks=*)
+            ks="${x#ks=}"
+            ;;
+        lang=*)
+            lang="${x#lang=}"
+            ;;
+        bootifonly=*)
+            bootifonly="${x#bootifonly=}"
+            ;;
+        stoponfail=*)
+            stoponfail="${x#stoponfail=}"
+            ;;
+        liveinst)
+            liveinst=1
+            ;;
+        loglevel=*)
+            loglevel="${x#loglevel=}"
+            ;;
+        mpath)
+            mpath=1
+            ;;
+        noinstall)
+            noinstall=1
+            ;;
+        nompath)
+            nompath=1
+            ;;
+        repo=*)
+            repo="${x#repo=}"
+            ;;
+        rescue)
+            rescue=1
+            ;;
+        resolution=*)
+            resolution="${x#resolution=}"
+            ;;
+        serial|console=*)
+            textinst=1
+            ;;
+        syslog=*)
+            syslog="${x#syslog=}"
+            ;;
+        textinst)
+            textinst=1
+            ;;
+        updates=*)
+            updates="${x#updates=}"
+            ;;
+        usefbx)
+            usefbx=1
+            ;;
+        vnc)
+            vnc=1
+            ;;
+        vncconnect=*)
+            vncconnect="${x#vncconnect=}"
+            ;;
+        vncpassword=*)
+            vncpassword="${x#vncpassword=}"
+            ;;
+        xdriver=*)
+            xdriver="${x#xdriver=}"
+            ;;
+        esac
+done
+
+# Check which rootfs to be installed
+blist="/.target_build_list"
+if [ -f "$blist" ]; then
+    lines=`cat $blist | wc -l`
+    if [ $lines -gt 1 ]; then
+        echo ""
+        echo "=============== Found the following products ==============="
+        for lineno in `seq $lines`; do
+            echo "  $lineno) `sed -n "${lineno}p" $blist | sed -e 's/^:://' -e 's/::/\t/g'`"
+        done
+        while true; do
+            echo ""
+            echo -n "Please enter your choice (0 to quit): "
+            read choice
+            right_choice=0
+            if [ "$choice" = "0" ]; then
+                exit 1
+            fi
+            for cnt in `seq $lines`; do
+                if [ "$cnt" = "$choice" ]; then
+                    right_choice=1
+                    break
+                fi
+            done
+            if [ $right_choice -eq 1 ]; then
+                break
+            else
+                echo "Invalid choice: $choice, it should be one of: " `seq $lines`
+            fi
+        done
+        prj_name="`sed -n "${choice}p" $blist | awk -F:: '{print $2}'`"
+        entries=".buildstamp LiveOS Packages installer-config/ks.cfg"
+        for f in $entries; do
+            if [ -e /$f.$prj_name ]; then
+                ln -sf `basename $f.$prj_name` /$f
+            fi
+        done
+    fi
+fi
+
+case "$1" in
+  start)
+       # configure X, allowing user to override xdriver
+       if [ -n "$xdriver" ]; then
+           mkdir -p /etc/X11/xorg.conf.d/
+           cat > /etc/X11/xorg.conf.d/00-xdriver.conf <<FOE
+Section "Device"
+        Identifier      "Videocard0"
+        Driver  "$xdriver"
+EndSection
+FOE
+       fi
+
+       . /etc/profile
+       username=root
+       echo "Starting Anaconda"
+       if [ -f /etc/X11/Xusername ]; then
+           username=`cat /etc/X11/Xusername`
+           # setting for rootless X
+           chmod o+w /var/log
+           chmod g+r /dev/tty[0-3]
+           chmod o+rw /dev/input/*
+           # hidraw device is probably needed
+           if [ -e /dev/hidraw0 ]; then
+               chmod o+rw /dev/hidraw*
+           fi
+       fi
+
+       if [ -n "$textinst" ]; then
+           anaconda_opts="$anaconda_opts --text"
+	   # Quiet kernel logs, this can be undone in a kickstart file
+	   echo 1 > /proc/sys/kernel/printk
+       fi
+
+       if [ -n "$vncpassword" ]; then
+           echo "$vncpassword" > /tmp/vncpassword.dat
+       fi
+
+       for OPTIONS in vnc headless usefbx mpath nompath rescue cmdline; do
+           if [ -n "${!OPTIONS}" ]; then
+               anaconda_opts="$anaconda_opts --$OPTIONS"
+           fi
+       done
+
+       for OPTIONS in resolution vncconnect xdriver syslog loglevel lang kbdtype keymap repo; do
+           if [ -n "${!OPTIONS}" ]; then
+               anaconda_opts="$anaconda_opts --$OPTIONS=${!OPTIONS}"
+           fi
+       done
+
+       KICKSTART_FILE="/installer-config/ks.cfg"
+
+       if [ -n "$ks" ]; then
+           anaconda_opts="$anaconda_opts --kickstart=$ks"
+       elif [ -e $KICKSTART_FILE ]; then
+           anaconda_opts="$anaconda_opts --kickstart=/installer-config/ks.cfg"
+       fi
+
+       ROOT_IMAGE="/LiveOS/rootfs.img"
+       ROOT_IMAGE_DEV="/dev/loop3"
+       if [ -e $ROOT_IMAGE ]; then
+           ROOT_IMAGE="`realpath $ROOT_IMAGE`"
+           losetup -a | grep -q $ROOT_IMAGE
+           if [ $? -eq 0 ]; then
+               echo "Skipping mounting $ROOT_IMAGE since it is already setup."
+           else
+               losetup -r $ROOT_IMAGE_DEV $ROOT_IMAGE
+               [ $? -eq 0 ] || exit 1
+           fi
+           anaconda_opts="$anaconda_opts --liveinst --method=livecd:$ROOT_IMAGE_DEV"
+       elif [ -n "$liveinst" ]; then
+               echo "ERROR: no $ROOT_IMAGE" >&2
+               exit 1
+       fi
+
+       BOOTIF=`cat /proc/cmdline |xargs -n1 echo |grep BOOTIF=`
+       BOOTIF=${BOOTIF#BOOTIF=01-}
+       BOOTIF=${BOOTIF//-/:}
+       FOUND_IFACE=0
+       ignore_addr=""
+
+       # Create Fedora-style network configuration files needed by anaconda
+       NETDIR=/etc/sysconfig/network-scripts
+       mkdir -p $NETDIR
+       for i in `ls /sys/class/net`
+       do
+           touch $NETDIR/ifcfg-$i
+           if [ "$bootifonly" != 1 -o "$BOOTIF" = "" -o ! -f /sys/class/net/$i/address ] ; then
+               continue
+           fi
+           hwaddr=`cat /sys/class/net/$i/address`
+           if [ "$hwaddr" != "$BOOTIF" ] ; then
+               ignore_addr="mac:$hwaddr;$ignore_addr"
+           else
+               FOUND_IFACE=1
+           fi
+       done
+       if [ $FOUND_IFACE = 1 -a "$ignore_addr" != "" ] ; then
+           echo "" >> /etc/NetworkManager/NetworkManager.conf
+           echo "[keyfile]" >> /etc/NetworkManager/NetworkManager.conf
+           echo unmanaged-devices="${ignore_addr%;}" >> /etc/NetworkManager/NetworkManager.conf
+       fi
+
+       PRODUCT_IMG_FILE="/run/initramfs/live/images/product.img"
+       PRODUCT_DISK="/tmp/product-disk"
+       PRODUCT_DIR="/tmp/product"
+
+       UPDATES_IMG_FILE="/run/initramfs/live/images/updates.img"
+       UPDATES_DISK="/tmp/update-disk"
+       UPDATES_DIR="/tmp/updates"
+
+       if [ -e "$PRODUCT_IMG_FILE" ]; then
+           mkdir $PRODUCT_DIR
+           if [ ! -z "$(file $PRODUCT_IMG_FILE | grep 'gzip compressed data')" ]; then
+               ( cd $PRODUCT_DIR ; gzip -dc $PRODUCT_IMG_FILE | cpio -id )
+           else
+               mkdir $PRODUCT_DISK
+               mount -t auto $PRODUCT_IMG_FILE $PRODUCT_DISK
+               cp -Rt $PRODUCT_DIR $PRODUCT_DISK/*
+               umount $PRODUCT_DISK
+               rmdir $PRODUCT_DISK
+           fi
+       fi
+
+       if [ -e "$UPDATES_IMG_FILE" ]; then
+           mkdir $UPDATES_DIR
+           if [ ! -z "$(file $UPDATES_IMG_FILE | grep 'gzip compressed data')" ]; then
+               ( cd $UPDATES_DIR ; gzip -dc $UPDATES_IMG_FILE | cpio -id )
+           else
+               mkdir $UPDATES_DISK
+               mount -t auto $UPDATES_IMG_FILE $UPDATES_DISK
+               cp -Rt $UPDATES_DIR $UPDATES_DISK/*
+               umount $UPDATES_DISK
+               rmdir $UPDATES_DISK
+           fi
+       fi
+
+       # Set up the updates, if provided.
+       if [ ! -z "$updates" ]; then
+           if [ -e $UPDATES_IMG_FILE -o -e $UPDATES_DIR ]; then
+               echo "The option updates= was provided, but an updates image already exists.  Please remove $UPDATES_IMG_FILE and $UPDATES_DIR and try again."
+               exit 1
+           fi
+
+           # Add a barrier to ensure that networking is up before running curl
+           #nm-online -q --timeout=30
+           #
+           #if [ $? -eq 0 ]; then
+           #    curl --retry 3 --retry-max-time 30 -o /tmp/updates.img $updates
+           #else
+           #    echo "anaconda-init: Could not detect if NetworkManager was online."
+           #    exit 1
+           #fi
+
+           mkdir $UPDATES_DIR
+           # We officially support two updates.img formats:  a filesystem image, and
+           # a compressed cpio blob.
+           if [ ! -e /tmp/updates.img ]; then
+               echo "The option updates= was provided, but an updates image could not be retrieved. Please verify the path and try again."
+               exit 1
+           elif [ ! -z "$(file /tmp/updates.img | grep 'gzip compressed data')" ]; then
+               ( cd $UPDATES_DIR ; gzip -dc /tmp/updates.img | cpio -id )
+           else
+               mkdir $UPDATES_DISK
+               mount -t auto /tmp/updates.img $UPDATES_DISK
+               cp -Rt $UPDATES_DIR $UPDATES_DISK/*
+               umount $UPDATES_DISK
+               rmdir $UPDATES_DISK
+           fi
+
+           export PYTHONPATH=/tmp/updates:$PYTHONPATH
+           export LD_LIBRARY_PATH=/tmp/updates:$LD_LIBRARY_PATH
+           export PATH=/tmp/updates:$PATH
+       fi
+
+       # Add a barrier here to ensure that networking is up before running Anaconda
+       #nm-online -q --timeout=30
+       #if [ $? -eq 2 ]; then
+       #    echo "anaconda-init: Could not detect if NetworkManager was online."
+       #    exit 1
+       #fi
+
+       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
+       if [ -n "$noinstall" ]; then
+           echo "Bypassing installer..."
+       else
+           su -l -c "$EXTRA_ENVS /usr/sbin/anaconda $anaconda_opts 2>&1" $username
+           if [ "$stoponfail" != 1 ] ; then
+               echo "Rebooting system..."
+               /sbin/reboot -f
+           fi
+       fi
+
+       if [ "$stoponfail" = 1 ] ; then
+           killall Xorg
+           stty sane
+           echo ""
+           echo "Starting FAIL shell"
+           export HOME="/root"
+           /bin/sh
+       fi
+  ;;
+
+  stop)
+        echo "Stopping Anaconda"
+        killall anaconda
+        killall Xorg
+        killall Xvnc
+  ;;
+
+  restart)
+        $0 stop
+        sleep 1
+        $0 start
+  ;;
+
+  *)
+        echo "usage: $0 { start | stop | restart }"
+  ;;
+esac
+
+exit 0
+
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init-screen@.service b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init-screen@.service
new file mode 100644
index 0000000..a4b3050
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init-screen@.service
@@ -0,0 +1,22 @@
+[Unit]
+Description=Anaconda Text Console
+Requires=anaconda-init.service
+After=anaconda-init.target anaconda-init.service
+
+[Service]
+Type=idle
+WorkingDirectory=@ROOT_HOME@
+Environment=LANG=en_US.UTF-8
+ExecStart=/usr/bin/screen -x anaconda-init
+StandardInput=tty
+StandardOutput=tty
+TTYPath=/dev/%I
+TTYReset=yes
+TTYVHangup=yes
+TTYVTDisallocate=yes
+Restart=always
+RestartSec=0
+
+[Install]
+WantedBy=getty.target
+DefaultInstance=tty1
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.service b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.service
new file mode 100644
index 0000000..3275282
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Anaconda Installer Daemon
+After=network.target
+After=anaconda-init.target
+
+[Service]
+Type=forking
+Environment=HOME=@ROOT_HOME@ MALLOC_CHECK_=2 MALLOC_PERTURB_=204 PATH=/usr/bin:/bin:/sbin:/usr/sbin:/mnt/sysimage/bin:/mnt/sysimage/usr/bin:/mnt/sysimage/usr/sbin:/mnt/sysimage/sbin LANG=en_US.UTF-8 GDK_BACKEND=x11 XDG_RUNTIME_DIR=/tmp GIO_USE_VFS=local
+WorkingDirectory=@ROOT_HOME@
+ExecStart=/usr/bin/screen -dmS anaconda-init /usr/sbin/anaconda-init start
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.target b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.target
new file mode 100644
index 0000000..1886399
--- /dev/null
+++ b/meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.target
@@ -0,0 +1,6 @@
+[Unit]
+Description=The anaconda installation program
+Requires=basic.target
+Conflicts=rescue.service rescue.target
+After=basic.target rescue.service rescue.target
+AllowIsolate=yes
-- 
2.8.1


