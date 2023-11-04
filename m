Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2880C04FDE
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4230.1699071647518977979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KxZYr5u7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Fx+BarrH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b988fdbe8-b69e19cb-854b-4b69-a712-dacc0ed3bc79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qeCnAC6uFB0tOH84vrx1ohVJTLcgQnFjKHEDxEZlfww=;
	b=KxZYr5u7VSWLZTL/SLptI9+cpIM/D+6t/wrrzsPVEl1JlG2Yag4eJD81HeD5bRf9
	mXHYoX0biD6kW/d8JBUIxuNcOMBXB947gJI0iUfNQH9bmSnrGsl0IB6HcL6T3kqkgqb
	OV3/i+euDEGAlIkOztg2I+YTIog/zYZWIHuddGeA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qeCnAC6uFB0tOH84vrx1ohVJTLcgQnFjKHEDxEZlfww=;
	b=Fx+BarrHcbIVxJqWDUo/OVCdXx4WATQfVoRu0mn3ySQM0/6JUEzfTaaBzrCBiMBY
	YW1VClT5kr0Dkcx7rFE2kHey2/CrfdKCqK08qQKL7YRiwct7P1s9uUzTGQdMPunOatU
	014rJdlxdrf4HHXgDWiWUWutug1JYp3BCJL62LhY=
Content-Type: multipart/mixed; boundary="===============3558271551802004898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libavif: upgrading to 1.0.1 SUCCEEDED
Message-ID: <0101018b988fdbe8-b69e19cb-854b-4b69-a712-dacc0ed3bc79-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106251

--===============3558271551802004898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libavif* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libavif-upgrade-0.11.1-1.0.1.patch
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
From d2558c4a48abd595f6d2157404328442523824bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:37:38 +0000
Subject: [PATCH] libavif: upgrade 0.11.1 -> 1.0.1

---
 .../libavif/{libavif_0.11.1.bb => libavif_1.0.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libavif/{libavif_0.11.1.bb => libavif_1.0.1.bb} (85%)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
similarity index 85%
rename from meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb
rename to meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
index f01024e8a..885758b6a 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
 
-SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
 
 S = "${WORKDIR}/git"
-SRCREV = "6ab53189045e7a6fe0bd93d14977b2a4f8efa5e9"
+SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"
 
 DEPENDS = "dav1d"
 
-- 
2.39.2


--===============3558271551802004898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libavif: SRC_URI changed from "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main" to "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
packages/core2-64-poky-linux/libavif: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-dbg: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-dbg: PKGSIZE changed from 430832 to 564704 (+31%)
packages/core2-64-poky-linux/libavif/libavif-dbg: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-dbg: FILELIST: removed "/usr/lib/.debug/libavif.so.15.0.1", added "/usr/lib/.debug/libavif.so.16.0.1"
packages/core2-64-poky-linux/libavif/libavif-dev: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-dev: PKGSIZE changed from 61100 to 70319 (+15%)
packages/core2-64-poky-linux/libavif/libavif-dev: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-doc: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-doc: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-locale: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-locale: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-src: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-src: PKGSIZE changed from 587269 to 687812 (+17%)
packages/core2-64-poky-linux/libavif/libavif-src: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif-staticdev: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif-staticdev: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif: PKG changed from libavif15 to libavif16
packages/core2-64-poky-linux/libavif/libavif: PV changed from "0.11.1" to "1.0.1"
packages/core2-64-poky-linux/libavif/libavif: PKGSIZE changed from 129113 to 145497 (+13%)
packages/core2-64-poky-linux/libavif/libavif: PKGV changed from 0.11.1 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/libavif/libavif: FILELIST: removed "/usr/lib/libavif.so.15 /usr/lib/libavif.so.15.0.1", added "/usr/lib/libavif.so.16 /usr/lib/libavif.so.16.0.1"
Changes to packages/core2-64-poky-linux/libavif (sysroot):
  /usr/lib/libavif.so changed symlink target from libavif.so.15 to libavif.so.16
  /usr/lib/libavif.so.15.0.1 moved to /usr/lib/libavif.so.16.0.1
  /usr/lib/libavif.so.15 moved to /usr/lib/libavif.so.16

--===============3558271551802004898==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libavif-upgrade-0.11.1-1.0.1.patch"

RnJvbSBkMjU1OGM0YTQ4YWJkNTk1ZjZkMjE1NzQwNDMyODQ0MjUyMzgyNGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzozNzozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmF2aWY6IHVwZ3JhZGUgMC4xMS4xIC0+IDEuMC4xCgotLS0KIC4uLi9saWJhdmlmL3tsaWJhdmlm
XzAuMTEuMS5iYiA9PiBsaWJhdmlmXzEuMC4xLmJifSAgICAgICAgICAgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJhdmlmL3tsaWJhdmlmXzAuMTEuMS5iYiA9
PiBsaWJhdmlmXzEuMC4xLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9y
ZWNpcGVzLW11bHRpbWVkaWEvbGliYXZpZi9saWJhdmlmXzAuMTEuMS5iYiBiL21ldGEtbXVsdGlt
ZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbGliYXZpZi9saWJhdmlmXzEuMC4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvbGliYXZpZi9saWJhdmlmXzAuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS1tdWx0aW1lZGlhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJhdmlmL2xpYmF2aWZfMS4wLjEuYmIKaW5kZXggZjAxMDI0ZThh
Li44ODU3NThiNmEgMTAwNjQ0Ci0tLSBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvbGliYXZpZi9saWJhdmlmXzAuMTEuMS5iYgorKysgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYmF2aWYvbGliYXZpZl8xLjAuMS5iYgpAQCAtNCwxMCArNCwxMCBAQCBT
RUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM1MjhiNzViMDc0MjViNWMxZDJlMzRkZTk4YzM5N2I1
IgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vQU9NZWRpYUNvZGVjL2xpYmF2aWYuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0FPTWVkaWFDb2RlYy9saWJhdmlmLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9djEuMC54Igog
CiBTID0gIiR7V09SS0RJUn0vZ2l0IgotU1JDUkVWID0gIjZhYjUzMTg5MDQ1ZTdhNmZlMGJkOTNk
MTQ5NzdiMmE0ZjhlZmE1ZTkiCitTUkNSRVYgPSAiZDFjMjZmYWNhZjVhOGE5NzkxOWNlZWUwNjgx
NGQwNWQxMGUyNTYyMiIKIAogREVQRU5EUyA9ICJkYXYxZCIKIAotLSAKMi4zOS4yCgo=

--===============3558271551802004898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4890 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 128 recipes from the core2-64 sysroot...done.
Removing 128 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
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
meta-webserver       = "tmp-auh-upgrades:359b9c5bcfe5129549e4abfc339533fb3cbc6eb7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 201 Local 192 Mirrors 0 Missed 9 Current 174 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 186 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 230 of 375 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/nasm/nasm_2.16.01.bb:do_create_spdx_setscene)
NOTE: recipe libavif-1.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dav1d-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe nasm-native-2.16.01-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/dav1d/1.2.0/temp/log.do_packagedata_setscene.1019341
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 299 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_package_setscene)
NOTE: recipe libavif-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 300 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dav1d-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 306 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libavif-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dav1d-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 913 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_fetch)
NOTE: recipe libavif-1.0.1-r0: task do_fetch: Started
NOTE: recipe libavif-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 914 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_unpack)
NOTE: recipe dav1d-1.2.0-r0: task do_package_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_unpack: Started
NOTE: recipe libavif-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 915 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_patch)
NOTE: recipe libavif-1.0.1-r0: task do_patch: Started
NOTE: recipe dav1d-1.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 326 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libavif-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 930 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_generate_toolchain_file)
NOTE: recipe dav1d-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libavif-1.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dav1d-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 933 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_fetch)
NOTE: recipe libavif-1.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dav1d-1.2.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe dav1d-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 335 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dav1d-1.2.0-r0: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dav1d-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 357 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 364 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 375 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_packagedata)
NOTE: Running task 1080 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1091 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libavif-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dav1d-1.2.0-r0: task do_packagedata: Started
NOTE: recipe dav1d-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dav1d-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dav1d-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1092 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb:do_create_spdx)
NOTE: Running task 1093 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_configure)
NOTE: recipe libavif-1.0.1-r0: task do_configure: Started
NOTE: recipe dav1d-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe dav1d-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1094 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libavif-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1095 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_compile)
NOTE: recipe libavif-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libavif-1.0.1-r0: task do_compile: Started
NOTE: recipe libavif-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1096 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_install)
NOTE: recipe libavif-1.0.1-r0: task do_install: Started
NOTE: recipe libavif-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1097 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_package)
NOTE: recipe libavif-1.0.1-r0: task do_package: Started
NOTE: recipe libavif-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1099 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_packagedata)
NOTE: recipe libavif-1.0.1-r0: task do_packagedata: Started
NOTE: recipe libavif-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1100 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_create_spdx)
NOTE: Running task 1101 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_package_write_ipk)
NOTE: Running task 1102 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_package_write_deb)
NOTE: Running task 1103 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1104 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_package_qa)
NOTE: recipe libavif-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libavif-1.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe libavif-1.0.1-r0: task do_package_write_deb: Started
NOTE: recipe libavif-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe libavif-1.0.1-r0: task do_package_qa: Started
NOTE: recipe libavif-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1105 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_create_runtime_spdx)
NOTE: recipe libavif-1.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe libavif-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe libavif-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1106 of 1106 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1106 tasks of which 1083 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-src went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-dbg went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-staticdev went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-dev went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-doc went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d-locale went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package dav1d went backwards which would break package feeds (from 0:1.3.0-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: dav1d-1.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3558271551802004898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libavif/libavif-dbg: PKGSIZE changed from 430832 to 564704 (+31%)
packages/core2-64-poky-linux/libavif/libavif-dev: PKGSIZE changed from 61100 to 70319 (+15%)
packages/core2-64-poky-linux/libavif/libavif-src: PKGSIZE changed from 587269 to 687812 (+17%)
packages/core2-64-poky-linux/libavif/libavif: FILELIST: removed "/usr/lib/libavif.so.15 /usr/lib/libavif.so.15.0.1", added "/usr/lib/libavif.so.16 /usr/lib/libavif.so.16.0.1"
packages/core2-64-poky-linux/libavif/libavif: PKGSIZE changed from 129113 to 145497 (+13%)
packages/core2-64-poky-linux/libavif/libavif: PKG changed from libavif15 to libavif16
Changes to packages/core2-64-poky-linux/libavif (sysroot):
  /usr/lib/libavif.so changed symlink target from libavif.so.15 to libavif.so.16
  /usr/lib/libavif.so.15.0.1 moved to /usr/lib/libavif.so.16.0.1
  /usr/lib/libavif.so.15 moved to /usr/lib/libavif.so.16

--===============3558271551802004898==--

