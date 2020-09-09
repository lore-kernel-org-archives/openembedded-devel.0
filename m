Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.1779.1599671984592066398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FpRXlHqu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.179, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qt1-f179.google.com with SMTP id y11so2539211qtn.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=Z6frZXwdfYK+If2cv0Q4NwIVhlW6wJC6roMmedhtKQs=;
        b=FpRXlHquV3Dv4GS36OUaoO+xbulSQ+iPn+VyMH0JLyGjQ/jQL2EH0yc+8IgOwSVpGp
         sMpQNIOfc9k9CGgh8s2j0EGl5KAIC1tLw41U6Q9aEkRNT1XbJ96JiVGezOeaQAu3EG4G
         CIUP3OafIMGSEgsvUIeFhWZuHKaeIrs7ZiUq0lTif31QkrZorY0FqoFutkGv7JN81ofR
         eBQzO1gh49/Dwa2iBZX7yUee/f6ptmjaJI1LI+rx3Qy4R/Ke/FaGnjdmvFKfXoWV+GRu
         YWFVHvAp1zMYJR0jQy+A5AD/4/jUvGH1vUrAc3NTm/rhT4dSc+TIMLK/zlNp3qiepAYZ
         59ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Z6frZXwdfYK+If2cv0Q4NwIVhlW6wJC6roMmedhtKQs=;
        b=PoCu7x+dh0hBu9NuuBUxM6a/AbhSUr4LGBN9FK3WiIFtS7PcdwyWaWsrbD1O78KP9C
         fWN5Twxldh5LqeRtRMHGy+lNE8yxEfC7EcoAydJvbLcHJis+eCKMsSwu5ryFeFAnJ0TR
         3NgcW3mcaN65CO9L4MlNldF+bDdQ/w2lAHbBX1B5ntBDdy0mZoLLott4j6Nin0TmeaEm
         RqFZQkoRPKCSPEBCGA2RZFh347xLmcIcA3akGpc2nbqCUZjAkSbSevFAzgmebn39BlKP
         jNueIkc8Ad8Kpl1g/C9F4OrD5wzAZRDAIgAKwRZLFMpghotl7q7uyuoHqotroLMBv+mi
         uTpA==
X-Gm-Message-State: AOAM530MrrDds6N1pGZrHMuNwayJWDQhpbXX0Yc9Xsqxt5txHBjudkXL
	Pp417At1uKQrG4osZqInwqEoPNgeSYYVwKcN
X-Google-Smtp-Source: ABdhPJzY5mLjDu9XhgA9fugT4nVTMNC+XDMnWnkk1u8Jla1BRzMqv5iZWpkLm4psyn5CRRXdjedgxg==
X-Received: by 2002:ac8:75d3:: with SMTP id z19mr4318237qtq.186.1599671983123;
        Wed, 09 Sep 2020 10:19:43 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from centrium.lab.ossystems ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id g18sm3359528qtu.69.2020.09.09.10.19.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 10:19:42 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libqmi: Update 1.26.0 -> 1.26.4
Date: Wed,  9 Sep 2020 14:19:38 -0300
Message-Id: <20200909171938.1094201-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libqmi/{libqmi_1.26.0.bb => libqmi_1.26.4.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.0.bb => libqmi_1.26.4.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
index 3a1b70b80..f778ffac4 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
@@ -14,8 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8da95a97e893311878f8ce12dcf8fad0"
-SRC_URI[sha256sum] = "7f0429e0ae58792e21512d09ca2412537840ea42696762795af1284a65fd6e40"
+SRC_URI[sha256sum] = "c0adcb84ba452e3e13edeb3f94f7b003ea927b354bc187629e05efb333ce270b"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.27.0

