Return-Path: <B40290@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 72D326A465
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:38:09 +0000 (UTC)
Received: from mail198-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Wed, 10 Jul 2013 03:38:10 +0000
Received: from mail198-ch1 (localhost [127.0.0.1])	by
	mail198-ch1-R.bigfish.com (Postfix) with ESMTP id 229923800EF	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:38:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zzbb2dI9371IcfdI542Ic8kzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch17326ah8275bh8275dhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail198-ch1 (localhost.localdomain [127.0.0.1]) by mail198-ch1
	(MessageSwitch) id 1373427488844533_23365;
	Wed, 10 Jul 2013 03:38:08 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.239])	by mail198-ch1.bigfish.com (Postfix) with ESMTP id
	C0CB1340092	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:38:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Jul 2013 03:38:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Wed, 10 Jul 2013 03:40:20 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r6A3c3CZ010295;	Tue, 9 Jul 2013 20:38:04 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jul 2013 11:38:01 +0800
Message-ID: <1373427481-16273-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-oe][PATCH] licences: Add iozone3,SMAIL_GPL,NewBSD
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
X-List-Received-Date: Wed, 10 Jul 2013 03:38:09 -0000
Content-Type: text/plain

      *fix the fllowing warning
      |WARNING:debianutils: No generic license file exists for: SMAIL_GPL in any provider
      |WARNING:iozone3: No generic license file exists for: iozone3 in any provider
      |WARNING:iperf: No generic license file exists for: NewBSD in any provider

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/conf/layer.conf    |    2 +
 meta-oe/licenses/NewBSD    |   40 +++++++++++
 meta-oe/licenses/SMAIL_GPL |  164 ++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/licenses/iozone3   |   62 +++++++++++++++++
 4 files changed, 268 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/licenses/NewBSD
 create mode 100644 meta-oe/licenses/SMAIL_GPL
 create mode 100644 meta-oe/licenses/iozone3

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 68f7823..bc025bb 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -23,6 +23,8 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_openembedded-layer = "6"
 
+LICENSE_PATH += "${LAYERDIR}/licenses"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal-xinput \
   mplayer-common \
diff --git a/meta-oe/licenses/NewBSD b/meta-oe/licenses/NewBSD
new file mode 100644
index 0000000..9a8683d
--- /dev/null
+++ b/meta-oe/licenses/NewBSD
@@ -0,0 +1,40 @@
+Copyright (c) 1999-2007, The Board of Trustees of the University of Illinois
+All Rights Reserved.
+
+Iperf performance test
+Mark Gates
+Ajay Tirumala
+Jim Ferguson
+Jon Dugan
+Feng Qin
+Kevin Gibbs
+John Estabrook
+National Laboratory for Applied Network Research 
+National Center for Supercomputing Applications 
+University of Illinois at Urbana-Champaign 
+http://www.ncsa.uiuc.edu
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software (Iperf) and associated documentation files (the "Software"),
+to deal in the Software without restriction, including without limitation the
+rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+
+Redistributions of source code must retain the above copyright notice, this
+list of conditions and the following disclaimers.
+
+Redistributions in binary form must reproduce the above copyright notice, this
+list of conditions and the following disclaimers in the documentation and/or
+other materials provided with the distribution.
+
+Neither the names of the University of Illinois, NCSA, nor the names of its
+contributors may be used to endorse or promote products derived from this
+Software without specific prior written permission.  THE SOFTWARE IS PROVIDED
+"AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
+LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
+AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTIBUTORS OR COPYRIGHT HOLDERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
+CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta-oe/licenses/SMAIL_GPL b/meta-oe/licenses/SMAIL_GPL
new file mode 100644
index 0000000..dfc3fd1
--- /dev/null
+++ b/meta-oe/licenses/SMAIL_GPL
@@ -0,0 +1,164 @@
+This is the Debian GNU/Linux package debianutils.
+
+It is an original Debian package.  Programs in it were maintained by
+Guy Maor <maor@debian.org>, and are now maintained by Clint Adams
+<schizo@debian.org>.
+
+All its programs except readlink, savelog, and which may be
+redistributed under the terms of the GNU GPL, Version 2 or later,
+found on Debian systems in the file /usr/share/common-licenses/GPL.
+
+which is in the public domain.
+
+readlink is Copyright (c) 1997 Kenneth Stailey, and may also be
+distributed under the terms of the BSD copyright.
+
+savelog may be redistributed under the following terms: (The rest of
+this file consists of savelog's distribution terms.)
+
+#ident	"@(#)smail:RELEASE-3_2:COPYING,v 1.2 1996/06/14 18:59:10 woods Exp"
+
+		     SMAIL GENERAL PUBLIC LICENSE
+		       (Clarified 11 Feb 1988)
+
+ Copyright (C)  1988 Landon Curt Noll & Ronald S. Karr
+ Copyright (C)  1992 Ronald S. Karr
+ Copyleft (GNU) 1988 Landon Curt Noll & Ronald S. Karr
+
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license, but changing it is not allowed.  You can also
+ use this wording to make the terms for other programs.
+
+  The license agreements of most software companies keep you at the
+mercy of those companies.  By contrast, our general public license is
+intended to give everyone the right to share SMAIL.  To make sure that
+you get the rights we want you to have, we need to make restrictions
+that forbid anyone to deny you these rights or to ask you to surrender
+the rights.  Hence this license agreement.
+
+  Specifically, we want to make sure that you have the right to give
+away copies of SMAIL, that you receive source code or else can get it
+if you want it, that you can change SMAIL or use pieces of it in new
+free programs, and that you know you can do these things.
+
+  To make sure that everyone has such rights, we have to forbid you to
+deprive anyone else of these rights.  For example, if you distribute
+copies of SMAIL, you must give the recipients all the rights that you
+have.  You must make sure that they, too, receive or can get the
+source code.  And you must tell them their rights.
+
+  Also, for our own protection, we must make certain that everyone
+finds out that there is no warranty for SMAIL.  If SMAIL is modified by
+someone else and passed on, we want its recipients to know that what
+they have is not what we distributed, so that any problems introduced
+by others will not reflect on our reputation.
+
+  Therefore we (Landon Curt Noll and Ronald S. Karr) make the following 
+terms which say what you must do to be allowed to distribute or change 
+SMAIL.
+
+
+			COPYING POLICIES
+
+  1. You may copy and distribute verbatim copies of SMAIL source code
+as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy a valid copyright notice "Copyright
+(C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is
+appropriate); keep intact the notices on all files that refer to this
+License Agreement and to the absence of any warranty; and give any
+other recipients of the SMAIL program a copy of this License
+Agreement along with the program.  You may charge a distribution fee
+for the physical act of transferring a copy.
+
+  2. You may modify your copy or copies of SMAIL or any portion of it,
+and copy and distribute such modifications under the terms of
+Paragraph 1 above, provided that you also do the following:
+
+    a) cause the modified files to carry prominent notices stating
+    that you changed the files and the date of any change; and
+
+    b) cause the whole of any work that you distribute or publish,
+    that in whole or in part contains or is a derivative of SMAIL or
+    any part thereof, to be licensed at no charge to all third
+    parties on terms identical to those contained in this License
+    Agreement (except that you may choose to grant more extensive
+    warranty protection to some or all third parties, at your option).
+
+    c) You may charge a distribution fee for the physical act of
+    transferring a copy, and you may at your option offer warranty
+    protection in exchange for a fee.
+
+Mere aggregation of another unrelated program with this program (or its
+derivative) on a volume of a storage or distribution medium does not bring
+the other program under the scope of these terms.
+
+  3. You may copy and distribute SMAIL (or a portion or derivative of it,
+under Paragraph 2) in object code or executable form under the terms of
+Paragraphs 1 and 2 above provided that you also do one of the following:
+
+    a) accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of
+    Paragraphs 1 and 2 above; or,
+
+    b) accompany it with a written offer, valid for at least three
+    years, to give any third party free (except for a nominal
+    shipping charge) a complete machine-readable copy of the
+    corresponding source code, to be distributed under the terms of
+    Paragraphs 1 and 2 above; or,
+
+    c) accompany it with the information you received as to where the
+    corresponding source code may be obtained.  (This alternative is
+    allowed only for non-commercial distribution and only if you
+    received the program in object code or executable form alone.)
+
+For an executable file, complete source code means all the source code for
+all modules it contains; but, as a special exception, it need not include
+source code for modules which are standard libraries that accompany the
+operating system on which the executable file runs.
+
+  4. You may not copy, sublicense, distribute or transfer SMAIL
+except as expressly provided under this License Agreement.  Any attempt
+otherwise to copy, sublicense, distribute or transfer SMAIL is void and
+your rights to use the program under this License agreement shall be
+automatically terminated.  However, parties who have received computer
+software programs from you with this License Agreement will not have
+their licenses terminated so long as such parties remain in full compliance.
+
+  5. If you wish to incorporate parts of SMAIL into other free
+programs whose distribution conditions are different, write to Landon
+Curt Noll & Ronald S. Karr via the Free Software Foundation at 51
+Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet
+worked out a simple rule that can be stated here, but we will often
+permit this.  We will be guided by the two goals of preserving the
+free status of all derivatives of our free software and of promoting
+the sharing and reuse of software.
+
+Your comments and suggestions about our licensing policies and our
+software are welcome!  This contract was based on the contract made by
+the Free Software Foundation.  Please contact the Free Software
+Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
+USA, or call (617) 542-5942 for details on copylefted material in
+general.
+
+		       NO WARRANTY
+
+  BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO
+WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR
+OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,
+EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH
+YOU.  SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &
+RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE
+SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
+(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE
+BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY
+ANY OTHER PARTY.
diff --git a/meta-oe/licenses/iozone3 b/meta-oe/licenses/iozone3
new file mode 100644
index 0000000..3468fa9
--- /dev/null
+++ b/meta-oe/licenses/iozone3
@@ -0,0 +1,62 @@
+LICENSE:
+
+ Copyright 1991, 1992, 1994, 1998, 1999, 2002   William D. Norcott
+
+ License to freely use and distribute this software is hereby granted 
+ by the author, subject to the condition that this copyright notice 
+ remains intact.  The author retains the exclusive right to publish 
+ derivative works based on this work, including, but not limited to
+ revised versions of this work.
+
+
+
+Below is author reply to question about distributing iozone3 in
+OpenEmbedded:
+
+========================================================================
+
+Marcin,
+
+        Re-distribution is permitted as long as the copyright is
+    maintained and the source code is not changed. I do not
+    see a problem with your mods to enable fileop for Linux-arm,
+    as these mods have been returned to the Iozone folks,
+    and they have been accepted for inclusion in the next
+    release :-)
+
+Thank you for your contribution,
+Don Capps
+
+----- Original Message ----- 
+From: "Marcin Juszkiewicz" <firma@hrw.one.pl>
+To: "Don Capps" <don.capps2@verizon.net>; "William D. Norcott" 
+<wnorcott@us.oracle.com>
+Sent: Sunday, October 29, 2006 4:55 PM
+Subject: iozone3 263 patch for arm and License question
+
+
+> Morning
+>
+> I want to include iozone3 in OpenEmbedded [1] metadata to give it for
+> other developers. Currently OE is used to build few distributions for
+> misc platforms: ARM, SH3, SH4, x86, PowerPC and different types of
+> machines (PDA, settopbox, devboards, desktops, thin clients, routers).
+>
+> According to your distribution of derivations is forbidden. Packaging
+> iozone3 in OpenEmbedded will not involve any source code changes. But
+> when I was building it for ARM I discovered that fileop binary was not
+> built - so I created patch for it (attached). Not yet tested it on target
+> device.
+>
+> Thus, I seek your written permission via e-mail to distribute a package of
+> the unmodified source code and also a package of the pre-compiled binary.
+> Your copyright statement will be included in the package.
+>
+>
+> 1. http://www.openembedded.org/
+>
+> Regards
+> -- 
+> JID: hrw-jabber.org
+> OpenEmbedded developer/consultant
+
-- 
1.7.5.4



