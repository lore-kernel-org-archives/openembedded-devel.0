Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E14BC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.11456.1685531621283753703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ki6c/lJk;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-561c1436c75so80771237b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531620; x=1688123620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhKtlS/5sJvXGxsAmtufKfuIGKVFj+aRjnKuhdYGUX0=;
        b=Ki6c/lJk/eoDfFOHMmzlTrVf4+EBaEqDktySv4mLQRhe/NaaYdbFw/SSnqOGi1nRWr
         nwY2TeH5DsgthDJGM5UYxQviBNd574jSyQPNZdd0moVM0/dEWpvQxa4YYMK0pMR/mNtY
         MfVM6x8jdGLx9HxgSxc0sLHg8oFfCd8P4uUwUZzagK47xABTbrJQQt9qQgvn0CRNhLo2
         1Zd9/FEHn5kn0V8ctAXXRg4YUEb9NCN5Nu7pzd3n65QohkdkRfsYW+tUeMn8OJHvWL+M
         G58lCUGPStayKelmLfAtc1vI0pWsafoF5t/i3/1KaudK/q7BFhWqOshaHxd+Qty1rXvc
         F8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531620; x=1688123620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhKtlS/5sJvXGxsAmtufKfuIGKVFj+aRjnKuhdYGUX0=;
        b=M+Jc9qUobhDYg/hW3YSKIjCdnMqUKNvuoWHJywA9fctktTqrj9lmjclk58Z5X/ECBQ
         OnaGJ6aMbrc9rE+PiOd0gUJ9pRYtJ2wVp3yaX9HhM3Pq5WUeKJ30UNSvPESTOjwDkotN
         ffexFPuo4u3Y2mWW7u6dlGLFC7qiPmOXQOAat0kcEWTWjHv8sJ5zFPMRfxp+ozhOiJTt
         ciFZiQfscD+D5rNeC7QN2HS+5rtjmPCauouB5z4Vu8D5qTukKFru4EIv3AkwdXCS0kyL
         47UjvN2RyJxhFp3OSCbmLfSkVLqUllogSVeVshQrTdo5AgAYEKklMwv62VpM28xxxYOR
         Xe/g==
X-Gm-Message-State: AC+VfDwldwjwhOT7bCL8F5AIMkjjlEF+ODLGZ2OMpBY5WAEKl2mza74+
	R9bUEcW3UogTpCVWU48NMssqJsuVdB4=
X-Google-Smtp-Source: ACHHUZ5ufbmf2xD0rRC6trxdAYZ54dIrMimQIM0XIFj1Xn3l+cCTgV4r3U2ePPmRYw2zEHwgV35SJw==
X-Received: by 2002:a81:618a:0:b0:565:9a3d:a3f9 with SMTP id v132-20020a81618a000000b005659a3da3f9mr6574379ywb.9.1685531620235;
        Wed, 31 May 2023 04:13:40 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 29/36] nautilus: Fix buildpath QA errors
Date: Wed, 31 May 2023 07:13:02 -0400
Message-Id: <20230531111309.2454603-29-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103058

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aca77cfa3c0b6ba4ae011918bef7cadc7fe365db)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Replace-filename-with-basename.patch | 46 +++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_44.1.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch
new file mode 100644
index 0000000000..dbf42a9ab9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch
@@ -0,0 +1,46 @@
+From 4ec1f99f170033138036d6547dce9b7dcf541338 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 07:56:33 -0700
+Subject: [PATCH] Replace filename with basename
+
+This avoids emitting absolute paths into generated sourcecode, it
+improves reproducibility. See [1]
+
+[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/1211]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nautilus-enum-types.c.template | 2 +-
+ src/nautilus-enum-types.h.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/nautilus-enum-types.c.template b/src/nautilus-enum-types.c.template
+index 9d8ac83..a757949 100644
+--- a/src/nautilus-enum-types.c.template
++++ b/src/nautilus-enum-types.c.template
+@@ -4,7 +4,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* Enumerations from "@filename@" */
++/* Enumerations from "@basename@" */
+ #include "@filename@"
+ 
+ /*** END file-production ***/
+diff --git a/src/nautilus-enum-types.h.template b/src/nautilus-enum-types.h.template
+index 399bbca..7eb6c54 100644
+--- a/src/nautilus-enum-types.h.template
++++ b/src/nautilus-enum-types.h.template
+@@ -8,7 +8,7 @@ G_BEGIN_DECLS
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* Enumerations from "@filename@" */
++/* Enumerations from "@basename@" */
+ 
+ /*** END file-production ***/
+ 
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
index 9c60d15d86..f7eeb5f5d0 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
@@ -26,6 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+SRC_URI += "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] = "360802a595e3edbad962c8cea353b62baa8be407513b5162c89c933ca5387aa9"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.25.1


