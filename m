Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD7FC07548
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2202.1699061894460360985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f6aR+kDl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QPPa3xkL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb1be8-857365ee-3962-448b-b142-92f185cf2135-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P/EV1deZlVVBm4pz1NvmWeAap7HSfkBoXpNmYsSi4rM=;
	b=f6aR+kDl0zumafgGUdwpUeqS4i1p3eVpvg20+alik4bIq8d3Dxcdw/7Hsl6sh0Ui
	FH1LEurham9b26vk/qLQJEVwaidv+hTMsWlcLhXZCEErAPHo6vDunOznRBVF/NvbjhU
	49tRpyubFg6PvxDCM/L0WHg1sZlKsXeiRYNFGmsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061898;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P/EV1deZlVVBm4pz1NvmWeAap7HSfkBoXpNmYsSi4rM=;
	b=QPPa3xkLd8MU+dIzcR3I5HiAygwWj6jCtcyLd33PrYTlBdi0C0qi5lBbwUjM2e+p
	N/zj/FMIRn+hSYG5LGDynPLtPDEV4w4QrxtYYUHTJbS0c6/w+varU+oaCS6D9DN7vE/
	SMH8Su/srvqJZDFTQ1Vj7CjyY6EpqB0XBw57+iTg=
Content-Type: multipart/mixed; boundary="===============4288473105984904512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-virtualenv: upgrading to 20.24.6 SUCCEEDED
Message-ID: <0101018b97fb1be8-857365ee-3962-448b-b142-92f185cf2135-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106176

--===============4288473105984904512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-virtualenv* to *20.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-virtualenv-upgrade-20.24.5-20.24.6.patch
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
From e8eff403881d5e63ea10733f07237a477a4526ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:06:49 +0000
Subject: [PATCH] python3-virtualenv: upgrade 20.24.5 -> 20.24.6

---
 ...hon3-virtualenv_20.24.5.bb => python3-virtualenv_20.24.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.5.bb => python3-virtualenv_20.24.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb
index d05c7f492..aa11534f7 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.5.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "e8361967f6da6fbdf1426483bfe9fca8287c242ac0bc30429905721cefbff752"
+SRC_URI[sha256sum] = "02ece4f56fbf939dbbc33c0715159951d6bf14aaf5457b092e4548e1382455af"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.39.2


--===============4288473105984904512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-virtualenv-upgrade-20.24.5-20.24.6.patch"

RnJvbSBlOGVmZjQwMzg4MWQ1ZTYzZWExMDczM2YwNzIzN2E0NzdhNDUyNmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTowNjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdmlydHVhbGVudjogdXBncmFkZSAyMC4yNC41IC0+IDIwLjI0LjYKCi0tLQogLi4uaG9u
My12aXJ0dWFsZW52XzIwLjI0LjUuYmIgPT4gcHl0aG9uMy12aXJ0dWFsZW52XzIwLjI0LjYuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmlydHVh
bGVudl8yMC4yNC41LmJiID0+IHB5dGhvbjMtdmlydHVhbGVudl8yMC4yNC42LmJifSAoODUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dmlydHVhbGVudl8yMC4yNC41LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy12aXJ0dWFsZW52XzIwLjI0LjYuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVu
YW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12aXJ0
dWFsZW52XzIwLjI0LjUuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdmlydHVhbGVudl8yMC4yNC42LmJiCmluZGV4IGQwNWM3ZjQ5Mi4uYWEx
MTUzNGY3IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXZpcnR1YWxlbnZfMjAuMjQuNS5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXZpcnR1YWxlbnZfMjAuMjQuNi5iYgpAQCAtNiw3ICs2LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdmlydHVhbGVudiIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MGNlMDg5
MTU4Y2Y2MGE4YWI2YWJiNDUyYjY0MDU1MzgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlODM2
MTk2N2Y2ZGE2ZmJkZjE0MjY0ODNiZmU5ZmNhODI4N2MyNDJhYzBiYzMwNDI5OTA1NzIxY2VmYmZm
NzUyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAyZWNlNGY1NmZiZjkzOWRiYmMzM2MwNzE1MTU5
OTUxZDZiZjE0YWFmNTQ1N2IwOTJlNDU0OGUxMzgyNDU1YWYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCi0tIAoyLjM5
LjIKCg==

--===============4288473105984904512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-virtualenv: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/virtualenv/virtualenv-20.24.5.tar.gz;downloadfilename=virtualenv-20.24.5.tar.gz" to "https://files.pythonhosted.org/packages/source/v/virtualenv/virtualenv-20.24.6.tar.gz;downloadfilename=virtualenv-20.24.6.tar.gz"
packages/core2-64-poky-linux/python3-virtualenv: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-dbg: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-dbg: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-dev: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-dev: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-doc: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-doc: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-locale: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-locale: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-src: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-src: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-staticdev: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv-staticdev: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv: FILELIST: directory renamed /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info/licenses -> /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info -> /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info, removed "/usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.2.1-py3-none-any.whl /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.0-py3-none-any.whl", added "/usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.3.1-py3-none-any.whl /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.2-py3-none-any.whl"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv: PV changed from "20.24.5" to "20.24.6"
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv: PKGV changed from 20.24.5 [default] to 20.24.6 [default]
packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv: PKGSIZE changed from 4442723 to 4463923 (+0%)
Changes to packages/core2-64-poky-linux/python3-virtualenv (sysroot):
  /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info moved to /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info
  /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.2.1-py3-none-any.whl moved to /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.3.1-py3-none-any.whl
  /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.0-py3-none-any.whl moved to /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.2-py3-none-any.whl

--===============4288473105984904512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4967 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 62 recipes from the qemux86_64 sysroot...done.
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
meta-webserver       = "tmp-auh-upgrades:159625fb3d73c4ee30a9222ee2b733432db04f5a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 576 Local 567 Mirrors 0 Missed 9 Current 175 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 177 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 178 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 182 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 183 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 184 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 186 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 188 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 189 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 194 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 196 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 204 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 205 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 207 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 300 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-distlib-0.3.7-r0: task do_package_write_ipk_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-filelock/3.12.4/temp/log.do_packagedata_setscene.31365
NOTE: Running setscene task 308 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 309 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-covdefaults-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-appdirs-1.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-cov-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-distlib-0.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-covdefaults-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 317 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 318 of 751 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-appdirs-1.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-cov-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe python3-platformdirs-3.11.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytest-mock/3.11.1/temp/log.do_packagedata_setscene.31683
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 340 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb:do_package_setscene)
NOTE: Running setscene task 341 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_package_setscene)
NOTE: Running setscene task 358 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 361 of 751 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-hatchling-native-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 464 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 466 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-filelock-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 493 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 500 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-filelock-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-filelock-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 998 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_fetch)
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 566 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_fetch: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-filelock-3.12.4-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1015 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-filelock-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 599 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 751 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1946 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_packagedata)
NOTE: Running task 2092 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb:do_packagedata)
NOTE: Running task 2104 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-filelock-3.12.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2116 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_package_write_ipk)
NOTE: recipe python3-filelock-3.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2117 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_create_spdx)
NOTE: recipe python3-pytest-mock-3.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2118 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_package_write_deb)
NOTE: Running task 2119 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb:do_package_write_rpm)
NOTE: Running task 2123 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_package_write_ipk)
NOTE: Running task 2124 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_package_write_deb)
NOTE: Running task 2125 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_package_write_rpm)
NOTE: Running task 2126 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_package_qa)
NOTE: recipe python3-filelock-3.12.4-r0: task do_create_spdx: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_qa: Started
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-filelock-3.12.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2127 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_create_runtime_spdx)
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-filelock-3.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-virtualenv-20.24.6-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2128 of 2128 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-virtualenv_20.24.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2128 tasks of which 2113 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-src went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-dbg went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-staticdev went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-dev went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-doc went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock-locale went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-filelock went backwards which would break package feeds (from 0:3.13.1-r0 to 0:3.12.4-r0) [version-going-backwards]
ERROR: python3-filelock-3.12.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-src went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-dbg went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-ptest went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-staticdev went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-dev went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-doc went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock-locale went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-mock went backwards which would break package feeds (from 0:3.12.0-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-pytest-mock-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4288473105984904512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-virtualenv/python3-virtualenv: FILELIST: directory renamed /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info/licenses -> /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info -> /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info, removed "/usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.0-py3-none-any.whl /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.2.1-py3-none-any.whl", added "/usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.2-py3-none-any.whl /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.3.1-py3-none-any.whl"
Changes to packages/core2-64-poky-linux/python3-virtualenv (sysroot):
  /usr/lib/python3.11/site-packages/virtualenv-20.24.5.dist-info moved to /usr/lib/python3.11/site-packages/virtualenv-20.24.6.dist-info
  /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.2.1-py3-none-any.whl moved to /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/pip-23.3.1-py3-none-any.whl
  /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.0-py3-none-any.whl moved to /usr/lib/python3.11/site-packages/virtualenv/seed/wheels/embed/setuptools-68.2.2-py3-none-any.whl

--===============4288473105984904512==--

