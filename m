Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26550CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.14119.1758625602187877276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3/5N/0U;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso9328937a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625600; x=1759230400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEKsqSW8sWt+Uu/RAGvNP0ciHakh4x+PkP94fimNZ3c=;
        b=W3/5N/0UjRD307WWTKVopE5pD/5YyLOVWUhMzkQksNSsAvHZH1oaGDfHFt3i5IXQXM
         kk8d+G7zEIqGiB+9MpzpRwPKsuzOxUoJXn92H8XErQZ2L1EeGi1PiR32jPK7E3F7sOI5
         WdQ5YsQ62XBguzVVsWdwGX1uLbxp2wp/H1dcpTQwLRVSWJKDconB+1Hzhr5cKStQEkmu
         /Jlg5Lk/9qd/BAmClV6HPzkw4HRO7JdZhLjt97dcsOrhfBAdqpYzoWabt+JNvMHyNt0W
         DBL3gJQQal6nUZ9toyuFdgVnGV/+wm0eQ4rQVBiyfkBQHqPDM1ZiwHZZQ1zc+oQnAUn6
         OlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625600; x=1759230400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEKsqSW8sWt+Uu/RAGvNP0ciHakh4x+PkP94fimNZ3c=;
        b=ZTxdCkUm/sqOKQSAbVsGrBknUy9HN2wIevoWRxRG6pUlSdtwUOQkDLr8LPxK6Jf8PC
         bznvMj6HiM05NEvaZB05kFZKfK/LLPQCkSAMiG0IuiQ1dmfG/YSzuj/lQk2ZLdUZ2fx4
         uNfjscLCdjTvrxfyTYn8+NDmRXh48Uw66SY+biW/MKb0zuZNYfIahTnVZz5Q+5BGXWYF
         MRg08o5VwXr1HVBVp13xXywbU5cXkjx3iwCOnYEMjeNFR/jGgpMH/JyivhaVlc7X7A1z
         sBz51C2cGklSAI1dgI00RgwZrsqW/cY6khINapP6E6nE7tJu3I9LdpUD6cJ3oSZtLTbs
         t3SA==
X-Gm-Message-State: AOJu0YxCO50z1r8HUZFhXrXsXn7isMLVeidHolOUQsRVbSF+13wpPO7r
	74NiqlaEY+UbKrYVKYJnz/to4HDe749ztGa9BITkeYvUKCiGFwAPtQ0dPdBp/w==
X-Gm-Gg: ASbGncvF+nPmD/mIWU8MTYN7mCyTaoopcSgCw0agC+qJeBZQXMZkWqQz9nRClwmSLP2
	Oq2LhPhn4MyK+ziCnpNJ0J0dBNJI4yyuSjJIkW5nhRuwwrcey4JF0E+VLZqcAJewTBLj8KPjY8k
	sLak8+d48/4u5zc5zBTnVVrmRpG4dwR+ZeVfVAPeDIRlEej95iP1TZHZXW1Zysbo4lYFSTXrUl/
	ol64S3FcM4XyBuAtRSq2EqiNuLt1RtRVaqpzdE7DNJHtayOHYMK7pyEiAaI54bMzIC5kH+Bx7KK
	oYivR/14v7DYJqvnDvFHVmXk3FEuKAUvT6izwYw4nGqg7GY7gvA2SrBCOe8Lz1CanjfM+S0h+F9
	5tGsENuZN+g/JNO5vdyly
X-Google-Smtp-Source: AGHT+IF6/Rvw7125tnof3c+ljB0GdETyjh3Bdx7DRgWgG3e9yhobvMujgOIZsaM1z9rp/HXpgf/A0w==
X-Received: by 2002:a17:907:741:b0:b0d:ff2c:3cd2 with SMTP id a640c23a62f3a-b302679642fmr203098266b.12.1758625600094;
        Tue, 23 Sep 2025 04:06:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/22] libnma: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:18 +0200
Message-ID: <20250923110636.3413021-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119668

From: Mingli Yu <mingli.yu@windriver.com>

libnma depends on gtk4 which needs opengl DISTRO_FEATURES enabled.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'network-manager-applet', 'libnma', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a3eafe3698c9178d906f2e570e675999f941d395)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
index 75c704bc27..341e29c080 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)} opengl"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "5ed93eae18456ff5a8a4f408178c1ee198dc8d3a46c65f9075b101916e64e8b4"

