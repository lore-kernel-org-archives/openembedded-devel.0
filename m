Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65416EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.970.1689139866623837009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=fp2acCEb;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01A6FFF802
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139865;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=XSuThyHmcY6tfD2FokMlyEbHnzg3yuH/hPQd4jGV1r4=;
	b=fp2acCEb5sI9+5CSLSn1J7ErusCMFq6FJ/cmkTknZDvvtlHcCo5Rm3WtFs5lDzO71tqDqc
	R3RLLGx0a0KcN7wKlrXO5gmq/MF6k1HlLJOElGmN8VJxiWrjUdVgsHEyrTkz5LqhDT9Ak9
	SFrc+/ZUy5L12V2jEuN2UItvrYQFNj5ZBSSMAfM/jNGad6UXegCrT6L61ySItzhCwLJnyd
	y8NokZsPEWBHgqFT6xnuJ0AfvEhtdghHiKqmmofDzizdOspYJrIdrDk3Ux7/3NS871G/r+
	8MBb7oupjQ7Jo4Lcmu8hwhLkFzO6oN+7uv7umZXqrt1Vz6PIRs/8JPR4Iijacg==
Content-Type: multipart/mixed; boundary="===============6919306985431467551=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-parse: upgrading to 1.19.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103784
Message-Id: <20230712053110.65416EB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:10 +0000 (UTC)

--===============6919306985431467551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-parse* to *1.19.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-parse-upgrade-1.19.0-1.19.1.patch
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
From 4c5556ff95d207b2c09fc431b6b1deb7dcaca8da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:50:19 -0500
Subject: [PATCH] python3-parse: upgrade 1.19.0 -> 1.19.1

---
 .../python/{python3-parse_1.19.0.bb => python3-parse_1.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.19.0.bb => python3-parse_1.19.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
index 94c1b53c9..384cd14d2 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b"
+SRC_URI[sha256sum] = "cc3a47236ff05da377617ddefa867b7ba983819c664e1afe46249e5b469be464"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============6919306985431467551==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-parse-upgrade-1.19.0-1.19.1.patch"

From 4c5556ff95d207b2c09fc431b6b1deb7dcaca8da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:50:19 -0500
Subject: [PATCH] python3-parse: upgrade 1.19.0 -> 1.19.1

---
 .../python/{python3-parse_1.19.0.bb => python3-parse_1.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.19.0.bb => python3-parse_1.19.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
index 94c1b53c9..384cd14d2 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b"
+SRC_URI[sha256sum] = "cc3a47236ff05da377617ddefa867b7ba983819c664e1afe46249e5b469be464"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


--===============6919306985431467551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12741 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:455f01864a4466293664d0222e2b986f7afd39ee"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:455f01864a4466293664d0222e2b986f7afd39ee"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:455f01864a4466293664d0222e2b986f7afd39ee"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 289 Local 9 Mirrors 272 Missed 8 Current 191 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 200 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-parse-1.19.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-parse-1.19.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1028 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_fetch)
NOTE: recipe python3-parse-1.19.1-r0: task do_fetch: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_unpack)
NOTE: Running task 1667 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-parse-1.19.1-r0: task do_unpack: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_patch)
NOTE: Running task 1669 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-parse-1.19.1-r0: task do_patch: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-parse-1.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-parse-1.19.1-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_configure)
NOTE: recipe python3-parse-1.19.1-r0: task do_configure: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_configure_ptest_base)
NOTE: recipe python3-parse-1.19.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-parse-1.19.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1674 of 1685 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_compile)
NOTE: recipe python3-parse-1.19.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-parse/1.19.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-parse/1.19.1-r0/parse-1.19.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-parse-1.19.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1674 tasks of which 1666 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-parse-1.19.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-parse-1.19.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-parse/1.19.1-r0/temp/run.do_compile.1322849', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-parse/1.19.1-r0/temp/log.do_compile.1322849
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb:do_compile) failed with exit code '1'

--===============6919306985431467551==--

