Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541F0C10F1B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2290.1699061896004242802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ls7uG9N3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jqUUottH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb10b3-f967d227-e532-44be-b77f-28ce74d536f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gG5fI8mDIu6bxDyWPjwFKtf02eFacMqgpCsIdZsEPso=;
	b=Ls7uG9N3IyXD/92dd1B1IQd8DBhhoFD/3ofC4ewMBb78d/LSVhAcn+JONUl3150d
	LI3RGTLz0W+sqPSHZ/BwvgKOyVPMI3yTRj881RG1FW49mGMTV9YoVhlVe0GJcAGSmxG
	Dp6WcZxT79gAaOaazlGMYwLqw08yBS7hr1Y3D9Ps=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gG5fI8mDIu6bxDyWPjwFKtf02eFacMqgpCsIdZsEPso=;
	b=jqUUottH3ta56qo3x7w9InEHsLP+PsM9DdN9jGcaWO8S8Y0d3cdkY6R0nqlFoQm4
	fPYo6FecDCfg5u1aGvoEISWadL9OTWklZVivh5EJQ4ptbuChOZeijPpCcCfIIdebejM
	mQ24mZbre988+smJujBClEdQ38sXdLxt63oXGdpI=
Content-Type: multipart/mixed; boundary="===============5059008451300192621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-imgtool: upgrading to 2.0.0 SUCCEEDED
Message-ID: <0101018b97fb10b3-f967d227-e532-44be-b77f-28ce74d536f5-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106128

--===============5059008451300192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-imgtool* to *2.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-imgtool-upgrade-1.10.0-2.0.0.patch
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
From 6ee104f22ce470d5e6c4b906f30ffbc5ba7542d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:00:07 +0000
Subject: [PATCH] python3-imgtool: upgrade 1.10.0 -> 2.0.0

---
 ...ool_1.10.0.bb => python3-imgtool_2.0.0.bb} | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_1.10.0.bb => python3-imgtool_2.0.0.bb} (29%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb
similarity index 29%
rename from meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb
index 5282bccd0..71255705a 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb
@@ -1,9 +1,29 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- imgtool/main.py
+# +++ imgtool/main.py
+# @@ -1,5 +1,5 @@
+#  # Copyright 2017-2020 Linaro Limited
+# -# Copyright 2019-2021 Arm Limited
+# +# Copyright 2019-2023 Arm Limited
+#  #
+#  # SPDX-License-Identifier: Apache-2.0
+#  #
+# 
+#
+
 SUMMARY = "MCUboot's image signing and key management tool"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
+LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "03b34e75934ac3d96e7c42b6bcaf11ceaf4f453f7c6f26c17d726bd183104b40"
+SRC_URI[sha256sum] = "7a541255e69eec1f12aa38dce1f1d4fe20d8212677c68a9b6ec634ca91a06612"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5059008451300192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-imgtool: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/imgtool/imgtool-1.10.0.tar.gz;downloadfilename=imgtool-1.10.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/imgtool/imgtool-2.0.0.tar.gz;downloadfilename=imgtool-2.0.0.tar.gz"
packages/core2-64-poky-linux/python3-imgtool: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-dbg: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-dbg: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-dev: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-dev: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-doc: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-doc: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-locale: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-locale: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-src: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-src: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-staticdev: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool-staticdev: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: PKGV changed from 1.10.0 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: PKGSIZE changed from 215303 to 260460 (+21%)
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: PV changed from "1.10.0" to "2.0.0"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: FILELIST: directory renamed /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info -> /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info, added "/usr/lib/python3.11/site-packages/imgtool/dumpinfo.py /usr/lib/python3.11/site-packages/imgtool/__pycache__/dumpinfo.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-imgtool (sysroot):
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/imgtool/dumpinfo.py was added
  /usr/lib/python3.11/site-packages/imgtool/__pycache__/dumpinfo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/WHEEL was removed

--===============5059008451300192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4923 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 71 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:f21cd20f6627cc934b30e8f18f87da346a318788"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 642 Local 633 Mirrors 0 Missed 9 Current 187 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 193 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 198 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 200 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 202 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 203 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 204 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 212 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 213 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 214 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 216 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 217 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-imgtool-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-intelhex-2.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 218 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-intelhex-2.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 221 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 222 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-intelhex-2.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 225 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_deb_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-cbor2/5.4.6/temp/log.do_packagedata_setscene.2136128
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 246 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_package_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 247 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-intelhex-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 248 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-imgtool-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-intelhex-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 249 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_package_setscene)
NOTE: Running setscene task 255 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 359 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 361 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 362 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 375 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 497 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 502 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 519 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe python3-imgtool-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cbor2-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1034 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 593 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_fetch: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 629 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 635 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 662 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 687 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 705 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 721 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 754 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 829 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2142 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_packagedata)
NOTE: Running task 2318 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_packagedata: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cbor2-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2335 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_create_spdx)
NOTE: Running task 2336 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_package_write_ipk)
NOTE: Running task 2337 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_package_write_deb)
NOTE: Running task 2338 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-cbor2_5.4.6.bb:do_package_write_rpm)
NOTE: Running task 2339 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_package_write_ipk)
NOTE: Running task 2340 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_package_write_deb)
NOTE: Running task 2341 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_create_spdx: Started
NOTE: Running task 2342 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_package_qa)
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-cbor2-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2343 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-imgtool-2.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-imgtool-2.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-imgtool-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cbor2-5.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2344 of 2344 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-imgtool_2.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2344 tasks of which 2330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-src went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-dbg went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-ptest went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-staticdev went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-dev went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-doc went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2-locale went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cbor2 went backwards which would break package feeds (from 0:5.5.1-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: python3-cbor2-5.4.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5059008451300192621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: FILELIST: directory renamed /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info -> /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info, added "/usr/lib/python3.11/site-packages/imgtool/dumpinfo.py /usr/lib/python3.11/site-packages/imgtool/__pycache__/dumpinfo.cpython-311.pyc"
packages/core2-64-poky-linux/python3-imgtool/python3-imgtool: PKGSIZE changed from 215303 to 260460 (+21%)
Changes to packages/core2-64-poky-linux/python3-imgtool (sysroot):
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/imgtool-2.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/imgtool/dumpinfo.py was added
  /usr/lib/python3.11/site-packages/imgtool/__pycache__/dumpinfo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/imgtool-1.10.0.dist-info/WHEEL was removed

--===============5059008451300192621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-imgtool-upgrade-1.10.0-2.0.0.patch"

RnJvbSA2ZWUxMDRmMjJjZTQ3MGQ1ZTZjNGI5MDZmMzBmZmJjNWJhNzU0MmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjowMDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1ndG9vbDogdXBncmFkZSAxLjEwLjAgLT4gMi4wLjAKCi0tLQogLi4ub29sXzEuMTAu
MC5iYiA9PiBweXRob24zLWltZ3Rvb2xfMi4wLjAuYmJ9IHwgMjQgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1ndG9vbF8x
LjEwLjAuYmIgPT4gcHl0aG9uMy1pbWd0b29sXzIuMC4wLmJifSAoMjklKQoKZGlmZiAtLWdpdCBh
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1ndG9vbF8xLjEw
LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWltZ3Rv
b2xfMi4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCAyOSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWd0b29sXzEuMTAuMC5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbWd0b29sXzIu
MC4wLmJiCmluZGV4IDUyODJiY2NkMC4uNzEyNTU3MDVhIDEwMDY0NAotLS0gYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWltZ3Rvb2xfMS4xMC4wLmJiCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1ndG9vbF8yLjAu
MC5iYgpAQCAtMSw5ICsxLDI5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gaW1ndG9vbC9tYWlu
LnB5CisjICsrKyBpbWd0b29sL21haW4ucHkKKyMgQEAgLTEsNSArMSw1IEBACisjICAjIENvcHly
aWdodCAyMDE3LTIwMjAgTGluYXJvIExpbWl0ZWQKKyMgLSMgQ29weXJpZ2h0IDIwMTktMjAyMSBB
cm0gTGltaXRlZAorIyArIyBDb3B5cmlnaHQgMjAxOS0yMDIzIEFybSBMaW1pdGVkCisjICAjCisj
ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBBcGFjaGUtMi4wCisjICAjCisjIAorIworCiBT
VU1NQVJZID0gIk1DVWJvb3QncyBpbWFnZSBzaWduaW5nIGFuZCBrZXkgbWFuYWdlbWVudCB0b29s
IgogCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9p
bWd0b29sL21haW4ucHk7YmVnaW5saW5lPTM7ZW5kbGluZT0xODttZDU9OTk2NWYwOWFlNTJjMDQ4
ODZhMWYwNGUxM2NjZGNlNTciCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9pbWd0b29sL21h
aW4ucHk7YmVnaW5saW5lPTM7ZW5kbGluZT0xODttZDU9MDY0NWZiNjFlMmY5NjFhMTEwMzAyZmJm
ZGIyMjc0NDYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwM2IzNGU3NTkzNGFjM2Q5NmU3YzQy
YjZiY2FmMTFjZWFmNGY0NTNmN2M2ZjI2YzE3ZDcyNmJkMTgzMTA0YjQwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjdhNTQxMjU1ZTY5ZWVjMWYxMmFhMzhkY2UxZjFkNGZlMjBkODIxMjY3N2M2OGE5
YjZlYzYzNGNhOTFhMDY2MTIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5
LjIKCg==

--===============5059008451300192621==--

