Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E40C10F29
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63881.1699041168181611255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e1Pt2TIj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UWzTI8Kd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bec88b-fd92552e-addc-4a41-b0ea-31d9315f421f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fc68HN1fjo6gKn5F4t/GWZtDD4xDhjLtW6FngAjqCOI=;
	b=e1Pt2TIj0ZjOQBz44oIY9hG0ObKZotQcer1ym9KL5WiL/Vhw46gsYeEUBqFrECUn
	bQLMPrr+3r1JE1sfftgA6Cj5U5ZW/MFIKI5He1bTCyRU5sUICYjNQh5uZkPNKz1CoNI
	RDd2YRuSbOnNL7HH4BXdMHKQMQ1eDJYrY9hu5Q8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fc68HN1fjo6gKn5F4t/GWZtDD4xDhjLtW6FngAjqCOI=;
	b=UWzTI8KdRyEKISdhbryeoPc7uG5DqTgP/DAjOP/1TwNV8A2NIiq+KfeDANd7NKgE
	dFYHQID7+sn7okHz/Pb4lSsBpAYLi2opNSQ6Ag7h34cAOgAqgteeKLcoG4QEkdH6Fup
	xvdSuXw3o7XBYNX5EFMQ0yP23iWmgjfP1yahfRw0=
Content-Type: multipart/mixed; boundary="===============0967086939512330652=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gst-editing-services: upgrading to 1.22.6 FAILED
Message-ID: <0101018b96bec88b-fd92552e-addc-4a41-b0ea-31d9315f421f-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105941

--===============0967086939512330652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-editing-services* to *1.22.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-editing-services-upgrade-1.20.5-1.22.6.patch
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
From f178217d40183ee851d46f8cc309f9dc5085fd24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:01:49 +0000
Subject: [PATCH] gst-editing-services: upgrade 1.20.5 -> 1.22.6

---
 ...diting-services_1.20.5.bb => gst-editing-services_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.20.5.bb => gst-editing-services_1.22.6.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb
index 6b7775c1c..f6fa110e0 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "363f2b13675877b926b4be5259dbbeea8cc976805b40c871fc254bb8f382017d"
+SRC_URI[sha256sum] = "748d423672c597f876e130804fb984848f5b4b89efd78a506cb17f7646795301"
 
 PACKAGES += "gst-validate-launcher libges"
 
-- 
2.39.2


--===============0967086939512330652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4950 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:b47d5a10162a17f5e5f864545d4a1b51aa514879"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 637 Local 628 Mirrors 0 Missed 9 Current 538 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 548 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pygobject-3.46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygobject-3.46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 807 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 603 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_write_config: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 898 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1018 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_create_spdx_setscene)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 846 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1111 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_fetch: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1134 of 1175 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1158 of 1175 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1170 of 1175 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2916 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_unpack)
NOTE: Running task 3008 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_unpack: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3185 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_patch)
NOTE: Running task 3186 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_patch: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_patch: Succeeded
NOTE: recipe gst-editing-services-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3189 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_configure)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-editing-services-1.22.6-r0: task do_configure: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_compile)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_compile: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3191 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_install)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_install: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3192 of 3201 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_package)
NOTE: recipe gst-editing-services-1.22.6-r0: task do_package: Started
NOTE: recipe gst-editing-services-1.22.6-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 3193 tasks of which 3183 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130054.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103130054.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-editing-services-1.22.6-r0 do_package: QA Issue: gst-editing-services: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.11
  /usr/lib/python3.11/site-packages
  /usr/lib/python3.11/site-packages/gi
  /usr/lib/python3.11/site-packages/gi/overrides
  /usr/lib/python3.11/site-packages/gi/overrides/GES.py
  /usr/lib/python3.11/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.11/site-packages/gi/overrides/__pycache__/GES.cpython-311.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gst-editing-services: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: gst-editing-services-1.22.6-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gst-editing-services/1.22.6/temp/log.do_package.327114
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.6.bb:do_package) failed with exit code '1'

--===============0967086939512330652==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-editing-services-upgrade-1.20.5-1.22.6.patch"

RnJvbSBmMTc4MjE3ZDQwMTgzZWU4NTFkNDZmOGNjMzA5ZjlkYzUwODVmZDI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzowMTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1lZGl0aW5nLXNlcnZpY2VzOiB1cGdyYWRlIDEuMjAuNSAtPiAxLjIyLjYKCi0tLQogLi4uZGl0
aW5nLXNlcnZpY2VzXzEuMjAuNS5iYiA9PiBnc3QtZWRpdGluZy1zZXJ2aWNlc18xLjIyLjYuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2dzdC1lZGl0aW5nLXNlcnZpY2VzL3tnc3Qt
ZWRpdGluZy1zZXJ2aWNlc18xLjIwLjUuYmIgPT4gZ3N0LWVkaXRpbmctc2VydmljZXNfMS4yMi42
LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9nc3QtZWRp
dGluZy1zZXJ2aWNlcy9nc3QtZWRpdGluZy1zZXJ2aWNlc18xLjIwLjUuYmIgYi9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvZ3N0LWVkaXRpbmctc2VydmljZXMvZ3N0LWVkaXRpbmctc2VydmljZXNf
MS4yMi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9nc3QtZWRpdGluZy1zZXJ2aWNlcy9nc3QtZWRpdGluZy1zZXJ2aWNlc18xLjIw
LjUuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9nc3QtZWRpdGluZy1zZXJ2
aWNlcy9nc3QtZWRpdGluZy1zZXJ2aWNlc18xLjIyLjYuYmIKaW5kZXggNmI3Nzc1YzFjLi5mNmZh
MTEwZTAgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9nc3QtZWRpdGluZy1z
ZXJ2aWNlcy9nc3QtZWRpdGluZy1zZXJ2aWNlc18xLjIwLjUuYmIKKysrIGIvbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL2dzdC1lZGl0aW5nLXNlcnZpY2VzL2dzdC1lZGl0aW5nLXNlcnZpY2VzXzEu
MjIuNi5iYgpAQCAtMTgsNyArMTgsNyBAQCBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyB1cHN0cmVh
bS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9uIGZlYXR1cmVzXwogRVhUUkFf
T0VNRVNPTiA9ICItRHZhbGlkYXRlPWRpc2FibGVkIgogCiBTUkNfVVJJID0gImh0dHA6Ly9nc3Ry
ZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtZWRpdGluZy1zZXJ2aWNlcy9nc3QtZWRpdGlu
Zy1zZXJ2aWNlcy0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzYzZjJiMTM2
NzU4NzdiOTI2YjRiZTUyNTlkYmJlZWE4Y2M5NzY4MDViNDBjODcxZmMyNTRiYjhmMzgyMDE3ZCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NDhkNDIzNjcyYzU5N2Y4NzZlMTMwODA0ZmI5ODQ4NDhm
NWI0Yjg5ZWZkNzhhNTA2Y2IxN2Y3NjQ2Nzk1MzAxIgogCiBQQUNLQUdFUyArPSAiZ3N0LXZhbGlk
YXRlLWxhdW5jaGVyIGxpYmdlcyIKIAotLSAKMi4zOS4yCgo=

--===============0967086939512330652==--

