Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65DBC07EB9
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2205.1699061894870868941
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GZtBZApt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U+OiJK15;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b97fb10ba-467a053b-948b-4a09-a9b8-cbf0f0d47f73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NsRlbhwqTOaewjjFy4nadG7Vh7A99H6PnTnLh6rJumQ=;
	b=GZtBZAptxLB6MeYJYdzZ9W6ybTy2lrri/APkNiT3CV1cwbJHd15KGHYWF2P6fIuX
	W1HnEt26AZFuAMXBM4db1JL45WJCCXPstuTjuFRl68EP937cQFDlHdvpdvR8kyU5zyv
	kDQNtUsXFFOv895NrMVc7Smv3Xt6myUf8l5iBmRo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NsRlbhwqTOaewjjFy4nadG7Vh7A99H6PnTnLh6rJumQ=;
	b=U+OiJK15dKTbu+k935+RwrmBhCMJjUD4Au7Pjfg3XSnEQo9QdAg5+5akSuni4Rzx
	am/Y/IwpaD9VlsSP36bPnjHYjBM++6FeKKy4mHBRxojQGgQH9ERj0srz58+uJLqLvSn
	/DeARijKRD+P/Wnt5SFXwy+WgvXs7ZXYf3wFYvE8=
Content-Type: multipart/mixed; boundary="===============2626490484461766419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-ipython: upgrading to 8.17.2 SUCCEEDED
Message-ID: <0101018b97fb10ba-467a053b-948b-4a09-a9b8-cbf0f0d47f73-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106122

--===============2626490484461766419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ipython* to *8.17.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ipython-upgrade-8.16.1-8.17.2.patch
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
From 028ff98b82c552ffd9fe65245a2ef9bd458066c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:06:05 +0000
Subject: [PATCH] python3-ipython: upgrade 8.16.1 -> 8.17.2

---
 .../{python3-ipython_8.16.1.bb => python3-ipython_8.17.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.16.1.bb => python3-ipython_8.17.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb b/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb
index fba797ae4..134a358bf 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "ad52f58fca8f9f848e256c629eff888efc0528c12fe0f8ec14f33205f23ef938"
+SRC_URI[sha256sum] = "126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.39.2


--===============2626490484461766419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ipython: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/ipython/ipython-8.16.1.tar.gz;downloadfilename=ipython-8.16.1.tar.gz" to "https://files.pythonhosted.org/packages/source/i/ipython/ipython-8.17.2.tar.gz;downloadfilename=ipython-8.17.2.tar.gz"
packages/core2-64-poky-linux/python3-ipython: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-dbg: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-dbg: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-dev: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-dev: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-doc: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-doc: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-locale: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-locale: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-src: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-src: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython-staticdev: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython-staticdev: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
packages/core2-64-poky-linux/python3-ipython/python3-ipython: PKGSIZE changed from 5881818 to 5895465 (+0%)
packages/core2-64-poky-linux/python3-ipython/python3-ipython: PV changed from "8.16.1" to "8.17.2"
packages/core2-64-poky-linux/python3-ipython/python3-ipython: PKGV changed from 8.16.1 [default] to 8.17.2 [default]
Changes to packages/core2-64-poky-linux/python3-ipython (sysroot):
  /usr/lib/python3.11/site-packages/ipython-8.16.1.dist-info moved to /usr/lib/python3.11/site-packages/ipython-8.17.2.dist-info

--===============2626490484461766419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4926 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-64 sysroot...done.
Removing 72 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:f6b3d8679546f36883ddd80800dd957bd332c4a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 640 Local 627 Mirrors 0 Missed 13 Current 175 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 177 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 178 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 179 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 180 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 181 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 183 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 184 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 185 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 190 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 191 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_package_setscene)
NOTE: Running setscene task 198 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-decorator-5.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-backcall-0.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 199 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-backcall-0.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 200 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-backcall-0.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 201 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 204 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 206 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 207 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 208 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 211 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-parso-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 212 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-backcall-0.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pexpect-4.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 213 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 217 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 218 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 220 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pexpect-4.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 221 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe python3-parso-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 226 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 227 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 228 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb:do_packagedata_setscene)
NOTE: recipe python3-backcall-0.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 232 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 233 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 234 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_package_setscene)
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 240 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygments_2.16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-asttokens-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pure-eval-0.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-executing-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 241 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.39.bb:do_packagedata_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ptyprocess-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_rpm_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-executing/2.0.0/temp/log.do_packagedata_setscene.2559964
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 242 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb:do_package_setscene)
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 243 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygments_2.16.1.bb:do_package_write_deb_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-asttokens/2.4.0/temp/log.do_packagedata_setscene.2559937
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 244 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb:do_package_setscene)
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 245 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygments_2.16.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 246 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pure-eval-0.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygments_2.16.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 251 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 252 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pickleshare-0.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pexpect-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ptyprocess-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-traitlets-5.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 266 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_setscene: Started
NOTE: recipe python3-asttokens-2.4.0-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_setscene: Started
NOTE: recipe python3-ipython-genutils-0.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-executing-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-prompt-toolkit-3.0.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 270 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-traitlets-5.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 271 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 273 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.16.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygments_2.16.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_package_setscene)
NOTE: recipe python3-ipython-genutils-0.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-traitlets-5.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-decorator-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-asttokens-2.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 425 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-executing-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 433 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-asttokens-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-executing-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 457 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-asttokens-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-executing-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 460 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 461 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 462 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 475 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-ipython-8.17.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 503 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 545 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-jedi-0.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jedi-0.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1009 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 667 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1204 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jedi-0.19.1-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 815 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2038 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_packagedata)
NOTE: Running task 2184 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb:do_packagedata)
NOTE: Running task 2185 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb:do_packagedata)
NOTE: Running task 2201 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-jedi-0.19.1-r0: task do_packagedata: Started
NOTE: recipe python3-executing-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-asttokens-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jedi-0.19.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2243 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_create_spdx)
NOTE: recipe python3-executing-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_package_write_ipk)
NOTE: recipe python3-asttokens-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_package_write_deb)
NOTE: Running task 2246 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb:do_package_write_rpm)
NOTE: Running task 2247 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_package_write_ipk)
NOTE: Running task 2248 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_package_write_deb)
NOTE: Running task 2249 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb:do_package_write_rpm)
NOTE: Running task 2250 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_package_write_ipk)
NOTE: recipe python3-jedi-0.19.1-r0: task do_create_spdx: Started
NOTE: Running task 2251 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_package_write_deb)
NOTE: Running task 2252 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_package_write_rpm)
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2253 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_package_qa)
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_qa: Started
NOTE: recipe python3-jedi-0.19.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2254 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-ipython-8.17.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-ipython-8.17.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-stack-data-0.6.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ipython-8.17.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jedi-0.19.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2255 of 2255 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2255 tasks of which 2236 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-src went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-executing went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-executing-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-dbg went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-staticdev went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-dev went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-doc went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens-locale went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asttokens went backwards which would break package feeds (from 0:2.4.1-r0 to 0:2.4.0-r0) [version-going-backwards]
ERROR: python3-asttokens-2.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2626490484461766419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ipython (sysroot):
  /usr/lib/python3.11/site-packages/ipython-8.16.1.dist-info moved to /usr/lib/python3.11/site-packages/ipython-8.17.2.dist-info

--===============2626490484461766419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ipython-upgrade-8.16.1-8.17.2.patch"

RnJvbSAwMjhmZjk4YjgyYzU1MmZmZDlmZTY1MjQ1YTJlZjliZDQ1ODA2NmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjowNjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaXB5dGhvbjogdXBncmFkZSA4LjE2LjEgLT4gOC4xNy4yCgotLS0KIC4uLi97cHl0aG9u
My1pcHl0aG9uXzguMTYuMS5iYiA9PiBweXRob24zLWlweXRob25fOC4xNy4yLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWlweXRob25fOC4x
Ni4xLmJiID0+IHB5dGhvbjMtaXB5dGhvbl84LjE3LjIuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pcHl0aG9uXzguMTYu
MS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXB5dGhv
bl84LjE3LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pcHl0aG9uXzguMTYuMS5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pcHl0aG9uXzgu
MTcuMi5iYgppbmRleCBmYmE3OTdhZTQuLjEzNGEzNThiZiAxMDA2NDQKLS0tIGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pcHl0aG9uXzguMTYuMS5iYgorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlweXRob25fOC4x
Ny4yLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
LnJzdDttZDU9NTliMjAyNjJiODY2M2NkZDA5NDAwNWJkZGY0N2FmNWYiCiAKIFBZUElfUEFDS0FH
RSA9ICJpcHl0aG9uIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWQ1MmY1OGZjYThmOWY4NDhl
MjU2YzYyOWVmZjg4OGVmYzA1MjhjMTJmZTBmOGVjMTRmMzMyMDVmMjNlZjkzOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIxMjZiYjU3ZTE4OTU1OTRiYjBkOTFlYTMwOTBiYmQzOTM4NGY2ZmU4N2Mz
ZDU3ZmQ1NThkMDY3MGY1MDMzOWJiIgogCiBSREVQRU5EUzoke1BOfSA9ICJcCiAgICAgJHtQWVRI
T05fUE59LXNldHVwdG9vbHMgXAotLSAKMi4zOS4yCgo=

--===============2626490484461766419==--

