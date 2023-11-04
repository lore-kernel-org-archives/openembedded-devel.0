Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA03C072A0
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5534.1699083061165704582
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=It9ETU6m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qUPXwJqb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b993e0539-a2bb9b62-5109-4a3a-bbec-e6c1013bdb0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QREIoktH/l813QSkU7MBaNfuFdVICB19QG9TsXZcGU0=;
	b=It9ETU6m1uBf7NiWNOSkYjp46Z1/3DzUDAhN26fmPNLlpxhQ6Ye1O5Azcn3jY1Bd
	AcASQA+ychenc7C/dSxIbHQDzU1y/W6YCqasNe0LBuMXCOa00ucIT/2P5nRTIVEYayK
	ShJCo+QuV1i2W6NBYP/LfB/E0LUwQ9ctbSJIHn8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QREIoktH/l813QSkU7MBaNfuFdVICB19QG9TsXZcGU0=;
	b=qUPXwJqbshOkgyrgKZsEcLnNbjF8l4o40zzEB2ofEdFyIe49MfMuuRw4xTcswHFv
	pmNzrzoMufb0DceNvsFVvraRMpUx/5hKRBspsgoBpWujbOY2SneL0Sk0J9yMPttQf07
	msJYdGWFX6TjX/aQKBSFp6vXo58U9s6wqDkK3WKc=
Content-Type: multipart/mixed; boundary="===============1057622317953219057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-timer-plugin: upgrading to 1.7.2 SUCCEEDED
Message-ID: <0101018b993e0539-a2bb9b62-5109-4a3a-bbec-e6c1013bdb0f-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106342

--===============1057622317953219057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-timer-plugin* to *1.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-timer-plugin-upgrade-1.7.1-1.7.2.patch
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
From 75e9ec13326180095526642daab18c1f2819b6ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:08:18 +0000
Subject: [PATCH] xfce4-timer-plugin: upgrade 1.7.1 -> 1.7.2

---
 .../timer/xfce4-timer-plugin_1.7.1.bb         |  10 --
 .../timer/xfce4-timer-plugin_1.7.2.bb         | 141 ++++++++++++++++++
 2 files changed, 141 insertions(+), 10 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
deleted file mode 100644
index 1231e084c..000000000
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "XFCE panel plugin to generate alarm messages"
-DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
-
-inherit xfce-panel-plugin
-
-SRC_URI[md5sum] = "e0df5b6be30993719d084fc4f78a6218"
-SRC_URI[sha256sum] = "4b52d2911b1949e945971be6533155ee6ba99c77078eac7fd43b0f2aeca824e3"
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
new file mode 100644
index 000000000..a491d755c
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
@@ -0,0 +1,141 @@
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
+# @@ -1,14 +1,14 @@
+#  Copyright (C) 2005 Kemal Ilgar Eroglu <kieroglu@math.washington.edu>
+#  
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
+# @@ -17,7 +17,7 @@
+#  General Public License applies to most of the Free Software
+#  Foundation's software and to any other program whose authors commit to
+#  using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Library General Public License instead.)  You can apply it to
+# +the GNU Lesser General Public License instead.)  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+# @@ -57,8 +57,8 @@
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
+# @@ -112,7 +112,7 @@
+#      License.  (Exception: if the Program itself is interactive but
+#      does not normally print such an announcement, your work based on
+#      the Program is not required to print an announcement.)
+# -
+# +
+#  These requirements apply to the modified work as a whole.  If
+#  identifiable sections of that work are not derived from the Program,
+#  and can be reasonably considered independent and separate works in
+# @@ -170,7 +170,7 @@
+#  access to copy the source code from the same place counts as
+#  distribution of the source code, even though third parties are not
+#  compelled to copy the source along with the object code.
+# -
+# +
+#    4. You may not copy, modify, sublicense, or distribute the Program
+#  except as expressly provided under this License.  Any attempt
+#  otherwise to copy, modify, sublicense or distribute the Program is
+# @@ -227,7 +227,7 @@
+#  
+#  This section is intended to make thoroughly clear what is believed to
+#  be a consequence of the rest of this License.
+# -
+# +
+#    8. If the distribution and/or use of the Program is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+#  original copyright holder who places the Program under this License
+# @@ -257,7 +257,7 @@
+#  of preserving the free status of all derivatives of our free software and
+#  of promoting the sharing and reuse of software generally.
+#  
+# -			    NO WARRANTY
+# +                            NO WARRANTY
+#  
+#    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+#  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# @@ -279,9 +279,9 @@
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
+# @@ -305,17 +305,16 @@
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
+# @@ -338,5 +337,5 @@
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+#  consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Library General
+# +library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.
+# 
+#
+
+SUMMARY = "XFCE panel plugin to generate alarm messages"
+DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1c52159bdaebd029cb11927cbe709e4"
+
+inherit xfce-panel-plugin
+
+SRC_URI[sha256sum] = "feb3b8c2d39505e816683540a3226bd7bda870ccbcb4c7d0f6abfeeff5c58b7d"
-- 
2.39.2


--===============1057622317953219057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-timer-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-timer-plugin/1.7/xfce4-timer-plugin-1.7.1.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-timer-plugin/1.7/xfce4-timer-plugin-1.7.2.tar.bz2"
packages/core2-64-poky-linux/xfce4-timer-plugin: PACKAGES: added "xfce4-timer-plugin-locale-et xfce4-timer-plugin-locale-ie xfce4-timer-plugin-locale-fa-ir"
packages/core2-64-poky-linux/xfce4-timer-plugin: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-dbg: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-dbg: PKGSIZE changed from 86368 to 87880 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-dbg: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-dev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-dev: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-doc: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-doc: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ar: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ar: PKGSIZE changed from 3036 to 2880 (-5%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ar: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ast: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ast: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-be: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-be: PKGSIZE changed from 4001 to 3761 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-be: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-bg: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-bg: PKGSIZE changed from 4028 to 4078 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-bg: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ca: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ca: PKGSIZE changed from 3392 to 3193 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ca: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-cs: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-cs: PKGSIZE changed from 3374 to 3177 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-cs: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-da: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-da: PKGSIZE changed from 3122 to 3101 (-1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-da: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-de: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-de: PKGSIZE changed from 3364 to 3402 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-de: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-el: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-el: PKGSIZE changed from 4128 to 4213 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-el: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-au: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-au: PKGSIZE changed from 3059 to 2878 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-au: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-gb: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-gb: PKGSIZE changed from 2579 to 2563 (-1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-en-gb: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-es: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-es: PKGSIZE changed from 3355 to 3362 (+0%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-es: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-eu: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-eu: PKGSIZE changed from 2007 to 2974 (+48%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-eu: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fi: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fi: PKGSIZE changed from 3231 to 3026 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fi: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fr: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fr: PKGSIZE changed from 3405 to 3483 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-fr: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-gl: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-gl: PKGSIZE changed from 3283 to 3086 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-gl: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-he: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-he: PKGSIZE changed from 3607 to 3659 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-he: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hr: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hr: PKGSIZE changed from 3322 to 3114 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hr: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hu: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hu: PKGSIZE changed from 3463 to 3234 (-7%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hu: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hye: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hye: PKGSIZE changed from 3967 to 3727 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-hye: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-id: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-id: PKGSIZE changed from 3146 to 3205 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-id: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-is: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-is: PKGSIZE changed from 3393 to 3197 (-6%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-is: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-it: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-it: PKGSIZE changed from 3487 to 3523 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-it: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ja: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ja: PKGSIZE changed from 3512 to 3538 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ja: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ko: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ko: PKGSIZE changed from 3224 to 3273 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ko: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-lt: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-lt: PKGSIZE changed from 3416 to 3511 (+3%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-lt: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-lv: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-lv: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ms: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ms: PKGSIZE changed from 3131 to 3110 (-1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ms: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nb: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nb: PKGSIZE changed from 3176 to 3184 (+0%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nb: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nl: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nl: PKGSIZE changed from 3203 to 3251 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-nl: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-oc: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-oc: PKGSIZE changed from 2842 to 2994 (+5%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-oc: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pl: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pl: PKGSIZE changed from 3285 to 3327 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pl: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt-br: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt-br: PKGSIZE changed from 3341 to 3380 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt-br: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt: PKGSIZE changed from 3185 to 3312 (+4%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-pt: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ru: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ru: PKGSIZE changed from 4072 to 4081 (+0%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ru: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sk: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sk: PKGSIZE changed from 3307 to 3343 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sk: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sl: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sl: PKGSIZE changed from 3229 to 3258 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sl: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sq: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sq: PKGSIZE changed from 3229 to 3286 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sq: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sr: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sr: PKGSIZE changed from 4125 to 4169 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sr: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sv: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sv: PKGSIZE changed from 3195 to 3217 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-sv: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-th: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-th: PKGSIZE changed from 4564 to 4246 (-7%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-th: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-tr: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-tr: PKGSIZE changed from 3269 to 3319 (+2%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-tr: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ug: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ug: PKGSIZE changed from 2136 to 2143 (+0%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ug: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-uk: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-uk: PKGSIZE changed from 4177 to 4188 (+0%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-uk: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ur-pk: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ur-pk: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ur: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-ur: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-cn: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-cn: PKGSIZE changed from 3116 to 3156 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-cn: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-tw: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-tw: PKGSIZE changed from 3090 to 3130 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-zh-tw: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-src: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-src: PKGSIZE changed from 58313 to 63331 (+9%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-src: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-staticdev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-staticdev: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin: PKGSIZE changed from 55680 to 55961 (+1%)
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin: PV changed from "1.7.1" to "1.7.2"

--===============1057622317953219057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-timer-plugin: PACKAGES: added "xfce4-timer-plugin-locale-ie xfce4-timer-plugin-locale-fa-ir xfce4-timer-plugin-locale-et"
packages/core2-64-poky-linux/xfce4-timer-plugin/xfce4-timer-plugin-locale-eu: PKGSIZE changed from 2007 to 2974 (+48%)

--===============1057622317953219057==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-timer-plugin-upgrade-1.7.1-1.7.2.patch"

RnJvbSA3NWU5ZWMxMzMyNjE4MDA5NTUyNjY0MmRhYWIxOGMxZjI4MTliNmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzowODoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXRpbWVyLXBsdWdpbjogdXBncmFkZSAxLjcuMSAtPiAxLjcuMgoKLS0tCiAuLi4vdGltZXIv
eGZjZTQtdGltZXItcGx1Z2luXzEuNy4xLmJiICAgICAgICAgfCAgMTAgLS0KIC4uLi90aW1lci94
ZmNlNC10aW1lci1wbHVnaW5fMS43LjIuYmIgICAgICAgICB8IDE0MSArKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvdGltZXIv
eGZjZTQtdGltZXItcGx1Z2luXzEuNy4xLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS14ZmNl
L3JlY2lwZXMtcGFuZWwtcGx1Z2lucy90aW1lci94ZmNlNC10aW1lci1wbHVnaW5fMS43LjIuYmIK
CmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3RpbWVyL3hmY2U0
LXRpbWVyLXBsdWdpbl8xLjcuMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMv
dGltZXIveGZjZTQtdGltZXItcGx1Z2luXzEuNy4xLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAxMjMxZTA4NGMuLjAwMDAwMDAwMAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5l
bC1wbHVnaW5zL3RpbWVyL3hmY2U0LXRpbWVyLXBsdWdpbl8xLjcuMS5iYgorKysgL2Rldi9udWxs
CkBAIC0xLDEwICswLDAgQEAKLVNVTU1BUlkgPSAiWEZDRSBwYW5lbCBwbHVnaW4gdG8gZ2VuZXJh
dGUgYWxhcm0gbWVzc2FnZXMiCi1ERVNDUklQVElPTiA9ICJUaGlzIGlzIGEgc2ltcGxlIHBsdWdp
biB0aGF0IGxldHMgdGhlIHVzZXIgcnVuIGFuIGFsYXJtIGF0IGEgc3BlY2lmaWVkIHRpbWUgb3Ig
YXQgdGhlIGVuZCBvZiBhIHNwZWNpZmllZCBjb3VudGRvd24gcGVyaW9kIgotSE9NRVBBR0UgPSAi
aHR0cDovL2dvb2RpZXMueGZjZS5vcmcvcHJvamVjdHMvcGFuZWwtcGx1Z2lucy94ZmNlNC10aW1l
ci1wbHVnaW4iCi1MSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWFlMzkyNzEyNjdmZDYzZWI3NjE5NDMyZmYyNGU3ZmYxIgotCi1p
bmhlcml0IHhmY2UtcGFuZWwtcGx1Z2luCi0KLVNSQ19VUklbbWQ1c3VtXSA9ICJlMGRmNWI2YmUz
MDk5MzcxOWQwODRmYzRmNzhhNjIxOCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0YjUyZDI5MTFi
MTk0OWU5NDU5NzFiZTY1MzMxNTVlZTZiYTk5Yzc3MDc4ZWFjN2ZkNDNiMGYyYWVjYTgyNGUzIgpk
aWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy90aW1lci94ZmNlNC10
aW1lci1wbHVnaW5fMS43LjIuYmIgYi9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3Rp
bWVyL3hmY2U0LXRpbWVyLXBsdWdpbl8xLjcuMi5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAuLmE0OTFkNzU1YwotLS0gL2Rldi9udWxsCisrKyBiL21ldGEteGZjZS9yZWNp
cGVzLXBhbmVsLXBsdWdpbnMvdGltZXIveGZjZTQtdGltZXItcGx1Z2luXzEuNy4yLmJiCkBAIC0w
LDAgKzEsMTQxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlO
RworIyBAQCAtMSwxNCArMSwxNCBAQAorIyAgQ29weXJpZ2h0IChDKSAyMDA1IEtlbWFsIElsZ2Fy
IEVyb2dsdSA8a2llcm9nbHVAbWF0aC53YXNoaW5ndG9uLmVkdT4KKyMgIAorIyAtCQkgICAgR05V
IEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgLQkJICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkx
CisjIC0KKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCisjIC0gICAgIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24sIE1B
ICAwMjExMS0xMzA3ICBVU0EKKyMgKyAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVC
TElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5
OTEKKyMgKworIyArIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4sCisjICsgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9u
LCBNQSAwMjExMC0xMzAxIFVTQQorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFu
ZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVu
dCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIC0JCQkgICAgUHJlYW1i
bGUKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBQcmVhbWJsZQorIyAgCisjICAgIFRo
ZSBsaWNlbnNlcyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWduZWQgdG8gdGFrZSBhd2F5IHlv
dXIKKyMgIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4gIEJ5IGNvbnRyYXN0LCB0aGUg
R05VIEdlbmVyYWwgUHVibGljCisjIEBAIC0xNyw3ICsxNyw3IEBACisjICBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBvZiB0aGUgRnJlZSBTb2Z0d2FyZQorIyAgRm91bmRh
dGlvbidzIHNvZnR3YXJlIGFuZCB0byBhbnkgb3RoZXIgcHJvZ3JhbSB3aG9zZSBhdXRob3JzIGNv
bW1pdCB0bworIyAgdXNpbmcgaXQuICAoU29tZSBvdGhlciBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24gc29mdHdhcmUgaXMgY292ZXJlZCBieQorIyAtdGhlIEdOVSBMaWJyYXJ5IEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2FuIGFwcGx5IGl0IHRvCisjICt0aGUgR05VIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0
bworIyAgeW91ciBwcm9ncmFtcywgdG9vLgorIyAgCisjICAgIFdoZW4gd2Ugc3BlYWsgb2YgZnJl
ZSBzb2Z0d2FyZSwgd2UgYXJlIHJlZmVycmluZyB0byBmcmVlZG9tLCBub3QKKyMgQEAgLTU3LDgg
KzU3LDggQEAKKyMgIAorIyAgICBUaGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3Ig
Y29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAgbW9kaWZpY2F0aW9uIGZvbGxvdy4KKyMgLQwK
KyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICsKKyMgKyAgICAgICAgICAg
ICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgIFRFUk1TIEFORCBDT05E
SVRJT05TIEZPUiBDT1BZSU5HLCBESVNUUklCVVRJT04gQU5EIE1PRElGSUNBVElPTgorIyAgCisj
ICAgIDAuIFRoaXMgTGljZW5zZSBhcHBsaWVzIHRvIGFueSBwcm9ncmFtIG9yIG90aGVyIHdvcmsg
d2hpY2ggY29udGFpbnMKKyMgQEAgLTExMiw3ICsxMTIsNyBAQAorIyAgICAgIExpY2Vuc2UuICAo
RXhjZXB0aW9uOiBpZiB0aGUgUHJvZ3JhbSBpdHNlbGYgaXMgaW50ZXJhY3RpdmUgYnV0CisjICAg
ICAgZG9lcyBub3Qgbm9ybWFsbHkgcHJpbnQgc3VjaCBhbiBhbm5vdW5jZW1lbnQsIHlvdXIgd29y
ayBiYXNlZCBvbgorIyAgICAgIHRoZSBQcm9ncmFtIGlzIG5vdCByZXF1aXJlZCB0byBwcmludCBh
biBhbm5vdW5jZW1lbnQuKQorIyAtDAorIyArCisjICBUaGVzZSByZXF1aXJlbWVudHMgYXBwbHkg
dG8gdGhlIG1vZGlmaWVkIHdvcmsgYXMgYSB3aG9sZS4gIElmCisjICBpZGVudGlmaWFibGUgc2Vj
dGlvbnMgb2YgdGhhdCB3b3JrIGFyZSBub3QgZGVyaXZlZCBmcm9tIHRoZSBQcm9ncmFtLAorIyAg
YW5kIGNhbiBiZSByZWFzb25hYmx5IGNvbnNpZGVyZWQgaW5kZXBlbmRlbnQgYW5kIHNlcGFyYXRl
IHdvcmtzIGluCisjIEBAIC0xNzAsNyArMTcwLDcgQEAKKyMgIGFjY2VzcyB0byBjb3B5IHRoZSBz
b3VyY2UgY29kZSBmcm9tIHRoZSBzYW1lIHBsYWNlIGNvdW50cyBhcworIyAgZGlzdHJpYnV0aW9u
IG9mIHRoZSBzb3VyY2UgY29kZSwgZXZlbiB0aG91Z2ggdGhpcmQgcGFydGllcyBhcmUgbm90Cisj
ICBjb21wZWxsZWQgdG8gY29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2Rl
LgorIyAtDAorIyArCisjICAgIDQuIFlvdSBtYXkgbm90IGNvcHksIG1vZGlmeSwgc3VibGljZW5z
ZSwgb3IgZGlzdHJpYnV0ZSB0aGUgUHJvZ3JhbQorIyAgZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92
aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkgYXR0ZW1wdAorIyAgb3RoZXJ3aXNlIHRvIGNv
cHksIG1vZGlmeSwgc3VibGljZW5zZSBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtIGlzCisjIEBA
IC0yMjcsNyArMjI3LDcgQEAKKyMgIAorIyAgVGhpcyBzZWN0aW9uIGlzIGludGVuZGVkIHRvIG1h
a2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisjICBiZSBhIGNvbnNlcXVl
bmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgLQwKKyMgKworIyAgICA4LiBJZiB0
aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIFByb2dyYW0gaXMgcmVzdHJpY3RlZCBp
bgorIyAgY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5IHBhdGVudHMgb3IgYnkgY29weXJpZ2h0
ZWQgaW50ZXJmYWNlcywgdGhlCisjICBvcmlnaW5hbCBjb3B5cmlnaHQgaG9sZGVyIHdobyBwbGFj
ZXMgdGhlIFByb2dyYW0gdW5kZXIgdGhpcyBMaWNlbnNlCisjIEBAIC0yNTcsNyArMjU3LDcgQEAK
KyMgIG9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzIG9mIGFsbCBkZXJpdmF0aXZlcyBvZiBv
dXIgZnJlZSBzb2Z0d2FyZSBhbmQKKyMgIG9mIHByb21vdGluZyB0aGUgc2hhcmluZyBhbmQgcmV1
c2Ugb2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAgCisjIC0JCQkgICAgTk8gV0FSUkFOVFkKKyMg
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBOTyBXQVJSQU5UWQorIyAgCisjICAgIDExLiBC
RUNBVVNFIFRIRSBQUk9HUkFNIElTIExJQ0VOU0VEIEZSRUUgT0YgQ0hBUkdFLCBUSEVSRSBJUyBO
TyBXQVJSQU5UWQorIyAgRk9SIFRIRSBQUk9HUkFNLCBUTyBUSEUgRVhURU5UIFBFUk1JVFRFRCBC
WSBBUFBMSUNBQkxFIExBVy4gIEVYQ0VQVCBXSEVOCisjIEBAIC0yNzksOSArMjc5LDkgQEAKKyMg
IFBST0dSQU1TKSwgRVZFTiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBB
RFZJU0VEIE9GIFRIRQorIyAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0VTLgorIyAgCisjIC0J
CSAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjIC0MCisjIC0JICAgIEhvdyB0byBB
cHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9ncmFtcworIyArICAgICAgICAgICAgICAg
ICAgICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCisjICsKKyMgKyAgICAgICAgICAgIEhv
dyB0byBBcHBseSBUaGVzZSBUZXJtcyB0byBZb3VyIE5ldyBQcm9ncmFtcworIyAgCisjICAgIElm
IHlvdSBkZXZlbG9wIGEgbmV3IHByb2dyYW0sIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUg
Z3JlYXRlc3QKKyMgIHBvc3NpYmxlIHVzZSB0byB0aGUgcHVibGljLCB0aGUgYmVzdCB3YXkgdG8g
YWNoaWV2ZSB0aGlzIGlzIHRvIG1ha2UgaXQKKyMgQEAgLTMwNSwxNyArMzA1LDE2IEBACisjICAg
ICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlIHRoZQorIyAgICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisjICAKKyMgLSAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAtICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFt
OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlCisjIC0gICAgRm91bmRhdGlvbiwg
SW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgIDAyMTExLTEzMDcg
IFVTQQorIyAtCisjICsgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcKKyMgKyAgICB3aXRoIHRoaXMgcHJvZ3Jh
bTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAor
IyArICAgIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAt
MTMwMSBVU0EuCisjICAKKyMgIEFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0
IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyAgCisjICBJZiB0aGUgcHJvZ3Jh
bSBpcyBpbnRlcmFjdGl2ZSwgbWFrZSBpdCBvdXRwdXQgYSBzaG9ydCBub3RpY2UgbGlrZSB0aGlz
CisjICB3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRlcmFjdGl2ZSBtb2RlOgorIyAgCisjIC0gICAg
R25vbW92aXNpb24gdmVyc2lvbiA2OSwgQ29weXJpZ2h0IChDKSB5ZWFyICBuYW1lIG9mIGF1dGhv
cgorIyArICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciBuYW1l
IG9mIGF1dGhvcgorIyAgICAgIEdub21vdmlzaW9uIGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBX
QVJSQU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3Jy4KKyMgICAgICBUaGlzIGlzIGZyZWUg
c29mdHdhcmUsIGFuZCB5b3UgYXJlIHdlbGNvbWUgdG8gcmVkaXN0cmlidXRlIGl0CisjICAgICAg
dW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyB0eXBlIGBzaG93IGMnIGZvciBkZXRhaWxzLgorIyBA
QCAtMzM4LDUgKzMzNyw1IEBACisjICBUaGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBu
b3QgcGVybWl0IGluY29ycG9yYXRpbmcgeW91ciBwcm9ncmFtIGludG8KKyMgIHByb3ByaWV0YXJ5
IHByb2dyYW1zLiAgSWYgeW91ciBwcm9ncmFtIGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3Ug
bWF5CisjICBjb25zaWRlciBpdCBtb3JlIHVzZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmll
dGFyeSBhcHBsaWNhdGlvbnMgd2l0aCB0aGUKKyMgLWxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQg
eW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05VIExpYnJhcnkgR2VuZXJhbAorIyArbGlicmFyeS4g
IElmIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBkbywgdXNlIHRoZSBHTlUgTGVzc2VyIEdlbmVy
YWwKKyMgIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQgb2YgdGhpcyBMaWNlbnNlLgorIyAKKyMKKwor
U1VNTUFSWSA9ICJYRkNFIHBhbmVsIHBsdWdpbiB0byBnZW5lcmF0ZSBhbGFybSBtZXNzYWdlcyIK
K0RFU0NSSVBUSU9OID0gIlRoaXMgaXMgYSBzaW1wbGUgcGx1Z2luIHRoYXQgbGV0cyB0aGUgdXNl
ciBydW4gYW4gYWxhcm0gYXQgYSBzcGVjaWZpZWQgdGltZSBvciBhdCB0aGUgZW5kIG9mIGEgc3Bl
Y2lmaWVkIGNvdW50ZG93biBwZXJpb2QiCitIT01FUEFHRSA9ICJodHRwOi8vZ29vZGllcy54ZmNl
Lm9yZy9wcm9qZWN0cy9wYW5lbC1wbHVnaW5zL3hmY2U0LXRpbWVyLXBsdWdpbiIKK0xJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZjFjNTIxNTliZGFlYmQwMjljYjExOTI3Y2JlNzA5ZTQiCisKK2luaGVyaXQgeGZjZS1wYW5lbC1w
bHVnaW4KKworU1JDX1VSSVtzaGEyNTZzdW1dID0gImZlYjNiOGMyZDM5NTA1ZTgxNjY4MzU0MGEz
MjI2YmQ3YmRhODcwY2NiY2I0YzdkMGY2YWJmZWVmZjVjNThiN2QiCi0tIAoyLjM5LjIKCg==

--===============1057622317953219057==--

