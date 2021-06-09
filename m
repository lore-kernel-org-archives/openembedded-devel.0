Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.4381.1623220725586865719
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aO09iv67;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id i13so27440006edb.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xcxeBrhmCDglo5TG13TThxZlJt9301chtPj7Wm2s7sw=;
        b=aO09iv67LD7E3CE3TV897g4v5l3U9WPoYvUr3D7e+El5QaGYR1DL5XKoEptVIW9VDY
         xB2bO5QsSADfyHyedUtuyAy84/nVwU76PAdsKfVLjTY6GRBcm+6qs7aVT1mbM2GSesyi
         3Cs592NJF5GSnumeiriZIwOv2Vkk40urhVSvJj07wFnqqTyCoq/JV7+8m8Q7yyjIwnsj
         s4iiKJmDZcuBvNKCbDgQNHvkh4yK7qkiz1Rj23dJWVRhtR37ZtFXDooLXjCYXL8EuP2x
         QCKZx9ziJTeqaAVjO9xDlumQnZJVLPRKJCDKw94qBZcxPJ6HcL9ZzuYrqsXkf5JjHY+4
         KQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xcxeBrhmCDglo5TG13TThxZlJt9301chtPj7Wm2s7sw=;
        b=NORnJHUVN9IUJac82QADkVr0wVF+V0rU3XuficXALk7UVTC+Te7VLmYOMsw9U5ytmS
         iYQ9dshD2bX4FzdMHq10zcZIMXnFRJlXFb6zkMgcWxX4IspHXTPlect1alSCroWshbzV
         EreNNnySrLyfybAURkQR9rkiedGXRODmYolX0b8ZxBrtwIFhP449oUCGjjbB9yMtz7yt
         2NRqYKe94pCMU+W56dkF1Gg792qZxGV3JKTH0tqJVExmZdicyQepXTiC6PZsKBNEKlmK
         CDxg5MusUREj7hQafXWo1Pnh1ahmET4r7UxzhYgLHGOwkUWpJUNWm3FQY1vQL1Fqn5VS
         RKaA==
X-Gm-Message-State: AOAM532IiptrcUo6GWZrf3YB/auYzArqEn2BoSCAFKCKameX9WISGXsa
	FwaSST9gO3IhqgbqWCsiCi5T9rtUf5Jh5w==
X-Google-Smtp-Source: ABdhPJxKBFtXSTCCHPuJ/jO0DhCpesjN+MdbvXsd5XyOpF5daXNbdpDwdLIR0DiAJqefX0RPx6eCIA==
X-Received: by 2002:aa7:cd42:: with SMTP id v2mr29705220edw.245.1623220724029;
        Tue, 08 Jun 2021 23:38:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:43 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/28] atkmm: build with meson
Date: Wed,  9 Jun 2021 08:38:05 +0200
Message-Id: <20210609063831.3400611-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
index edcc4769a..a3e8bbf49 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm"
 
-inherit features_check gnomebase autotools pkgconfig
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.sha256sum] = "a0bb49765ceccc293ab2c6735ba100431807d384ffa14c2ebd30e07993fd2fa4"
 
-EXTRA_OECONF = " --disable-documentation "
+EXTRA_OEMESON = "-Dbuild-documentation=false"
 
 FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.31.1

