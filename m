Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A479F727C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:24:42 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so1458815wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iq0z96kXdzVW2RaaxaKkWll9LW/jz5z+ZgU1HziU56k=;
	b=cr4yz+HibgUplD0lyI1zmA3FKPPD7vwAfB7AccbwIKVVw9RAqqUyawbXGB2+kBkeYW
	H8Pz7Hh4If4BWpuk1rajGYLIF0rqSTV03ZD4Bs8yqhMj8P34I+cqEBBpf0ZvTMVhA0Np
	fcmdHOGKes2+DuZOysjBBCLk0Y5Vq3L/0TVzhj7CE/XCbjtfKOyISiDPqgmUzcNLP8x4
	skBWOEWp/AkCRrj4E9O32xKsAhxns/NuJ2QYTNFch4Enk3NWizkc91MwPKh1/JtPKDTm
	fOd7nlmtnGU1bEE7GCBxORM6/OTYQm/FA2sVJ2WsYBZ2U/lbelmD3Li6v9/NgT7OOhlh
	tlMg==
X-Received: by 10.180.211.196 with SMTP id ne4mr23571551wic.71.1418905482229; 
	Thu, 18 Dec 2014 04:24:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl11sm8743765wjc.40.2014.12.18.04.24.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:24:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 13:24:45 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141218122445.GC2462@jama>
References: <1418894414-27376-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1418894414-27376-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] xserver-nodm-init: remove recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 12:24:52 -0000
X-Groupsio-MsgNum: 53382
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline

--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 05:20:14PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Remove recipe as this recipe is in OE-core.

No, there is important diff which isn't in oe-core.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../xserver-nodm-init-2.0/gplv2-license.patch      | 353 ---------------=
------
>  .../xserver-nodm-init-2.0/xserver-nodm             |  51 ---
>  .../xserver-nodm-init-2.0/xserver-nodm.conf        |   1 -
>  .../xserver-nodm-init-2.0/xserver-nodm.service     |   9 -
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |  41 ---
>  5 files changed, 455 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-no=
dm-init-2.0/gplv2-license.patch
>  delete mode 100755 meta-oe/recipes-graphics/xserver-nodm-init/xserver-no=
dm-init-2.0/xserver-nodm
>  delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-no=
dm-init-2.0/xserver-nodm.conf
>  delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-no=
dm-init-2.0/xserver-nodm.service
>  delete mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-no=
dm-init_2.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
-2.0/gplv2-license.patch b/meta-oe/recipes-graphics/xserver-nodm-init/xserv=
er-nodm-init-2.0/gplv2-license.patch
> deleted file mode 100644
> index ec93253..0000000
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/gp=
lv2-license.patch
> +++ /dev/null
> @@ -1,353 +0,0 @@
> -COPYING: add GPLv2 license file
> -
> -this is a local file recipe and the license file is missing.In order
> -to pass the license checksum checking, the license file is needed. So
> -this patch add the GPLv2 license file.
> -
> -Signed-off-by: Yu Ke <ke.yu@intel.com>
> -
> -diff --git a/COPYING b/COPYING
> -new file mode 100644
> -index 0000000..d511905
> ---- /dev/null
> -+++ b/COPYING
> -@@ -0,0 +1,339 @@
> -+		    GNU GENERAL PUBLIC LICENSE
> -+		       Version 2, June 1991
> -+
> -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> -+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -+ Everyone is permitted to copy and distribute verbatim copies
> -+ of this license document, but changing it is not allowed.
> -+
> -+			    Preamble
> -+
> -+  The licenses for most software are designed to take away your
> -+freedom to share and change it.  By contrast, the GNU General Public
> -+License is intended to guarantee your freedom to share and change free
> -+software--to make sure the software is free for all its users.  This
> -+General Public License applies to most of the Free Software
> -+Foundation's software and to any other program whose authors commit to
> -+using it.  (Some other Free Software Foundation software is covered by
> -+the GNU Lesser General Public License instead.)  You can apply it to
> -+your programs, too.
> -+
> -+  When we speak of free software, we are referring to freedom, not
> -+price.  Our General Public Licenses are designed to make sure that you
> -+have the freedom to distribute copies of free software (and charge for
> -+this service if you wish), that you receive source code or can get it
> -+if you want it, that you can change the software or use pieces of it
> -+in new free programs; and that you know you can do these things.
> -+
> -+  To protect your rights, we need to make restrictions that forbid
> -+anyone to deny you these rights or to ask you to surrender the rights.
> -+These restrictions translate to certain responsibilities for you if you
> -+distribute copies of the software, or if you modify it.
> -+
> -+  For example, if you distribute copies of such a program, whether
> -+gratis or for a fee, you must give the recipients all the rights that
> -+you have.  You must make sure that they, too, receive or can get the
> -+source code.  And you must show them these terms so they know their
> -+rights.
> -+
> -+  We protect your rights with two steps: (1) copyright the software, and
> -+(2) offer you this license which gives you legal permission to copy,
> -+distribute and/or modify the software.
> -+
> -+  Also, for each author's protection and ours, we want to make certain
> -+that everyone understands that there is no warranty for this free
> -+software.  If the software is modified by someone else and passed on, we
> -+want its recipients to know that what they have is not the original, so
> -+that any problems introduced by others will not reflect on the original
> -+authors' reputations.
> -+
> -+  Finally, any free program is threatened constantly by software
> -+patents.  We wish to avoid the danger that redistributors of a free
> -+program will individually obtain patent licenses, in effect making the
> -+program proprietary.  To prevent this, we have made it clear that any
> -+patent must be licensed for everyone's free use or not licensed at all.
> -+
> -+  The precise terms and conditions for copying, distribution and
> -+modification follow.
> -+
> -+		    GNU GENERAL PUBLIC LICENSE
> -+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> -+
> -+  0. This License applies to any program or other work which contains
> -+a notice placed by the copyright holder saying it may be distributed
> -+under the terms of this General Public License.  The "Program", below,
> -+refers to any such program or work, and a "work based on the Program"
> -+means either the Program or any derivative work under copyright law:
> -+that is to say, a work containing the Program or a portion of it,
> -+either verbatim or with modifications and/or translated into another
> -+language.  (Hereinafter, translation is included without limitation in
> -+the term "modification".)  Each licensee is addressed as "you".
> -+
> -+Activities other than copying, distribution and modification are not
> -+covered by this License; they are outside its scope.  The act of
> -+running the Program is not restricted, and the output from the Program
> -+is covered only if its contents constitute a work based on the
> -+Program (independent of having been made by running the Program).
> -+Whether that is true depends on what the Program does.
> -+
> -+  1. You may copy and distribute verbatim copies of the Program's
> -+source code as you receive it, in any medium, provided that you
> -+conspicuously and appropriately publish on each copy an appropriate
> -+copyright notice and disclaimer of warranty; keep intact all the
> -+notices that refer to this License and to the absence of any warranty;
> -+and give any other recipients of the Program a copy of this License
> -+along with the Program.
> -+
> -+You may charge a fee for the physical act of transferring a copy, and
> -+you may at your option offer warranty protection in exchange for a fee.
> -+
> -+  2. You may modify your copy or copies of the Program or any portion
> -+of it, thus forming a work based on the Program, and copy and
> -+distribute such modifications or work under the terms of Section 1
> -+above, provided that you also meet all of these conditions:
> -+
> -+    a) You must cause the modified files to carry prominent notices
> -+    stating that you changed the files and the date of any change.
> -+
> -+    b) You must cause any work that you distribute or publish, that in
> -+    whole or in part contains or is derived from the Program or any
> -+    part thereof, to be licensed as a whole at no charge to all third
> -+    parties under the terms of this License.
> -+
> -+    c) If the modified program normally reads commands interactively
> -+    when run, you must cause it, when started running for such
> -+    interactive use in the most ordinary way, to print or display an
> -+    announcement including an appropriate copyright notice and a
> -+    notice that there is no warranty (or else, saying that you provide
> -+    a warranty) and that users may redistribute the program under
> -+    these conditions, and telling the user how to view a copy of this
> -+    License.  (Exception: if the Program itself is interactive but
> -+    does not normally print such an announcement, your work based on
> -+    the Program is not required to print an announcement.)
> -+
> -+These requirements apply to the modified work as a whole.  If
> -+identifiable sections of that work are not derived from the Program,
> -+and can be reasonably considered independent and separate works in
> -+themselves, then this License, and its terms, do not apply to those
> -+sections when you distribute them as separate works.  But when you
> -+distribute the same sections as part of a whole which is a work based
> -+on the Program, the distribution of the whole must be on the terms of
> -+this License, whose permissions for other licensees extend to the
> -+entire whole, and thus to each and every part regardless of who wrote i=
t.
> -+
> -+Thus, it is not the intent of this section to claim rights or contest
> -+your rights to work written entirely by you; rather, the intent is to
> -+exercise the right to control the distribution of derivative or
> -+collective works based on the Program.
> -+
> -+In addition, mere aggregation of another work not based on the Program
> -+with the Program (or with a work based on the Program) on a volume of
> -+a storage or distribution medium does not bring the other work under
> -+the scope of this License.
> -+
> -+  3. You may copy and distribute the Program (or a work based on it,
> -+under Section 2) in object code or executable form under the terms of
> -+Sections 1 and 2 above provided that you also do one of the following:
> -+
> -+    a) Accompany it with the complete corresponding machine-readable
> -+    source code, which must be distributed under the terms of Sections
> -+    1 and 2 above on a medium customarily used for software interchange=
; or,
> -+
> -+    b) Accompany it with a written offer, valid for at least three
> -+    years, to give any third party, for a charge no more than your
> -+    cost of physically performing source distribution, a complete
> -+    machine-readable copy of the corresponding source code, to be
> -+    distributed under the terms of Sections 1 and 2 above on a medium
> -+    customarily used for software interchange; or,
> -+
> -+    c) Accompany it with the information you received as to the offer
> -+    to distribute corresponding source code.  (This alternative is
> -+    allowed only for noncommercial distribution and only if you
> -+    received the program in object code or executable form with such
> -+    an offer, in accord with Subsection b above.)
> -+
> -+The source code for a work means the preferred form of the work for
> -+making modifications to it.  For an executable work, complete source
> -+code means all the source code for all modules it contains, plus any
> -+associated interface definition files, plus the scripts used to
> -+control compilation and installation of the executable.  However, as a
> -+special exception, the source code distributed need not include
> -+anything that is normally distributed (in either source or binary
> -+form) with the major components (compiler, kernel, and so on) of the
> -+operating system on which the executable runs, unless that component
> -+itself accompanies the executable.
> -+
> -+If distribution of executable or object code is made by offering
> -+access to copy from a designated place, then offering equivalent
> -+access to copy the source code from the same place counts as
> -+distribution of the source code, even though third parties are not
> -+compelled to copy the source along with the object code.
> -+
> -+  4. You may not copy, modify, sublicense, or distribute the Program
> -+except as expressly provided under this License.  Any attempt
> -+otherwise to copy, modify, sublicense or distribute the Program is
> -+void, and will automatically terminate your rights under this License.
> -+However, parties who have received copies, or rights, from you under
> -+this License will not have their licenses terminated so long as such
> -+parties remain in full compliance.
> -+
> -+  5. You are not required to accept this License, since you have not
> -+signed it.  However, nothing else grants you permission to modify or
> -+distribute the Program or its derivative works.  These actions are
> -+prohibited by law if you do not accept this License.  Therefore, by
> -+modifying or distributing the Program (or any work based on the
> -+Program), you indicate your acceptance of this License to do so, and
> -+all its terms and conditions for copying, distributing or modifying
> -+the Program or works based on it.
> -+
> -+  6. Each time you redistribute the Program (or any work based on the
> -+Program), the recipient automatically receives a license from the
> -+original licensor to copy, distribute or modify the Program subject to
> -+these terms and conditions.  You may not impose any further
> -+restrictions on the recipients' exercise of the rights granted herein.
> -+You are not responsible for enforcing compliance by third parties to
> -+this License.
> -+
> -+  7. If, as a consequence of a court judgment or allegation of patent
> -+infringement or for any other reason (not limited to patent issues),
> -+conditions are imposed on you (whether by court order, agreement or
> -+otherwise) that contradict the conditions of this License, they do not
> -+excuse you from the conditions of this License.  If you cannot
> -+distribute so as to satisfy simultaneously your obligations under this
> -+License and any other pertinent obligations, then as a consequence you
> -+may not distribute the Program at all.  For example, if a patent
> -+license would not permit royalty-free redistribution of the Program by
> -+all those who receive copies directly or indirectly through you, then
> -+the only way you could satisfy both it and this License would be to
> -+refrain entirely from distribution of the Program.
> -+
> -+If any portion of this section is held invalid or unenforceable under
> -+any particular circumstance, the balance of the section is intended to
> -+apply and the section as a whole is intended to apply in other
> -+circumstances.
> -+
> -+It is not the purpose of this section to induce you to infringe any
> -+patents or other property right claims or to contest validity of any
> -+such claims; this section has the sole purpose of protecting the
> -+integrity of the free software distribution system, which is
> -+implemented by public license practices.  Many people have made
> -+generous contributions to the wide range of software distributed
> -+through that system in reliance on consistent application of that
> -+system; it is up to the author/donor to decide if he or she is willing
> -+to distribute software through any other system and a licensee cannot
> -+impose that choice.
> -+
> -+This section is intended to make thoroughly clear what is believed to
> -+be a consequence of the rest of this License.
> -+
> -+  8. If the distribution and/or use of the Program is restricted in
> -+certain countries either by patents or by copyrighted interfaces, the
> -+original copyright holder who places the Program under this License
> -+may add an explicit geographical distribution limitation excluding
> -+those countries, so that distribution is permitted only in or among
> -+countries not thus excluded.  In such case, this License incorporates
> -+the limitation as if written in the body of this License.
> -+
> -+  9. The Free Software Foundation may publish revised and/or new versio=
ns
> -+of the General Public License from time to time.  Such new versions will
> -+be similar in spirit to the present version, but may differ in detail to
> -+address new problems or concerns.
> -+
> -+Each version is given a distinguishing version number.  If the Program
> -+specifies a version number of this License which applies to it and "any
> -+later version", you have the option of following the terms and conditio=
ns
> -+either of that version or of any later version published by the Free
> -+Software Foundation.  If the Program does not specify a version number =
of
> -+this License, you may choose any version ever published by the Free Sof=
tware
> -+Foundation.
> -+
> -+  10. If you wish to incorporate parts of the Program into other free
> -+programs whose distribution conditions are different, write to the auth=
or
> -+to ask for permission.  For software which is copyrighted by the Free
> -+Software Foundation, write to the Free Software Foundation; we sometimes
> -+make exceptions for this.  Our decision will be guided by the two goals
> -+of preserving the free status of all derivatives of our free software a=
nd
> -+of promoting the sharing and reuse of software generally.
> -+
> -+			    NO WARRANTY
> -+
> -+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRA=
NTY
> -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
> -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> -+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRES=
SED
> -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK =
AS
> -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
> -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
> -+REPAIR OR CORRECTION.
> -+
> -+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRI=
TING
> -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAG=
ES,
> -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARI=
SING
> -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMIT=
ED
> -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
> -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OT=
HER
> -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> -+POSSIBILITY OF SUCH DAMAGES.
> -+
> -+		     END OF TERMS AND CONDITIONS
> -+
> -+	    How to Apply These Terms to Your New Programs
> -+
> -+  If you develop a new program, and you want it to be of the greatest
> -+possible use to the public, the best way to achieve this is to make it
> -+free software which everyone can redistribute and change under these te=
rms.
> -+
> -+  To do so, attach the following notices to the program.  It is safest
> -+to attach them to the start of each source file to most effectively
> -+convey the exclusion of warranty; and each file should have at least
> -+the "copyright" line and a pointer to where the full notice is found.
> -+
> -+    <one line to give the program's name and a brief idea of what it do=
es.>
> -+    Copyright (C) <year>  <name of author>
> -+
> -+    This program is free software; you can redistribute it and/or modify
> -+    it under the terms of the GNU General Public License as published by
> -+    the Free Software Foundation; either version 2 of the License, or
> -+    (at your option) any later version.
> -+
> -+    This program is distributed in the hope that it will be useful,
> -+    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+    GNU General Public License for more details.
> -+
> -+    You should have received a copy of the GNU General Public License a=
long
> -+    with this program; if not, write to the Free Software Foundation, I=
nc.,
> -+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -+
> -+Also add information on how to contact you by electronic and paper mail.
> -+
> -+If the program is interactive, make it output a short notice like this
> -+when it starts in an interactive mode:
> -+
> -+    Gnomovision version 69, Copyright (C) year name of author
> -+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `sh=
ow w'.
> -+    This is free software, and you are welcome to redistribute it
> -+    under certain conditions; type `show c' for details.
> -+
> -+The hypothetical commands `show w' and `show c' should show the appropr=
iate
> -+parts of the General Public License.  Of course, the commands you use m=
ay
> -+be called something other than `show w' and `show c'; they could even be
> -+mouse-clicks or menu items--whatever suits your program.
> -+
> -+You should also get your employer (if you work as a programmer) or your
> -+school, if any, to sign a "copyright disclaimer" for the program, if
> -+necessary.  Here is a sample; alter the names:
> -+
> -+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
> -+  `Gnomovision' (which makes passes at compilers) written by James Hack=
er.
> -+
> -+  <signature of Ty Coon>, 1 April 1989
> -+  Ty Coon, President of Vice
> -+
> -+This General Public License does not permit incorporating your program =
into
> -+proprietary programs.  If your program is a subroutine library, you may
> -+consider it more useful to permit linking proprietary applications with=
 the
> -+library.  If this is what you want to do, use the GNU Lesser General
> -+Public License instead of this License.
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
-2.0/xserver-nodm b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm=
-init-2.0/xserver-nodm
> deleted file mode 100755
> index d2e2f86..0000000
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xs=
erver-nodm
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/init.d/functions
> -
> -for x in $(cat /proc/cmdline); do
> -        case $x in
> -        x11=3Dfalse)
> -		echo "X Server disabled"=20
> -		exit 0;
> -                ;;
> -        esac
> -done
> -
> -case "$1" in
> -  start)
> -    # We don't want this script to block the rest of the boot process
> -    if [ "$2" !=3D "background" ]; then
> -      $0 $1 background &
> -    else
> -       # work around from /etc/X11/Xinit
> -       export USER=3Droot
> -       export HOME=3D/home/root
> -       if [ ! -d $HOME ] && [ -d /root ]; then
> -         HOME=3D/root
> -       fi
> -
> -       . /etc/profile
> -
> -       echo "Starting Xserver"
> -       . /etc/X11/xserver-common
> -       xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsess=
ion.log 2>&1
> -    fi=20
> -  ;;
> -
> -  stop)
> -        echo "Stopping XServer"
> -        killproc xinit
> -  ;;
> -
> -  restart)
> -	$0 stop
> -        sleep 1
> -        $0 start
> -  ;;
> -
> -  *)
> -        echo "usage: $0 { start | stop | restart }"
> -  ;;
> -esac
> -
> -exit 0
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
-2.0/xserver-nodm.conf b/meta-oe/recipes-graphics/xserver-nodm-init/xserver=
-nodm-init-2.0/xserver-nodm.conf
> deleted file mode 100644
> index 3c0582a..0000000
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xs=
erver-nodm.conf
> +++ /dev/null
> @@ -1 +0,0 @@
> -HOME=3D/home/root
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
-2.0/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xser=
ver-nodm-init-2.0/xserver-nodm.service
> deleted file mode 100644
> index 94d221e..0000000
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xs=
erver-nodm.service
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -[Unit]
> -Description=3DXserver startup with a display manager
> -
> -[Service]
> -EnvironmentFile=3D/etc/default/xserver-nodm
> -ExecStart=3D/etc/X11/Xserver
> -
> -[Install]
> -Alias=3Ddisplay-manager.service
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.=
bb
> deleted file mode 100644
> index 47470fb..0000000
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY =3D "Simple Xserver Init Script (no dm)"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -SECTION =3D "x11"
> -
> -PR =3D "r22"
> -
> -SRC_URI =3D "file://xserver-nodm \
> -           file://gplv2-license.patch \
> -           file://xserver-nodm.service \
> -           file://xserver-nodm.conf \
> -"
> -S =3D "${WORKDIR}"
> -
> -inherit allarch update-rc.d systemd
> -
> -INITSCRIPT_NAME =3D "xserver-nodm"
> -INITSCRIPT_PARAMS =3D "start 01 5 2 . stop 01 0 1 6 ."
> -INITSCRIPT_PARAMS_shr =3D "start 90 5 2 . stop 90 0 1 6 ."
> -
> -do_install() {
> -    install -d ${D}${sysconfdir}/init.d
> -    install xserver-nodm ${D}${sysconfdir}/init.d
> -
> -    install -d ${D}${sysconfdir}/default
> -
> -    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> -        install -d ${D}${systemd_unitdir}/system
> -        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
> -        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_un=
itdir}/system
> -    fi
> -}
> -
> -RDEPENDS_${PN} =3D "xserver-common (>=3D 1.30) xinit"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "xserver-nodm.service"
> -
> -FILES_${PN} +=3D "${sysconfdir}/default/xserver-nodm"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSSx40ACgkQN1Ujt2V2gBxIuQCfZWbvPBQZK9T4Aq26Ne1MbRvn
yGMAoJBk5XsgxNfl8lDip8myjSA5emvQ
=lEXN
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
