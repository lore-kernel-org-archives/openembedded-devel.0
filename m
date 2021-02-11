Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web09.1730.1613001916563778275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 16:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=h4gMgc5f;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id p21so5556732lfu.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 16:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRrKeGxIp6OcgPWtRWMtKN0g/peFaFLd3u9IETmMJ10=;
        b=h4gMgc5fsi25/ff+Rp6PA0q1imvzxolZvJnWgrWNw+UsY2SmI4OX+O3BZ6N24IutEW
         eD8SrzZl7Yqj6E+bjSbUgIrVYCJ6jdz2VWNmz72sX+ghwFIFyICKctkw3qSOet6wpgtp
         Cm8kZyIpRZsPp35LAXBde/pkgtng4gL9N/4PiNkJkGAFMSVgGMHStnm+nb4WQ6Oc3h0w
         fcPTsRYBmpgSvpvV2Ha0HpNxTIZdLOt7Ij79lJLE89ANWrFpL3FgSTEB0L0JhPK/LubZ
         HY9pFgdzja/+0QR729vjLfDZZvdK6ogaRYuAa/PFbUVgRONyhWrp50zOANFsMrSA7ZD2
         y22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRrKeGxIp6OcgPWtRWMtKN0g/peFaFLd3u9IETmMJ10=;
        b=SrnrpQZXp/o+VVebpQOpUBsWR/hhCgzofO4rpIeLvdihpa8znv7jWDT/ZpafIWNazv
         yoEJRUGiXRCSxgXa50NZ0VU1iB9PX5dWo/nDPxI++EU/4xzwDWUNCAAwvFgFuSoTyin+
         NMeMmEhW2fLouSB6/LAwmwOWW03gKwXwxLEo5qiiONs7DnU11Ix5BUzZiIJzdCDIIuZW
         dIDp7ZQHZKwrK0yZ5AP8AtD8IgfejFIj+kmd+qBzcskdgXj5PVlw+5yF9ppcvF6YL467
         SJotrBC5xJ9lHnGChXU8HovYyiEUu2bPMNpDPIGvdCnYgeHl85y8tYmitf+9Fqv3w/F5
         tT+A==
X-Gm-Message-State: AOAM532uKwZlcAiOAekh83swffRISBlWcdf5ivD6O3lzEzDpuDYNsRZr
	7VGzTYMjFVnW+r/h9PPh+WN048Rb0+QlwePZ
X-Google-Smtp-Source: ABdhPJyGG5ZogTrCqsCCkSeSv3+m9YQyjM8HeIkjW+IOzoFfNTBK84uJnfEweANK97vKwFRZMHbpCQ==
X-Received: by 2002:ac2:57c9:: with SMTP id k9mr2869805lfo.165.1613001914494;
        Wed, 10 Feb 2021 16:05:14 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q15sm492243lfc.60.2021.02.10.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:05:14 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH] python3-pychromecast: update to 8.1.0
Date: Thu, 11 Feb 2021 01:05:12 +0100
Message-Id: <20210211000512.1922554-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon3-pychromecast_8.0.0.bb => python3-pychromecast_8.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_8.0.0.bb => python3-pychromecast_8.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
index 939db5768..7b2b5142e 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36"
+SRC_URI[sha256sum] = "df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1

