Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83D1C05031
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5529.1699083061004355690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MjMYboKW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mj4biAsj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e03c5-2e933114-db17-460f-a3b5-61f0db2fd3df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dhl0ZS4995tII9yLk8UlU92/CZNCNoFiuBBVyHNjb7Y=;
	b=MjMYboKWS9VBXhGcA5Uhy+lpQQLZ68OjWma3QZIXbgE+tt3trd1bcDxWl3hk+nAi
	heOa3vkLm0KagYbPg8qZkPsoBnEqnd1VsobXFSL79fxoFHKgDM6jzUcTybLg58Q4dcW
	9244EPvntKpr2Rpc+QQqs/EDqCQIb1EfODuiFM1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dhl0ZS4995tII9yLk8UlU92/CZNCNoFiuBBVyHNjb7Y=;
	b=mj4biAsj3+SDkOlCtAPtUlyNb+FNi6gX69rqJ5xHTos+Rp0dtDbJPEck+p4+Y1FN
	RY+Cud+kku23RuBzZVawGh9cjEVtuwaEJx8OHF3A47x7mqgp4Xuk9qN01swQkDBs56Q
	CMxfzGdwoMjkKP4TJL/ZclypQtP1qixRl2ARwBEQ=
Content-Type: multipart/mixed; boundary="===============0023568672948569585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-notes-plugin: upgrading to 1.10.0 SUCCEEDED
Message-ID: <0101018b993e03c5-2e933114-db17-460f-a3b5-61f0db2fd3df-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106336

--===============0023568672948569585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-notes-plugin* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-notes-plugin-upgrade-1.9.0-1.10.0.patch
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
From 4a48d03ab7dd6888570a008115b57b627ea80a08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:34:25 +0000
Subject: [PATCH] xfce4-notes-plugin: upgrade 1.9.0 -> 1.10.0

---
 .../notes/xfce4-notes-plugin_1.10.0.bb        | 140 ++++++++++++++++++
 .../notes/xfce4-notes-plugin_1.9.0.bb         |  10 --
 2 files changed, 140 insertions(+), 10 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
new file mode 100644
index 000000000..b82424764
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
@@ -0,0 +1,140 @@
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
+# @@ -1,12 +1,12 @@
+# -		    GNU GENERAL PUBLIC LICENSE
+# -		       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
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
+# @@ -15,7 +15,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -55,8 +55,8 @@
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
+# @@ -110,7 +110,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -168,7 +168,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -225,7 +225,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -255,7 +255,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -277,9 +277,9 @@
+#  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+#  POSSIBILITY OF SUCH DAMAGES.
+#  
+# -		     END OF TERMS AND CONDITIONS
+# -
+# -	    How to Apply These Terms to Your New Programs
+# +                     END OF TERMS AND CONDITIONS
+# +
+# +            How to Apply These Terms to Your New Programs
+#  
+#    If you develop a new program, and you want it to be of the greatest
+#  possible use to the public, the best way to achieve this is to make it
+# @@ -303,17 +303,16 @@
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# -
+# +    You should have received a copy of the GNU General Public License along
+# +    with this program; if not, write to the Free Software Foundation, Inc.,
+# +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+#  If the program is interactive, make it output a short notice like this
+#  when it starts in an interactive mode:
+#  
+# -    Gnomovision version 69, Copyright (C) year  name of author
+# +    Gnomovision version 69, Copyright (C) year name of author
+#      Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+#      This is free software, and you are welcome to redistribute it
+#      under certain conditions; type `show c' for details.
+# @@ -336,5 +335,5 @@
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+#  consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Library General
+# +library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.
+# 
+#
+
+SUMMARY = "Notes plugin for the Xfce Panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf"
+
+SRC_URI[sha256sum] = "2ee4406042edd352a91e166c83b60d13220ef04dce3fa6b9e0eb13636d636929"
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
deleted file mode 100644
index dc0fc2c60..000000000
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Notes plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf"
-
-SRC_URI[sha256sum] = "13f909c948b639f96de64cf793eb74cb1779589201d3933eff214ee8f35ab088"
-- 
2.39.2


--===============0023568672948569585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-notes-plugin: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin: PACKAGES: added "xfce4-notes-plugin-locale-en-ca"
packages/core2-64-poky-linux/xfce4-notes-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-notes-plugin/1.9/xfce4-notes-plugin-1.9.0.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-notes-plugin/1.10/xfce4-notes-plugin-1.10.0.tar.bz2"
packages/core2-64-poky-linux/xfce4-notes-plugin: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-dbg: PKGSIZE changed from 1152256 to 1165120 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-dbg: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-dbg: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-dev: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-dev: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-doc: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-doc: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-am: PKGSIZE changed from 4160 to 4162 (+0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-am: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-am: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ar: PKGSIZE changed from 4332 to 4364 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ar: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ar: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ast: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ast: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-be: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-be: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-bg: PKGSIZE changed from 4621 to 4905 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-bg: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-bg: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ca: PKGSIZE changed from 3915 to 4156 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ca: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ca: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-cs: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-cs: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-da: PKGSIZE changed from 3917 to 3859 (-1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-da: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-da: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-de: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-de: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-el: PKGSIZE changed from 4811 to 5113 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-el: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-el: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-au: PKGSIZE changed from 3604 to 3636 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-au: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-au: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-gb: PKGSIZE changed from 3617 to 3663 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-gb: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-en-gb: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-es: PKGSIZE changed from 4193 to 4251 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-es: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-es: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-et: PKGSIZE changed from 1896 to 4074 (+115%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-et: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-et: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-eu: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-eu: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-fi: PKGSIZE changed from 3855 to 4062 (+5%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-fi: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-fi: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-fr: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-fr: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-gl: PKGSIZE changed from 3791 to 4028 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-gl: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-gl: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-he: PKGSIZE changed from 4406 to 4412 (+0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-he: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-he: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hr: PKGSIZE changed from 3760 to 3790 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hr: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hr: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hu: PKGSIZE changed from 3854 to 3894 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hu: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hu: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hy-am: PKGSIZE changed from 4483 to 4477 (-0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hy-am: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hy-am: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hye: PKGSIZE changed from 4486 to 4529 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hye: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-hye: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-id: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-id: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ie: PKGSIZE changed from 3618 to 3651 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ie: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ie: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-is: PKGSIZE changed from 3802 to 3838 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-is: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-is: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-it: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-it: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ja: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ja: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-kk: PKGSIZE changed from 4391 to 4670 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-kk: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-kk: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ko: PKGSIZE changed from 3883 to 4122 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ko: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ko: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-lt: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-lt: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-lv: PKGSIZE changed from 2912 to 2945 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-lv: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-lv: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ms: PKGSIZE changed from 3610 to 3841 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ms: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ms: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nb: PKGSIZE changed from 4108 to 4097 (-0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nb: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nb: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nl: PKGSIZE changed from 3706 to 3952 (+7%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nl: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-nl: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-oc: PKGSIZE changed from 3860 to 4087 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-oc: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-oc: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pl: PKGSIZE changed from 3869 to 4076 (+5%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pl: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pl: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pt-br: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pt-br: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pt: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-pt: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ro: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ro: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ru: PKGSIZE changed from 4931 to 4952 (+0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ru: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ru: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sk: PKGSIZE changed from 3861 to 4121 (+7%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sk: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sk: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sl: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sl: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sq: PKGSIZE changed from 3778 to 4002 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sq: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sq: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sr: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sr: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sv: PKGSIZE changed from 3844 to 4072 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sv: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-sv: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-th: PKGSIZE changed from 5409 to 5708 (+6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-th: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-th: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-tr: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-tr: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ug: PKGSIZE changed from 4533 to 4568 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ug: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ug: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-uk: PKGSIZE changed from 4685 to 4990 (+7%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-uk: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-uk: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur-pk: PKGSIZE changed from 3004 to 3045 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur-pk: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur-pk: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur: PKGSIZE changed from 2987 to 3028 (+1%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-ur: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-vi: PKGSIZE changed from 2438 to 2499 (+3%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-vi: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-vi: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-zh-cn: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-zh-cn: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-zh-tw: PKGSIZE changed from 3615 to 3860 (+7%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-zh-tw: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-zh-tw: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-src: PKGSIZE changed from 429988 to 405729 (-6%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-src: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-src: FILELIST: directory renamed /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/lib -> /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/lib, removed "/usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/main-status-icon.c /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/xfce-autostart.c /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/main-panel-plugin.c /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/xfce-autostart.h /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/main-popup.c /usr/src/debug/xfce4-notes-plugin/1.9.0-r0/src/main-settings-dialog.c", added "/usr/src/debug/xfce4-notes-plugin/1.10.0-r0/libc/xfce-autostart.h /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/src/main-popup.c /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/libc/xfce-autostart.c /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/src/main-settings-dialog.c /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/src/main-status-icon.c /usr/src/debug/xfce4-notes-plugin/1.10.0-r0/src/main-panel-
 plugin.c"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-src: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-staticdev: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-staticdev: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin: PKGSIZE changed from 339668 to 339922 (+0%)
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin: PV changed from "1.9.0" to "1.10.0"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin: PKGV changed from 1.9.0 [default] to 1.10.0 [default]

--===============0023568672948569585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-notes-plugin: PACKAGES: added "xfce4-notes-plugin-locale-en-ca"
packages/core2-64-poky-linux/xfce4-notes-plugin/xfce4-notes-plugin-locale-et: PKGSIZE changed from 1896 to 4074 (+115%)

--===============0023568672948569585==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-notes-plugin-upgrade-1.9.0-1.10.0.patch"

RnJvbSA0YTQ4ZDAzYWI3ZGQ2ODg4NTcwYTAwODExNWI1N2I2MjdlYTgwYTA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjozNDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LW5vdGVzLXBsdWdpbjogdXBncmFkZSAxLjkuMCAtPiAxLjEwLjAKCi0tLQogLi4uL25vdGVz
L3hmY2U0LW5vdGVzLXBsdWdpbl8xLjEwLjAuYmIgICAgICAgIHwgMTQwICsrKysrKysrKysrKysr
KysrKwogLi4uL25vdGVzL3hmY2U0LW5vdGVzLXBsdWdpbl8xLjkuMC5iYiAgICAgICAgIHwgIDEw
IC0tCiAyIGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL25vdGVz
L3hmY2U0LW5vdGVzLXBsdWdpbl8xLjEwLjAuYmIKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLXhm
Y2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL25vdGVzL3hmY2U0LW5vdGVzLXBsdWdpbl8xLjkuMC5i
YgoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbm90ZXMveGZj
ZTQtbm90ZXMtcGx1Z2luXzEuMTAuMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdp
bnMvbm90ZXMveGZjZTQtbm90ZXMtcGx1Z2luXzEuMTAuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAuLmI4MjQyNDc2NAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEteGZj
ZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbm90ZXMveGZjZTQtbm90ZXMtcGx1Z2luXzEuMTAuMC5i
YgpAQCAtMCwwICsxLDE0MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysr
IENPUFlJTkcKKyMgQEAgLTEsMTIgKzEsMTIgQEAKKyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJ
QyBMSUNFTlNFCisjIC0JCSAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQorIyAtCisjIC0gQ29w
eXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAt
ICAgICA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAgMDIxMTEtMTMwNyAg
VVNBCisjICsgICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisj
ICsgICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjICsKKyMgKyBD
b3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAor
IyArIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMw
MSBVU0EKKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2
ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2lu
ZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAtCQkJICAgIFByZWFtYmxlCisjICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUHJlYW1ibGUKKyMgIAorIyAgICBUaGUgbGljZW5zZXMgZm9y
IG1vc3Qgc29mdHdhcmUgYXJlIGRlc2lnbmVkIHRvIHRha2UgYXdheSB5b3VyCisjICBmcmVlZG9t
IHRvIHNoYXJlIGFuZCBjaGFuZ2UgaXQuICBCeSBjb250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYworIyBAQCAtMTUsNyArMTUsNyBAQAorIyAgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBs
aWVzIHRvIG1vc3Qgb2YgdGhlIEZyZWUgU29mdHdhcmUKKyMgIEZvdW5kYXRpb24ncyBzb2Z0d2Fy
ZSBhbmQgdG8gYW55IG90aGVyIHByb2dyYW0gd2hvc2UgYXV0aG9ycyBjb21taXQgdG8KKyMgIHVz
aW5nIGl0LiAgKFNvbWUgb3RoZXIgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIHNvZnR3YXJlIGlz
IGNvdmVyZWQgYnkKKyMgLXRoZSBHTlUgTGlicmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlu
c3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0bworIyArdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlvdSBjYW4gYXBwbHkgaXQgdG8KKyMgIHlvdXIgcHJv
Z3JhbXMsIHRvby4KKyMgIAorIyAgICBXaGVuIHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdl
IGFyZSByZWZlcnJpbmcgdG8gZnJlZWRvbSwgbm90CisjIEBAIC01NSw4ICs1NSw4IEBACisjICAK
KyMgICAgVGhlIHByZWNpc2UgdGVybXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3Ry
aWJ1dGlvbiBhbmQKKyMgIG1vZGlmaWNhdGlvbiBmb2xsb3cuCisjIC0MCisjIC0JCSAgICBHTlUg
R0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyArCisjICsgICAgICAgICAgICAgICAgICAgIEdOVSBH
RU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09Q
WUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJRklDQVRJT04KKyMgIAorIyAgICAwLiBUaGlzIExp
Y2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3JhbSBvciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5z
CisjIEBAIC0xMTAsNyArMTEwLDcgQEAKKyMgICAgICBMaWNlbnNlLiAgKEV4Y2VwdGlvbjogaWYg
dGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVyYWN0aXZlIGJ1dAorIyAgICAgIGRvZXMgbm90IG5v
cm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3VuY2VtZW50LCB5b3VyIHdvcmsgYmFzZWQgb24KKyMg
ICAgICB0aGUgUHJvZ3JhbSBpcyBub3QgcmVxdWlyZWQgdG8gcHJpbnQgYW4gYW5ub3VuY2VtZW50
LikKKyMgLQwKKyMgKworIyAgVGhlc2UgcmVxdWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmll
ZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAgaWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQg
d29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0aGUgUHJvZ3JhbSwKKyMgIGFuZCBjYW4gYmUgcmVh
c29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5kZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyBA
QCAtMTY4LDcgKzE2OCw3IEBACisjICBhY2Nlc3MgdG8gY29weSB0aGUgc291cmNlIGNvZGUgZnJv
bSB0aGUgc2FtZSBwbGFjZSBjb3VudHMgYXMKKyMgIGRpc3RyaWJ1dGlvbiBvZiB0aGUgc291cmNl
IGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBhcnRpZXMgYXJlIG5vdAorIyAgY29tcGVsbGVkIHRv
IGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRoIHRoZSBvYmplY3QgY29kZS4KKyMgLQwKKyMgKwor
IyAgICA0LiBZb3UgbWF5IG5vdCBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1
dGUgdGhlIFByb2dyYW0KKyMgIGV4Y2VwdCBhcyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhp
cyBMaWNlbnNlLiAgQW55IGF0dGVtcHQKKyMgIG90aGVyd2lzZSB0byBjb3B5LCBtb2RpZnksIHN1
YmxpY2Vuc2Ugb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbSBpcworIyBAQCAtMjI1LDcgKzIyNSw3
IEBACisjICAKKyMgIFRoaXMgc2VjdGlvbiBpcyBpbnRlbmRlZCB0byBtYWtlIHRob3JvdWdobHkg
Y2xlYXIgd2hhdCBpcyBiZWxpZXZlZCB0bworIyAgYmUgYSBjb25zZXF1ZW5jZSBvZiB0aGUgcmVz
dCBvZiB0aGlzIExpY2Vuc2UuCisjIC0MCisjICsKKyMgICAgOC4gSWYgdGhlIGRpc3RyaWJ1dGlv
biBhbmQvb3IgdXNlIG9mIHRoZSBQcm9ncmFtIGlzIHJlc3RyaWN0ZWQgaW4KKyMgIGNlcnRhaW4g
Y291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRzIG9yIGJ5IGNvcHlyaWdodGVkIGludGVyZmFjZXMs
IHRoZQorIyAgb3JpZ2luYWwgY29weXJpZ2h0IGhvbGRlciB3aG8gcGxhY2VzIHRoZSBQcm9ncmFt
IHVuZGVyIHRoaXMgTGljZW5zZQorIyBAQCAtMjU1LDcgKzI1NSw3IEBACisjICBvZiBwcmVzZXJ2
aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwgZGVyaXZhdGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdh
cmUgYW5kCisjICBvZiBwcm9tb3RpbmcgdGhlIHNoYXJpbmcgYW5kIHJldXNlIG9mIHNvZnR3YXJl
IGdlbmVyYWxseS4KKyMgIAorIyAtCQkJICAgIE5PIFdBUlJBTlRZCisjICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTk8gV0FSUkFOVFkKKyMgIAorIyAgICAxMS4gQkVDQVVTRSBUSEUgUFJP
R1JBTSBJUyBMSUNFTlNFRCBGUkVFIE9GIENIQVJHRSwgVEhFUkUgSVMgTk8gV0FSUkFOVFkKKyMg
IEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBM
QVcuICBFWENFUFQgV0hFTgorIyBAQCAtMjc3LDkgKzI3Nyw5IEBACisjICBQUk9HUkFNUyksIEVW
RU4gSUYgU1VDSCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUK
KyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFUy4KKyMgIAorIyAtCQkgICAgIEVORCBPRiBU
RVJNUyBBTkQgQ09ORElUSU9OUworIyAtDAorIyAtCSAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVy
bXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgKyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBU
RVJNUyBBTkQgQ09ORElUSU9OUworIyArCisjICsgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhl
c2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgIAorIyAgICBJZiB5b3UgZGV2ZWxvcCBh
IG5ldyBwcm9ncmFtLCBhbmQgeW91IHdhbnQgaXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjICBw
b3NzaWJsZSB1c2UgdG8gdGhlIHB1YmxpYywgdGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBp
cyB0byBtYWtlIGl0CisjIEBAIC0zMDMsMTcgKzMwMywxNiBAQAorIyAgICAgIE1FUkNIQU5UQUJJ
TElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyMgICAg
ICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjIC0g
ICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0
ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBs
ZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMgLQorIyAr
ICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFsb25nCisjICsgICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3Jp
dGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgKyAgICA1MSBGcmFu
a2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyAg
CisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ry
b25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAgSWYgdGhlIHByb2dyYW0gaXMgaW50ZXJhY3Rp
dmUsIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQgbm90aWNlIGxpa2UgdGhpcworIyAgd2hlbiBpdCBz
dGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgIAorIyAtICAgIEdub21vdmlzaW9uIHZl
cnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciAgbmFtZSBvZiBhdXRob3IKKyMgKyAgICBHbm9t
b3Zpc2lvbiB2ZXJzaW9uIDY5LCBDb3B5cmlnaHQgKEMpIHllYXIgbmFtZSBvZiBhdXRob3IKKyMg
ICAgICBHbm9tb3Zpc2lvbiBjb21lcyB3aXRoIEFCU09MVVRFTFkgTk8gV0FSUkFOVFk7IGZvciBk
ZXRhaWxzIHR5cGUgYHNob3cgdycuCisjICAgICAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBhbmQg
eW91IGFyZSB3ZWxjb21lIHRvIHJlZGlzdHJpYnV0ZSBpdAorIyAgICAgIHVuZGVyIGNlcnRhaW4g
Y29uZGl0aW9uczsgdHlwZSBgc2hvdyBjJyBmb3IgZGV0YWlscy4KKyMgQEAgLTMzNiw1ICszMzUs
NSBAQAorIyAgVGhpcyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGRvZXMgbm90IHBlcm1pdCBpbmNv
cnBvcmF0aW5nIHlvdXIgcHJvZ3JhbSBpbnRvCisjICBwcm9wcmlldGFyeSBwcm9ncmFtcy4gIElm
IHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJvdXRpbmUgbGlicmFyeSwgeW91IG1heQorIyAgY29uc2lk
ZXIgaXQgbW9yZSB1c2VmdWwgdG8gcGVybWl0IGxpbmtpbmcgcHJvcHJpZXRhcnkgYXBwbGljYXRp
b25zIHdpdGggdGhlCisjIC1saWJyYXJ5LiAgSWYgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRvIGRv
LCB1c2UgdGhlIEdOVSBMaWJyYXJ5IEdlbmVyYWwKKyMgK2xpYnJhcnkuICBJZiB0aGlzIGlzIHdo
YXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05VIExlc3NlciBHZW5lcmFsCisjICBQdWJsaWMg
TGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMgTGljZW5zZS4KKyMgCisjCisKK1NVTU1BUlkgPSAiTm90
ZXMgcGx1Z2luIGZvciB0aGUgWGZjZSBQYW5lbCIKK0hPTUVQQUdFID0gImh0dHA6Ly9nb29kaWVz
LnhmY2Uub3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtbm90ZXMtcGx1Z2luIgorTElD
RU5TRSA9ICJHUEwtMi4wLW9ubHkiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKKworaW5oZXJpdCB4ZmNlLXBh
bmVsLXBsdWdpbgorCitERVBFTkRTICs9ICJndGsrMyBsaWJ4ZmNlNHVpIHhmY2U0LXBhbmVsIHhm
Y29uZiIKKworU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJlZTQ0MDYwNDJlZGQzNTJhOTFlMTY2Yzgz
YjYwZDEzMjIwZWYwNGRjZTNmYTZiOWUwZWIxMzYzNmQ2MzY5MjkiCmRpZmYgLS1naXQgYS9tZXRh
LXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL25vdGVzL3hmY2U0LW5vdGVzLXBsdWdpbl8xLjku
MC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbm90ZXMveGZjZTQtbm90ZXMt
cGx1Z2luXzEuOS4wLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkYzBmYzJjNjAu
LjAwMDAwMDAwMAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL25vdGVzL3hm
Y2U0LW5vdGVzLXBsdWdpbl8xLjkuMC5iYgorKysgL2Rldi9udWxsCkBAIC0xLDEwICswLDAgQEAK
LVNVTU1BUlkgPSAiTm90ZXMgcGx1Z2luIGZvciB0aGUgWGZjZSBQYW5lbCIKLUhPTUVQQUdFID0g
Imh0dHA6Ly9nb29kaWVzLnhmY2Uub3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtbm90
ZXMtcGx1Z2luIgotTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiIKLQot
aW5oZXJpdCB4ZmNlLXBhbmVsLXBsdWdpbgotCi1ERVBFTkRTICs9ICJndGsrMyBsaWJ4ZmNlNHVp
IHhmY2U0LXBhbmVsIHhmY29uZiIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzZjkwOWM5NDhi
NjM5Zjk2ZGU2NGNmNzkzZWI3NGNiMTc3OTU4OTIwMWQzOTMzZWZmMjE0ZWU4ZjM1YWIwODgiCi0t
IAoyLjM5LjIKCg==

--===============0023568672948569585==--

