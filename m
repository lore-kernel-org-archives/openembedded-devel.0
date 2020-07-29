Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.5076.1596026520997235909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=rVUUx6jl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id i19so12925213lfj.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwkv/PG3ByK/g7vC3+OIW3V5NWbRKNOl888QpvDMvBU=;
        b=rVUUx6jlYymdl69ADPJCNEar/kBFsc678Gy2X7IKS3orWrzk0FGOKVq6F+tglg7LZf
         G5bGTTK4ydNQnW3ZLLYuEdyJwHwICNFQ11JwhIH3jzsVgzVRo5uNvx3Kzh/W9nFc774g
         t1+U/bnIW53u5lIznh+YPZmpnSea1qLwEbmSf+9HNMdaViZMe9BIzxRu3iQt3LBViHnq
         Ce5LKCq+qK1DzwjxBN7qYOCxJdnJNnv09hH5eVUQHkQ4nK/khhkAk9BjGm4rY4S9O/bx
         PvKDx+VZacVFvWLrAYxSsyAxyZyi/3NaswyHYqWFTOOrZPggaTcPDvG0eBSqdbRa27XT
         Ux9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwkv/PG3ByK/g7vC3+OIW3V5NWbRKNOl888QpvDMvBU=;
        b=I9HvZwEL8FK9uoo5VE1xCsU9dU0TSQe4VzOhtjcbO8waeMbxjiyTSt5ZsUNCl2fsZo
         oMWdIa1bXfJf+HnR49c+S+iUS8NUM8DV0JHpUAB9z2FvCQdfV0ZJkGuenYAjveGLy7zI
         F3FSAWuKu+8iWq7DzxqiNmXUI4fyMqoanuAf1yxVs96BOq2MMek9U3xYLut+CO26kQiw
         DpZW6ycn9UW2UWCjg8TjwdTkcQ56evOKGPk34NFTSLTVej9tCEWTOwAua6Z6YcqKKjPO
         LSvOOQGmgeQ+Vp9nTMOjmT3Lcu2hvT5FWuymh7lclv7/HKNgzli+mppgFhclxlCn5Opj
         MYKA==
X-Gm-Message-State: AOAM531FLqxLK37oYXqabc2kflrlwcUwBQct2PJMwobijufuLGeFZNGF
	NOoA+cjyWoBJlOgNdfa/MxuvSJeF2/g=
X-Google-Smtp-Source: ABdhPJy010VWHooEwNIIQdv09OSPT8om35/HgLp7PAGf5B+m9oDZ9OB+pSD3y9CmfBq6R/3+NTJBlA==
X-Received: by 2002:a19:86c3:: with SMTP id i186mr13995796lfd.59.1596026518682;
        Wed, 29 Jul 2020 05:41:58 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h26sm436001lfj.20.2020.07.29.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:41:58 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] mbedtls: update to 0.23.0
Date: Wed, 29 Jul 2020 14:41:55 +0200
Message-Id: <20200729124155.3367618-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License checksum due to dropped due to CLA requirement being removed
from the license (see c76a54554ca8bffedf@).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb}     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
index 12ad39761..3e4553291 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
@@ -18,13 +18,14 @@ understand what the code does. It features:                          \
 HOMEPAGE = "https://tls.mbed.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SECTION = "libs"
 
-SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
-SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
+SRC_URI = "https://github.com/ARMmbed/mbedtls/archive/mbedtls-${PV}.tar.gz"
+SRC_URI[sha256sum] = "5c8998217402aa1fc734f4afaeac38fad2421470fac4b3abc112bd46391054fe"
+
+S = "${WORKDIR}/mbedtls-mbedtls-${PV}"
 
 inherit cmake
 
-- 
2.25.1

