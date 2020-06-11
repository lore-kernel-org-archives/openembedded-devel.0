Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6212.1591908720877152809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ax8ImQM7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id x14so7612647wrp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2R/ROJ3DSqE/Hmo1sj7NCFbdPCuCFborsRvGiUOpnYY=;
        b=ax8ImQM7RSI0h0hGhB6QS9Bg23DcTvlB2DGDpqWkX4kRjRXhiVcnYPQpTk1KfLEG4/
         tb5PyU60/xV6K3deOQwemFXZWX5Rf1BKJ2HALtsl3+cuvINMve7HlYPfYIAq9z/CDcw7
         K9qvtcFlaoCW1Pgr5/FBNraEuMOrdPIPRAJWQWw5KOOG9r6+Gk5QTMp54IEGe6NBjhNE
         EDRTWtyC7KmSyL8LvDdI4yKhgXLJH2I2sBsrD5+pgcziFZFjP9/g/iv6aeFqKgzNFhGT
         ZEHYpWaak1WBK+KV8nzsL29CP1cnIDC8fk0YnBF7Tn3gzD11NTF6Rk9FLzv3FCsScaKG
         0u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2R/ROJ3DSqE/Hmo1sj7NCFbdPCuCFborsRvGiUOpnYY=;
        b=qbPalk8IzpKtRt44c2NG5yxw3uoIbjK8OYCc+tegcxeuvYUsWA+rC7I4FY52IbyFf7
         u0pgek3mtmXatetyYKcS1TC+yTaOZ3cc4ncrcox4FJ8opNTxdNMsLd0qGU60a4htz0X5
         fjO8XXhakv8SITehgBaE36Y1LExRCU7GxOoHkIOSyQdyShWZ7rR3QCj5uLzE5b5lUahk
         3kk+tSbzuS0DHp0xQmMcCcxzPL0TevFvsCOULCEdkQ907h7AVGLmanaI3LD0Pp16bNdi
         jp1CN/C80i3z85hxYPjDNpuVLIEpKvxhIkRMkfOsjY5zAZ+IleAyqIVvo7fiYknQ7J92
         e2PA==
X-Gm-Message-State: AOAM530oDfDcfqnPl1IXQqk/1+OctVFuZHYO7/8RyEDRGeW01KXsOf3e
	0iSJ9re8RUIthcJ4FV9GP1+5VhILE58=
X-Google-Smtp-Source: ABdhPJzse9UCOyX/9PLjE2aDVAEkRJ3i6RWYUIyom+jgpbR3dfoyo/BF1IHcZhDEnQET9AdA4tom4Q==
X-Received: by 2002:a05:6000:1292:: with SMTP id f18mr11517017wrx.208.1591908719251;
        Thu, 11 Jun 2020 13:51:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0ec768c1921725f2fd1a21.dip0.t-ipconnect.de. [2003:f0:7f0e:c768:c192:1725:f2fd:1a21])
        by smtp.gmail.com with ESMTPSA id n7sm6827825wrx.82.2020.06.11.13.51.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 13:51:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] gimp: upgrade 2.10.18 -> 2.10.20
Date: Thu, 11 Jun 2020 22:51:45 +0200
Message-Id: <20200611205145.793353-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611205145.793353-1-schnitzeltony@gmail.com>
References: <20200611205145.793353-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gimp/{gimp_2.10.18.bb => gimp_2.10.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.18.bb => gimp_2.10.20.bb} (92%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb
similarity index 92%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb
index 135057334..2923e6b0c 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb
@@ -38,8 +38,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "096d04ffb2c4559cb2152f507ff31c9c"
-SRC_URI[sha256sum] = "65bfe111e8eebffd3dde3016ccb507f9948d2663d9497cb438d9bb609e11d716"
+SRC_URI[md5sum] = "7479a4e90b28628d2948e6612fe44049"
+SRC_URI[sha256sum] = "e12f9f874b1a007c4277b60aa81e0b67330be7e6153e5749ead839b902fc7b3c"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.26.2

