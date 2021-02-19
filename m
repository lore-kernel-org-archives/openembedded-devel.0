Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.19.1613761392157292708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 11:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=jHmIw3cL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id a17so25792351ljq.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yk4Yhw1oVpM6RhEn706uvAqz70WtTU72nxjgF05CMLo=;
        b=jHmIw3cLrAGzu7wBi1/MDs++M0iEuQEr5/hhlP9U3TeDIU5gz2DjIFcrbPYh0jJ4vR
         8ZeAN0rKvEtlUaV8pX0RgC/LGhkQEFTg2nrQAClUDaX+UqEVS8Pi+eJGbvKst/waPOLQ
         Y6Feyv6F6NOlNf1zVGsPb17m5GJJ4Tk2brhijZV0FbWp5OZHLn3q0k8sbhCvtbDRnMpQ
         UTCCRHzd+2vLreWYnnU+whiBrQtOLKJxudUlAsYa0xukVujpfZWi3335JYpXghY7eg5L
         M0UTECFdAsC5eqzhFkxqWMaObikdLelflRDhtev+olMIzXfGlQE/FHSGOK2XRvEthBt8
         nDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yk4Yhw1oVpM6RhEn706uvAqz70WtTU72nxjgF05CMLo=;
        b=YzeRg7fp3gNlHdZTk4Z2rOmmpAW1uDCIPAT27tDpTeTV9PrIAaDLOsFu6qGipawA2a
         gYU+O42B0vlw7fUIYgQXtcW/H8+hLefr/3IDFJH+6YN823OuKSzO+SYfTJt1+SZqXFYS
         hM20Z599bLW0iu2tHg0RxDQoeUhF87JW6zpqX4KqJz0kFL3vCoKrtplKBaFQxcIX0E7s
         b9W6UKa/fEHMdDLc7Nyo8F5YyCQnGf3s57AQAzySfG9/um//heCD9i7VkRPAfrXGlSgd
         NHbkbKaE9TZyX4B7lWUIsXd+t/nc78/C+89I9LSBVpsqMW+xW8++712Z9Gg7iu9Cbhxw
         N2/Q==
X-Gm-Message-State: AOAM532txQ8DkF34quxruNGjLOg8/cCzZ6j5+X7YlLcy0xCenfXgz6N+
	axobaeVbzBWM2DkOUdk+tGGVUh1q/Ta0hgzC
X-Google-Smtp-Source: ABdhPJwwzOblvH6ALFSQDN3dUpYtMP4ZDZQIpOSHrzJCev5KqpNDfHAfCucCfdWYBlc2tB9Ch4Odcw==
X-Received: by 2002:a19:6916:: with SMTP id e22mr6100999lfc.421.1613761390074;
        Fri, 19 Feb 2021 11:03:10 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id g2sm1057983ljk.15.2021.02.19.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 11:02:46 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] rocksdb: update to 6.15.5
Date: Fri, 19 Feb 2021 20:02:25 +0100
Message-Id: <20210219190225.1902908-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../rocksdb/{rocksdb_git.bb => rocksdb_6.15.5.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_git.bb => rocksdb_6.15.5.bb} (94%)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb
similarity index 94%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb
index 117a16b9e..acef05b01 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.15.5.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "f3e33549c151f30ac4eb7c22356c6d0331f37652"
-SRCBRANCH = "6.12.fb"
-PV = "6.12.7"
+SRCREV = "abd4b1ff1504ae2a7ed6e60bc9c9797b880c33a5"
+SRCBRANCH = "6.15.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-cmake-Add-check-for-atomic-support.patch \
-- 
2.25.1

