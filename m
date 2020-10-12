Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.39177.1602505060499116042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SnTlAz36;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h5so8855919wrv.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2020 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=SnTlAz36PKEQZbOTxIx5metKsHnKAeX2k3KX4/G9CC43Bq4N9zqBzG/S9m/Q40Om5F
         KtzDtX/MecKBp4/vTU5I32/XfOUkhK4HJxWhxKRrlEGZcvLMR/zr2bzplq5SiRAf7WWo
         9TKWR4h0zjfw8ocYkQfDWn8/6qmYnYcWKzN8TLmUc0bZjTbzUfCVIuVRvWnCGV8JO9V5
         5wPhGQbXKPNiCLKupAsVrkA2xBJPdh6LUychCQ+SsfC5nVOGK+Q2UVJA+eA5HJzkg9yJ
         rYOQA+Al/wV7cr4wlIS8pJym90csVCqF8eMXGJX4Wz8gZCBqj1yS+UMQqHOILM0dIMrs
         g8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=rVookulUV68B6biTh3+tVVBJFOw0pf/WFG01z+6zy2StgTe8BpRUtY6mz5gcolwgeU
         hlGQ3PYNLJfhNn3imLJ+jMyZLdD6CzKeQZGuNHLdYiFfKtrDvL+cdKdwwBKTpjaJY0K7
         tmCWRDXs/uBgTByZXsrJ7aETzDI53t/t5Mc9G8EkAv5OyFqdu4xNs1bb3R7Wsd1ZUJOG
         AEzjpFL8b7Qk4FUyP8g2JpIUEbslXevb5If2T/uWN56BY25vgB2WL8uGG/8reIFfFWW0
         fpMSGX5giKRwjKwi9KWm+ZXggis1VlgC3ZNx+9UZ0IyfC+6faUNvvUgVet6zRHOUn1We
         TGfA==
X-Gm-Message-State: AOAM532xXs1D1LI1hKYuXfk7YtsRka3Fg4uOIUhdwxUdPtYX+Rlx6813
	U/Jy3N8FfqD13MBUzfY/HXKBW9IBYak4oA==
X-Google-Smtp-Source: ABdhPJyf94/5ogXyHXMaeHnh52KWokR2DV4fIFz3wHw/qmyxgj5/WnjIvhmDA5FnBC3/QihOMRa6Qg==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr30094950wrw.18.1602505058826;
        Mon, 12 Oct 2020 05:17:38 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id l1sm4158196wrb.1.2020.10.12.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:17:38 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 06/13] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:17:22 +0100
Message-Id: <20201012121729.2094355-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012121729.2094355-1-quaresma.jose@gmail.com>
References: <20201012121729.2094355-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ns-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
index be10800389..d38550c352 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "01d3a24152cfd5eb27b1787d44b524c6"
+SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
@@ -32,6 +32,7 @@ PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dsidplay=disabled \
 "
 
-- 
2.28.0

