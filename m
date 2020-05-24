Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.21725.1590356937514583080
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2020 14:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N5JNCIVz;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s19so13519731edt.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2020 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k6NWMXLJfDdSH8SWoqt3glIOBqWLbsuJb5Pd0v2ozQ0=;
        b=N5JNCIVzc//fZLvqbGHTHGzkzeiRkXr5lHiO26aQIbCUHwy9WKnKYjH/ZUv1GBsfSY
         byN6Wjnu4ZlvaCXKRCY66oWTeRjMoCA4WTXbsj5Nq11QARuC57d7s7XaGUTgRwKNoEIn
         jEfyKVv7b41fQzz3trGq+uHlfTdyZUCwdH4zsqxw49cTrxv/VxS/t4yfPeXlHXL1FMZ8
         kzUFZJ6H4AYUcyKyQ2saWoms2ksqf3doH6BqWaZEEkNhA4LvW5wVIWXUCZRjiY1OrVNm
         6VpkMUeAayzJ0bhuThbvb7ITBu4QNOqHiEMlyZC19amLOf/1vJw/APG1h19rFN1cnkly
         CNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k6NWMXLJfDdSH8SWoqt3glIOBqWLbsuJb5Pd0v2ozQ0=;
        b=Ot+MDLQIl3gjk5ssuIxP32TpoTgr0RObQzIekkpH94aR7RypL2uBGwjwMDV9iZ+wsu
         nxYw3CGyVpx0dcyuSyAgJpw1ysC2jmo+TneZiJwzcmRWCrNnGzyc0cWELlkX68Y5jeHm
         XuSxoLqfaYIRHO9cWQU8tfvub0aNuGIdwoK203pRra/oVNKZG6vYSXPyBryLLTqRZ1lH
         4c2QcZprSGbDk5lnNg/k7/RI9t7xYBnOipa7R91p5cWiwXaDdRb9O12hy9KyVo8KL2KM
         MoMi/Varp++YY2/HsjCgkTtn6KbobNyw+KnINmfyNtni0fXYHT6vsA3c3T7FN4L2Fn64
         00ew==
X-Gm-Message-State: AOAM5312OuNVhh92G7uo/LeayoaRsgYd5KL0s8BUf4JJyP74SDcQcWAW
	h7teGZw+hTehpRbTAl76ZkBicy9ZgkI=
X-Google-Smtp-Source: ABdhPJxxugwisBphxc56MkTe7Jr0Dqy/5uVfIKGWx6UIyrQzLdnh6R/5Hn5fsuqh/IxeBBl8KdWznw==
X-Received: by 2002:a05:6402:709:: with SMTP id w9mr12128778edx.255.1590356935712;
        Sun, 24 May 2020 14:48:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f480647c75077471d25d12a.dip0.t-ipconnect.de. [2003:f0:7f48:647:c750:7747:1d25:d12a])
        by smtp.gmail.com with ESMTPSA id z7sm3092092edq.38.2020.05.24.14.48.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:48:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] thunar: upgrade 1.8.14 -> 1.8.15
Date: Sun, 24 May 2020 23:48:42 +0200
Message-Id: <20200524214842.30763-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524214842.30763-1-schnitzeltony@gmail.com>
References: <20200524214842.30763-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../thunar/{thunar_1.8.14.bb => thunar_1.8.15.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.14.bb => thunar_1.8.15.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
index 499c83152..b1f1c967a 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
@@ -8,8 +8,8 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "24218474191ac4c7e907d5b6fd6f1831"
-SRC_URI[sha256sum] = "8ac57b1f5842d5bd348bbb6dac4714f5ad1f22de651d8ec6a7099ceb19fa219f"
+SRC_URI[md5sum] = "303010f4959fa23f7c13c0ccd9b8527e"
+SRC_URI[sha256sum] = "7624560cf21f13869804947042610aab22075146b711593f11ceb9e494277c93"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.21.1

