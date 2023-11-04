Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF8C04A95
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4715.1699074743234143654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VkAFW568;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xq6m2quu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b98bf1821-05ce0b69-da4c-41aa-856e-702c56dda6f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o5uAvaE0IvEQPg4Nu28Sf1aCiEypz5c5xdg5xoORHUk=;
	b=VkAFW568pgrKGuA3yfgZkHOmqs7M5qAUEEa6BWtWrsrH4LiGQ8zw9iwz3uoTCDa2
	u2cyDEo+BXSv4qSM5douNondgoZz1G8Ceqdabj5STeuhmwvM8o0WBu0HSbr1aoBShfp
	Rjzb8iO7QVtph2hvomTuazqhHeG40iTD3SmnapDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o5uAvaE0IvEQPg4Nu28Sf1aCiEypz5c5xdg5xoORHUk=;
	b=Xq6m2quuMorxMRg24C9hjnY3FiCz2/hc1dsTh9Hk9xSjZnEe7OIsg/vHWjBFXdUc
	u0lr+jBBtONipLx/C2RLSnmdyAJmNrhlphiM8G5f99jHBj3dmzeyqcNm1XrEbJ8xakl
	FlyRQdgEg3SZ1jQ04eRFiVBS6W6lTFm9M1+sCwtA=
Content-Type: multipart/mixed; boundary="===============5877885181442307847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] librest: upgrading to 0.9.1 FAILED
Message-ID: <0101018b98bf1821-05ce0b69-da4c-41aa-856e-702c56dda6f2-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106293

--===============5877885181442307847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librest* to *0.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-librest-upgrade-0.8.1-0.9.1.patch
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
From f52b986de9c9a4f7f9c1cdfa90d6dadd6c712808 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:47:37 +0000
Subject: [PATCH] librest: upgrade 0.8.1 -> 0.9.1

---
 .../recipes-gnome/rest/{librest_0.8.1.bb => librest_0.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/rest/{librest_0.8.1.bb => librest_0.9.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
rename to meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
index 23849783c..0dd739863 100644
--- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
@@ -17,7 +17,7 @@ inherit gnomebase gobject-introspection vala pkgconfig
 
 GNOMEBN = "rest"
 
-SRC_URI[archive.sha256sum] = "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
+SRC_URI[archive.sha256sum] = "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 # * gnome environment requires libsoup build with in gnome PACKAGECONFIG
-- 
2.39.2


--===============5877885181442307847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4901 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:723ad3a64f67ec6f210cc32fff47a327fa278c78"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 270 Local 261 Mirrors 0 Missed 9 Current 320 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 329 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 331 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 590 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librest-0.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe librest-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-native-2023.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librest-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librest-0.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-native-2023.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librest-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librest-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 590 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1298 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe librest-0.9.1-r0: task do_fetch: Started
NOTE: recipe librest-0.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1664 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_unpack)
NOTE: Running task 1665 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librest-0.9.1-r0: task do_unpack: Started
NOTE: recipe librest-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librest-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_patch)
NOTE: Running task 1667 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_collect_spdx_deps)
NOTE: recipe librest-0.9.1-r0: task do_patch: Started
NOTE: recipe librest-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librest-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librest-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librest-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_configure)
NOTE: recipe librest-0.9.1-r0: task do_configure: Started
NOTE: recipe librest-0.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1671 of 1682 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_compile)
NOTE: recipe librest-0.9.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069:193 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 193
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 177
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 172
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 167
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 162
| 	#6: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069, line 206
NOTE: recipe librest-0.9.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1671 tasks of which 1664 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104044716.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104044716.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: librest-0.9.1-r0 do_compile: oe_runmake failed
ERROR: librest-0.9.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/run.do_compile.1534069', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/librest/0.9.1/temp/log.do_compile.1534069
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb:do_compile) failed with exit code '1'

--===============5877885181442307847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librest-upgrade-0.8.1-0.9.1.patch"

RnJvbSBmNTJiOTg2ZGU5YzlhNGY3ZjljMWNkZmE5MGQ2ZGFkZDZjNzEyODA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo0NzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJlc3Q6IHVwZ3JhZGUgMC44LjEgLT4gMC45LjEKCi0tLQogLi4uL3JlY2lwZXMtZ25vbWUvcmVz
dC97bGlicmVzdF8wLjguMS5iYiA9PiBsaWJyZXN0XzAuOS4xLmJifSAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1nbm9t
ZS9yZWNpcGVzLWdub21lL3Jlc3Qve2xpYnJlc3RfMC44LjEuYmIgPT4gbGlicmVzdF8wLjkuMS5i
Yn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvcmVzdC9saWJy
ZXN0XzAuOC4xLmJiIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL3Jlc3QvbGlicmVzdF8wLjku
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLWdub21lL3JlY2lwZXMt
Z25vbWUvcmVzdC9saWJyZXN0XzAuOC4xLmJiCnJlbmFtZSB0byBtZXRhLWdub21lL3JlY2lwZXMt
Z25vbWUvcmVzdC9saWJyZXN0XzAuOS4xLmJiCmluZGV4IDIzODQ5NzgzYy4uMGRkNzM5ODYzIDEw
MDY0NAotLS0gYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvcmVzdC9saWJyZXN0XzAuOC4xLmJi
CisrKyBiL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9yZXN0L2xpYnJlc3RfMC45LjEuYmIKQEAg
LTE3LDcgKzE3LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZh
bGEgcGtnY29uZmlnCiAKIEdOT01FQk4gPSAicmVzdCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiMDUxM2FhZDM4ZTVkM2NlZGQ0YWUzYzU1MTYzNGUzYmUxYjliYWFhNzk3NzVlNTNi
MmRiYTk0NTZmMTViMDFjOSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjkyNjZhNWMx
MGVjZTM4M2UxOTNkZmI3ZmZiMDdiNTA5Y2MxZjUxNTIxYWI4ZGFkNzZhZjk2ZWQxNDIxMmMyZTMi
CiAKIFMgPSAiJHtXT1JLRElSfS8ke0dOT01FQk59LSR7UFZ9IgogIyAqIGdub21lIGVudmlyb25t
ZW50IHJlcXVpcmVzIGxpYnNvdXAgYnVpbGQgd2l0aCBpbiBnbm9tZSBQQUNLQUdFQ09ORklHCi0t
IAoyLjM5LjIKCg==

--===============5877885181442307847==--

