Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B8BC05021
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5523.1699083060782512653
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GUovGRWV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LTts5hBa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e031d-63f3758c-f805-4be6-b00b-7fae0fb7467d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4aG49fbzDHjh4wdSSYyXdcwl5+jz+AQh5I8j40SJdKM=;
	b=GUovGRWVrQDX4ltaLQrwdxzQ6y8IQ0EA6AG/PEmMn0oGCzUkd/YRb56C4xzeycAQ
	AhL7Z9GWcY1+M3kv23pzMAlbSBpDxOVhaWTPg0HG9acxj+4YgnmzJFzYN2dRQxvBzsZ
	tjEbUZaYQVqZUpZZty+jUZClttJ01tANxK1aSxMA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4aG49fbzDHjh4wdSSYyXdcwl5+jz+AQh5I8j40SJdKM=;
	b=LTts5hBa53BSpRQvq9ML7pbdyYUXIFv9jZRafsR+Vj60TO9QNv++LOjy0z54pKjO
	+5wIFu0Kx7lMshfkRc1SfTSTdJah5a3m3w0xgmyPEEU+HGoSN1SUvICsWElUjm374Sg
	wbhkZgv7A23a9/OJTXw7Kibq7cDC/pe5kCZYfQrk=
Content-Type: multipart/mixed; boundary="===============6517320294295235072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-netload-plugin: upgrading to 1.4.1 SUCCEEDED
Message-ID: <0101018b993e031d-63f3758c-f805-4be6-b00b-7fae0fb7467d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106330

--===============6517320294295235072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-netload-plugin* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-netload-plugin-upgrade-1.4.0-1.4.1.patch
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
From 7d29679c15729b34482d5a0c308ca25d044145c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:31:35 +0000
Subject: [PATCH] xfce4-netload-plugin: upgrade 1.4.0 -> 1.4.1

---
 .../netload/xfce4-netload-plugin_1.4.0.bb     |   9 -
 .../netload/xfce4-netload-plugin_1.4.1.bb     | 165 ++++++++++++++++++
 2 files changed, 165 insertions(+), 9 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
deleted file mode 100644
index 834f5cfaa..000000000
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Panel plugin displaying current load of the network interfaces"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
-
-inherit xfce-panel-plugin
-
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6c76260e101790754dd93255ec979accd97d21a21da85d8edcd6c7b01ddcd70c"
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
new file mode 100644
index 000000000..4c7fc77a3
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
@@ -0,0 +1,165 @@
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
+# @@ -39,15 +39,15 @@
+#  Boston, MA 02111-1307, USA.
+#   
+#  ------------------------------------------------------------------------
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -                          675 Mass Ave, Cambridge, MA 02139, USA
+# +                    GNU GENERAL PUBLIC LICENSE
+# +                       Version 2, June 1991
+# +
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# -			    Preamble
+# +                            Preamble
+#  
+#    The licenses for most software are designed to take away your
+#  freedom to share and change it.  By contrast, the GNU General Public
+# @@ -56,7 +56,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -96,8 +96,8 @@
+#  
+#    The precise terms and conditions for copying, distribution and
+#  modification follow.
+# -
+# -		    GNU GENERAL PUBLIC LICENSE
+# +
+# +                    GNU GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+#    0. This License applies to any program or other work which contains
+# @@ -151,7 +151,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -209,7 +209,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -266,7 +266,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -296,7 +296,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -318,4 +318,63 @@
+#  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+# +
+# +  If you develop a new program, and you want it to be of the greatest
+# +possible use to the public, the best way to achieve this is to make it
+# +free software which everyone can redistribute and change under these terms.
+# +
+# +  To do so, attach the following notices to the program.  It is safest
+# +to attach them to the start of each source file to most effectively
+# +convey the exclusion of warranty; and each file should have at least
+# +the "copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the program's name and a brief idea of what it does.>
+# +    Copyright (C) <year>  <name of author>
+# +
+# +    This program is free software; you can redistribute it and/or modify
+# +    it under the terms of the GNU General Public License as published by
+# +    the Free Software Foundation; either version 2 of the License, or
+# +    (at your option) any later version.
+# +
+# +    This program is distributed in the hope that it will be useful,
+# +    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +    GNU General Public License for more details.
+# +
+# +    You should have received a copy of the GNU General Public License along
+# +    with this program; if not, write to the Free Software Foundation, Inc.,
+# +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +If the program is interactive, make it output a short notice like this
+# +when it starts in an interactive mode:
+# +
+# +    Gnomovision version 69, Copyright (C) year name of author
+# +    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+# +    This is free software, and you are welcome to redistribute it
+# +    under certain conditions; type `show c' for details.
+# +
+# +The hypothetical commands `show w' and `show c' should show the appropriate
+# +parts of the General Public License.  Of course, the commands you use may
+# +be called something other than `show w' and `show c'; they could even be
+# +mouse-clicks or menu items--whatever suits your program.
+# +
+# +You should also get your employer (if you work as a programmer) or your
+# +school, if any, to sign a "copyright disclaimer" for the program, if
+# +necessary.  Here is a sample; alter the names:
+# +
+# +  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+# +  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+# +
+# +  <signature of Ty Coon>, 1 April 1989
+# +  Ty Coon, President of Vice
+# +
+# +This General Public License does not permit incorporating your program into
+# +proprietary programs.  If your program is a subroutine library, you may
+# +consider it more useful to permit linking proprietary applications with the
+# +library.  If this is what you want to do, use the GNU Lesser General
+# +Public License instead of this License.
+# 
+#
+
+SUMMARY = "Panel plugin displaying current load of the network interfaces"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2b6065ae7d3696cdad6869dd8627a9fe"
+
+inherit xfce-panel-plugin
+
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "9fac3a3ad52e18584bfb127cd1721d56de1004b9fdd140915fded89704ccb44e"
-- 
2.39.2


--===============6517320294295235072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-netload-plugin: PACKAGES: added "xfce4-netload-plugin-locale-et xfce4-netload-plugin-locale-ro"
packages/core2-64-poky-linux/xfce4-netload-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-netload-plugin/1.4/xfce4-netload-plugin-1.4.0.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-netload-plugin/1.4/xfce4-netload-plugin-1.4.1.tar.bz2"
packages/core2-64-poky-linux/xfce4-netload-plugin: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-dbg: PKGSIZE changed from 114480 to 115472 (+1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-dbg: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-dbg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-dev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-dev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-doc: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-doc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ar: PKGSIZE changed from 2519 to 2441 (-3%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ar: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ar: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ast: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ast: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-be: PKGSIZE changed from 3105 to 3061 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-be: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-be: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-bg: PKGSIZE changed from 3083 to 3443 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-bg: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-bg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ca: PKGSIZE changed from 2534 to 2490 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ca: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ca: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-cs: PKGSIZE changed from 2590 to 2552 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-cs: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-cs: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-da: PKGSIZE changed from 2490 to 2448 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-da: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-da: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-de: PKGSIZE changed from 2530 to 2818 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-de: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-de: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-el: PKGSIZE changed from 3006 to 2975 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-el: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-el: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-au: PKGSIZE changed from 2441 to 2396 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-au: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-au: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-ca: PKGSIZE changed from 2430 to 2378 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-ca: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-ca: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-gb: PKGSIZE changed from 1981 to 1944 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-gb: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-en-gb: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-eo: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-eo: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-es: PKGSIZE changed from 2537 to 2595 (+2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-es: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-es: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-eu: PKGSIZE changed from 2454 to 2408 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-eu: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-eu: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fi: PKGSIZE changed from 1962 to 1939 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fi: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fi: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fr: PKGSIZE changed from 2598 to 2917 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fr: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fr: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-gl: PKGSIZE changed from 2504 to 2463 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-gl: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-gl: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-he: PKGSIZE changed from 2719 to 2725 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-he: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-he: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hr: PKGSIZE changed from 2547 to 2509 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hr: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hr: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hu: PKGSIZE changed from 2580 to 2534 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hu: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hu: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hye: PKGSIZE changed from 2927 to 2887 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hye: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-hye: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-id: PKGSIZE changed from 2476 to 2434 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-id: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-id: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ie: PKGSIZE changed from 2389 to 2341 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ie: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ie: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-is: PKGSIZE changed from 2434 to 2388 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-is: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-is: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-it: PKGSIZE changed from 2576 to 2886 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-it: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-it: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ja: PKGSIZE changed from 2686 to 2986 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ja: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ja: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-kk: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-kk: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ko: PKGSIZE changed from 2600 to 2611 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ko: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ko: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lt: PKGSIZE changed from 2661 to 2932 (+10%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lt: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lt: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lv: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lv: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ms: PKGSIZE changed from 2438 to 2399 (-2%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ms: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ms: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nb: PKGSIZE changed from 2506 to 2489 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nb: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nb: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nl: PKGSIZE changed from 2497 to 2784 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nl: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nl: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-oc: PKGSIZE changed from 2476 to 2456 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-oc: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-oc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pa: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pa: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pl: PKGSIZE changed from 2722 to 3011 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pl: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pl: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt-br: PKGSIZE changed from 2526 to 2550 (+1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt-br: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt-br: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt: PKGSIZE changed from 2479 to 2811 (+13%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ru: PKGSIZE changed from 3101 to 3435 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ru: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ru: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sk: PKGSIZE changed from 2603 to 2604 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sk: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sk: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sl: PKGSIZE changed from 2525 to 2529 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sl: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sl: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sq: PKGSIZE changed from 2513 to 2794 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sq: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sq: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sr: PKGSIZE changed from 3039 to 3382 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sr: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sr: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sv: PKGSIZE changed from 2473 to 2702 (+9%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sv: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sv: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-th: PKGSIZE changed from 3331 to 3310 (-1%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-th: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-th: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-tr: PKGSIZE changed from 2499 to 2498 (-0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-tr: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-tr: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ug: PKGSIZE changed from 2779 to 2621 (-6%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ug: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ug: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-uk: PKGSIZE changed from 3268 to 3258 (-0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-uk: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-uk: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ur-pk: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ur-pk: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ur: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ur: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-vi: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-vi: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-cn: PKGSIZE changed from 2477 to 2482 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-cn: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-cn: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-tw: PKGSIZE changed from 2434 to 2713 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-tw: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-tw: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-src: PKGSIZE changed from 84787 to 87623 (+3%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-src: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-src: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-staticdev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-staticdev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin: PKGSIZE changed from 65254 to 65383 (+0%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin: PKGV changed from 1.4.0 [default] to 1.4.1 [default]

--===============6517320294295235072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-netload-plugin: PACKAGES: added "xfce4-netload-plugin-locale-ro xfce4-netload-plugin-locale-et"
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-bg: PKGSIZE changed from 3083 to 3443 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-de: PKGSIZE changed from 2530 to 2818 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-fr: PKGSIZE changed from 2598 to 2917 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-it: PKGSIZE changed from 2576 to 2886 (+12%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ja: PKGSIZE changed from 2686 to 2986 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-lt: PKGSIZE changed from 2661 to 2932 (+10%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-nl: PKGSIZE changed from 2497 to 2784 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pl: PKGSIZE changed from 2722 to 3011 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-pt: PKGSIZE changed from 2479 to 2811 (+13%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-ru: PKGSIZE changed from 3101 to 3435 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sq: PKGSIZE changed from 2513 to 2794 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-sr: PKGSIZE changed from 3039 to 3382 (+11%)
packages/core2-64-poky-linux/xfce4-netload-plugin/xfce4-netload-plugin-locale-zh-tw: PKGSIZE changed from 2434 to 2713 (+11%)

--===============6517320294295235072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-netload-plugin-upgrade-1.4.0-1.4.1.patch"

RnJvbSA3ZDI5Njc5YzE1NzI5YjM0NDgyZDVhMGMzMDhjYTI1ZDA0NDE0NWM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjozMTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LW5ldGxvYWQtcGx1Z2luOiB1cGdyYWRlIDEuNC4wIC0+IDEuNC4xCgotLS0KIC4uLi9uZXRs
b2FkL3hmY2U0LW5ldGxvYWQtcGx1Z2luXzEuNC4wLmJiICAgICB8ICAgOSAtCiAuLi4vbmV0bG9h
ZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMS5iYiAgICAgfCAxNjUgKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDE2NSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbmV0bG9h
ZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMC5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbmV0bG9hZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8x
LjQuMS5iYgoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbmV0
bG9hZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBh
bmVsLXBsdWdpbnMvbmV0bG9hZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMC5iYgpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggODM0ZjVjZmFhLi4wMDAwMDAwMDAKLS0tIGEvbWV0YS14
ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9uZXRsb2FkL3hmY2U0LW5ldGxvYWQtcGx1Z2luXzEu
NC4wLmJiCisrKyAvZGV2L251bGwKQEAgLTEsOSArMCwwIEBACi1TVU1NQVJZID0gIlBhbmVsIHBs
dWdpbiBkaXNwbGF5aW5nIGN1cnJlbnQgbG9hZCBvZiB0aGUgbmV0d29yayBpbnRlcmZhY2VzIgot
SE9NRVBBR0UgPSAiaHR0cHM6Ly9nb29kaWVzLnhmY2Uub3JnL3Byb2plY3RzL3BhbmVsLXBsdWdp
bnMveGZjZTQtbmV0bG9hZC1wbHVnaW4iCi1MSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLUxJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTM1YTcyMDNjNDFiODZkMTU1NDZkZGRj
MDU5OTVmOTdmIgotCi1pbmhlcml0IHhmY2UtcGFuZWwtcGx1Z2luCi0KLVNSQ19VUkkgPSAiaHR0
cDovL2FyY2hpdmUueGZjZS5vcmcvc3JjL3BhbmVsLXBsdWdpbnMvJHtCUE59LyR7QCcke1BWfSdb
MDozXX0vJHtCUE59LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmM3NjI2
MGUxMDE3OTA3NTRkZDkzMjU1ZWM5NzlhY2NkOTdkMjFhMjFkYTg1ZDhlZGNkNmM3YjAxZGRjZDcw
YyIKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbmV0bG9hZC94
ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBs
dWdpbnMvbmV0bG9hZC94ZmNlNC1uZXRsb2FkLXBsdWdpbl8xLjQuMS5iYgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjRjN2ZjNzdhMwotLS0gL2Rldi9udWxsCisrKyBiL21l
dGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbmV0bG9hZC94ZmNlNC1uZXRsb2FkLXBsdWdp
bl8xLjQuMS5iYgpAQCAtMCwwICsxLDE2NSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJ
TkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTM5LDE1ICszOSwxNSBAQAorIyAgQm9zdG9uLCBNQSAw
MjExMS0xMzA3LCBVU0EuCisjICAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLQkJICAgIEdOVSBH
RU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjIC0JCSAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQor
IyAtCisjIC0gQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
biwgSW5jLgorIyAtICAgICAgICAgICAgICAgICAgICAgICAgICA2NzUgTWFzcyBBdmUsIENhbWJy
aWRnZSwgTUEgMDIxMzksIFVTQQorIyArICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJBTCBQ
VUJMSUMgTElDRU5TRQorIyArICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIsIEp1bmUg
MTk5MQorIyArCisjICsgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLiwKKyMgKyA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0
b24sIE1BIDAyMTEwLTEzMDEgVVNBCisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkg
YW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3Vt
ZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgLQkJCSAgICBQcmVh
bWJsZQorIyArICAgICAgICAgICAgICAgICAgICAgICAgICAgIFByZWFtYmxlCisjICAKKyMgICAg
VGhlIGxpY2Vuc2VzIGZvciBtb3N0IHNvZnR3YXJlIGFyZSBkZXNpZ25lZCB0byB0YWtlIGF3YXkg
eW91cgorIyAgZnJlZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlIGl0LiAgQnkgY29udHJhc3QsIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyMgQEAgLTU2LDcgKzU2LDcgQEAKKyMgIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXBwbGllcyB0byBtb3N0IG9mIHRoZSBGcmVlIFNvZnR3YXJlCisjICBGb3Vu
ZGF0aW9uJ3Mgc29mdHdhcmUgYW5kIHRvIGFueSBvdGhlciBwcm9ncmFtIHdob3NlIGF1dGhvcnMg
Y29tbWl0IHRvCisjICB1c2luZyBpdC4gIChTb21lIG90aGVyIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiBzb2Z0d2FyZSBpcyBjb3ZlcmVkIGJ5CisjIC10aGUgR05VIExpYnJhcnkgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlvdSBjYW4gYXBwbHkgaXQgdG8KKyMgK3RoZSBHTlUg
TGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2FuIGFwcGx5IGl0
IHRvCisjICB5b3VyIHByb2dyYW1zLCB0b28uCisjICAKKyMgICAgV2hlbiB3ZSBzcGVhayBvZiBm
cmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZyZWVkb20sIG5vdAorIyBAQCAtOTYs
OCArOTYsOCBAQAorIyAgCisjICAgIFRoZSBwcmVjaXNlIHRlcm1zIGFuZCBjb25kaXRpb25zIGZv
ciBjb3B5aW5nLCBkaXN0cmlidXRpb24gYW5kCisjICBtb2RpZmljYXRpb24gZm9sbG93LgorIyAt
DAorIyAtCQkgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKworIyArICAgICAgICAg
ICAgICAgICAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAgICAgVEVSTVMgQU5EIENP
TkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9ESUZJQ0FUSU9OCisjICAK
KyMgICAgMC4gVGhpcyBMaWNlbnNlIGFwcGxpZXMgdG8gYW55IHByb2dyYW0gb3Igb3RoZXIgd29y
ayB3aGljaCBjb250YWlucworIyBAQCAtMTUxLDcgKzE1MSw3IEBACisjICAgICAgTGljZW5zZS4g
IChFeGNlcHRpb246IGlmIHRoZSBQcm9ncmFtIGl0c2VsZiBpcyBpbnRlcmFjdGl2ZSBidXQKKyMg
ICAgICBkb2VzIG5vdCBub3JtYWxseSBwcmludCBzdWNoIGFuIGFubm91bmNlbWVudCwgeW91ciB3
b3JrIGJhc2VkIG9uCisjICAgICAgdGhlIFByb2dyYW0gaXMgbm90IHJlcXVpcmVkIHRvIHByaW50
IGFuIGFubm91bmNlbWVudC4pCisjIC0MCisjICsKKyMgIFRoZXNlIHJlcXVpcmVtZW50cyBhcHBs
eSB0byB0aGUgbW9kaWZpZWQgd29yayBhcyBhIHdob2xlLiAgSWYKKyMgIGlkZW50aWZpYWJsZSBz
ZWN0aW9ucyBvZiB0aGF0IHdvcmsgYXJlIG5vdCBkZXJpdmVkIGZyb20gdGhlIFByb2dyYW0sCisj
ICBhbmQgY2FuIGJlIHJlYXNvbmFibHkgY29uc2lkZXJlZCBpbmRlcGVuZGVudCBhbmQgc2VwYXJh
dGUgd29ya3MgaW4KKyMgQEAgLTIwOSw3ICsyMDksNyBAQAorIyAgYWNjZXNzIHRvIGNvcHkgdGhl
IHNvdXJjZSBjb2RlIGZyb20gdGhlIHNhbWUgcGxhY2UgY291bnRzIGFzCisjICBkaXN0cmlidXRp
b24gb2YgdGhlIHNvdXJjZSBjb2RlLCBldmVuIHRob3VnaCB0aGlyZCBwYXJ0aWVzIGFyZSBub3QK
KyMgIGNvbXBlbGxlZCB0byBjb3B5IHRoZSBzb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNv
ZGUuCisjIC0MCisjICsKKyMgICAgNC4gWW91IG1heSBub3QgY29weSwgbW9kaWZ5LCBzdWJsaWNl
bnNlLCBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtCisjICBleGNlcHQgYXMgZXhwcmVzc2x5IHBy
b3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFueSBhdHRlbXB0CisjICBvdGhlcndpc2UgdG8g
Y29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gaXMKKyMg
QEAgLTI2Niw3ICsyNjYsNyBAQAorIyAgCisjICBUaGlzIHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8g
bWFrZSB0aG9yb3VnaGx5IGNsZWFyIHdoYXQgaXMgYmVsaWV2ZWQgdG8KKyMgIGJlIGEgY29uc2Vx
dWVuY2Ugb2YgdGhlIHJlc3Qgb2YgdGhpcyBMaWNlbnNlLgorIyAtDAorIyArCisjICAgIDguIElm
IHRoZSBkaXN0cmlidXRpb24gYW5kL29yIHVzZSBvZiB0aGUgUHJvZ3JhbSBpcyByZXN0cmljdGVk
IGluCisjICBjZXJ0YWluIGNvdW50cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBieSBjb3B5cmln
aHRlZCBpbnRlcmZhY2VzLCB0aGUKKyMgIG9yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIgd2hvIHBs
YWNlcyB0aGUgUHJvZ3JhbSB1bmRlciB0aGlzIExpY2Vuc2UKKyMgQEAgLTI5Niw3ICsyOTYsNyBA
QAorIyAgb2YgcHJlc2VydmluZyB0aGUgZnJlZSBzdGF0dXMgb2YgYWxsIGRlcml2YXRpdmVzIG9m
IG91ciBmcmVlIHNvZnR3YXJlIGFuZAorIyAgb2YgcHJvbW90aW5nIHRoZSBzaGFyaW5nIGFuZCBy
ZXVzZSBvZiBzb2Z0d2FyZSBnZW5lcmFsbHkuCisjICAKKyMgLQkJCSAgICBOTyBXQVJSQU5UWQor
IyArICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5PIFdBUlJBTlRZCisjICAKKyMgICAgMTEu
IEJFQ0FVU0UgVEhFIFBST0dSQU0gSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElT
IE5PIFdBUlJBTlRZCisjICBGT1IgVEhFIFBST0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVE
IEJZIEFQUExJQ0FCTEUgTEFXLiAgRVhDRVBUIFdIRU4KKyMgQEAgLTMxOCw0ICszMTgsNjMgQEAK
KyMgIFBST0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVF
TiBBRFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0VTLgorIyAgCisj
IC0JCSAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjICsgICAgICAgICAgICAgICAg
ICAgICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMKKyMgKworIyArICAgICAgICAgICAgSG93
IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRvIFlvdXIgTmV3IFByb2dyYW1zCisjICsKKyMgKyAgSWYg
eW91IGRldmVsb3AgYSBuZXcgcHJvZ3JhbSwgYW5kIHlvdSB3YW50IGl0IHRvIGJlIG9mIHRoZSBn
cmVhdGVzdAorIyArcG9zc2libGUgdXNlIHRvIHRoZSBwdWJsaWMsIHRoZSBiZXN0IHdheSB0byBh
Y2hpZXZlIHRoaXMgaXMgdG8gbWFrZSBpdAorIyArZnJlZSBzb2Z0d2FyZSB3aGljaCBldmVyeW9u
ZSBjYW4gcmVkaXN0cmlidXRlIGFuZCBjaGFuZ2UgdW5kZXIgdGhlc2UgdGVybXMuCisjICsKKyMg
KyAgVG8gZG8gc28sIGF0dGFjaCB0aGUgZm9sbG93aW5nIG5vdGljZXMgdG8gdGhlIHByb2dyYW0u
ICBJdCBpcyBzYWZlc3QKKyMgK3RvIGF0dGFjaCB0aGVtIHRvIHRoZSBzdGFydCBvZiBlYWNoIHNv
dXJjZSBmaWxlIHRvIG1vc3QgZWZmZWN0aXZlbHkKKyMgK2NvbnZleSB0aGUgZXhjbHVzaW9uIG9m
IHdhcnJhbnR5OyBhbmQgZWFjaCBmaWxlIHNob3VsZCBoYXZlIGF0IGxlYXN0CisjICt0aGUgImNv
cHlyaWdodCIgbGluZSBhbmQgYSBwb2ludGVyIHRvIHdoZXJlIHRoZSBmdWxsIG5vdGljZSBpcyBm
b3VuZC4KKyMgKworIyArICAgIDxvbmUgbGluZSB0byBnaXZlIHRoZSBwcm9ncmFtJ3MgbmFtZSBh
bmQgYSBicmllZiBpZGVhIG9mIHdoYXQgaXQgZG9lcy4+CisjICsgICAgQ29weXJpZ2h0IChDKSA8
eWVhcj4gIDxuYW1lIG9mIGF1dGhvcj4KKyMgKworIyArICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICsgICAg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBw
dWJsaXNoZWQgYnkKKyMgKyAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorIyArICAgIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCisjICsKKyMgKyAgICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQg
aW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMgKyAgICBidXQgV0lUSE9VVCBB
TlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyArICAg
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUKKyMgKyAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxz
LgorIyArCisjICsgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcKKyMgKyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsg
aWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAr
ICAgIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMw
MSBVU0EuCisjICsKKyMgK0Fsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlv
dSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyArCisjICtJZiB0aGUgcHJvZ3JhbSBp
cyBpbnRlcmFjdGl2ZSwgbWFrZSBpdCBvdXRwdXQgYSBzaG9ydCBub3RpY2UgbGlrZSB0aGlzCisj
ICt3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRlcmFjdGl2ZSBtb2RlOgorIyArCisjICsgICAgR25v
bW92aXNpb24gdmVyc2lvbiA2OSwgQ29weXJpZ2h0IChDKSB5ZWFyIG5hbWUgb2YgYXV0aG9yCisj
ICsgICAgR25vbW92aXNpb24gY29tZXMgd2l0aCBBQlNPTFVURUxZIE5PIFdBUlJBTlRZOyBmb3Ig
ZGV0YWlscyB0eXBlIGBzaG93IHcnLgorIyArICAgIFRoaXMgaXMgZnJlZSBzb2Z0d2FyZSwgYW5k
IHlvdSBhcmUgd2VsY29tZSB0byByZWRpc3RyaWJ1dGUgaXQKKyMgKyAgICB1bmRlciBjZXJ0YWlu
IGNvbmRpdGlvbnM7IHR5cGUgYHNob3cgYycgZm9yIGRldGFpbHMuCisjICsKKyMgK1RoZSBoeXBv
dGhldGljYWwgY29tbWFuZHMgYHNob3cgdycgYW5kIGBzaG93IGMnIHNob3VsZCBzaG93IHRoZSBh
cHByb3ByaWF0ZQorIyArcGFydHMgb2YgdGhlIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuICBPZiBj
b3Vyc2UsIHRoZSBjb21tYW5kcyB5b3UgdXNlIG1heQorIyArYmUgY2FsbGVkIHNvbWV0aGluZyBv
dGhlciB0aGFuIGBzaG93IHcnIGFuZCBgc2hvdyBjJzsgdGhleSBjb3VsZCBldmVuIGJlCisjICtt
b3VzZS1jbGlja3Mgb3IgbWVudSBpdGVtcy0td2hhdGV2ZXIgc3VpdHMgeW91ciBwcm9ncmFtLgor
IyArCisjICtZb3Ugc2hvdWxkIGFsc28gZ2V0IHlvdXIgZW1wbG95ZXIgKGlmIHlvdSB3b3JrIGFz
IGEgcHJvZ3JhbW1lcikgb3IgeW91cgorIyArc2Nob29sLCBpZiBhbnksIHRvIHNpZ24gYSAiY29w
eXJpZ2h0IGRpc2NsYWltZXIiIGZvciB0aGUgcHJvZ3JhbSwgaWYKKyMgK25lY2Vzc2FyeS4gIEhl
cmUgaXMgYSBzYW1wbGU7IGFsdGVyIHRoZSBuYW1lczoKKyMgKworIyArICBZb3lvZHluZSwgSW5j
LiwgaGVyZWJ5IGRpc2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZSBwcm9ncmFt
CisjICsgIGBHbm9tb3Zpc2lvbicgKHdoaWNoIG1ha2VzIHBhc3NlcyBhdCBjb21waWxlcnMpIHdy
aXR0ZW4gYnkgSmFtZXMgSGFja2VyLgorIyArCisjICsgIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4s
IDEgQXByaWwgMTk4OQorIyArICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyArCisjICtU
aGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRpbmcg
eW91ciBwcm9ncmFtIGludG8KKyMgK3Byb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBwcm9n
cmFtIGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjICtjb25zaWRlciBpdCBtb3Jl
IHVzZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0aCB0
aGUKKyMgK2xpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUg
R05VIExlc3NlciBHZW5lcmFsCisjICtQdWJsaWMgTGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMgTGlj
ZW5zZS4KKyMgCisjCisKK1NVTU1BUlkgPSAiUGFuZWwgcGx1Z2luIGRpc3BsYXlpbmcgY3VycmVu
dCBsb2FkIG9mIHRoZSBuZXR3b3JrIGludGVyZmFjZXMiCitIT01FUEFHRSA9ICJodHRwczovL2dv
b2RpZXMueGZjZS5vcmcvcHJvamVjdHMvcGFuZWwtcGx1Z2lucy94ZmNlNC1uZXRsb2FkLXBsdWdp
biIKK0xJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9MmI2MDY1YWU3ZDM2OTZjZGFkNjg2OWRkODYyN2E5ZmUiCisKK2luaGVyaXQg
eGZjZS1wYW5lbC1wbHVnaW4KKworU1JDX1VSSSA9ICJodHRwOi8vYXJjaGl2ZS54ZmNlLm9yZy9z
cmMvcGFuZWwtcGx1Z2lucy8ke0JQTn0vJHtAJyR7UFZ9J1swOjNdfS8ke0JQTn0tJHtQVn0udGFy
LmJ6MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZmFjM2EzYWQ1MmUxODU4NGJmYjEyN2NkMTcy
MWQ1NmRlMTAwNGI5ZmRkMTQwOTE1ZmRlZDg5NzA0Y2NiNDRlIgotLSAKMi4zOS4yCgo=

--===============6517320294295235072==--

