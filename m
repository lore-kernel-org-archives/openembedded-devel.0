Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5140C4708E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.62980.1699041166512237170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f4AoEdQK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GslMahpq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bef90e-731cfeda-6fb9-43df-bbf3-2a50c855fe11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eAHAYXHuhCVnfklkssd2doK3kuUAsOVDKNoPBEIARD0=;
	b=f4AoEdQKnO66zNYlOqRTVKprmjrCvLu8ZOeHSRIhZue7XaQTpGkpBOwZffz0dbUT
	rXO5EW4USRnD8nsNYRoD3Rv/YxWXn/ErePseEWrZ69Fw/lHK8McbFcnNpPF4h1SbdfW
	aJ+sIO83N7SqRfZbVyQ5ULHxMRWz7kSpqvp9RYio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eAHAYXHuhCVnfklkssd2doK3kuUAsOVDKNoPBEIARD0=;
	b=GslMahpqxzEERosZ0DGQAFdNsFAKVANRX/MabwQEAOp3xrcMcNSDH9s8//RLtOB1
	8944Zh5HdmHL2FwtbJI+NAt2FZ0xrKTJLcjWdzvpWt+B5fTq/3OR1+q8LrM68Z+gkAk
	rHfOHqV9dplHF6yWCDKIFDVNaE60TXjZVA5ICaM0=
Content-Type: multipart/mixed; boundary="===============8087478040198212394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] yad: upgrading to 13.0 FAILED
Message-ID: <0101018b96bef90e-731cfeda-6fb9-43df-bbf3-2a50c855fe11-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106045

--===============8087478040198212394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *yad* to *13.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-yad-upgrade-6.0-13.0.patch
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
From e94d202cfc8345c81946ebdbc2634c7bed30bb98 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:41:15 +0000
Subject: [PATCH] yad: upgrade 6.0 -> 13.0

---
 meta-oe/recipes-graphics/yad/{yad_6.0.bb => yad_13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/yad/{yad_6.0.bb => yad_13.0.bb} (90%)

diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-graphics/yad/yad_13.0.bb
similarity index 90%
rename from meta-oe/recipes-graphics/yad/yad_6.0.bb
rename to meta-oe/recipes-graphics/yad/yad_13.0.bb
index 9e46215fd..032cad13f 100644
--- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_13.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://github.com/v1cont/yad.git;branch=master;protocol=https"
-SRCREV = "a5b1a7a3867bc7dffbbc539f586f301687b6ec02"
+SRCREV = "fbfb0fafb06fad14b5ddc2d7a9a3064022ee41b4"
 
 inherit autotools gsettings features_check pkgconfig
 
-- 
2.39.2


--===============8087478040198212394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5078 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a70e0e5b7103d12e3c3a73c319118f87e7615aae"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 540 Local 539 Mirrors 0 Missed 1 Current 490 (99% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_create_runtime_spdx_setscene)
NOTE: Running setscene task 493 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 494 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 495 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 497 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe yad-13.0-r0: task do_create_runtime_spdx_setscene: Started
NOTE: recipe yad-13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe yad-13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe yad-13.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe yad-13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe yad-13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe yad-13.0-r0: task do_create_runtime_spdx_setscene: Succeeded
NOTE: recipe yad-13.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 641 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_create_spdx_setscene)
NOTE: recipe yad-13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe yad-13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe yad-13.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe yad-13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe yad-13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe yad-13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_packagedata_setscene)
NOTE: recipe yad-13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe yad-13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_setscene)
NOTE: recipe yad-13.0-r0: task do_package_setscene: Started
NOTE: recipe yad-13.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1016 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe yad-13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe yad-13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1030 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2806 of 2809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_qa)
NOTE: recipe yad-13.0-r0: task do_package_qa: Started
WARNING: yad-13.0-r0 do_package_qa: QA Issue: File /usr/bin/yad-settings in package yad contains reference to TMPDIR [buildpaths]
NOTE: recipe yad-13.0-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2808 tasks of which 2807 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103194054.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103194054.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_qa
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: yad-13.0-r0 do_package_qa: QA Issue: /usr/bin/yad-settings contained in package yad requires /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/env, but no providers found in RDEPENDS:yad? [file-rdeps]
ERROR: yad-13.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yad/13.0/temp/log.do_package_qa.2668367
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/yad/yad_13.0.bb:do_package_qa) failed with exit code '1'

--===============8087478040198212394==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-yad-upgrade-6.0-13.0.patch"

RnJvbSBlOTRkMjAyY2ZjODM0NWM4MTk0NmViZGJjMjYzNGM3YmVkMzBiYjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTo0MToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHlh
ZDogdXBncmFkZSA2LjAgLT4gMTMuMAoKLS0tCiBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MveWFk
L3t5YWRfNi4wLmJiID0+IHlhZF8xMy4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGlj
cy95YWQve3lhZF82LjAuYmIgPT4geWFkXzEzLjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3lhZC95YWRfNi4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWdy
YXBoaWNzL3lhZC95YWRfMTMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBt
ZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MveWFkL3lhZF82LjAuYmIKcmVuYW1lIHRvIG1ldGEtb2Uv
cmVjaXBlcy1ncmFwaGljcy95YWQveWFkXzEzLjAuYmIKaW5kZXggOWU0NjIxNWZkLi4wMzJjYWQx
M2YgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy95YWQveWFkXzYuMC5iYgor
KysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MveWFkL3lhZF8xMy4wLmJiCkBAIC01LDcgKzUs
NyBAQCBMSUNFTlNFID0gIkdQTC0zLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0IgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vdjFjb250L3lhZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyIKLVNSQ1JFViA9ICJhNWIxYTdhMzg2N2JjN2RmZmJiYzUzOWY1ODZmMzAxNjg3YjZl
YzAyIgorU1JDUkVWID0gImZiZmIwZmFmYjA2ZmFkMTRiNWRkYzJkN2E5YTMwNjQwMjJlZTQxYjQi
CiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdzZXR0aW5ncyBmZWF0dXJlc19jaGVjayBwa2djb25maWcK
IAotLSAKMi4zOS4yCgo=

--===============8087478040198212394==--

