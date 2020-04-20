Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.1237.1587366463324278465
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 00:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=GQUNmWre;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.66, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f66.google.com with SMTP id t14so10678239wrw.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=caeggdoMbe02WqzwG3uPuL9qUbvmYo727A5Kt5l2FqA=;
        b=GQUNmWre8vxc5mYhq6bVJEKK1lpJ5GolOs/+WXnfDlqpk+/ipC2mY6CWj5YRvq/ikj
         043DssZRjEaxSJEPDyqQZiSZlIxfaVru8yXzqdOr1aAzE5NpumARNlAjbt37D+oZd4XM
         u+E1RwQAhIV8w1eCihVKMk7vxXuA6DPElCXVyAfu1RfFMeW2OyN5PiNA6b/gQCVkBAYc
         Fk/rMqte/Y0Aa+r/h9l+dLRR7cQJAO7JBUETKd6Xw/0sqAFzuil5m3QIkNnok9xfZM2a
         CQk2p3VHg+mwFe4pHKSfJ3HkxUKraIX5b/aU3vJ445bS9fzf3+B7OS1M6H2WnTyYDpnR
         iR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=caeggdoMbe02WqzwG3uPuL9qUbvmYo727A5Kt5l2FqA=;
        b=f474ylu4eEIAT/XXzSc4gBJy/k3xrEnO175/pmiZ76VhInTtxaLfCct3wZjI30hGAS
         yvUCDHtY6ZGLhnXOXVUHA31EJ/iGNFftbPmn8vLSZu1x3iDUE6vQROy6dGiAAxyrZC4n
         q0P8COwmMuEfGOSv50SUZ5qg3h4H1/WQYUabffthz29ct7eTC/To9pqKWbZbXepiM9CR
         WGXpJGgK0qVhXOn+Oiw0/zbKC2DlyzEn6mvki6z/ICIxqDMlAvEIVlweEaoNye1ugvln
         k0bN5z0rl87uI2obqgPqYO7D5kLzskMJqVXo67S4Z0O+BBpM739HNo0/c+jgjinEXWnK
         ZhzA==
X-Gm-Message-State: AGi0Puba0fODnmFPQjgNJegTiCczmvcUdzchYQtxwhuxb/i6chwkpyTG
	ZVKrDuezlmn84CEsMnQ02F97Dg==
X-Google-Smtp-Source: APiQypJ6Ngypp+i56T3FVeDQ5ZAHVgOimN9PBDclxGoyB8ntluLRKBGBmmJjwyTjSf6PM7BQA7jesg==
X-Received: by 2002:adf:e450:: with SMTP id t16mr18436432wrm.301.1587366461756;
        Mon, 20 Apr 2020 00:07:41 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id b4sm37994296wrv.42.2020.04.20.00.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:07:41 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] doxygen: update v1.8.17 -> v1.8.18
Date: Mon, 20 Apr 2020 09:07:39 +0200
Message-Id: <20200420070739.29557-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Upgrade doxygen to the most recent release.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb} (79%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
similarity index 79%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
index 45de71826..f3562b54f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
-SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
+SRC_URI[md5sum] = "eda8e82fcc58970894029b0399776cb5"
+SRC_URI[sha256sum] = "18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656"
 
 inherit cmake python3native
 
-- 
2.25.0

