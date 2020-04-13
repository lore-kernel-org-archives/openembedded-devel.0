Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.1843.1586814316877917855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 14:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iNMUjKlB;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id v2so3880690plp.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZR889BotVsn3gUBp/Mbv0k8DAp2s8HvczQo7Q2ldDBE=;
        b=iNMUjKlBXA4t4P8Tppu7IO9eh8Ac7Memp9EseR/yKVHF30n7CINYQsinaBQRpcz5ZO
         2E8l9XstAd/CJmfsdXMk/M+41MZnl1iZEyCouqr1oBYs2g08WrI9oA1eHup94iUcVXIm
         NR5raZRNWjFZCim8OuSzJVDZJgnL+d21Z9Ap5kPmKZhNFLuvYsq8W6RvEYYcHUYh9SRa
         gsgSMkl1bGq/sieNsVSs3QNnZj9LUmTclAdsL5qbLMnJE1HT4+bYcoSuGSOrN8U4LM0/
         N158Vc5IU0riKnxt5nvXsrAJk43WFmusmtQdRJ6JOkNFTE6/QNTNU0Aq4wFikXS5OlZ/
         zHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZR889BotVsn3gUBp/Mbv0k8DAp2s8HvczQo7Q2ldDBE=;
        b=szw2ZEk6yTaUm7STFVu6DPWTevAr7CmYRDFUQ9Opz3SUlqce+jYIftDwVWV3ujTnI2
         rR6QanpXYt2/TKdHwjXqvcd17hlegzIZ5237UmYU6m/1HBV0n18P2soFy0rQg2RlM1m+
         BpeEG+xL+2Yh/Y14OGdD2og+l1PFfpe24ZO5wFMU94zfgmQdxsrFtevIf20OD1KRwEpu
         cFq1n1J0aUwTQj4v/rCDGmeFJed8Vi5iOgz4HaEOiMB2IRbK3UJM+Z1q94QvVMgrt37M
         6mI5mWOvcaMvYcjOOC/9xJQmKoiKDJ7PErsVLD7OrddlZEHueQK7BdOcipmsuDiVQO2s
         J7iQ==
X-Gm-Message-State: AGi0PuarRqe65WW9tW/NDlygR9f2BtHfyHx8Z4nLKz/IR6KSO3xNA9xQ
	x+nDK3ND+1WJnNqriGIKxPwsoGRBInU=
X-Google-Smtp-Source: APiQypLBKzPGPkuOxN4hhQx31HD77xTD504ss83x3yVKFLj0xM5v9cz3YfU05f+ls9FuQQ4IKDvU4Q==
X-Received: by 2002:a17:90a:246e:: with SMTP id h101mr21399934pje.83.1586814316015;
        Mon, 13 Apr 2020 14:45:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id s15sm6650165pfh.17.2020.04.13.14.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:45:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/3] gnome-bluetooth: Add check to require x11
Date: Mon, 13 Apr 2020 14:45:12 -0700
Message-Id: <20200413214513.1793854-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413214513.1793854-1-raj.khem@gmail.com>
References: <20200413214513.1793854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gnome-bluetooth needs libcanberra compiled with gtk+3 support, compiling
libcanberra with gtk+3 support would need gtk+ which needs X11 to
support the needed backend, other option is directfb which will not
worrk work with wayland(without X) config either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
index e7c1099a9a..77c89d95c2 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
@@ -11,7 +11,9 @@ DEPENDS = "udev gtk+3 libnotify libcanberra bluez5"
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-inherit gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-is-even
+inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # gtk-icon-cache bbclass will take care of this for us.
 EXTRA_OEMESON = "-Dicon_update=false"
-- 
2.26.0

