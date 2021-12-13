Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4057C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 01:31:09 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.5845.1639359068862572829
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 17:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=f7nJhfju;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id d10so28091642lfg.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 17:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9+mX4foXz6e5GbSj60lQQ+Kb9t+q3aFFc7MLQM2b0Q=;
        b=f7nJhfjuT0SzsYUqI5lJdQmE2Hl5B1Afc0BfDMd/GVAq+Fc46QSE9j4zITBhvtkkz4
         uW8cxZcFYzZj2Uw5uBOFaJKTalYgbShINi+v4W7LEUxzdrsNLAmo/HayoF4dBV+GTd86
         GBEgAzeQtzU67nnuvhaXEwx2p3oNO2o9ix1Ljx9qbZxVq/yB73sJ4+1qwoNJdedQEasR
         UBMNB53A2q49DVmekNRCaFDYx1X2hDEsotZwi2JYR6R2bfXzlsTQxqkcBv215D5Ygm97
         hu0n4/0/9Mze5XdcSeYfgqTeJYvo1TplrsZk00BDupvlahRwm3CeriXu+Uh+EVtALBfI
         t9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9+mX4foXz6e5GbSj60lQQ+Kb9t+q3aFFc7MLQM2b0Q=;
        b=BSgXlSsnBH8F8xd/Ockbv4nhn1M3U7BgGYp5Q+s7tuafbNueGEjdPsZ4MwlK1hDnM2
         a5CcuS6Y/VNvT5S+QfjtwOTGhxORYtKfqg5QsYcDfsEyKGBnDwQxbuXOJqu7DM2imKxh
         +zd5uQorfBRSfgZRwc0BpgjHVnkBTzw465jny2unA0Ekr8/rbFE58MohiwrMVJbYqI/5
         so+jEHo+pe0x+UkKPDh6c6uIurfkG8uy4FoUfm80gTzPrGLd7gGbOmbtemxp4ZPeY+Zu
         /VW6M0Wuy3bGwiHhsUnbR7rS+Em1sYtD8hqsbYbUKdboooxBF8Wqaurt3X8vEE6fCFGr
         3VJw==
X-Gm-Message-State: AOAM532vjMdA+QBqVUUEULl7uWCktSdFodAiBNVrLBtI9TVshn/JzR24
	OES06/ZQO9WgHTRK/n1Rp2p8dpz3uAjNW1Hb
X-Google-Smtp-Source: 
 ABdhPJz0wUSKAWL9qx2GAyoJ+bWVRLzMnC6jGmLyWRIrXkZ3u/N+fjE5SlrMIj1+q999Dsrkb4n4bg==
X-Received: by 2002:a05:6512:34c6:: with SMTP id
 w6mr25466806lfr.527.1639359066716;
        Sun, 12 Dec 2021 17:31:06 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x3sm1226377lfq.238.2021.12.12.17.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 17:31:06 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-gnome][PATCH] sysprof: update to 3.42.0
Date: Mon, 13 Dec 2021 02:31:04 +0100
Message-Id: <20211213013104.627547-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 01:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94309

Dropped upstreamed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch | 35 -------------------
 ...E_FORMAT-instead-of-G_GUINT64_FORMAT.patch | 31 ----------------
 .../{sysprof_3.36.0.bb => sysprof_3.42.0.bb}  |  7 +---
 3 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
 delete mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_3.36.0.bb => sysprof_3.42.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
deleted file mode 100644
index 75aa86cdb..000000000
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3025d80aaacc5f67aa9eb1e6fde30f71d9c5b04b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 Jul 2011 16:00:17 -0700
-Subject: [PATCH 1/2] sysprof: Define NT_GNU_BUILD_ID if undefined
-
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-%% original patch: define-NT_GNU_BUILD_ID.patch
----
- src/libsysprof/elfparser.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/libsysprof/elfparser.h b/src/libsysprof/elfparser.h
-index 160e4c9..94fa5c0 100644
---- a/src/libsysprof/elfparser.h
-+++ b/src/libsysprof/elfparser.h
-@@ -18,6 +18,10 @@
- 
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
--- 
-2.17.1
-
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
deleted file mode 100644
index d8fffbb7e..000000000
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5dea152c7728f5a37370ad8a229115833e36b4f6 Mon Sep 17 00:00:00 2001
-From: Rasmus Thomsen <oss@cogitri.dev>
-Date: Sat, 7 Mar 2020 10:44:16 +0100
-Subject: [PATCH] tests: use G_GSIZE_FORMAT instead of G_GUINT64_FORMAT for
- gsize
-
-This fixes the build on 32-bit platforms with -Werror-format
-
-fixes #32
-
-Upstream-Status: Applied[https://gitlab.gnome.org/GNOME/sysprof/-/commit/5dea152c7728f5a37370ad8a229115833e36b4f6]
----
- src/tests/allocs-by-size.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tests/allocs-by-size.c b/src/tests/allocs-by-size.c
-index 666113a..6260d4b 100644
---- a/src/tests/allocs-by-size.c
-+++ b/src/tests/allocs-by-size.c
-@@ -109,7 +109,7 @@ allocs_by_size (SysprofCaptureReader *reader)
-     {
-       const Item *item = &g_array_index (ar, Item, i);
- 
--      g_print ("%"G_GUINT64_FORMAT",%"G_GUINT64_FORMAT",%"G_GUINT64_FORMAT"\n",
-+      g_print ("%"G_GSIZE_FORMAT",%"G_GSIZE_FORMAT",%"G_GSIZE_FORMAT"\n",
-                item->size, item->cmp, item->count);
-     }
- }
--- 
-2.21.3
-
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
index 1f8351fc3..bb8f90c19 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
@@ -14,12 +14,7 @@ DEPENDS += " \
     glib-2.0 \
 "
 
-SRC_URI[archive.md5sum] = "3956e82b8744715006dde59e0ce8910b"
-SRC_URI[archive.sha256sum] = "8670db4dacf7b219d30c575c465b17c8ed6724dbade347f2cde9548bff039108"
-SRC_URI += " \
-    file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
-    file://0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch \
-"
+SRC_URI[archive.sha256sum] = "3c16e03efdfe5d3e71c4d239c67741ad37f72ce8971e2f7faf168dbd5e93e886"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sysprofd', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'libsysprof', '', d)} \
-- 
2.25.1


