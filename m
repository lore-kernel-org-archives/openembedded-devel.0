Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2F1C05055
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.64110.1699041739244574923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=amIvcnxj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eNWSyF/+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96c77f9f-e6a498b4-97b6-4e9e-8fd5-7bd5f4b85e3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Id2ZUITwa15rlsa+S29tMXv0Bjeij9zaWX6l1OMH+Ko=;
	b=amIvcnxjOf+ypSeYkqUo86kGOdhJeKWVfF/7hlCcA4JZ2eo1Sh1JD3hJLpuslcKl
	aaUNM0p7He+O5dqjj+WDLsqJwhaWjauTN5ID1oo5Mf/DsXaaO8ByEK9oWeTNd8edw0R
	hvchM9tTb0lIZ1HXmHTvBRSQp1iRN/d5Te0Bsqg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Id2ZUITwa15rlsa+S29tMXv0Bjeij9zaWX6l1OMH+Ko=;
	b=eNWSyF/+3L/cmJ8MT7aryof6/gaOqhUCqqF+A0J4JtX5IymvKq378Va55wVcfZdx
	iHwc1eXjRvH1VVZcASgPVZhzVwHbgP1sywy3R7wsW/X0bhsQViJBQtSKV6G6IoxvFf8
	dsq6SJ1I4pzlinfxhgRztLSaMfa0YGV0xB/L0uGc=
Content-Type: multipart/mixed; boundary="===============6056476825333875135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] openldap: upgrading to 2.6.6 FAILED
Message-ID: <0101018b96c77f9f-e6a498b4-97b6-4e9e-8fd5-7bd5f4b85e3c-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106067

--===============6056476825333875135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openldap* to *2.6.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-openldap-upgrade-2.5.16-2.6.6.patch
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
From 213616bd173ffdba92ac852f5718bd680091b01b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:27:58 +0000
Subject: [PATCH] openldap: upgrade 2.5.16 -> 2.6.6

---
 .../openldap/{openldap_2.5.16.bb => openldap_2.6.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.16.bb => openldap_2.6.6.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb b/meta-oe/recipes-support/openldap/openldap_2.6.6.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.5.16.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.6.bb
index 8d13a4ddb..cbc862994 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.6.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
+SRC_URI[sha256sum] = "082e998cf542984d43634442dbe11da860759e510907152ea579bdc42fe39ea0"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.39.2


--===============6056476825333875135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5015 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a1dbc55905e764117f9d4842c6a0e22a8e2fb370"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 225 Local 216 Mirrors 0 Missed 9 Current 224 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 235 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 242 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 260 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 268 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 449 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 449 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openldap-2.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openldap-2.6.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openldap-2.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openldap-2.6.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 377 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openldap-2.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 449 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe openldap-2.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 454 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openldap-2.6.6-r0: task do_fetch: Started
NOTE: recipe groff-native-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openldap-2.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 449 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe groff-native-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 990 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openldap-2.6.6-r0: task do_unpack: Started
NOTE: Running task 1227 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe openldap-2.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openldap-2.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_patch)
NOTE: Running task 1259 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_collect_spdx_deps)
NOTE: recipe openldap-2.6.6-r0: task do_patch: Started
NOTE: recipe openldap-2.6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe openldap-2.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openldap-2.6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openldap-2.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1261 of 1274 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_configure)
NOTE: recipe openldap-2.6.6-r0: task do_configure: Started
NOTE: recipe openldap-2.6.6-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1262 tasks of which 1256 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103172703.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103172703.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: openldap-2.6.6-r0 do_configure: QA Issue: openldap: configure was passed unrecognised options: --enable-ndb [unknown-configure-option]
ERROR: openldap-2.6.6-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/openldap/2.6.6/temp/log.do_configure.3642049
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.6.6.bb:do_configure) failed with exit code '1'

--===============6056476825333875135==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openldap-upgrade-2.5.16-2.6.6.patch"

RnJvbSAyMTM2MTZiZDE3M2ZmZGJhOTJhYzg1MmY1NzE4YmQ2ODAwOTFiMDFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzoyNzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5sZGFwOiB1cGdyYWRlIDIuNS4xNiAtPiAyLjYuNgoKLS0tCiAuLi4vb3BlbmxkYXAve29wZW5s
ZGFwXzIuNS4xNi5iYiA9PiBvcGVubGRhcF8yLjYuNi5iYn0gICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9vcGVubGRhcC97b3BlbmxkYXBfMi41LjE2LmJiID0+IG9wZW5sZGFw
XzIuNi42LmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29w
ZW5sZGFwL29wZW5sZGFwXzIuNS4xNi5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW5s
ZGFwL29wZW5sZGFwXzIuNi42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW5sZGFwL29wZW5sZGFwXzIuNS4xNi5iYgpyZW5hbWUg
dG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmxkYXAvb3BlbmxkYXBfMi42LjYuYmIKaW5k
ZXggOGQxM2E0ZGRiLi5jYmM4NjI5OTQgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L29wZW5sZGFwL29wZW5sZGFwXzIuNS4xNi5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9vcGVubGRhcC9vcGVubGRhcF8yLjYuNi5iYgpAQCAtMjEsNyArMjEsNyBAQCBTUkNfVVJJ
ID0gImh0dHA6Ly93d3cub3BlbmxkYXAub3JnL3NvZnR3YXJlL2Rvd25sb2FkL09wZW5MREFQL29w
ZW5sZGFwLXJlbGVhc2UvJAogICAgIGZpbGU6Ly8wMDAxLWJ1aWxkLXRvcC5tay11bnNldC1TVFJJ
UF9PUFRTLnBhdGNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0NmJhNTkxODIyZThi
YjBlNDY3ZDQwYzRkNGEzMGY4OWQ5MzdjM2E1MDdmZTgzYTU3OGY1ODJmNmEyMTEzMjciCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMDgyZTk5OGNmNTQyOTg0ZDQzNjM0NDQyZGJlMTFkYTg2MDc1OWU1
MTA5MDcxNTJlYTU3OWJkYzQyZmUzOWVhMCIKIAogREVQRU5EUyA9ICJ1dGlsLWxpbnV4IGdyb2Zm
LW5hdGl2ZSIKIAotLSAKMi4zOS4yCgo=

--===============6056476825333875135==--

