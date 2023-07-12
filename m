Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16418C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 07:33:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2127.1689147210103060054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 00:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=MsL0HeIY;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A82F2240005
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689147208;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=b105jgghrIhwzg+3+rAuWFD5nKqhqO3JFLoxHN4P6xw=;
	b=MsL0HeIY/e5+jQ+ygtuqx282LOTEaVJj854y7Hfju8UhckrcaxphswAtDbZQ+r4ZjxKgK6
	hEFhWJ9AJrUwnK2ExfAXHQkAs7CgAw761wSC7wlKinRY5Ftud/pIXw0C9YNGxVBL2yV1qo
	ANecEf9C0MoMHG+DrCh5Zd2Jwee2Na0wp/8N/eED6Kc7DWFrvtOgiFwEXc8BXWnjI1hUF3
	dggPFuYhAcTBINNOfQcmtwtQixfxAyZVEJGxKCzEp9Xpy94j2Ll/XQheDBHPKoWA/eCKQU
	dPys6VQcVAY3FcqtfevLL29Ie9uu7fkoTkLO3k6O8zKxw/AGJ9WWOtSD0DweNg==
Content-Type: multipart/mixed; boundary="===============5871951742961930311=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] po4a: upgrading to 0.69 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103833
Message-Id: <20230712073331.16418C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 07:33:31 +0000 (UTC)

--===============5871951742961930311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *po4a* to *0.69* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-po4a-upgrade-0.49-0.69.patch
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
From 64b109b0f3a4a4ca492e2866e1932bd78765e704 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 02:33:15 -0500
Subject: [PATCH] po4a: upgrade 0.49 -> 0.69

---
 meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.69.bb} (94%)

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.69.bb
similarity index 94%
rename from meta-perl/recipes-perl/po4a/po4a_0.49.bb
rename to meta-perl/recipes-perl/po4a/po4a_0.69.bb
index 679ea0fb4..742ade92d 100644
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ b/meta-perl/recipes-perl/po4a/po4a_0.69.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
 SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
 
 # v0.49
-SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
+SRCREV = "1925f62d0a26c4aa0621ca0cd419f7e84ecae676"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============5871951742961930311==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-po4a-upgrade-0.49-0.69.patch"

From 64b109b0f3a4a4ca492e2866e1932bd78765e704 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 02:33:15 -0500
Subject: [PATCH] po4a: upgrade 0.49 -> 0.69

---
 meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.69.bb} (94%)

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.69.bb
similarity index 94%
rename from meta-perl/recipes-perl/po4a/po4a_0.49.bb
rename to meta-perl/recipes-perl/po4a/po4a_0.69.bb
index 679ea0fb4..742ade92d 100644
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ b/meta-perl/recipes-perl/po4a/po4a_0.69.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
 SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https;branch=master"
 
 # v0.49
-SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
+SRCREV = "1925f62d0a26c4aa0621ca0cd419f7e84ecae676"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============5871951742961930311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12585 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:4f4eb982eb19ace44a29c099f50bdc4da40bb1c6"
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
meta-perl            = "tmp-auh-upgrades:4f4eb982eb19ace44a29c099f50bdc4da40bb1c6"
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
meta-perl            = "tmp-auh-upgrades:4f4eb982eb19ace44a29c099f50bdc4da40bb1c6"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 164 Local 0 Mirrors 154 Missed 10 Current 147 (93% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running task 892 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_fetch)
NOTE: recipe po4a-0.69-r0: task do_fetch: Started
NOTE: recipe po4a-0.69-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_unpack)
NOTE: Running task 1078 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_prepare_recipe_sysroot)
NOTE: recipe po4a-0.69-r0: task do_unpack: Started
NOTE: recipe po4a-0.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe po4a-0.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe po4a-0.69-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_patch)
NOTE: Running task 1080 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_collect_spdx_deps)
NOTE: recipe po4a-0.69-r0: task do_patch: Started
NOTE: recipe po4a-0.69-r0: task do_collect_spdx_deps: Started
NOTE: recipe po4a-0.69-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_deploy_source_date_epoch)
NOTE: Running task 1082 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_populate_lic)
NOTE: recipe po4a-0.69-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe po4a-0.69-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe po4a-0.69-r0: task do_populate_lic: Started
NOTE: recipe po4a-0.69-r0: task do_populate_lic: Succeeded
NOTE: recipe po4a-0.69-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1083 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_configure)
NOTE: recipe po4a-0.69-r0: task do_configure: Started
NOTE: recipe po4a-0.69-r0: task do_configure: Succeeded
NOTE: Running task 1084 of 1093 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_compile)
NOTE: recipe po4a-0.69-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Cwd.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Time/HiRes.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: List/Util.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Data/Dumper.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Data/Dumper.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Data/Dumper.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Fcntl.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/File/Glob.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: File/Glob.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/File/Glob.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Encode.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Storable.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| Copying lib/Locale/Po4a/AsciiDoc.pm -> blib/lib/Locale/Po4a/AsciiDoc.pm
| Copying lib/Locale/Po4a/BibTeX.pm -> blib/lib/Locale/Po4a/BibTeX.pm
| Copying lib/Locale/Po4a/Chooser.pm -> blib/lib/Locale/Po4a/Chooser.pm
| Copying lib/Locale/Po4a/Common.pm -> blib/lib/Locale/Po4a/Common.pm
| Copying lib/Locale/Po4a/Dia.pm -> blib/lib/Locale/Po4a/Dia.pm
| Copying lib/Locale/Po4a/Docbook.pm -> blib/lib/Locale/Po4a/Docbook.pm
| Copying lib/Locale/Po4a/Guide.pm -> blib/lib/Locale/Po4a/Guide.pm
| Copying lib/Locale/Po4a/Halibut.pm -> blib/lib/Locale/Po4a/Halibut.pm
| Copying lib/Locale/Po4a/InProgress/Debconf.pm -> blib/lib/Locale/Po4a/InProgress/Debconf.pm
| Copying lib/Locale/Po4a/InProgress/NewsDebian.pm -> blib/lib/Locale/Po4a/InProgress/NewsDebian.pm
| Copying lib/Locale/Po4a/Ini.pm -> blib/lib/Locale/Po4a/Ini.pm
| Copying lib/Locale/Po4a/KernelHelp.pm -> blib/lib/Locale/Po4a/KernelHelp.pm
| Copying lib/Locale/Po4a/LaTeX.pm -> blib/lib/Locale/Po4a/LaTeX.pm
| Copying lib/Locale/Po4a/Man.pm -> blib/lib/Locale/Po4a/Man.pm
| Copying lib/Locale/Po4a/Po.pm -> blib/lib/Locale/Po4a/Po.pm
| Copying lib/Locale/Po4a/Pod.pm -> blib/lib/Locale/Po4a/Pod.pm
| Copying lib/Locale/Po4a/RubyDoc.pm -> blib/lib/Locale/Po4a/RubyDoc.pm
| Copying lib/Locale/Po4a/Sgml.pm -> blib/lib/Locale/Po4a/Sgml.pm
| Copying lib/Locale/Po4a/TeX.pm -> blib/lib/Locale/Po4a/TeX.pm
| Copying lib/Locale/Po4a/Texinfo.pm -> blib/lib/Locale/Po4a/Texinfo.pm
| Copying lib/Locale/Po4a/Text.pm -> blib/lib/Locale/Po4a/Text.pm
| Copying lib/Locale/Po4a/TransTractor.pm -> blib/lib/Locale/Po4a/TransTractor.pm
| Copying lib/Locale/Po4a/Wml.pm -> blib/lib/Locale/Po4a/Wml.pm
| Copying lib/Locale/Po4a/Xhtml.pm -> blib/lib/Locale/Po4a/Xhtml.pm
| Copying lib/Locale/Po4a/Xml.pm -> blib/lib/Locale/Po4a/Xml.pm
| Copying lib/Locale/Po4a/Yaml.pm -> blib/lib/Locale/Po4a/Yaml.pm
| Copying msguntypot -> blib/script/msguntypot
| Copying po4a -> blib/script/po4a
| Copying po4a-gettextize -> blib/script/po4a-gettextize
| Copying po4a-normalize -> blib/script/po4a-normalize
| Copying po4a-translate -> blib/script/po4a-translate
| Copying po4a-updatepo -> blib/script/po4a-updatepo
| Copying scripts/po4a-display-man -> blib/script/po4a-display-man
| Copying scripts/po4a-display-pod -> blib/script/po4a-display-pod
| Manifying blib/script/msguntypot -> blib/bindoc/msguntypot.1
| Manifying blib/script/po4a -> blib/bindoc/po4a.1
| Manifying blib/script/po4a-gettextize -> blib/bindoc/po4a-gettextize.1
| Manifying blib/script/po4a-normalize -> blib/bindoc/po4a-normalize.1
| Manifying blib/script/po4a-translate -> blib/bindoc/po4a-translate.1
| Manifying blib/script/po4a-updatepo -> blib/bindoc/po4a-updatepo.1
| Manifying blib/lib/Locale/Po4a/AsciiDoc.pm -> blib/libdoc/Locale::Po4a::AsciiDoc.3
| Manifying blib/lib/Locale/Po4a/BibTeX.pm -> blib/libdoc/Locale::Po4a::BibTeX.3
| Manifying blib/lib/Locale/Po4a/Chooser.pm -> blib/libdoc/Locale::Po4a::Chooser.3
| Manifying blib/lib/Locale/Po4a/Common.pm -> blib/libdoc/Locale::Po4a::Common.3
| Manifying blib/lib/Locale/Po4a/Dia.pm -> blib/libdoc/Locale::Po4a::Dia.3
| Manifying blib/lib/Locale/Po4a/Docbook.pm -> blib/libdoc/Locale::Po4a::Docbook.3
| Manifying blib/lib/Locale/Po4a/Guide.pm -> blib/libdoc/Locale::Po4a::Guide.3
| Manifying blib/lib/Locale/Po4a/Halibut.pm -> blib/libdoc/Locale::Po4a::Halibut.3
| Manifying blib/lib/Locale/Po4a/InProgress/Debconf.pm -> blib/libdoc/Locale::Po4a::InProgress::Debconf.3
| Manifying blib/lib/Locale/Po4a/InProgress/NewsDebian.pm -> blib/libdoc/Locale::Po4a::InProgress::NewsDebian.3
| Manifying blib/lib/Locale/Po4a/Ini.pm -> blib/libdoc/Locale::Po4a::Ini.3
| Manifying blib/lib/Locale/Po4a/KernelHelp.pm -> blib/libdoc/Locale::Po4a::KernelHelp.3
| Manifying blib/lib/Locale/Po4a/LaTeX.pm -> blib/libdoc/Locale::Po4a::LaTeX.3
| Manifying blib/lib/Locale/Po4a/Man.pm -> blib/libdoc/Locale::Po4a::Man.3
| Manifying blib/lib/Locale/Po4a/Po.pm -> blib/libdoc/Locale::Po4a::Po.3
| Manifying blib/lib/Locale/Po4a/Pod.pm -> blib/libdoc/Locale::Po4a::Pod.3
| Manifying blib/lib/Locale/Po4a/RubyDoc.pm -> blib/libdoc/Locale::Po4a::RubyDoc.3
| Manifying blib/lib/Locale/Po4a/Sgml.pm -> blib/libdoc/Locale::Po4a::Sgml.3
| Manifying blib/lib/Locale/Po4a/TeX.pm -> blib/libdoc/Locale::Po4a::TeX.3
| Manifying blib/lib/Locale/Po4a/Texinfo.pm -> blib/libdoc/Locale::Po4a::Texinfo.3
| Manifying blib/lib/Locale/Po4a/Text.pm -> blib/libdoc/Locale::Po4a::Text.3
| Manifying blib/lib/Locale/Po4a/TransTractor.pm -> blib/libdoc/Locale::Po4a::TransTractor.3
| Manifying blib/lib/Locale/Po4a/Wml.pm -> blib/libdoc/Locale::Po4a::Wml.3
| Manifying blib/lib/Locale/Po4a/Xhtml.pm -> blib/libdoc/Locale::Po4a::Xhtml.3
| Manifying blib/lib/Locale/Po4a/Xml.pm -> blib/libdoc/Locale::Po4a::Xml.3
| Manifying blib/lib/Locale/Po4a/Yaml.pm -> blib/libdoc/Locale::Po4a::Yaml.3
| Converting Pod to HTML with Pod::Html 1.33
| HTMLifying blib/script/msguntypot -> blib/binhtml/bin/msguntypot.html
| P::H::pod2html --title=msguntypot - update PO files when a typo is fixed in POT file --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/msguntypot --outfile=blib/binhtml/bin/msguntypot.tmp --podroot=/usr --header --backlink
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/PerlIO/encoding.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: PerlIO/encoding.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/PerlIO/encoding.pm
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| HTMLifying blib/script/po4a -> blib/binhtml/bin/po4a.html
| P::H::pod2html --title=po4a - update both the PO files and translated documents in one shot --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/po4a --outfile=blib/binhtml/bin/po4a.tmp --podroot=/usr --header --backlink
| HTMLifying blib/script/po4a-gettextize -> blib/binhtml/bin/po4a-gettextize.html
| P::H::pod2html --title=po4a-gettextize --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/po4a-gettextize --outfile=blib/binhtml/bin/po4a-gettextize.tmp --podroot=/usr --header --backlink
| HTMLifying blib/script/po4a-normalize -> blib/binhtml/bin/po4a-normalize.html
| P::H::pod2html --title=po4a-normalize --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/po4a-normalize --outfile=blib/binhtml/bin/po4a-normalize.tmp --podroot=/usr --header --backlink
| HTMLifying blib/script/po4a-translate -> blib/binhtml/bin/po4a-translate.html
| P::H::pod2html --title=po4a-translate --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/po4a-translate --outfile=blib/binhtml/bin/po4a-translate.tmp --podroot=/usr --header --backlink
| HTMLifying blib/script/po4a-updatepo -> blib/binhtml/bin/po4a-updatepo.html
| P::H::pod2html --title=po4a-updatepo --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/script/po4a-updatepo --outfile=blib/binhtml/bin/po4a-updatepo.tmp --podroot=/usr --header --backlink
| Converting Pod to HTML with Pod::Html 1.33
| HTMLifying blib/lib/Locale/Po4a/AsciiDoc.pm -> blib/libhtml/site/lib/Locale/Po4a/AsciiDoc.html
| P::H::pod2html --title=Locale::Po4a::AsciiDoc - convert AsciiDoc documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/AsciiDoc.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/AsciiDoc.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/BibTeX.pm -> blib/libhtml/site/lib/Locale/Po4a/BibTeX.html
| P::H::pod2html --title=Locale::Po4a::BibTeX - convert BibTeX documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/BibTeX.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/BibTeX.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Chooser.pm -> blib/libhtml/site/lib/Locale/Po4a/Chooser.html
| P::H::pod2html --title=Locale::Po4a::Chooser - manage po4a modules --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Chooser.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Chooser.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Common.pm -> blib/libhtml/site/lib/Locale/Po4a/Common.html
| P::H::pod2html --title=Locale::Po4a::Common - common parts of the po4a scripts and utils --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Common.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Common.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Dia.pm -> blib/libhtml/site/lib/Locale/Po4a/Dia.html
| P::H::pod2html --title=Locale::Po4a::Dia - convert uncompressed Dia diagrams from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Dia.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Dia.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Docbook.pm -> blib/libhtml/site/lib/Locale/Po4a/Docbook.html
| P::H::pod2html --title=Locale::Po4a::Docbook - convert DocBook XML documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Docbook.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Docbook.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Guide.pm -> blib/libhtml/site/lib/Locale/Po4a/Guide.html
| P::H::pod2html --title=Locale::Po4a::Guide - convert Guide XML documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Guide.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Guide.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Halibut.pm -> blib/libhtml/site/lib/Locale/Po4a/Halibut.html
| P::H::pod2html --title=Locale::Po4a::Halibut - convert Halibut documents and derivates from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Halibut.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Halibut.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/InProgress/Debconf.pm -> blib/libhtml/site/lib/Locale/Po4a/InProgress/Debconf.html
| P::H::pod2html --title=Locale::Po4a::InProgress::Debconf - convert debconf templates from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/InProgress/Debconf.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/InProgress/Debconf.tmp --podroot=/usr --htmlroot=../../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/InProgress/NewsDebian.pm -> blib/libhtml/site/lib/Locale/Po4a/InProgress/NewsDebian.html
| P::H::pod2html --title=Locale::Po4a::InProgress::NewsDebian - convert NEWS.Debian documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/InProgress/NewsDebian.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/InProgress/NewsDebian.tmp --podroot=/usr --htmlroot=../../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Ini.pm -> blib/libhtml/site/lib/Locale/Po4a/Ini.html
| P::H::pod2html --title=Locale::Po4a::Ini - convert INI files from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Ini.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Ini.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/KernelHelp.pm -> blib/libhtml/site/lib/Locale/Po4a/KernelHelp.html
| P::H::pod2html --title=Locale::Po4a::KernelHelp - convert kernel configuration help from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/KernelHelp.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/KernelHelp.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/LaTeX.pm -> blib/libhtml/site/lib/Locale/Po4a/LaTeX.html
| P::H::pod2html --title=Locale::Po4a::LaTeX - convert LaTeX documents and derivates from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/LaTeX.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/LaTeX.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Man.pm -> blib/libhtml/site/lib/Locale/Po4a/Man.html
| P::H::pod2html --title=Locale::Po4a::Man - convert manual pages from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Man.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Man.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Po.pm -> blib/libhtml/site/lib/Locale/Po4a/Po.html
| P::H::pod2html --title=Locale::Po4a::Po - PO file manipulation module --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Po.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Po.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Pod.pm -> blib/libhtml/site/lib/Locale/Po4a/Pod.html
| P::H::pod2html --title=Locale::Po4a::Pod - convert POD data from/to PO files --podpathUse of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| UTF-8 "\xA0" does not map to Unicode at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/vendor_perl/5.36.1/Module/Build/PodParser.pm line 41, <$fh> line 802.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| Use of uninitialized value $str in substitution (s///) at /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/Pod/Simple/XHTML.pm line 75.
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/B.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: B.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/B.pm
| =bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Pod.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Pod.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/RubyDoc.pm -> blib/libhtml/site/lib/Locale/Po4a/RubyDoc.html
| P::H::pod2html --title=Locale::Po4a::RubyDoc --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/RubyDoc.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/RubyDoc.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Sgml.pm -> blib/libhtml/site/lib/Locale/Po4a/Sgml.html
| P::H::pod2html --title=Locale::Po4a::Sgml - convert SGML documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Sgml.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Sgml.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/TeX.pm -> blib/libhtml/site/lib/Locale/Po4a/TeX.html
| P::H::pod2html --title=Locale::Po4a::TeX - convert TeX documents and derivatives from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/TeX.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/TeX.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Texinfo.pm -> blib/libhtml/site/lib/Locale/Po4a/Texinfo.html
| P::H::pod2html --title=Locale::Po4a::Texinfo - convert Texinfo documents and derivates from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Texinfo.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Texinfo.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Text.pm -> blib/libhtml/site/lib/Locale/Po4a/Text.html
| P::H::pod2html --title=Locale::Po4a::Text - convert text documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Text.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Text.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/TransTractor.pm -> blib/libhtml/site/lib/Locale/Po4a/TransTractor.html
| P::H::pod2html --title=Locale::Po4a::TransTractor - generic trans(lator ex)tractor. --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/TransTractor.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/TransTractor.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Wml.pm -> blib/libhtml/site/lib/Locale/Po4a/Wml.html
| P::H::pod2html --title=Locale::Po4a::Wml - convert WML (web markup language) documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Wml.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Wml.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Xhtml.pm -> blib/libhtml/site/lib/Locale/Po4a/Xhtml.html
| P::H::pod2html --title=Locale::Po4a::Xhtml - convert XHTML documents from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Xhtml.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Xhtml.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Xml.pm -> blib/libhtml/site/lib/Locale/Po4a/Xml.html
| P::H::pod2html --title=Locale::Po4a::Xml - convert XML documents and derivates from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Xml.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Xml.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| HTMLifying blib/lib/Locale/Po4a/Yaml.pm -> blib/libhtml/site/lib/Locale/Po4a/Yaml.html
| P::H::pod2html --title=Locale::Po4a::Yaml - convert YAML files from/to PO files --podpath=bin:/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/git/blib --infile=blib/lib/Locale/Po4a/Yaml.pm --outfile=blib/libhtml/site/lib/Locale/Po4a/Yaml.tmp --podroot=/usr --htmlroot=../.. --header --backlink
| Created META.yml and META.json
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/IO.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: IO.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/IO.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Fcntl.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Cwd.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Time/HiRes.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/POSIX.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: POSIX.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/POSIX.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Encode.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Storable.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Encode/Unicode.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Encode/Unicode.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Encode/Unicode.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: List/Util.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| Unknown format type: pod.
| po4a::chooser: Module loading error: Can't locate Pod/Parser.pm in @INC (you may need to install the Pod::Parser module) (@INC contains: lib /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/site_perl/5.36.1/x86_64-linux /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/site_perl/5.36.1 /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/vendor_perl/5.36.1 /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1 /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native
 /../../../usr/lib/perl5/site_perl/5.36.1/x86_64-linux /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/site_perl/5.36.1 /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/vendor_perl/5.36.1 /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1 /completelyboguspath/perl5/site_perl/5.36.1/x86_64-linux /completelyboguspath/perl5/site_perl/5.36.1 /completelyboguspath/perl5/vendor_perl/5.36.1/x86_64-linux /completelyboguspath/perl5/vendor_perl/5.36.1 /completelyboguspath/perl5/5.36.1/x86_64-linux /completelyboguspath/perl5/5.36.1) at lib/Locale/Po4a/Pod.pm line 14.
| BEGIN failed--compilation aborted at lib/Locale/Po4a/Pod.pm line 14.
| Compilation failed in require at (eval 37) line 1.
| BEGIN failed--compilation aborted at (eval 37) line 1.
| 
| List of valid formats:
|   - asciidoc: AsciiDoc format.
|   - dia: uncompressed Dia diagrams.
|   - docbook: DocBook XML.
|   - guide: Gentoo Linux's XML documentation format.
|   - ini: INI format.
|   - kernelhelp: Help messages of each kernel compilation option.
|   - latex: LaTeX format.
|   - man: Good old manual page format.
|   - pod: Perl Online Documentation format.
|   - rubydoc: Ruby Documentation (RD) format.
|   - sgml: either DebianDoc or DocBook DTD.
|   - texinfo: The info page format.
|   - tex: generic TeX documents (see also latex).
|   - text: simple text document.
|   - wml: WML documents.
|   - xhtml: XHTML documents.
|   - xml: generic XML documents (see also docbook).
|   - yaml: YAML documents.
| Died at Po4aBuilder.pm line 162.
| WARNING: exit code 1 from a shell command.
NOTE: recipe po4a-0.69-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1084 tasks of which 1075 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: po4a-0.69-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/temp/run.do_compile.2048514', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/po4a/0.69-r0/temp/log.do_compile.2048514
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/po4a/po4a_0.69.bb:do_compile) failed with exit code '1'

--===============5871951742961930311==--

