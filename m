Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.25320.1609683199835607688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nxPxobjt;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id h16so24503363edt.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w0xOtl380XzbywD0fjRovTBRzF8TwEW4/RQdpjgq99I=;
        b=nxPxobjtoMPisG53NbLLdNfFzjY5klrzgpZvcbIZowxDyHhYjRghERaAa/m2x1/ffu
         QePoNQxZP9bBX+2pf9n8uavWJ0pAMR93zdlfKJz77X9PgC2BpjM5JJLjtmzxzKIwG4LU
         nQ8kUZLqFpY/Hf7hJVJnIzSJ6MOAJmjCpqh8nx83TwechfvkgyFm6Y8zADw30l7eCq+P
         bGhss9H0iPiIwx+hsZkmPuiPvMNEyoe0xVAFWf4H16yhDz4YzP0e/3S276CUoEraoaRT
         tZL3BGku3rG+sX2Ouz0PsWAucWPhdoVOOyth2ijEvb4pzh9FF9vSyP6LFdNtpugIJpFk
         vUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0xOtl380XzbywD0fjRovTBRzF8TwEW4/RQdpjgq99I=;
        b=PFi5d75Vxm/vNRGdfRy0X7EZwLcNuTuV1f03ChD0pU2O6PFyzCWFdIr1aysWPLOPub
         yy2wCCyd3fA8h1YvEDzUSlbh2jqByRoXIPRQNzL8Wyd8B1LVljI1rwWpwNI9UR412elG
         bQnGiymD4Zv3rp+KxhabkTgo1jXrD5JX5NvzSQNY9AU7pzoKjZ/Ws0Cvv3PN/b1l+jmE
         /Nmda9ZKkXfTPvofah4gcIs0wR19nf1JsVMeAVoZUUprVwSbZp/d301vcfb028FTzhDO
         okB8LKHGKyeqok96gGDabKOB1YdxG7yfIAoi+ktAg8sTi0WU1ge0NZGj2eszFzuWoaZO
         UZlw==
X-Gm-Message-State: AOAM532yL93zcGlOaJoHg7nASscYkhuk2mfAp9yPaZEfw5YvASLzPrSo
	qTvkIqkbgFhlLp7YWw5vemXFtOFWRp0=
X-Google-Smtp-Source: ABdhPJzimWlW2NZ2EK/lv1YWtIxP1mSHOkbOh3FxnQqE79dT7X+t0ukyCbUxv7n/CvQYaqr6EWkq5A==
X-Received: by 2002:a50:955b:: with SMTP id v27mr66217995eda.324.1609683193430;
        Sun, 03 Jan 2021 06:13:13 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:12 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 15/16] xfce4-whiskermenu-plugin: upgrade 2.4.6 -> 2.5.1
Date: Sun,  3 Jan 2021 15:12:46 +0100
Message-Id: <20210103141247.1637618-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.5.1
=======================
- Fix not always using new action icons. (Issue #33)

Release notes for 2.5.0
=======================
- Add option to show all applications by default. (Issue #4)
- Rearrange sidebar buttons to match default category. (Issue #9)
- Show panel button title as tooltip in icon-only mode. (Issue #12)
- Always sort top-level categories.
- Vertically center contents of header.
- Use new Xfce action icons.
- Use new desktop ids for default programs.
- Rewrite to hide menu on focus out.
- Refactor code to use new Xfce functions.
- Refactor building translations.
- Translation updates: Bulgarian, Chinese (China), Chinese (Taiwan),
  Croatian, Czech, Danish, Dutch, Esperanto, French, Galician,
  German, Italian, Korean, Lithuanian, Malay, Polish, Portuguese,
  Portuguese (Brazil), Slovak, Spanish, Swedish, Turkish.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...rmenu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
index bbb274ed9..6077fdfc6 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "81a4a4c7635273485fac5c2d98e48d02"
-SRC_URI[sha256sum] = "8974d38cc87df528693efe4b6e14bcd233cdb49d2018a23ddddf745110b25744"
+SRC_URI[sha256sum] = "b2074f8a9caa766e2d97f0b960ef2f4d1e20dd804497229bc1f0157791896925"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2

