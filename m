Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.48780.1591047954317772000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DKgXS8s4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id r15so1009256wmh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t/zNw6Wl4GakfjUq0UN8Gqn2vv8Z63YACq6ApaZfINc=;
        b=DKgXS8s4gO2bi48weKyKdKx7t4khfTCmPG7YUjb1TaIb6TVSobWi7F3y3qSHJxLpfq
         jM3cQqmEa3aDyVxan7jOzRu5yGW9e0XmZjHqDEJdKLIbyxcTUR6nYy7Pia6BfXKFQgxT
         QyhD0+V3jr4a8Hkk4VuInFC02WJjMTQNHjX0EPD9OzL+WGdbytfcMV5SJCR+AwIePa1K
         DO0kyJIjZ7cEiMF/RBr48p1prOLWOANXapCJEWkdeq0u3rn2HpuhpP2KQivIHkf90FP6
         7Xu5kBeOjrs9ID/Ifb2sw+W6HnFdxphnUPumUKN7EBBhM1ZzS9ogMu/pH5b7zugBCGKh
         3YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/zNw6Wl4GakfjUq0UN8Gqn2vv8Z63YACq6ApaZfINc=;
        b=WRBTrpNmpGtm3dZ800LcDRVB14WjRjKvJcyJTaYuq0VskJW2Qe8oSmq85rRKU9OEhf
         BqAfdBTAOCgobm8u+Cq6vXLssBCDXzXN1dPUQ9YEz7vnDGDqRoLsZGBNTpszXyUfZEiX
         M3CCx3qUHNEjUasUXh+842cNPsXEC2pSgkMxcZfx2eVCqDi14Kz+iDsl1qklfCwCkyPW
         0VUKm1A9msZr4NRGlNaqb3y2LAWxlZ+MzACD5DgcpGXUa9zN9CphO/WyrKuZa91UsVfe
         OjkxOEIVJxUv6A35QK74wz66m/l9T3JifTi6QLm3hdGnNFtbWsTW5mkTR8AtanVZBzRH
         sn4w==
X-Gm-Message-State: AOAM531h1MBkrZ3PFALRr62/uVeGc1eTMh1C955bSuG9MaPARcpmi/ZE
	+77TGezJwsyjmVuJtni6Sm2wvUpceZE=
X-Google-Smtp-Source: ABdhPJwlbfYVmW6zuQOrnAehS7SsBVc/n5ES7ooOXwSHPgHOobwejlJwGi0X/qDAv4/iQuzvbgqoMA==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr1146070wmb.82.1591047952684;
        Mon, 01 Jun 2020 14:45:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:52 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 25/38] gnome-online-accounts: upgrade 3.34.1 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:03 +0200
Message-Id: <20200601214516.26624-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes in 3.36.0
=============================

* Updated translations:
 Finnish
 Kurdish (Sorani)

Overview of changes in 3.35.90
==============================

* Bugs fixed:
 !41 Polish some rough edges in the Meson build
 !43 build: Remove AC_ISC_POSIX
 !44 build: Remove AC_HEADER_STDC
 !45 kerberos-identity-manager: Remove unused signal handler ID
 #43 daemon, dbus: Enable checking if a provider type is supported

* Updated translations:
 Croatian
 English (British)
 Japanese
 Malay

Overview of changes in 3.35.3
=============================

* Remove Pocket (!18)

* Bugs fixed:
 !36 Drop the priv pointer from the GObject instance structures
 !37 Port away from deprecated GLib API like g_memove and g_get_current_time
 !39 webview: Port to JSCValue
 !40 Use the G_DECLARE_* macros to reduce GObject boilerplate
 #83 Add Exchange and Last.fm icons

* Updated translations:
 Galician
 Russian

Overview of changes in 3.35.1
=============================

* Bugs fixed:
 #8 icons: Unbreak providers without any visual identity

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ine-accounts_3.34.1.bb => gnome-online-accounts_3.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.34.1.bb => gnome-online-accounts_3.36.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb
index 74d71ec81..c3142ad9f 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.36.0.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "aa94d1dd07ca53729a036b5df1c78c05"
-SRC_URI[archive.sha256sum] = "4832ca8e48d3a497fc676e7b6f146009ab4206995362977b9805aa39f164783a"
+SRC_URI[archive.md5sum] = "44a37e1f8d4cac1dca0c41b57b49c2d0"
+SRC_URI[archive.sha256sum] = "1c8f62990833ca41188dbb80c5e99d99b57a62608ca675bbcd37bc2244742f2e"
 
 # backend is required for gnome-control-center
 PACKAGECONFIG = "backend other"
-- 
2.21.3

