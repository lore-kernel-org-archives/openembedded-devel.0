Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SI5xl-0003SI-NB
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 00:24:29 +0200
Received: by wera1 with SMTP id a1so886986wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Rw9vsSCUZ/TnEe9JKfror6GBAB9Gfyx2WLBbsZy0BCk=;
	b=brcDRgZznd9YBj7ZtnItA+n8XTarp9oGLQ90xZKvL2p7p+f4VME5QW/9SAY4HIeoZ/
	+8eJDMp4sPsf8a7v0ABoLEpX+OczKsSrWY67Vc3zPx8r4ppc2BifNuyKBNBF/oVPvkVE
	V+uGL3guBMLJqkyOUkhi8zaASQ4rfnjG1mU+k38gf4bNfbvQ68GjC3hTYUtn1lIfi8hs
	nvs02zD+x+jwdyTbnbH+9ILvOhTxKlwJr7l6uGtvibeb1eOifFZiyKif5Lf5u3sYPwK7
	/7Iv5XTSjdLv8/npZnZRbgB7zGG90G6wRfj4IkW22e0jJLuld80ysv28uk9hIrO/pjBh
	ULJA==
Received: by 10.180.102.100 with SMTP id fn4mr336650wib.1.1334182510439;
	Wed, 11 Apr 2012 15:15:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm47905529wib.2.2012.04.11.15.15.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 15:15:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2012 15:14:59 +0200
Message-Id: <1334150099-22175-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <20120411130737.GC3637@jama.jama.net>
References: <20120411130737.GC3637@jama.jama.net>
Subject: [PATCH] xserver-common: use git patches and add functions file
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
X-List-Received-Date: Wed, 11 Apr 2012 22:24:29 -0000

* otherwise we were depending on initscripts to provide it without RDEPENDing on it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-COPYING-add-GPLv2-license-file.patch      |  364 ++++++++++++++++++++
 .../0002-add-setdpi-Xinit.d-script.patch           |  112 ++++++
 ...0003-add-89xdgautostart-Xsession.d-script.patch |   29 ++
 ...brate_xinput_calibrator-Xsession.d-script.patch |   27 ++
 ...0005-add-XWindowManager-Xsession.d-script.patch |   26 ++
 ...06-add-support-for-etc-X11-xserver-system.patch |   26 ++
 ...nctions-file-instead-etc-init.d-functions.patch |   87 +++++
 ...mon-add-dpi-and-nocursor-params-for-gta01.patch |   40 +++
 ...mon-add-support-for-n900-alias-nokia_rx-5.patch |   32 ++
 ...mon-add-support-for-nexus-S-alias-herring.patch |   27 ++
 ...mon-add-support-for-nexus-one-alias-mahim.patch |   28 ++
 ...mon-add-support-for-gta04-alias-OpenPhoen.patch |   33 ++
 .../89xTs_Calibrate.xinput_calibrator.patch        |   12 -
 .../xserver-common-1.34/89xdgautostart.sh          |    9 -
 .../xserver-common-1.34/90xXWindowManager.patch    |   11 -
 .../Xserver.add.dpi.for.gta.patch                  |   29 --
 .../Xserver.add.nocursor.for.gta.patch             |   20 -
 .../Xserver.add.xserver-system.patch               |   12 -
 .../xserver-common-1.34/Xserver.gta04.patch        |   32 --
 .../xserver-common-1.34/Xserver.n900.patch         |   17 -
 .../xserver-common-1.34/Xserver.nexusone.patch     |   14 -
 .../xserver-common-1.34/Xserver.nexuss.patch       |   14 -
 .../xserver-common-1.34/gplv2-license.patch        |  353 -------------------
 .../xserver-common/xserver-common-1.34/setDPI.sh   |   92 -----
 .../xserver-common/xserver-common_1.34.bb          |   29 +-
 25 files changed, 844 insertions(+), 631 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xTs_Calibrate.xinput_calibrator.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xdgautostart.sh
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/90xXWindowManager.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.xserver-system.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/gplv2-license.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/setDPI.sh

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
new file mode 100644
index 0000000..29dd71a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
@@ -0,0 +1,364 @@
+From 834fa06920f88ceedf752964c8e296c653d541e4 Mon Sep 17 00:00:00 2001
+From: Yu Ke <ke.yu@intel.com>
+Date: Wed, 11 Apr 2012 14:26:16 +0200
+Subject: [PATCH 01/12] COPYING: add GPLv2 license file
+
+this is a local file recipe and the license file is missing.In order
+to pass the license checksum checking, the license file is needed. So
+this patch add the GPLv2 license file.
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ COPYING |  339 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 339 insertions(+), 0 deletions(-)
+ create mode 100644 COPYING
+
+diff --git a/COPYING b/COPYING
+new file mode 100644
+index 0000000..d511905
+--- /dev/null
++++ b/COPYING
+@@ -0,0 +1,339 @@
++		    GNU GENERAL PUBLIC LICENSE
++		       Version 2, June 1991
++
++ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
++ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ Everyone is permitted to copy and distribute verbatim copies
++ of this license document, but changing it is not allowed.
++
++			    Preamble
++
++  The licenses for most software are designed to take away your
++freedom to share and change it.  By contrast, the GNU General Public
++License is intended to guarantee your freedom to share and change free
++software--to make sure the software is free for all its users.  This
++General Public License applies to most of the Free Software
++Foundation's software and to any other program whose authors commit to
++using it.  (Some other Free Software Foundation software is covered by
++the GNU Lesser General Public License instead.)  You can apply it to
++your programs, too.
++
++  When we speak of free software, we are referring to freedom, not
++price.  Our General Public Licenses are designed to make sure that you
++have the freedom to distribute copies of free software (and charge for
++this service if you wish), that you receive source code or can get it
++if you want it, that you can change the software or use pieces of it
++in new free programs; and that you know you can do these things.
++
++  To protect your rights, we need to make restrictions that forbid
++anyone to deny you these rights or to ask you to surrender the rights.
++These restrictions translate to certain responsibilities for you if you
++distribute copies of the software, or if you modify it.
++
++  For example, if you distribute copies of such a program, whether
++gratis or for a fee, you must give the recipients all the rights that
++you have.  You must make sure that they, too, receive or can get the
++source code.  And you must show them these terms so they know their
++rights.
++
++  We protect your rights with two steps: (1) copyright the software, and
++(2) offer you this license which gives you legal permission to copy,
++distribute and/or modify the software.
++
++  Also, for each author's protection and ours, we want to make certain
++that everyone understands that there is no warranty for this free
++software.  If the software is modified by someone else and passed on, we
++want its recipients to know that what they have is not the original, so
++that any problems introduced by others will not reflect on the original
++authors' reputations.
++
++  Finally, any free program is threatened constantly by software
++patents.  We wish to avoid the danger that redistributors of a free
++program will individually obtain patent licenses, in effect making the
++program proprietary.  To prevent this, we have made it clear that any
++patent must be licensed for everyone's free use or not licensed at all.
++
++  The precise terms and conditions for copying, distribution and
++modification follow.
++
++		    GNU GENERAL PUBLIC LICENSE
++   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
++
++  0. This License applies to any program or other work which contains
++a notice placed by the copyright holder saying it may be distributed
++under the terms of this General Public License.  The "Program", below,
++refers to any such program or work, and a "work based on the Program"
++means either the Program or any derivative work under copyright law:
++that is to say, a work containing the Program or a portion of it,
++either verbatim or with modifications and/or translated into another
++language.  (Hereinafter, translation is included without limitation in
++the term "modification".)  Each licensee is addressed as "you".
++
++Activities other than copying, distribution and modification are not
++covered by this License; they are outside its scope.  The act of
++running the Program is not restricted, and the output from the Program
++is covered only if its contents constitute a work based on the
++Program (independent of having been made by running the Program).
++Whether that is true depends on what the Program does.
++
++  1. You may copy and distribute verbatim copies of the Program's
++source code as you receive it, in any medium, provided that you
++conspicuously and appropriately publish on each copy an appropriate
++copyright notice and disclaimer of warranty; keep intact all the
++notices that refer to this License and to the absence of any warranty;
++and give any other recipients of the Program a copy of this License
++along with the Program.
++
++You may charge a fee for the physical act of transferring a copy, and
++you may at your option offer warranty protection in exchange for a fee.
++
++  2. You may modify your copy or copies of the Program or any portion
++of it, thus forming a work based on the Program, and copy and
++distribute such modifications or work under the terms of Section 1
++above, provided that you also meet all of these conditions:
++
++    a) You must cause the modified files to carry prominent notices
++    stating that you changed the files and the date of any change.
++
++    b) You must cause any work that you distribute or publish, that in
++    whole or in part contains or is derived from the Program or any
++    part thereof, to be licensed as a whole at no charge to all third
++    parties under the terms of this License.
++
++    c) If the modified program normally reads commands interactively
++    when run, you must cause it, when started running for such
++    interactive use in the most ordinary way, to print or display an
++    announcement including an appropriate copyright notice and a
++    notice that there is no warranty (or else, saying that you provide
++    a warranty) and that users may redistribute the program under
++    these conditions, and telling the user how to view a copy of this
++    License.  (Exception: if the Program itself is interactive but
++    does not normally print such an announcement, your work based on
++    the Program is not required to print an announcement.)
++
++These requirements apply to the modified work as a whole.  If
++identifiable sections of that work are not derived from the Program,
++and can be reasonably considered independent and separate works in
++themselves, then this License, and its terms, do not apply to those
++sections when you distribute them as separate works.  But when you
++distribute the same sections as part of a whole which is a work based
++on the Program, the distribution of the whole must be on the terms of
++this License, whose permissions for other licensees extend to the
++entire whole, and thus to each and every part regardless of who wrote it.
++
++Thus, it is not the intent of this section to claim rights or contest
++your rights to work written entirely by you; rather, the intent is to
++exercise the right to control the distribution of derivative or
++collective works based on the Program.
++
++In addition, mere aggregation of another work not based on the Program
++with the Program (or with a work based on the Program) on a volume of
++a storage or distribution medium does not bring the other work under
++the scope of this License.
++
++  3. You may copy and distribute the Program (or a work based on it,
++under Section 2) in object code or executable form under the terms of
++Sections 1 and 2 above provided that you also do one of the following:
++
++    a) Accompany it with the complete corresponding machine-readable
++    source code, which must be distributed under the terms of Sections
++    1 and 2 above on a medium customarily used for software interchange; or,
++
++    b) Accompany it with a written offer, valid for at least three
++    years, to give any third party, for a charge no more than your
++    cost of physically performing source distribution, a complete
++    machine-readable copy of the corresponding source code, to be
++    distributed under the terms of Sections 1 and 2 above on a medium
++    customarily used for software interchange; or,
++
++    c) Accompany it with the information you received as to the offer
++    to distribute corresponding source code.  (This alternative is
++    allowed only for noncommercial distribution and only if you
++    received the program in object code or executable form with such
++    an offer, in accord with Subsection b above.)
++
++The source code for a work means the preferred form of the work for
++making modifications to it.  For an executable work, complete source
++code means all the source code for all modules it contains, plus any
++associated interface definition files, plus the scripts used to
++control compilation and installation of the executable.  However, as a
++special exception, the source code distributed need not include
++anything that is normally distributed (in either source or binary
++form) with the major components (compiler, kernel, and so on) of the
++operating system on which the executable runs, unless that component
++itself accompanies the executable.
++
++If distribution of executable or object code is made by offering
++access to copy from a designated place, then offering equivalent
++access to copy the source code from the same place counts as
++distribution of the source code, even though third parties are not
++compelled to copy the source along with the object code.
++
++  4. You may not copy, modify, sublicense, or distribute the Program
++except as expressly provided under this License.  Any attempt
++otherwise to copy, modify, sublicense or distribute the Program is
++void, and will automatically terminate your rights under this License.
++However, parties who have received copies, or rights, from you under
++this License will not have their licenses terminated so long as such
++parties remain in full compliance.
++
++  5. You are not required to accept this License, since you have not
++signed it.  However, nothing else grants you permission to modify or
++distribute the Program or its derivative works.  These actions are
++prohibited by law if you do not accept this License.  Therefore, by
++modifying or distributing the Program (or any work based on the
++Program), you indicate your acceptance of this License to do so, and
++all its terms and conditions for copying, distributing or modifying
++the Program or works based on it.
++
++  6. Each time you redistribute the Program (or any work based on the
++Program), the recipient automatically receives a license from the
++original licensor to copy, distribute or modify the Program subject to
++these terms and conditions.  You may not impose any further
++restrictions on the recipients' exercise of the rights granted herein.
++You are not responsible for enforcing compliance by third parties to
++this License.
++
++  7. If, as a consequence of a court judgment or allegation of patent
++infringement or for any other reason (not limited to patent issues),
++conditions are imposed on you (whether by court order, agreement or
++otherwise) that contradict the conditions of this License, they do not
++excuse you from the conditions of this License.  If you cannot
++distribute so as to satisfy simultaneously your obligations under this
++License and any other pertinent obligations, then as a consequence you
++may not distribute the Program at all.  For example, if a patent
++license would not permit royalty-free redistribution of the Program by
++all those who receive copies directly or indirectly through you, then
++the only way you could satisfy both it and this License would be to
++refrain entirely from distribution of the Program.
++
++If any portion of this section is held invalid or unenforceable under
++any particular circumstance, the balance of the section is intended to
++apply and the section as a whole is intended to apply in other
++circumstances.
++
++It is not the purpose of this section to induce you to infringe any
++patents or other property right claims or to contest validity of any
++such claims; this section has the sole purpose of protecting the
++integrity of the free software distribution system, which is
++implemented by public license practices.  Many people have made
++generous contributions to the wide range of software distributed
++through that system in reliance on consistent application of that
++system; it is up to the author/donor to decide if he or she is willing
++to distribute software through any other system and a licensee cannot
++impose that choice.
++
++This section is intended to make thoroughly clear what is believed to
++be a consequence of the rest of this License.
++
++  8. If the distribution and/or use of the Program is restricted in
++certain countries either by patents or by copyrighted interfaces, the
++original copyright holder who places the Program under this License
++may add an explicit geographical distribution limitation excluding
++those countries, so that distribution is permitted only in or among
++countries not thus excluded.  In such case, this License incorporates
++the limitation as if written in the body of this License.
++
++  9. The Free Software Foundation may publish revised and/or new versions
++of the General Public License from time to time.  Such new versions will
++be similar in spirit to the present version, but may differ in detail to
++address new problems or concerns.
++
++Each version is given a distinguishing version number.  If the Program
++specifies a version number of this License which applies to it and "any
++later version", you have the option of following the terms and conditions
++either of that version or of any later version published by the Free
++Software Foundation.  If the Program does not specify a version number of
++this License, you may choose any version ever published by the Free Software
++Foundation.
++
++  10. If you wish to incorporate parts of the Program into other free
++programs whose distribution conditions are different, write to the author
++to ask for permission.  For software which is copyrighted by the Free
++Software Foundation, write to the Free Software Foundation; we sometimes
++make exceptions for this.  Our decision will be guided by the two goals
++of preserving the free status of all derivatives of our free software and
++of promoting the sharing and reuse of software generally.
++
++			    NO WARRANTY
++
++  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
++FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
++OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
++PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
++OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
++TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
++PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
++REPAIR OR CORRECTION.
++
++  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
++WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
++REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
++INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
++OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
++TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
++YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
++PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
++POSSIBILITY OF SUCH DAMAGES.
++
++		     END OF TERMS AND CONDITIONS
++
++	    How to Apply These Terms to Your New Programs
++
++  If you develop a new program, and you want it to be of the greatest
++possible use to the public, the best way to achieve this is to make it
++free software which everyone can redistribute and change under these terms.
++
++  To do so, attach the following notices to the program.  It is safest
++to attach them to the start of each source file to most effectively
++convey the exclusion of warranty; and each file should have at least
++the "copyright" line and a pointer to where the full notice is found.
++
++    <one line to give the program's name and a brief idea of what it does.>
++    Copyright (C) <year>  <name of author>
++
++    This program is free software; you can redistribute it and/or modify
++    it under the terms of the GNU General Public License as published by
++    the Free Software Foundation; either version 2 of the License, or
++    (at your option) any later version.
++
++    This program is distributed in the hope that it will be useful,
++    but WITHOUT ANY WARRANTY; without even the implied warranty of
++    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++    GNU General Public License for more details.
++
++    You should have received a copy of the GNU General Public License along
++    with this program; if not, write to the Free Software Foundation, Inc.,
++    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++
++Also add information on how to contact you by electronic and paper mail.
++
++If the program is interactive, make it output a short notice like this
++when it starts in an interactive mode:
++
++    Gnomovision version 69, Copyright (C) year name of author
++    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
++    This is free software, and you are welcome to redistribute it
++    under certain conditions; type `show c' for details.
++
++The hypothetical commands `show w' and `show c' should show the appropriate
++parts of the General Public License.  Of course, the commands you use may
++be called something other than `show w' and `show c'; they could even be
++mouse-clicks or menu items--whatever suits your program.
++
++You should also get your employer (if you work as a programmer) or your
++school, if any, to sign a "copyright disclaimer" for the program, if
++necessary.  Here is a sample; alter the names:
++
++  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
++  `Gnomovision' (which makes passes at compilers) written by James Hacker.
++
++  <signature of Ty Coon>, 1 April 1989
++  Ty Coon, President of Vice
++
++This General Public License does not permit incorporating your program into
++proprietary programs.  If your program is a subroutine library, you may
++consider it more useful to permit linking proprietary applications with the
++library.  If this is what you want to do, use the GNU Lesser General
++Public License instead of this License.
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
new file mode 100644
index 0000000..23b5345
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
@@ -0,0 +1,112 @@
+From 3d1a1a8273112668927a6c6bb3e361e896f5b229 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:28:45 +0200
+Subject: [PATCH 02/12] add setdpi Xinit.d script
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/Xinit.d/50setdpi |   92 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 92 insertions(+), 0 deletions(-)
+ create mode 100644 X11/Xinit.d/50setdpi
+
+diff --git a/X11/Xinit.d/50setdpi b/X11/Xinit.d/50setdpi
+new file mode 100644
+index 0000000..04a2edd
+--- /dev/null
++++ b/X11/Xinit.d/50setdpi
+@@ -0,0 +1,92 @@
++#! /bin/sh
++#
++# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
++# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
++#
++# Filename: setDPI.sh
++# Date: 09-Apr-06
++
++# This script configures Xft.dpi dependent on your screens DPI. This insures that the same font-size
++# setting of 7 can be used on all machines.
++
++
++XDEFAULTS="/etc/X11/Xdefaults"
++
++
++
++set_dpi() {
++	
++	CURRENT_SETTING="`cat ${XDEFAULTS} | sed -n "/Xft.dpi\:/s/.*\:\(.*\)/\1/p" | sed -n "s/\ //p"`"	
++
++	if test "$CURRENT_SETTING" != "$1"
++	then
++		echo "Using Xft.dpi of $SET_SCREEN_DPI for your $SCREEN_DPI DPI screen"
++		
++		if grep -q "Xft.dpi" "$XDEFAULTS"
++		then
++			cat "${XDEFAULTS}" | sed "s/^Xft.dpi\:.*/Xft.dpi\: $SET_SCREEN_DPI/" > "${XDEFAULTS}_"
++			mv "${XDEFAULTS}_" "${XDEFAULTS}"
++		else
++			echo -e "Xft.dpi: $SET_SCREEN_DPI\n" >> "$XDEFAULTS"
++		fi
++	else
++		echo "Your $SCREEN_DPI DPI screen is already configured."
++	fi
++}
++
++set_rxvt_font() {
++
++	CURRENT_SETTING="`cat ${XDEFAULTS} | sed  -n "/Rxvt\*font/s/\(.*\pixelsize=\)\(.*\)/\2/p"`"
++
++	if test "$1" -gt 100
++	then
++	
++		# Configure the rxvt font-size for your screen here:
++		test "$1" -gt 180 -a "$1" -lt "221" && RXVT_FONT_SIZE=16
++		
++		if test -z "$RXVT_FONT_SIZE"
++		then
++			echo "WARNING: No rxvt font-size configured for a $SCREEN_DPI DPI screen!"
++			echo "Defaulting to size 9"
++			RXVT_FONT_SIZE=9
++		fi
++		
++		if test "$CURRENT_SETTING" != "$RXVT_FONT_SIZE"
++		then
++			echo "Using a rxvt font-size of $RXVT_FONT_SIZE"
++			cat ${XDEFAULTS} | sed "/Rxvt\*font/s/\(.*\pixelsize\)\(=*.*\)/\1=$RXVT_FONT_SIZE/" > ${XDEFAULTS}_
++			mv ${XDEFAULTS}_ ${XDEFAULTS}
++		else
++			echo "The rxvt font-size is already configured"
++		fi 
++	fi
++}
++
++if test -z "$DISPLAY"
++then
++	echo "DISPLAY is not set, aborting..."
++	exit 0
++fi
++
++SCREEN_DPI="`/usr/bin/xdpyinfo | grep "dots per inch" | awk '{print $2}'| sed -n "s/\(.*\)x\(.*\)/\2/p"`"
++
++if test -z "$SCREEN_DPI"
++then
++	echo "WARNING: Couldn't read your screens DPI, defaulting to 100"
++	SCREEN_DPI=100
++fi
++
++# Configure your screen here:
++test "$SCREEN_DPI" -gt 180 -a "$SCREEN_DPI" -lt "221" && SET_SCREEN_DPI=160
++test "$SCREEN_DPI" -gt 90 -a "$SCREEN_DPI" -lt "121" && SET_SCREEN_DPI=100
++
++
++if test -z "$SET_SCREEN_DPI"
++then
++	echo "WARNING: No default configuration found for your $SCREEN_DPI DPI screen!"
++	echo "Using 100 DPI"
++	SET_SCREEN_DPI=100
++fi
++
++set_dpi "$SET_SCREEN_DPI"
++set_rxvt_font "$SCREEN_DPI"
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
new file mode 100644
index 0000000..bf806a9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
@@ -0,0 +1,29 @@
+From a93a86c2ff1ca5eb35615f4e1568409ff342aa7f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:29:41 +0200
+Subject: [PATCH 03/12] add 89xdgautostart Xsession.d script
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/Xsession.d/89xdgautostart |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+ create mode 100644 X11/Xsession.d/89xdgautostart
+
+diff --git a/X11/Xsession.d/89xdgautostart b/X11/Xsession.d/89xdgautostart
+new file mode 100644
+index 0000000..9886f9f
+--- /dev/null
++++ b/X11/Xsession.d/89xdgautostart
+@@ -0,0 +1,9 @@
++#!/bin/sh
++
++XDGAUTOSTART=/etc/xdg/autostart
++if [ -d $XDGAUTOSTART ] ; then
++    for SCRIPT in $XDGAUTOSTART/*; do
++        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
++        $CMD &
++    done
++fi
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch
new file mode 100644
index 0000000..135b2a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch
@@ -0,0 +1,27 @@
+From 2877156d5bbc11f8d8e8d6aafd138173d2a4bd3b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:31:34 +0200
+Subject: [PATCH 04/12] add Ts_Calibrate_xinput_calibrator Xsession.d script
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/Xsession.d/89xTs_Calibrate_xinput_calibrator |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+ create mode 100644 X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
+
+diff --git a/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator b/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
+new file mode 100644
+index 0000000..6ef4d1e
+--- /dev/null
++++ b/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
+@@ -0,0 +1,7 @@
++#!/bin/sh
++
++if [ -e /usr/bin/xinput_calibrator_once.sh ] ; then
++  if [ -e /etc/pointercal.xinput ] ; then
++    /usr/bin/xinput_calibrator_once.sh
++  fi
++fi
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
new file mode 100644
index 0000000..f5c2c78
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
@@ -0,0 +1,26 @@
+From b01a532ebb525552e23d7169a2aeb55c42b3ec99 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:32:13 +0200
+Subject: [PATCH 05/12] add XWindowManager Xsession.d script
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/Xsession.d/90xXWindowManager |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+ create mode 100644 X11/Xsession.d/90xXWindowManager
+
+diff --git a/X11/Xsession.d/90xXWindowManager b/X11/Xsession.d/90xXWindowManager
+new file mode 100644
+index 0000000..3df8435
+--- /dev/null
++++ b/X11/Xsession.d/90xXWindowManager
+@@ -0,0 +1,6 @@
++#!/bin/sh
++if [ -x $HOME/.Xsession ]; then
++    exec $HOME/.Xsession
++else
++    exec /usr/bin/x-window-manager
++fi
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
new file mode 100644
index 0000000..7ee8572
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
@@ -0,0 +1,26 @@
+From 0c42e1fb84cc2bfe768bed17f3b979aca868cf64 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:34:43 +0200
+Subject: [PATCH 06/12] add support for /etc/X11/xserver-system
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 4c7ed6e..6d8c9df 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -204,3 +204,8 @@ fi
+ if [ "$XSERVER" != "Xorg" ] ; then
+     ARGS="$ARGS $MOUSE $KDRIVEARGS"
+ fi
++
++# let a local script modify the variables                    
++if [ -e /etc/X11/xserver-system ] ; then                    
++       . /etc/X11/xserver-system                    
++fi                    
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
new file mode 100644
index 0000000..8791226
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
@@ -0,0 +1,87 @@
+From 63e6b9a54e1f12dbf7ddbfe3376fff4c382421a5 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:36:02 +0200
+Subject: [PATCH 07/12] use own functions file instead /etc/init.d/functions
+
+* so we don't have to depend on initscripts
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Makefile             |    1 +
+ X11/Xinit.d/11zaurus |    2 +-
+ X11/Xinit.d/12keymap |    2 +-
+ X11/functions        |   11 +++++++++++
+ X11/xserver-common   |    2 +-
+ 5 files changed, 15 insertions(+), 3 deletions(-)
+ create mode 100644 X11/functions
+
+diff --git a/Makefile b/Makefile
+index e2d9af9..caa5de1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,6 +23,7 @@ install-program:
+ 	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
+ 	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
+ 	install -m 755 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
++	install -m 755 X11/functions $(DESTDIR)/etc/X11/functions
+ 	install -d $(DESTDIR)/etc/X11/xmodmap
+ 	install -m 644 X11/xmodmap/*.xmodmap $(DESTDIR)/etc/X11/xmodmap
+ 	install -m 644 X11/xmodmap/xmodmap-* $(DESTDIR)/etc/X11/xmodmap
+diff --git a/X11/Xinit.d/11zaurus b/X11/Xinit.d/11zaurus
+index 54ea6f5..23e7713 100644
+--- a/X11/Xinit.d/11zaurus
++++ b/X11/Xinit.d/11zaurus
+@@ -8,7 +8,7 @@ else
+    CHCK=chkhinge
+ fi
+ 
+-. /etc/init.d/functions
++. /etc/X11/functions
+ 
+ $CHCK -e
+ if [ $? = 12 ]; then
+diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
+index 7eac296..b7a7f2d 100644
+--- a/X11/Xinit.d/12keymap
++++ b/X11/Xinit.d/12keymap
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ 
+-. /etc/init.d/functions
++. /etc/X11/functions
+ 
+ # since kdrive 1.4 there is no default keymap in server
+ xmodmap - </etc/X11/xmodmap/default.xmodmap
+diff --git a/X11/functions b/X11/functions
+new file mode 100644
+index 0000000..a1311ad
+--- /dev/null
++++ b/X11/functions
+@@ -0,0 +1,11 @@
++# -*-Shell-script-*-
++#
++# functions     This file contains functions shared by few X11 scripts
++#               machine_id also exists in /etc/init.d/functions but some
++#               people don't use initscripts anymore
++#
++
++machine_id() { # return the machine ID
++	awk 'BEGIN { FS=": " } /Hardware/ \
++		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
++}
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 6d8c9df..de92bb7 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -30,7 +30,7 @@ if [ -f /etc/profile ]; then
+   . /etc/profile
+ fi
+ 
+-. /etc/init.d/functions
++. /etc/X11/functions
+ 
+ fallback_screen_arg() {
+     geom=`fbset | grep geometry`
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
new file mode 100644
index 0000000..e35e4a7
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
@@ -0,0 +1,40 @@
+From 0ee7bf87e0c83abc79de3a99dfa3c87dd5c5b229 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:37:29 +0200
+Subject: [PATCH 08/12] xserver-common: add dpi and nocursor params for gta01
+ and gta02
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index de92bb7..f76fa5f 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -133,15 +133,19 @@ else
+             ARGS="$ARGS -screen ${SCREEN_SIZE}"
+             DPI="225" ;;
+         "gta01" )
+-            DPI="285"
++            DPI="280"
+             if [ "$XSERVER" != "Xorg" ] ; then
+                 ARGS="$ARGS -screen 480x640"
++            else
++                ARGS="$ARGS -dpi ${DPI} -nocursor"
+             fi
+             ;;
+         "gta02")
+-            DPI="285"
++            DPI="280"
+             if [ "$XSERVER" != "Xorg" ] ; then
+                 ARGS="$ARGS -screen ${SCREEN_SIZE}"
++            else
++                ARGS="$ARGS -dpi ${DPI} -nocursor"
+             fi
+             ;;
+         "motorola_ezx_platform")
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
new file mode 100644
index 0000000..1a0bde8
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
@@ -0,0 +1,32 @@
+From 6d6caecb7172b9b33e7364564b0e6eabf67b6e8b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:40:14 +0200
+Subject: [PATCH 09/12] xserver-common: add support for n900 alias
+ nokia_rx-51_board
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index f76fa5f..86ed17f 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -132,6 +132,13 @@ else
+         "nokia_n800" | "nokia_rx-44" | "nokia_n770")
+             ARGS="$ARGS -screen ${SCREEN_SIZE}"
+             DPI="225" ;;
++        "nokia_rx-51_board" )                                     
++            DPI="267"                                    
++            if [ "$XSERVER" != "Xorg" ] ; then                    
++                ARGS="$ARGS -screen ${SCREEN_SIZE}"               
++            else                                                  
++                ARGS="$ARGS -dpi ${DPI} -nocursor"       
++            fi ;;                                                    
+         "gta01" )
+             DPI="280"
+             if [ "$XSERVER" != "Xorg" ] ; then
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
new file mode 100644
index 0000000..688be40
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
@@ -0,0 +1,27 @@
+From 52003e6b52b1417c1a0e57243d83349addcdacf6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:40:44 +0200
+Subject: [PATCH 10/12] xserver-common: add support for nexus S alias herring
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 86ed17f..5c9a6eb 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -126,6 +126,9 @@ else
+         "htc_tornado")
+             ARGS="$ARGS -hide-cursor"
+             DPI="100" ;;
++        "herring")
++            DPI="235"
++            ARGS="$ARGS -dpi ${DPI} -nocursor";;
+         "generic_omap1510/1610/1710")
+             ARGS="$ARGS -screen ${SCREEN_SIZE}"
+             DPI="225" ;;
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
new file mode 100644
index 0000000..f80456d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
@@ -0,0 +1,28 @@
+From 0ecc978b7d8cb6867646fb2a29523ebef3afa016 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:41:06 +0200
+Subject: [PATCH 11/12] xserver-common: add support for nexus one alias
+ mahimahi
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 5c9a6eb..55594fd 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -129,6 +129,9 @@ else
+         "herring")
+             DPI="235"
+             ARGS="$ARGS -dpi ${DPI} -nocursor";;
++        "mahimahi")
++            DPI="254"
++            ARGS="$ARGS -dpi ${DPI}";;
+         "generic_omap1510/1610/1710")
+             ARGS="$ARGS -screen ${SCREEN_SIZE}"
+             DPI="225" ;;
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
new file mode 100644
index 0000000..54a0329
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
@@ -0,0 +1,33 @@
+From d194f0302582f1ca599f2ea58c15e15f4fd6bdef Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 11 Apr 2012 14:41:52 +0200
+Subject: [PATCH 12/12] xserver-common: add support for gta04 alias
+ OpenPhoenux
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 55594fd..434333e 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -161,6 +161,14 @@ else
+                 ARGS="$ARGS -dpi ${DPI} -nocursor"
+             fi
+             ;;
++        "gta04")
++            DPI="280"
++            if [ "$XSERVER" != "Xorg" ] ; then
++                ARGS="$ARGS -screen ${SCREEN_SIZE}"
++            else
++                ARGS="$ARGS -dpi ${DPI} -nocursor"
++            fi
++            ;;
+         "motorola_ezx_platform")
+             ARGS="$ARGS -screen 240x320"
+             DPI="170" ;;
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xTs_Calibrate.xinput_calibrator.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xTs_Calibrate.xinput_calibrator.patch
deleted file mode 100644
index c04ad96..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xTs_Calibrate.xinput_calibrator.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: xserver-common/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
-===================================================================
---- xserver-common/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator	(revision 0)
-+++ xserver-common/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator	(revision 0)
-@@ -0,0 +1,7 @@
-+#!/bin/sh
-+
-+if [ -e /usr/bin/xinput_calibrator_once.sh ] ; then
-+  if [ -e /etc/pointercal.xinput ] ; then
-+    /usr/bin/xinput_calibrator_once.sh
-+  fi
-+fi
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xdgautostart.sh b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xdgautostart.sh
deleted file mode 100644
index 9886f9f..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xdgautostart.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-XDGAUTOSTART=/etc/xdg/autostart
-if [ -d $XDGAUTOSTART ] ; then
-    for SCRIPT in $XDGAUTOSTART/*; do
-        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
-        $CMD &
-    done
-fi
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/90xXWindowManager.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/90xXWindowManager.patch
deleted file mode 100644
index be5f5ce..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/90xXWindowManager.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: xserver-common/X11/Xsession.d/90xXWindowManager
-===================================================================
---- xserver-common/X11/Xsession.d/90xXWindowManager	(revision 0)
-+++ xserver-common/X11/Xsession.d/90xXWindowManager	(revision 0)
-@@ -0,0 +1,6 @@
-+#!/bin/sh
-+if [ -x $HOME/.Xsession ]; then
-+    exec $HOME/.Xsession
-+else
-+    exec /usr/bin/x-window-manager
-+fi
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
deleted file mode 100644
index f6e36d9..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-xdpyinfo returns 96, but 285 is right value (but 280 is used as it renders 4 columns of illume icons instead of 3 and empty space)
-
-diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 23:27:10.000000000 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-04-28 23:29:07.000000000 +0200
-@@ -133,19 +133,19 @@
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
-         "gta01" )
--            DPI="285"
-+            DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen 480x640"
-             else
--                ARGS="$ARGS -nocursor"
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "gta02")
--            DPI="285"
-+            DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             else
--                ARGS="$ARGS -nocursor"
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "motorola_ezx_platform")
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
deleted file mode 100644
index bd16efc..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 10:44:23.000000000 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-04-28 10:46:41.000000000 +0200
-@@ -136,12 +136,16 @@
-             DPI="285"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen 480x640"
-+            else
-+                ARGS="$ARGS -nocursor"
-             fi
-             ;;
-         "gta02")
-             DPI="285"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS="$ARGS -nocursor"
-             fi
-             ;;
-         "motorola_ezx_platform")
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.xserver-system.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.xserver-system.patch
deleted file mode 100644
index 5d9d5d1..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.xserver-system.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig//X11/xserver-common        2010-04-28 23:27:10.000000000 +0200
-+++ xserver-common-1.33/X11/xserver-common      2010-04-28 23:29:07.000000000 +0200
-@@ -192,3 +196,8 @@
- if [ "$XSERVER" != "Xorg" ] ; then
-     ARGS="$ARGS $MOUSE"
- fi
-+
-+# let a local script modify the variables                    
-+if [ -e /etc/X11/xserver-system ] ; then                    
-+       . /etc/X11/xserver-system                    
-+fi                    
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
deleted file mode 100644
index 8a17c9a..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 95d741d6849a2faddf8c1e930c7250ead90e7bed Mon Sep 17 00:00:00 2001
-From: Klaus Kurzmann <mok@fluxnetz.de>
-Date: Thu, 20 Oct 2011 09:05:43 +0200
-Subject: [PATCH] gta04
-
-Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
----
- X11/xserver-common |    8 ++++++++
- 1 files changed, 8 insertions(+), 0 deletions(-)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 448b262..208bbfd 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -161,6 +161,14 @@ else
-                 ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-+        "gta04")
-+            DPI="280"
-+            if [ "$XSERVER" != "Xorg" ] ; then
-+                ARGS="$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-+            fi
-+            ;;
-         "motorola_ezx_platform")
-             ARGS="$ARGS -screen 240x320"
-             DPI="170" ;;
--- 
-1.7.7
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
deleted file mode 100644
index 4d36f5f..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -uri xserver-common-1.33.orig/X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig/X11/xserver-common	2010-09-14 17:10:35.955430177 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-09-14 17:17:12.484423440 +0200
-@@ -132,6 +132,13 @@
-         "nokia_n800" | "nokia_rx-44" | "nokia_n770")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
-+        "nokia_rx-51_board" )                                     
-+            DPI="267"                                    
-+            if [ "$XSERVER" != "Xorg" ] ; then                    
-+                ARGS="$ARGS -screen ${SCREEN_SIZE}"               
-+            else                                                  
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"       
-+            fi ;;                                                    
-         "gta01" )
-             DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
deleted file mode 100644
index 7d528ae..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: xserver-common-1.34/X11/xserver-common
-===================================================================
---- xserver-common-1.34.orig/X11/xserver-common	2011-10-10 22:36:14.163129002 +0200
-+++ xserver-common-1.34/X11/xserver-common	2011-10-10 22:37:47.513129001 +0200
-@@ -129,6 +129,9 @@
-         "herring")
-             DPI="235"
-             ARGS="$ARGS -dpi ${DPI} -nocursor";;
-+        "mahimahi")
-+            DPI="254"
-+            ARGS="$ARGS -dpi ${DPI}";;
-         "generic_omap1510/1610/1710")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch
deleted file mode 100644
index 1e564ce..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: xserver-common-1.34/X11/xserver-common
-===================================================================
---- xserver-common-1.34.orig/X11/xserver-common	2011-10-09 14:57:10.716896996 +0200
-+++ xserver-common-1.34/X11/xserver-common	2011-10-09 14:57:31.226897012 +0200
-@@ -126,6 +126,9 @@
-         "htc_tornado")
-             ARGS="$ARGS -hide-cursor"
-             DPI="100" ;;
-+        "herring")
-+            DPI="235"
-+            ARGS="$ARGS -dpi ${DPI} -nocursor";;
-         "generic_omap1510/1610/1710")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/gplv2-license.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/gplv2-license.patch
deleted file mode 100644
index ec93253..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/gplv2-license.patch
+++ /dev/null
@@ -1,353 +0,0 @@
-COPYING: add GPLv2 license file
-
-this is a local file recipe and the license file is missing.In order
-to pass the license checksum checking, the license file is needed. So
-this patch add the GPLv2 license file.
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
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
-+  We protect your rights with two steps: (1) copyright the software, and
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, we
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
-+entire whole, and thus to each and every part regardless of who wrote it.
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
-+    1 and 2 above on a medium customarily used for software interchange; or,
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
-+  9. The Free Software Foundation may publish revised and/or new versions
-+of the General Public License from time to time.  Such new versions will
-+be similar in spirit to the present version, but may differ in detail to
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditions
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number of
-+this License, you may choose any version ever published by the Free Software
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the author
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometimes
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software and
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these terms.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it does.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License along
-+    with this program; if not, write to the Free Software Foundation, Inc.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropriate
-+parts of the General Public License.  Of course, the commands you use may
-+be called something other than `show w' and `show c'; they could even be
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program into
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with the
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/setDPI.sh b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/setDPI.sh
deleted file mode 100644
index 04a2edd..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/setDPI.sh
+++ /dev/null
@@ -1,92 +0,0 @@
-#! /bin/sh
-#
-# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
-#
-# Filename: setDPI.sh
-# Date: 09-Apr-06
-
-# This script configures Xft.dpi dependent on your screens DPI. This insures that the same font-size
-# setting of 7 can be used on all machines.
-
-
-XDEFAULTS="/etc/X11/Xdefaults"
-
-
-
-set_dpi() {
-	
-	CURRENT_SETTING="`cat ${XDEFAULTS} | sed -n "/Xft.dpi\:/s/.*\:\(.*\)/\1/p" | sed -n "s/\ //p"`"	
-
-	if test "$CURRENT_SETTING" != "$1"
-	then
-		echo "Using Xft.dpi of $SET_SCREEN_DPI for your $SCREEN_DPI DPI screen"
-		
-		if grep -q "Xft.dpi" "$XDEFAULTS"
-		then
-			cat "${XDEFAULTS}" | sed "s/^Xft.dpi\:.*/Xft.dpi\: $SET_SCREEN_DPI/" > "${XDEFAULTS}_"
-			mv "${XDEFAULTS}_" "${XDEFAULTS}"
-		else
-			echo -e "Xft.dpi: $SET_SCREEN_DPI\n" >> "$XDEFAULTS"
-		fi
-	else
-		echo "Your $SCREEN_DPI DPI screen is already configured."
-	fi
-}
-
-set_rxvt_font() {
-
-	CURRENT_SETTING="`cat ${XDEFAULTS} | sed  -n "/Rxvt\*font/s/\(.*\pixelsize=\)\(.*\)/\2/p"`"
-
-	if test "$1" -gt 100
-	then
-	
-		# Configure the rxvt font-size for your screen here:
-		test "$1" -gt 180 -a "$1" -lt "221" && RXVT_FONT_SIZE=16
-		
-		if test -z "$RXVT_FONT_SIZE"
-		then
-			echo "WARNING: No rxvt font-size configured for a $SCREEN_DPI DPI screen!"
-			echo "Defaulting to size 9"
-			RXVT_FONT_SIZE=9
-		fi
-		
-		if test "$CURRENT_SETTING" != "$RXVT_FONT_SIZE"
-		then
-			echo "Using a rxvt font-size of $RXVT_FONT_SIZE"
-			cat ${XDEFAULTS} | sed "/Rxvt\*font/s/\(.*\pixelsize\)\(=*.*\)/\1=$RXVT_FONT_SIZE/" > ${XDEFAULTS}_
-			mv ${XDEFAULTS}_ ${XDEFAULTS}
-		else
-			echo "The rxvt font-size is already configured"
-		fi 
-	fi
-}
-
-if test -z "$DISPLAY"
-then
-	echo "DISPLAY is not set, aborting..."
-	exit 0
-fi
-
-SCREEN_DPI="`/usr/bin/xdpyinfo | grep "dots per inch" | awk '{print $2}'| sed -n "s/\(.*\)x\(.*\)/\2/p"`"
-
-if test -z "$SCREEN_DPI"
-then
-	echo "WARNING: Couldn't read your screens DPI, defaulting to 100"
-	SCREEN_DPI=100
-fi
-
-# Configure your screen here:
-test "$SCREEN_DPI" -gt 180 -a "$SCREEN_DPI" -lt "221" && SET_SCREEN_DPI=160
-test "$SCREEN_DPI" -gt 90 -a "$SCREEN_DPI" -lt "121" && SET_SCREEN_DPI=100
-
-
-if test -z "$SET_SCREEN_DPI"
-then
-	echo "WARNING: No default configuration found for your $SCREEN_DPI DPI screen!"
-	echo "Using 100 DPI"
-	SET_SCREEN_DPI=100
-fi
-
-set_dpi "$SET_SCREEN_DPI"
-set_rxvt_font "$SCREEN_DPI"
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 4f99a90..b0823bf 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r5"
+PR = "r6"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -11,24 +11,21 @@ SRC_URI[md5sum] = "82f2f84cd96610e8f7b92c700cd31c14"
 SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166cc34210"
 
 SRC_URI_append = " \
-                   file://gplv2-license.patch \
-                   file://setDPI.sh \
-                   file://89xdgautostart.sh \
-                   file://89xTs_Calibrate.xinput_calibrator.patch \
-                   file://90xXWindowManager.patch \
-                   file://Xserver.add.xserver-system.patch \
-                   file://Xserver.add.nocursor.for.gta.patch \
-                   file://Xserver.add.dpi.for.gta.patch \
-                   file://Xserver.n900.patch \
-                   file://Xserver.nexuss.patch \
-                   file://Xserver.nexusone.patch \
-                   file://Xserver.gta04.patch \
+  file://0001-COPYING-add-GPLv2-license-file.patch \
+  file://0002-add-setdpi-Xinit.d-script.patch \
+  file://0003-add-89xdgautostart-Xsession.d-script.patch \
+  file://0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch \
+  file://0005-add-XWindowManager-Xsession.d-script.patch \
+  file://0006-add-support-for-etc-X11-xserver-system.patch \
+  file://0007-use-own-functions-file-instead-etc-init.d-functions.patch \
+  file://0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch \
+  file://0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch \
+  file://0010-xserver-common-add-support-for-nexus-S-alias-herring.patch \
+  file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch \
+  file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
 "
 
-
 do_install_append() {
-        install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
-        install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
         sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/xserver-common
 }
 
-- 
1.7.8.5



