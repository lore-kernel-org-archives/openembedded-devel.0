Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.1834.1586556602364692291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 15:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QoZybL0F;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id s8so3865584wrt.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m6mgTU/4b9TgjP+ob0QE9bc8gyXtLrP294Oy0bIS4xA=;
        b=QoZybL0FIjG19rSskLu7/BqgC1NwW9+xn7+8hdjCwHpUtvMb98XDt9G8DiDkvQPyTL
         S2XK42kXwNDNgUworcHH1UHHfN8JhPoqHm81MrAlvPPSr7CZ5dWo/NpG6BIQ3vKE2lCF
         LF/w+ruPvqqwXcWznMgUDhgJMtS3RF2s0DMic7hHCk9mNNVnc/BnS5dOBVh+jRRUK2Dx
         VuOSb7s9SMK5/Pk1PHLvgrhymZer10OjQSaJsdq5K71n+IBEbK7S9jnHkBpp8e+N5gUc
         7yJXO/N5WOMkQOFhm0RJ3eKIYj6WbyVSYc3wV3GOcHK7u7TbZ2FF2lo83PupfHe9A0qw
         GsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6mgTU/4b9TgjP+ob0QE9bc8gyXtLrP294Oy0bIS4xA=;
        b=c+VyrrUoLmTQ/Sj1pQKBwiXse7k9bbajYFjMIFKw2H18lpbqF96hh8l6Pm3tYwB2Qx
         q/NkjBMOT0nmqBURo300zCgrLAMFiwcak1Ra0kWJowVMnCPC85LD/w7vF/W34gcYkA1f
         sf+t2GSTdfQPiCm+hlU+Oa8a1CO5ZzXdovd25X/TtJYTXRWjXT0/Sa7HcSFHaEDFmuwP
         Gf+0aqDlKjtoC2QJu9uYoaK7Ne1kDwkiq0AZKWCTp/R5iFCtoDST4WDIJ/rzyaZlc78p
         xRuvFFVHUcTSvXXKT/CcuJmbykefJTgrMiVOZ8fLlM97wlkfFdOKdaXII7SAYsSdR2W1
         hbRA==
X-Gm-Message-State: AGi0PubZIIl2+q+fuATKDxljEDKR4aprXLIjjAnlcLpjIDdiqlqRAsWe
	detlgfPYcX0iMP1wgYVDtQ4Jm6y3juc=
X-Google-Smtp-Source: APiQypJYwn6c82EgxC3Dh/mcVbpIzFra0buvi2jYbZnbnWbhRiVzwESRFq84GLlGwPFCT7PzZnmC2A==
X-Received: by 2002:a5d:6310:: with SMTP id i16mr6452227wru.244.1586556600741;
        Fri, 10 Apr 2020 15:10:00 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA42C8F51B0BBAC2F53F.dip0.t-ipconnect.de. [2003:f0:7f05:da42:c8f5:1b0b:bac2:f53f])
        by smtp.gmail.com with ESMTPSA id i9sm4664773wrn.25.2020.04.10.15.09.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:10:00 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] thunar-shares-plugin: upgrade 0.3.0 -> 0.3.1
Date: Sat, 11 Apr 2020 00:09:44 +0200
Message-Id: <20200410220945.23712-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200410220945.23712-1-schnitzeltony@gmail.com>
References: <20200410220945.23712-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.3.1
=======================
- Remove unused THUNARX_TYPE_PREFERENCES_PROVIDER, since it may cause
  crashes (iface->get_menu_items not implemented)
- Improved spacing and layout (Bug #14657)
- Translation Updates: Albanian, Arabic, Asturian, Basque, Belarusian,
Bulgarian, Catalan, Chinese (China), Czech, Danish, Dutch, English
(Australia), English (United Kingdom), Finnish, French, Galician,
German, Greek, Hebrew, Hungarian, Icelandic, Indonesian, Italian,
Japanese, Kazakh, Korean, Latvian, Lithuanian, Norwegian Bokmål, Occitan
(post 1500), Polish, Portuguese, Portuguese (Brazil), Romanian, Serbian,
Slovak, Slovenian, Spanish, Turkish, Uighur, Ukrainian, Urdu, Urdu
(Pakistan), Uzbek, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...r-shares-plugin_0.3.0.bb => thunar-shares-plugin_0.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/shares/{thunar-shares-plugin_0.3.0.bb => thunar-shares-plugin_0.3.1.bb} (64%)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
similarity index 64%
rename from meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
rename to meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
index d85063678..75ae03a1f 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 inherit thunar-plugin features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[md5sum] = "a1773168c0b3c7c0f253a339f02e5ae2"
-SRC_URI[sha256sum] = "d6adc01ca45a3d2567a2a969a3b16d1799a8975453ab1803a065fa82496b5b65"
+SRC_URI[md5sum] = "0884855d60cf1031b9013b6f5b125372"
+SRC_URI[sha256sum] = "dc1d8c7caa727e76d033d4653dc0742613f57a1711d0050900659c90a84452a0"
 
 RDEPENDS_${PN} += "samba-server"
-- 
2.21.1

