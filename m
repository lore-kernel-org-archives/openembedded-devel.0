Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171FEC169C3
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63872.1699041166191524446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tl91T0Uw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OZ3XuzlX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bed281-8b7a1724-4236-43f5-b6b0-b1a6bbcb57f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hXaKiYT5Rkyeat1oSeQAZqzb1Xv2l19WfizVCK4d9ik=;
	b=Tl91T0Uw7LtVh1guF5AG+8r0DThPC9nMpbZWkJkVklhr1I5XZrg9hVbWf6rrM8ze
	jzVni0oZU1jpPQc8Sei5sLHzp5sZcb3oDeSsDlaWPOmsSIg4aiEQTxP1U5KXMq4kBr0
	Dvly8G6DQoDU0BzG7Uew0F9r0s03w+c02vvqbMXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hXaKiYT5Rkyeat1oSeQAZqzb1Xv2l19WfizVCK4d9ik=;
	b=OZ3XuzlXeHeuUx6DfQF4inrtG/Xe0AD7fvrvUNRFliEHCXZ/iSWycg0KuCCgjMtG
	A1+gy0Wc6a8yetdNb7CyLMd58OZxqZkco0i5paqdy1MarTMzBwSTfe1I4eYqCGEkij7
	v+LDtKyCOdPDxNsezbSTkz+1uscD3zmoO2L/yjQ0=
Content-Type: multipart/mixed; boundary="===============4999075265089375746=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mercurial: upgrading to 6.5rc0 FAILED
Message-ID: <0101018b96bed281-8b7a1724-4236-43f5-b6b0-b1a6bbcb57f6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105989

--===============4999075265089375746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mercurial* to *6.5rc0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mercurial-upgrade-6.1-6.5rc0.patch
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
From a195f9cb20636979f7201c0bdc16983c2db336d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 15:36:41 +0000
Subject: [PATCH] mercurial: upgrade 6.1 -> 6.5rc0

---
 .../mercurial/{mercurial_6.1.bb => mercurial_6.5rc0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_6.1.bb => mercurial_6.5rc0.bb} (91%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb
similarity index 91%
rename from meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb
index a415ebc1e..2fddbc3f0 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "86f98645e4565a9256991dcde22b77b8e7d22ca6fbb60c1f4cdbd8469a38cc1f"
+SRC_URI[sha256sum] = "ca802c472f3d66ec5f8ea512ed03e240b30d3923ca28710d3ae91c9a67ad0feb"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.39.2


--===============4999075265089375746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4997 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:9f92f09884280ad85a26d2a50240d20884d37aa9"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 348 Local 340 Mirrors 0 Missed 8 Current 245 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 255 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe mercurial-6.5rc0-r0: task do_populate_lic_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mercurial-6.5rc0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe mercurial-6.5rc0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 458 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mercurial-6.5rc0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_fetch: Succeeded
NOTE: Running task 468 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mercurial-6.5rc0-r0: task do_unpack: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_patch)
NOTE: recipe mercurial-6.5rc0-r0: task do_patch: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 593 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1659 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_collect_spdx_deps)
NOTE: recipe mercurial-6.5rc0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_configure)
NOTE: recipe mercurial-6.5rc0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mercurial-6.5rc0-r0: task do_configure: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_compile)
NOTE: recipe mercurial-6.5rc0-r0: task do_compile: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_install)
NOTE: recipe mercurial-6.5rc0-r0: task do_install: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_install: Succeeded
NOTE: Running task 1666 of 1675 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_package)
NOTE: recipe mercurial-6.5rc0-r0: task do_package: Started
NOTE: recipe mercurial-6.5rc0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1667 tasks of which 1658 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103153430.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103153430.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mercurial-6.5rc0-r0 do_package: QA Issue: mercurial: Files/directories were installed but not shipped in any package:
  /usr/share
  /usr/share/bash-completion
  /usr/share/zsh
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/hg
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_hg
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
mercurial: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: mercurial-6.5rc0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/mercurial/6.5rc0/temp/log.do_package.1603812
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/mercurial/mercurial_6.5rc0.bb:do_package) failed with exit code '1'

--===============4999075265089375746==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mercurial-upgrade-6.1-6.5rc0.patch"

RnJvbSBhMTk1ZjljYjIwNjM2OTc5ZjcyMDFjMGJkYzE2OTgzYzJkYjMzNmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNTozNjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
cmN1cmlhbDogdXBncmFkZSA2LjEgLT4gNi41cmMwCgotLS0KIC4uLi9tZXJjdXJpYWwve21lcmN1
cmlhbF82LjEuYmIgPT4gbWVyY3VyaWFsXzYuNXJjMC5iYn0gICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9tZXJjdXJpYWwve21lcmN1cmlhbF82LjEuYmIgPT4gbWVyY3VyaWFs
XzYuNXJjMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
bWVyY3VyaWFsL21lcmN1cmlhbF82LjEuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbWVy
Y3VyaWFsL21lcmN1cmlhbF82LjVyYzAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL21lcmN1cmlhbC9tZXJjdXJpYWxfNi4xLmJiCnJl
bmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbWVyY3VyaWFsL21lcmN1cmlhbF82LjVy
YzAuYmIKaW5kZXggYTQxNWViYzFlLi4yZmRkYmMzZjAgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9tZXJjdXJpYWwvbWVyY3VyaWFsXzYuMS5iYgorKysgYi9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVyY3VyaWFsL21lcmN1cmlhbF82LjVyYzAuYmIKQEAgLTEwLDcgKzEw
LDcgQEAgUkRFUEVORFM6JHtQTn0gPSAicHl0aG9uMyBweXRob24zLW1vZHVsZXMiCiBpbmhlcml0
IHB5dGhvbjNuYXRpdmUgcHl0aG9uM3RhcmdldGNvbmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8v
d3d3Lm1lcmN1cmlhbC1zY20ub3JnL3JlbGVhc2UvJHtCUH0udGFyLmd6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjg2Zjk4NjQ1ZTQ1NjVhOTI1Njk5MWRjZGUyMmI3N2I4ZTdkMjJjYTZmYmI2MGMx
ZjRjZGJkODQ2OWEzOGNjMWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2E4MDJjNDcyZjNkNjZl
YzVmOGVhNTEyZWQwM2UyNDBiMzBkMzkyM2NhMjg3MTBkM2FlOTFjOWE2N2FkMGZlYiIKIAogUyA9
ICIke1dPUktESVJ9L21lcmN1cmlhbC0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============4999075265089375746==--

