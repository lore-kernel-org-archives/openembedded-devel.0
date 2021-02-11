Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.1716.1613001921762819112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 16:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=OfBgANSr;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id f23so5565486lfk.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 16:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4CBv0Xym0xJlRsRFNl33h2t0oyKIiEjN43I5tp0st8=;
        b=OfBgANSr5qRPg22XFt3NzmFrS0JFoGl4omJTBrWt+2oUTnH94z/fzOS+bo9Z2/C6uG
         MiKtPT/X5byQIGDJBaL0UGUU0Egr/3aFwb6+6asKwZacSJ7KKuPAkg6Sdn6yQV5naufi
         RtAnZ9j9ZM1rFESYOPsqk6g76e+vHz8BIMBTj1IQ7xiusoQJh3B+8aEUNo2lsuw9caFx
         3/OYkGjZdFC0vH7N+Ex7vIzeqzYQwKQqQ7K/pv3IjvhCJy7Sj8tYSstzIQvz/CHWToHF
         M2AA4AobEvzCogGbQwPMjwstJDB6jzk5EWhQRXBmXgVkfRpV8sgoX25Z0r0pYnySkIiv
         4jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4CBv0Xym0xJlRsRFNl33h2t0oyKIiEjN43I5tp0st8=;
        b=FoRR29wWDRpSRx5npZDJoacnUvUSTUlLN7nnJ6FdG60hZE1tQk/8/jzakyKh1v9Jzl
         25cKmiCLoYUJ+Fl7fJxqNyXW3XLyeRr5wr57S2MCwsiajhe+XiBRdBEri9xDijPL3yXX
         SX2ZSHSgp+X44siyuJwv4OSMMqpPMf7UThA6ZusyB2QXhCixQPekLC553Mx8wCWUpzND
         xntZ48xlMkyfTFrOrIFG6dWQT5CxyVXmlpmVdzn8oZUB7OL9HW4Xzz5I66X698d5bb+A
         QgebGjyWLcrCGRx1hpH79uOtR9e/dEehOPAPCUxHMe226KyyMa6f7m5spVxyuLI3NkRk
         ZxLg==
X-Gm-Message-State: AOAM532UGh668x5ta+fG0rHI66TOfmdB14VZKwwUrh9LdTVQ/ZiWabLM
	LA1osvi0I8xU1FzxcFPJ5g5eXeML9eT28ukA
X-Google-Smtp-Source: ABdhPJzPD3YlLa56ZL7BpMmMTlXQqKrkoD2MV1xjLHxQmjbRRRfGxiSsgkGrqOVy6dZIpfwrvv3vYA==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr2940558lfu.545.1613001919677;
        Wed, 10 Feb 2021 16:05:19 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k23sm703955ljh.15.2021.02.10.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:05:19 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH] python3-protobuf: update to 3.14.0
Date: Thu, 11 Feb 2021 01:05:17 +0100
Message-Id: <20210211000517.1922669-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
index 03d0b0c60..3cf850d1f 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
-SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
+SRC_URI[sha256sum] = "1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1

