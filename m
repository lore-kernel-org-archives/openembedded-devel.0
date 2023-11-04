Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CB5C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3567.1699067575555783753
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a/MNAd9w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YAasDNxo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b9851baa8-5fc2768d-bf33-4675-a93a-f5926472cb0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kLfetIfkvI1YqP9eUlA3s5ObuIIrGB+yVfukSE7ULAc=;
	b=a/MNAd9w2+2t8bM8M+f6mIqBFHqcn/ONKxPhY4+bg0uugVJ1p0RZSiyKRTSFx9P/
	VFrh+t83vATw7N2glqKaA049BHcrZdgQ5bdRekFNhrECuAsc8fWQJhohvgUeajngaIs
	TFtIhmLtWNvop72uZ6de4uceiiXKtkYbfWhGitV0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kLfetIfkvI1YqP9eUlA3s5ObuIIrGB+yVfukSE7ULAc=;
	b=YAasDNxoAdWDwkznWhxkOLhXIAW+Q6dhXwVXR/qQVwnueYX0YnYhNpKsd7UQXNqV
	pz9cYFpfvlNqOqfawqfqCzovKi2g4PRq+64f1W6kpTbslnainfQk/o3/TlqKqs/PwOj
	MIUsdsPux3vsv1hb4TjTZKRAVEqLVHr4BWgiIdog=
Content-Type: multipart/mixed; boundary="===============0131184844475946336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ufw: upgrading to 0.36.2 FAILED
Message-ID: <0101018b9851baa8-5fc2768d-bf33-4675-a93a-f5926472cb0c-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106226

--===============0131184844475946336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ufw* to *0.36.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ufw-upgrade-0.36.1-0.36.2.patch
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
From 477f0a0a52ffcd34d9366d57a8b0f48a5c59937b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:59:59 +0000
Subject: [PATCH] ufw: upgrade 0.36.1 -> 0.36.2

---
 .../recipes-connectivity/ufw/{ufw_0.36.1.bb => ufw_0.36.2.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/ufw/{ufw_0.36.1.bb => ufw_0.36.2.bb} (100%)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
rename to meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
-- 
2.39.2


--===============0131184844475946336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ufw-upgrade-0.36.1-0.36.2.patch"

RnJvbSA0NzdmMGEwYTUyZmZjZDM0ZDkzNjZkNTdhOGIwZjQ4YTVjNTk5MzdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjo1OTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVm
dzogdXBncmFkZSAwLjM2LjEgLT4gMC4zNi4yCgotLS0KIC4uLi9yZWNpcGVzLWNvbm5lY3Rpdml0
eS91Zncve3Vmd18wLjM2LjEuYmIgPT4gdWZ3XzAuMzYuMi5iYn0gICAgIHwgMAogMSBmaWxlIGNo
YW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvdWZ3L3t1ZndfMC4zNi4xLmJiID0+IHVmd18wLjM2
LjIuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS91ZncvdWZ3XzAuMzYuMS5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS91ZncvdWZ3XzAuMzYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Vmdy91ZndfMC4zNi4xLmJi
CnJlbmFtZSB0byBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvdWZ3L3Vmd18w
LjM2LjIuYmIKLS0gCjIuMzkuMgoK

--===============0131184844475946336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4913 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ccf1f71a3cd7daf6bad28cc182901f81aea5ad71"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 401 Local 389 Mirrors 0 Missed 12 Current 293 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 318 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ufw-0.36.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ufw-0.36.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 413 of 1947 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_fetch)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ufw-0.36.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ufw-0.36.2-r0: task do_fetch: Succeeded
NOTE: Running task 462 of 1947 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_unpack)
NOTE: recipe ufw-0.36.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.5.7+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ufw-0.36.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1223 of 1947 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_patch)
NOTE: recipe ufw-0.36.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 694 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1765 of 1947 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1916 of 1947 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_collect_spdx_deps)
NOTE: recipe ufw-0.36.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ufw-0.36.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe ufw-0.36.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ufw-0.36.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ufw-0.36.2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1932 tasks of which 1927 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104025940.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104025940.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ufw-0.36.2-r0 do_patch: Applying patch '0001-optimize-boot.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/ufw/0.36.2/ufw-0.36.2'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/ufw/0.36.2/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-optimize-boot.patch
can't find file to patch at input line 26
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 92fcdbc1a57086e4decc1597217c0739dc16342a Mon Sep 17 00:00:00 2001
|From: Silcet <camorga1@gmail.com>
|Date: Tue, 27 Apr 2021 05:34:59 +0000
|Subject: [PATCH] Author: Jamie Strandboge <jamie@canonical.com>
|Description:
|to improve boot speed when disabled, don't source all of  ufw-init-functions
|(which also sources in other files).
|
|Upstream-Status: Inappropriate [ not author ]
|
|Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
|
|The patch was imported from the OpenEmbedded git server
|(git://git.openembedded.org/openembedded) as of commit id
|2cc1bd9dd060f5002c2fde7aacba86fe230c12af.
|
|Signed-off-by: Silcet <camorga1@gmail.com>
|---
| src/ufw-init | 6 ++++++
| 1 file changed, 6 insertions(+)
|
|diff --git a/src/ufw-init b/src/ufw-init
|index 3505a02..dde37f0 100755
|--- a/src/ufw-init
|+++ b/src/ufw-init
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-optimize-boot.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/ufw/0.36.2/temp/log.do_patch.770966
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb:do_patch) failed with exit code '1'

--===============0131184844475946336==--

