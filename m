Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC53378E6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:28:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7DAS4ZR019400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 03:28:09 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 03:28:04 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 03:28:01 -0700
Message-ID: <20180813102801.30262-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180813102801.30262-1-hongzhi.song@windriver.com>
References: <20180813102801.30262-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v5 1/1] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Mon, 13 Aug 2018 10:28:13 -0000
Content-Type: text/plain

The recipe builds the framework for kernel-selftest. Now, it just
contains two sets of testcase, bpf and vm. We will append more to
this recipe.

The following kernel config fragments must be manually enabled,
i.e. in local.conf, to use this test suite.
KERNEL_FEATURES_append += "features/bpf/bpf.scc \
                        cfg/debug-kselftest.scc \
                   features/hugetlb/hugetlb.scc \
"

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../kernel-selftest/kernel-selftest.bb             | 105 ++++++
 ...bpf-test_progs.c-add-support-for-musllibc.patch |  25 ++
 ...-swap.h-micro-define-to-support-musl-libc.patch |  26 ++
 .../kernel-selftest/kernel-selftest/COPYING        | 356 +++++++++++++++++++++
 .../kernel-selftest/userfaultfd.patch              | 322 +++++++++++++++++++
 5 files changed, 834 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
new file mode 100644
index 000000000..e09831f76
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -0,0 +1,105 @@
+SUMMARY = "Kernel selftest for Linux"
+DESCRIPTION = "Kernel selftest for Linux"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
+"
+
+# for musl libc
+SRC_URI_libc-musl += "file://userfaultfd.patch \
+                      file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
+"
+
+PACKAGECONFIG ??= "bpf vm"
+
+PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
+PACKAGECONFIG[vm] = ",,,libgcc bash"
+
+do_patch[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit linux-kernel-base kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+S = "${WORKDIR}/${BP}"
+
+# now we just test bpf and vm
+# we will append other kernel selftest in the future
+TEST_LIST = "bpf \
+             vm \
+"
+
+EXTRA_OEMAKE = '\
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+    LD="${LD}" \
+'
+
+EXTRA_OEMAKE += "\
+    'DESTDIR=${D}' \
+"
+
+KERNEL_SELFTEST_SRC ?= "Makefile \
+                        include \
+                        tools \
+                        scripts \
+                        arch \
+			COPYING \
+"
+
+python __anonymous () {
+    import re
+
+    var = d.getVar('TARGET_CC_ARCH')
+    pattern = '_FORTIFY_SOURCE=[^0]'
+
+    if re.search(pattern, var):
+        d.appendVar('TARGET_CC_ARCH', " -O")
+}
+
+do_compile() {
+    for i in ${TEST_LIST}
+    do
+        oe_runmake -C ${S}/tools/testing/selftests/${i}
+    done
+}
+
+do_install() {
+    for i in ${TEST_LIST}
+    do
+        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
+    done
+
+    chown root:root  -R ${D}/usr/kernel-selftest
+}
+
+do_configure() {
+    :
+}
+
+do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
+python copy_kselftest_source_from_kernel() {
+    sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
+    src_dir = d.getVar("STAGING_KERNEL_DIR")
+    dest_dir = d.getVar("S")
+    bb.utils.mkdirhier(dest_dir)
+    for s in sources:
+        src = oe.path.join(src_dir, s)
+        dest = oe.path.join(dest_dir, s)
+        if os.path.isdir(src):
+            oe.path.copytree(src, dest)
+        else:
+            bb.utils.copyfile(src, dest)
+}
+
+remove_unrelated() {
+	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
+    sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT="1"
+FILES_${PN} += "/usr/kernel-selftest"
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
new file mode 100644
index 000000000..5f2542681
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
@@ -0,0 +1,25 @@
+From a2e6b8fde28b743b69990a4e16c296e099631ed4 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 23 Jul 2018 00:56:19 -0700
+Subject: [PATCH] bpf: test_progs.c add support for musllibc
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ tools/testing/selftests/bpf/test_progs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
+index 11ee25c..21b27b7 100644
+--- a/tools/testing/selftests/bpf/test_progs.c
++++ b/tools/testing/selftests/bpf/test_progs.c
+@@ -4,6 +4,7 @@
+  * modify it under the terms of version 2 of the GNU General Public
+  * License as published by the Free Software Foundation.
+  */
++#define __always_inline __inline __attribute__ ((__always_inline__))
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <errno.h>
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
new file mode 100644
index 000000000..e2245fc4c
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
@@ -0,0 +1,26 @@
+From c21dfb0dfdfec281479e267ad7fe9a8d4ba15a70 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 17 Jul 2018 23:47:48 -0700
+Subject: [PATCH] add micro define to support musl libc
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ recipe-sysroot/usr/include/linux/swab.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/recipe-sysroot/usr/include/linux/swab.h b/recipe-sysroot/usr/include/linux/swab.h
+index afb7eb7..33efa10 100644
+--- a/recipe-sysroot/usr/include/linux/swab.h
++++ b/recipe-sysroot/usr/include/linux/swab.h
+@@ -6,6 +6,8 @@
+ 
+ #include <asm/swab.h>
+ 
++#define __always_inline __inline __attribute__ ((__always_inline__))
++
+ /*
+  * casts are necessary for constants, because we never know how for sure
+  * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
new file mode 100644
index 000000000..ca442d313
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
@@ -0,0 +1,356 @@
+
+   NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+			Linus Torvalds
+
+----------------------------------------
+
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
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
+the GNU Library General Public License instead.)  You can apply it to
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
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
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
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
new file mode 100644
index 000000000..bed20510e
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
@@ -0,0 +1,322 @@
+From c7b375747cffb627d02543d946b28525455d7d46 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Fri, 13 Jul 2018 06:06:19 -0700
+Subject: [PATCH] vm: add some funtions to support musl libc
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ tools/testing/selftests/vm/userfaultfd.c | 298 +++++++++++++++++++++++++++++++
+ 1 file changed, 298 insertions(+)
+
+diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
+index de2f9ec..dc73021 100644
+--- a/tools/testing/selftests/vm/userfaultfd.c
++++ b/tools/testing/selftests/vm/userfaultfd.c
+@@ -71,6 +71,304 @@
+ 
+ #ifdef __NR_userfaultfd
+ 
++/* Linear congruential.  */
++#define	TYPE_0		0
++#define	BREAK_0		8
++#define	DEG_0		0
++#define	SEP_0		0
++
++/* x**7 + x**3 + 1.  */
++#define	TYPE_1		1
++#define	BREAK_1		32
++#define	DEG_1		7
++#define	SEP_1		3
++
++/* x**15 + x + 1.  */
++#define	TYPE_2		2
++#define	BREAK_2		64
++#define	DEG_2		15
++#define	SEP_2		1
++
++/* x**31 + x**3 + 1.  */
++#define	TYPE_3		3
++#define	BREAK_3		128
++#define	DEG_3		31
++#define	SEP_3		3
++
++/* x**63 + x + 1.  */
++#define	TYPE_4		4
++#define	BREAK_4		256
++#define	DEG_4		63
++#define	SEP_4		1
++
++/* Array versions of the above information to make code run faster.
++   Relies on fact that TYPE_i == i.  */
++
++#define	MAX_TYPES	5	/* Max number of types above.  */
++
++#define __set_errno(val) (errno = (val))
++
++struct random_data
++  {
++    int32_t *fptr;      /* Front pointer.  */
++    int32_t *rptr;      /* Rear pointer.  */
++    int32_t *state;     /* Array of state values.  */
++    int rand_type;      /* Type of random number generator.  */
++    int rand_deg;       /* Degree of random number generator.  */
++    int rand_sep;       /* Distance between front and rear.  */
++    int32_t *end_ptr;       /* Pointer behind state table.  */
++  };
++
++struct random_poly_info
++{
++  int seps[MAX_TYPES];
++  int degrees[MAX_TYPES];
++};
++
++static const struct random_poly_info random_poly_info =
++{
++  { SEP_0, SEP_1, SEP_2, SEP_3, SEP_4 },
++  { DEG_0, DEG_1, DEG_2, DEG_3, DEG_4 }
++};
++
++/* If we are using the trivial TYPE_0 R.N.G., just do the old linear
++   congruential bit.  Otherwise, we do our fancy trinomial stuff, which is the
++   same in all the other cases due to all the global variables that have been
++   set up.  The basic operation is to add the number at the rear pointer into
++   the one at the front pointer.  Then both pointers are advanced to the next
++   location cyclically in the table.  The value returned is the sum generated,
++   reduced to 31 bits by throwing away the "least random" low bit.
++   Note: The code takes advantage of the fact that both the front and
++   rear pointers can't wrap on the same call by not testing the rear
++   pointer if the front one has wrapped.  Returns a 31-bit random number.  */
++
++int random_r (struct random_data *buf, int32_t *result)
++{
++  int32_t *state;
++
++  if (buf == NULL || result == NULL)
++    goto fail;
++
++  state = buf->state;
++
++  if (buf->rand_type == TYPE_0)
++    {
++      int32_t val = ((state[0] * 1103515245U) + 12345U) & 0x7fffffff;
++      state[0] = val;
++      *result = val;
++    }
++  else
++    {
++      int32_t *fptr = buf->fptr;
++      int32_t *rptr = buf->rptr;
++      int32_t *end_ptr = buf->end_ptr;
++      uint32_t val;
++
++      val = *fptr += (uint32_t) *rptr;
++      /* Chucking least random bit.  */
++      *result = val >> 1;
++      ++fptr;
++      if (fptr >= end_ptr)
++	{
++	  fptr = state;
++	  ++rptr;
++	}
++      else
++	{
++	  ++rptr;
++	  if (rptr >= end_ptr)
++	    rptr = state;
++	}
++      buf->fptr = fptr;
++      buf->rptr = rptr;
++    }
++  return 0;
++
++ fail:
++  __set_errno (EINVAL);
++  return -1;
++}
++
++/* Initialize the random number generator based on the given seed.  If the
++   type is the trivial no-state-information type, just remember the seed.
++   Otherwise, initializes state[] based on the given "seed" via a linear
++   congruential generator.  Then, the pointers are set to known locations
++   that are exactly rand_sep places apart.  Lastly, it cycles the state
++   information a given number of times to get rid of any initial dependencies
++   introduced by the L.C.R.N.G.  Note that the initialization of randtbl[]
++   for default usage relies on values produced by this routine.  */
++int srandom_r (unsigned int seed, struct random_data *buf)
++{
++  int type;
++  int32_t *state;
++  long int i;
++  int32_t word;
++  int32_t *dst;
++  int kc;
++
++  if (buf == NULL)
++    goto fail;
++  type = buf->rand_type;
++  if ((unsigned int) type >= MAX_TYPES)
++    goto fail;
++
++  state = buf->state;
++  /* We must make sure the seed is not 0.  Take arbitrarily 1 in this case.  */
++  if (seed == 0)
++    seed = 1;
++  state[0] = seed;
++  if (type == TYPE_0)
++    goto done;
++
++  dst = state;
++  word = seed;
++  kc = buf->rand_deg;
++  for (i = 1; i < kc; ++i)
++    {
++      /* This does:
++	   state[i] = (16807 * state[i - 1]) % 2147483647;
++	 but avoids overflowing 31 bits.  */
++      long int hi = word / 127773;
++      long int lo = word % 127773;
++      word = 16807 * lo - 2836 * hi;
++      if (word < 0)
++	word += 2147483647;
++      *++dst = word;
++    }
++
++  buf->fptr = &state[buf->rand_sep];
++  buf->rptr = &state[0];
++  kc *= 10;
++  while (--kc >= 0)
++    {
++      int32_t discard;
++      (void) random_r (buf, &discard);
++    }
++
++ done:
++  return 0;
++
++ fail:
++  return -1;
++}
++
++/* Initialize the state information in the given array of N bytes for
++   future random number generation.  Based on the number of bytes we
++   are given, and the break values for the different R.N.G.'s, we choose
++   the best (largest) one we can and set things up for it.  srandom is
++   then called to initialize the state information.  Note that on return
++   from srandom, we set state[-1] to be the type multiplexed with the current
++   value of the rear pointer; this is so successive calls to initstate won't
++   lose this information and will be able to restart with setstate.
++   Note: The first thing we do is save the current state, if any, just like
++   setstate so that it doesn't matter when initstate is called.
++   Returns 0 on success, non-zero on failure.  */
++int initstate_r (unsigned int seed, char *arg_state, size_t n,
++	       struct random_data *buf)
++{
++  if (buf == NULL)
++    goto fail;
++
++  int32_t *old_state = buf->state;
++  if (old_state != NULL)
++    {
++      int old_type = buf->rand_type;
++      if (old_type == TYPE_0)
++	old_state[-1] = TYPE_0;
++      else
++	old_state[-1] = (MAX_TYPES * (buf->rptr - old_state)) + old_type;
++    }
++
++  int type;
++  if (n >= BREAK_3)
++    type = n < BREAK_4 ? TYPE_3 : TYPE_4;
++  else if (n < BREAK_1)
++    {
++      if (n < BREAK_0)
++	goto fail;
++
++      type = TYPE_0;
++    }
++  else
++    type = n < BREAK_2 ? TYPE_1 : TYPE_2;
++
++  int degree = random_poly_info.degrees[type];
++  int separation = random_poly_info.seps[type];
++
++  buf->rand_type = type;
++  buf->rand_sep = separation;
++  buf->rand_deg = degree;
++  int32_t *state = &((int32_t *) arg_state)[1];	/* First location.  */
++  /* Must set END_PTR before srandom.  */
++  buf->end_ptr = &state[degree];
++
++  buf->state = state;
++
++  srandom_r (seed, buf);
++
++  state[-1] = TYPE_0;
++  if (type != TYPE_0)
++    state[-1] = (buf->rptr - state) * MAX_TYPES + type;
++
++  return 0;
++
++ fail:
++  __set_errno (EINVAL);
++  return -1;
++}
++
++/* Restore the state from the given state array.
++   Note: It is important that we also remember the locations of the pointers
++   in the current state information, and restore the locations of the pointers
++   from the old state information.  This is done by multiplexing the pointer
++   location into the zeroth word of the state information. Note that due
++   to the order in which things are done, it is OK to call setstate with the
++   same state as the current state
++   Returns 0 on success, non-zero on failure.  */
++int setstate_r (char *arg_state, struct random_data *buf)
++{
++  int32_t *new_state = 1 + (int32_t *) arg_state;
++  int type;
++  int old_type;
++  int32_t *old_state;
++  int degree;
++  int separation;
++
++  if (arg_state == NULL || buf == NULL)
++    goto fail;
++
++  old_type = buf->rand_type;
++  old_state = buf->state;
++  if (old_type == TYPE_0)
++    old_state[-1] = TYPE_0;
++  else
++    old_state[-1] = (MAX_TYPES * (buf->rptr - old_state)) + old_type;
++
++  type = new_state[-1] % MAX_TYPES;
++  if (type < TYPE_0 || type > TYPE_4)
++    goto fail;
++
++  buf->rand_deg = degree = random_poly_info.degrees[type];
++  buf->rand_sep = separation = random_poly_info.seps[type];
++  buf->rand_type = type;
++
++  if (type != TYPE_0)
++    {
++      int rear = new_state[-1] / MAX_TYPES;
++      buf->rptr = &new_state[rear];
++      buf->fptr = &new_state[(rear + separation) % degree];
++    }
++  buf->state = new_state;
++  /* Set end_ptr too.  */
++  buf->end_ptr = &new_state[degree];
++
++  return 0;
++
++ fail:
++  __set_errno (EINVAL);
++  return -1;
++}
++
+ static unsigned long nr_cpus, nr_pages, nr_pages_per_cpu, page_size;
+ 
+ #define BOUNCE_RANDOM		(1<<0)
+-- 
+2.11.0
+
-- 
2.11.0


