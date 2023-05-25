Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D419C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 05:47:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.5512.1684993636832980705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 22:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B+Sg1qgZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae5dc9eac4so7883595ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684993636; x=1687585636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4pUB/Ev4N6YL6c1dLrkgYXnpMZZBaXsfrcdmbaemZk=;
        b=B+Sg1qgZCq2mrg0vZKuE8n7P8Q7/ifW87OvHwvgZT+2nVvI3IhAA4skRlUAp7ALssh
         rSk73QO+KraLljoGNyQFqqqwaUYoXL0XqhOpZIe6kXpxGNoTaJFce5O2ToC41SUyA7Z4
         fwk25tsWNdoFtvFS9ActaNuUIZiWPav2lfGpdUUrcUmF9/VZvvr7lIV2pEfVzL8FxiQa
         BLTbu61Jk4R4aAigc6suoytY+IqVLqu/M20zl6Ew8sf8qRQCkfDMqRG+AzAcAofMJgOR
         oYkRFJxDxKf9Ozb9FqcmYIDlUMJQGnV0RTVe/mnmbM0lzHTChB8ylXiw+oRRs4AzypEk
         c/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684993636; x=1687585636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4pUB/Ev4N6YL6c1dLrkgYXnpMZZBaXsfrcdmbaemZk=;
        b=E/rqq8+c38dU5WnvtpETOpuu0VlShM8L1/NRjib2cr8KEvDS4T44Ep/b5OQP9qYn3Q
         TTMEunsJjLc3t5GpL5GJKWSv0hBAiDRU8as7FZ70G+QyFCl4CTtr0ct9RYa+0XqrtWDn
         zU37QMQS4nNJIXISMxSnANLNhK+CqXaGVtoDIDmT4cvfD4VP8e2ygPtZfj0UZgX7heBY
         /LcK2BjQ7ta64CLO0NWfhLfLemIhFjeDth8R2TP1VWLjx1lYtxYGI0PY45DpB9VHU30V
         pg3gnPaPbszgdCKK3MXI3RXPa5KzEfZtMz6qm39A9ewsc8VDLCMOZIN6LZHsE8luCYMm
         JDVg==
X-Gm-Message-State: AC+VfDwOC9pkGFqPUtdahlqLyUcZyJgyeAr9hX/mpJKmV4Y/rmlxl8qw
	D8N8vl2j6qimhkDluvtgKmMpUhQIVEY=
X-Google-Smtp-Source: ACHHUZ7YJjY6jV27a1lIybCDFUBlizs9A1D1jDkAcpsovHzU+MPCTyyBuHhalz8qZHJACsc97UFiFw==
X-Received: by 2002:a17:903:2308:b0:1ac:71a7:a1fb with SMTP id d8-20020a170903230800b001ac71a7a1fbmr513783plh.18.1684993635931;
        Wed, 24 May 2023 22:47:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001a6d4ea7301sm441286plt.251.2023.05.24.22.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:47:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/5] eog: Fix absolute src paths in generated files
Date: Wed, 24 May 2023 22:47:11 -0700
Message-Id: <20230525054712.1593592-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525054712.1593592-1-raj.khem@gmail.com>
References: <20230525054712.1593592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 05:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102802

Fixes

WARNING: eog-44.1-r0 do_package_qa: QA Issue: File /usr/src/debug/eog/44.1-r0/src/eog-enum-types.h in package eog-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-filename-with-basename.patch | 48 +++++++++++++++++++
 meta-gnome/recipes-gnome/eog/eog_44.1.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch

diff --git a/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch
new file mode 100644
index 0000000000..26d75780b2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eog/eog/0001-Replace-filename-with-basename.patch
@@ -0,0 +1,48 @@
+From d00edda1f57f904e1590828bea3cedb53d789c48 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 20:33:59 -0700
+Subject: [PATCH] Replace filename with basename
+
+This avoids emitting absolute paths into generated sourcecode, it
+improves reproducibility. See [1]
+
+[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/eog/-/merge_requests/154]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/eog-enum-types.c.template | 4 ++--
+ src/eog-enum-types.h.template | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/eog-enum-types.c.template b/src/eog-enum-types.c.template
+index 0249baf..1013dcf 100644
+--- a/src/eog-enum-types.c.template
++++ b/src/eog-enum-types.c.template
+@@ -4,8 +4,8 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
+-#include "@filename@"
++/* enumerations from "@basename@" */
++#include "@basename@"
+ 
+ /*** END file-production ***/
+ 
+diff --git a/src/eog-enum-types.h.template b/src/eog-enum-types.h.template
+index bc3c195..8f4e916 100644
+--- a/src/eog-enum-types.h.template
++++ b/src/eog-enum-types.h.template
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
diff --git a/meta-gnome/recipes-gnome/eog/eog_44.1.bb b/meta-gnome/recipes-gnome/eog/eog_44.1.bb
index fad7de6b28..95e421c883 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.1.bb
@@ -21,6 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
+SRC_URI += "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] = "e2c963f232fe5a1091dcc18bec25a730e91b02af6e466601efa55e500cd74cab"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.40.1


