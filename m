Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.13603.1612652667296373145
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=VyCHL5Id;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id q12so16241740lfo.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpShBCH92rZBSgpZlruci2aTuUcrml3UXQzZkRxrya8=;
        b=VyCHL5Id7L+TrupMFXuy5TFeb1bXRRqBpHcHbJvAHtVqgtQuxRwJXa4lZOgz+FGpJX
         PVzxs6VZsumC58MuW9KGZmkdwxcjt5U4obM1kKZLnqZvFGDv1Mr1DfdPPEqIXyuDUqEo
         he8ke4gdoapySjYZdY9GgDsnsoq/Rypic2toC6A09ghM0DgDzvozCqYp38KYQoZ3fiB5
         QaBzxmNV8KfgbeAmqdWN4aFql9pDuLkA6LPVB2NkIfmQDF/ynYEbS9nLH+I0KvD8LW8U
         oLUXEXFbeQugjtL7K0MrZEfEs92kPXgTsrOOuuo0/OTZApSD5sHfEZYKKm41G2fO7sei
         SC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpShBCH92rZBSgpZlruci2aTuUcrml3UXQzZkRxrya8=;
        b=CkyeRTFojrbYD5jcZE/YW5+xmhV8pH+qIhbv7yYEGvNbf/wwxM9V0J1NRMtrbo+eIA
         t8yTuqTEj6cBWhOvcJwsMNFxCLZ4JWGc+dOVi80ktEUuJiPmReHyow70ZlODDxQprXgD
         N/60NE/UsSMXwD7X1rkaGvXZpYLZc99+G1VDQSrhABk09g4fxIgqClrOfRZH4/tEIL/9
         ryFdOc9Zg7xvdzKo9H31UkcwTTNfink3+F6sC05sL1kgMz0lQSTOQSgGEk4WYJOfqgry
         GLl/8DSk7U2ynepVUvjmJbcUaDOz5vJIsUit84AEGDWxTUS6VULRI0cf0zeCLexmaveF
         dIzQ==
X-Gm-Message-State: AOAM532Q2gza6T+DE4rHOxXtEQ1H9rM/NFsxBHNHIuuGSuuQKXLDy944
	TNB3sJmrTw64Ml1Q+cnZdNsJn3fLpr0hesaX
X-Google-Smtp-Source: ABdhPJydDh3HK6D0YIzZVO5KIukiL+KO6xjhV8VT6kZWZoiaFeTAFzcZAGrKitAZx8Bof8q06ig+sA==
X-Received: by 2002:ac2:5591:: with SMTP id v17mr6097579lfg.418.1612652665178;
        Sat, 06 Feb 2021 15:04:25 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a16sm1455056lji.52.2021.02.06.15.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:04:24 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-greenstalk: update to 2.0.0
Date: Sun,  7 Feb 2021 00:04:23 +0100
Message-Id: <20210206230423.4106648-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-greenstalk_1.0.1.bb => python3-greenstalk_2.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_1.0.1.bb => python3-greenstalk_2.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
index 9447c1836..9af5a0b4e 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[md5sum] = "3374649586a8016fecaf0ce5ecf9985d"
-SRC_URI[sha256sum] = "0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3"
+SRC_URI[sha256sum] = "0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257"
 
 RDEPENDS_${PN} += "python3-io python3-core"
 
-- 
2.25.1

