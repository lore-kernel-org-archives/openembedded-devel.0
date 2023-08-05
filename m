Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF528C0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2169.1691221166906011970
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=pD5MT6yx;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C03D1C0007
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221165;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=ch21OugqeEihcv5wEmvJMIXH8qYK4dRPNESncZ06/28=;
	b=pD5MT6yxB9Q7iWHy35+IcmXK320hxtEL/4OrMqn2cz+OACEV80fedEE1c6NbjkvQ764m4g
	3iZdm7RAOCEeSPI7fkuYwarWWDEkGi2pymrH53Te5chgS3lDiRpfyFjLgwq5xQ91H2GshO
	T3oC9wIfKJXPOFuNXyNTlSTuTsJ3ECE7eAQihqgTsmW9x66S7LcptqsSvCQGlFnWAfQqIn
	ygSU0XRP4CtWQhb4Os2I7XFvLCAjtRBdYyj1Uo1g19pFzZFcDP7tp5LMQXwj5IOFwaIRFJ
	IVTvtdpfw+UHU0chgnwi05DCiansTgzIwG7J16KmyfcW7m1zpbV9+HCOg5l8kA==
Content-Type: multipart/mixed; boundary="===============1544468044256886145=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pymisp: upgrading to 2.4.174 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104265
Message-Id: <20230805073929.AF528C0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:29 +0000 (UTC)

--===============1544468044256886145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pymisp* to *2.4.174* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pymisp-upgrade-2.4.173-2.4.174.patch
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
From 80318c098dbfbeb1463813bc55de5880269fad10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:22:42 -0500
Subject: [PATCH] python3-pymisp: upgrade 2.4.173 -> 2.4.174

---
 .../{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
index 10cc52a7e..d6ab0d6a8 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
+SRCREV = "94983c01ecced6086df28133a38a297111534142"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


--===============1544468044256886145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm64.txt"

Loading cache...done.
Loaded 12702 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12615 targets, 396 skipped, 0 masked, 0 errors.
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
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux-musl"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 490 Local 119 Mirrors 310 Missed 61 Current 342 (87% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 443 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 495 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 832 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 832 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 832 (virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 832 (virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 562 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_recipe_qa)
NOTE: Running task 585 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_recipe_qa)
NOTE: Running task 590 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_recipe_qa)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_recipe_qa: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_recipe_qa: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 671 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 673 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 676 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 678 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: recipe python3-requests-2.31.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 680 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 681 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: Running task 683 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 685 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: Running task 687 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_fetch)
NOTE: Running task 688 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_fetch)
NOTE: Running task 689 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_fetch)
NOTE: Running task 690 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 692 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 694 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_fetch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: Running setscene task 773 of 832 (virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: Running task 698 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 702 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_fetch: Started
NOTE: Running task 703 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 704 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: Running task 708 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_unpack)
NOTE: Running task 709 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 710 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 711 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_unpack)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 712 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 713 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_unpack)
NOTE: Running task 714 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 788 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_unpack)
NOTE: Running task 1179 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_patch)
NOTE: Running task 1183 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_patch)
NOTE: Running task 1184 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1194 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 1207 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1210 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 1214 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: Running task 1215 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1216 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1217 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_patch)
NOTE: Running task 1218 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 789 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_unpack: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-cryptography-41.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_patch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1433 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: Running task 1436 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: Running task 1449 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1455 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: Running task 1456 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1458 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1461 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1462 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-41.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1463 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 832 (/home/auh/Projects/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1501 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_patch)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_patch: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_deploy_source_date_epoch)
NOTE: Running task 1512 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_populate_lic)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_lic: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_lic: Succeeded
NOTE: Running task 2043 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2073 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2074 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2075 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2112 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2129 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_fetch)
NOTE: Running task 2149 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2177 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2206 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2210 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2211 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2212 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2213 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2214 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2263 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2264 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_unpack)
NOTE: Running task 2266 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2267 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2269 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_patch)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_patch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_configure)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2294 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_configure)
NOTE: Running task 2295 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_configure: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 2298 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_configure)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_configure: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_compile)
NOTE: Running task 2300 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_configure: Started
NOTE: Running task 2302 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_compile)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_compile: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_compile: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2306 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2308 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: Running task 2309 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: Running task 2312 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_compile: Started
NOTE: Running task 2313 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_configure)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2315 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_configure: Started
NOTE: Running task 2317 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_configure_ptest_base)
NOTE: Running task 2319 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: Running task 2320 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2322 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_compile: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_compile: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 2325 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_install)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 2329 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_compile: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 2330 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_install)
NOTE: Running task 2331 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_compile_ptest_base)
NOTE: Running task 2332 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2333 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_package)
NOTE: recipe python3-urllib3-2.0.4-r0: task do_install: Started
NOTE: Running task 2334 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_install)
NOTE: Running task 2336 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_install)
NOTE: Running task 2338 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_package)
NOTE: Running task 2341 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_populate_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2342 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_package)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_package)
NOTE: Running task 2345 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 2347 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_package)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_package: Started
NOTE: Running task 2348 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_install)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2350 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 2353 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2355 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_packagedata)
NOTE: Running task 2357 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_packagedata)
NOTE: Running task 2361 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_packagedata)
NOTE: Running task 2362 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: Running task 2363 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: Running task 2365 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: Running task 2366 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: Running task 2367 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: Running task 2368 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_packagedata)
NOTE: Running task 2369 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: Running task 2370 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 2371 of 2388 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_create_spdx)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_packagedata: Started
NOTE: Running task 2372 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_create_spdx)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_create_spdx: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx: Started
NOTE: Running task 2373 of 2388 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pymisp-2.4.174-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2373 tasks of which 2213 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

Summary: 1 task failed:
  /home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/cortexa57-poky-linux/python3-chardet/5.1.0-r0/temp/log.do_packagedata.3664597
ERROR: Task (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata) failed with exit code '1'

--===============1544468044256886145==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pymisp-upgrade-2.4.173-2.4.174.patch"

From 80318c098dbfbeb1463813bc55de5880269fad10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:22:42 -0500
Subject: [PATCH] python3-pymisp: upgrade 2.4.173 -> 2.4.174

---
 .../{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
index 10cc52a7e..d6ab0d6a8 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
+SRCREV = "94983c01ecced6086df28133a38a297111534142"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


--===============1544468044256886145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 12702 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12615 targets, 384 skipped, 0 masked, 0 errors.
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
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:1dbbf2116cb472890a49e364873c1c1b27697e6a"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 510 Local 155 Mirrors 333 Missed 22 Current 359 (95% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 459 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 461 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 463 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 470 of 869 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 869 (/home/auh/Projects/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 556 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_recipe_qa)
NOTE: Running task 581 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_recipe_qa)
NOTE: Running task 587 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_recipe_qa)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_recipe_qa: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_recipe_qa: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 755 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 760 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1297 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_fetch)
NOTE: Running task 1322 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_fetch)
NOTE: Running task 1330 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_fetch)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /scratch1/auh/build-auh/tmp/work/core2-32-poky-linux-musl/python3-chardet/5.1.0-r0/temp/log.do_packagedata_setscene.3668096
WARNING: Setscene task (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 771 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package_setscene)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_fetch: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_fetch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1450 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata_setscene)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_unpack: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1456 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_patch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_unpack)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1458 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_unpack)
NOTE: Running setscene task 800 of 869 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_unpack: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_patch)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1540 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_patch)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_patch: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_populate_lic)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_lic: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2140 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2161 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2175 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2301 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_collect_spdx_deps)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2424 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2430 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_collect_spdx_deps)
NOTE: Running task 2434 of 2486 (/home/auh/Projects/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_configure)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2463 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_configure)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2464 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_configure)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_configure: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_configure: Succeeded
NOTE: recipe python3-deprecated-1.2.14-r0: task do_configure: Started
NOTE: Running task 2465 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_compile)
NOTE: Running task 2466 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_compile)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_configure: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_compile: Started
NOTE: Running task 2467 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_compile)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_compile: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_compile: Succeeded
NOTE: Running task 2468 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_install)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_install)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_install: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_install: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_package)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_install: Succeeded
NOTE: Running task 2471 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_package)
NOTE: Running task 2472 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_populate_sysroot)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_install)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_install: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_package)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package: Succeeded
NOTE: Running task 2475 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_packagedata)
NOTE: recipe python3-deprecated-1.2.14-r0: task do_packagedata: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_packagedata)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_packagedata: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_create_spdx)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_create_spdx)
NOTE: Running task 2479 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_packagedata)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_create_spdx: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_create_spdx: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_create_spdx)
NOTE: Running task 2481 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb:do_package_write_rpm)
NOTE: Running task 2482 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb:do_package_write_rpm)
NOTE: Running task 2483 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_package_write_rpm)
NOTE: Running task 2484 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_package_qa)
NOTE: recipe python3-wrapt-1.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package_qa: Started
NOTE: recipe python3-wrapt-1.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2485 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_create_runtime_spdx)
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-deprecated-1.2.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wrapt-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pymisp-2.4.174-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2486 of 2486 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb:do_build)
NOTE: Tasks Summary: Attempted 2486 tasks of which 2438 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:5.2.0-r0 to 0:5.1.0-r0) [version-going-backwards]
ERROR: python3-chardet-5.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1544468044256886145==--

