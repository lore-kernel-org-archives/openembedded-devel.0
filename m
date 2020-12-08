Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.4770.1607406929335421764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kjeIult/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id e23so11191205pgk.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 21:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXkrcocrVOqV12IgH8W4qPaSOfZJfu+UzC4aUjit6S0=;
        b=kjeIult/JcQMVz+f2fjV9wfw2Y65FTb9xRM3Q/4uv+1L8k/TW6SGqhAeu6ubnc8NG3
         trO+W4HVEfMrxiXr95eZrD79xQ+OqPig3q1expTtrZa9N22lHtK404OA+8Dw/PLmS6iD
         gOL0hms3w2/Avk777j6n71MdFe53Bx/UZYMhDMsqJZ+S54W5thm6j0hAQH+HfTr/jqxU
         r2Wxm7XF5w1HvrKyEKYMdvY9Z/j5evcY4V1h83B1JJcuFXhQxjx6aQY2A8xU74HJ919h
         32biVBbIpII8iKbwytqyclytY9CWiBDavkupw72XvAlpx9jPyaDLN+sDnzCSks6YqOJh
         DBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gXkrcocrVOqV12IgH8W4qPaSOfZJfu+UzC4aUjit6S0=;
        b=TWJGsF3VYs/uuITRpMVKHlgq0a+T1qO8MHBmrSp61Mt9g4UUbjwf5jK9a3aEl6xFno
         9k3S6ayIl/evxLgzdSotzwtzuwUmum6E43V4Nawd8ypl9MDYpED9UF+c7aMrv4UQwhdh
         RRwqtr6O+ERXLFELps4VGy6djt5dAr7xej0E3LJPHqY57jNX1u9u32fN+1LWNpGc9N5V
         e8N7mEPb6FOxDR6NJVxf8v1OazENL8zDq9Re5rmvJUg+9P7bDuhi3649AiLerT0/dzLa
         WZNDwmosT8NPtwzQnrcXgfvk+q0A2CxjBaUWjjqxyqj1B9/vgiRqeLHAZcvm9YaY7AY2
         rK0g==
X-Gm-Message-State: AOAM5324tzXMmAnixnFsn7Umd/0auJARZse6XORp/wQFVkh8t+htm9Bn
	wC9ssuDLnJq2gMbQGakYV9m2LU21KBujVA==
X-Google-Smtp-Source: ABdhPJxEM0RgY73zUiYyw2cVKsJMQBphOaIhvmJXYMuO1KosQs8qGdPq+IDkh9rGhaNuE81O0kWH3A==
X-Received: by 2002:a65:44c2:: with SMTP id g2mr21529308pgs.256.1607406928592;
        Mon, 07 Dec 2020 21:55:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::23fd])
        by smtp.gmail.com with ESMTPSA id a10sm16182009pfi.168.2020.12.07.21.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 21:55:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 1/4] lockfile-progs: use DEBIAN_MIRROR in SRC_URI
Date: Mon,  7 Dec 2020 21:55:22 -0800
Message-Id: <20201208055525.877400-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
index c76e0f69e0..a82f10b919 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liblockfile"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/l/${BPN}/${BPN}_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[md5sum] = "4eb83bdf88016db836b7cc09591fb0f3"
 SRC_URI[sha256sum] = "a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6"
 
-- 
2.29.2

