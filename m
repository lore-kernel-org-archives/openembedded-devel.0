Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.48788.1591047964977357882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M5oJJ3of;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id x14so1335816wrp.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6yqfWO0Jml/TT82e5BeEci8sCvegzFYsNqRUnFF/9Qs=;
        b=M5oJJ3ofIv47argi/ezqyokoxxg7CiRuRb3I6bE2zWvO6Ol33GI3CU7JFcNG/zgakR
         OW6M1+hG4pe8/bQ/iCua9hi+GCyi5tnuauTTZ0DgxbwpZWrmJ9Qlxuc0jwcPVwT95WnZ
         uxsmZ91ouNtBLivmNqVjJZm9EGsokqLCyPmRmD5XJPtEQfzLJtIsYwswk7+AUj/54bjy
         kLstwrWuUfcuL85icXNtHlIJvPREwlZ713wGWmRXcNcweWFYx9DvKbDnHBRNb8K1jsFJ
         NDpi59pbHLxxYVmOGNWpm9Zh1t6XVPAxEnrOzPsKvFhpU0XmW0HWj8P83wLhHtnOq50E
         0Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yqfWO0Jml/TT82e5BeEci8sCvegzFYsNqRUnFF/9Qs=;
        b=WmZ4ZMNCUY9Zhv59V6yueTDynUvPcoWmwvGlFpwmm5MUrOgjG11fQcPcHoftHGkPvj
         OaCa/N0MJYITYD/3nOiwYiqzgKC7RAHCCOl5Dl0s7XqKZDd1XKJqqcKadAvUsBomY0zO
         mPaCtEFZBH7o3ZLlyktwWkE3GuvLp3zxkYejAzDkbNB1s1glboOZY/Sydz38ShMw6m5K
         R1Ya+7SxXApZ7GkzjJDDlRx78MDkVK0qZDaY5LdK/wjmLNbjuw+8vY8nxyqWilFU0mt9
         T8kRLbint6ZcNqGOa/++KaG93eNtZlE1CJpdooSmtE8GOt+hScSXXYi+NKm09uXNy1AC
         XULQ==
X-Gm-Message-State: AOAM530Cffajd1h5ObZcZ6sD4SDxDWDujX5WP5iSacxhTp4W1nlevFnK
	INd9HVv6VDD8RepSPXCO2ERdt1sqoHU=
X-Google-Smtp-Source: ABdhPJxV+bTIq3w+THI2hor7PrKcIiIx5wtYfMZ1YoswLMNCGiENOhZPfaf9sS+5ko8vtxowGPKW7Q==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr23440534wrw.91.1591047963221;
        Mon, 01 Jun 2020 14:46:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.46.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:46:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 36/38] yelp: upgrade 3.34.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:14 +0200
Message-Id: <20200601214516.26624-37-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.36.0
======
* Updated translations:
  en_GB (Zander Brown)
  gl    (Fran Dieguez)
  ms    (Umarzuki Bin Mochlis Moktar)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/yelp/{yelp_3.34.0.bb => yelp_3.36.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_3.34.0.bb => yelp_3.36.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb
index f0106166f..b9263f50c 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb
@@ -9,8 +9,8 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "776e29bd16424c8712cbf340cfe6429b"
-SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513bd0be77a7bd045"
+SRC_URI[archive.md5sum] = "32f879293f79b4042edc46aa13d82c71"
+SRC_URI[archive.sha256sum] = "fd4b3e23d31ad2bebe42ac8f80242b2d9bef51418bf62b59acdf2440bd94ed24"
 
 DEPENDS += " \
     libxml2-native \
-- 
2.21.3

