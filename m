Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA06C07208
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5522.1699083060683087738
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y1YicOYq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iw2hon2r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b993e02aa-34b20647-e306-4549-9628-ebe48fcfbed9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=48G9lDg05h8tjDo6zlEZNxa8RgsknAVmaazNRjIm3FI=;
	b=Y1YicOYqH1NR8bl0SNNFt+1nwFxzPQZQsxVyD/2NBVv7y3FOtUSfrpgPKDGzJucY
	4hPsfOpvlJ5gNgj5txwn2iQMydida5SkJHj5TkzNjQnVScAGCQZYRGGeKvTzhI394Ey
	tJwS9rg9n8t109cm7dUbewQQJIleAzKNlpda91pE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=48G9lDg05h8tjDo6zlEZNxa8RgsknAVmaazNRjIm3FI=;
	b=iw2hon2r2tfmJXCQiINioM6kEAcL7S6btvTRvI1E1rEkWhIy5LCcGvFB5Fkkpm+u
	UZ84aTCc7lc4fqJSSihQJuwCactGsJ6eCa3sIXsIEQGCJKEZRKtNqGZGzlTqH6q9CLF
	wWIaWWP856CZG04KLOdO3SLkBc964ThUOspr0+7k=
Content-Type: multipart/mixed; boundary="===============5249886068511809393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-mailwatch-plugin: upgrading to 1.3.1 SUCCEEDED
Message-ID: <0101018b993e02aa-34b20647-e306-4549-9628-ebe48fcfbed9-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106323

--===============5249886068511809393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-mailwatch-plugin* to *1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-mailwatch-plugin-upgrade-1.3.0-1.3.1.patch
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
From c116594a68f42ad1c76fb7d50b5e53f1003206d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:24:02 +0000
Subject: [PATCH] xfce4-mailwatch-plugin: upgrade 1.3.0 -> 1.3.1

---
 .../mailwatch/xfce4-mailwatch-plugin_1.3.0.bb |  13 --
 .../mailwatch/xfce4-mailwatch-plugin_1.3.1.bb | 143 ++++++++++++++++++
 2 files changed, 143 insertions(+), 13 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
deleted file mode 100644
index a5c98efc1..000000000
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "gnutls"
-
-SRC_URI[sha256sum] = "20f91ebefd2880b27f421f773115b3740f67de2bf60feace3841bfd1a09cbe2e"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
new file mode 100644
index 000000000..42e5ece14
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
@@ -0,0 +1,143 @@
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
+SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "gnutls"
+
+SRC_URI[sha256sum] = "054964e9fe4ca668486400991ce1ea01d07aac7ba235f4b14d4a8f7d9800046a"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.39.2


--===============5249886068511809393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-mailwatch-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-mailwatch-plugin/1.3/xfce4-mailwatch-plugin-1.3.0.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-mailwatch-plugin/1.3/xfce4-mailwatch-plugin-1.3.1.tar.bz2"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-dbg: PKGSIZE changed from 393560 to 400728 (+2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-dbg: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-dev: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-doc: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ar: PKGSIZE changed from 14055 to 13679 (-3%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ar: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ar: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ast: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ast: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-be: PKGSIZE changed from 15211 to 15349 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-be: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-be: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-bg: PKGSIZE changed from 15973 to 16025 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-bg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-bg: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ca: PKGSIZE changed from 12298 to 12381 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ca: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ca: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-cs: PKGSIZE changed from 12803 to 12717 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-cs: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-cs: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-da: PKGSIZE changed from 11861 to 11759 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-da: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-da: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-de: PKGSIZE changed from 12418 to 12499 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-de: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-de: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-el: PKGSIZE changed from 16565 to 16254 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-el: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-el: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-au: PKGSIZE changed from 11279 to 11066 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-au: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-au: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-gb: PKGSIZE changed from 10294 to 10101 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-gb: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-en-gb: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-es: PKGSIZE changed from 12730 to 12677 (-0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-es: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-es: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-eu: PKGSIZE changed from 10797 to 11867 (+10%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-eu: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-eu: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fi: PKGSIZE changed from 11901 to 11671 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fi: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fi: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fr: PKGSIZE changed from 13099 to 13090 (-0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fr: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-fr: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-gl: PKGSIZE changed from 12601 to 12499 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-gl: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-gl: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-he: PKGSIZE changed from 13415 to 13457 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-he: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-he: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hr: PKGSIZE changed from 12002 to 11984 (-0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hr: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hr: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hu: PKGSIZE changed from 12487 to 12264 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hu: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-hu: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-id: PKGSIZE changed from 11636 to 11699 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-id: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-id: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ie: PKGSIZE changed from 4758 to 4844 (+2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ie: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ie: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-is: PKGSIZE changed from 6895 to 6904 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-is: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-is: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-it: PKGSIZE changed from 12219 to 12370 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-it: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-it: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ja: PKGSIZE changed from 13999 to 13908 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ja: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ja: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ko: PKGSIZE changed from 12681 to 12782 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ko: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ko: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lt: PKGSIZE changed from 12265 to 12382 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lt: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lt: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lv: PKGSIZE changed from 10874 to 10501 (-3%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lv: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-lv: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ms: PKGSIZE changed from 11490 to 11572 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ms: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ms: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nb: PKGSIZE changed from 11632 to 11511 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nb: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nb: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nl: PKGSIZE changed from 12056 to 12138 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nl: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-nl: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-oc: PKGSIZE changed from 12652 to 12676 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-oc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-oc: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pl: PKGSIZE changed from 12255 to 12291 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pl: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pl: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt-br: PKGSIZE changed from 12455 to 12568 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt-br: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt-br: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt: PKGSIZE changed from 12080 to 12226 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-pt: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ru: PKGSIZE changed from 15118 to 15165 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ru: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ru: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sk: PKGSIZE changed from 12677 to 12801 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sk: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sk: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sl: PKGSIZE changed from 11963 to 12064 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sl: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sl: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sq: PKGSIZE changed from 12490 to 12537 (+0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sq: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sq: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sr: PKGSIZE changed from 15648 to 15614 (-0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sr: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sr: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sv: PKGSIZE changed from 11606 to 11665 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sv: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-sv: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-th: PKGSIZE changed from 17474 to 17566 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-th: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-th: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-tr: PKGSIZE changed from 12073 to 11918 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-tr: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-tr: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ug: PKGSIZE changed from 14170 to 13684 (-3%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ug: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ug: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-uk: PKGSIZE changed from 15595 to 15750 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-uk: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-uk: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur-pk: PKGSIZE changed from 12939 to 12476 (-4%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur-pk: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur-pk: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur: PKGSIZE changed from 12922 to 12459 (-4%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-ur: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-vi: PKGSIZE changed from 11021 to 10799 (-2%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-vi: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-vi: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-cn: PKGSIZE changed from 11269 to 11165 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-cn: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-cn: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-tw: PKGSIZE changed from 11566 to 11464 (-1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-tw: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-locale-zh-tw: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-src: PKGSIZE changed from 303602 to 306168 (+1%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-src: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin: PKGSIZE changed from 144784 to 144779 (-0%)
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-64-poky-linux/xfce4-mailwatch-plugin/xfce4-mailwatch-plugin: PV changed from "1.3.0" to "1.3.1"

--===============5249886068511809393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-mailwatch-plugin-upgrade-1.3.0-1.3.1.patch"

RnJvbSBjMTE2NTk0YTY4ZjQyYWQxYzc2ZmI3ZDUwYjVlNTNmMTAwMzIwNmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoyNDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LW1haWx3YXRjaC1wbHVnaW46IHVwZ3JhZGUgMS4zLjAgLT4gMS4zLjEKCi0tLQogLi4uL21h
aWx3YXRjaC94ZmNlNC1tYWlsd2F0Y2gtcGx1Z2luXzEuMy4wLmJiIHwgIDEzIC0tCiAuLi4vbWFp
bHdhdGNoL3hmY2U0LW1haWx3YXRjaC1wbHVnaW5fMS4zLjEuYmIgfCAxNDMgKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL21h
aWx3YXRjaC94ZmNlNC1tYWlsd2F0Y2gtcGx1Z2luXzEuMy4wLmJiCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9tYWlsd2F0Y2gveGZjZTQtbWFpbHdh
dGNoLXBsdWdpbl8xLjMuMS5iYgoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVs
LXBsdWdpbnMvbWFpbHdhdGNoL3hmY2U0LW1haWx3YXRjaC1wbHVnaW5fMS4zLjAuYmIgYi9tZXRh
LXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL21haWx3YXRjaC94ZmNlNC1tYWlsd2F0Y2gtcGx1
Z2luXzEuMy4wLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhNWM5OGVmYzEuLjAw
MDAwMDAwMAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL21haWx3YXRjaC94
ZmNlNC1tYWlsd2F0Y2gtcGx1Z2luXzEuMy4wLmJiCisrKyAvZGV2L251bGwKQEAgLTEsMTMgKzAs
MCBAQAotU1VNTUFSWSA9ICJNdWx0aS1wcm90b2NvbCwgbXVsdGktbWFpbGJveCBtYWlsIHdhdGNo
ZXIgZm9yIHRoZSBYZmNlNCBwYW5lbCIKLUhPTUVQQUdFID0gImh0dHA6Ly9nb29kaWVzLnhmY2Uu
b3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtbWFpbHdhdGNoLXBsdWdpbiIKLUxJQ0VO
U0UgPSAiR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYiCi0KLWluaGVyaXQgeGZjZS1wYW5l
bC1wbHVnaW4KLQotREVQRU5EUyArPSAiZ251dGxzIgotCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjBmOTFlYmVmZDI4ODBiMjdmNDIxZjc3MzExNWIzNzQwZjY3ZGUyYmY2MGZlYWNlMzg0MWJmZDFh
MDljYmUyZSIKLQotUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJP
X0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi1QQUNLQUdFQ09ORklHW2lwdjZdID0gIi0tZW5hYmxl
LWlwdjYsLS1kaXNhYmxlLWlwdjYsIgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFu
ZWwtcGx1Z2lucy9tYWlsd2F0Y2gveGZjZTQtbWFpbHdhdGNoLXBsdWdpbl8xLjMuMS5iYiBiL21l
dGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvbWFpbHdhdGNoL3hmY2U0LW1haWx3YXRjaC1w
bHVnaW5fMS4zLjEuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi40MmU1
ZWNlMTQKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5z
L21haWx3YXRjaC94ZmNlNC1tYWlsd2F0Y2gtcGx1Z2luXzEuMy4xLmJiCkBAIC0wLDAgKzEsMTQz
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAt
MSwxMiArMSwxMiBAQAorIyAtCQkgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgLQkJ
ICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjIC0KKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODks
IDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gICAgIDU5IFRlbXBsZSBQ
bGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMgKyAgICAgICAg
ICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAg
ICAgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEKKyMgKworIyArIENvcHlyaWdodCAoQykgMTk4
OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjICsgNTEgRnJhbmtsaW4g
U3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyAgIEV2ZXJ5
b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcwor
IyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxv
d2VkLgorIyAgCisjIC0JCQkgICAgUHJlYW1ibGUKKyMgKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQcmVhbWJsZQorIyAgCisjICAgIFRoZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBh
cmUgZGVzaWduZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNo
YW5nZSBpdC4gIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVyYWwgUHVibGljCisjIEBAIC0xNSw3
ICsxNSw3IEBACisjICBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBvZiB0
aGUgRnJlZSBTb2Z0d2FyZQorIyAgRm91bmRhdGlvbidzIHNvZnR3YXJlIGFuZCB0byBhbnkgb3Ro
ZXIgcHJvZ3JhbSB3aG9zZSBhdXRob3JzIGNvbW1pdCB0bworIyAgdXNpbmcgaXQuICAoU29tZSBv
dGhlciBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gc29mdHdhcmUgaXMgY292ZXJlZCBieQorIyAt
dGhlIEdOVSBMaWJyYXJ5IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2Fu
IGFwcGx5IGl0IHRvCisjICt0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlu
c3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0bworIyAgeW91ciBwcm9ncmFtcywgdG9vLgorIyAg
CisjICAgIFdoZW4gd2Ugc3BlYWsgb2YgZnJlZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0
byBmcmVlZG9tLCBub3QKKyMgQEAgLTU1LDggKzU1LDggQEAKKyMgIAorIyAgICBUaGUgcHJlY2lz
ZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAg
bW9kaWZpY2F0aW9uIGZvbGxvdy4KKyMgLQwKKyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBM
SUNFTlNFCisjICsKKyMgKyAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJ
Q0VOU0UKKyMgICAgIFRFUk1TIEFORCBDT05ESVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJ
T04gQU5EIE1PRElGSUNBVElPTgorIyAgCisjICAgIDAuIFRoaXMgTGljZW5zZSBhcHBsaWVzIHRv
IGFueSBwcm9ncmFtIG9yIG90aGVyIHdvcmsgd2hpY2ggY29udGFpbnMKKyMgQEAgLTExMCw3ICsx
MTAsNyBAQAorIyAgICAgIExpY2Vuc2UuICAoRXhjZXB0aW9uOiBpZiB0aGUgUHJvZ3JhbSBpdHNl
bGYgaXMgaW50ZXJhY3RpdmUgYnV0CisjICAgICAgZG9lcyBub3Qgbm9ybWFsbHkgcHJpbnQgc3Vj
aCBhbiBhbm5vdW5jZW1lbnQsIHlvdXIgd29yayBiYXNlZCBvbgorIyAgICAgIHRoZSBQcm9ncmFt
IGlzIG5vdCByZXF1aXJlZCB0byBwcmludCBhbiBhbm5vdW5jZW1lbnQuKQorIyAtDAorIyArCisj
ICBUaGVzZSByZXF1aXJlbWVudHMgYXBwbHkgdG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9s
ZS4gIElmCisjICBpZGVudGlmaWFibGUgc2VjdGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVy
aXZlZCBmcm9tIHRoZSBQcm9ncmFtLAorIyAgYW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVy
ZWQgaW5kZXBlbmRlbnQgYW5kIHNlcGFyYXRlIHdvcmtzIGluCisjIEBAIC0xNjgsNyArMTY4LDcg
QEAKKyMgIGFjY2VzcyB0byBjb3B5IHRoZSBzb3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNl
IGNvdW50cyBhcworIyAgZGlzdHJpYnV0aW9uIG9mIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91
Z2ggdGhpcmQgcGFydGllcyBhcmUgbm90CisjICBjb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNl
IGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2RlLgorIyAtDAorIyArCisjICAgIDQuIFlvdSBtYXkg
bm90IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbQor
IyAgZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkg
YXR0ZW1wdAorIyAgb3RoZXJ3aXNlIHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSBvciBkaXN0
cmlidXRlIHRoZSBQcm9ncmFtIGlzCisjIEBAIC0yMjUsNyArMjI1LDcgQEAKKyMgIAorIyAgVGhp
cyBzZWN0aW9uIGlzIGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJl
bGlldmVkIHRvCisjICBiZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5z
ZS4KKyMgLQwKKyMgKworIyAgICA4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2Yg
dGhlIFByb2dyYW0gaXMgcmVzdHJpY3RlZCBpbgorIyAgY2VydGFpbiBjb3VudHJpZXMgZWl0aGVy
IGJ5IHBhdGVudHMgb3IgYnkgY29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlCisjICBvcmlnaW5h
bCBjb3B5cmlnaHQgaG9sZGVyIHdobyBwbGFjZXMgdGhlIFByb2dyYW0gdW5kZXIgdGhpcyBMaWNl
bnNlCisjIEBAIC0yNTUsNyArMjU1LDcgQEAKKyMgIG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3Rh
dHVzIG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBvdXIgZnJlZSBzb2Z0d2FyZSBhbmQKKyMgIG9mIHBy
b21vdGluZyB0aGUgc2hhcmluZyBhbmQgcmV1c2Ugb2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAg
CisjIC0JCQkgICAgTk8gV0FSUkFOVFkKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBO
TyBXQVJSQU5UWQorIyAgCisjICAgIDExLiBCRUNBVVNFIFRIRSBQUk9HUkFNIElTIExJQ0VOU0VE
IEZSRUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBOTyBXQVJSQU5UWQorIyAgRk9SIFRIRSBQUk9HUkFN
LCBUTyBUSEUgRVhURU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxFIExBVy4gIEVYQ0VQVCBXSEVO
CisjIEBAIC0yNzcsOSArMjc3LDkgQEAKKyMgIFBST0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERF
UiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkg
T0YgU1VDSCBEQU1BR0VTLgorIyAgCisjIC0JCSAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJ
T05TCisjIC0MCisjIC0JICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQ
cm9ncmFtcworIyArICAgICAgICAgICAgICAgICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJ
T05TCisjICsKKyMgKyAgICAgICAgICAgIEhvdyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3Vy
IE5ldyBQcm9ncmFtcworIyAgCisjICAgIElmIHlvdSBkZXZlbG9wIGEgbmV3IHByb2dyYW0sIGFu
ZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgIHBvc3NpYmxlIHVzZSB0byB0
aGUgcHVibGljLCB0aGUgYmVzdCB3YXkgdG8gYWNoaWV2ZSB0aGlzIGlzIHRvIG1ha2UgaXQKKyMg
QEAgLTMwMywxNyArMzAzLDE2IEBACisjICAgICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAgICAgIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgLSAgICBZb3Ugc2hvdWxkIGhh
dmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAt
ICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNv
ZnR3YXJlCisjIC0gICAgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAz
MzAsIEJvc3RvbiwgTUEgIDAyMTExLTEzMDcgIFVTQQorIyAtCisjICsgICAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxv
bmcKKyMgKyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyArICAgIDUxIEZyYW5rbGluIFN0cmVldCwgRmlm
dGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCisjICAKKyMgIEFsc28gYWRkIGlu
Zm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBt
YWlsLgorIyAgCisjICBJZiB0aGUgcHJvZ3JhbSBpcyBpbnRlcmFjdGl2ZSwgbWFrZSBpdCBvdXRw
dXQgYSBzaG9ydCBub3RpY2UgbGlrZSB0aGlzCisjICB3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRl
cmFjdGl2ZSBtb2RlOgorIyAgCisjIC0gICAgR25vbW92aXNpb24gdmVyc2lvbiA2OSwgQ29weXJp
Z2h0IChDKSB5ZWFyICBuYW1lIG9mIGF1dGhvcgorIyArICAgIEdub21vdmlzaW9uIHZlcnNpb24g
NjksIENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9mIGF1dGhvcgorIyAgICAgIEdub21vdmlzaW9u
IGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJSQU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hv
dyB3Jy4KKyMgICAgICBUaGlzIGlzIGZyZWUgc29mdHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNvbWUg
dG8gcmVkaXN0cmlidXRlIGl0CisjICAgICAgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyB0eXBl
IGBzaG93IGMnIGZvciBkZXRhaWxzLgorIyBAQCAtMzM2LDUgKzMzNSw1IEBACisjICBUaGlzIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRpbmcgeW91ciBw
cm9ncmFtIGludG8KKyMgIHByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBwcm9ncmFtIGlz
IGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjICBjb25zaWRlciBpdCBtb3JlIHVzZWZ1
bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0aCB0aGUKKyMg
LWxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05VIExp
YnJhcnkgR2VuZXJhbAorIyArbGlicmFyeS4gIElmIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBk
bywgdXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQg
b2YgdGhpcyBMaWNlbnNlLgorIyAKKyMKKworU1VNTUFSWSA9ICJNdWx0aS1wcm90b2NvbCwgbXVs
dGktbWFpbGJveCBtYWlsIHdhdGNoZXIgZm9yIHRoZSBYZmNlNCBwYW5lbCIKK0hPTUVQQUdFID0g
Imh0dHA6Ly9nb29kaWVzLnhmY2Uub3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtbWFp
bHdhdGNoLXBsdWdpbiIKK0xJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMi
CisKK2luaGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4KKworREVQRU5EUyArPSAiZ251dGxzIgorCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDU0OTY0ZTlmZTRjYTY2ODQ4NjQwMDk5MWNlMWVhMDFkMDdh
YWM3YmEyMzVmNGIxNGQ0YThmN2Q5ODAwMDQ2YSIKKworUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJi
LnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCitQQUNLQUdFQ09O
RklHW2lwdjZdID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIgotLSAKMi4zOS4yCgo=

--===============5249886068511809393==--

