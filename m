Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.4438.1623220743274146561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltRfWvPv;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id g8so36713683ejx.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ezIO2W6MyjJ7Y2pNFKu9EUUsI8Td3l9B+RF2Ygr/WVs=;
        b=ltRfWvPvObunCFZ1W/yqMYGMkDl5E7ap1RF3B00YLXazBv5ZLTklJy7K+n0/ozHtDM
         /f51stL7sDkBrYlDKj1gtRIA2r0EFz0zpVy/CQ9XTxOZt9s9PQQ/g8u8GxzOdosGCUEm
         UcZVM4ULOOXgJ1D3DFFl85p2LsNBCPn39BKzF3RbqZrQD59H7Ur3kELf262Yl/Vohl8k
         IEa4ystDGpuJni46pVB7pTEVe2ONxpez8HqWYxded9yBU0a4J9W9SinhS2lkp5nCsrza
         a16OolepsBX+aE1JVaAEZDqPU6Z4kX1TOGUVfpq10W08sneUG0M2W9fzkRUPdjsB8uXy
         c7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezIO2W6MyjJ7Y2pNFKu9EUUsI8Td3l9B+RF2Ygr/WVs=;
        b=G8HvO9q0a6NvCXVGXu5TTIz5r4ZbIgrV7NduJkdYxIJNX6VL9rSwKS304+nXrfR3cZ
         wGB3zNGqhVFK35sOsaFaWDHmP2THVkv6LfU1u1ryn2jHEf+vC3Qh4M8/WJAHtlh8BoGZ
         X2IZf5ej2QQNbiQkGIsXRBNK169dqZruZi4VdZ6FYcZw9wLT4ffVn6C+KsaDbk3VXKZx
         d9oW3Mxjp0Ea77wtgXQFhiHTCf0WPVFNqZrdKF7oiIFxMNj/lCB8XhTmw2Ye6kWFa1sO
         UIqnO4tasfjpfrKj8NO79aftdehTr9f36INB8KtIYUDBjHRsdIhiIWPFj0NU8D12fOwJ
         d4qg==
X-Gm-Message-State: AOAM532HN4xEXkLiIENvDm/4Ak+DiG2BZLE/k9QmXe6OFezGar9q+1uj
	uzOA+fR9xdJLuNWto4DEPgOK/nOPrFMYyg==
X-Google-Smtp-Source: ABdhPJxmzGP+NGNMqsTMFl41td/MLLLZd0mFmtj2UnkZRxXd3lncYa58kMqj8Sf2691Cp6EIbFdtrw==
X-Received: by 2002:a17:906:260e:: with SMTP id h14mr27585985ejc.356.1623220741844;
        Tue, 08 Jun 2021 23:39:01 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.39.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:39:01 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 25/28] yelp: upgrade 3.36.0 -> 40.2
Date: Wed,  9 Jun 2021 08:38:28 +0200
Message-Id: <20210609063831.3400611-25-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/{yelp_3.36.0.bb => yelp_40.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_3.36.0.bb => yelp_40.2.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_40.2.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_40.2.bb
index b9263f50c..f62f8b1bd 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_40.2.bb
@@ -9,8 +9,7 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "32f879293f79b4042edc46aa13d82c71"
-SRC_URI[archive.sha256sum] = "fd4b3e23d31ad2bebe42ac8f80242b2d9bef51418bf62b59acdf2440bd94ed24"
+SRC_URI[archive.sha256sum] = "8aaaaf753ef4d97526f6a5308f1faee4aa627c4451ec92698a12e528535b5a1c"
 
 DEPENDS += " \
     libxml2-native \
-- 
2.31.1

