Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4429.1623220729850350778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SwtzU2zZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l1so36665619ejb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h6dR6M/8uprx84KdoPkqhtlenwQ8XAvOKTMZJ0vnuyI=;
        b=SwtzU2zZOjANJKaGv3EVPQ6YI7vM2K7iJM++DZCBuCsnx3Nl6+aM7I+SYL8F2NXS+p
         bFUNqXQjzeTwd7r1nuuyi2eKHzjLoSQ9p3ASeFqPnMIN4JGsQ/c6ftE9aENObYi9Vq2B
         EWVEjLDRElVQB+iGa9Aq4KH2Rcaka1ZEdVS+UxIdqu6MDBN+UPUt65NYIbmpwTflQsNt
         rpJyz6H2UrJSw4qZIlSAWGAzZx1qWABeBK3DvloD8UCFBZAw2FDZcR7I+Ha1n3NI+brc
         9pgD6sgpg19zvcNEGpQF6fEBcBNrh53rrkJyUmU9PCN5A0Knn7ru0GjmyKwID3nHhkeS
         vfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6dR6M/8uprx84KdoPkqhtlenwQ8XAvOKTMZJ0vnuyI=;
        b=F5WZbkMEYpTUvsL3z/h8K52sPeJeZNI6oa3VnkWouZwwVXI4uzGGlkmE6ZcAV93q/h
         DGh42ySDabfvITZNhsUJBPvcBCC2aycAbp2SverK3Z+mTK/9yW48u26DeBnFPelzoFts
         T1Oe7sWi+BZkxE+/Tsy55gevv4ZoDchJb/SNoZn9eyySS8hGRNfCoBLsCdC9uc2KSxaG
         h5pEFbIoTfq4X+oG029rbsiWYbCGCb0hMUkt5tO41RLHy7Xu39r8RoMNXH5p1Dk8u2Q8
         MInCQ3ZcQ7g8WmB+M4Nua9qPT2PZaQSFq+uUTdcscR3mdCEQ7EXCwioWOpefaqRxtcau
         R3yQ==
X-Gm-Message-State: AOAM5303HDsE80Gd8ZYjjxQxjU3wpS3rgbKktAdLI7ExfbgTXzDniMBT
	r7QOb+ONNyAu7dWmJ8JfKLScs1BQ6flu0Q==
X-Google-Smtp-Source: ABdhPJx4W+7Rvui6oDh0kVkWZkB8W0W2Il1BDfZuGvPA+0H4fCx+D/d1b3VgZMaHv1O53ud2S3IoUA==
X-Received: by 2002:a17:906:d8cf:: with SMTP id re15mr27521781ejb.278.1623220728386;
        Tue, 08 Jun 2021 23:38:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:47 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/28] gnome-autoar; upgrade 0.3.2 -> 0.3.3
Date: Wed,  9 Jun 2021 08:38:11 +0200
Message-Id: <20210609063831.3400611-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major changes in 0.3.3:
* extractor: Fix extraction of one file archives (Ondrej Holy)
* compressor: Fix usage of uninitialized value (Ondrej Holy)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-autoar_0.3.2.bb => gnome-autoar_0.3.3.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.3.2.bb => gnome-autoar_0.3.3.bb} (66%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.3.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.3.bb
index 8eba85941..5d7a9a657 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.3.bb
@@ -9,8 +9,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.md5sum] = "3c8da1a8489255f2aaa5fdb690308e5d"
-SRC_URI[archive.sha256sum] = "a48c4d5ce9a9ed05ba8bc8fdeb9af2d1a7bd8091c2911d6c37223c4f488f7c72"
+SRC_URI[archive.sha256sum] = "272400f73a375a7e88fdf1e12591bfb8f3f03edf01780cadcd74f70b613e5c04"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.31.1

