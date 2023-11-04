Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A456C07352
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5530.1699083061056554226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MUGT+j72;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=F85mqPDP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b993e040e-cfdb88ee-ee5e-4798-9c67-52af39d970e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Za2QWj/yMax5waNoAHAnsDmrKtyzdJeohqzOCjIfXWE=;
	b=MUGT+j72+qWpZKFkndkCEs60tHkH28umAcrUJDc4r7X341iseCas07Kc6KwmYPTX
	lWUandVpNYhMoU8TY5tA1pDkp/iZc4Nn1o48lUKwl30BNoYsIb9y7Kz3wyFoNvAzhKL
	5wTsn0HIVhxICwJ3ikTDx1teNg19SwOr1cm6EWGk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Za2QWj/yMax5waNoAHAnsDmrKtyzdJeohqzOCjIfXWE=;
	b=F85mqPDPb+yHCH63qqewuEyHm6NGk09+Gbz09nJkB4qQ7aEQvRrPuMRtxeas1Hzg
	MKGFfbdSZvduOL3zweWKPAvy1LTUCTOqZtSBgaO4LbRjC4zaF8l4UIabMwquTqbwgd2
	2w40DxV+K3aA3Wu4p4fhzTxfoDbaXMyzHcAxPq9E=
Content-Type: multipart/mixed; boundary="===============3711456541188517951=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-screensaver: upgrading to 4.18.2 FAILED
Message-ID: <0101018b993e040e-cfdb88ee-ee5e-4798-9c67-52af39d970e7-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106337

--===============3711456541188517951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-screensaver* to *4.18.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-screensaver-upgrade-4.18.1-4.18.2.patch
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
From 81e6618d1473b8728eb480909733efdcd20ad71e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:47:43 +0000
Subject: [PATCH] xfce4-screensaver: upgrade 4.18.1 -> 4.18.2

---
 ...{xfce4-screensaver_4.18.1.bb => xfce4-screensaver_4.18.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.1.bb => xfce4-screensaver_4.18.2.bb} (91%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb
similarity index 91%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb
index 2c5cba0d8..bfcd6176d 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfcon
 inherit xfce-app
 
 SRC_URI:append = " file://fix-cross-compile.patch"
-SRC_URI[sha256sum] = "b731e8abd68a18cc5d3b523351aa8f9f293c9f63290c1781c9155259deb04a5c"
+SRC_URI[sha256sum] = "e4fcd2c414d3a4215e9e86a55edd87e2545b15c961917f5d72cace35b76e2b98"
 
 do_install:append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
-- 
2.39.2


--===============3711456541188517951==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-screensaver-upgrade-4.18.1-4.18.2.patch"

RnJvbSA4MWU2NjE4ZDE0NzNiODcyOGViNDgwOTA5NzMzZWZkY2QyMGFkNzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo0Nzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXNjcmVlbnNhdmVyOiB1cGdyYWRlIDQuMTguMSAtPiA0LjE4LjIKCi0tLQogLi4ue3hmY2U0
LXNjcmVlbnNhdmVyXzQuMTguMS5iYiA9PiB4ZmNlNC1zY3JlZW5zYXZlcl80LjE4LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS14ZmNlL3JlY2lwZXMtYXBwcy94ZmNlNC1zY3JlZW5zYXZlci97eGZjZTQtc2NyZWVu
c2F2ZXJfNC4xOC4xLmJiID0+IHhmY2U0LXNjcmVlbnNhdmVyXzQuMTguMi5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1hcHBzL3hmY2U0LXNjcmVlbnNhdmVyL3hmY2U0
LXNjcmVlbnNhdmVyXzQuMTguMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtc2Ny
ZWVuc2F2ZXIveGZjZTQtc2NyZWVuc2F2ZXJfNC4xOC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLWFwcHMveGZjZTQtc2NyZWVuc2F2ZXIveGZj
ZTQtc2NyZWVuc2F2ZXJfNC4xOC4xLmJiCnJlbmFtZSB0byBtZXRhLXhmY2UvcmVjaXBlcy1hcHBz
L3hmY2U0LXNjcmVlbnNhdmVyL3hmY2U0LXNjcmVlbnNhdmVyXzQuMTguMi5iYgppbmRleCAyYzVj
YmEwZDguLmJmY2Q2MTc2ZCAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMtYXBwcy94ZmNl
NC1zY3JlZW5zYXZlci94ZmNlNC1zY3JlZW5zYXZlcl80LjE4LjEuYmIKKysrIGIvbWV0YS14ZmNl
L3JlY2lwZXMtYXBwcy94ZmNlNC1zY3JlZW5zYXZlci94ZmNlNC1zY3JlZW5zYXZlcl80LjE4LjIu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICJkYnVzLWdsaWIgZ2FyY29uIGd0ayszIGxp
YnhrbGF2aWVyIGxpYnhzY3Juc2F2ZXIgdmlydHVhbC9saWJ4MTEgeGZjb24KIGluaGVyaXQgeGZj
ZS1hcHAKIAogU1JDX1VSSTphcHBlbmQgPSAiIGZpbGU6Ly9maXgtY3Jvc3MtY29tcGlsZS5wYXRj
aCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNzMxZThhYmQ2OGExOGNjNWQzYjUyMzM1MWFhOGY5
ZjI5M2M5ZjYzMjkwYzE3ODFjOTE1NTI1OWRlYjA0YTVjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImU0ZmNkMmM0MTRkM2E0MjE1ZTllODZhNTVlZGQ4N2UyNTQ1YjE1Yzk2MTkxN2Y1ZDcyY2FjZTM1
Yjc2ZTJiOTgiCiAKIGRvX2luc3RhbGw6YXBwZW5kKCkgewogICAgIGluc3RhbGwgLUQgLW0gMDY0
NCAke1N9L2RhdGEveGZjZTQtc2NyZWVuc2F2ZXIuY29tbW9uLWF1dGggJHtEfSR7c3lzY29uZmRp
cn0vcGFtLmQveGZjZTQtc2NyZWVuc2F2ZXIKLS0gCjIuMzkuMgoK

--===============3711456541188517951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4951 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:719f540a3afc0eb556673cd0fddbf071d311ba38"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 703 Local 694 Mirrors 0 Missed 9 Current 655 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 658 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 659 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 668 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxscrnsaver-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxscrnsaver-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 955 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe libwnck3-43.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 983 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 627 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_fetch)
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1002 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_fetch: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 706 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_unpack)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1014 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1127 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1217 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1302 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1304 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1310 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1316 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1323 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1325 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2380 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_patch)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_patch: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1353 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1358 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3565 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3687 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3691 of 3703 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_configure)
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-r
 untime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb:do_popu
 late_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/buil
 d/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libwnck3', 'libxklavier', 'garcon', 'xfconf', 'dbus-glib', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'libx11', 'libxscrnsaver', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'gobject-introspection', 'libxfce4ui', 'libjpeg-turbo', 'shared-mime-info', 'libpng', 'glib-2.0', 'mpfr-native', 'gnu-config-native', 'xz-native', 'libmpc-native', 'texinfo-dummy-native', 'gmp-native', 'zlib-native', 'flex-native', 'linux-libc-headers', 'binutils-cross-x86_64', 'zstd-native', 'xorgproto', 'util-macros', 'libxcb', 'xtrans', 'libxext', 'gettext-minimal-native', 'libxml-parser-perl-native', 'libgcc', 'libxml2', 'xkbcomp', 'gtk+', 'libxi', 'iso-codes', 'cairo-native', 'pango-native', 'fontconfig-native', 'python3-native', 'gdk-pixbuf-native', 'libxrender-nativ
 e', 'libxcomposite-native', 'libpng-native', 'libxext-native', 'libxdamage-native', 'libxcursor-native', 'libxi-native', 'libxrandr-native', 'libxfixes-native', 'libx11-native', 'libjpeg-turbo-native', 'at-spi2-core-native', 'glib-2.0-native', 'gobject-introspection-native', 'attr-native', 'wayland', 'libxdamage', 'libxcursor', 'opkg-utils', 'libxfixes', 'fontconfig', 'at-spi2-core', 'libepoxy', 'wayland-protocols', 'libxrandr', 'libxrender', 'pango', 'mesa', 'cairo', 'libxkbcommon', 'libxcomposite', 'vala', 'libxfce4util', 'perl', 'bash-completion', 'm4-native', 'dbus', 'expat', 'libxres', 'startup-notification', 'libffi', 'python3', 'zlib', 'xfce4-dev-tools', 'libice', 'libsm', 'util-linux', 'libpcre2', 'libxau', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'expat-native', 'perl-native', 'libxkbfile', 'pixman-native', 'libsm-native', 'libxcb-native', 'freetype-native', 'fribidi-native', 'harfbuzz-native', 'libxft-native', 'util-linux-native', 'libnsl2-native', 'gdbm-native', 'ncur
 ses-native', 'bzip2-native', 'libffi-native', 'libtirpc-native', 'util-linux-libuuid-native', 'sqlite3-native', 'openssl-native', 'libedit-native', 'shared-mime-info-native', 'xorgproto-native', 'util-macros-native', 'xtrans-native', 'cmake-native', 'dbus-native', 'libxtst-native', 'libxml2-native', 'libpcre2-native', 'freetype', 'libxtst', 'fribidi', 'libxft', 'harfbuzz', 'vulkan-headers', 'libxxf86vm', 'xrandr', 'vulkan-loader', 'libdrm', 'libxshmfence', 'pixman', 'xkeyboard-config', 'gdbm', 'libxcrypt', 'systemd', 'initscripts', 'update-rc.d', 'shadow-native', 'base-passwd', 'shadow-sysroot', 'base-files', 'shadow', 'xcb-util', 'libedit', 'xz', 'libnsl2', 'sqlite3', 'ncurses', 'libtirpc', 'openssl', 'util-linux-libuuid', 'bzip2', 'libcap-ng', 'libpam', 'make-native', 'libice-native', 'libxau-native', 'xcb-proto-native', 'libxdmcp-native', 'libpthread-stubs-native', 'icu-native', 'libcap-ng-native', 'itstool-native', 'icu', 'libpciaccess', 'acl', 'libcap', 'kmod', 'zstd', 'libsecc
 omp', 'attr', 'cracklib', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/xfce4-screensaver-4.18.2/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/xfce4-screensaver-4.18.2/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: running: intltoolize --copy --force
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/xfce4-screensaver-4.18.2/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/xfce4-screensaver-4.18.2/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/xfce4-screensaver-4.18.2/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:24: installing './compile'
| configure.ac:12: installing './missing'
| savers/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfce4-screensaver-4.18.2/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot  --disable-static  --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether NLS is requested... yes
| checking for intltool >= 0.50.1... 0.51.0 found
| checking for intltool-update... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/intltool-update
| checking for intltool-merge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/intltool-merge
| checking for intltool-extract... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/intltool-extract
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/msgmerge
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/msgfmt
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.16... yes
| checking for glib-compile-schemas... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/glib-compile-schemas
| checking for unistd.h... (cached) yes
| checking for crypt.h... yes
| checking for sys/select.h... yes
| checking for select... yes
| checking for fcntl... yes
| checking for uname... yes
| checking for nice... yes
| checking for setpriority... yes
| checking for getcwd... yes
| checking for getwd... yes
| checking for putenv... yes
| checking for sbrk... yes
| checking for sigaction... yes
| checking for syslog... yes
| checking for realpath... yes
| checking for setrlimit... yes
| checking for getresuid... yes
| checking for uid_t... yes
| checking for gid_t... yes
| checking for xrandr... yes
| checking for x86_64-poky-linux-pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for glib-2.0 >= 2.50.0... 2.78.0
| checking GLIB_CFLAGS... -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/recipe-sysroot/usr/lib/glib-2.0/include
| checking GLIB_LIBS... -lglib-2.0
| configure: setting GLIB_VERSION_MAX_ALLOWED and GLIB_VERSION_MIN_REQUIRED according to 2.50.0
| checking for setresuid... (cached) yes
| checking for setenv... yes
| checking for unsetenv... yes
| checking for clearenv... yes
| checking for x11 >= 1.0
|         xscrnsaver
|         gtk+-3.0 >= 3.24.0
|         dbus-glib-1 >= 0.30
|         gio-2.0 >= 2.50.0
|         libxklavier >= 5.2
|         libxfconf-0 >= 4.12.1
|         garcon-gtk3-1 >= 0.5.0
|         libwnck-3.0 >= 3.20
|         xrandr... yes
| checking for gio-2.0 >= 2.50.0
|         gthread-2.0
|         gtk+-3.0 >= 3.24.0
|         libxfce4util-1.0 >= 4.12.1... yes
| checking for gio-2.0 >= 2.50.0
|         gtk+-3.0 >= 3.24.0
|         libxklavier >= 5.2
|         libxfce4ui-2 >= 4.18.4
|         libxfconf-0 >= 4.12.1
|         garcon-gtk3-1 >= 0.5.0... no
| configure: error: Package requirements (gio-2.0 >= 2.50.0
|         gtk+-3.0 >= 3.24.0
|         libxklavier >= 5.2
|         libxfce4ui-2 >= 4.18.4
|         libxfconf-0 >= 4.12.1
|         garcon-gtk3-1 >= 0.5.0) were not met:
| 
| Requested 'libxfce4ui-2 >= 4.18.4' but version of libxfce4ui is 4.18.3
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables XFCE_SCREENSAVER_CAPPLET_CFLAGS
| and XFCE_SCREENSAVER_CAPPLET_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337:286 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337, line 286
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337, line 232
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337, line 290
NOTE: recipe xfce4-screensaver-4.18.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3691 tasks of which 3685 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104064709.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104064709.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-screensaver-4.18.2-r0 do_configure: configure failed
ERROR: xfce4-screensaver-4.18.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/run.do_configure.2540337', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-screensaver/4.18.2/temp/log.do_configure.2540337
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.2.bb:do_configure) failed with exit code '1'

--===============3711456541188517951==--

