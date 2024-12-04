Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B5E7716E
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 11:44:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12128.1733312684212324811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 03:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA683FEC
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Dec 2024 03:45:11 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24A8D3F71E
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Dec 2024 03:44:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] xserver-common: remove obsolete recipe
Date: Wed,  4 Dec 2024 11:44:40 +0000
Message-Id: <20241204114441.1323741-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 11:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114197

Everyone should be using x11-common now (in oe-core) and this recipe
hasn't been touched since 2018, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 -
 .../0001-COPYING-add-GPLv2-license-file.patch | 364 ------------------
 ...01-Don-t-install-Xsession-or-Xserver.patch |  30 --
 .../0002-add-setdpi-Xinit.d-script.patch      | 112 ------
 ...d-support-for-etc-X11-xserver-system.patch |  26 --
 ...ns-file-instead-etc-init.d-functions.patch |  87 -----
 ...dd-dpi-and-nocursor-params-for-gta01.patch |  40 --
 ...dd-support-for-n900-alias-nokia_rx-5.patch |  31 --
 ...dd-support-for-nexus-S-alias-herring.patch |  27 --
 ...dd-support-for-nexus-one-alias-mahim.patch |  27 --
 ...dd-support-for-gta04-alias-OpenPhoen.patch |  32 --
 ...dd-support-for-tuna-alias-Galaxy-Nex.patch |  32 --
 ...erver-common-disable-TCP-connections.patch |  26 --
 .../xserver-common/xserver-common_1.34.bb     |  43 ---
 14 files changed, 878 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0001-COPYING-add-GPLv2-license-file.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0002-add-setdpi-Xinit.d-script.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0006-add-support-for-etc-X11-xserver-system.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n-1.34/0015-xserver-common-disable-TCP-connections.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-commo=
n_1.34.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8198c05d74..cffd2d687d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -597,7 +597,6 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
     xrdb \
     xrefresh \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "=
", d)} \
-    xserver-common \
     xsetroot \
     xstdcmap \
     xterm \
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0001-COPYING-add-GPLv2-license-file.patch b/meta-oe/recipes-graphics/xser=
ver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
deleted file mode 100644
index 6f738e7376..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-CO=
PYING-add-GPLv2-license-file.patch
+++ /dev/null
@@ -1,364 +0,0 @@
-From f919725918fad2b32504f89a28310fcae4ab0406 Mon Sep 17 00:00:00 2001
-From: Yu Ke <ke.yu@intel.com>
-Date: Wed, 11 Apr 2012 14:26:16 +0200
-Subject: [PATCH] COPYING: add GPLv2 license file
-
-this is a local file recipe and the license file is missing.In order
-to pass the license checksum checking, the license file is needed. So
-this patch add the GPLv2 license file.
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- COPYING | 339 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
- 1 file changed, 339 insertions(+)
- create mode 100644 COPYING
-
-diff --git a/COPYING b/COPYING
-new file mode 100644
-index 0000000..d511905
---- /dev/null
-+++ b/COPYING
-@@ -0,0 +1,339 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
-+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ Everyone is permitted to copy and distribute verbatim copies
-+ of this license document, but changing it is not allowed.
-+
-+			    Preamble
-+
-+  The licenses for most software are designed to take away your
-+freedom to share and change it.  By contrast, the GNU General Public
-+License is intended to guarantee your freedom to share and change free
-+software--to make sure the software is free for all its users.  This
-+General Public License applies to most of the Free Software
-+Foundation's software and to any other program whose authors commit to
-+using it.  (Some other Free Software Foundation software is covered by
-+the GNU Lesser General Public License instead.)  You can apply it to
-+your programs, too.
-+
-+  When we speak of free software, we are referring to freedom, not
-+price.  Our General Public Licenses are designed to make sure that you
-+have the freedom to distribute copies of free software (and charge for
-+this service if you wish), that you receive source code or can get it
-+if you want it, that you can change the software or use pieces of it
-+in new free programs; and that you know you can do these things.
-+
-+  To protect your rights, we need to make restrictions that forbid
-+anyone to deny you these rights or to ask you to surrender the rights.
-+These restrictions translate to certain responsibilities for you if you
-+distribute copies of the software, or if you modify it.
-+
-+  For example, if you distribute copies of such a program, whether
-+gratis or for a fee, you must give the recipients all the rights that
-+you have.  You must make sure that they, too, receive or can get the
-+source code.  And you must show them these terms so they know their
-+rights.
-+
-+  We protect your rights with two steps: (1) copyright the software, an=
d
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, w=
e
-+want its recipients to know that what they have is not the original, so
-+that any problems introduced by others will not reflect on the original
-+authors' reputations.
-+
-+  Finally, any free program is threatened constantly by software
-+patents.  We wish to avoid the danger that redistributors of a free
-+program will individually obtain patent licenses, in effect making the
-+program proprietary.  To prevent this, we have made it clear that any
-+patent must be licensed for everyone's free use or not licensed at all.
-+
-+  The precise terms and conditions for copying, distribution and
-+modification follow.
-+
-+		    GNU GENERAL PUBLIC LICENSE
-+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-+
-+  0. This License applies to any program or other work which contains
-+a notice placed by the copyright holder saying it may be distributed
-+under the terms of this General Public License.  The "Program", below,
-+refers to any such program or work, and a "work based on the Program"
-+means either the Program or any derivative work under copyright law:
-+that is to say, a work containing the Program or a portion of it,
-+either verbatim or with modifications and/or translated into another
-+language.  (Hereinafter, translation is included without limitation in
-+the term "modification".)  Each licensee is addressed as "you".
-+
-+Activities other than copying, distribution and modification are not
-+covered by this License; they are outside its scope.  The act of
-+running the Program is not restricted, and the output from the Program
-+is covered only if its contents constitute a work based on the
-+Program (independent of having been made by running the Program).
-+Whether that is true depends on what the Program does.
-+
-+  1. You may copy and distribute verbatim copies of the Program's
-+source code as you receive it, in any medium, provided that you
-+conspicuously and appropriately publish on each copy an appropriate
-+copyright notice and disclaimer of warranty; keep intact all the
-+notices that refer to this License and to the absence of any warranty;
-+and give any other recipients of the Program a copy of this License
-+along with the Program.
-+
-+You may charge a fee for the physical act of transferring a copy, and
-+you may at your option offer warranty protection in exchange for a fee.
-+
-+  2. You may modify your copy or copies of the Program or any portion
-+of it, thus forming a work based on the Program, and copy and
-+distribute such modifications or work under the terms of Section 1
-+above, provided that you also meet all of these conditions:
-+
-+    a) You must cause the modified files to carry prominent notices
-+    stating that you changed the files and the date of any change.
-+
-+    b) You must cause any work that you distribute or publish, that in
-+    whole or in part contains or is derived from the Program or any
-+    part thereof, to be licensed as a whole at no charge to all third
-+    parties under the terms of this License.
-+
-+    c) If the modified program normally reads commands interactively
-+    when run, you must cause it, when started running for such
-+    interactive use in the most ordinary way, to print or display an
-+    announcement including an appropriate copyright notice and a
-+    notice that there is no warranty (or else, saying that you provide
-+    a warranty) and that users may redistribute the program under
-+    these conditions, and telling the user how to view a copy of this
-+    License.  (Exception: if the Program itself is interactive but
-+    does not normally print such an announcement, your work based on
-+    the Program is not required to print an announcement.)
-+
-+These requirements apply to the modified work as a whole.  If
-+identifiable sections of that work are not derived from the Program,
-+and can be reasonably considered independent and separate works in
-+themselves, then this License, and its terms, do not apply to those
-+sections when you distribute them as separate works.  But when you
-+distribute the same sections as part of a whole which is a work based
-+on the Program, the distribution of the whole must be on the terms of
-+this License, whose permissions for other licensees extend to the
-+entire whole, and thus to each and every part regardless of who wrote i=
t.
-+
-+Thus, it is not the intent of this section to claim rights or contest
-+your rights to work written entirely by you; rather, the intent is to
-+exercise the right to control the distribution of derivative or
-+collective works based on the Program.
-+
-+In addition, mere aggregation of another work not based on the Program
-+with the Program (or with a work based on the Program) on a volume of
-+a storage or distribution medium does not bring the other work under
-+the scope of this License.
-+
-+  3. You may copy and distribute the Program (or a work based on it,
-+under Section 2) in object code or executable form under the terms of
-+Sections 1 and 2 above provided that you also do one of the following:
-+
-+    a) Accompany it with the complete corresponding machine-readable
-+    source code, which must be distributed under the terms of Sections
-+    1 and 2 above on a medium customarily used for software interchange=
; or,
-+
-+    b) Accompany it with a written offer, valid for at least three
-+    years, to give any third party, for a charge no more than your
-+    cost of physically performing source distribution, a complete
-+    machine-readable copy of the corresponding source code, to be
-+    distributed under the terms of Sections 1 and 2 above on a medium
-+    customarily used for software interchange; or,
-+
-+    c) Accompany it with the information you received as to the offer
-+    to distribute corresponding source code.  (This alternative is
-+    allowed only for noncommercial distribution and only if you
-+    received the program in object code or executable form with such
-+    an offer, in accord with Subsection b above.)
-+
-+The source code for a work means the preferred form of the work for
-+making modifications to it.  For an executable work, complete source
-+code means all the source code for all modules it contains, plus any
-+associated interface definition files, plus the scripts used to
-+control compilation and installation of the executable.  However, as a
-+special exception, the source code distributed need not include
-+anything that is normally distributed (in either source or binary
-+form) with the major components (compiler, kernel, and so on) of the
-+operating system on which the executable runs, unless that component
-+itself accompanies the executable.
-+
-+If distribution of executable or object code is made by offering
-+access to copy from a designated place, then offering equivalent
-+access to copy the source code from the same place counts as
-+distribution of the source code, even though third parties are not
-+compelled to copy the source along with the object code.
-+
-+  4. You may not copy, modify, sublicense, or distribute the Program
-+except as expressly provided under this License.  Any attempt
-+otherwise to copy, modify, sublicense or distribute the Program is
-+void, and will automatically terminate your rights under this License.
-+However, parties who have received copies, or rights, from you under
-+this License will not have their licenses terminated so long as such
-+parties remain in full compliance.
-+
-+  5. You are not required to accept this License, since you have not
-+signed it.  However, nothing else grants you permission to modify or
-+distribute the Program or its derivative works.  These actions are
-+prohibited by law if you do not accept this License.  Therefore, by
-+modifying or distributing the Program (or any work based on the
-+Program), you indicate your acceptance of this License to do so, and
-+all its terms and conditions for copying, distributing or modifying
-+the Program or works based on it.
-+
-+  6. Each time you redistribute the Program (or any work based on the
-+Program), the recipient automatically receives a license from the
-+original licensor to copy, distribute or modify the Program subject to
-+these terms and conditions.  You may not impose any further
-+restrictions on the recipients' exercise of the rights granted herein.
-+You are not responsible for enforcing compliance by third parties to
-+this License.
-+
-+  7. If, as a consequence of a court judgment or allegation of patent
-+infringement or for any other reason (not limited to patent issues),
-+conditions are imposed on you (whether by court order, agreement or
-+otherwise) that contradict the conditions of this License, they do not
-+excuse you from the conditions of this License.  If you cannot
-+distribute so as to satisfy simultaneously your obligations under this
-+License and any other pertinent obligations, then as a consequence you
-+may not distribute the Program at all.  For example, if a patent
-+license would not permit royalty-free redistribution of the Program by
-+all those who receive copies directly or indirectly through you, then
-+the only way you could satisfy both it and this License would be to
-+refrain entirely from distribution of the Program.
-+
-+If any portion of this section is held invalid or unenforceable under
-+any particular circumstance, the balance of the section is intended to
-+apply and the section as a whole is intended to apply in other
-+circumstances.
-+
-+It is not the purpose of this section to induce you to infringe any
-+patents or other property right claims or to contest validity of any
-+such claims; this section has the sole purpose of protecting the
-+integrity of the free software distribution system, which is
-+implemented by public license practices.  Many people have made
-+generous contributions to the wide range of software distributed
-+through that system in reliance on consistent application of that
-+system; it is up to the author/donor to decide if he or she is willing
-+to distribute software through any other system and a licensee cannot
-+impose that choice.
-+
-+This section is intended to make thoroughly clear what is believed to
-+be a consequence of the rest of this License.
-+
-+  8. If the distribution and/or use of the Program is restricted in
-+certain countries either by patents or by copyrighted interfaces, the
-+original copyright holder who places the Program under this License
-+may add an explicit geographical distribution limitation excluding
-+those countries, so that distribution is permitted only in or among
-+countries not thus excluded.  In such case, this License incorporates
-+the limitation as if written in the body of this License.
-+
-+  9. The Free Software Foundation may publish revised and/or new versio=
ns
-+of the General Public License from time to time.  Such new versions wil=
l
-+be similar in spirit to the present version, but may differ in detail t=
o
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditio=
ns
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number =
of
-+this License, you may choose any version ever published by the Free Sof=
tware
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the auth=
or
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometime=
s
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software a=
nd
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRA=
NTY
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHE=
N
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRES=
SED
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK =
AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING=
,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRI=
TING
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAG=
ES,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARI=
SING
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMIT=
ED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED B=
Y
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OT=
HER
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these te=
rms.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it do=
es.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modif=
y
-+    it under the terms of the GNU General Public License as published b=
y
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License a=
long
-+    with this program; if not, write to the Free Software Foundation, I=
nc.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail=
.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `sh=
ow w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropr=
iate
-+parts of the General Public License.  Of course, the commands you use m=
ay
-+be called something other than `show w' and `show c'; they could even b=
e
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the progra=
m
-+  `Gnomovision' (which makes passes at compilers) written by James Hack=
er.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program =
into
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with=
 the
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0001-Don-t-install-Xsession-or-Xserver.patch b/meta-oe/recipes-graphics/x=
server-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.=
patch
deleted file mode 100644
index ea7c7d6a94..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Do=
n-t-install-Xsession-or-Xserver.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1002a1137b140dad3319bf3206fec5b6c6b74fea Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 10 Nov 2016 14:33:05 +0200
-Subject: [PATCH] Don't install Xsession or Xserver
-
-The goal is to use Xsession and Xserver from xserver-nodm-init.
-Xsession scripts and xserver-common from this recipe will still
-be used as before.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
-Upstream-Status: Pending
-
- Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index caa5de1..9428205 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,8 +20,6 @@ install-program:
- 	install -m 755 run-calibrate.sh $(DESTDIR)$(PREFIX)/bin/run-calibrate.=
sh
- 	install -m 644 X11/Xdefaults $(DESTDIR)/etc/X11/Xdefaults
- 	install -m 755 X11/Xinit $(DESTDIR)/etc/X11/Xinit
--	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
--	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
- 	install -m 755 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
- 	install -m 755 X11/functions $(DESTDIR)/etc/X11/functions
- 	install -d $(DESTDIR)/etc/X11/xmodmap
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0002-add-setdpi-Xinit.d-script.patch b/meta-oe/recipes-graphics/xserver-c=
ommon/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
deleted file mode 100644
index b408234ecb..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-ad=
d-setdpi-Xinit.d-script.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 3b5f431a370054bfc090796e8d55de8c8cea46f4 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:28:45 +0200
-Subject: [PATCH] add setdpi Xinit.d script
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/Xinit.d/50setdpi | 92 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++
- 1 file changed, 92 insertions(+)
- create mode 100644 X11/Xinit.d/50setdpi
-
-diff --git a/X11/Xinit.d/50setdpi b/X11/Xinit.d/50setdpi
-new file mode 100644
-index 0000000..04a2edd
---- /dev/null
-+++ b/X11/Xinit.d/50setdpi
-@@ -0,0 +1,92 @@
-+#! /bin/sh
-+#
-+# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
-+# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of t=
he license)
-+#
-+# Filename: setDPI.sh
-+# Date: 09-Apr-06
-+
-+# This script configures Xft.dpi dependent on your screens DPI. This in=
sures that the same font-size
-+# setting of 7 can be used on all machines.
-+
-+
-+XDEFAULTS=3D"/etc/X11/Xdefaults"
-+
-+
-+
-+set_dpi() {
-+=09
-+	CURRENT_SETTING=3D"`cat ${XDEFAULTS} | sed -n "/Xft.dpi\:/s/.*\:\(.*\)=
/\1/p" | sed -n "s/\ //p"`"=09
-+
-+	if test "$CURRENT_SETTING" !=3D "$1"
-+	then
-+		echo "Using Xft.dpi of $SET_SCREEN_DPI for your $SCREEN_DPI DPI scree=
n"
-+	=09
-+		if grep -q "Xft.dpi" "$XDEFAULTS"
-+		then
-+			cat "${XDEFAULTS}" | sed "s/^Xft.dpi\:.*/Xft.dpi\: $SET_SCREEN_DPI/"=
 > "${XDEFAULTS}_"
-+			mv "${XDEFAULTS}_" "${XDEFAULTS}"
-+		else
-+			echo -e "Xft.dpi: $SET_SCREEN_DPI\n" >> "$XDEFAULTS"
-+		fi
-+	else
-+		echo "Your $SCREEN_DPI DPI screen is already configured."
-+	fi
-+}
-+
-+set_rxvt_font() {
-+
-+	CURRENT_SETTING=3D"`cat ${XDEFAULTS} | sed  -n "/Rxvt\*font/s/\(.*\pix=
elsize=3D\)\(.*\)/\2/p"`"
-+
-+	if test "$1" -gt 100
-+	then
-+=09
-+		# Configure the rxvt font-size for your screen here:
-+		test "$1" -gt 180 -a "$1" -lt "221" && RXVT_FONT_SIZE=3D16
-+	=09
-+		if test -z "$RXVT_FONT_SIZE"
-+		then
-+			echo "WARNING: No rxvt font-size configured for a $SCREEN_DPI DPI sc=
reen!"
-+			echo "Defaulting to size 9"
-+			RXVT_FONT_SIZE=3D9
-+		fi
-+	=09
-+		if test "$CURRENT_SETTING" !=3D "$RXVT_FONT_SIZE"
-+		then
-+			echo "Using a rxvt font-size of $RXVT_FONT_SIZE"
-+			cat ${XDEFAULTS} | sed "/Rxvt\*font/s/\(.*\pixelsize\)\(=3D*.*\)/\1=3D=
$RXVT_FONT_SIZE/" > ${XDEFAULTS}_
-+			mv ${XDEFAULTS}_ ${XDEFAULTS}
-+		else
-+			echo "The rxvt font-size is already configured"
-+		fi=20
-+	fi
-+}
-+
-+if test -z "$DISPLAY"
-+then
-+	echo "DISPLAY is not set, aborting..."
-+	exit 0
-+fi
-+
-+SCREEN_DPI=3D"`/usr/bin/xdpyinfo | grep "dots per inch" | awk '{print $=
2}'| sed -n "s/\(.*\)x\(.*\)/\2/p"`"
-+
-+if test -z "$SCREEN_DPI"
-+then
-+	echo "WARNING: Couldn't read your screens DPI, defaulting to 100"
-+	SCREEN_DPI=3D100
-+fi
-+
-+# Configure your screen here:
-+test "$SCREEN_DPI" -gt 180 -a "$SCREEN_DPI" -lt "221" && SET_SCREEN_DPI=
=3D160
-+test "$SCREEN_DPI" -gt 90 -a "$SCREEN_DPI" -lt "121" && SET_SCREEN_DPI=3D=
100
-+
-+
-+if test -z "$SET_SCREEN_DPI"
-+then
-+	echo "WARNING: No default configuration found for your $SCREEN_DPI DPI=
 screen!"
-+	echo "Using 100 DPI"
-+	SET_SCREEN_DPI=3D100
-+fi
-+
-+set_dpi "$SET_SCREEN_DPI"
-+set_rxvt_font "$SCREEN_DPI"
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0006-add-support-for-etc-X11-xserver-system.patch b/meta-oe/recipes-graph=
ics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserv=
er-system.patch
deleted file mode 100644
index 4a9342c934..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-ad=
d-support-for-etc-X11-xserver-system.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b60e364c35d56a2a3164254d98c9931bfa3feed4 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:34:43 +0200
-Subject: [PATCH] add support for /etc/X11/xserver-system
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 52655cb..bb7c2ff 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -204,3 +204,8 @@ fi
- if [ "$XSERVER" !=3D "Xorg" ] ; then
-     ARGS=3D"$ARGS $MOUSE $KDRIVEARGS"
- fi
-+
-+# let a local script modify the variables                   =20
-+if [ -e /etc/X11/xserver-system ] ; then                   =20
-+       . /etc/X11/xserver-system                   =20
-+fi                   =20
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0007-use-own-functions-file-instead-etc-init.d-functions.patch b/meta-oe/=
recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-function=
s-file-instead-etc-init.d-functions.patch
deleted file mode 100644
index ba35d1cf6c..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-us=
e-own-functions-file-instead-etc-init.d-functions.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 492c65a32a4ae44c34580ed8ac5d3f50a155cfef Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:36:02 +0200
-Subject: [PATCH] use own functions file instead /etc/init.d/functions
-
-* so we don't have to depend on initscripts
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- Makefile             |  1 +
- X11/Xinit.d/11zaurus |  2 +-
- X11/Xinit.d/12keymap |  2 +-
- X11/functions        | 11 +++++++++++
- X11/xserver-common   |  2 +-
- 5 files changed, 15 insertions(+), 3 deletions(-)
- create mode 100644 X11/functions
-
-diff --git a/Makefile b/Makefile
-index e2d9af9..caa5de1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -23,6 +23,7 @@ install-program:
- 	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
- 	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
- 	install -m 755 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
-+	install -m 755 X11/functions $(DESTDIR)/etc/X11/functions
- 	install -d $(DESTDIR)/etc/X11/xmodmap
- 	install -m 644 X11/xmodmap/*.xmodmap $(DESTDIR)/etc/X11/xmodmap
- 	install -m 644 X11/xmodmap/xmodmap-* $(DESTDIR)/etc/X11/xmodmap
-diff --git a/X11/Xinit.d/11zaurus b/X11/Xinit.d/11zaurus
-index 54ea6f5..23e7713 100644
---- a/X11/Xinit.d/11zaurus
-+++ b/X11/Xinit.d/11zaurus
-@@ -8,7 +8,7 @@ else
-    CHCK=3Dchkhinge
- fi
-=20
--. /etc/init.d/functions
-+. /etc/X11/functions
-=20
- $CHCK -e
- if [ $? =3D 12 ]; then
-diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
-index 7eac296..b7a7f2d 100644
---- a/X11/Xinit.d/12keymap
-+++ b/X11/Xinit.d/12keymap
-@@ -1,6 +1,6 @@
- #!/bin/sh
-=20
--. /etc/init.d/functions
-+. /etc/X11/functions
-=20
- # since kdrive 1.4 there is no default keymap in server
- xmodmap - </etc/X11/xmodmap/default.xmodmap
-diff --git a/X11/functions b/X11/functions
-new file mode 100644
-index 0000000..a1311ad
---- /dev/null
-+++ b/X11/functions
-@@ -0,0 +1,11 @@
-+# -*-Shell-script-*-
-+#
-+# functions     This file contains functions shared by few X11 scripts
-+#               machine_id also exists in /etc/init.d/functions but som=
e
-+#               people don't use initscripts anymore
-+#
-+
-+machine_id() { # return the machine ID
-+	awk 'BEGIN { FS=3D": " } /Hardware/ \
-+		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
-+}
-diff --git a/X11/xserver-common b/X11/xserver-common
-index bb7c2ff..d622f2a 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -30,7 +30,7 @@ if [ -f /etc/profile ]; then
-   . /etc/profile
- fi
-=20
--. /etc/init.d/functions
-+. /etc/X11/functions
-=20
- fallback_screen_arg() {
-     geom=3D`fbset | grep geometry`
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-=
add-dpi-and-nocursor-params-for-gta01.patch
deleted file mode 100644
index a04e563f82..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xs=
erver-common-add-dpi-and-nocursor-params-for-gta01.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e2abbe110e71a7b4b56564e6b9d58ffa7f34a9e8 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:37:29 +0200
-Subject: [PATCH] xserver-common: add dpi and nocursor params for gta01 a=
nd
- gta02
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index d622f2a..a2c0591 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -133,15 +133,19 @@ else
-             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-             DPI=3D"225" ;;
-         "gta01" )
--            DPI=3D"285"
-+            DPI=3D"280"
-             if [ "$XSERVER" !=3D "Xorg" ] ; then
-                 ARGS=3D"$ARGS -screen 480x640"
-+            else
-+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "gta02")
--            DPI=3D"285"
-+            DPI=3D"280"
-             if [ "$XSERVER" !=3D "Xorg" ] ; then
-                 ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "motorola_ezx_platform")
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-=
add-support-for-n900-alias-nokia_rx-5.patch
deleted file mode 100644
index 993b320154..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xs=
erver-common-add-support-for-n900-alias-nokia_rx-5.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f2d808cea5b9f69158f82e16c06f882a6db10d63 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:40:14 +0200
-Subject: [PATCH] xserver-common: add support for n900 alias nokia_rx-51_=
board
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index a2c0591..b8c37e6 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -132,6 +132,13 @@ else
-         "nokia_n800" | "nokia_rx-44" | "nokia_n770")
-             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-             DPI=3D"225" ;;
-+        "nokia_rx-51_board" )                                    =20
-+            DPI=3D"267"                                   =20
-+            if [ "$XSERVER" !=3D "Xorg" ] ; then                   =20
-+                ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"              =20
-+            else                                                 =20
-+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"      =20
-+            fi ;;                                                   =20
-         "gta01" )
-             DPI=3D"280"
-             if [ "$XSERVER" !=3D "Xorg" ] ; then
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0010-xserver-common-add-support-for-nexus-S-alias-herring.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-=
add-support-for-nexus-S-alias-herring.patch
deleted file mode 100644
index 2948cd611b..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xs=
erver-common-add-support-for-nexus-S-alias-herring.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a194ba2013f9e58cf73cd39b57be68386e501eda Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:40:44 +0200
-Subject: [PATCH] xserver-common: add support for nexus S alias herring
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index b8c37e6..9aa6b24 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -126,6 +126,9 @@ else
-         "htc_tornado")
-             ARGS=3D"$ARGS -hide-cursor"
-             DPI=3D"100" ;;
-+        "herring")
-+            DPI=3D"235"
-+            ARGS=3D"$ARGS -dpi ${DPI} -nocursor";;
-         "generic_omap1510/1610/1710")
-             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-             DPI=3D"225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-=
add-support-for-nexus-one-alias-mahim.patch
deleted file mode 100644
index 342d49becd..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xs=
erver-common-add-support-for-nexus-one-alias-mahim.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From dfd832b35b6cb4cf2b6f2b51df7b0999f10c8ca1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:41:06 +0200
-Subject: [PATCH] xserver-common: add support for nexus one alias mahimah=
i
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 9aa6b24..8da926e 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -129,6 +129,9 @@ else
-         "herring")
-             DPI=3D"235"
-             ARGS=3D"$ARGS -dpi ${DPI} -nocursor";;
-+        "mahimahi")
-+            DPI=3D"254"
-+            ARGS=3D"$ARGS -dpi ${DPI}";;
-         "generic_omap1510/1610/1710")
-             ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-             DPI=3D"225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-=
add-support-for-gta04-alias-OpenPhoen.patch
deleted file mode 100644
index 94f9d2ca6f..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xs=
erver-common-add-support-for-gta04-alias-OpenPhoen.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d9e05e53b30c66705852256ff5c603252aa94b2c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:41:52 +0200
-Subject: [PATCH] xserver-common: add support for gta04 alias OpenPhoenux
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 8da926e..d9325dd 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -161,6 +161,14 @@ else
-                 ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-+        "gta04")
-+            DPI=3D"280"
-+            if [ "$XSERVER" !=3D "Xorg" ] ; then
-+                ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-+            fi
-+            ;;
-         "motorola_ezx_platform")
-             ARGS=3D"$ARGS -screen 240x320"
-             DPI=3D"170" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch b/meta-oe=
/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-=
add-support-for-tuna-alias-Galaxy-Nex.patch
deleted file mode 100644
index c023b583b0..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xs=
erver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 57ab521ffc1024f21105ca14be2d041a477942b1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 17 Aug 2012 13:00:56 +0200
-Subject: [PATCH] xserver-common: add support for tuna alias Galaxy Nexus
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- X11/xserver-common | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index d9325dd..017e5ae 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -169,6 +169,14 @@ else
-                 ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-+        "tuna")
-+            DPI=3D"316"
-+            if [ "$XSERVER" !=3D "Xorg" ] ; then
-+                ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS=3D"$ARGS -dpi ${DPI} -nocursor"
-+            fi
-+            ;;
-         "motorola_ezx_platform")
-             ARGS=3D"$ARGS -screen 240x320"
-             DPI=3D"170" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/=
0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graph=
ics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-co=
nnections.patch
deleted file mode 100644
index a731917003..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xs=
erver-common-disable-TCP-connections.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5236209e30e0f45113e140f0667c8ffcfe621536 Mon Sep 17 00:00:00 2001
-From: Javier Viguera <javier.viguera@digi.com>
-Date: Wed, 26 Nov 2014 09:24:44 +0100
-Subject: [PATCH] xserver-common: disable TCP connections
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Javier Viguera <javier.viguera@digi.com>
-
----
- X11/xserver-common | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 017e5ae..4dc48c4 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -44,7 +44,7 @@ SCREEN_SIZE=3D`fallback_screen_arg`
- export USER=3Droot
- export XSERVER_DEFAULT_ORIENTATION=3Dnormal
-=20
--ARGS=3D"-br -pn $INPUT_EXTRA_ARGS"
-+ARGS=3D"-br -pn -nolisten tcp $INPUT_EXTRA_ARGS"
- DPI=3D"100"
- MOUSE=3D""
- KDRIVEARGS=3D""
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.=
bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
deleted file mode 100644
index 5cd3d3ce0b..0000000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY =3D "Common X11 scripts and support files"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
-
-
-# we are using a gpe-style Makefile
-inherit features_check gpe
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-SRC_URI[sha256sum] =3D "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbc=
d97f88166cc34210"
-
-SRC_URI:append =3D " \
-    file://0001-COPYING-add-GPLv2-license-file.patch \
-    file://0002-add-setdpi-Xinit.d-script.patch \
-    file://0006-add-support-for-etc-X11-xserver-system.patch \
-    file://0007-use-own-functions-file-instead-etc-init.d-functions.patc=
h \
-    file://0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.pat=
ch \
-    file://0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.pat=
ch \
-    file://0010-xserver-common-add-support-for-nexus-S-alias-herring.pat=
ch \
-    file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.pat=
ch \
-    file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.pat=
ch \
-    file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.pat=
ch \
-    file://0015-xserver-common-disable-TCP-connections.patch \
-    file://0001-Don-t-install-Xsession-or-Xserver.patch \
-"
-
-do_install:append() {
-    sed -i 's:^BINDIR=3D.*$:BINDIR=3D${bindir}:' ${D}/etc/X11/xserver-co=
mmon
-    # Rename all Xsession files not ending with .sh
-    # Unfortunatelly when xinput-calibrator was moved to oe-core
-    # its Xsession file got name 30xinput_calibrate.sh and ls -X sorts i=
t
-    # last, not respecting numbers for sorting them
-    for i in ${D}/${sysconfdir}/X11/Xsession.d/*; do
-        echo $i | grep '.sh$' || mv $i $i.sh
-    done
-}
-
-RDEPENDS:${PN} =3D "xmodmap xrandr xdpyinfo fbset xinput-calibrator"
-
-RCONFLICTS:${PN} =3D "xserver-kdrive-common x11-common"
-RREPLACES:${PN} =3D "xserver-kdrive-common x11-common"
-
--=20
2.34.1


