Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB73C7EE2F
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69127.1683477191715428731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DsM4Vcva;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so56929637b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477194; x=1686069194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=priMjADnSE/mj2F5wIZYYuPSfCDpjec7LxY7gmNbJnU=;
        b=DsM4VcvadASVMklC309Wm9qbdf6GOHVzHt9fFbAarPjOYz/UWZAXCePKY8ep1MU1x2
         J+3AcYch42/EVH4ZIEC/FjNcGtNF3Y7SoEYv3pdzo7xt11nw6zl5KHi38TkL3IvTcDWK
         kRlB99ryDSDC+YKWD33vOGVlWs5Iw8ZGGsIkv9B8ZgAGugE1UAYDTyZkHpNvaQvm/BZ8
         GG5zF/T/o9jWsqgzLg8j/4G4A9Nq0kN0nqe7XRFknKJadGzeQgG09wf5bBl3ICGh6etI
         ikSw4oBtYFuZ1JHIzZiLjyXstejFb2w/ywXXV/vhnrwP0OuWs5+rQBB++2YIZD6+ZLA2
         luhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477194; x=1686069194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=priMjADnSE/mj2F5wIZYYuPSfCDpjec7LxY7gmNbJnU=;
        b=TdApTyUTO1N9qTwOcaP78okFR9kJdd6NCQ/UMkwPit3JiFBey04k1oe42RTGPlDjMk
         o91SEYAanoHfXSUhPf8DdtM6O4liwsZTtd+v4oPtJYiCZ5EEH7Cz88aba5tLJmJ/a6J0
         0f/Qb71QnTYJ4mbwqaBAmPDGspQWyqYaIVL04JdrGWebfJnZ2sVu8tVVvRYLz9FGGlh4
         CJzFOkFUJGUEmh1ImZQO1qZDWlk054PlBbcvh13rjrLJMi/dtUn55HrSoHU27IJBtkJD
         MslRT0ed6sbHOxU/Q753FNDhb4LPKf42ET+A9KzmrWujbf4WgFgIK8kj7wn9U7bWFi4a
         ebmg==
X-Gm-Message-State: AC+VfDwt/POrlCKnRgfLgvL8d0WZNq4e5fo2XovTUfXVRzzkJEIDbyTP
	XuSIf+3CfHn9ZJi9ytCTrqgjujElrRU=
X-Google-Smtp-Source: ACHHUZ6YK6BI3HuoHT1bjfbQ27nEsrsWEhnZi2x/XeAHTW4//WB/n/TKXd0Zl2R70b7Eog4Argy30g==
X-Received: by 2002:a0d:eb09:0:b0:54e:84f6:6669 with SMTP id u9-20020a0deb09000000b0054e84f66669mr8495989ywe.49.1683477193814;
        Sun, 07 May 2023 09:33:13 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 08/29] fwupd: Do not emit build time paths into generated headers
Date: Sun,  7 May 2023 12:32:44 -0400
Message-Id: <20230507163305.3261044-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102338

From: Khem Raj <raj.khem@gmail.com>

Fixes
WARNING: fwupd-1.8.9-r0 do_package_qa: QA Issue: File /usr/src/debug/fwupd/1.8.9-r0/src/fu-plugin-builtin.h in package fwupd-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62a3fa25e4b685a51acba19da62b2387346c8abe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...lute-buildtime-paths-in-generated-he.patch | 41 +++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch
new file mode 100644
index 0000000000..2273bdf105
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch
@@ -0,0 +1,41 @@
+From b1df1ed3a21b8ef0244102043a8fb88b0ccc3f91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Apr 2023 11:30:21 -0700
+Subject: [PATCH] meson: Avoid absolute buildtime paths in generated headers
+
+using meson.project_source_root() means the path emitted to include .h
+files is absolute and it makes its way into PN-src as well, which infact
+is not going to work if the -src package was used to re-build this in a
+different build path. Therefore use relative path which is '.' and
+relative to ${S}
+
+Changes
+include "<abspath>/plugins/acpi-dmar/fu-acpi-dmar-plugin.h"
+to
+include "./plugins/acpi-dmar/fu-acpi-dmar-plugin.h"
+
+in generated build/src/fu-plugin-builtin.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index b9f6736..bb856ea 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -188,7 +188,7 @@ plugins_hdr = custom_target('fwupd-generate-plugins-header',
+   command : [
+     join_paths(meson.project_source_root(), 'contrib', 'generate-plugins-header.py'),
+     '@OUTPUT@',
+-    meson.project_source_root(),
++    '.',
+     ','.join(plugin_names),
+   ],
+ )
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
index 14d83ec521..1f95dee1be 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-meson-Avoid-absolute-buildtime-paths-in-generated-he.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "719a791ac4ba5988aeb93ec42778bd65d33cb075d0c093b5c04e5e1682be528a"
 
-- 
2.25.1


