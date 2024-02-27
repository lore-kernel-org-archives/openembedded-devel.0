Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC2BC54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:37:30 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.10305.1709033842744874538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJXCaEs0;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so5050622a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709033841; x=1709638641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LivT/MBKKB3RuETANKSbCZpOD/GJ6CaPrzCKvmLK8EM=;
        b=XJXCaEs0N9ce2BhGNjbXMgRXv3TEOutBZ0g6xfcAcY0a0JaoFMzPYxh4uZKhGIcRMP
         PKot9XgkLKBuGFFLDb4NmzcCE8IOk5mZ7gs5UrxMwtwdo4HvTjhmB9QuvfrmuVN0vjfp
         69wmedacAZ6Uf1b1eG0iDdPlALsLj0wYpyRUVBHOV0f8RIeRewP+xc8BZedFVYS64z9K
         c52uceAmWmOpXoG7Vo0DTv+1Ug3LB0sEkLMPAhIxQFJKuM6wg6P6T3CwGiBkED9WjDg8
         07gcbvxIeWvR8P04zKiKCQUwF5WJCBdGPz5R34Vcy2D1SvViyV384KtaoolIowV9eLmC
         SYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033841; x=1709638641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LivT/MBKKB3RuETANKSbCZpOD/GJ6CaPrzCKvmLK8EM=;
        b=ePpz44v9lUvAYPtJMaApca0yv3FaeV3q89rzCziWkssrC2yaEb/t/tfPftg3ruv0/D
         nUZNo5r4weKJx2hVy4Ifa8NMw5BiZSElhGJ7r4+oZ7alTkG34KWo/OowfRaxBXNoahkE
         9BuPgzG75ZxdwH7yCXIiGFOuWfw7ZzilL/rHtx7KwiwrrSDaUFClDf18I1q8pfoJBDXQ
         UKfg8VBqJBeBbsgfh/5wtgIpMhFPRu9N0Ywr50bl9P7QJdg426EfMjg+0JdIoJrTEi0K
         OHTtmFeaNcOj2eKGi6RR8BEVzzV90MULTjmgNxItMpgnapy6kPthuippsXVlqCnWjTil
         zTtQ==
X-Gm-Message-State: AOJu0YxlxZ6+2ZUVxtuKbasQSCC8OiG9HQEL7UiTZaJTMg7/QXVtKL/L
	uBqBnGIsxYRppgkWuaQsmFKjOWmmxuUVDK9rjlYajd4zRKGbA12Tkfmc9Bbr
X-Google-Smtp-Source: AGHT+IGyNjlpqd7L3yzpZHe4Z1d8MWBd9tmtyjRmbmhkoeUAIr3/bzm6qy7TuYf0TOlhwQFcPxd9Zw==
X-Received: by 2002:aa7:c985:0:b0:565:ec92:bec8 with SMTP id c5-20020aa7c985000000b00565ec92bec8mr3891278edt.7.1709033840885;
        Tue, 27 Feb 2024 03:37:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id co18-20020a0564020c1200b005664cef4908sm100276edb.68.2024.02.27.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:37:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] gattlib: use python3native and depend on python3-packaging-native
Date: Tue, 27 Feb 2024 12:37:10 +0100
Message-ID: <20240227113711.834767-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109040

* it uses gdbus-codegen from glib-2.0-native which depended
  on python3-distutils-native until
  https://lists.openembedded.org/g/openembedded-core/message/196136
  but distutils on host was enforced by sanity check only until mickledore with:
  https://git.openembedded.org/openembedded-core/commit/?id=8e3a5b0709384f2b455a82ac1e8e212686fe4456

  so on hosts without distutils this was already failing with:
  http://errors.yoctoproject.org/Errors/Details/754696/

cd TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/build/dbus && gdbus-codegen --pragma-once --interface-prefix org.bluez.Descriptor1. --generate-c-code TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/build/dbus/org-bluez-gattdescriptor1 TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/git/dbus/dbus-bluez-v5.48/org.bluez.GattDescriptor1.xml
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import distutils.version
ModuleNotFoundError: No module named 'distutils'

  and the glib-2.0-native change only changes the dependency from
  distutils to packaging which results in:
  http://errors.yoctoproject.org/Errors/Details/754692/

FAILED: dbus/org-bluez-gattdescriptor1.c TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/build/dbus/org-bluez-gattdescriptor1.c
cd TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/build/dbus && gdbus-codegen --pragma-once --interface-prefix org.bluez.Descriptor1. --generate-c-code TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/build/dbus/org-bluez-gattdescriptor1 TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/git/dbus/dbus-bluez-v5.48/org.bluez.GattDescriptor1.xml
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import packaging.version
ModuleNotFoundError: No module named 'packaging'

* packaging probably isn't as wide spread on host distros as old
  distutils was, so make sure it's available by using
  python3-native with python3-packaging-native from OE build

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index f54d833a01..7ad28d594d 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -4,8 +4,7 @@ SECTION = "libs/network"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=a87ee154f005a6f035b8b34ac2191f3b"
 
-DEPENDS = "bluez5 glib-2.0"
-DEPENDS += "glib-2.0-native"
+DEPENDS = "bluez5 glib-2.0 glib-2.0-native python3-packaging-native"
 
 PV = "0.2+git"
 
@@ -26,7 +25,7 @@ PACKAGECONFIG[force-dbus] = "-DGATTLIB_FORCE_DBUS=TRUE,-DGATTLIB_FORCE_DBUS=FALS
 EXTRA_OECMAKE += "-DGATTLIB_PYTHON_INTERFACE=OFF"
 EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake python3native
 
 do_compile:append() {
     for f in org-bluez-gattdescriptor1.c org-bluez-battery1.c org-bluez-adaptater1.c \
-- 
2.44.0


