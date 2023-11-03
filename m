Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA54C001B2
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63870.1699041166116860266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KQjDuMJ2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y0gVoC1M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bec8e2-12f77cbe-ce46-442d-9d4f-c07f9adcaea3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jBl61eWQNeww1L9419XaXV/pTwLKtoxvHAIK1wz1/gU=;
	b=KQjDuMJ2WcgCcxBiKYYd7tT23aaIVgsm/Aml6AWmHj8aTWWy+9uzE3Uonm9CgrKy
	m5u42Ws7m0RzudLB6rdSxIHdEwxuKxJirEGH61aWJhF9x6IrwCXon89RKk/yjvJAxGa
	7aA/W71Wk6EJN6ryJT+TT8nY7liWdhYJI1D1VY3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jBl61eWQNeww1L9419XaXV/pTwLKtoxvHAIK1wz1/gU=;
	b=Y0gVoC1MJ8x84XrxpFtrwGGOUr7fF8xlm7Ph2reyigKCupTD3kduJuhE1NYVaAFI
	FlvcK4T3pZuXtMH0URr3HEd4nqoK2Otguv6UnHObwW0gwCqUpVxdqJE4Pcxi2oOiUCE
	mmJp3apgB959Om8K9ayVJFTg0A5wYK4RvABVMTic=
Content-Type: multipart/mixed; boundary="===============3618503412479908920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gtkmm: upgrading to 4.13.1 FAILED
Message-ID: <0101018b96bec8e2-12f77cbe-ce46-442d-9d4f-c07f9adcaea3-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105935

--===============3618503412479908920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtkmm* to *4.13.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtkmm-upgrade-2.24.5-4.13.1.patch
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
From 2aadfeb592f42a90c63634bdac3cf94beed3f04c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:03:53 +0000
Subject: [PATCH] gtkmm: upgrade 2.24.5 -> 4.13.1

---
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb |  20 --
 meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb | 240 +++++++++++++++++++++
 2 files changed, 240 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
deleted file mode 100644
index 54e75a20d..000000000
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "C++ bindings for the GTK+ toolkit"
-HOMEPAGE = "http://www.gtkmm.org/"
-SECTION = "libs"
-
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
-
-inherit gnomebase features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "6c59ae8bbff48fad9132f23af347acf1"
-SRC_URI[archive.sha256sum] = "0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72"
-
-EXTRA_OECONF = " --disable-documentation "
-
-FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb
new file mode 100644
index 000000000..7aed23553
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb
@@ -0,0 +1,240 @@
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
+# @@ -1,9 +1,8 @@
+# -
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# -     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# + 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -23,8 +22,7 @@
+#  Free Software Foundation and other authors who decide to use it.  You
+#  can use it too, but we suggest you first think carefully about whether
+#  this license or the ordinary General Public License is the better
+# -strategy to use in any particular case, based on the explanations
+# -below.
+# +strategy to use in any particular case, based on the explanations below.
+#  
+#    When we speak of free software, we are referring to freedom of use,
+#  not price.  Our General Public Licenses are designed to make sure that
+# @@ -57,7 +55,7 @@
+#  that what they have is not the original version, so that the original
+#  author's reputation will not be affected by problems that might be
+#  introduced by others.
+# -^L
+# +
+#    Finally, software patents pose a constant threat to the existence of
+#  any free program.  We wish to make sure that a company cannot
+#  effectively restrict the users of a free program by obtaining a
+# @@ -89,8 +87,7 @@
+#  special circumstances.
+#  
+#    For example, on rare occasions, there may be a special need to
+# -encourage the widest possible use of a certain library, so that it
+# -becomes
+# +encourage the widest possible use of a certain library, so that it becomes
+#  a de-facto standard.  To achieve this, non-free programs must be
+#  allowed to use the library.  A more frequent case is that a free
+#  library does the same job as widely used non-free libraries.  In this
+# @@ -114,7 +111,7 @@
+#  "work based on the library" and a "work that uses the library".  The
+#  former contains code derived from the library, whereas the latter must
+#  be combined with the library in order to run.
+# -^L
+# +
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+#  
+# @@ -139,8 +136,7 @@
+#    "Source code" for a work means the preferred form of the work for
+#  making modifications to it.  For a library, complete source code means
+#  all the source code for all modules it contains, plus any associated
+# -interface definition files, plus the scripts used to control
+# -compilation
+# +interface definition files, plus the scripts used to control compilation
+#  and installation of the library.
+#  
+#    Activities other than copying, distribution and modification are not
+# @@ -220,7 +216,7 @@
+#  ordinary GNU General Public License has appeared, then you can specify
+#  that version instead if you wish.)  Do not make any other change in
+#  these notices.
+# -^L
+# +
+#    Once this change is made in a given copy, it is irreversible for
+#  that copy, so the ordinary GNU General Public License applies to all
+#  subsequent copies and derivative works made from that copy.
+# @@ -271,7 +267,7 @@
+#  distribute the object code for the work under the terms of Section 6.
+#  Any executables containing that work also fall under Section 6,
+#  whether or not they are linked directly with the Library itself.
+# -^L
+# +
+#    6. As an exception to the Sections above, you may also combine or
+#  link a "work that uses the Library" with the Library to produce a
+#  work containing portions of the Library, and distribute that work
+# @@ -333,7 +329,7 @@
+#  accompany the operating system.  Such a contradiction means you cannot
+#  use both them and the Library together in an executable that you
+#  distribute.
+# -^L
+# +
+#    7. You may place library facilities that are a work based on the
+#  Library side-by-side in a single library together with other library
+#  facilities not covered by this License, and distribute such a combined
+# @@ -374,7 +370,7 @@
+#  restrictions on the recipients' exercise of the rights granted herein.
+#  You are not responsible for enforcing compliance by third parties with
+#  this License.
+# -^L
+# +
+#    11. If, as a consequence of a court judgment or allegation of patent
+#  infringement or for any other reason (not limited to patent issues),
+#  conditions are imposed on you (whether by court order, agreement or
+# @@ -388,10 +384,9 @@
+#  the only way you could satisfy both it and this License would be to
+#  refrain entirely from distribution of the Library.
+#  
+# -If any portion of this section is held invalid or unenforceable under
+# -any particular circumstance, the balance of the section is intended to
+# -apply, and the section as a whole is intended to apply in other
+# -circumstances.
+# +If any portion of this section is held invalid or unenforceable under any
+# +particular circumstance, the balance of the section is intended to apply,
+# +and the section as a whole is intended to apply in other circumstances.
+#  
+#  It is not the purpose of this section to induce you to infringe any
+#  patents or other property right claims or to contest validity of any
+# @@ -409,11 +404,11 @@
+#  
+#    12. If the distribution and/or use of the Library is restricted in
+#  certain countries either by patents or by copyrighted interfaces, the
+# -original copyright holder who places the Library under this License
+# -may add an explicit geographical distribution limitation excluding those
+# -countries, so that distribution is permitted only in or among
+# -countries not thus excluded.  In such case, this License incorporates
+# -the limitation as if written in the body of this License.
+# +original copyright holder who places the Library under this License may add
+# +an explicit geographical distribution limitation excluding those countries,
+# +so that distribution is permitted only in or among countries not thus
+# +excluded.  In such case, this License incorporates the limitation as if
+# +written in the body of this License.
+#  
+#    13. The Free Software Foundation may publish revised and/or new
+#  versions of the Lesser General Public License from time to time.
+# @@ -427,7 +422,7 @@
+#  the Free Software Foundation.  If the Library does not specify a
+#  license version number, you may choose any version ever published by
+#  the Free Software Foundation.
+# -^L
+# +
+#    14. If you wish to incorporate parts of the Library into other free
+#  programs whose distribution conditions are incompatible with these,
+#  write to the author to ask for permission.  For software which is
+# @@ -461,30 +456,27 @@
+#  DAMAGES.
+#  
+#                       END OF TERMS AND CONDITIONS
+# -^L
+# +
+#             How to Apply These Terms to Your New Libraries
+#  
+#    If you develop a new library, and you want it to be of the greatest
+#  possible use to the public, we recommend making it free software that
+#  everyone can redistribute and change.  You can do so by permitting
+# -redistribution under these terms (or, alternatively, under the terms
+# -of the ordinary General Public License).
+# -
+# -  To apply these terms, attach the following notices to the library.
+# -It is safest to attach them to the start of each source file to most
+# -effectively convey the exclusion of warranty; and each file should
+# -have at least the "copyright" line and a pointer to where the full
+# -notice is found.
+# -
+# -
+# -    <one line to give the library's name and a brief idea of what it
+# -does.>
+# +redistribution under these terms (or, alternatively, under the terms of the
+# +ordinary General Public License).
+# +
+# +  To apply these terms, attach the following notices to the library.  It is
+# +safest to attach them to the start of each source file to most effectively
+# +convey the exclusion of warranty; and each file should have at least the
+# +"copyright" line and a pointer to where the full notice is found.
+# +
+# +    <one line to give the library's name and a brief idea of what it does.>
+#      Copyright (C) <year>  <name of author>
+#  
+#      This library is free software; you can redistribute it and/or
+#      modify it under the terms of the GNU Lesser General Public
+#      License as published by the Free Software Foundation; either
+# -    version 2 of the License, or (at your option) any later version.
+# +    version 2.1 of the License, or (at your option) any later version.
+#  
+#      This library is distributed in the hope that it will be useful,
+#      but WITHOUT ANY WARRANTY; without even the implied warranty of
+# @@ -493,23 +485,18 @@
+#  
+#      You should have received a copy of the GNU Lesser General Public
+#      License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+# -
+# -Also add information on how to contact you by electronic and paper
+# -mail.
+# -
+# -You should also get your employer (if you work as a programmer) or
+# -your
+# +    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# +
+# +Also add information on how to contact you by electronic and paper mail.
+# +
+# +You should also get your employer (if you work as a programmer) or your
+#  school, if any, to sign a "copyright disclaimer" for the library, if
+#  necessary.  Here is a sample; alter the names:
+#  
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the
+# -  library `Frob' (a library for tweaking knobs) written by James
+# -Random Hacker.
+# +  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+#  
+#    <signature of Ty Coon>, 1 April 1990
+#    Ty Coon, President of Vice
+#  
+#  That's all there is to it!
+# -
+# -
+# 
+#
+
+SUMMARY = "C++ bindings for the GTK+ toolkit"
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+
+LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe \
+                    "
+
+DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
+
+inherit gnomebase features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.sha256sum] = "411f2e749256cfe2f496ff23a6ad232d104f3eb8c205ec06db87e9000004635b"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.39.2


--===============3618503412479908920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4952 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:f5f18d7c7dab9e8a794f48bfe2a6305c6cdca88e"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 542 Local 532 Mirrors 0 Missed 10 Current 491 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 504 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb:do_create_spdx_setscene)
NOTE: recipe gtkmm-4.13.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atkmm-2.28.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pangomm-2.46.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe atkmm-2.28.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtkmm-4.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pangomm-2.46.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 733 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb:do_create_spdx_setscene)
NOTE: recipe gtkmm-4.13.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 736 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtkmm-4.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairomm-1.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 558 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_fetch)
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairomm-1.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 952 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 956 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gtkmm-4.13.1-r0: task do_fetch: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1033 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2571 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_unpack)
NOTE: Running task 2674 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtkmm-4.13.1-r0: task do_unpack: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2793 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_patch)
NOTE: Running task 2794 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_collect_spdx_deps)
NOTE: recipe gtkmm-4.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtkmm-4.13.1-r0: task do_patch: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_patch: Succeeded
NOTE: recipe gtkmm-4.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2796 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_configure)
NOTE: recipe gtkmm-4.13.1-r0: task do_configure: Started
NOTE: recipe gtkmm-4.13.1-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc
 /gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/
 build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibmm', 'atkmm', 'gtk+', 'cairomm', 'pangomm', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'linux-libc-headers', 'gnu-config-native', 'texinfo-dummy-native', 'm4-native', 'libgcc', 'binutils-cross-x86_64', 'glib-2.0', 'libsigc++-2.0', 'mm-common', 'attr-native', 'opkg-utils', 'pango', 'libpng', 'libxext', 'cairo', 'gobject-introspection', 'libx11', 'libxcomposite', 'libxdamage', 'gdk-pixbuf', 'libxcursor', 'at-spi2-core', 'libxrandr', 'libxrender', 'libjpeg-turbo', 'gettext-minimal-native', 'flex-native', 'gmp-native', 'mpfr-native', 'zlib-native', 'libmpc-native', 'zstd-native', 'boost', 'libpcre2', 'zlib', 'bash-completion', 'libffi', 'util-linux', 'fontconfig', 'fribidi', 'harfbuzz', 'freetype', 'libxft', 'xorgproto', 'util-macros', 'mesa', 'libxcb', 'libsm', 'pixman', 'python3',
  'xtrans', 'libxfixes', 'shared-mime-info', 'libxml2', 'libxi', 'libxtst', 'dbus', 'bzip2', 'icu', 'ncurses', 'libcap-ng', 'libxcrypt', 'util-linux-libuuid', 'libpam', 'expat', 'xrandr', 'libxshmfence', 'wayland-protocols', 'libxxf86vm', 'libdrm', 'vulkan-headers', 'wayland', 'vulkan-loader', 'xcb-proto', 'libxau', 'libxdmcp', 'libpthread-stubs', 'libice', 'sqlite3', 'xz', 'gdbm', 'libedit', 'libnsl2', 'libtirpc', 'openssl', 'base-passwd', 'update-rc.d', 'shadow', 'systemd', 'shadow-native', 'initscripts', 'base-files', 'shadow-sysroot', 'cracklib', 'libpciaccess', 'attr', 'acl', 'libxkbcommon', 'zstd', 'kmod', 'libcap', 'libseccomp', 'xkeyboard-config']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/recipe-sysroot-native/usr/share/aclocal/ --force -I build ${ACLOCAL_FLAGS}
| aclocal: error: couldn't open directory 'build': No such file or directory
| autoreconf: error: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110, line 285
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110, line 248
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110, line 227
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110, line 289
NOTE: recipe gtkmm-4.13.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2797 tasks of which 2791 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130332.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130332.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gtkmm-4.13.1-r0 do_configure: autoreconf execution failed.
ERROR: gtkmm-4.13.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/run.do_configure.339110', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gtkmm/4.13.1/temp/log.do_configure.339110
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm_4.13.1.bb:do_configure) failed with exit code '1'

--===============3618503412479908920==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtkmm-upgrade-2.24.5-4.13.1.patch"

RnJvbSAyYWFkZmViNTkyZjQyYTkwYzYzNjM0YmRhYzNjZjk0YmVlZDNmMDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzowMzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
a21tOiB1cGdyYWRlIDIuMjQuNSAtPiA0LjEzLjEKCi0tLQogbWV0YS1vZS9yZWNpcGVzLWdub21l
L2d0aysvZ3RrbW1fMi4yNC41LmJiIHwgIDIwIC0tCiBtZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky9ndGttbV80LjEzLjEuYmIgfCAyNDAgKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDI0MCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGttbV8yLjI0LjUuYmIKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGttbV80LjEzLjEuYmIKCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGttbV8yLjI0LjUuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGttbV8yLjI0LjUuYmIKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDU0ZTc1YTIwZC4uMDAwMDAwMDAwCi0tLSBhL21ldGEtb2UvcmVjaXBl
cy1nbm9tZS9ndGsrL2d0a21tXzIuMjQuNS5iYgorKysgL2Rldi9udWxsCkBAIC0xLDIwICswLDAg
QEAKLVNVTU1BUlkgPSAiQysrIGJpbmRpbmdzIGZvciB0aGUgR1RLKyB0b29sa2l0IgotSE9NRVBB
R0UgPSAiaHR0cDovL3d3dy5ndGttbS5vcmcvIgotU0VDVElPTiA9ICJsaWJzIgotCi1MSUNFTlNF
ID0gIkxHUEwtMi4xLW9ubHkgJiBHUEwtMi4wLW9ubHkiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT1kODA0NWYzYjhmOTI5YzFjYjI5YTFlM2ZkNzM3YjQ5OSBcCi0gICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLnRvb2xzO21kNT03NTE0MTkyNjBhYTk1NDQ5
OWY3YWJhYWJhYTg4MmJiZSIKLQotREVQRU5EUyA9ICJhdGttbSBwYW5nb21tIGdsaWJtbSBndGsr
IGNhaXJvbW0iCi0KLWluaGVyaXQgZ25vbWViYXNlIGZlYXR1cmVzX2NoZWNrCi0KLVJFUVVJUkVE
X0RJU1RST19GRUFUVVJFUyA9ICJ4MTEiCi0KLVNSQ19VUklbYXJjaGl2ZS5tZDVzdW1dID0gIjZj
NTlhZThiYmZmNDhmYWQ5MTMyZjIzYWYzNDdhY2YxIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1
bV0gPSAiMDY4MGE1M2I3YmY5MGI0ZTRiZjQ0NGQxZDg5ZTZkZjQxYzc3N2UwYmFjYzk2ZTljMDlm
YzRkZDJmNWZlNmI3MiIKLQotRVhUUkFfT0VDT05GID0gIiAtLWRpc2FibGUtZG9jdW1lbnRhdGlv
biAiCi0KLUZJTEVTOiR7UE59LWRldiArPSAiJHtsaWJkaXJ9LyovaW5jbHVkZSAke2xpYmRpcn0v
Ki9wcm9jL200IgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWdub21lL2d0aysvZ3RrbW1f
NC4xMy4xLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWdub21lL2d0aysvZ3RrbW1fNC4xMy4xLmJiCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uN2FlZDIzNTUzCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWdub21lL2d0aysvZ3RrbW1fNC4xMy4xLmJiCkBAIC0w
LDAgKzEsMjQwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlO
RworIyBAQCAtMSw5ICsxLDggQEAKKyMgLQorIyAgICAgICAgICAgICAgICAgICAgR05VIExFU1NF
UiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNp
b24gMi4xLCBGZWJydWFyeSAxOTk5CisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5OTEsIDE5OTkg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gICAgIDU5IFRlbXBsZSBQbGFjZSwg
U3VpdGUgMzMwLCBCb3N0b24sIE1BICAwMjExMS0xMzA3ICBVU0EKKyMgKyA1MSBGcmFua2xpbiBT
dHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgICBFdmVy
eW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMK
KyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxs
b3dlZC4KKyMgIAorIyBAQCAtMjMsOCArMjIsNyBAQAorIyAgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uIGFuZCBvdGhlciBhdXRob3JzIHdobyBkZWNpZGUgdG8gdXNlIGl0LiAgWW91CisjICBjYW4g
dXNlIGl0IHRvbywgYnV0IHdlIHN1Z2dlc3QgeW91IGZpcnN0IHRoaW5rIGNhcmVmdWxseSBhYm91
dCB3aGV0aGVyCisjICB0aGlzIGxpY2Vuc2Ugb3IgdGhlIG9yZGluYXJ5IEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgaXMgdGhlIGJldHRlcgorIyAtc3RyYXRlZ3kgdG8gdXNlIGluIGFueSBwYXJ0aWN1
bGFyIGNhc2UsIGJhc2VkIG9uIHRoZSBleHBsYW5hdGlvbnMKKyMgLWJlbG93LgorIyArc3RyYXRl
Z3kgdG8gdXNlIGluIGFueSBwYXJ0aWN1bGFyIGNhc2UsIGJhc2VkIG9uIHRoZSBleHBsYW5hdGlv
bnMgYmVsb3cuCisjICAKKyMgICAgV2hlbiB3ZSBzcGVhayBvZiBmcmVlIHNvZnR3YXJlLCB3ZSBh
cmUgcmVmZXJyaW5nIHRvIGZyZWVkb20gb2YgdXNlLAorIyAgbm90IHByaWNlLiAgT3VyIEdlbmVy
YWwgUHVibGljIExpY2Vuc2VzIGFyZSBkZXNpZ25lZCB0byBtYWtlIHN1cmUgdGhhdAorIyBAQCAt
NTcsNyArNTUsNyBAQAorIyAgdGhhdCB3aGF0IHRoZXkgaGF2ZSBpcyBub3QgdGhlIG9yaWdpbmFs
IHZlcnNpb24sIHNvIHRoYXQgdGhlIG9yaWdpbmFsCisjICBhdXRob3IncyByZXB1dGF0aW9uIHdp
bGwgbm90IGJlIGFmZmVjdGVkIGJ5IHByb2JsZW1zIHRoYXQgbWlnaHQgYmUKKyMgIGludHJvZHVj
ZWQgYnkgb3RoZXJzLgorIyAtXkwKKyMgKwwKKyMgICAgRmluYWxseSwgc29mdHdhcmUgcGF0ZW50
cyBwb3NlIGEgY29uc3RhbnQgdGhyZWF0IHRvIHRoZSBleGlzdGVuY2Ugb2YKKyMgIGFueSBmcmVl
IHByb2dyYW0uICBXZSB3aXNoIHRvIG1ha2Ugc3VyZSB0aGF0IGEgY29tcGFueSBjYW5ub3QKKyMg
IGVmZmVjdGl2ZWx5IHJlc3RyaWN0IHRoZSB1c2VycyBvZiBhIGZyZWUgcHJvZ3JhbSBieSBvYnRh
aW5pbmcgYQorIyBAQCAtODksOCArODcsNyBAQAorIyAgc3BlY2lhbCBjaXJjdW1zdGFuY2VzLgor
IyAgCisjICAgIEZvciBleGFtcGxlLCBvbiByYXJlIG9jY2FzaW9ucywgdGhlcmUgbWF5IGJlIGEg
c3BlY2lhbCBuZWVkIHRvCisjIC1lbmNvdXJhZ2UgdGhlIHdpZGVzdCBwb3NzaWJsZSB1c2Ugb2Yg
YSBjZXJ0YWluIGxpYnJhcnksIHNvIHRoYXQgaXQKKyMgLWJlY29tZXMKKyMgK2VuY291cmFnZSB0
aGUgd2lkZXN0IHBvc3NpYmxlIHVzZSBvZiBhIGNlcnRhaW4gbGlicmFyeSwgc28gdGhhdCBpdCBi
ZWNvbWVzCisjICBhIGRlLWZhY3RvIHN0YW5kYXJkLiAgVG8gYWNoaWV2ZSB0aGlzLCBub24tZnJl
ZSBwcm9ncmFtcyBtdXN0IGJlCisjICBhbGxvd2VkIHRvIHVzZSB0aGUgbGlicmFyeS4gIEEgbW9y
ZSBmcmVxdWVudCBjYXNlIGlzIHRoYXQgYSBmcmVlCisjICBsaWJyYXJ5IGRvZXMgdGhlIHNhbWUg
am9iIGFzIHdpZGVseSB1c2VkIG5vbi1mcmVlIGxpYnJhcmllcy4gIEluIHRoaXMKKyMgQEAgLTEx
NCw3ICsxMTEsNyBAQAorIyAgIndvcmsgYmFzZWQgb24gdGhlIGxpYnJhcnkiIGFuZCBhICJ3b3Jr
IHRoYXQgdXNlcyB0aGUgbGlicmFyeSIuICBUaGUKKyMgIGZvcm1lciBjb250YWlucyBjb2RlIGRl
cml2ZWQgZnJvbSB0aGUgbGlicmFyeSwgd2hlcmVhcyB0aGUgbGF0dGVyIG11c3QKKyMgIGJlIGNv
bWJpbmVkIHdpdGggdGhlIGxpYnJhcnkgaW4gb3JkZXIgdG8gcnVuLgorIyAtXkwKKyMgKwwKKyMg
ICAgICAgICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAg
ICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9E
SUZJQ0FUSU9OCisjICAKKyMgQEAgLTEzOSw4ICsxMzYsNyBAQAorIyAgICAiU291cmNlIGNvZGUi
IGZvciBhIHdvcmsgbWVhbnMgdGhlIHByZWZlcnJlZCBmb3JtIG9mIHRoZSB3b3JrIGZvcgorIyAg
bWFraW5nIG1vZGlmaWNhdGlvbnMgdG8gaXQuICBGb3IgYSBsaWJyYXJ5LCBjb21wbGV0ZSBzb3Vy
Y2UgY29kZSBtZWFucworIyAgYWxsIHRoZSBzb3VyY2UgY29kZSBmb3IgYWxsIG1vZHVsZXMgaXQg
Y29udGFpbnMsIHBsdXMgYW55IGFzc29jaWF0ZWQKKyMgLWludGVyZmFjZSBkZWZpbml0aW9uIGZp
bGVzLCBwbHVzIHRoZSBzY3JpcHRzIHVzZWQgdG8gY29udHJvbAorIyAtY29tcGlsYXRpb24KKyMg
K2ludGVyZmFjZSBkZWZpbml0aW9uIGZpbGVzLCBwbHVzIHRoZSBzY3JpcHRzIHVzZWQgdG8gY29u
dHJvbCBjb21waWxhdGlvbgorIyAgYW5kIGluc3RhbGxhdGlvbiBvZiB0aGUgbGlicmFyeS4KKyMg
IAorIyAgICBBY3Rpdml0aWVzIG90aGVyIHRoYW4gY29weWluZywgZGlzdHJpYnV0aW9uIGFuZCBt
b2RpZmljYXRpb24gYXJlIG5vdAorIyBAQCAtMjIwLDcgKzIxNiw3IEBACisjICBvcmRpbmFyeSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBoYXMgYXBwZWFyZWQsIHRoZW4geW91IGNhbiBzcGVj
aWZ5CisjICB0aGF0IHZlcnNpb24gaW5zdGVhZCBpZiB5b3Ugd2lzaC4pICBEbyBub3QgbWFrZSBh
bnkgb3RoZXIgY2hhbmdlIGluCisjICB0aGVzZSBub3RpY2VzLgorIyAtXkwKKyMgKwwKKyMgICAg
T25jZSB0aGlzIGNoYW5nZSBpcyBtYWRlIGluIGEgZ2l2ZW4gY29weSwgaXQgaXMgaXJyZXZlcnNp
YmxlIGZvcgorIyAgdGhhdCBjb3B5LCBzbyB0aGUgb3JkaW5hcnkgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXBwbGllcyB0byBhbGwKKyMgIHN1YnNlcXVlbnQgY29waWVzIGFuZCBkZXJpdmF0
aXZlIHdvcmtzIG1hZGUgZnJvbSB0aGF0IGNvcHkuCisjIEBAIC0yNzEsNyArMjY3LDcgQEAKKyMg
IGRpc3RyaWJ1dGUgdGhlIG9iamVjdCBjb2RlIGZvciB0aGUgd29yayB1bmRlciB0aGUgdGVybXMg
b2YgU2VjdGlvbiA2LgorIyAgQW55IGV4ZWN1dGFibGVzIGNvbnRhaW5pbmcgdGhhdCB3b3JrIGFs
c28gZmFsbCB1bmRlciBTZWN0aW9uIDYsCisjICB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBsaW5r
ZWQgZGlyZWN0bHkgd2l0aCB0aGUgTGlicmFyeSBpdHNlbGYuCisjIC1eTAorIyArDAorIyAgICA2
LiBBcyBhbiBleGNlcHRpb24gdG8gdGhlIFNlY3Rpb25zIGFib3ZlLCB5b3UgbWF5IGFsc28gY29t
YmluZSBvcgorIyAgbGluayBhICJ3b3JrIHRoYXQgdXNlcyB0aGUgTGlicmFyeSIgd2l0aCB0aGUg
TGlicmFyeSB0byBwcm9kdWNlIGEKKyMgIHdvcmsgY29udGFpbmluZyBwb3J0aW9ucyBvZiB0aGUg
TGlicmFyeSwgYW5kIGRpc3RyaWJ1dGUgdGhhdCB3b3JrCisjIEBAIC0zMzMsNyArMzI5LDcgQEAK
KyMgIGFjY29tcGFueSB0aGUgb3BlcmF0aW5nIHN5c3RlbS4gIFN1Y2ggYSBjb250cmFkaWN0aW9u
IG1lYW5zIHlvdSBjYW5ub3QKKyMgIHVzZSBib3RoIHRoZW0gYW5kIHRoZSBMaWJyYXJ5IHRvZ2V0
aGVyIGluIGFuIGV4ZWN1dGFibGUgdGhhdCB5b3UKKyMgIGRpc3RyaWJ1dGUuCisjIC1eTAorIyAr
DAorIyAgICA3LiBZb3UgbWF5IHBsYWNlIGxpYnJhcnkgZmFjaWxpdGllcyB0aGF0IGFyZSBhIHdv
cmsgYmFzZWQgb24gdGhlCisjICBMaWJyYXJ5IHNpZGUtYnktc2lkZSBpbiBhIHNpbmdsZSBsaWJy
YXJ5IHRvZ2V0aGVyIHdpdGggb3RoZXIgbGlicmFyeQorIyAgZmFjaWxpdGllcyBub3QgY292ZXJl
ZCBieSB0aGlzIExpY2Vuc2UsIGFuZCBkaXN0cmlidXRlIHN1Y2ggYSBjb21iaW5lZAorIyBAQCAt
Mzc0LDcgKzM3MCw3IEBACisjICByZXN0cmljdGlvbnMgb24gdGhlIHJlY2lwaWVudHMnIGV4ZXJj
aXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBoZXJlaW4uCisjICBZb3UgYXJlIG5vdCByZXNwb25z
aWJsZSBmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2UgYnkgdGhpcmQgcGFydGllcyB3aXRoCisjICB0
aGlzIExpY2Vuc2UuCisjIC1eTAorIyArDAorIyAgICAxMS4gSWYsIGFzIGEgY29uc2VxdWVuY2Ug
b2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9uIG9mIHBhdGVudAorIyAgaW5mcmluZ2Vt
ZW50IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3QgbGltaXRlZCB0byBwYXRlbnQgaXNzdWVz
KSwKKyMgIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0aGVyIGJ5IGNvdXJ0IG9y
ZGVyLCBhZ3JlZW1lbnQgb3IKKyMgQEAgLTM4OCwxMCArMzg0LDkgQEAKKyMgIHRoZSBvbmx5IHdh
eSB5b3UgY291bGQgc2F0aXNmeSBib3RoIGl0IGFuZCB0aGlzIExpY2Vuc2Ugd291bGQgYmUgdG8K
KyMgIHJlZnJhaW4gZW50aXJlbHkgZnJvbSBkaXN0cmlidXRpb24gb2YgdGhlIExpYnJhcnkuCisj
ICAKKyMgLUlmIGFueSBwb3J0aW9uIG9mIHRoaXMgc2VjdGlvbiBpcyBoZWxkIGludmFsaWQgb3Ig
dW5lbmZvcmNlYWJsZSB1bmRlcgorIyAtYW55IHBhcnRpY3VsYXIgY2lyY3Vtc3RhbmNlLCB0aGUg
YmFsYW5jZSBvZiB0aGUgc2VjdGlvbiBpcyBpbnRlbmRlZCB0bworIyAtYXBwbHksIGFuZCB0aGUg
c2VjdGlvbiBhcyBhIHdob2xlIGlzIGludGVuZGVkIHRvIGFwcGx5IGluIG90aGVyCisjIC1jaXJj
dW1zdGFuY2VzLgorIyArSWYgYW55IHBvcnRpb24gb2YgdGhpcyBzZWN0aW9uIGlzIGhlbGQgaW52
YWxpZCBvciB1bmVuZm9yY2VhYmxlIHVuZGVyIGFueQorIyArcGFydGljdWxhciBjaXJjdW1zdGFu
Y2UsIHRoZSBiYWxhbmNlIG9mIHRoZSBzZWN0aW9uIGlzIGludGVuZGVkIHRvIGFwcGx5LAorIyAr
YW5kIHRoZSBzZWN0aW9uIGFzIGEgd2hvbGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4gb3RoZXIg
Y2lyY3Vtc3RhbmNlcy4KKyMgIAorIyAgSXQgaXMgbm90IHRoZSBwdXJwb3NlIG9mIHRoaXMgc2Vj
dGlvbiB0byBpbmR1Y2UgeW91IHRvIGluZnJpbmdlIGFueQorIyAgcGF0ZW50cyBvciBvdGhlciBw
cm9wZXJ0eSByaWdodCBjbGFpbXMgb3IgdG8gY29udGVzdCB2YWxpZGl0eSBvZiBhbnkKKyMgQEAg
LTQwOSwxMSArNDA0LDExIEBACisjICAKKyMgICAgMTIuIElmIHRoZSBkaXN0cmlidXRpb24gYW5k
L29yIHVzZSBvZiB0aGUgTGlicmFyeSBpcyByZXN0cmljdGVkIGluCisjICBjZXJ0YWluIGNvdW50
cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBieSBjb3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUK
KyMgLW9yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIgd2hvIHBsYWNlcyB0aGUgTGlicmFyeSB1bmRl
ciB0aGlzIExpY2Vuc2UKKyMgLW1heSBhZGQgYW4gZXhwbGljaXQgZ2VvZ3JhcGhpY2FsIGRpc3Ry
aWJ1dGlvbiBsaW1pdGF0aW9uIGV4Y2x1ZGluZyB0aG9zZQorIyAtY291bnRyaWVzLCBzbyB0aGF0
IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25seSBpbiBvciBhbW9uZworIyAtY291bnRyaWVz
IG5vdCB0aHVzIGV4Y2x1ZGVkLiAgSW4gc3VjaCBjYXNlLCB0aGlzIExpY2Vuc2UgaW5jb3Jwb3Jh
dGVzCisjIC10aGUgbGltaXRhdGlvbiBhcyBpZiB3cml0dGVuIGluIHRoZSBib2R5IG9mIHRoaXMg
TGljZW5zZS4KKyMgK29yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIgd2hvIHBsYWNlcyB0aGUgTGli
cmFyeSB1bmRlciB0aGlzIExpY2Vuc2UgbWF5IGFkZAorIyArYW4gZXhwbGljaXQgZ2VvZ3JhcGhp
Y2FsIGRpc3RyaWJ1dGlvbiBsaW1pdGF0aW9uIGV4Y2x1ZGluZyB0aG9zZSBjb3VudHJpZXMsCisj
ICtzbyB0aGF0IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25seSBpbiBvciBhbW9uZyBjb3Vu
dHJpZXMgbm90IHRodXMKKyMgK2V4Y2x1ZGVkLiAgSW4gc3VjaCBjYXNlLCB0aGlzIExpY2Vuc2Ug
aW5jb3Jwb3JhdGVzIHRoZSBsaW1pdGF0aW9uIGFzIGlmCisjICt3cml0dGVuIGluIHRoZSBib2R5
IG9mIHRoaXMgTGljZW5zZS4KKyMgIAorIyAgICAxMy4gVGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiBtYXkgcHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcKKyMgIHZlcnNpb25zIG9mIHRoZSBM
ZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmcm9tIHRpbWUgdG8gdGltZS4KKyMgQEAgLTQy
Nyw3ICs0MjIsNyBAQAorIyAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4gIElmIHRoZSBM
aWJyYXJ5IGRvZXMgbm90IHNwZWNpZnkgYQorIyAgbGljZW5zZSB2ZXJzaW9uIG51bWJlciwgeW91
IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkKKyMgIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24uCisjIC1eTAorIyArDAorIyAgICAxNC4gSWYgeW91IHdpc2ggdG8g
aW5jb3Jwb3JhdGUgcGFydHMgb2YgdGhlIExpYnJhcnkgaW50byBvdGhlciBmcmVlCisjICBwcm9n
cmFtcyB3aG9zZSBkaXN0cmlidXRpb24gY29uZGl0aW9ucyBhcmUgaW5jb21wYXRpYmxlIHdpdGgg
dGhlc2UsCisjICB3cml0ZSB0byB0aGUgYXV0aG9yIHRvIGFzayBmb3IgcGVybWlzc2lvbi4gIEZv
ciBzb2Z0d2FyZSB3aGljaCBpcworIyBAQCAtNDYxLDMwICs0NTYsMjcgQEAKKyMgIERBTUFHRVMu
CisjICAKKyMgICAgICAgICAgICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9O
UworIyAtXkwKKyMgKwwKKyMgICAgICAgICAgICAgSG93IHRvIEFwcGx5IFRoZXNlIFRlcm1zIHRv
IFlvdXIgTmV3IExpYnJhcmllcworIyAgCisjICAgIElmIHlvdSBkZXZlbG9wIGEgbmV3IGxpYnJh
cnksIGFuZCB5b3Ugd2FudCBpdCB0byBiZSBvZiB0aGUgZ3JlYXRlc3QKKyMgIHBvc3NpYmxlIHVz
ZSB0byB0aGUgcHVibGljLCB3ZSByZWNvbW1lbmQgbWFraW5nIGl0IGZyZWUgc29mdHdhcmUgdGhh
dAorIyAgZXZlcnlvbmUgY2FuIHJlZGlzdHJpYnV0ZSBhbmQgY2hhbmdlLiAgWW91IGNhbiBkbyBz
byBieSBwZXJtaXR0aW5nCisjIC1yZWRpc3RyaWJ1dGlvbiB1bmRlciB0aGVzZSB0ZXJtcyAob3Is
IGFsdGVybmF0aXZlbHksIHVuZGVyIHRoZSB0ZXJtcworIyAtb2YgdGhlIG9yZGluYXJ5IEdlbmVy
YWwgUHVibGljIExpY2Vuc2UpLgorIyAtCisjIC0gIFRvIGFwcGx5IHRoZXNlIHRlcm1zLCBhdHRh
Y2ggdGhlIGZvbGxvd2luZyBub3RpY2VzIHRvIHRoZSBsaWJyYXJ5LgorIyAtSXQgaXMgc2FmZXN0
IHRvIGF0dGFjaCB0aGVtIHRvIHRoZSBzdGFydCBvZiBlYWNoIHNvdXJjZSBmaWxlIHRvIG1vc3QK
KyMgLWVmZmVjdGl2ZWx5IGNvbnZleSB0aGUgZXhjbHVzaW9uIG9mIHdhcnJhbnR5OyBhbmQgZWFj
aCBmaWxlIHNob3VsZAorIyAtaGF2ZSBhdCBsZWFzdCB0aGUgImNvcHlyaWdodCIgbGluZSBhbmQg
YSBwb2ludGVyIHRvIHdoZXJlIHRoZSBmdWxsCisjIC1ub3RpY2UgaXMgZm91bmQuCisjIC0KKyMg
LQorIyAtICAgIDxvbmUgbGluZSB0byBnaXZlIHRoZSBsaWJyYXJ5J3MgbmFtZSBhbmQgYSBicmll
ZiBpZGVhIG9mIHdoYXQgaXQKKyMgLWRvZXMuPgorIyArcmVkaXN0cmlidXRpb24gdW5kZXIgdGhl
c2UgdGVybXMgKG9yLCBhbHRlcm5hdGl2ZWx5LCB1bmRlciB0aGUgdGVybXMgb2YgdGhlCisjICtv
cmRpbmFyeSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlKS4KKyMgKworIyArICBUbyBhcHBseSB0aGVz
ZSB0ZXJtcywgYXR0YWNoIHRoZSBmb2xsb3dpbmcgbm90aWNlcyB0byB0aGUgbGlicmFyeS4gIEl0
IGlzCisjICtzYWZlc3QgdG8gYXR0YWNoIHRoZW0gdG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNl
IGZpbGUgdG8gbW9zdCBlZmZlY3RpdmVseQorIyArY29udmV5IHRoZSBleGNsdXNpb24gb2Ygd2Fy
cmFudHk7IGFuZCBlYWNoIGZpbGUgc2hvdWxkIGhhdmUgYXQgbGVhc3QgdGhlCisjICsiY29weXJp
Z2h0IiBsaW5lIGFuZCBhIHBvaW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5k
LgorIyArCisjICsgICAgPG9uZSBsaW5lIHRvIGdpdmUgdGhlIGxpYnJhcnkncyBuYW1lIGFuZCBh
IGJyaWVmIGlkZWEgb2Ygd2hhdCBpdCBkb2VzLj4KKyMgICAgICBDb3B5cmlnaHQgKEMpIDx5ZWFy
PiAgPG5hbWUgb2YgYXV0aG9yPgorIyAgCisjICAgICAgVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorIyAgICAgIG1vZGlmeSBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyMgICAgICBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIKKyMgLSAgICB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikg
YW55IGxhdGVyIHZlcnNpb24uCisjICsgICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9y
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisjICAKKyMgICAgICBUaGlzIGxp
YnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
KyMgICAgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGll
ZCB3YXJyYW50eSBvZgorIyBAQCAtNDkzLDIzICs0ODUsMTggQEAKKyMgIAorIyAgICAgIFlvdSBz
aG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJs
aWMKKyMgICAgICBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBpZiBub3QsIHdyaXRl
IHRvIHRoZSBGcmVlIFNvZnR3YXJlCisjIC0gICAgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxl
IFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgMDIxMTEtMTMwNyAgVVNBCisjIC0KKyMgLUFs
c28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFu
ZCBwYXBlcgorIyAtbWFpbC4KKyMgLQorIyAtWW91IHNob3VsZCBhbHNvIGdldCB5b3VyIGVtcGxv
eWVyIChpZiB5b3Ugd29yayBhcyBhIHByb2dyYW1tZXIpIG9yCisjIC15b3VyCisjICsgICAgRm91
bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBN
QSAgMDIxMTAtMTMwMSAgVVNBCisjICsKKyMgK0Fsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0
byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyArCisjICtZb3Ug
c2hvdWxkIGFsc28gZ2V0IHlvdXIgZW1wbG95ZXIgKGlmIHlvdSB3b3JrIGFzIGEgcHJvZ3JhbW1l
cikgb3IgeW91cgorIyAgc2Nob29sLCBpZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRpc2Ns
YWltZXIiIGZvciB0aGUgbGlicmFyeSwgaWYKKyMgIG5lY2Vzc2FyeS4gIEhlcmUgaXMgYSBzYW1w
bGU7IGFsdGVyIHRoZSBuYW1lczoKKyMgIAorIyAgICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRp
c2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZQorIyAtICBsaWJyYXJ5IGBGcm9i
JyAoYSBsaWJyYXJ5IGZvciB0d2Vha2luZyBrbm9icykgd3JpdHRlbiBieSBKYW1lcworIyAtUmFu
ZG9tIEhhY2tlci4KKyMgKyAgbGlicmFyeSBgRnJvYicgKGEgbGlicmFyeSBmb3IgdHdlYWtpbmcg
a25vYnMpIHdyaXR0ZW4gYnkgSmFtZXMgUmFuZG9tIEhhY2tlci4KKyMgIAorIyAgICA8c2lnbmF0
dXJlIG9mIFR5IENvb24+LCAxIEFwcmlsIDE5OTAKKyMgICAgVHkgQ29vbiwgUHJlc2lkZW50IG9m
IFZpY2UKKyMgIAorIyAgVGhhdCdzIGFsbCB0aGVyZSBpcyB0byBpdCEKKyMgLQorIyAtCisjIAor
IworCitTVU1NQVJZID0gIkMrKyBiaW5kaW5ncyBmb3IgdGhlIEdUSysgdG9vbGtpdCIKK0hPTUVQ
QUdFID0gImh0dHA6Ly93d3cuZ3RrbW0ub3JnLyIKK1NFQ1RJT04gPSAibGlicyIKKworTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5ICYgR1BMLTIuMC1vbmx5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAorICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy50b29sczttZDU9NzUxNDE5MjYwYWE5NTQ0
OTlmN2FiYWFiYWE4ODJiYmUgXAorICAgICAgICAgICAgICAgICAgICAiCisKK0RFUEVORFMgPSAi
YXRrbW0gcGFuZ29tbSBnbGlibW0gZ3RrKyBjYWlyb21tIgorCitpbmhlcml0IGdub21lYmFzZSBm
ZWF0dXJlc19jaGVjaworCitSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAieDExIgorCitTUkNf
VVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI0MTFmMmU3NDkyNTZjZmUyZjQ5NmZmMjNhNmFkMjMy
ZDEwNGYzZWI4YzIwNWVjMDZkYjg3ZTkwMDAwMDQ2MzViIgorCitFWFRSQV9PRUNPTkYgPSAiIC0t
ZGlzYWJsZS1kb2N1bWVudGF0aW9uICIKKworRklMRVM6JHtQTn0tZGV2ICs9ICIke2xpYmRpcn0v
Ki9pbmNsdWRlICR7bGliZGlyfS8qL3Byb2MvbTQiCi0tIAoyLjM5LjIKCg==

--===============3618503412479908920==--

