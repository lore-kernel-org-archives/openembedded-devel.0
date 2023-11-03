Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1CCC10DCE
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.62971.1699041165185365512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cHsHglrW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gGw5GRam;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bebba0-6c14e0fd-2808-4699-9411-20fd0ff80be9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VSfPXoTzCGkHHeFB+/8vl3A1SOA0fJJ3UbXNDHuqJYE=;
	b=cHsHglrWT0+H1D8KiFsQBP9SUcSAmOP+I+c0vWtv/58ZfBr9VkDr1a7geLsib83d
	Xj5lg3Ogp+/wbgZmhNMWSK5W2HRYBcEtpnLuodYie9TqLUKyEv+S0pO4zFaczUa6iXs
	jhERpgv8x5towtg7+qUUt2dRvWsDsAb0OCG+6B8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VSfPXoTzCGkHHeFB+/8vl3A1SOA0fJJ3UbXNDHuqJYE=;
	b=gGw5GRamHSsLqjIJ8POypkhZnkNB11c/AMfKSZ1xlCoA6vbXBIlSdU5iifkk0TLm
	hNMnbrdkYcKCRsZ92d1XsZwB2Ytd3hzq2smI8BbRDknNPMD+b7nKZf+CI/+XZyXITzw
	iPujmWl6/SS23n/jquaYksT5wkFiJg1Dg2sAEk8s=
Content-Type: multipart/mixed; boundary="===============8895542369815081088=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] botan: upgrading to 3.2.0 FAILED
Message-ID: <0101018b96bebba0-6c14e0fd-2808-4699-9411-20fd0ff80be9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105879

--===============8895542369815081088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *botan* to *3.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-botan-upgrade-2.19.3-3.2.0.patch
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
From 7f941fc50eaa7957b4ee6a5d20463bdb22dd3e1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:36:07 +0000
Subject: [PATCH] botan: upgrade 2.19.3 -> 3.2.0

---
 .../botan/{botan_2.19.3.bb => botan_3.2.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.3.bb => botan_3.2.0.bb} (60%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.3.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
similarity index 60%
rename from meta-oe/recipes-crypto/botan/botan_2.19.3.bb
rename to meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 8d9d423ce..2c426993a 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -1,11 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- license.txt
+# +++ license.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 1999-2022 The Botan Authors
+# +Copyright (C) 1999-2023 The Botan Authors
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
+LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
+SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.39.2


--===============8895542369815081088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4891 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e41f5cf73d4ce5d79301b64d31a5b3391fb32ca7"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 328 Local 319 Mirrors 0 Missed 9 Current 264 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 273 of 592 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 275 of 592 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 592 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe botan-3.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe botan-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe botan-3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe botan-3.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 511 of 592 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe botan-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe botan-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1334 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_fetch)
NOTE: recipe botan-3.2.0-r0: task do_fetch: Started
NOTE: recipe botan-3.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1656 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_unpack)
NOTE: Running task 1657 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe botan-3.2.0-r0: task do_unpack: Started
NOTE: recipe botan-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe botan-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe botan-3.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_patch)
NOTE: Running task 1659 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_collect_spdx_deps)
NOTE: recipe botan-3.2.0-r0: task do_patch: Started
NOTE: recipe botan-3.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe botan-3.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe botan-3.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1661 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_configure)
NOTE: recipe botan-3.2.0-r0: task do_configure: Started
NOTE: recipe botan-3.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1663 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_compile)
NOTE: recipe botan-3.2.0-r0: task do_compile: Started
NOTE: recipe botan-3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 1674 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_install)
NOTE: recipe botan-3.2.0-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot'
 ]
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'patch-native', 'pseudo-native', 'python3-native', 'xz-native', 'libtool-native', 'attr-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'openssl-native', 'libnsl2-native', 'gdbm-native', 'zlib-native', 'libtirpc-native', 'bzip2-native', 'libffi-native', 'libedit-native', 'sqlite3-native', 'libmpc-native', 'linux-libc-headers', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'zstd-native', 'gmp-native', 'mpfr-native', 'gnu-config-native', 'flex-native', 'libgcc', 'gettext-minimal-native', 'cmake-native', 'perl-native', 'm4-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 52 install
| "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/recipe-sysroot-native/usr/bin/python3-native/python3" "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/Botan-3.2.0/src/scripts/install.py" --build-dir="/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/Botan-3.2.0/build"
|    INFO: Botan 3.2.0 installation to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/image/usr complete
| sed: can't read /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/image/usr/lib/pkgconfig/botan-2.pc: No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/temp/run.do_install.3958457:152 exit 2 from 'sed -i -e "s|/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/image||g" /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/image/usr/lib/pkgconfig/botan-2.pc'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/temp/run.do_install.3958457, line 152
| 	#2: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/temp/run.do_install.3958457, line 191
NOTE: recipe botan-3.2.0-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1664 tasks of which 1656 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103113350.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103113350.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: botan-3.2.0-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/temp/run.do_install.3958457', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/botan/3.2.0/temp/log.do_install.3958457
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.2.0.bb:do_install) failed with exit code '1'

--===============8895542369815081088==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-botan-upgrade-2.19.3-3.2.0.patch"

RnJvbSA3Zjk0MWZjNTBlYWE3OTU3YjRlZTZhNWQyMDQ2M2JkYjIyZGQzZTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTozNjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJv
dGFuOiB1cGdyYWRlIDIuMTkuMyAtPiAzLjIuMAoKLS0tCiAuLi4vYm90YW4ve2JvdGFuXzIuMTku
My5iYiA9PiBib3Rhbl8zLjIuMC5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLW9l
L3JlY2lwZXMtY3J5cHRvL2JvdGFuL3tib3Rhbl8yLjE5LjMuYmIgPT4gYm90YW5fMy4yLjAuYmJ9
ICg2MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNyeXB0by9ib3Rhbi9ib3Rhbl8y
LjE5LjMuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2JvdGFuL2JvdGFuXzMuMi4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggNjAlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1jcnlwdG8vYm90
YW4vYm90YW5fMi4xOS4zLmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2JvdGFu
L2JvdGFuXzMuMi4wLmJiCmluZGV4IDhkOWQ0MjNjZS4uMmM0MjY5OTNhIDEwMDY0NAotLS0gYS9t
ZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2JvdGFuL2JvdGFuXzIuMTkuMy5iYgorKysgYi9tZXRhLW9l
L3JlY2lwZXMtY3J5cHRvL2JvdGFuL2JvdGFuXzMuMi4wLmJiCkBAIC0xLDExICsxLDMwIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gbGljZW5zZS50eHQKKyMgKysrIGxpY2Vuc2UudHh0CisjIEBA
IC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChDKSAxOTk5LTIwMjIgVGhlIEJvdGFuIEF1dGhv
cnMKKyMgK0NvcHlyaWdodCAoQykgMTk5OS0yMDIzIFRoZSBCb3RhbiBBdXRob3JzCisjICBBbGwg
cmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJj
ZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisKIFNVTU1BUlkgPSAi
Q3J5cHRvIGFuZCBUTFMgZm9yIEMrKzExIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9ib3Rhbi5yYW5k
b21iaXQubmV0IgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9saWNlbnNlLnR4dDttZDU9ZjRjZTk4NDc2YzA3YzM0ZTE3OTNkYWEwMzY5NjBmYWQi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLnR4dDttZDU9ZjUyNTRkM2FiZTkw
ZWM1YmI4MmM1Njk0ZmY3NTE1NDYiCiBTRUNUSU9OID0gImxpYnMiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9ib3Rhbi5yYW5kb21iaXQubmV0L3JlbGVhc2VzL0JvdGFuLSR7UFZ9LnRhci54eiIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJkYWUwNDdmMzk5YzVhNDdmMDg3ZGI1ZDNkOWQ5ZThmMTFhZTQ5
ODVkMTRjOTI4ZDcxZGExYWZmODAxODAyZDU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA0OWM4
NDc4MzVmY2Y2ZWYzYTllMjA2YjMzZGUwNWRkMzg5OTljMzI1ZTI0NzQ4Mjc3MmE1NTk4ZDllNWVj
ZTMiCiAKIFMgPSAiJHtXT1JLRElSfS9Cb3Rhbi0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============8895542369815081088==--

