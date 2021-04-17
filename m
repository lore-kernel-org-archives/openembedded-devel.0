Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3578.1618693576960639702
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KF7epngY;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id 10so11746160pfl.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gWpONQQ18yMsmPiCN2DalLf+QQF3oHnih9qRoryVYY4=;
        b=KF7epngYCf6diV6BjuHqbDThuk2X+sirjVwu/iDoGGcSmcggX2lBSEGEngZSDWpVWI
         QXQr4OxeY9SASmELCRrAbNq6+ljQ5EFYoR83KZ2FrdqZd+EXG4E6WboZEIj89S3FKd8t
         sjj0tcCD6iUe3ceY2ppY42SwDXfV6WIYvXCFzbv3/QKwuV6lKPIOlciq8LoDJecPzI/L
         LwWMIdNoQRbMPjM42tbklYQL8/sBULo9Bpxp58fGpxZS7GmFcscRNftNR7co5SFxoGz6
         ItjtkL81Ac2quarbk9NdXEh/iI/AQCpOsM9pGYxIWJQj4i0e98nQ/1WoqP/NjswJ6z81
         i/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gWpONQQ18yMsmPiCN2DalLf+QQF3oHnih9qRoryVYY4=;
        b=W0IpdnJARZOqdq7BLJALZt4du+yjeBU5mF6G8JPXg99HwknXv9J7rY4ZaNY1NiQu2C
         jpVzt9sNUfyQ1NV6W91P+sWr1nlCvPGjXRPx32u3EfqVRM3F3E2xPdfUdZ2E1pQeQ8IG
         B/aalPloR2R10rs7CBuYiMp5OXQKBuncXWEvDaVqsi6/uC/yTBjwIfQZoVPWyslRxdDS
         3+216sTEYyE01IDHy0qUDkWYFxwCI2Z2W3i7dGr+9ByQg5RGspR5rYjcy+pFZ5DK0nbQ
         NqrccXsDVRiAjnp3hKXXBXDvXrrF1+gocNsqIkhZozLvfvkTS0xoAbagqgHQNiTqQLU7
         VkNw==
X-Gm-Message-State: AOAM532ED9Msd9V6uz8xc+p7ydSBTp15AeolIrQahRU0GzeMji3Ofxk6
	QsFSPbX53Ve07A2BbnzVxnmeNa4ZEvMrWQ==
X-Google-Smtp-Source: ABdhPJy/L7fD/M3ih5ZXmo4+p0c90TCKJG6uKbi8CZKIVabA/J+NFg6k5QRbynAQatLDl+psj0U1XA==
X-Received: by 2002:a65:468d:: with SMTP id h13mr4692730pgr.373.1618693576455;
        Sat, 17 Apr 2021 14:06:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 09/50] python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
Date: Sat, 17 Apr 2021 14:05:18 -0700
Message-Id: <da3f76855ba6d84fb5d52010e69f052c0de56b93.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.0.12117:

- adapt to new libvlc_media_list_new API
- re-introduce MediaThumbnailRequest definition
- implement generation for struct wrapping

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 53bcbe450b9327283a5ed0d6fdfc0fd4a45ac8fc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...python-vlc_3.0.11115.bb => python3-python-vlc_3.0.12117.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.11115.bb => python3-python-vlc_3.0.12117.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
index 014509d5515..5d9dde9d29d 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "422fd025294af2e55dfdcf9bc7d7dbac"
-SRC_URI[sha256sum] = "a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b"
+SRC_URI[sha256sum] = "dd512f8438c1bba032fe9d22a7f8f98423a537992141ce2d1b28e29aff30381d"
 
 inherit pypi setuptools3
-- 
2.17.1

