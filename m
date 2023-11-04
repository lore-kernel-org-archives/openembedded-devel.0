Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045F8C04A68
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5516.1699083060412012216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gn3MgplO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KNWNQDrP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e01ef-e16400bc-b17b-452b-9dc7-73227403c94d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0fZEUsMvqWF7VkxP3BGaHS71rQfU5J4RHb0uwKe4RQw=;
	b=gn3MgplOuc+ss7e2M+qDHpYX4uWbq0fi7Msy/2zsGqkCfQCELjT0iydADk6n10Iw
	1mvuW0D5m8nw78/+v/iH7zhzH+ZsSeL5zt15iAAZqpaU+Df2XkXUk0iDlDB0ds5DV8i
	ENgD1BQzU+DnEkGdQjlTODlrMWCuyVKxTNR/Q64U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0fZEUsMvqWF7VkxP3BGaHS71rQfU5J4RHb0uwKe4RQw=;
	b=KNWNQDrPWj9cqzeVBQPsU/UaVWvM6gIT4fPcFB0hdh6xEAn3hznsoprVCLAD8nFw
	cGxdUuTx2pSxgjSFtlLcybiT/+w1sN0roVZGkGTZBkwTnjo/vAQ69jMW/Lj6e5Otk6P
	dJuVhtnDJuuMGm5FOBJnK85CCSaE7ETy942VIET8=
Content-Type: multipart/mixed; boundary="===============6169007149672238884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-battery-plugin: upgrading to 1.1.5 SUCCEEDED
Message-ID: <0101018b993e01ef-e16400bc-b17b-452b-9dc7-73227403c94d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106311

--===============6169007149672238884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-battery-plugin* to *1.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xfce4-battery-plugin-upgrade-1.1.4-1.1.5.patch
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
From 1a28853c189752a2deaab06d62e3c95b06ed55dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:01:35 +0000
Subject: [PATCH] xfce4-battery-plugin: upgrade 1.1.4 -> 1.1.5

---
 .../battery/xfce4-battery-plugin_1.1.4.bb     |   8 -
 .../battery/xfce4-battery-plugin_1.1.5.bb     | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 8 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
deleted file mode 100644
index 0f8489b18..000000000
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-SRC_URI[sha256sum] = "107df2a837156c010e1eab5430bab90c77f0a3dc699b5937678c8a9c5e64c222"
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
new file mode 100644
index 000000000..447b2981c
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
@@ -0,0 +1,138 @@
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
+SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+SRC_URI[sha256sum] = "752233bfb320ee1e26104a656cbb868299f562733063e2b9a18f0966585ce213"
-- 
2.39.2


--===============6169007149672238884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xfce4-battery-plugin: SRC_URI changed from "http://archive.xfce.org/src/panel-plugins/xfce4-battery-plugin/1.1/xfce4-battery-plugin-1.1.4.tar.bz2" to "http://archive.xfce.org/src/panel-plugins/xfce4-battery-plugin/1.1/xfce4-battery-plugin-1.1.5.tar.bz2"
packages/core2-64-poky-linux/xfce4-battery-plugin: PACKAGES: added "xfce4-battery-plugin-locale-ga"
packages/core2-64-poky-linux/xfce4-battery-plugin: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-dbg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-dbg: PKGSIZE changed from 94024 to 93864 (-0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-dbg: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-dev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-dev: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-doc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-doc: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ar: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ar: PKGSIZE changed from 3823 to 3785 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ar: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ast: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ast: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-be: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-be: PKGSIZE changed from 4703 to 4562 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-be: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-bg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-bg: PKGSIZE changed from 4342 to 4217 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-bg: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ca: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ca: PKGSIZE changed from 3652 to 3549 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ca: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-cs: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-cs: PKGSIZE changed from 3781 to 3675 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-cs: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-da: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-da: PKGSIZE changed from 3540 to 3425 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-da: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-de: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-de: PKGSIZE changed from 3758 to 3650 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-de: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-el: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-el: PKGSIZE changed from 4645 to 4531 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-el: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-au: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-au: PKGSIZE changed from 3420 to 3312 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-au: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-ca: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-ca: PKGSIZE changed from 3400 to 3294 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-ca: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-gb: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-gb: PKGSIZE changed from 3311 to 3306 (-0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-en-gb: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-es: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-es: PKGSIZE changed from 3583 to 3568 (-0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-es: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-et: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-et: PKGSIZE changed from 3562 to 3463 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-et: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-eu: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-eu: PKGSIZE changed from 3468 to 3385 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-eu: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fi: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fi: PKGSIZE changed from 3531 to 3457 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fi: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fr: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fr: PKGSIZE changed from 3700 to 3684 (-0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-fr: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-gl: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-gl: PKGSIZE changed from 3651 to 3543 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-gl: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-he: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-he: PKGSIZE changed from 3896 to 3811 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-he: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hr: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hr: PKGSIZE changed from 3617 to 3516 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hr: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hu: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hu: PKGSIZE changed from 3784 to 3685 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hu: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hy-am: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hy-am: PKGSIZE changed from 4311 to 4159 (-4%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hy-am: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hye: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hye: PKGSIZE changed from 4303 to 4151 (-4%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-hye: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-id: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-id: PKGSIZE changed from 3512 to 3408 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-id: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ie: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ie: PKGSIZE changed from 3486 to 3392 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ie: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-is: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-is: PKGSIZE changed from 3700 to 3596 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-is: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-it: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-it: PKGSIZE changed from 3630 to 3584 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-it: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ja: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ja: PKGSIZE changed from 3914 to 3818 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ja: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-kk: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-kk: PKGSIZE changed from 4476 to 4375 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-kk: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ko: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ko: PKGSIZE changed from 3596 to 3493 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ko: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lt: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lt: PKGSIZE changed from 3760 to 3659 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lt: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lv: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lv: PKGSIZE changed from 3026 to 2972 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-lv: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ms: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ms: PKGSIZE changed from 3463 to 3373 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ms: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nb: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nb: PKGSIZE changed from 3453 to 3334 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nb: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nl: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nl: PKGSIZE changed from 3595 to 3488 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nl: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nn: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-nn: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-oc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-oc: PKGSIZE changed from 3512 to 3487 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-oc: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pa: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pa: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pl: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pl: PKGSIZE changed from 3832 to 3709 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pl: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt-br: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt-br: PKGSIZE changed from 3647 to 3586 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt-br: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt: PKGSIZE changed from 3515 to 3461 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-pt: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ru: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ru: PKGSIZE changed from 4582 to 4463 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ru: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sk: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sk: PKGSIZE changed from 3815 to 3719 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sk: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sl: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sl: PKGSIZE changed from 3671 to 3566 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sl: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sq: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sq: PKGSIZE changed from 3606 to 3507 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sq: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sr: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sr: PKGSIZE changed from 4538 to 4414 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sr: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sv: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sv: PKGSIZE changed from 3637 to 3531 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-sv: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-th: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-th: PKGSIZE changed from 5055 to 4937 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-th: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-tr: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-tr: PKGSIZE changed from 3483 to 3373 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-tr: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ug: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ug: PKGSIZE changed from 4228 to 4188 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ug: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uk: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uk: PKGSIZE changed from 4717 to 4617 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uk: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur-pk: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur-pk: PKGSIZE changed from 3376 to 3318 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur-pk: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur: PKGSIZE changed from 3359 to 3301 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-ur: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz+latn: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz+latn: PKGSIZE changed from 3622 to 3582 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz+latn: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz: PKGSIZE changed from 3604 to 3564 (-1%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-uz: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-vi: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-vi: PKGSIZE changed from 2977 to 2920 (-2%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-vi: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-cn: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-cn: PKGSIZE changed from 3452 to 3346 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-cn: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-tw: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-tw: PKGSIZE changed from 3386 to 3279 (-3%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-locale-zh-tw: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-src: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-src: PKGSIZE changed from 78302 to 78311 (+0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-src: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-staticdev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin-staticdev: PV changed from "1.1.4" to "1.1.5"
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin: PKGSIZE changed from 273129 to 273224 (+0%)
packages/core2-64-poky-linux/xfce4-battery-plugin/xfce4-battery-plugin: PV changed from "1.1.4" to "1.1.5"

--===============6169007149672238884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xfce4-battery-plugin: PACKAGES: added "xfce4-battery-plugin-locale-ga"

--===============6169007149672238884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-battery-plugin-upgrade-1.1.4-1.1.5.patch"

RnJvbSAxYTI4ODUzYzE4OTc1MmEyZGVhYWIwNmQ2MmUzYzk1YjA2ZWQ1NWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjowMTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWJhdHRlcnktcGx1Z2luOiB1cGdyYWRlIDEuMS40IC0+IDEuMS41CgotLS0KIC4uLi9iYXR0
ZXJ5L3hmY2U0LWJhdHRlcnktcGx1Z2luXzEuMS40LmJiICAgICB8ICAgOCAtCiAuLi4vYmF0dGVy
eS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNS5iYiAgICAgfCAxMzggKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvYmF0dGVy
eS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNC5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvYmF0dGVyeS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8x
LjEuNS5iYgoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvYmF0
dGVyeS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXBh
bmVsLXBsdWdpbnMvYmF0dGVyeS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNC5iYgpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMGY4NDg5YjE4Li4wMDAwMDAwMDAKLS0tIGEvbWV0YS14
ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9iYXR0ZXJ5L3hmY2U0LWJhdHRlcnktcGx1Z2luXzEu
MS40LmJiCisrKyAvZGV2L251bGwKQEAgLTEsOCArMCwwIEBACi1TVU1NQVJZID0gIkEgYmF0dGVy
eSBtb25pdG9yIHBhbmVsIHBsdWdpbiBmb3IgWGZjZTQsIGNvbXBhdGlibGUgd2l0aCBBUE0gYW5k
IEFDUCIKLUhPTUVQQUdFID0gImh0dHBzOi8vZ29vZGllcy54ZmNlLm9yZy9wcm9qZWN0cy9wYW5l
bC1wbHVnaW5zL3hmY2U0LWJhdHRlcnktcGx1Z2luIgotTElDRU5TRSA9ICJHUEwtMi4wLW9ubHki
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZj
YWE5YjdkZjA3OWJhZTE5ZiIKLQotaW5oZXJpdCB4ZmNlLXBhbmVsLXBsdWdpbgotCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTA3ZGYyYTgzNzE1NmMwMTBlMWVhYjU0MzBiYWI5MGM3N2YwYTNkYzY5
OWI1OTM3Njc4YzhhOWM1ZTY0YzIyMiIKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBh
bmVsLXBsdWdpbnMvYmF0dGVyeS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNS5iYiBiL21ldGEt
eGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvYmF0dGVyeS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8x
LjEuNS5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjQ0N2IyOTgxYwot
LS0gL2Rldi9udWxsCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvYmF0dGVy
eS94ZmNlNC1iYXR0ZXJ5LXBsdWdpbl8xLjEuNS5iYgpAQCAtMCwwICsxLDEzOCBAQAorIyBGSVhN
RTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0
b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJ
Q0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRo
ZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTog
J0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hh
bmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMTIgKzEsMTIg
QEAKKyMgLQkJICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjIC0JCSAgICAgICBWZXJz
aW9uIDIsIEp1bmUgMTk5MQorIyAtCisjIC0gQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtICAgICA1OSBUZW1wbGUgUGxhY2UsIFN1aXRl
IDMzMCwgQm9zdG9uLCBNQSAgMDIxMTEtMTMwNyAgVVNBCisjICsgICAgICAgICAgICAgICAgICAg
IEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICsgICAgICAgICAgICAgICAgICAgICAgIFZl
cnNpb24gMiwgSnVuZSAxOTkxCisjICsKKyMgKyBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyArIDUxIEZyYW5rbGluIFN0cmVldCwgRmlm
dGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgICBFdmVyeW9uZSBpcyBwZXJt
aXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlz
IGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAor
IyAtCQkJICAgIFByZWFtYmxlCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHJlYW1i
bGUKKyMgIAorIyAgICBUaGUgbGljZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYXJlIGRlc2lnbmVk
IHRvIHRha2UgYXdheSB5b3VyCisjICBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2UgaXQuICBC
eSBjb250cmFzdCwgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyBAQCAtMTUsNyArMTUsNyBAQAor
IyAgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIG1vc3Qgb2YgdGhlIEZyZWUgU29m
dHdhcmUKKyMgIEZvdW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8gYW55IG90aGVyIHByb2dyYW0g
d2hvc2UgYXV0aG9ycyBjb21taXQgdG8KKyMgIHVzaW5nIGl0LiAgKFNvbWUgb3RoZXIgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uIHNvZnR3YXJlIGlzIGNvdmVyZWQgYnkKKyMgLXRoZSBHTlUgTGli
cmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGluc3RlYWQuKSAgWW91IGNhbiBhcHBseSBpdCB0
bworIyArdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlv
dSBjYW4gYXBwbHkgaXQgdG8KKyMgIHlvdXIgcHJvZ3JhbXMsIHRvby4KKyMgIAorIyAgICBXaGVu
IHdlIHNwZWFrIG9mIGZyZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJpbmcgdG8gZnJlZWRvbSwg
bm90CisjIEBAIC01NSw4ICs1NSw4IEBACisjICAKKyMgICAgVGhlIHByZWNpc2UgdGVybXMgYW5k
IGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQKKyMgIG1vZGlmaWNhdGlv
biBmb2xsb3cuCisjIC0MCisjIC0JCSAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAr
CisjICsgICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAg
ICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJ
RklDQVRJT04KKyMgIAorIyAgICAwLiBUaGlzIExpY2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3Jh
bSBvciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5zCisjIEBAIC0xMTAsNyArMTEwLDcgQEAKKyMg
ICAgICBMaWNlbnNlLiAgKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGludGVy
YWN0aXZlIGJ1dAorIyAgICAgIGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5ub3Vu
Y2VtZW50LCB5b3VyIHdvcmsgYmFzZWQgb24KKyMgICAgICB0aGUgUHJvZ3JhbSBpcyBub3QgcmVx
dWlyZWQgdG8gcHJpbnQgYW4gYW5ub3VuY2VtZW50LikKKyMgLQwKKyMgKworIyAgVGhlc2UgcmVx
dWlyZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAg
aWRlbnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0
aGUgUHJvZ3JhbSwKKyMgIGFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5k
ZW50IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyBAQCAtMTY4LDcgKzE2OCw3IEBACisjICBhY2Nl
c3MgdG8gY29weSB0aGUgc291cmNlIGNvZGUgZnJvbSB0aGUgc2FtZSBwbGFjZSBjb3VudHMgYXMK
KyMgIGRpc3RyaWJ1dGlvbiBvZiB0aGUgc291cmNlIGNvZGUsIGV2ZW4gdGhvdWdoIHRoaXJkIHBh
cnRpZXMgYXJlIG5vdAorIyAgY29tcGVsbGVkIHRvIGNvcHkgdGhlIHNvdXJjZSBhbG9uZyB3aXRo
IHRoZSBvYmplY3QgY29kZS4KKyMgLQwKKyMgKworIyAgICA0LiBZb3UgbWF5IG5vdCBjb3B5LCBt
b2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0KKyMgIGV4Y2VwdCBh
cyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNlbnNlLiAgQW55IGF0dGVtcHQKKyMg
IG90aGVyd2lzZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2Ugb3IgZGlzdHJpYnV0ZSB0aGUg
UHJvZ3JhbSBpcworIyBAQCAtMjI1LDcgKzIyNSw3IEBACisjICAKKyMgIFRoaXMgc2VjdGlvbiBp
cyBpbnRlbmRlZCB0byBtYWtlIHRob3JvdWdobHkgY2xlYXIgd2hhdCBpcyBiZWxpZXZlZCB0bwor
IyAgYmUgYSBjb25zZXF1ZW5jZSBvZiB0aGUgcmVzdCBvZiB0aGlzIExpY2Vuc2UuCisjIC0MCisj
ICsKKyMgICAgOC4gSWYgdGhlIGRpc3RyaWJ1dGlvbiBhbmQvb3IgdXNlIG9mIHRoZSBQcm9ncmFt
IGlzIHJlc3RyaWN0ZWQgaW4KKyMgIGNlcnRhaW4gY291bnRyaWVzIGVpdGhlciBieSBwYXRlbnRz
IG9yIGJ5IGNvcHlyaWdodGVkIGludGVyZmFjZXMsIHRoZQorIyAgb3JpZ2luYWwgY29weXJpZ2h0
IGhvbGRlciB3aG8gcGxhY2VzIHRoZSBQcm9ncmFtIHVuZGVyIHRoaXMgTGljZW5zZQorIyBAQCAt
MjU1LDcgKzI1NSw3IEBACisjICBvZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwg
ZGVyaXZhdGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kCisjICBvZiBwcm9tb3RpbmcgdGhl
IHNoYXJpbmcgYW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgIAorIyAtCQkJICAg
IE5PIFdBUlJBTlRZCisjICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgTk8gV0FSUkFOVFkK
KyMgIAorIyAgICAxMS4gQkVDQVVTRSBUSEUgUFJPR1JBTSBJUyBMSUNFTlNFRCBGUkVFIE9GIENI
QVJHRSwgVEhFUkUgSVMgTk8gV0FSUkFOVFkKKyMgIEZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVY
VEVOVCBQRVJNSVRURUQgQlkgQVBQTElDQUJMRSBMQVcuICBFWENFUFQgV0hFTgorIyBAQCAtMjc3
LDkgKzI3Nyw5IEBACisjICBQUk9HUkFNUyksIEVWRU4gSUYgU1VDSCBIT0xERVIgT1IgT1RIRVIg
UEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUKKyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFN
QUdFUy4KKyMgIAorIyAtCQkgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyAtDAor
IyAtCSAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3JhbXMKKyMg
KyAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyArCisj
ICsgICAgICAgICAgICBIb3cgdG8gQXBwbHkgVGhlc2UgVGVybXMgdG8gWW91ciBOZXcgUHJvZ3Jh
bXMKKyMgIAorIyAgICBJZiB5b3UgZGV2ZWxvcCBhIG5ldyBwcm9ncmFtLCBhbmQgeW91IHdhbnQg
aXQgdG8gYmUgb2YgdGhlIGdyZWF0ZXN0CisjICBwb3NzaWJsZSB1c2UgdG8gdGhlIHB1YmxpYywg
dGhlIGJlc3Qgd2F5IHRvIGFjaGlldmUgdGhpcyBpcyB0byBtYWtlIGl0CisjIEBAIC0zMDMsMTcg
KzMwMywxNiBAQAorIyAgICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjIC0gICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyMgLSAgICBhbG9uZyB3
aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyAt
ICAgIEZvdW5kYXRpb24sIEluYy4sIDU5IFRlbXBsZSBQbGFjZSwgU3VpdGUgMzMwLCBCb3N0b24s
IE1BICAwMjExMS0xMzA3ICBVU0EKKyMgLQorIyArICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisjICsgICAg
d2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLiwKKyMgKyAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBC
b3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBv
biBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAor
IyAgSWYgdGhlIHByb2dyYW0gaXMgaW50ZXJhY3RpdmUsIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQg
bm90aWNlIGxpa2UgdGhpcworIyAgd2hlbiBpdCBzdGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9k
ZToKKyMgIAorIyAtICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVh
ciAgbmFtZSBvZiBhdXRob3IKKyMgKyAgICBHbm9tb3Zpc2lvbiB2ZXJzaW9uIDY5LCBDb3B5cmln
aHQgKEMpIHllYXIgbmFtZSBvZiBhdXRob3IKKyMgICAgICBHbm9tb3Zpc2lvbiBjb21lcyB3aXRo
IEFCU09MVVRFTFkgTk8gV0FSUkFOVFk7IGZvciBkZXRhaWxzIHR5cGUgYHNob3cgdycuCisjICAg
ICAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBhbmQgeW91IGFyZSB3ZWxjb21lIHRvIHJlZGlzdHJp
YnV0ZSBpdAorIyAgICAgIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9uczsgdHlwZSBgc2hvdyBjJyBm
b3IgZGV0YWlscy4KKyMgQEAgLTMzNiw1ICszMzUsNSBAQAorIyAgVGhpcyBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIgcHJvZ3JhbSBpbnRv
CisjICBwcm9wcmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBpcyBhIHN1YnJvdXRp
bmUgbGlicmFyeSwgeW91IG1heQorIyAgY29uc2lkZXIgaXQgbW9yZSB1c2VmdWwgdG8gcGVybWl0
IGxpbmtpbmcgcHJvcHJpZXRhcnkgYXBwbGljYXRpb25zIHdpdGggdGhlCisjIC1saWJyYXJ5LiAg
SWYgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRvIGRvLCB1c2UgdGhlIEdOVSBMaWJyYXJ5IEdlbmVy
YWwKKyMgK2xpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUg
R05VIExlc3NlciBHZW5lcmFsCisjICBQdWJsaWMgTGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMgTGlj
ZW5zZS4KKyMgCisjCisKK1NVTU1BUlkgPSAiQSBiYXR0ZXJ5IG1vbml0b3IgcGFuZWwgcGx1Z2lu
IGZvciBYZmNlNCwgY29tcGF0aWJsZSB3aXRoIEFQTSBhbmQgQUNQIgorSE9NRVBBR0UgPSAiaHR0
cHM6Ly9nb29kaWVzLnhmY2Uub3JnL3Byb2plY3RzL3BhbmVsLXBsdWdpbnMveGZjZTQtYmF0dGVy
eS1wbHVnaW4iCitMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgorCitp
bmhlcml0IHhmY2UtcGFuZWwtcGx1Z2luCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NTIyMzNi
ZmIzMjBlZTFlMjYxMDRhNjU2Y2JiODY4Mjk5ZjU2MjczMzA2M2UyYjlhMThmMDk2NjU4NWNlMjEz
IgotLSAKMi4zOS4yCgo=

--===============6169007149672238884==--

