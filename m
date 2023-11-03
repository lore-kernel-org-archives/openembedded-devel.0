Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CC4C05021
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63224.1699041739211208705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d7NnOeFj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bWhk8TtD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96c77f3b-add2036d-2e4a-43b4-aa73-d6b0194ef7a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HrDVL6VKOm8HxFdxPH6xiwFs/GVQ+lxb0JHPcVZvPFI=;
	b=d7NnOeFjcJUXSwPURtGZSrxxgLP1JyTCejzPDwkyA0cVab6QqgxO7M2WmYwESHi7
	wnTtxcmaHSox9zCqjkrcM/GXBZkhLg+qfe4rKZu/DNWOnpdbgzegK+CaUDIwEDPiz7I
	7W1E2l0ZhZSJI1bjxmDqbIjc5T9SoKgr7T20PGMI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HrDVL6VKOm8HxFdxPH6xiwFs/GVQ+lxb0JHPcVZvPFI=;
	b=bWhk8TtDem1pJgL/rnovl56B3y1E1KAPufhDs75NrEnI4Q1GoIhJteo/N3NZXV+S
	Ux/Txjg/NXQtfr4IBx6aw6YniOVJPZ7iaWrBtGd1QfKngTQ63bhxeJ6QpzHfXKNTsCB
	Ti2MhgBuXDhiQAHzBdmhD7e8DhRAVGRycI4D0uNI=
Content-Type: multipart/mixed; boundary="===============1934387238821219340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] telepathy-glib: upgrading to 0.99.11 FAILED
Message-ID: <0101018b96c77f3b-add2036d-2e4a-43b4-aa73-d6b0194ef7a2-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106066

--===============1934387238821219340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *telepathy-glib* to *0.99.11* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-telepathy-glib-upgrade-0.24.1-0.99.11.patch
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
From 8b499d87314387f1abfbc75269b7a7f99bf30de1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:39:37 +0000
Subject: [PATCH] telepathy-glib: upgrade 0.24.1 -> 0.99.11

---
 ...ib_0.24.1.bb => telepathy-glib_0.99.11.bb} | 97 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/telepathy/{telepathy-glib_0.24.1.bb => telepathy-glib_0.99.11.bb} (15%)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb
similarity index 15%
rename from meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
rename to meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb
index 1891eae40..8723af845 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb
@@ -1,3 +1,95 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,17 +1,3 @@
+# -Most of Gabble is licensed under the GNU Lesser General Public License,
+# -as published by the Free Software Foundation and reproduced below:
+# -either version 2.1 of the License, or (at your option) any later version.
+# -
+# -Gabble incorporates the libmd5-rfc MD5 implementation by L. Peter Deutsch
+# -(in the directory src/libmd5-rfc). This is released under a BSD-style
+# -license also reproduced below.
+# -
+# -Gabble incorporates a SHA1 implementation by Allan Saddi, taken from
+# -sha v1.0.4 (in the directory src/sha). This is released under a BSD-style
+# -license also reproduced below.
+# -
+# -------------------------------------------------------------------------
+# -
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 2.1, February 1999
+#  
+# @@ -519,60 +505,3 @@
+#    Ty Coon, President of Vice
+#  
+#  That's all there is to it!
+# -
+# -------------------------------------------------------------------------
+# -
+# -License of src/libmd5-rfc:
+# -
+# -  Copyright (C) 1999, 2000, 2002 Aladdin Enterprises.  All rights reserved.
+# -
+# -  This software is provided 'as-is', without any express or implied
+# -  warranty.  In no event will the authors be held liable for any damages
+# -  arising from the use of this software.
+# -
+# -  Permission is granted to anyone to use this software for any purpose,
+# -  including commercial applications, and to alter it and redistribute it
+# -  freely, subject to the following restrictions:
+# -
+# -  1. The origin of this software must not be misrepresented; you must not
+# -     claim that you wrote the original software. If you use this software
+# -     in a product, an acknowledgment in the product documentation would be
+# -     appreciated but is not required.
+# -  2. Altered source versions must be plainly marked as such, and must not be
+# -     misrepresented as being the original software.
+# -  3. This notice may not be removed or altered from any source distribution.
+# -
+# -  L. Peter Deutsch
+# -  ghost@aladdin.com
+# -
+# -------------------------------------------------------------------------
+# -
+# -License of src/sha1:
+# -
+# -/*-
+# - * Copyright (c) 2001-2003 Allan Saddi <allan@saddi.com>
+# - * All rights reserved.
+# - *
+# - * Redistribution and use in source and binary forms, with or without
+# - * modification, are permitted provided that the following conditions
+# - * are met:
+# - * 1. Redistributions of source code must retain the above copyright
+# - *    notice, this list of conditions and the following disclaimer.
+# - * 2. Redistributions in binary form must reproduce the above copyright
+# - *    notice, this list of conditions and the following disclaimer in the
+# - *    documentation and/or other materials provided with the distribution.
+# - *
+# - * THIS SOFTWARE IS PROVIDED BY ALLAN SADDI AND HIS CONTRIBUTORS ``AS IS''
+# - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# - * ARE DISCLAIMED.  IN NO EVENT SHALL ALLAN SADDI OR HIS CONTRIBUTORS BE
+# - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# - * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# - * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# - * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+# - * POSSIBILITY OF SUCH DAMAGE.
+# - *
+# - * $Id: sha1.h 347 2003-02-23 22:11:49Z asaddi $
+# - */
+# 
+#
+
 SUMMARY = "Telepathy Framework glib-base helper library"
 DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
@@ -5,10 +97,9 @@ DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt
 LICENSE = "LGPL-2.1-or-later"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "cbeb0a24acc26e7f095be281c324da69"
-SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7f7d5eb"
+SRC_URI[sha256sum] = "268cbf0199804ecb6001c7c11e5596bc3cea40a600091c144d14f837ac90cd97"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d902e4aeaf11e633f8278f9a3e5b2f9"
 
 inherit autotools pkgconfig gettext gobject-introspection vala
 
-- 
2.39.2


--===============1934387238821219340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5048 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a62dad90dd97c50c8b6b45fc64467df0832c29b6"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 374 Local 365 Mirrors 0 Missed 9 Current 378 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 387 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 389 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe telepathy-glib-0.99.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe telepathy-glib-0.99.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe telepathy-glib-0.99.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 752 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe telepathy-glib-0.99.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-native-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: Running task 474 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe dbus-native-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe telepathy-glib-0.99.11-r0: task do_fetch: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_fetch: Succeeded
NOTE: Running task 593 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe telepathy-glib-0.99.11-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1925 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_patch)
NOTE: Running task 1957 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2057 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_collect_spdx_deps)
NOTE: recipe telepathy-glib-0.99.11-r0: task do_patch: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe telepathy-glib-0.99.11-r0: task do_patch: Succeeded
NOTE: recipe telepathy-glib-0.99.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe telepathy-glib-0.99.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2071 of 2083 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_configure)
NOTE: recipe telepathy-glib-0.99.11-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/b
 uild/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokyb
 uild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libxslt/libxslt_1.1.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['dbus-glib', 'dbus', 'glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'qemu-native', 'quilt-native', 'vala', 'gobject-introspection', 'dbus-native', 'gettext-native', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'gobject-introspection-native', 'libxslt-native', 'texinfo-dummy-native', 'gnu-config-native', 'zlib-native', 'zstd-native', 'libmpc-native', 'binutils-cross-x86_64', 'flex-native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'mpfr-native', 'gettext-minimal-native', 'libgcc', 'glib-2.0-native', 'libffi-native', 'expat', 'bash-completion', 'zlib', 'python3', 'libffi', 'opkg-utils', 'shadow', 'systemd', 'libx11', 'shadow-sysroot', 'base-passwd', 'libsm', 'initscripts', 'shadow-native', 'update-rc.d', 'base-files', 'expat-native', 'libnsl2-native', 'libedit-native', 'gdbm-native', 'bzip2-native', 'util-linux
 -libuuid-native', 'openssl-native', 'libtirpc-native', 'ncurses-native', 'sqlite3-native', 'm4-native', 'attr-native', 'libxml2-native', 'libpcre2', 'util-linux', 'util-linux-native', 'libpcre2-native', 'xz', 'openssl', 'ncurses', 'libnsl2', 'libedit', 'gdbm', 'sqlite3', 'bzip2', 'libxcrypt', 'util-linux-libuuid', 'libtirpc', 'attr', 'libpam', 'libxkbcommon', 'libcap', 'kmod', 'acl', 'zstd', 'libseccomp', 'xtrans', 'xorgproto', 'util-macros', 'libxcb', 'libice', 'cmake-native', 'perl-native', 'libcap-ng', 'libcap-ng-native', 'cracklib', 'wayland-protocols', 'wayland', 'xkeyboard-config', 'libxml2', 'libxdmcp', 'libxau', 'libpthread-stubs', 'xcb-proto', 'make-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/telepathy-glib-0.99.11/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/telepathy-glib-0.99.11/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: running: intltoolize --copy --force
| Can't exec "intltoolize": No such file or directory at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/recipe-sysroot-native/usr/share/autoconf/Autom4te/FileUtils.pm line 302.
| autoreconf: error: intltoolize failed with exit status: 2
| ERROR: autoreconf execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000:299 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000, line 299
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000, line 241
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000, line 165
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000, line 303
NOTE: recipe telepathy-glib-0.99.11-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2071 tasks of which 2065 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103183913.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103183913.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: telepathy-glib-0.99.11-r0 do_configure: autoreconf execution failed.
ERROR: telepathy-glib-0.99.11-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/run.do_configure.2330000', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/telepathy-glib/0.99.11/temp/log.do_configure.2330000
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.99.11.bb:do_configure) failed with exit code '1'

--===============1934387238821219340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-telepathy-glib-upgrade-0.24.1-0.99.11.patch"

RnJvbSA4YjQ5OWQ4NzMxNDM4N2YxYWJmYmM3NTI2OWI3YTdmOTliZjMwZGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODozOTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRl
bGVwYXRoeS1nbGliOiB1cGdyYWRlIDAuMjQuMSAtPiAwLjk5LjExCgotLS0KIC4uLmliXzAuMjQu
MS5iYiA9PiB0ZWxlcGF0aHktZ2xpYl8wLjk5LjExLmJifSB8IDk3ICsrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdGVsZXBhdGh5L3t0ZWxlcGF0aHktZ2xp
Yl8wLjI0LjEuYmIgPT4gdGVsZXBhdGh5LWdsaWJfMC45OS4xMS5iYn0gKDE1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3RlbGVwYXRoeS90ZWxlcGF0aHktZ2xp
Yl8wLjI0LjEuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3RlbGVwYXRoeS90ZWxl
cGF0aHktZ2xpYl8wLjk5LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggMTUlCnJlbmFtZSBmcm9tIG1l
dGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdGVsZXBhdGh5L3RlbGVwYXRoeS1nbGliXzAuMjQu
MS5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS90ZWxlcGF0aHkvdGVs
ZXBhdGh5LWdsaWJfMC45OS4xMS5iYgppbmRleCAxODkxZWFlNDAuLjg3MjNhZjg0NSAxMDA2NDQK
LS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS90ZWxlcGF0aHkvdGVsZXBhdGh5LWds
aWJfMC4yNC4xLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdGVsZXBhdGh5
L3RlbGVwYXRoeS1nbGliXzAuOTkuMTEuYmIKQEAgLTEsMyArMSw5NSBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsMTcgKzEsMyBAQAorIyAt
TW9zdCBvZiBHYWJibGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSwKKyMgLWFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uIGFuZCByZXByb2R1Y2VkIGJlbG93OgorIyAtZWl0aGVyIHZlcnNpb24gMi4xIG9mIHRo
ZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIyAtCisj
IC1HYWJibGUgaW5jb3Jwb3JhdGVzIHRoZSBsaWJtZDUtcmZjIE1ENSBpbXBsZW1lbnRhdGlvbiBi
eSBMLiBQZXRlciBEZXV0c2NoCisjIC0oaW4gdGhlIGRpcmVjdG9yeSBzcmMvbGlibWQ1LXJmYyku
IFRoaXMgaXMgcmVsZWFzZWQgdW5kZXIgYSBCU0Qtc3R5bGUKKyMgLWxpY2Vuc2UgYWxzbyByZXBy
b2R1Y2VkIGJlbG93LgorIyAtCisjIC1HYWJibGUgaW5jb3Jwb3JhdGVzIGEgU0hBMSBpbXBsZW1l
bnRhdGlvbiBieSBBbGxhbiBTYWRkaSwgdGFrZW4gZnJvbQorIyAtc2hhIHYxLjAuNCAoaW4gdGhl
IGRpcmVjdG9yeSBzcmMvc2hhKS4gVGhpcyBpcyByZWxlYXNlZCB1bmRlciBhIEJTRC1zdHlsZQor
IyAtbGljZW5zZSBhbHNvIHJlcHJvZHVjZWQgYmVsb3cuCisjIC0KKyMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyAtCisjICAgICAgICAgICAgICAgICAgICBHTlUgTEVTU0VSIEdFTkVSQUwgUFVCTElDIExJ
Q0VOU0UKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLjEsIEZlYnJ1YXJ5IDE5
OTkKKyMgIAorIyBAQCAtNTE5LDYwICs1MDUsMyBAQAorIyAgICBUeSBDb29uLCBQcmVzaWRlbnQg
b2YgVmljZQorIyAgCisjICBUaGF0J3MgYWxsIHRoZXJlIGlzIHRvIGl0IQorIyAtCisjIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgLQorIyAtTGljZW5zZSBvZiBzcmMvbGlibWQ1LXJmYzoKKyMgLQorIyAt
ICBDb3B5cmlnaHQgKEMpIDE5OTksIDIwMDAsIDIwMDIgQWxhZGRpbiBFbnRlcnByaXNlcy4gIEFs
bCByaWdodHMgcmVzZXJ2ZWQuCisjIC0KKyMgLSAgVGhpcyBzb2Z0d2FyZSBpcyBwcm92aWRlZCAn
YXMtaXMnLCB3aXRob3V0IGFueSBleHByZXNzIG9yIGltcGxpZWQKKyMgLSAgd2FycmFudHkuICBJ
biBubyBldmVudCB3aWxsIHRoZSBhdXRob3JzIGJlIGhlbGQgbGlhYmxlIGZvciBhbnkgZGFtYWdl
cworIyAtICBhcmlzaW5nIGZyb20gdGhlIHVzZSBvZiB0aGlzIHNvZnR3YXJlLgorIyAtCisjIC0g
IFBlcm1pc3Npb24gaXMgZ3JhbnRlZCB0byBhbnlvbmUgdG8gdXNlIHRoaXMgc29mdHdhcmUgZm9y
IGFueSBwdXJwb3NlLAorIyAtICBpbmNsdWRpbmcgY29tbWVyY2lhbCBhcHBsaWNhdGlvbnMsIGFu
ZCB0byBhbHRlciBpdCBhbmQgcmVkaXN0cmlidXRlIGl0CisjIC0gIGZyZWVseSwgc3ViamVjdCB0
byB0aGUgZm9sbG93aW5nIHJlc3RyaWN0aW9uczoKKyMgLQorIyAtICAxLiBUaGUgb3JpZ2luIG9m
IHRoaXMgc29mdHdhcmUgbXVzdCBub3QgYmUgbWlzcmVwcmVzZW50ZWQ7IHlvdSBtdXN0IG5vdAor
IyAtICAgICBjbGFpbSB0aGF0IHlvdSB3cm90ZSB0aGUgb3JpZ2luYWwgc29mdHdhcmUuIElmIHlv
dSB1c2UgdGhpcyBzb2Z0d2FyZQorIyAtICAgICBpbiBhIHByb2R1Y3QsIGFuIGFja25vd2xlZGdt
ZW50IGluIHRoZSBwcm9kdWN0IGRvY3VtZW50YXRpb24gd291bGQgYmUKKyMgLSAgICAgYXBwcmVj
aWF0ZWQgYnV0IGlzIG5vdCByZXF1aXJlZC4KKyMgLSAgMi4gQWx0ZXJlZCBzb3VyY2UgdmVyc2lv
bnMgbXVzdCBiZSBwbGFpbmx5IG1hcmtlZCBhcyBzdWNoLCBhbmQgbXVzdCBub3QgYmUKKyMgLSAg
ICAgbWlzcmVwcmVzZW50ZWQgYXMgYmVpbmcgdGhlIG9yaWdpbmFsIHNvZnR3YXJlLgorIyAtICAz
LiBUaGlzIG5vdGljZSBtYXkgbm90IGJlIHJlbW92ZWQgb3IgYWx0ZXJlZCBmcm9tIGFueSBzb3Vy
Y2UgZGlzdHJpYnV0aW9uLgorIyAtCisjIC0gIEwuIFBldGVyIERldXRzY2gKKyMgLSAgZ2hvc3RA
YWxhZGRpbi5jb20KKyMgLQorIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIC0KKyMgLUxpY2Vuc2Ugb2Yg
c3JjL3NoYTE6CisjIC0KKyMgLS8qLQorIyAtICogQ29weXJpZ2h0IChjKSAyMDAxLTIwMDMgQWxs
YW4gU2FkZGkgPGFsbGFuQHNhZGRpLmNvbT4KKyMgLSAqIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisj
IC0gKgorIyAtICogUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBm
b3Jtcywgd2l0aCBvciB3aXRob3V0CisjIC0gKiBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQg
cHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgLSAqIGFyZSBtZXQ6Cisj
IC0gKiAxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFi
b3ZlIGNvcHlyaWdodAorIyAtICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBh
bmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgorIyAtICogMi4gUmVkaXN0cmlidXRpb25zIGlu
IGJpbmFyeSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgLSAqICAg
IG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xh
aW1lciBpbiB0aGUKKyMgLSAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFs
cyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0gKgorIyAtICogVEhJUyBTT0ZU
V0FSRSBJUyBQUk9WSURFRCBCWSBBTExBTiBTQURESSBBTkQgSElTIENPTlRSSUJVVE9SUyBgYEFT
IElTJycKKyMgLSAqIEFORCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xV
RElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUKKyMgLSAqIElNUExJRUQgV0FSUkFOVElFUyBP
RiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFCisj
IC0gKiBBUkUgRElTQ0xBSU1FRC4gIElOIE5PIEVWRU5UIFNIQUxMIEFMTEFOIFNBRERJIE9SIEhJ
UyBDT05UUklCVVRPUlMgQkUKKyMgLSAqIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1Qs
IElOQ0lERU5UQUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IKKyMgLSAqIENPTlNFUVVFTlRJQUwg
REFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GCisj
IC0gKiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1Ig
UFJPRklUUzsgT1IgQlVTSU5FU1MKKyMgLSAqIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQg
QU5EIE9OIEFOWSBUSEVPUlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOCisjIC0gKiBDT05UUkFD
VCwgU1RSSUNUIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RI
RVJXSVNFKQorIyAtICogQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFIE9GIFRISVMg
U09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUKKyMgLSAqIFBPU1NJQklMSVRZIE9GIFNV
Q0ggREFNQUdFLgorIyAtICoKKyMgLSAqICRJZDogc2hhMS5oIDM0NyAyMDAzLTAyLTIzIDIyOjEx
OjQ5WiBhc2FkZGkgJAorIyAtICovCisjIAorIworCiBTVU1NQVJZID0gIlRlbGVwYXRoeSBGcmFt
ZXdvcmsgZ2xpYi1iYXNlIGhlbHBlciBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAiVGVsZXBhdGh5
IEZyYW1ld29yazogR0xpYi1iYXNlZCBoZWxwZXIgbGlicmFyeSBmb3IgY29ubmVjdGlvbiBtYW5h
Z2VycyIKIEhPTUVQQUdFID0gImh0dHA6Ly90ZWxlcGF0aHkuZnJlZWRlc2t0b3Aub3JnL3dpa2kv
IgpAQCAtNSwxMCArOTcsOSBAQCBERVBFTkRTID0gImdsaWItMi4wIGRidXMgaG9zdHB5dGhvbi1y
dW50aW1lLW5hdGl2ZSBkYnVzLW5hdGl2ZSBkYnVzLWdsaWIgbGlieHNsdAogTElDRU5TRSA9ICJM
R1BMLTIuMS1vci1sYXRlciIKIAogU1JDX1VSSSA9ICJodHRwOi8vdGVsZXBhdGh5LmZyZWVkZXNr
dG9wLm9yZy9yZWxlYXNlcy90ZWxlcGF0aHktZ2xpYi8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW21k
NXN1bV0gPSAiY2JlYjBhMjRhY2MyNmU3ZjA5NWJlMjgxYzMyNGRhNjkiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOWUwZGYxZDhmODU3ZTAyNzBjZjBiMzJlMmQxY2E1YTI0YWE3MjgyODczMzYxNzg1
ZDU3M2Y3MmFkN2Y3ZDVlYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNjhjYmYwMTk5ODA0ZWNi
NjAwMWM3YzExZTU1OTZiYzNjZWE0MGE2MDAwOTFjMTQ0ZDE0ZjgzN2FjOTBjZDk3IgogCi1MSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNDEzZDgzZGI2ZWU4ZjJjOGU2MDU1
NzE5MDk2YTQ4ZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTdkOTAy
ZTRhZWFmMTFlNjMzZjgyNzhmOWEzZTViMmY5IgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25m
aWcgZ2V0dGV4dCBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYQogCi0tIAoyLjM5LjIKCg==

--===============1934387238821219340==--

