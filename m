Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.1918.1586556600697093999
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 15:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slOcVXUT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id f20so4189107wmh.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KRMQTPUcGjuSpO5xVRReuPTt4ao8/wGCaUSQhWDhEtM=;
        b=slOcVXUT3S4s19AKg11LGCEJPu4FVa08AW2vchBThKrtbiBBD72y9etB014foT6ny6
         ZxI6JixcgpfoASNQjz+NHJdp7Dj7F1LLs5NJf+FPm4a3K9qmPdjCxtpyFAh1g7GKyxW9
         GgurQEFxxgEu3pfsVm124zZZRIRvcLHTsgvttPwY5yJuUgBQnRGLK+fqNu73StZ/ocjn
         eF3waXEhzbJ6h1pad7IPbtZ+QuQ9JgplwBEnV6I9bW91ER1P9Z6mWZ5YuJASGqO/ttGw
         KZFN+jx/IdSB3Hel5zoEUB2fRlvlrOqPbWUIwz3JQKZ0eo4opiBPKDIOGPaKgS1vzBjU
         y4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KRMQTPUcGjuSpO5xVRReuPTt4ao8/wGCaUSQhWDhEtM=;
        b=tFizChKq0LMQ2siS6UYhLrOqJSPf5D4VuOpWj1Ofl8HH/jVAFXLml9YSxOrorqcx1P
         z4xPZb0P8OzabRG1OWIhyFp8As1VTfvKwlavX5w0HEnx2eOR+ZoMPCfdTvrAIDB85kyB
         Wm7sB18mg+W2IgasdoPoFz7A4V1IzD80YtyFVELhRQggKVO3ohQiyYAD/XGD4vByKsEi
         gLKP0G0Z6wQJ+Rvy40bb8qM46SIiYejwPt9TI2Gb1IS/tfBF/VAA3DGwGJytb+eoeohW
         neKD8AbcFMidQbF/bZ+GOVRdC6Wpsr5QCBi7WaeLPxEQIllhWjt6fRrYnw4Bq/V2tdBV
         gmtg==
X-Gm-Message-State: AGi0PuYYeNRbD/GyuFjyfzkLDUpmtPG+QPmNrcyOqwsz0En4KgUs5nMi
	WmnJTceERv7WuAY518sP+tsjug/+7IY=
X-Google-Smtp-Source: APiQypKKzgjCLUUW9nQzrNA8WpJZ7kNeF5X+hgHYN34ZK1tsGZHkCfITxqyEHUbGLs4BtxrB0+JirA==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr875170wmg.147.1586556598930;
        Fri, 10 Apr 2020 15:09:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA42C8F51B0BBAC2F53F.dip0.t-ipconnect.de. [2003:f0:7f05:da42:c8f5:1b0b:bac2:f53f])
        by smtp.gmail.com with ESMTPSA id i9sm4664773wrn.25.2020.04.10.15.09.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:09:58 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] xfce4-clipman-plugin: upgrade 1.6.0 -> 1.6.1
Date: Sat, 11 Apr 2020 00:09:42 +0200
Message-Id: <20200410220945.23712-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200410220945.23712-1-schnitzeltony@gmail.com>
References: <20200410220945.23712-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.6.1
=======================
- Add translateable files to POTFILES (Bug #16608)
- Bump libxfce4ui ifdef to 4.15.1
- Translation Updates:
  Albanian, Bulgarian, Catalan, Chinese (China), Danish, Dutch, French,
  Galician, German, Italian, Japanese, Lithuanian, Norwegian Bokmål,
  Polish, Portuguese, Russian, Spanish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-clipman-plugin_1.6.0.bb => xfce4-clipman-plugin_1.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.6.0.bb => xfce4-clipman-plugin_1.6.1.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb
index c0f4a5d49..f2a145f5c 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb
@@ -8,8 +8,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[md5sum] = "6db8e1b6ed2babab339a650c8f6d596b"
-SRC_URI[sha256sum] = "0295da92ade7d6e1d8b15a525e73ddcfba1986142d34c6143955164a13552ed7"
+SRC_URI[md5sum] = "c9306940c0ca7abd838a14c9d19b3a7e"
+SRC_URI[sha256sum] = "b3e8317796289196fa78c4526626fe061fd35d11e848cf300ca1ace47febceb4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.21.1

