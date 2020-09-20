Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.20573.1600613462492242860
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vB77fm2V;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gx22so5252175ejb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jLX/Lcayz3WIVlNrborUA/03V8EMvv4x+xwFFs+BHzo=;
        b=vB77fm2VedocMY73KgL3u5kLTHtyWhwpu5M1HE47+L1al6UVturlue4ygfoy87Hli9
         Vf2cJom5fOjM4gl5Uhu5807M3xH40v5TjgDmvfvvJi/fHkQDt46u8kqbWIzrgAhh+h43
         uaiYsQ20daGSNBf/njAVna+4xGM3t2548MPL3WiDyF+a3y4tnZXuQ+vLQZBK2u4c+NMZ
         /aFmVhsNEs8DBxFx18RTn0ckAjfxpQqiONjXsqPLj/47R+CB9Fod6WohwWOAwE25R1dm
         h8sshV84ngnWfNkDYK0XGJAyQoGq1VmWLo7MHJwepl+grYijNFsVbp8VE5S3vj2Zh2oB
         uJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jLX/Lcayz3WIVlNrborUA/03V8EMvv4x+xwFFs+BHzo=;
        b=h6zhIQg7OwLW5YZXEkwVaDVj2Kt7Vh8cW+i5C5T/UGBbAQ+B5GxoRdHmavVqRWBy0V
         ZT9xmoqLXU60Wbl39oXejGKiLK4v8wzop05oAVF4f860tWJwd4ttmMBe9lNPZnrEInnh
         fa8v69qRGpjHEOmc7KJAQvFLfG+53Gseun5qVrsSJhfI+iFOo+W+xwx7yqeGa/8Zx5o8
         6rCWCwqr/DnkBNqcwnnLc8kLIECbHRUwpY553K+ih57w8mVQjBtzPisf/TkC1Du2mIMw
         BThw/B+yrbayi606US0G2cXZYboR/euGw6IfV1dTApBB5nn1fiUNOfxH0PiqbvaWwayC
         8f6A==
X-Gm-Message-State: AOAM531RLfBTWKXAR1nux0zvAQwHx2yMM2MY7Bx7x54x+QnbZ6sLOwsY
	HjykL/tfSg97sZHniqRj01hgmaVBBzo=
X-Google-Smtp-Source: ABdhPJyyOaGsZsu4YrGAVRW9S+TGfhkZ8hoCflEFGCCCdLqKC7cLM2cez8YH8XQJY9025eOQ4C4hsA==
X-Received: by 2002:a17:906:5809:: with SMTP id m9mr44697464ejq.304.1600613460640;
        Sun, 20 Sep 2020 07:51:00 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/11] vlc: upgrade 3.0.11 -> 3.0.11.1
Date: Sun, 20 Sep 2020 16:50:39 +0200
Message-Id: <20200920145039.2240-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/vlc/{vlc_3.0.11.bb => vlc_3.0.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.11.bb => vlc_3.0.11.1.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
index dd9486e8a..44178a10d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-Fix-build-with-Qt-5.15.patch \
 "
-SRC_URI[sha256sum] = "3e94a1acf33445e9da15d528aa48657aa26b912eaa2656b403d43860a8834919"
+SRC_URI[sha256sum] = "189311d28aa814f106a7b3645211ac52c0b3e2b9f4b348de2f63bab3218086b8"
 
 inherit autotools features_check gettext pkgconfig mime-xdg
 
-- 
2.26.2

