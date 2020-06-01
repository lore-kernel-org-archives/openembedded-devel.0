Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.48782.1591047960312020765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aym6NhUx;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id l11so1348410wru.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=olVLbvfTKlGglovR5YSrTJXZrTHGB3Xq42urIbqL0nQ=;
        b=aym6NhUxdURYEA0YqVRh+iOGoR72aZfe4Vte5nT9CHhC5UQk5YwqeDadiXIuZazUOA
         ng1fGvzr1Z6MJxT18VlViLaIeFuOejrBACkQrVccKQ5GKMvH0lZYPqP82Wo+x2sIgHu9
         B4VIAlLOQkW5jL03nSN3F/dCKtK+dcXuCdBvhnkNIu66Nry/BkDAQDmKGc/LaimeCmdA
         nkEyGdk6DKRhk5lg0reK8W7BenpGcdNclSh5qosEhKoAJu5BKmGP89DvRaEnJCU6Svx1
         xlKo4amDbsvgcsubg/5sN1Us1UOp0wrt+el32KZGzksgD/Zi4pFOZN3RSIk+jR3xAGZH
         y1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olVLbvfTKlGglovR5YSrTJXZrTHGB3Xq42urIbqL0nQ=;
        b=Cr/YXh9DzUfrJn6fdhbJIOeCN6P1kbQt7K0I3420X1qeOmxO43uTX8zSZh7Q32mTmX
         yTKoFkZjiwv2fq2xNuoJ2WXEFP098wMtJh0WvoiTD4NR0h6RuyZeuuBKIkFrVWX5rZei
         bS18FNsqq7HM4+ESBUW5O0V7jS7tBfCRtOsQQu5nRFwL1XYiH9QNhRsinsLQTVEPGVjy
         DeUmBxpw53KyO++oljwc3Bk2wXNAhHWH0a+L8D2rwshEPxBM29cxoxk8+x4txqBnhfrW
         FfUxX/GffbbzRK6FEGVYBx0aKRCO0NStM534W0xLmqS7ya3l4n1eqKcwxUMisg3I90v8
         CXMw==
X-Gm-Message-State: AOAM5313bEUMpqT+TG7SlZkNzvXpWG5xMaToDEQSIIwUpRzTbSrgBWDb
	mdOsHxk2r7ctMxwYqoHKS3KAFwo7Yrk=
X-Google-Smtp-Source: ABdhPJyY4dHJmJaCk+4stu9r1KUqyxBSNn7sn68a4jJYwAgBFglu0rhK7t136DbKdYQQBavjMLHCsA==
X-Received: by 2002:adf:dec5:: with SMTP id i5mr20840657wrn.16.1591047958608;
        Mon, 01 Jun 2020 14:45:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 31/38] libgweather: upgrade 3.34.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:09 +0200
Message-Id: <20200601214516.26624-32-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.0
==============

This version contains translation updates, addition of a number of cities
and airports, some memory leak and possible crash fixes. The
gweather_location_get_english_name() function is also exported.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libgweather_3.34.0.bb => libgweather_3.36.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather_3.34.0.bb => libgweather_3.36.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb
index d72b6ce24..914010b21 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb
@@ -7,8 +7,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "52c3b1e27887fc88f862c92c42d930c1"
-SRC_URI[archive.sha256sum] = "02245395d639d9749fe2d19b7e66b64a152b9509ab0e5aad92514538b9c6f1b9"
+SRC_URI[archive.md5sum] = "32e43c6b35bec88a5549ab62c71913cb"
+SRC_URI[archive.sha256sum] = "d2ffeec01788d03d1bbf35113fc2f054c6c3600721088f827bcc31e5c603a32d"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.21.3

