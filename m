Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90B7C07524
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2200.1699061894103646386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IPXiUbXU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JZMjNo06;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb137f-1b8e749c-cc3d-445f-a7d1-1bdebe8f64a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kN/C0hsICukjb/Xi+PvhRHax2zotWPtGehIEQskBrB4=;
	b=IPXiUbXUSqoXIUvFDyoVb0w5C1fNAgLoEM8l3thIT/DGTiDmP7q2ogesZDFFk6oo
	gArZiaXoY7l7JsrVsME3aVgWVoeKX0+87/b7GdgHWVmbA7pVwBjZ/iOWxVpeCbaTxmJ
	KkT0tB8kNXFmxq9uO9Yoo/DIjwhpNH+fh1Dm7/Gc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kN/C0hsICukjb/Xi+PvhRHax2zotWPtGehIEQskBrB4=;
	b=JZMjNo06dbjvxrDS6vT0Z0mXW+llZsLCBUX94h8wUfhwjSPvic/q+XpAKmJSWBox
	SdBhvdM50F+KnbtaippBF7ELyN3xv35i4A4JGjJJM5AB0VcpwrVncGfbnsUijCi6ZCK
	WtJulqksLue5A0B8i81lpcDv4b0jsmBkDwxOW2/Q=
Content-Type: multipart/mixed; boundary="===============1129503204126642072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-networkx: upgrading to 3.2.1 FAILED
Message-ID: <0101018b97fb137f-1b8e749c-cc3d-445f-a7d1-1bdebe8f64a2-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106135

--===============1129503204126642072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-networkx* to *3.2.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-networkx-upgrade-3.1-3.2.1.patch
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
From 4de31a483144c6728821ccc4c5b77f983965cfbe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 22:59:28 +0000
Subject: [PATCH] python3-networkx: upgrade 3.1 -> 3.2.1

---
 .../{python3-networkx_3.1.bb => python3-networkx_3.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.1.bb => python3-networkx_3.2.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb b/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_3.1.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb
index 7158f7b05..23f229e74 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4266362445d56549f7b8973d02e5f22a"
 
-SRC_URI[sha256sum] = "de346335408f84de0eada6ff9fafafff9bcda11f0a0dfaa931133debb146ab61"
+SRC_URI[sha256sum] = "9f1bb5cf3409bf324e0a722c20bdb4c20ee39bf1c30ce8ae499c8502b0b5e0c6"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============1129503204126642072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5011 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:f9f4a419e16baf9bd853b61550ca94f485261dca"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 353 Local 344 Mirrors 0 Missed 9 Current 279 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 281 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 289 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 291 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-networkx-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-decorator-5.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-networkx-3.2.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 629 of 632 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-decorator-5.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-networkx-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1613 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_fetch)
NOTE: recipe python3-networkx-3.2.1-r0: task do_fetch: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_unpack)
NOTE: Running task 1768 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-networkx-3.2.1-r0: task do_unpack: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_patch)
NOTE: Running task 1770 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-networkx-3.2.1-r0: task do_patch: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-networkx-3.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-networkx-3.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_configure)
NOTE: recipe python3-networkx-3.2.1-r0: task do_configure: Started
NOTE: recipe python3-networkx-3.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1785 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_compile)
NOTE: recipe python3-networkx-3.2.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/networkx-3.2.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101, line 184
NOTE: recipe python3-networkx-3.2.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1774 tasks of which 1767 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103225856.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103225856.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-networkx-3.2.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-networkx-3.2.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/run.do_compile.593101', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-networkx/3.2.1/temp/log.do_compile.593101
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-networkx_3.2.1.bb:do_compile) failed with exit code '1'

--===============1129503204126642072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-networkx-upgrade-3.1-3.2.1.patch"

RnJvbSA0ZGUzMWE0ODMxNDRjNjcyODgyMWNjYzRjNWI3N2Y5ODM5NjVjZmJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMjo1OToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbmV0d29ya3g6IHVwZ3JhZGUgMy4xIC0+IDMuMi4xCgotLS0KIC4uLi97cHl0aG9uMy1u
ZXR3b3JreF8zLjEuYmIgPT4gcHl0aG9uMy1uZXR3b3JreF8zLjIuMS5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW5ldHdvcmt4XzMuMS5i
YiA9PiBweXRob24zLW5ldHdvcmt4XzMuMi4xLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbmV0d29ya3hfMy4xLmJiIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1uZXR3b3JreF8zLjIu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW5ldHdvcmt4XzMuMS5iYgpyZW5hbWUgdG8gbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1uZXR3b3JreF8zLjIuMS5iYgpp
bmRleCA3MTU4ZjdiMDUuLjIzZjIyOWU3NCAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1uZXR3b3JreF8zLjEuYmIKKysrIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1uZXR3b3JreF8zLjIuMS5iYgpAQCAt
Myw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL25ldHdvcmt4LmdpdGh1Yi5pby8iCiBMSUNF
TlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT00MjY2MzYyNDQ1ZDU2NTQ5ZjdiODk3M2QwMmU1ZjIyYSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRlMzQ2MzM1NDA4Zjg0ZGUwZWFkYTZmZjlmYWZhZmZmOWJjZGExMWYwYTBkZmFh
OTMxMTMzZGViYjE0NmFiNjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWYxYmI1Y2YzNDA5YmYz
MjRlMGE3MjJjMjBiZGI0YzIwZWUzOWJmMWMzMGNlOGFlNDk5Yzg1MDJiMGI1ZTBjNiIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============1129503204126642072==--

