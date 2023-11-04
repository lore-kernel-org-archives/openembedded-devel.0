Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43343C05022
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5520.1699083060581035882
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=auAOf/iJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e4MKy8G/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b993e029a-01002cc3-6988-4773-a592-37cf0ae2b7c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Gdq1ZG2pykDdd5qsYz1do2Whj3iq6qSSK3Ue4E/yeaw=;
	b=auAOf/iJ+IuN/vU9Sde8DyDnDCBkGSExqNLZ5lr26SI13fW5YpJxi9lQlzu4/nFr
	pB3hc92zD8sUktyZs12z6YPCsITgLJpqSjXo6wTdOPhJ8tJBpmPNnz76V9znb/hSUJM
	U6sPoZBvy6yob0QBTDxlRzAEr5LFjJJQ496Zz3wc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Gdq1ZG2pykDdd5qsYz1do2Whj3iq6qSSK3Ue4E/yeaw=;
	b=e4MKy8G/wiw5T2EzrvLoGmFRzanZEND+as9CDeHXIBHQgjj268ULrdV4oeP1jt4E
	eXa5gDE+lD21K9giGWzkoV07mxgAYWZrIp+JVKyzXs3D29P2xz1szLcWG+jlGdJpMIX
	9+5dsRsQOUKyRdQsmb5ZmtpxHvzekiy0uo2pEXHc=
Content-Type: multipart/mixed; boundary="===============8790536723247011404=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-genmon-plugin: upgrading to 4.2.0 SUCCEEDED
Message-ID: <0101018b993e029a-01002cc3-6988-4773-a592-37cf0ae2b7c7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106318

--===============8790536723247011404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-genmon-plugin* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-genmon-plugin-upgrade-4.1.1-4.2.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From b66d0028875479b44c5ed4b807aef06f89380033 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:21:10 +0000
Subject: [PATCH] xfce4-genmon-plugin: upgrade 4.1.1 -> 4.2.0

---
 .../genmon/xfce4-genmon-plugin_4.1.1.bb       |   8 -
 .../genmon/xfce4-genmon-plugin_4.2.0.bb       | 184 ++++++++++++++++++
 2 files changed, 184 insertions(+), 8 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
deleted file mode 100644
index d792bc047..000000000
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
-
-inherit xfce-panel-plugin
-
-SRC_URI[sha256sum] = "b2119fd0ff19fa293b97ec97b0de8e241799e08b86218515167c568bd9b50135"
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
new file mode 100644
index 000000000..85373fbce
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
@@ -0,0 +1,184 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,8 +1,8 @@
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# -		       Version 2.1, February 1999
+# +                  GNU LESSER GENERAL PUBLIC LICENSE
+# +                       Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# + 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -10,7 +10,7 @@
+#   as the successor of the GNU Library Public License, version 2, hence
+#   the version number 2.1.]
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -55,7 +55,7 @@
+#  that what they have is not the original version, so that the original
+#  author's reputation will not be affected by problems that might be
+#  introduced by others.
+# -
+# +
+#    Finally, software patents pose a constant threat to the existence of
+#  any free program.  We wish to make sure that a company cannot
+#  effectively restrict the users of a free program by obtaining a
+# @@ -111,8 +111,8 @@
+#  "work based on the library" and a "work that uses the library".  The
+#  former contains code derived from the library, whereas the latter must
+#  be combined with the library in order to run.
+# -
+# -		  GNU LESSER GENERAL PUBLIC LICENSE
+# +
+# +                  GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License Agreement applies to any software library or other
+# @@ -146,7 +146,7 @@
+#  on the Library (independent of the use of the Library in a tool for
+#  writing it).  Whether that is true depends on what the Library does
+#  and what the program that uses the Library does.
+# -  
+# +
+#    1. You may copy and distribute verbatim copies of the Library's
+#  complete source code as you receive it, in any medium, provided that
+#  you conspicuously and appropriately publish on each copy an
+# @@ -158,7 +158,7 @@
+#    You may charge a fee for the physical act of transferring a copy,
+#  and you may at your option offer warranty protection in exchange for a
+#  fee.
+# -
+# +
+#    2. You may modify your copy or copies of the Library or any portion
+#  of it, thus forming a work based on the Library, and copy and
+#  distribute such modifications or work under the terms of Section 1
+# @@ -216,7 +216,7 @@
+#  ordinary GNU General Public License has appeared, then you can specify
+#  that version instead if you wish.)  Do not make any other change in
+#  these notices.
+# -
+# +
+#    Once this change is made in a given copy, it is irreversible for
+#  that copy, so the ordinary GNU General Public License applies to all
+#  subsequent copies and derivative works made from that copy.
+# @@ -267,7 +267,7 @@
+#  distribute the object code for the work under the terms of Section 6.
+#  Any executables containing that work also fall under Section 6,
+#  whether or not they are linked directly with the Library itself.
+# -
+# +
+#    6. As an exception to the Sections above, you may also combine or
+#  link a "work that uses the Library" with the Library to produce a
+#  work containing portions of the Library, and distribute that work
+# @@ -329,7 +329,7 @@
+#  accompany the operating system.  Such a contradiction means you cannot
+#  use both them and the Library together in an executable that you
+#  distribute.
+# -
+# +
+#    7. You may place library facilities that are a work based on the
+#  Library side-by-side in a single library together with other library
+#  facilities not covered by this License, and distribute such a combined
+# @@ -370,7 +370,7 @@
+#  restrictions on the recipients' exercise of the rights granted herein.
+#  You are not responsible for enforcing compliance by third parties with
+#  this License.
+# -
+# +
+#    11. If, as a consequence of a court judgment or allegation of patent
+#  infringement or for any other reason (not limited to patent issues),
+#  conditions are imposed on you (whether by court order, agreement or
+# @@ -422,7 +422,7 @@
+#  the Free Software Foundation.  If the Library does not specify a
+#  license version number, you may choose any version ever published by
+#  the Free Software Foundation.
+# -
+# +
+#    14. If you wish to incorporate parts of the Library into other free
+#  programs whose distribution conditions are incompatible with these,
+#  write to the author to ask for permission.  For software which is
+# @@ -432,7 +432,7 @@
+#  of all derivatives of our free software and of promoting the sharing
+#  and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+#  WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+# @@ -455,4 +455,48 @@
+#  SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+#  DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +           How to Apply These Terms to Your New Libraries
+# +
+# +  If you develop a new library, and you want it to be of the greatest
+# +possible use to the public, we recommend making it free software that
+# +everyone can redistribute and change.  You can do so by permitting
+# +redistribution under these terms (or, alternatively, under the terms of the
+# +ordinary General Public License).
+# +
+# +  To apply these terms, attach the following notices to the library.  It is
+# +safest to attach them to the start of each source file to most effectively
+# +convey the exclusion of warranty; and each file should have at least the
+# +"copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the library's name and a brief idea of what it does.>
+# +    Copyright (C) <year>  <name of author>
+# +
+# +    This library is free software; you can redistribute it and/or
+# +    modify it under the terms of the GNU Lesser General Public
+# +    License as published by the Free Software Foundation; either
+# +    version 2.1 of the License, or (at your option) any later version.
+# +
+# +    This library is distributed in the hope that it will be useful,
+# +    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# +    Lesser General Public License for more details.
+# +
+# +    You should have received a copy of the GNU Lesser General Public
+# +    License along with this library; if not, write to the Free Software
+# +    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +You should also get your employer (if you work as a programmer) or your
+# +school, if any, to sign a "copyright disclaimer" for the library, if
+# +necessary.  Here is a sample; alter the names:
+# +
+# +  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+# +  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+# +
+# +  <signature of Ty Coon>, 1 April 1990
+# +  Ty Coon, President of Vice
+# +
+# +That's all there is to it!
+# 
+#
+
+DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
+
+inherit xfce-panel-plugin
+
+SRC_URI[sha256sum] = "948d08ee5f2140847f109b531bc1d4cc6268496913ea7600d3c5ad89025a0362"
-- 
2.39.2


--===============8790536723247011404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-genmon-plugin: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-genmon-plugin/4.1/xfce4-genmon-plugin-4.1.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-genmon-plugin/4.2/xfce4-genmon-plugin-4.2.0.tar.bz2"
packages/core2-64-poky-linux/xfce4-genmon-plugin: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dbg: RRECOMMENDS: added "xfconf-dbg"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dbg: PKGSIZE changed from 76416 to 82608 (+8%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dbg: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dbg: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dev: RRECOMMENDS: added "xfconf-dev"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dev: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dev: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-doc: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-doc: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-am: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-am: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ar: PKGSIZE changed from 1652 to 1713 (+4%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ar: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ar: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ast: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ast: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-be: PKGSIZE changed from 3043 to 3092 (+2%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-be: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-be: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-bg: PKGSIZE changed from 2931 to 3314 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-bg: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-bg: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ca: PKGSIZE changed from 2485 to 2540 (+2%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ca: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ca: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-cs: PKGSIZE changed from 2506 to 2790 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-cs: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-cs: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-da: PKGSIZE changed from 2367 to 2614 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-da: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-da: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-de: PKGSIZE changed from 2551 to 2832 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-de: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-de: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-el: PKGSIZE changed from 2597 to 3383 (+30%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-el: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-el: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-au: PKGSIZE changed from 2004 to 2063 (+3%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-au: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-au: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-ca: PKGSIZE changed from 2137 to 2512 (+18%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-ca: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-ca: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-gb: PKGSIZE changed from 1461 to 2562 (+75%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-gb: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-gb: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-es: PKGSIZE changed from 2449 to 2749 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-es: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-es: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-et: PKGSIZE changed from 2363 to 2558 (+8%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-et: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-et: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-eu: PKGSIZE changed from 2333 to 2575 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-eu: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-eu: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fi: PKGSIZE changed from 1419 to 1479 (+4%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fi: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fi: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fr: PKGSIZE changed from 2516 to 2836 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fr: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fr: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-gl: PKGSIZE changed from 2442 to 2691 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-gl: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-gl: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-he: PKGSIZE changed from 2637 to 2913 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-he: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-he: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hi: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hi: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hr: PKGSIZE changed from 2205 to 2501 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hr: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hr: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hu: PKGSIZE changed from 2310 to 2364 (+2%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hu: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hu: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hy-am: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hy-am: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hye: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hye: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-id: PKGSIZE changed from 2360 to 2622 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-id: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-id: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ie: PKGSIZE changed from 2145 to 2193 (+2%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ie: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ie: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-is: PKGSIZE changed from 2113 to 2170 (+3%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-is: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-is: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-it: PKGSIZE changed from 2408 to 2714 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-it: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-it: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ja: PKGSIZE changed from 2616 to 2881 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ja: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ja: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-kk: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-kk: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ko: PKGSIZE changed from 2252 to 2748 (+22%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ko: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ko: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lt: PKGSIZE changed from 2585 to 2862 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lt: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lt: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lv: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lv: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ms: PKGSIZE changed from 2098 to 2592 (+24%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ms: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ms: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nb: PKGSIZE changed from 2365 to 2599 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nb: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nb: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nl: PKGSIZE changed from 2437 to 2713 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nl: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nl: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-oc: PKGSIZE changed from 2079 to 2325 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-oc: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-oc: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pl: PKGSIZE changed from 2584 to 2845 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pl: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pl: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt-br: PKGSIZE changed from 2465 to 2769 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt-br: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt-br: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt: PKGSIZE changed from 2384 to 2697 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ru: PKGSIZE changed from 2844 to 3377 (+19%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ru: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ru: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sk: PKGSIZE changed from 2157 to 2832 (+31%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sk: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sk: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sl: PKGSIZE changed from 2257 to 2668 (+18%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sl: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sl: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sq: PKGSIZE changed from 2519 to 2803 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sq: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sq: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sr: PKGSIZE changed from 3145 to 3475 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sr: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sr: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sv: PKGSIZE changed from 2399 to 2658 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sv: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sv: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-th: PKGSIZE changed from 2600 to 3512 (+35%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-th: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-th: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-tr: PKGSIZE changed from 2440 to 2689 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-tr: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-tr: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ug: PKGSIZE changed from 1753 to 1800 (+3%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ug: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ug: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-uk: PKGSIZE changed from 2955 to 3545 (+20%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-uk: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-uk: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ur-pk: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ur-pk: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ur: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ur: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-cn: PKGSIZE changed from 2313 to 2538 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-cn: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-cn: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-tw: PKGSIZE changed from 2317 to 2542 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-tw: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-zh-tw: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-src: PKGSIZE changed from 59327 to 71993 (+21%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-src: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-src: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-staticdev: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-staticdev: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin: RDEPENDS: added "xfconf (['>= 4.18.0'])"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin: PKGSIZE changed from 75492 to 79585 (+5%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin: PV changed from "4.1.1" to "4.2.0"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin: PKGV changed from 4.1.1 [default] to 4.2.0 [default]

--===============8790536723247011404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dbg: RRECOMMENDS: added "xfconf-dbg"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-dev: RRECOMMENDS: added "xfconf-dev"
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-bg: PKGSIZE changed from 2931 to 3314 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-cs: PKGSIZE changed from 2506 to 2790 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-da: PKGSIZE changed from 2367 to 2614 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-de: PKGSIZE changed from 2551 to 2832 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-el: PKGSIZE changed from 2597 to 3383 (+30%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-ca: PKGSIZE changed from 2137 to 2512 (+18%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-en-gb: PKGSIZE changed from 1461 to 2562 (+75%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-es: PKGSIZE changed from 2449 to 2749 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-eu: PKGSIZE changed from 2333 to 2575 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-fr: PKGSIZE changed from 2516 to 2836 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-gl: PKGSIZE changed from 2442 to 2691 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-he: PKGSIZE changed from 2637 to 2913 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-hr: PKGSIZE changed from 2205 to 2501 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-id: PKGSIZE changed from 2360 to 2622 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-it: PKGSIZE changed from 2408 to 2714 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ja: PKGSIZE changed from 2616 to 2881 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ko: PKGSIZE changed from 2252 to 2748 (+22%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-lt: PKGSIZE changed from 2585 to 2862 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ms: PKGSIZE changed from 2098 to 2592 (+24%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-nl: PKGSIZE changed from 2437 to 2713 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-oc: PKGSIZE changed from 2079 to 2325 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pl: PKGSIZE changed from 2584 to 2845 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt-br: PKGSIZE changed from 2465 to 2769 (+12%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-pt: PKGSIZE changed from 2384 to 2697 (+13%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-ru: PKGSIZE changed from 2844 to 3377 (+19%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sk: PKGSIZE changed from 2157 to 2832 (+31%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sl: PKGSIZE changed from 2257 to 2668 (+18%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sq: PKGSIZE changed from 2519 to 2803 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sr: PKGSIZE changed from 3145 to 3475 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-sv: PKGSIZE changed from 2399 to 2658 (+11%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-th: PKGSIZE changed from 2600 to 3512 (+35%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-tr: PKGSIZE changed from 2440 to 2689 (+10%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-locale-uk: PKGSIZE changed from 2955 to 3545 (+20%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin-src: PKGSIZE changed from 59327 to 71993 (+21%)
packages/core2-64-poky-linux/xfce4-genmon-plugin/xfce4-genmon-plugin: RDEPENDS: added "xfconf (['>= 4.18.0'])"

--===============8790536723247011404==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-genmon-plugin-upgrade-4.1.1-4.2.0.patch"

RnJvbSBiNjZkMDAyODg3NTQ3OWI0NGM1ZWQ0YjgwN2FlZjA2Zjg5MzgwMDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoyMToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWdlbm1vbi1wbHVnaW46IHVwZ3JhZGUgNC4xLjEgLT4gNC4yLjAKCi0tLQogLi4uL2dlbm1v
bi94ZmNlNC1nZW5tb24tcGx1Z2luXzQuMS4xLmJiICAgICAgIHwgICA4IC0KIC4uLi9nZW5tb24v
eGZjZTQtZ2VubW9uLXBsdWdpbl80LjIuMC5iYiAgICAgICB8IDE4NCArKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9nZW5tb24v
eGZjZTQtZ2VubW9uLXBsdWdpbl80LjEuMS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEteGZj
ZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZ2VubW9uL3hmY2U0LWdlbm1vbi1wbHVnaW5fNC4yLjAu
YmIKCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL2dlbm1vbi94
ZmNlNC1nZW5tb24tcGx1Z2luXzQuMS4xLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1
Z2lucy9nZW5tb24veGZjZTQtZ2VubW9uLXBsdWdpbl80LjEuMS5iYgpkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggZDc5MmJjMDQ3Li4wMDAwMDAwMDAKLS0tIGEvbWV0YS14ZmNlL3JlY2lw
ZXMtcGFuZWwtcGx1Z2lucy9nZW5tb24veGZjZTQtZ2VubW9uLXBsdWdpbl80LjEuMS5iYgorKysg
L2Rldi9udWxsCkBAIC0xLDggKzAsMCBAQAotREVTQ1JJUFRJT04gPSAiVGhpcyBwbHVnaW4gY3lj
bGljYWxseSBzcGF3bnMgdGhlIGluZGljYXRlZCBzY3JpcHQvcHJvZ3JhbSwgY2FwdHVyZXMgaXRz
IG91dHB1dCAoc3Rkb3V0KSBhbmQgZGlzcGxheXMgdGhlIHJlc3VsdGluZyBzdHJpbmcgaW50byB0
aGUgcGFuZWwuIgotSE9NRVBBR0UgPSAiaHR0cDovL2dvb2RpZXMueGZjZS5vcmcvcHJvamVjdHMv
cGFuZWwtcGx1Z2lucy94ZmNlNC1nZW5tb24tcGx1Z2luIgotTElDRU5TRSA9ICJMR1BMLTIuMS1v
bmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjhhZDYyYzY0Y2M2
YzYyMDEyNjI0MWZkNDI5ZTY4ZmUiCi0KLWluaGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4KLQotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImIyMTE5ZmQwZmYxOWZhMjkzYjk3ZWM5N2IwZGU4ZTI0MTc5OWUw
OGI4NjIxODUxNTE2N2M1NjhiZDliNTAxMzUiCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBl
cy1wYW5lbC1wbHVnaW5zL2dlbm1vbi94ZmNlNC1nZW5tb24tcGx1Z2luXzQuMi4wLmJiIGIvbWV0
YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9nZW5tb24veGZjZTQtZ2VubW9uLXBsdWdpbl80
LjIuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjg1MzczZmJjZQot
LS0gL2Rldi9udWxsCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvZ2VubW9u
L3hmY2U0LWdlbm1vbi1wbHVnaW5fNC4yLjAuYmIKQEAgLTAsMCArMSwxODQgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDggKzEsOCBAQAor
IyAtCQkgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAtCQkgICAgICAgVmVy
c2lvbiAyLjEsIEZlYnJ1YXJ5IDE5OTkKKyMgKyAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIg
R0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyArICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9u
IDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTkxLCAxOTk5IEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtICAgICA1OSBUZW1wbGUgUGxhY2UsIFN1
aXRlIDMzMCwgQm9zdG9uLCBNQSAgMDIxMTEtMTMwNyAgVVNBCisjICsgNTEgRnJhbmtsaW4gU3Ry
ZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICAgRXZlcnlv
bmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisj
ICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93
ZWQuCisjICAKKyMgQEAgLTEwLDcgKzEwLDcgQEAKKyMgICBhcyB0aGUgc3VjY2Vzc29yIG9mIHRo
ZSBHTlUgTGlicmFyeSBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLCBoZW5jZQorIyAgIHRoZSB2
ZXJzaW9uIG51bWJlciAyLjEuXQorIyAgCisjIC0JCQkgICAgUHJlYW1ibGUKKyMgKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBQcmVhbWJsZQorIyAgCisjICAgIFRoZSBsaWNlbnNlcyBmb3Ig
bW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWduZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgIGZyZWVkb20g
dG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4gIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVi
bGljCisjIEBAIC01NSw3ICs1NSw3IEBACisjICB0aGF0IHdoYXQgdGhleSBoYXZlIGlzIG5vdCB0
aGUgb3JpZ2luYWwgdmVyc2lvbiwgc28gdGhhdCB0aGUgb3JpZ2luYWwKKyMgIGF1dGhvcidzIHJl
cHV0YXRpb24gd2lsbCBub3QgYmUgYWZmZWN0ZWQgYnkgcHJvYmxlbXMgdGhhdCBtaWdodCBiZQor
IyAgaW50cm9kdWNlZCBieSBvdGhlcnMuCisjIC0MCisjICsKKyMgICAgRmluYWxseSwgc29mdHdh
cmUgcGF0ZW50cyBwb3NlIGEgY29uc3RhbnQgdGhyZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YKKyMg
IGFueSBmcmVlIHByb2dyYW0uICBXZSB3aXNoIHRvIG1ha2Ugc3VyZSB0aGF0IGEgY29tcGFueSBj
YW5ub3QKKyMgIGVmZmVjdGl2ZWx5IHJlc3RyaWN0IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3Jh
bSBieSBvYnRhaW5pbmcgYQorIyBAQCAtMTExLDggKzExMSw4IEBACisjICAid29yayBiYXNlZCBv
biB0aGUgbGlicmFyeSIgYW5kIGEgIndvcmsgdGhhdCB1c2VzIHRoZSBsaWJyYXJ5Ii4gIFRoZQor
IyAgZm9ybWVyIGNvbnRhaW5zIGNvZGUgZGVyaXZlZCBmcm9tIHRoZSBsaWJyYXJ5LCB3aGVyZWFz
IHRoZSBsYXR0ZXIgbXVzdAorIyAgYmUgY29tYmluZWQgd2l0aCB0aGUgbGlicmFyeSBpbiBvcmRl
ciB0byBydW4uCisjIC0MCisjIC0JCSAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNF
CisjICsKKyMgKyAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElD
RU5TRQorIyAgICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElP
TiBBTkQgTU9ESUZJQ0FUSU9OCisjICAKKyMgICAgMC4gVGhpcyBMaWNlbnNlIEFncmVlbWVudCBh
cHBsaWVzIHRvIGFueSBzb2Z0d2FyZSBsaWJyYXJ5IG9yIG90aGVyCisjIEBAIC0xNDYsNyArMTQ2
LDcgQEAKKyMgIG9uIHRoZSBMaWJyYXJ5IChpbmRlcGVuZGVudCBvZiB0aGUgdXNlIG9mIHRoZSBM
aWJyYXJ5IGluIGEgdG9vbCBmb3IKKyMgIHdyaXRpbmcgaXQpLiAgV2hldGhlciB0aGF0IGlzIHRy
dWUgZGVwZW5kcyBvbiB3aGF0IHRoZSBMaWJyYXJ5IGRvZXMKKyMgIGFuZCB3aGF0IHRoZSBwcm9n
cmFtIHRoYXQgdXNlcyB0aGUgTGlicmFyeSBkb2VzLgorIyAtICAKKyMgKworIyAgICAxLiBZb3Ug
bWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzIG9mIHRoZSBMaWJyYXJ5J3MK
KyMgIGNvbXBsZXRlIHNvdXJjZSBjb2RlIGFzIHlvdSByZWNlaXZlIGl0LCBpbiBhbnkgbWVkaXVt
LCBwcm92aWRlZCB0aGF0CisjICB5b3UgY29uc3BpY3VvdXNseSBhbmQgYXBwcm9wcmlhdGVseSBw
dWJsaXNoIG9uIGVhY2ggY29weSBhbgorIyBAQCAtMTU4LDcgKzE1OCw3IEBACisjICAgIFlvdSBt
YXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2ljYWwgYWN0IG9mIHRyYW5zZmVycmluZyBhIGNv
cHksCisjICBhbmQgeW91IG1heSBhdCB5b3VyIG9wdGlvbiBvZmZlciB3YXJyYW50eSBwcm90ZWN0
aW9uIGluIGV4Y2hhbmdlIGZvciBhCisjICBmZWUuCisjIC0MCisjICsKKyMgICAgMi4gWW91IG1h
eSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBvZiB0aGUgTGlicmFyeSBvciBhbnkgcG9ydGlv
bgorIyAgb2YgaXQsIHRodXMgZm9ybWluZyBhIHdvcmsgYmFzZWQgb24gdGhlIExpYnJhcnksIGFu
ZCBjb3B5IGFuZAorIyAgZGlzdHJpYnV0ZSBzdWNoIG1vZGlmaWNhdGlvbnMgb3Igd29yayB1bmRl
ciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIEBAIC0yMTYsNyArMjE2LDcgQEAKKyMgIG9yZGlu
YXJ5IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGhhcyBhcHBlYXJlZCwgdGhlbiB5b3UgY2Fu
IHNwZWNpZnkKKyMgIHRoYXQgdmVyc2lvbiBpbnN0ZWFkIGlmIHlvdSB3aXNoLikgIERvIG5vdCBt
YWtlIGFueSBvdGhlciBjaGFuZ2UgaW4KKyMgIHRoZXNlIG5vdGljZXMuCisjIC0MCisjICsKKyMg
ICAgT25jZSB0aGlzIGNoYW5nZSBpcyBtYWRlIGluIGEgZ2l2ZW4gY29weSwgaXQgaXMgaXJyZXZl
cnNpYmxlIGZvcgorIyAgdGhhdCBjb3B5LCBzbyB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXBwbGllcyB0byBhbGwKKyMgIHN1YnNlcXVlbnQgY29waWVzIGFuZCBkZXJp
dmF0aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNvcHkuCisjIEBAIC0yNjcsNyArMjY3LDcgQEAK
KyMgIGRpc3RyaWJ1dGUgdGhlIG9iamVjdCBjb2RlIGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVy
bXMgb2YgU2VjdGlvbiA2LgorIyAgQW55IGV4ZWN1dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3Jr
IGFsc28gZmFsbCB1bmRlciBTZWN0aW9uIDYsCisjICB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBs
aW5rZWQgZGlyZWN0bHkgd2l0aCB0aGUgTGlicmFyeSBpdHNlbGYuCisjIC0MCisjICsKKyMgICAg
Ni4gQXMgYW4gZXhjZXB0aW9uIHRvIHRoZSBTZWN0aW9ucyBhYm92ZSwgeW91IG1heSBhbHNvIGNv
bWJpbmUgb3IKKyMgIGxpbmsgYSAid29yayB0aGF0IHVzZXMgdGhlIExpYnJhcnkiIHdpdGggdGhl
IExpYnJhcnkgdG8gcHJvZHVjZSBhCisjICB3b3JrIGNvbnRhaW5pbmcgcG9ydGlvbnMgb2YgdGhl
IExpYnJhcnksIGFuZCBkaXN0cmlidXRlIHRoYXQgd29yaworIyBAQCAtMzI5LDcgKzMyOSw3IEBA
CisjICBhY2NvbXBhbnkgdGhlIG9wZXJhdGluZyBzeXN0ZW0uICBTdWNoIGEgY29udHJhZGljdGlv
biBtZWFucyB5b3UgY2Fubm90CisjICB1c2UgYm90aCB0aGVtIGFuZCB0aGUgTGlicmFyeSB0b2dl
dGhlciBpbiBhbiBleGVjdXRhYmxlIHRoYXQgeW91CisjICBkaXN0cmlidXRlLgorIyAtDAorIyAr
CisjICAgIDcuIFlvdSBtYXkgcGxhY2UgbGlicmFyeSBmYWNpbGl0aWVzIHRoYXQgYXJlIGEgd29y
ayBiYXNlZCBvbiB0aGUKKyMgIExpYnJhcnkgc2lkZS1ieS1zaWRlIGluIGEgc2luZ2xlIGxpYnJh
cnkgdG9nZXRoZXIgd2l0aCBvdGhlciBsaWJyYXJ5CisjICBmYWNpbGl0aWVzIG5vdCBjb3ZlcmVk
IGJ5IHRoaXMgTGljZW5zZSwgYW5kIGRpc3RyaWJ1dGUgc3VjaCBhIGNvbWJpbmVkCisjIEBAIC0z
NzAsNyArMzcwLDcgQEAKKyMgIHJlc3RyaWN0aW9ucyBvbiB0aGUgcmVjaXBpZW50cycgZXhlcmNp
c2Ugb2YgdGhlIHJpZ2h0cyBncmFudGVkIGhlcmVpbi4KKyMgIFlvdSBhcmUgbm90IHJlc3BvbnNp
YmxlIGZvciBlbmZvcmNpbmcgY29tcGxpYW5jZSBieSB0aGlyZCBwYXJ0aWVzIHdpdGgKKyMgIHRo
aXMgTGljZW5zZS4KKyMgLQwKKyMgKworIyAgICAxMS4gSWYsIGFzIGEgY29uc2VxdWVuY2Ugb2Yg
YSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9uIG9mIHBhdGVudAorIyAgaW5mcmluZ2VtZW50
IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3QgbGltaXRlZCB0byBwYXRlbnQgaXNzdWVzKSwK
KyMgIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9yZGVy
LCBhZ3JlZW1lbnQgb3IKKyMgQEAgLTQyMiw3ICs0MjIsNyBAQAorIyAgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4gIElmIHRoZSBMaWJyYXJ5IGRvZXMgbm90IHNwZWNpZnkgYQorIyAgbGlj
ZW5zZSB2ZXJzaW9uIG51bWJlciwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJs
aXNoZWQgYnkKKyMgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCisjIC0MCisjICsKKyMg
ICAgMTQuIElmIHlvdSB3aXNoIHRvIGluY29ycG9yYXRlIHBhcnRzIG9mIHRoZSBMaWJyYXJ5IGlu
dG8gb3RoZXIgZnJlZQorIyAgcHJvZ3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMg
YXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZXNlLAorIyAgd3JpdGUgdG8gdGhlIGF1dGhvciB0byBh
c2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdhcmUgd2hpY2ggaXMKKyMgQEAgLTQzMiw3ICs0
MzIsNyBAQAorIyAgb2YgYWxsIGRlcml2YXRpdmVzIG9mIG91ciBmcmVlIHNvZnR3YXJlIGFuZCBv
ZiBwcm9tb3RpbmcgdGhlIHNoYXJpbmcKKyMgIGFuZCByZXVzZSBvZiBzb2Z0d2FyZSBnZW5lcmFs
bHkuCisjICAKKyMgLQkJCSAgICBOTyBXQVJSQU5UWQorIyArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE5PIFdBUlJBTlRZCisjICAKKyMgICAgMTUuIEJFQ0FVU0UgVEhFIExJQlJBUlkgSVMg
TElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PCisjICBXQVJSQU5UWSBGT1IgVEhF
IExJQlJBUlksIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJQ0FCTEUgTEFXLgorIyBA
QCAtNDU1LDQgKzQ1NSw0OCBAQAorIyAgU1VDSCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJF
RU4gQURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSAorIyAgREFNQUdFUy4KKyMgIAor
IyAtCQkgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyArICAgICAgICAgICAgICAg
ICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjICsKKyMgKyAgICAgICAgICAgSG93
IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRvIFlvdXIgTmV3IExpYnJhcmllcworIyArCisjICsgIElm
IHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJhcnksIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUg
Z3JlYXRlc3QKKyMgK3Bvc3NpYmxlIHVzZSB0byB0aGUgcHVibGljLCB3ZSByZWNvbW1lbmQgbWFr
aW5nIGl0IGZyZWUgc29mdHdhcmUgdGhhdAorIyArZXZlcnlvbmUgY2FuIHJlZGlzdHJpYnV0ZSBh
bmQgY2hhbmdlLiAgWW91IGNhbiBkbyBzbyBieSBwZXJtaXR0aW5nCisjICtyZWRpc3RyaWJ1dGlv
biB1bmRlciB0aGVzZSB0ZXJtcyAob3IsIGFsdGVybmF0aXZlbHksIHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUKKyMgK29yZGluYXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UpLgorIyArCisjICsgIFRv
IGFwcGx5IHRoZXNlIHRlcm1zLCBhdHRhY2ggdGhlIGZvbGxvd2luZyBub3RpY2VzIHRvIHRoZSBs
aWJyYXJ5LiAgSXQgaXMKKyMgK3NhZmVzdCB0byBhdHRhY2ggdGhlbSB0byB0aGUgc3RhcnQgb2Yg
ZWFjaCBzb3VyY2UgZmlsZSB0byBtb3N0IGVmZmVjdGl2ZWx5CisjICtjb252ZXkgdGhlIGV4Y2x1
c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVhY2ggZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdCB0aGUK
KyMgKyJjb3B5cmlnaHQiIGxpbmUgYW5kIGEgcG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3Rp
Y2UgaXMgZm91bmQuCisjICsKKyMgKyAgICA8b25lIGxpbmUgdG8gZ2l2ZSB0aGUgbGlicmFyeSdz
IG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBvZiB3aGF0IGl0IGRvZXMuPgorIyArICAgIENvcHlyaWdo
dCAoQykgPHllYXI+ICA8bmFtZSBvZiBhdXRob3I+CisjICsKKyMgKyAgICBUaGlzIGxpYnJhcnkg
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisjICsgICAg
bW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1Ymxp
YworIyArICAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlcgorIyArICAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIyArCisjICsgICAgVGhpcyBsaWJyYXJ5
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjICsg
ICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2Fy
cmFudHkgb2YKKyMgKyAgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorIyArICAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICsKKyMgKyAgICBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisjICsgICAgTGlj
ZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBT
b2Z0d2FyZQorIyArICAgIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlm
dGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArCisjICtBbHNvIGFkZCBp
bmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIg
bWFpbC4KKyMgKworIyArWW91IHNob3VsZCBhbHNvIGdldCB5b3VyIGVtcGxveWVyIChpZiB5b3Ug
d29yayBhcyBhIHByb2dyYW1tZXIpIG9yIHlvdXIKKyMgK3NjaG9vbCwgaWYgYW55LCB0byBzaWdu
IGEgImNvcHlyaWdodCBkaXNjbGFpbWVyIiBmb3IgdGhlIGxpYnJhcnksIGlmCisjICtuZWNlc3Nh
cnkuICBIZXJlIGlzIGEgc2FtcGxlOyBhbHRlciB0aGUgbmFtZXM6CisjICsKKyMgKyAgWW95b2R5
bmUsIEluYy4sIGhlcmVieSBkaXNjbGFpbXMgYWxsIGNvcHlyaWdodCBpbnRlcmVzdCBpbiB0aGUK
KyMgKyAgbGlicmFyeSBgRnJvYicgKGEgbGlicmFyeSBmb3IgdHdlYWtpbmcga25vYnMpIHdyaXR0
ZW4gYnkgSmFtZXMgUmFuZG9tIEhhY2tlci4KKyMgKworIyArICA8c2lnbmF0dXJlIG9mIFR5IENv
b24+LCAxIEFwcmlsIDE5OTAKKyMgKyAgVHkgQ29vbiwgUHJlc2lkZW50IG9mIFZpY2UKKyMgKwor
IyArVGhhdCdzIGFsbCB0aGVyZSBpcyB0byBpdCEKKyMgCisjCisKK0RFU0NSSVBUSU9OID0gIlRo
aXMgcGx1Z2luIGN5Y2xpY2FsbHkgc3Bhd25zIHRoZSBpbmRpY2F0ZWQgc2NyaXB0L3Byb2dyYW0s
IGNhcHR1cmVzIGl0cyBvdXRwdXQgKHN0ZG91dCkgYW5kIGRpc3BsYXlzIHRoZSByZXN1bHRpbmcg
c3RyaW5nIGludG8gdGhlIHBhbmVsLiIKK0hPTUVQQUdFID0gImh0dHA6Ly9nb29kaWVzLnhmY2Uu
b3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtZ2VubW9uLXBsdWdpbiIKK0xJQ0VOU0Ug
PSAiTEdQTC0yLjEtb25seSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTRiNTRhMWZkNTVhNDQ4ODY1YTBiMzJkNDE1OTg3NTlkIgorCitpbmhlcml0IHhmY2UtcGFuZWwt
cGx1Z2luCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDhkMDhlZTVmMjE0MDg0N2YxMDliNTMx
YmMxZDRjYzYyNjg0OTY5MTNlYTc2MDBkM2M1YWQ4OTAyNWEwMzYyIgotLSAKMi4zOS4yCgo=

--===============8790536723247011404==--

