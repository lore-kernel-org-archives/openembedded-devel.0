Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA201C001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2157.1691221142304308119
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Lq8sU5P1;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B779E0004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221140;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=vdGNoxQYtMvLoU3HhrcG+yf5Kfs6qw4R9Ak/dSB2Bzg=;
	b=Lq8sU5P1i2XfdBZqjLaLtTEhX3lAqKWgJJPrcH4OkiBeLBMTPlcUhnabsByT1nSfYGERBB
	nEPzhjSrsyWFi3POqBSKqYfOce3Qe7UyV6ZE84QQib7BU4pKfKYa9FE+9TItZtBTaMuEnJ
	XZSv8M+uuHgu5LsMBU1KMTTV/dpThI9E/DGsVaQgdQjK3oxHZhCUXLs0NWqgUYpzpiTlA0
	d5gPrwq8VJ+eAaDEiYwRDLbpK2f4ZbwbM79Xo1vjROA8u8CbbGKFZ5oXbWhWi3rE02HoQO
	5B7vT7QAWfUa4JgIYiO+c7CQNXgcLPkMDc7YybulLKcuUMQd/pVXl7iBTsN6Cg==
Content-Type: multipart/mixed; boundary="===============0079502179868400576=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-kmod: upgrading to 0.9.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104251
Message-Id: <20230805073909.BA201C001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============0079502179868400576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-kmod* to *0.9.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-kmod-upgrade-0.9.1-0.9.2.patch
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
From 50924aca16468673c658125b8b08be51a02c27d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:07:00 -0500
Subject: [PATCH] python3-kmod: upgrade 0.9.1 -> 0.9.2

---
 .../python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
index 2ec4d474b..acb8bac3b 100644
--- a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
+SRC_URI[sha256sum] = "4ddc73391a9937690f4ca5d8ededf679fae8e212d057fe40cfbb76fc63b5b03e"
 
 DEPENDS += " \
     kmod \
-- 
2.25.1


--===============0079502179868400576==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-kmod-upgrade-0.9.1-0.9.2.patch"

From 50924aca16468673c658125b8b08be51a02c27d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:07:00 -0500
Subject: [PATCH] python3-kmod: upgrade 0.9.1 -> 0.9.2

---
 .../python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kmod_0.9.1.bb => python3-kmod_0.9.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
index 2ec4d474b..acb8bac3b 100644
--- a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
+SRC_URI[sha256sum] = "4ddc73391a9937690f4ca5d8ededf679fae8e212d057fe40cfbb76fc63b5b03e"
 
 DEPENDS += " \
     kmod \
-- 
2.25.1


--===============0079502179868400576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12684 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12618 targets, 325 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a881ee5dd2847b5b7ee9bff363241139fe0535da"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a881ee5dd2847b5b7ee9bff363241139fe0535da"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:a881ee5dd2847b5b7ee9bff363241139fe0535da"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 331 Local 146 Mirrors 175 Missed 10 Current 280 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1313 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_recipe_qa)
NOTE: recipe python3-kmod-0.9.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1711 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_fetch)
NOTE: recipe python3-kmod-0.9.2-r0: task do_fetch: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_fetch: Succeeded
NOTE: Running task 1712 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_unpack)
NOTE: Running task 1713 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-kmod-0.9.2-r0: task do_unpack: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1714 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_patch)
NOTE: Running task 1715 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-kmod-0.9.2-r0: task do_patch: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-kmod-0.9.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-kmod-0.9.2-r0: task do_patch: Succeeded
NOTE: Running task 1716 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1717 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_populate_lic)
NOTE: recipe python3-kmod-0.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_populate_lic: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-kmod-0.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1718 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_configure)
NOTE: recipe python3-kmod-0.9.2-r0: task do_configure: Started
NOTE: recipe python3-kmod-0.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1719 of 1728 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile)
NOTE: recipe python3-kmod-0.9.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2-r0/kmod-0.9.2/setup.py", line 28, in <module>
|     m.Extension.__dict__ = m._Extension.__dict__
|     ^^^^^^^^^^^^^^^^^^^^
| AttributeError: attribute '__dict__' of 'type' objects is not writable
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-kmod-0.9.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1719 tasks of which 1709 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-kmod-0.9.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-kmod-0.9.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2-r0/temp/run.do_compile.3419651', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-kmod/0.9.2-r0/temp/log.do_compile.3419651
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-kmod_0.9.2.bb:do_compile) failed with exit code '1'

--===============0079502179868400576==--

