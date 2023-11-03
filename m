Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B0AC25B46
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63861.1699041165506993949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CGx/Qq3N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o+9lU00l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96becc77-360c120c-b142-4fba-8465-0769815f6d42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nWrOfMShBaZPHPoQid6FZkahOOGOenKUlQAuFMTTb3g=;
	b=CGx/Qq3NGzcky0qHUqlgwJ+5OWvW9h2cvqJXKj2+Wt2/7CIwRryCml9EgPuFVsXd
	lvTCqG9hDtCf+ydlweue4yE39zQLNbDbETzHl0H0AFsiyt364kfiwAFd1ZpnvRgq9Zs
	r9RSDXa0RToad5vh6vaSEtfdITvE3liCebkQ+yUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nWrOfMShBaZPHPoQid6FZkahOOGOenKUlQAuFMTTb3g=;
	b=o+9lU00lDXuHJ5+ZxBhPTbWOZPeV4SEh5LL5S88kaMnIjKlxbeFTcGjKM+j/8HdK
	2zQZhSogDEUdzEv0cOucp40tPCgPVJbYbDQgsXseuPVMgt/NSNNNxSxHWbfdPCJUPiy
	YPc4z9TAw1/TCDNjsUWeFbzKPhLmRq9tlhw+EggY=
Content-Type: multipart/mixed; boundary="===============4936086763926270428=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libgusb: upgrading to 0.4.7 FAILED
Message-ID: <0101018b96becc77-360c120c-b142-4fba-8465-0769815f6d42-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105963

--===============4936086763926270428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgusb* to *0.4.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libgusb-upgrade-0.3.10-0.4.7.patch
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
From 9eac06ec43f9fc2afa0140417ab776a85aa6db33 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 14:02:49 +0000
Subject: [PATCH] libgusb: upgrade 0.3.10 -> 0.4.7

---
 .../libgusb/{libgusb_0.3.10.bb => libgusb_0.4.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.10.bb => libgusb_0.4.7.bb} (91%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb b/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb
similarity index 91%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb
index 491b6a7a1..c88d84080 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb
@@ -12,7 +12,7 @@ PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 EXTRA_OEMESON:append:class-native = " -Dtests=false -Dintrospection=false"
 
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
-SRCREV = "332d5b987ffecb824426e88518e05547faf2b520"
+SRCREV = "94f907cbf150eea97c7a44caaade35b0af5707a3"
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


--===============4936086763926270428==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgusb-upgrade-0.3.10-0.4.7.patch"

RnJvbSA5ZWFjMDZlYzQzZjlmYzJhZmEwMTQwNDE3YWI3NzZhODVhYTZkYjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNDowMjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ymd1c2I6IHVwZ3JhZGUgMC4zLjEwIC0+IDAuNC43CgotLS0KIC4uLi9saWJndXNiL3tsaWJndXNi
XzAuMy4xMC5iYiA9PiBsaWJndXNiXzAuNC43LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2xpYmd1c2Ive2xpYmd1c2JfMC4zLjEwLmJiID0+IGxpYmd1c2JfMC40
LjcuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGliZ3Vz
Yi9saWJndXNiXzAuMy4xMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmd1c2IvbGli
Z3VzYl8wLjQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC9saWJndXNiL2xpYmd1c2JfMC4zLjEwLmJiCnJlbmFtZSB0byBtZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9saWJndXNiL2xpYmd1c2JfMC40LjcuYmIKaW5kZXggNDkxYjZhN2Ex
Li5jODhkODQwODAgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmd1c2Iv
bGliZ3VzYl8wLjMuMTAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGliZ3VzYi9s
aWJndXNiXzAuNC43LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFBBQ0tBR0VDT05GSUdbdmFwaV0gPSAi
LUR2YXBpPXRydWUsLUR2YXBpPWZhbHNlIgogRVhUUkFfT0VNRVNPTjphcHBlbmQ6Y2xhc3MtbmF0
aXZlID0gIiAtRHRlc3RzPWZhbHNlIC1EaW50cm9zcGVjdGlvbj1mYWxzZSIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2h1Z2hzaWUvbGliZ3VzYi5naXQ7YnJhbmNoPW1haW47cHJvdG9j
b2w9aHR0cHMiCi1TUkNSRVYgPSAiMzMyZDViOTg3ZmZlY2I4MjQ0MjZlODg1MThlMDU1NDdmYWYy
YjUyMCIKK1NSQ1JFViA9ICI5NGY5MDdjYmYxNTBlZWE5N2M3YTQ0Y2FhYWRlMzViMGFmNTcwN2Ez
IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCi0tIAoy
LjM5LjIKCg==

--===============4936086763926270428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4969 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d162a9bb4ecdd2062b7e965c5e98869085bc5af1"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 377 Local 367 Mirrors 0 Missed 10 Current 339 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_populate_lic_setscene)
NOTE: Running setscene task 350 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libgusb-0.4.7-r0: task do_populate_lic_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_create_spdx_setscene: Started
NOTE: Running task 321 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_write_config)
NOTE: recipe libgusb-0.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgusb-0.4.7-r0: task do_write_config: Started
NOTE: recipe libgusb-0.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgusb-0.4.7-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe libgusb-0.4.7-r0: task do_write_config: Succeeded
NOTE: Running setscene task 586 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libgusb-0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgusb-0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 501 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_fetch)
NOTE: recipe vala-native-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgusb-0.4.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe libgusb-0.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 539 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_unpack)
NOTE: recipe vala-native-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 716 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgusb-0.4.7-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgusb-0.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_patch)
NOTE: recipe libgusb-0.4.7-r0: task do_patch: Started
NOTE: recipe libgusb-0.4.7-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 716 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1906 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1981 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_collect_spdx_deps)
NOTE: recipe libgusb-0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgusb-0.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgusb-0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgusb-0.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1982 of 1994 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_configure)
NOTE: recipe libgusb-0.4.7-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', '/home/pokybuild/yo
 cto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3
 _3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libusb-compat', 'glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'vala', 'gobject-introspection', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'gobject-introspection-native', 'gtk-doc-native', 'linux-libc-headers', 'libgcc', 'libtool-native', 'xz-native', 'sqlite3-native', 'libedit-native', 'util-linux-libuuid-native', 'zlib-native', 'ncurses-native', 'openssl-native', 'expat-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'gdbm-native', 'libffi-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'zstd-native', 'gmp-native', 'mpfr-native', 'gnu-config-native', 'libmpc-native', 'binutils-cross-x86_64', 'flex-native', 'bash-completion', 'util-linux', 'libffi', 'libpcre2', 'zlib', 'opkg-utils', 'python3', 'libusb1', 'glib-2.0-native', 'python3-installer-native', 'python3-wheel-native', 'pyth
 on3-build-native', 'python3-setuptools-native', 'attr-native', 're2c-native', 'perl-native', 'cmake-native', 'm4-native', 'libpam', 'util-linux-libuuid', 'libxcrypt', 'libcap-ng', 'ncurses', 'bzip2', 'openssl', 'libtirpc', 'libnsl2', 'xz', 'sqlite3', 'gdbm', 'libedit', 'expat', 'systemd', 'util-linux-native', 'libpcre2-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'make-native', 'cracklib', 'shadow', 'acl', 'base-files', 'initscripts', 'kmod', 'shadow-sysroot', 'libxkbcommon', 'update-rc.d', 'libcap', 'base-passwd', 'shadow-native', 'zstd', 'libseccomp', 'libcap-ng-native', 'unzip-native', 'attr', 'xkeyboard-config', 'libxcb', 'wayland', 'libxml2', 'wayland-protocols', 'util-macros', 'libxdmcp', 'xorgproto', 'xcb-proto', 'libpthread-stubs', 'libxau']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Ddocs=false -Dintrospection=true -Dvapi=true...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/git
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/build
| Build type: cross build
| Project name: libgusb
| Project version: 0.4.7
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Warray-bounds: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wclobbered: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wempty-body: YES
| Compiler for C supports arguments -Wextra: YES
| ../git/meson.build:72: WARNING: Consider using the built-in warning_level option instead of using "-Wextra".
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wformat-signedness: YES
| Compiler for C supports arguments -Wignored-qualifiers: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-parameter-type: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wno-discarded-qualifiers: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-strict-aliasing: YES
| Compiler for C supports arguments -Wno-suggest-attribute=format: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-gnu-variable-sized-type-not-at-end: NO
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Woverride-init: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wreturn-type: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wswitch-default: YES
| Compiler for C supports arguments -Wswitch-enum: YES
| Compiler for C supports arguments -Wtype-limits: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports link arguments -Wl,-z,relro: YES
| Compiler for C supports link arguments -Wl,-z,now: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Found CMake: NO
| Run-time dependency umockdev-1.0 found: NO (tried pkgconfig and cmake)
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency libusb-1.0 found: YES 1.0.26
| Header "libusb.h" has symbol "LIBUSB_CAP_HAS_HOTPLUG" with dependency libusb-1.0: YES
| Header "libusb.h" has symbol "libusb_has_capability" with dependency libusb-1.0: YES
| Header "libusb.h" has symbol "libusb_set_option" with dependency libusb-1.0: YES
| Header "libusb.h" has symbol "libusb_get_parent" with dependency libusb-1.0: YES
| Header "libusb.h" has symbol "libusb_get_port_number" with dependency libusb-1.0: YES
| Run-time dependency json-glib-1.0 found: NO (tried pkgconfig)
| 
| ../git/meson.build:119:14: ERROR: Dependency "json-glib-1.0" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203, line 184
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203, line 173
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203, line 159
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203, line 197
NOTE: recipe libgusb-0.4.7-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1982 tasks of which 1975 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103140138.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103140138.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libgusb-0.4.7-r0 do_configure: meson failed
ERROR: libgusb-0.4.7-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/run.do_configure.518203', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libgusb/0.4.7/temp/log.do_configure.518203
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libgusb/libgusb_0.4.7.bb:do_configure) failed with exit code '1'

--===============4936086763926270428==--

