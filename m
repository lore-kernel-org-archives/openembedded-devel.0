Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.2251.1585607191709231930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 15:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SXVIp3QS;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d5so23683466wrn.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 15:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=doTn+t4vuVvX1bAgg68EhvY/3gLaQW9xlbOWKru6tSA=;
        b=SXVIp3QSWbm+XHkuFF16P8q8xzlKfAE619jb+ZpGbI7hbtU1ng8TXdO7uN+V8gP4yq
         3KBIm5DZJkB2SCOJVnq9W7wKnEOc5/VmQKHLvAIiUdD5gaZL0Z4AA0+rmueD9ZlOw4az
         Du5yw+eNiWrWA0ogYvDqO5mzfrquMqnatSGvjylngppQ1xzTtU6u4FROVf+DsaPhNLHL
         GdxnYPHdsMcArtAnW2STb6iLcgMen4gVTNPODidYoX0deR5xkK/P9lLJpywxLfhhbjCu
         xKWm+l9q3PZJLEohgz6xigeM8E9mCnFAI3h1RmPutH77U/i/Pmhz3lLhXk3oFQIfi5Kk
         5kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doTn+t4vuVvX1bAgg68EhvY/3gLaQW9xlbOWKru6tSA=;
        b=BF+mYcFNp7onsX+5CuHkAVzHre2iEmXVaYN/qcUdwwn95UTqhBTinYz1SKDJGFjafN
         6uTWFPcSyVu7JiaPfgbzZ4wAnKYLWgDGbOwcHMsYU4msCvpdBpgV0ZkPY6ZHBGpT1lyW
         3H/8x788LY1uHybP7XO4Wc65ilcPtpalTmwkN8PUz5C/i2eaIQZVs7a1axGjgZ/DJWVF
         dsODD1t3aXf7DfXhdrK1TMf2WQzJHGdihM/nOuxDpCxoGwevACv71ZKPv4u9te+pDJsJ
         bxh279h1w2lYrKJ3yAiWEqkZagKjk6w7OWTtqlw4qzF7BKatPcyE7u/4N0eGDR76zwFI
         X7XA==
X-Gm-Message-State: ANhLgQ36Zu8jBBCMkKRNU+akF11SzYBKf9E2peEJ/dCdG/dRGqyEEYP2
	G4fdlkWDvv0xuYMpQYP3NVsvYjaCznY=
X-Google-Smtp-Source: ADFU+vuTYpWIcvIT8T8WgnxlClo/0iNTApxoozLQmA4jdQH63KT0ReuUJUMT/B7CflRrHBdLy4792Q==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr17064283wrx.395.1585607190143;
        Mon, 30 Mar 2020 15:26:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030968BA11C5DB455F3E0C.dip0.t-ipconnect.de. [2003:f0:7f03:968:ba11:c5db:455f:3e0c])
        by smtp.gmail.com with ESMTPSA id z1sm12002404wrp.90.2020.03.30.15.26.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:26:29 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/6] xfce4-terminal: upgrade 0.8.9.1 -> 0.8.9.2
Date: Tue, 31 Mar 2020 00:26:13 +0200
Message-Id: <20200330222616.2354-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.9.2
=========================
This is a bug fix release.

0.8.9.2
=======
- Allow to create window with 1 line height. One should also disable the
scrollbar (--hide-scrollbar) to get 1 row window. (bug #16447)
- Fix 'Transparency setting ignored when using --color-bg' (bug #16309)
- Translation updates: Albanian, Belarusian, Polish, Portuguese,
Slovenian, Swedish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.9.1.bb => xfce4-terminal_0.8.9.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.9.1.bb => xfce4-terminal_0.8.9.2.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb
index 4bdd4cbf2..ba0f12771 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb
@@ -8,7 +8,7 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "cb995e4891a3c547bf133b31e4840d01"
-SRC_URI[sha256sum] = "0deb0d06e50a8a41fb00e2c3773f0793882cb9f073ae16ead887bb9681c514cd"
+SRC_URI[md5sum] = "d0308313def5d7cc51070a6db1cf24dc"
+SRC_URI[sha256sum] = "9ba23bf86d350ef8a95d2dfb50bbd1bbb2144d82985a779ec28caf47faaeeeeb"
 
 RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.21.1

