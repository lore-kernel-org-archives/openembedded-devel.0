Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77FAC0032E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63872.1699041166191524446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WMEzEYvA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q4/gSgi1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bec806-71194c36-b930-4623-ab43-ee9dde1d5ec7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nxuRxxKrIAKEnpM8ZfoK6zXGrtEd02eKE8rLmN0AafA=;
	b=WMEzEYvAmOcmdHvGtgDsIHIw8Oag38l4FXeiTM+hOz0O8Un/G4uwJ8YNzzt+141O
	sah8AUVN1pQ+2ve2kXzl+9wCaSIQTxsJvamO3KEKa7SaHQWqxeC0yUi127oNtYaAm2F
	Tdcc9gDnSEy9QOja3WTkyIul4sqzun/p3jpxkYsQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nxuRxxKrIAKEnpM8ZfoK6zXGrtEd02eKE8rLmN0AafA=;
	b=Q4/gSgi1KsFdeZ4JUHtUkt72E68t1EEey1kNCCYWYGXPILY2UNr0LIWwhTflRgPR
	/LOydkc+8rC5dQUaoVEf1tC8Sbc6IPkf2GabTHGlXexqafMudO+Q3TzppnMymN6Z3TR
	NHBY3r1zRmPeNDZInZBcFm9UxdNn0GG7YLtDMVbo=
Content-Type: multipart/mixed; boundary="===============5034016164255842776=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gpsd: upgrading to 3.25 FAILED
Message-ID: <0101018b96bec806-71194c36-b930-4623-ab43-ee9dde1d5ec7-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105930

--===============5034016164255842776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpsd* to *3.25* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gpsd-upgrade-3.24-3.25.patch
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
From f3a1e1c34866e2574a45f009865e5cd313027848 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:55:55 +0000
Subject: [PATCH] gpsd: upgrade 3.24 -> 3.25

---
 meta-oe/recipes-navigation/gpsd/{gpsd_3.24.bb => gpsd_3.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.24.bb => gpsd_3.25.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index a755e39ed..cb8e11131 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -8,7 +8,7 @@ PROVIDES = "virtual/gpsd"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c"
+SRC_URI[sha256sum] = "b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.39.2


--===============5034016164255842776==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gpsd-upgrade-3.24-3.25.patch"

RnJvbSBmM2ExZTFjMzQ4NjZlMjU3NGE0NWYwMDk4NjVlNWNkMzEzMDI3ODQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjo1NTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdw
c2Q6IHVwZ3JhZGUgMy4yNCAtPiAzLjI1CgotLS0KIG1ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9u
L2dwc2Qve2dwc2RfMy4yNC5iYiA9PiBncHNkXzMuMjUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LW5hdmlnYXRpb24vZ3BzZC97Z3BzZF8zLjI0LmJiID0+IGdwc2RfMy4yNS5iYn0gKDk4JSkKCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtbmF2aWdhdGlvbi9ncHNkL2dwc2RfMy4yNC5iYiBi
L21ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL2dwc2QvZ3BzZF8zLjI1LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1uYXZpZ2F0aW9uL2dwc2QvZ3Bz
ZF8zLjI0LmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtbmF2aWdhdGlvbi9ncHNkL2dwc2Rf
My4yNS5iYgppbmRleCBhNzU1ZTM5ZWQuLmNiOGUxMTEzMSAxMDA2NDQKLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLW5hdmlnYXRpb24vZ3BzZC9ncHNkXzMuMjQuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVz
LW5hdmlnYXRpb24vZ3BzZC9ncHNkXzMuMjUuYmIKQEAgLTgsNyArOCw3IEBAIFBST1ZJREVTID0g
InZpcnR1YWwvZ3BzZCIKIFNSQ19VUkkgPSAiJHtTQVZBTk5BSF9HTlVfTUlSUk9SfS8ke0JQTn0v
JHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2dwc2QuaW5pdCBcCiAgICAgICAgICAg
ICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMGVlMTNmNjE1NjU1Mjg0ODc0YTY2MWJlMTM1NTNh
YmU2NjEyOGU2ZGViNWNkNjQ4YWY5YmMwY2IzNDVmZTVjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImIzNjhiNmEzMDVlM2Y3YTYzODJkMjNhMGNiZmMxZDc4OTIzMDYwYjZiN2Y1NGNmNzk4N2E3M2M3
YjRhOWFmYzIiCiAKIGluaGVyaXQgc2NvbnMgdXBkYXRlLXJjLmQgcHl0aG9uMy1kaXIgcHl0aG9u
M25hdGl2ZSBzeXN0ZW1kIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgcGtnY29uZmlnCiAKLS0gCjIuMzku
MgoK

--===============5034016164255842776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4947 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:b8216e1438525b902db7208851063a189c6d3996"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 558 Local 544 Mirrors 0 Missed 14 Current 443 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2174 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_recipe_qa)
NOTE: recipe gpsd-3.25-r0: task do_recipe_qa: Started
NOTE: recipe gpsd-3.25-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2760 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_fetch)
NOTE: recipe gpsd-3.25-r0: task do_fetch: Started
NOTE: recipe gpsd-3.25-r0: task do_fetch: Succeeded
NOTE: Running task 2761 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_unpack)
NOTE: Running task 2762 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpsd-3.25-r0: task do_unpack: Started
NOTE: recipe gpsd-3.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpsd-3.25-r0: task do_unpack: Succeeded
NOTE: Running task 2763 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_patch)
NOTE: Running task 2764 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_collect_spdx_deps)
NOTE: recipe gpsd-3.25-r0: task do_patch: Started
NOTE: recipe gpsd-3.25-r0: task do_collect_spdx_deps: Started
NOTE: recipe gpsd-3.25-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gpsd-3.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gpsd-3.25-r0: task do_patch: Succeeded
NOTE: Running task 2765 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2766 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_populate_lic)
NOTE: recipe gpsd-3.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpsd-3.25-r0: task do_populate_lic: Started
NOTE: recipe gpsd-3.25-r0: task do_populate_lic: Succeeded
NOTE: recipe gpsd-3.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2767 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_configure)
NOTE: recipe gpsd-3.25-r0: task do_configure: Started
NOTE: recipe gpsd-3.25-r0: task do_configure: Succeeded
NOTE: Running task 2768 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_compile)
NOTE: recipe gpsd-3.25-r0: task do_compile: Started
NOTE: recipe gpsd-3.25-r0: task do_compile: Succeeded
NOTE: Running task 2769 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_install)
NOTE: recipe gpsd-3.25-r0: task do_install: Started
NOTE: recipe gpsd-3.25-r0: task do_install: Succeeded
NOTE: Running task 2770 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_package)
NOTE: Running task 2771 of 2779 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_populate_sysroot)
NOTE: recipe gpsd-3.25-r0: task do_package: Started
NOTE: recipe gpsd-3.25-r0: task do_populate_sysroot: Started
NOTE: recipe gpsd-3.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpsd-3.25-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2771 tasks of which 2758 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103125439.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103125439.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gpsd-3.25-r0 do_package: QA Issue: gpsd: Files/directories were installed but not shipped in any package:
  /usr/share/snmp
  /usr/share/snmp/mibs
  /usr/share/snmp/mibs/gpsd
  /usr/share/snmp/mibs/gpsd/GPSD-MIB
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gpsd: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: gpsd-3.25-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/gpsd/3.25/temp/log.do_package.295679
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb:do_package) failed with exit code '1'

--===============5034016164255842776==--

