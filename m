Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.40062.1595802914268162359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FCldPxVa;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id gg18so11779277ejb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VTH01ip+WvRo/7LsVW4nt+oeQMJ0CLavB9LqDoIz1Cw=;
        b=FCldPxVaacMarNQkarcLOP5YQ0wcQvoD8PAqWGnKWuLJX5MNAdDC1FmrpRfmYvuucb
         QmkYcIRmwZMhh+9lQ8OIjCwKsOh7uS50LJvgLphc81fFeJrbCVpylVR97BqJwwGeAo1e
         c72Dmv3PYBgTNMfjZ0Ll6/ga0xpM5W2zqX+Fru3L2JsqLeBOJjeQx4tkk2MbjBDUmii8
         6nGxNHYF6as57pw4g8mFXihxJqPGa2y+g/5oK7hjxqcQifRxp6xHhYi0UFrr3P12Dmz+
         u9tXSBl+ex8WX7E0qFgqhE7xWyrAC21/OK5CQVnzQzlO2F8NqwEERQ+9CDYNsbi5nAqe
         dViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTH01ip+WvRo/7LsVW4nt+oeQMJ0CLavB9LqDoIz1Cw=;
        b=QrH5Lsae3Hqy4ZAkVmnVGgnOgEXS7yKfCLnKp65ksxPzVIIyuuPLNeLXbnUL6311C6
         4AfZX1gbmkwO2YHP6MajPvYOFvQY7ffB4MCAZCbIKsntsIzKepYmkW1bm0ZTvTp5gFdw
         JlfxhEeL3n2OxWvOKsDlKnDfsAzVmH2Ny/awcs4BDOUiBVtniR9xZwLhIeXxfb0SXx0T
         1cbcwR1aXUfYmIt7alx0pDDgfMqnwywiYMIMu1LRzagbo04AoIkJNqNyz1seXkMS4Gz5
         h1GD+lV692hbmF8fiS0hgl0zbqYbaodq2rJcEyBmo4Pxp73VtEKMo49YNSxv6aYIf6Uh
         bIzA==
X-Gm-Message-State: AOAM531X6uELiWuoK6Qq4/QlcTcmwcbhcNtStR0HgFG1EFZ1AiRb2hbk
	GHKjU1h1ygTGEX+vgIxrcmgmeeat
X-Google-Smtp-Source: ABdhPJwUriaFtulWqg6FDpH9/PKfvBfWGOjhotDBk9GHIySMxXWouQCA3SRZazYGrMKrvV5DDR5vAw==
X-Received: by 2002:a17:906:f199:: with SMTP id gs25mr2786159ejb.161.1595802912588;
        Sun, 26 Jul 2020 15:35:12 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:11 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/10] libnma: upgrade 1.8.28 -> 1.8.30
Date: Mon, 27 Jul 2020 00:34:53 +0200
Message-Id: <20200726223455.333001-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

=======================================
libnma-1.8.30
Overview of changes since libnma-1.8.28
=======================================

* Properly dispose wireless security objects.
* Don't clear the key when users set a non-pkcs12 certificate in the
  certificate chooser UI.
* Added missing VAPI macro file.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libnma/{libnma_1.8.28.bb => libnma_1.8.30.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.8.28.bb => libnma_1.8.30.bb} (86%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
similarity index 86%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
index 3b1698e72..3f3cb90b7 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
@@ -10,8 +10,8 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "094c45d7694b153612cbdc3c713edcb5"
-SRC_URI[archive.sha256sum] = "4af69552d131a3b2b8b6a2df584044258bf588448dcdb4bddfa12a07c134b726"
+SRC_URI[archive.md5sum] = "e1ccac96405861ecab195be5524baae6"
+SRC_URI[archive.sha256sum] = "da33e72a49e07d855d97a52aa9a8962a4c96f52b9168c4e0027117ad8ffdafb4"
 
 PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
 PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
-- 
2.26.2

