Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.20562.1600613452475053634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zc/9EBP+;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id a12so10350338eds.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dTiN2Dts/7A93ky3JMTtf6u67o97Epa1c8NUUb+PTjs=;
        b=Zc/9EBP+8xnhqbrwgw5w2+qSabANzyj+ZJXgQicduraKjqGEzx1Gv5K+f90lTS+7uE
         1/G7ZgNfqyrkPKvfzR3+wOsZMN3yXaTwQif532n4aKZQ1+P+awWyBkhwaQJ7utI49LTH
         eFndoKhgdM57q6pVkPwjE65u2QSiE1KTIh/xFgGgUemCufNC0J3gnNE4JlYEdauwc/U/
         5t2V9higGWUBG0LwztWpuJrYPtGVtI8E6gASixLXsL4WjhrmC816adv2bWFKYaf2B0Hn
         HkewUMdi0Qj85DMC6irRCSEsiyQE6tyqUy6mnZl3pFFJH1WTV6Jgtfgjw2CuQT+a7aVO
         crOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTiN2Dts/7A93ky3JMTtf6u67o97Epa1c8NUUb+PTjs=;
        b=E1Ap1I2Ja9m2IojzYycZEdcWFDnlHB9xmxWdhB/GMDsdZVpzwQkcHRdXuQ3I5WkVTf
         ZvZ6ThoYzqHuRbTzNM4DkxmERo6Bn8m2kwUOUlG+FX6cfKUlJma4E1nThgwoXgKMhpGq
         T20BGmhfXw1gu3rXy2j3SIHJUKHdXKB7midrjn0RESxfpMDFWkPMCOFU5AExg9KelA+Y
         gimM87NubBeYNQUkDRk7qRfB00erhrUTDQYn3slxZ/RlRvVYyMQa5VkhqEuqIX4XLxpf
         nHnisdNo+Sc3VSwlDE9BDfHwDGlhZLFnKVivOh6zDDf0AmhO3gq0FYm8m+FKSZW4zrly
         Vveg==
X-Gm-Message-State: AOAM531nk4MEuWHpIkK974ntgGKFiEViR2f034Fw372kWx5qAhUEE4Hp
	71uxZozlraCKNtVGkS0T8Dm+OxPMIrM=
X-Google-Smtp-Source: ABdhPJyXbH5kWYhE7eKifXcGsQZwezX+8+gWveqa1V/qOEQmcrcuSdZVEbNTqFcy4Ci1bvZXi/Fk5w==
X-Received: by 2002:a05:6402:1d93:: with SMTP id dk19mr48607513edb.198.1600613450650;
        Sun, 20 Sep 2020 07:50:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:49 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/11] grilo: upgrade 0.3.12 -> 0.3.13
Date: Sun, 20 Sep 2020 16:50:31 +0200
Message-Id: <20200920145039.2240-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 0.3.13
=============
  * !56 Increase glib requirement to 2.58 or greater
  * !58 API addition: grl_related_keys_set_for_id()
  * !59 Fix trying to load .so.p files as plugins
  * !61 Fix crash using get_plugins() from bindings
  * Several other fixes and cleanups

  * Updated translations
    * Chinese (Taiwan)
    * Japanese
    * Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/grilo/{grilo_0.3.12.bb => grilo_0.3.13.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.12.bb => grilo_0.3.13.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.13.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb
rename to meta-gnome/recipes-gnome/grilo/grilo_0.3.13.bb
index 0338455bc..fe6858f45 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.12.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.13.bb
@@ -11,8 +11,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc gettext vala
 
-SRC_URI[archive.md5sum] = "b464ce84db6f9354996a1d47b3c613da"
-SRC_URI[archive.sha256sum] = "dbfbd6082103288592af97568180b9cc81a336a274ed5160412f87675ec11a71"
+SRC_URI[archive.sha256sum] = "d14837f22341943ed8a189d9f0827a17016b802d18d0ed080e1413de0fdc927b"
 
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
-- 
2.26.2

