Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E21C001B2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5536.1699083061219299202
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ByNTteox;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Uxamnb9I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b993e0541-1598f90d-8669-4190-b539-5835bfa6b28c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E3hI/g1pEKatbp9Y8DycISWDq41Tp0SLTj3NkqiYLFU=;
	b=ByNTteoxu6DonZEA9ySRza4AfqemRIgaq8/U+sQnJXe5L43blYnTgdz/pQ9JH9eb
	h793xzbJksXjO4IXeV5Zw5UTJAjJ2B3losx5y8Eztr2gtQjAPIT7ONL0/tVJKs5IZVA
	ttNm1K2PFmOqPZg6Ret5hzEfUhrxUdUcLlAv1tr0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E3hI/g1pEKatbp9Y8DycISWDq41Tp0SLTj3NkqiYLFU=;
	b=Uxamnb9IGZxVtz2jVowQ1MO8HHkvMjEwzYipVKzoKjokweVJ2ybkuxa4b2hydXNl
	XV8x85geWQCMD6kVscgX+TzVQ0eiFSrauVw0yo8XebP9hN7vh0UHqLfOiYEjelOe1Iz
	t4zN1zPgGZzFzc9n+m2umnAEy2exzX3g6IreRePI=
Content-Type: multipart/mixed; boundary="===============1491661641590178033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-verve-plugin: upgrading to 2.0.3 SUCCEEDED
Message-ID: <0101018b993e0541-1598f90d-8669-4190-b539-5835bfa6b28c-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106344

--===============1491661641590178033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-verve-plugin* to *2.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-verve-plugin-upgrade-2.0.1-2.0.3.patch
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
From 36a9e8e4ec1611c47de69b71979695cb4df9f84a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:11:10 +0000
Subject: [PATCH] xfce4-verve-plugin: upgrade 2.0.1 -> 2.0.3

---
 .../verve/xfce4-verve-plugin_2.0.1.bb         |   9 --
 .../verve/xfce4-verve-plugin_2.0.3.bb         | 139 ++++++++++++++++++
 2 files changed, 139 insertions(+), 9 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
deleted file mode 100644
index eefe3322b..000000000
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
-DEPENDS += "libpcre"
diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
new file mode 100644
index 000000000..d70be1342
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
@@ -0,0 +1,139 @@
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
+SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+SRC_URI[sha256sum] = "e1bf121f1bf9cf2a199bf5c0f3aa802f503df9bea50724741e7a92fe6d9fe09e"
+DEPENDS += "libpcre"
-- 
2.39.2


--===============1491661641590178033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-verve-plugin: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin: PACKAGES: added "xfce4-verve-plugin-locale-et"
packages/core2-64-poky-linux/xfce4-verve-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-verve-plugin/2.0/xfce4-verve-plugin-2.0.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-verve-plugin/2.0/xfce4-verve-plugin-2.0.3.tar.bz2"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dbg: RRECOMMENDS: removed "libpcre-dbg", added "libpcre2-dbg"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dbg: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dbg: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dbg: PKGSIZE changed from 117304 to 116064 (-1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dev: RRECOMMENDS: added "libpcre2-dev"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dev: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dev: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-doc: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-doc: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ar: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ar: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ast: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ast: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-be: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-be: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-be: PKGSIZE changed from 2918 to 2972 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-bg: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-bg: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-bg: PKGSIZE changed from 2798 to 2866 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ca: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ca: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ca: PKGSIZE changed from 2392 to 2456 (+3%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-cs: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-cs: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-cs: PKGSIZE changed from 2452 to 2515 (+3%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-da: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-da: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-da: PKGSIZE changed from 2275 to 2298 (+1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-de: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-de: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-de: PKGSIZE changed from 2404 to 2452 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-el: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-el: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-el: PKGSIZE changed from 2806 to 2866 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-au: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-au: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-au: PKGSIZE changed from 2263 to 2312 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-ca: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-ca: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-ca: PKGSIZE changed from 2268 to 2294 (+1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-gb: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-gb: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-gb: PKGSIZE changed from 1173 to 2307 (+97%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eo: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eo: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-es: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-es: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-es: PKGSIZE changed from 2398 to 2479 (+3%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eu: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eu: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eu: PKGSIZE changed from 1238 to 2354 (+90%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fi: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fi: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fi: PKGSIZE changed from 1851 to 1924 (+4%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fr: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fr: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-fr: PKGSIZE changed from 2466 to 2568 (+4%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-gl: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-gl: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-gl: PKGSIZE changed from 2364 to 2416 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-he: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-he: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-he: PKGSIZE changed from 2614 to 2668 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hr: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hr: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hr: PKGSIZE changed from 2376 to 2429 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hu: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hu: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hu: PKGSIZE changed from 2368 to 2419 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hy-am: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hy-am: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hy-am: PKGSIZE changed from 2897 to 2944 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hye: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hye: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-hye: PKGSIZE changed from 2891 to 2938 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-id: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-id: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-id: PKGSIZE changed from 2293 to 2329 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ie: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ie: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ie: PKGSIZE changed from 2236 to 2263 (+1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-is: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-is: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-is: PKGSIZE changed from 2327 to 2382 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-it: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-it: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-it: PKGSIZE changed from 2384 to 2483 (+4%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ja: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ja: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ja: PKGSIZE changed from 2483 to 2537 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ko: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ko: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ko: PKGSIZE changed from 2311 to 2367 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-lt: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-lt: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-lt: PKGSIZE changed from 2485 to 2503 (+1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-lv: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-lv: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ms: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ms: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ms: PKGSIZE changed from 2288 to 2335 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nb: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nb: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nb: PKGSIZE changed from 2309 to 2346 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nl: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nl: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-nl: PKGSIZE changed from 2349 to 2399 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-oc: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-oc: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-oc: PKGSIZE changed from 2277 to 2435 (+7%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pa: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pa: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pl: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pl: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pl: PKGSIZE changed from 2472 to 2528 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt-br: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt-br: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt-br: PKGSIZE changed from 2390 to 2489 (+4%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-pt: PKGSIZE changed from 2332 to 2433 (+4%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ro: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ro: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ru: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ru: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ru: PKGSIZE changed from 2946 to 2989 (+1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sk: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sk: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sk: PKGSIZE changed from 2436 to 2477 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sl: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sl: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sl: PKGSIZE changed from 2349 to 2393 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sq: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sq: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sq: PKGSIZE changed from 2329 to 2386 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sr: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sr: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sr: PKGSIZE changed from 2899 to 2955 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sv: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sv: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-sv: PKGSIZE changed from 2294 to 2340 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-th: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-th: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-th: PKGSIZE changed from 3188 to 3251 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-tr: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-tr: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-tr: PKGSIZE changed from 2377 to 2420 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ug: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ug: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-uk: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-uk: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-uk: PKGSIZE changed from 3030 to 3090 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ur-pk: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ur-pk: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ur: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-ur: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-vi: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-vi: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-cn: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-cn: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-cn: PKGSIZE changed from 2205 to 2259 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-tw: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-tw: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-zh-tw: PKGSIZE changed from 2203 to 2254 (+2%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-src: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-src: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-src: PKGSIZE changed from 78989 to 78334 (-1%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-staticdev: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-staticdev: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin: RDEPENDS: removed "libpcre (['>= 8.45'])", added "libpcre2 (['>= 10.42'])"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin: PV changed from "2.0.1" to "2.0.3"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin: PKGV changed from 2.0.1 [default] to 2.0.3 [default]
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin: PKGSIZE changed from 54537 to 54642 (+0%)

--===============1491661641590178033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-verve-plugin: PACKAGES: added "xfce4-verve-plugin-locale-et"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dbg: RRECOMMENDS: removed "libpcre-dbg", added "libpcre2-dbg"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-dev: RRECOMMENDS: added "libpcre2-dev"
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-en-gb: PKGSIZE changed from 1173 to 2307 (+97%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin-locale-eu: PKGSIZE changed from 1238 to 2354 (+90%)
packages/core2-64-poky-linux/xfce4-verve-plugin/xfce4-verve-plugin: RDEPENDS: removed "libpcre (['>= 8.45'])", added "libpcre2 (['>= 10.42'])"

--===============1491661641590178033==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-verve-plugin-upgrade-2.0.1-2.0.3.patch"

RnJvbSAzNmE5ZThlNGVjMTYxMWM0N2RlNjliNzE5Nzk2OTVjYjRkZjlmODRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoxMToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXZlcnZlLXBsdWdpbjogdXBncmFkZSAyLjAuMSAtPiAyLjAuMwoKLS0tCiAuLi4vdmVydmUv
eGZjZTQtdmVydmUtcGx1Z2luXzIuMC4xLmJiICAgICAgICAgfCAgIDkgLS0KIC4uLi92ZXJ2ZS94
ZmNlNC12ZXJ2ZS1wbHVnaW5fMi4wLjMuYmIgICAgICAgICB8IDEzOSArKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTM5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy92ZXJ2ZS94
ZmNlNC12ZXJ2ZS1wbHVnaW5fMi4wLjEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXhmY2Uv
cmVjaXBlcy1wYW5lbC1wbHVnaW5zL3ZlcnZlL3hmY2U0LXZlcnZlLXBsdWdpbl8yLjAuMy5iYgoK
ZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvdmVydmUveGZjZTQt
dmVydmUtcGx1Z2luXzIuMC4xLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy92
ZXJ2ZS94ZmNlNC12ZXJ2ZS1wbHVnaW5fMi4wLjEuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IGVlZmUzMzIyYi4uMDAwMDAwMDAwCi0tLSBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVs
LXBsdWdpbnMvdmVydmUveGZjZTQtdmVydmUtcGx1Z2luXzIuMC4xLmJiCisrKyAvZGV2L251bGwK
QEAgLTEsOSArMCwwIEBACi1TVU1NQVJZID0gIlZlcnZlIHBhbmVsIHBsdWdpbiBpcyBhIGNvbWZv
cnRhYmxlIGNvbW1hbmQgbGluZSBwbHVnaW4gZm9yIHRoZSBYZmNlIHBhbmVsIgotSE9NRVBBR0Ug
PSAiaHR0cDovL2dvb2RpZXMueGZjZS5vcmcvcHJvamVjdHMvcGFuZWwtcGx1Z2lucy94ZmNlNC12
ZXJ2ZS1wbHVnaW4iCi1MSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk0ZDU1ZDUxMmE5YmEzNmNhYTliN2RmMDc5YmFlMTlmIgot
Ci1pbmhlcml0IHhmY2UtcGFuZWwtcGx1Z2luCi0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYmRh
NWU1ZWI2MmQ2ZTQyYWZkYzZmMTIxZDJmMWNiZDRkOWQzYzJiMTZhNWUzZWQ4MTkyYjFiMjI0Yjhm
ODI1IgotREVQRU5EUyArPSAibGlicGNyZSIKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVz
LXBhbmVsLXBsdWdpbnMvdmVydmUveGZjZTQtdmVydmUtcGx1Z2luXzIuMC4zLmJiIGIvbWV0YS14
ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy92ZXJ2ZS94ZmNlNC12ZXJ2ZS1wbHVnaW5fMi4wLjMu
YmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5kNzBiZTEzNDIKLS0tIC9k
ZXYvbnVsbAorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3ZlcnZlL3hmY2U0
LXZlcnZlLXBsdWdpbl8yLjAuMy5iYgpAQCAtMCwwICsxLDEzOSBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMTIgKzEsMTIgQEAKKyMgLQkJ
ICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjIC0JCSAgICAgICBWZXJzaW9uIDIsIEp1
bmUgMTk5MQorIyAtCisjIC0gQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiwgSW5jLgorIyAtICAgICA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9z
dG9uLCBNQSAgMDIxMTEtMTMwNyAgVVNBCisjICsgICAgICAgICAgICAgICAgICAgIEdOVSBHRU5F
UkFMIFBVQkxJQyBMSUNFTlNFCisjICsgICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMiwg
SnVuZSAxOTkxCisjICsKKyMgKyBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuLAorIyArIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3Is
IEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8g
Y29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2Ug
ZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAtCQkJICAg
IFByZWFtYmxlCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJlYW1ibGUKKyMgIAor
IyAgICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRlc2lnbmVkIHRvIHRha2Ug
YXdheSB5b3VyCisjICBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgaXQuICBCeSBjb250cmFz
dCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyBAQCAtMTUsNyArMTUsNyBAQAorIyAgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIG1vc3Qgb2YgdGhlIEZyZWUgU29mdHdhcmUKKyMg
IEZvdW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8gYW55IG90aGVyIHByb2dyYW0gd2hvc2UgYXV0
aG9ycyBjb21taXQgdG8KKyMgIHVzaW5nIGl0LiAgKFNvbWUgb3RoZXIgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uIHNvZnR3YXJlIGlzIGNvdmVyZWQgYnkKKyMgLXRoZSBHTlUgTGlicmFyeSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0bworIyArdGhl
IEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlvdSBjYW4gYXBw
bHkgaXQgdG8KKyMgIHlvdXIgcHJvZ3JhbXMsIHRvby4KKyMgIAorIyAgICBXaGVuIHdlIHNwZWFr
IG9mIGZyZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJpbmcgdG8gZnJlZWRvbSwgbm90CisjIEBA
IC01NSw4ICs1NSw4IEBACisjICAKKyMgICAgVGhlIHByZWNpc2UgdGVybXMgYW5kIGNvbmRpdGlv
bnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQKKyMgIG1vZGlmaWNhdGlvbiBmb2xsb3cu
CisjIC0MCisjIC0JCSAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyArCisjICsgICAg
ICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICBURVJNUyBB
TkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJRklDQVRJT04K
KyMgIAorIyAgICAwLiBUaGlzIExpY2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3JhbSBvciBvdGhl
ciB3b3JrIHdoaWNoIGNvbnRhaW5zCisjIEBAIC0xMTAsNyArMTEwLDcgQEAKKyMgICAgICBMaWNl
bnNlLiAgKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVyYWN0aXZlIGJ1
dAorIyAgICAgIGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3VuY2VtZW50LCB5
b3VyIHdvcmsgYmFzZWQgb24KKyMgICAgICB0aGUgUHJvZ3JhbSBpcyBub3QgcmVxdWlyZWQgdG8g
cHJpbnQgYW4gYW5ub3VuY2VtZW50LikKKyMgLQwKKyMgKworIyAgVGhlc2UgcmVxdWlyZW1lbnRz
IGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAgaWRlbnRpZmlh
YmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0aGUgUHJvZ3Jh
bSwKKyMgIGFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5kZW50IGFuZCBz
ZXBhcmF0ZSB3b3JrcyBpbgorIyBAQCAtMTY4LDcgKzE2OCw3IEBACisjICBhY2Nlc3MgdG8gY29w
eSB0aGUgc291cmNlIGNvZGUgZnJvbSB0aGUgc2FtZSBwbGFjZSBjb3VudHMgYXMKKyMgIGRpc3Ry
aWJ1dGlvbiBvZiB0aGUgc291cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBhcnRpZXMgYXJl
IG5vdAorIyAgY29tcGVsbGVkIHRvIGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRoIHRoZSBvYmpl
Y3QgY29kZS4KKyMgLQwKKyMgKworIyAgICA0LiBZb3UgbWF5IG5vdCBjb3B5LCBtb2RpZnksIHN1
YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0KKyMgIGV4Y2VwdCBhcyBleHByZXNz
bHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55IGF0dGVtcHQKKyMgIG90aGVyd2lz
ZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2Ugb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbSBp
cworIyBAQCAtMjI1LDcgKzIyNSw3IEBACisjICAKKyMgIFRoaXMgc2VjdGlvbiBpcyBpbnRlbmRl
ZCB0byBtYWtlIHRob3JvdWdobHkgY2xlYXIgd2hhdCBpcyBiZWxpZXZlZCB0bworIyAgYmUgYSBj
b25zZXF1ZW5jZSBvZiB0aGUgcmVzdCBvZiB0aGlzIExpY2Vuc2UuCisjIC0MCisjICsKKyMgICAg
OC4gSWYgdGhlIGRpc3RyaWJ1dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBQcm9ncmFtIGlzIHJlc3Ry
aWN0ZWQgaW4KKyMgIGNlcnRhaW4gY291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRzIG9yIGJ5IGNv
cHlyaWdodGVkIGludGVyZmFjZXMsIHRoZQorIyAgb3JpZ2luYWwgY29weXJpZ2h0IGhvbGRlciB3
aG8gcGxhY2VzIHRoZSBQcm9ncmFtIHVuZGVyIHRoaXMgTGljZW5zZQorIyBAQCAtMjU1LDcgKzI1
NSw3IEBACisjICBvZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwgZGVyaXZhdGl2
ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kCisjICBvZiBwcm9tb3RpbmcgdGhlIHNoYXJpbmcg
YW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgIAorIyAtCQkJICAgIE5PIFdBUlJB
TlRZCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgTk8gV0FSUkFOVFkKKyMgIAorIyAg
ICAxMS4gQkVDQVVTRSBUSEUgUFJPR1JBTSBJUyBMSUNFTlNFRCBGUkVFIE9GIENIQVJHRSwgVEhF
UkUgSVMgTk8gV0FSUkFOVFkKKyMgIEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJN
SVRURUQgQlkgQVBQTElDQUJMRSBMQVcuICBFWENFUFQgV0hFTgorIyBAQCAtMjc3LDkgKzI3Nyw5
IEBACisjICBQUk9HUkFNUyksIEVWRU4gSUYgU1VDSCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFT
IEJFRU4gQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFUy4KKyMg
IAorIyAtCQkgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyAtDAorIyAtCSAgICBI
b3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgKyAgICAgICAg
ICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyArCisjICsgICAgICAg
ICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMgIAor
IyAgICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBwcm9ncmFtLCBhbmQgeW91IHdhbnQgaXQgdG8gYmUg
b2YgdGhlIGdyZWF0ZXN0CisjICBwb3NzaWJsZSB1c2UgdG8gdGhlIHB1YmxpYywgdGhlIGJlc3Qg
d2F5IHRvIGFjaGlldmUgdGhpcyBpcyB0byBtYWtlIGl0CisjIEBAIC0zMDMsMTcgKzMwMywxNiBA
QAorIyAgICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZSB0aGUKKyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgorIyAgCisjIC0gICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3aXRoIHRoaXMg
cHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtICAgIEZvdW5k
YXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjEx
MS0xMzA3ICBVU0EKKyMgLQorIyArICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisjICsgICAgd2l0aCB0aGlz
IHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwg
SW5jLiwKKyMgKyAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1B
IDAyMTEwLTEzMDEgVVNBLgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8g
Y29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAgSWYgdGhl
IHByb2dyYW0gaXMgaW50ZXJhY3RpdmUsIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQgbm90aWNlIGxp
a2UgdGhpcworIyAgd2hlbiBpdCBzdGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgIAor
IyAtICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciAgbmFtZSBv
ZiBhdXRob3IKKyMgKyAgICBHbm9tb3Zpc2lvbiB2ZXJzaW9uIDY5LCBDb3B5cmlnaHQgKEMpIHll
YXIgbmFtZSBvZiBhdXRob3IKKyMgICAgICBHbm9tb3Zpc2lvbiBjb21lcyB3aXRoIEFCU09MVVRF
TFkgTk8gV0FSUkFOVFk7IGZvciBkZXRhaWxzIHR5cGUgYHNob3cgdycuCisjICAgICAgVGhpcyBp
cyBmcmVlIHNvZnR3YXJlLCBhbmQgeW91IGFyZSB3ZWxjb21lIHRvIHJlZGlzdHJpYnV0ZSBpdAor
IyAgICAgIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9uczsgdHlwZSBgc2hvdyBjJyBmb3IgZGV0YWls
cy4KKyMgQEAgLTMzNiw1ICszMzUsNSBAQAorIyAgVGhpcyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIgcHJvZ3JhbSBpbnRvCisjICBwcm9w
cmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJvdXRpbmUgbGlicmFy
eSwgeW91IG1heQorIyAgY29uc2lkZXIgaXQgbW9yZSB1c2VmdWwgdG8gcGVybWl0IGxpbmtpbmcg
cHJvcHJpZXRhcnkgYXBwbGljYXRpb25zIHdpdGggdGhlCisjIC1saWJyYXJ5LiAgSWYgdGhpcyBp
cyB3aGF0IHlvdSB3YW50IHRvIGRvLCB1c2UgdGhlIEdOVSBMaWJyYXJ5IEdlbmVyYWwKKyMgK2xp
YnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05VIExlc3Nl
ciBHZW5lcmFsCisjICBQdWJsaWMgTGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMgTGljZW5zZS4KKyMg
CisjCisKK1NVTU1BUlkgPSAiVmVydmUgcGFuZWwgcGx1Z2luIGlzIGEgY29tZm9ydGFibGUgY29t
bWFuZCBsaW5lIHBsdWdpbiBmb3IgdGhlIFhmY2UgcGFuZWwiCitIT01FUEFHRSA9ICJodHRwOi8v
Z29vZGllcy54ZmNlLm9yZy9wcm9qZWN0cy9wYW5lbC1wbHVnaW5zL3hmY2U0LXZlcnZlLXBsdWdp
biIKK0xJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCisKK2luaGVyaXQg
eGZjZS1wYW5lbC1wbHVnaW4KKworU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxYmYxMjFmMWJmOWNm
MmExOTliZjVjMGYzYWE4MDJmNTAzZGY5YmVhNTA3MjQ3NDFlN2E5MmZlNmQ5ZmUwOWUiCitERVBF
TkRTICs9ICJsaWJwY3JlIgotLSAKMi4zOS4yCgo=

--===============1491661641590178033==--

