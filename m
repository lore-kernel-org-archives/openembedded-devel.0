Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741D7C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.62972.1699041165501419489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RuZdEZaz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kRcjrh0d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bec93e-a2591359-c13d-4c5f-bc0c-a41cf253f78b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2PVhswZOOd5fz/wdcPcDTkpB6VtHc/xYKqmGNvvvY/I=;
	b=RuZdEZazWB9ct7K2L7s3yFZHCuJYWHGzlhD8G23tVfvRTL69RRsn9og2GKSPGbH4
	SxQWrvI+YX5065YYkqBptZNssfhIx8zEhs2H4QtVOSIL9OT/mU6voqYkfYgMDJgn6QY
	bpUnP6IohyqisOeiJbpdamMTXJtwGtuJV2VQ5Urs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2PVhswZOOd5fz/wdcPcDTkpB6VtHc/xYKqmGNvvvY/I=;
	b=kRcjrh0d9gwu8BxAvyCeSXYEs43KF+ICmIlgzpcyKEsjSHG8w7EiTef6gJIlacGn
	6QuraitVFo6ByuvGTBWxUPaIQdNIO9efTw8+bBO2c5xC4xuU4lMUS2av3D2cE982iAB
	N/AyNW0vF0YUDeRk0r/VlK13wQsAEJw4QLJQ516U=
Content-Type: multipart/mixed; boundary="===============4880143805750991265=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] hddtemp: upgrading to 15 FAILED
Message-ID: <0101018b96bec93e-a2591359-c13d-4c5f-bc0c-a41cf253f78b-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105937

--===============4880143805750991265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hddtemp* to *15* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-hddtemp-upgrade-0.3-beta15-15.patch
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
From a216a81c8f6f2ce67d92b12d556882ef1f105c88 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:07:24 +0000
Subject: [PATCH] hddtemp: upgrade 0.3-beta15 -> 15

---
 .../hddtemp/{hddtemp_0.3-beta15.bb => hddtemp_15.bb}           | 3 ---
 1 file changed, 3 deletions(-)
 rename meta-oe/recipes-support/hddtemp/{hddtemp_0.3-beta15.bb => hddtemp_15.bb} (94%)

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_15.bb
similarity index 94%
rename from meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
rename to meta-oe/recipes-support/hddtemp/hddtemp_15.bb
index e9d30977f..853d29add 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_15.bb
@@ -2,8 +2,6 @@ SUMMARY = "Hard disk temperature monitor daemon"
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 
-PR = "r1"
-
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-no-nls-support.patch \
            file://hddtemp_0.3-beta15-52.diff \
@@ -15,7 +13,6 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://init \
 "
 
-SRC_URI[md5sum] = "8b829339e1ae9df701684ec239021bb8"
 SRC_URI[sha256sum] = "618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b"
 
 LIC_FILES_CHKSUM = "file://GPL-2;md5=eb723b61539feef013de476e68b5c50a"
-- 
2.39.2


--===============4880143805750991265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4956 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:62099c6a6813c19ebebbfb5a4054239713973b83"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 144 Local 133 Mirrors 0 Missed 11 Current 165 (92% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 213 of 309 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_create_spdx_setscene)
NOTE: recipe hddtemp-15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-native-0.22-r0: task do_create_spdx_setscene: Started
NOTE: recipe hddtemp-15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 384 of 928 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_fetch)
NOTE: recipe gettext-native-0.22-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe hddtemp-15-r0: task do_fetch: Started
NOTE: recipe hddtemp-15-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 928 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_unpack)
NOTE: Running task 911 of 928 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_prepare_recipe_sysroot)
NOTE: recipe hddtemp-15-r0: task do_unpack: Started
NOTE: recipe hddtemp-15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe hddtemp-15-r0: task do_unpack: Succeeded
NOTE: Running task 912 of 928 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_patch)
NOTE: Running task 913 of 928 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_collect_spdx_deps)
NOTE: recipe hddtemp-15-r0: task do_patch: Started
NOTE: recipe hddtemp-15-r0: task do_collect_spdx_deps: Started
NOTE: recipe hddtemp-15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe hddtemp-15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe hddtemp-15-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 913 tasks of which 908 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130706.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130706.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: hddtemp-15-r0 do_patch: Applying patch 'hddtemp-no-nls-support.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/hddtemp/15/hddtemp-15'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/hddtemp/15/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch hddtemp-no-nls-support.patch
can't find file to patch at input line 6
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Upstream-Status: Pending
|
|diff -ru hddtemp-0.3-beta15.orig/configure.in hddtemp-0.3-beta15/configure.in
|--- hddtemp-0.3-beta15.orig/configure.in\t2005-10-17 20:14:19.000000000 +0100
|+++ hddtemp-0.3-beta15/configure.in\t2008-06-27 00:00:46.000000000 +0100
--------------------------
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
can't find file to patch at input line 26
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -ru hddtemp-0.3-beta15.orig/src/hddtemp.c hddtemp-0.3-beta15/src/hddtemp.c
|--- hddtemp-0.3-beta15.orig/src/hddtemp.c\t2006-04-19 03:37:35.000000000 +0100
|+++ hddtemp-0.3-beta15/src/hddtemp.c\t2008-06-26 23:59:40.000000000 +0100
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 42
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -ru hddtemp-0.3-beta15.orig/src/utf8.c hddtemp-0.3-beta15/src/utf8.c
|--- hddtemp-0.3-beta15.orig/src/utf8.c\t2006-04-19 03:37:02.000000000 +0100
|+++ hddtemp-0.3-beta15/src/utf8.c\t2008-06-27 00:02:15.000000000 +0100
--------------------------
No file to patch.  Skipping patch.
3 out of 3 hunks ignored
Patch hddtemp-no-nls-support.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/hddtemp/15/temp/log.do_patch.357557
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/hddtemp/hddtemp_15.bb:do_patch) failed with exit code '1'

--===============4880143805750991265==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hddtemp-upgrade-0.3-beta15-15.patch"

RnJvbSBhMjE2YTgxYzhmNmYyY2U2N2Q5MmIxMmQ1NTY4ODJlZjFmMTA1Yzg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzowNzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhk
ZHRlbXA6IHVwZ3JhZGUgMC4zLWJldGExNSAtPiAxNQoKLS0tCiAuLi4vaGRkdGVtcC97aGRkdGVt
cF8wLjMtYmV0YTE1LmJiID0+IGhkZHRlbXBfMTUuYmJ9ICAgICAgICAgICB8IDMgLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9oZGR0ZW1wL3toZGR0ZW1wXzAuMy1iZXRhMTUuYmIgPT4gaGRkdGVtcF8xNS5iYn0gKDk0JSkK
CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9oZGR0ZW1wL2hkZHRlbXBfMC4z
LWJldGExNS5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2hkZHRlbXAvaGRkdGVtcF8xNS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9oZGR0ZW1wL2hkZHRlbXBfMC4zLWJldGExNS5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvaGRkdGVtcC9oZGR0ZW1wXzE1LmJiCmluZGV4IGU5ZDMwOTc3Zi4uODUzZDI5YWRk
IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9oZGR0ZW1wL2hkZHRlbXBfMC4z
LWJldGExNS5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9oZGR0ZW1wL2hkZHRlbXBf
MTUuYmIKQEAgLTIsOCArMiw2IEBAIFNVTU1BUlkgPSAiSGFyZCBkaXNrIHRlbXBlcmF0dXJlIG1v
bml0b3IgZGFlbW9uIgogU0VDVElPTiA9ICJjb25zb2xlL25ldHdvcmsiCiBMSUNFTlNFID0gIkdQ
TC0yLjAtb3ItbGF0ZXIiCiAKLVBSID0gInIxIgotCiBTUkNfVVJJID0gIiR7U0FWQU5OQUhfTk9O
R05VX01JUlJPUn0vaGRkdGVtcC9oZGR0ZW1wLTAuMy1iZXRhMTUudGFyLmJ6MiBcCiAgICAgICAg
ICAgIGZpbGU6Ly9oZGR0ZW1wLW5vLW5scy1zdXBwb3J0LnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovL2hkZHRlbXBfMC4zLWJldGExNS01Mi5kaWZmIFwKQEAgLTE1LDcgKzEzLDYgQEAgU1JDX1VS
SSA9ICIke1NBVkFOTkFIX05PTkdOVV9NSVJST1J9L2hkZHRlbXAvaGRkdGVtcC0wLjMtYmV0YTE1
LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vaW5pdCBcCiAiCiAKLVNSQ19VUklbbWQ1c3Vt
XSA9ICI4YjgyOTMzOWUxYWU5ZGY3MDE2ODRlYzIzOTAyMWJiOCIKIFNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI2MTg1NDE1ODQwNTQwOTNkNTNiZThhMmQ5ZTgxYzk3MTc0ZjMwZjAwYWY5MWNiODcwMGE5
N2U0NDJkNzllZjViIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9HUEwtMjttZDU9ZWI3
MjNiNjE1MzlmZWVmMDEzZGU0NzZlNjhiNWM1MGEiCi0tIAoyLjM5LjIKCg==

--===============4880143805750991265==--

