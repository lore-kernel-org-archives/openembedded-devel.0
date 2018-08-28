Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id C34E572EB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:26:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 60-v6so248332ple.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bX5Ap0uH/E9V3yZzuakNpA8b87qogDuLp4jhi560P8A=;
	b=EVxfgQBC3mQFM3T5aaNO4ykwq1aRC4Mdnkpl308LVnEZEO/7AuW3d1dPuEGHs6kgc+
	iw3gdpld+Hh/5KCksPY5LVQb+9FRwM9YRKQRHd010PAKFaS95iFvcIrDnRS3Q/CF6QOh
	aIJnMI5ugcmDayzLDqgbBSrBGQI3NQCEZj+ipB/T1kN/iw1wrI0SgSSQIJx7IUzlD3Hi
	L50wOokVLOsCdafkQucoAjNbbnQBBmoRXRplz973YXKk6LF0432pSArJ6lRXBBtOyk5Y
	niG9wPUnDEF2XqKrf8ZN0AiPOB/MbkfyV34158QAetOCwfdC4USFuoRMSUU7WEKcnWiy
	YZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bX5Ap0uH/E9V3yZzuakNpA8b87qogDuLp4jhi560P8A=;
	b=kQJ39qaNtwgwmyrl95Ly4qN1vPCX7Vvshg0pN6D6z9lrLC8xUw2CkNCh9nWsfbORun
	ifd27QeSqgbNlXQpe9dg5GwEtSyqOjZkBX7sSVd6RHoXL3KeTj3VJxjIpLMPDFcyOg8m
	4zj2XZs/egysrqhVpXYncN+kRJrShpFxz/jH7E5gdZ48AraEXUVgtZbcF9GPuko8a1SP
	vuhPHSzVn3F35LLY57IMvAfD+XjBjRe2eMvMb58RQ7NDTc02Qpwt0lcsQU0FWEu9SzRc
	hBN66o72VMT4BMu3A3jWy9US+pez4p4IN6dJBn2xrYc6x9QFN7M7sXxpHybjcvKTKMuP
	vRNQ==
X-Gm-Message-State: APzg51BfW4gHxhQDBcFWKfp/OJ8SiEgiJ7KRBw6+uDSfjI6V6H9Myo5G
	FNUMXA4LzMGhnM90T/OYQs7RFSiw
X-Google-Smtp-Source: ANB0VdbrXE6xGAfSyVzo4NGhz3tnziJPT4jotQxHHu/D/VYK5P0DgpyomIFCSvq9cnnufBaWTe6eKw==
X-Received: by 2002:a17:902:a60a:: with SMTP id
	u10-v6mr3531plq.104.1535434018342; 
	Mon, 27 Aug 2018 22:26:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	z19-v6sm591401pgi.33.2018.08.27.22.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 22:26:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 22:26:46 -0700
Message-Id: <20180828052646.24444-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180828052646.24444-1-raj.khem@gmail.com>
References: <20180828052646.24444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] kernel-selftest: Fix the COPYING checksum variablity
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
X-List-Received-Date: Tue, 28 Aug 2018 05:26:57 -0000

COPYING coming from kernel sources but the md5 is static value
saved in recipe does not scale to all kind of machines which may
have different kernel providers filling in, therefore keep a static
copy of COPYING file as well, additionally copy LICENSES directory ( if
it exists) into sources where all the real license texts are living

Document need for clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  26 +-
 .../kernel-selftest/kernel-selftest/COPYING   | 358 +-----------------
 2 files changed, 26 insertions(+), 358 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 0d0aa6c5df..2a53419c22 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -2,16 +2,18 @@ SUMMARY = "Kernel selftest for Linux"
 DESCRIPTION = "Kernel selftest for Linux"
 LICENSE = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS = "rsync-native"
 
 # for musl libc
-SRC_URI_libc-musl += "file://userfaultfd.patch \
+SRC_URI_append_libc-musl = "\
+                      file://userfaultfd.patch \
                       file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
-"
+                      "
 SRC_URI += "file://run-ptest \
-"
+            file://COPYING \
+            "
 
 # now we just test bpf and vm
 # we will append other kernel selftest in the future
@@ -26,11 +28,9 @@ do_patch[depends] += "virtual/kernel:do_shared_workdir"
 
 inherit linux-kernel-base kernel-arch ptest
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
-
 S = "${WORKDIR}/${BP}"
 
-TEST_LIST = " \
+TEST_LIST = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf vm', d)} \
 "
 
@@ -48,7 +48,7 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
                         tools \
                         scripts \
                         arch \
-			COPYING \
+                        LICENSES \
 "
 
 python __anonymous () {
@@ -62,6 +62,9 @@ python __anonymous () {
 }
 
 do_compile() {
+    bbwarn "clang with bpf support is needed with kernel 4.18+ so \
+either install it and add it to HOSTTOOLS, or add \
+clang-native from meta-clang to dependency"
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
@@ -78,7 +81,7 @@ do_install() {
 }
 
 do_configure() {
-    :
+    install -D -m 0644 ${WORKDIR}/COPYING ${S}/COPYING
 }
 
 do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
@@ -99,7 +102,10 @@ python copy_kselftest_source_from_kernel() {
 remove_unrelated() {
     if ${@bb.utils.contains('PACKAGECONFIG','bpf','true','false',d)} ; then
         test -f ${S}/tools/testing/selftests/bpf/Makefile && \
-            sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e '/sockmap_verdict_prog/d' -e '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile || \
+            sed -i -e 's/test_pkt_access.*$/\\/' \
+                   -e 's/test_pkt_md_access.*$/\\/' \
+                   -e 's/sockmap_verdict_prog.*$/\\/' \
+                   ${S}/tools/testing/selftests/bpf/Makefile || \
             bberror "Your kernel is probably older than 4.10 and doesn't have tools/testing/selftests/bpf/Makefile file from https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d, disable bpf PACKAGECONFIG"
     fi
 }
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
index ca442d313d..da4cb28feb 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
@@ -1,356 +1,18 @@
+The Linux Kernel is provided under:
 
-   NOTE! This copyright does *not* cover user programs that use kernel
- services by normal system calls - this is merely considered normal use
- of the kernel, and does *not* fall under the heading of "derived work".
- Also note that the GPL below is copyrighted by the Free Software
- Foundation, but the instance of code that it refers to (the Linux
- kernel) is copyrighted by me and others who actually wrote it.
+	SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
 
- Also note that the only valid version of the GPL as far as the kernel
- is concerned is _this_ particular version of the license (ie v2, not
- v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+Being under the terms of the GNU General Public License version 2 only,
+according with:
 
-			Linus Torvalds
+	LICENSES/preferred/GPL-2.0
 
-----------------------------------------
+With an explicit syscall exception, as stated at:
 
-		    GNU GENERAL PUBLIC LICENSE
-		       Version 2, June 1991
+	LICENSES/exceptions/Linux-syscall-note
 
- Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
+In addition, other licenses may also apply. Please see:
 
-			    Preamble
+	Documentation/process/license-rules.rst
 
-  The licenses for most software are designed to take away your
-freedom to share and change it.  By contrast, the GNU General Public
-License is intended to guarantee your freedom to share and change free
-software--to make sure the software is free for all its users.  This
-General Public License applies to most of the Free Software
-Foundation's software and to any other program whose authors commit to
-using it.  (Some other Free Software Foundation software is covered by
-the GNU Library General Public License instead.)  You can apply it to
-your programs, too.
-
-  When we speak of free software, we are referring to freedom, not
-price.  Our General Public Licenses are designed to make sure that you
-have the freedom to distribute copies of free software (and charge for
-this service if you wish), that you receive source code or can get it
-if you want it, that you can change the software or use pieces of it
-in new free programs; and that you know you can do these things.
-
-  To protect your rights, we need to make restrictions that forbid
-anyone to deny you these rights or to ask you to surrender the rights.
-These restrictions translate to certain responsibilities for you if you
-distribute copies of the software, or if you modify it.
-
-  For example, if you distribute copies of such a program, whether
-gratis or for a fee, you must give the recipients all the rights that
-you have.  You must make sure that they, too, receive or can get the
-source code.  And you must show them these terms so they know their
-rights.
-
-  We protect your rights with two steps: (1) copyright the software, and
-(2) offer you this license which gives you legal permission to copy,
-distribute and/or modify the software.
-
-  Also, for each author's protection and ours, we want to make certain
-that everyone understands that there is no warranty for this free
-software.  If the software is modified by someone else and passed on, we
-want its recipients to know that what they have is not the original, so
-that any problems introduced by others will not reflect on the original
-authors' reputations.
-
-  Finally, any free program is threatened constantly by software
-patents.  We wish to avoid the danger that redistributors of a free
-program will individually obtain patent licenses, in effect making the
-program proprietary.  To prevent this, we have made it clear that any
-patent must be licensed for everyone's free use or not licensed at all.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.
-
-		    GNU GENERAL PUBLIC LICENSE
-   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  0. This License applies to any program or other work which contains
-a notice placed by the copyright holder saying it may be distributed
-under the terms of this General Public License.  The "Program", below,
-refers to any such program or work, and a "work based on the Program"
-means either the Program or any derivative work under copyright law:
-that is to say, a work containing the Program or a portion of it,
-either verbatim or with modifications and/or translated into another
-language.  (Hereinafter, translation is included without limitation in
-the term "modification".)  Each licensee is addressed as "you".
-
-Activities other than copying, distribution and modification are not
-covered by this License; they are outside its scope.  The act of
-running the Program is not restricted, and the output from the Program
-is covered only if its contents constitute a work based on the
-Program (independent of having been made by running the Program).
-Whether that is true depends on what the Program does.
-
-  1. You may copy and distribute verbatim copies of the Program's
-source code as you receive it, in any medium, provided that you
-conspicuously and appropriately publish on each copy an appropriate
-copyright notice and disclaimer of warranty; keep intact all the
-notices that refer to this License and to the absence of any warranty;
-and give any other recipients of the Program a copy of this License
-along with the Program.
-
-You may charge a fee for the physical act of transferring a copy, and
-you may at your option offer warranty protection in exchange for a fee.
-
-  2. You may modify your copy or copies of the Program or any portion
-of it, thus forming a work based on the Program, and copy and
-distribute such modifications or work under the terms of Section 1
-above, provided that you also meet all of these conditions:
-
-    a) You must cause the modified files to carry prominent notices
-    stating that you changed the files and the date of any change.
-
-    b) You must cause any work that you distribute or publish, that in
-    whole or in part contains or is derived from the Program or any
-    part thereof, to be licensed as a whole at no charge to all third
-    parties under the terms of this License.
-
-    c) If the modified program normally reads commands interactively
-    when run, you must cause it, when started running for such
-    interactive use in the most ordinary way, to print or display an
-    announcement including an appropriate copyright notice and a
-    notice that there is no warranty (or else, saying that you provide
-    a warranty) and that users may redistribute the program under
-    these conditions, and telling the user how to view a copy of this
-    License.  (Exception: if the Program itself is interactive but
-    does not normally print such an announcement, your work based on
-    the Program is not required to print an announcement.)
-
-These requirements apply to the modified work as a whole.  If
-identifiable sections of that work are not derived from the Program,
-and can be reasonably considered independent and separate works in
-themselves, then this License, and its terms, do not apply to those
-sections when you distribute them as separate works.  But when you
-distribute the same sections as part of a whole which is a work based
-on the Program, the distribution of the whole must be on the terms of
-this License, whose permissions for other licensees extend to the
-entire whole, and thus to each and every part regardless of who wrote it.
-
-Thus, it is not the intent of this section to claim rights or contest
-your rights to work written entirely by you; rather, the intent is to
-exercise the right to control the distribution of derivative or
-collective works based on the Program.
-
-In addition, mere aggregation of another work not based on the Program
-with the Program (or with a work based on the Program) on a volume of
-a storage or distribution medium does not bring the other work under
-the scope of this License.
-
-  3. You may copy and distribute the Program (or a work based on it,
-under Section 2) in object code or executable form under the terms of
-Sections 1 and 2 above provided that you also do one of the following:
-
-    a) Accompany it with the complete corresponding machine-readable
-    source code, which must be distributed under the terms of Sections
-    1 and 2 above on a medium customarily used for software interchange; or,
-
-    b) Accompany it with a written offer, valid for at least three
-    years, to give any third party, for a charge no more than your
-    cost of physically performing source distribution, a complete
-    machine-readable copy of the corresponding source code, to be
-    distributed under the terms of Sections 1 and 2 above on a medium
-    customarily used for software interchange; or,
-
-    c) Accompany it with the information you received as to the offer
-    to distribute corresponding source code.  (This alternative is
-    allowed only for noncommercial distribution and only if you
-    received the program in object code or executable form with such
-    an offer, in accord with Subsection b above.)
-
-The source code for a work means the preferred form of the work for
-making modifications to it.  For an executable work, complete source
-code means all the source code for all modules it contains, plus any
-associated interface definition files, plus the scripts used to
-control compilation and installation of the executable.  However, as a
-special exception, the source code distributed need not include
-anything that is normally distributed (in either source or binary
-form) with the major components (compiler, kernel, and so on) of the
-operating system on which the executable runs, unless that component
-itself accompanies the executable.
-
-If distribution of executable or object code is made by offering
-access to copy from a designated place, then offering equivalent
-access to copy the source code from the same place counts as
-distribution of the source code, even though third parties are not
-compelled to copy the source along with the object code.
-
-  4. You may not copy, modify, sublicense, or distribute the Program
-except as expressly provided under this License.  Any attempt
-otherwise to copy, modify, sublicense or distribute the Program is
-void, and will automatically terminate your rights under this License.
-However, parties who have received copies, or rights, from you under
-this License will not have their licenses terminated so long as such
-parties remain in full compliance.
-
-  5. You are not required to accept this License, since you have not
-signed it.  However, nothing else grants you permission to modify or
-distribute the Program or its derivative works.  These actions are
-prohibited by law if you do not accept this License.  Therefore, by
-modifying or distributing the Program (or any work based on the
-Program), you indicate your acceptance of this License to do so, and
-all its terms and conditions for copying, distributing or modifying
-the Program or works based on it.
-
-  6. Each time you redistribute the Program (or any work based on the
-Program), the recipient automatically receives a license from the
-original licensor to copy, distribute or modify the Program subject to
-these terms and conditions.  You may not impose any further
-restrictions on the recipients' exercise of the rights granted herein.
-You are not responsible for enforcing compliance by third parties to
-this License.
-
-  7. If, as a consequence of a court judgment or allegation of patent
-infringement or for any other reason (not limited to patent issues),
-conditions are imposed on you (whether by court order, agreement or
-otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot
-distribute so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you
-may not distribute the Program at all.  For example, if a patent
-license would not permit royalty-free redistribution of the Program by
-all those who receive copies directly or indirectly through you, then
-the only way you could satisfy both it and this License would be to
-refrain entirely from distribution of the Program.
-
-If any portion of this section is held invalid or unenforceable under
-any particular circumstance, the balance of the section is intended to
-apply and the section as a whole is intended to apply in other
-circumstances.
-
-It is not the purpose of this section to induce you to infringe any
-patents or other property right claims or to contest validity of any
-such claims; this section has the sole purpose of protecting the
-integrity of the free software distribution system, which is
-implemented by public license practices.  Many people have made
-generous contributions to the wide range of software distributed
-through that system in reliance on consistent application of that
-system; it is up to the author/donor to decide if he or she is willing
-to distribute software through any other system and a licensee cannot
-impose that choice.
-
-This section is intended to make thoroughly clear what is believed to
-be a consequence of the rest of this License.
-
-  8. If the distribution and/or use of the Program is restricted in
-certain countries either by patents or by copyrighted interfaces, the
-original copyright holder who places the Program under this License
-may add an explicit geographical distribution limitation excluding
-those countries, so that distribution is permitted only in or among
-countries not thus excluded.  In such case, this License incorporates
-the limitation as if written in the body of this License.
-
-  9. The Free Software Foundation may publish revised and/or new versions
-of the General Public License from time to time.  Such new versions will
-be similar in spirit to the present version, but may differ in detail to
-address new problems or concerns.
-
-Each version is given a distinguishing version number.  If the Program
-specifies a version number of this License which applies to it and "any
-later version", you have the option of following the terms and conditions
-either of that version or of any later version published by the Free
-Software Foundation.  If the Program does not specify a version number of
-this License, you may choose any version ever published by the Free Software
-Foundation.
-
-  10. If you wish to incorporate parts of the Program into other free
-programs whose distribution conditions are different, write to the author
-to ask for permission.  For software which is copyrighted by the Free
-Software Foundation, write to the Free Software Foundation; we sometimes
-make exceptions for this.  Our decision will be guided by the two goals
-of preserving the free status of all derivatives of our free software and
-of promoting the sharing and reuse of software generally.
-
-			    NO WARRANTY
-
-  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-REPAIR OR CORRECTION.
-
-  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGES.
-
-		     END OF TERMS AND CONDITIONS
-
-	    How to Apply These Terms to Your New Programs
-
-  If you develop a new program, and you want it to be of the greatest
-possible use to the public, the best way to achieve this is to make it
-free software which everyone can redistribute and change under these terms.
-
-  To do so, attach the following notices to the program.  It is safest
-to attach them to the start of each source file to most effectively
-convey the exclusion of warranty; and each file should have at least
-the "copyright" line and a pointer to where the full notice is found.
-
-    <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) <year>  <name of author>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-
-
-Also add information on how to contact you by electronic and paper mail.
-
-If the program is interactive, make it output a short notice like this
-when it starts in an interactive mode:
-
-    Gnomovision version 69, Copyright (C) year name of author
-    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-    This is free software, and you are welcome to redistribute it
-    under certain conditions; type `show c' for details.
-
-The hypothetical commands `show w' and `show c' should show the appropriate
-parts of the General Public License.  Of course, the commands you use may
-be called something other than `show w' and `show c'; they could even be
-mouse-clicks or menu items--whatever suits your program.
-
-You should also get your employer (if you work as a programmer) or your
-school, if any, to sign a "copyright disclaimer" for the program, if
-necessary.  Here is a sample; alter the names:
-
-  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
-
-This General Public License does not permit incorporating your program into
-proprietary programs.  If your program is a subroutine library, you may
-consider it more useful to permit linking proprietary applications with the
-library.  If this is what you want to do, use the GNU Library General
-Public License instead of this License.
+for more details.
-- 
2.18.0


