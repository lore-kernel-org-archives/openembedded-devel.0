Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.31298.1599599275769280926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 14:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nydjbd2V;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id b124so172302pfg.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2020 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeuxWOCU7vs5QufrHiBHGO7haB7DAemwo3bz9I0joJU=;
        b=nydjbd2VuCZB6ly4kCNe+ahvb/mICrDO3w6sDtNgQNuWM5eWYDqay0PUrE2Y2IBO/D
         nu4dwbjyBdyPOmpgZCeF8GXFyzqPEeLrRaaelR7DjN4EKEbgrOqhWYpS1ZQonQXJoKTw
         WdZ4a/LG/x3OmjQTge7Bvv6bK3ExbgI0AUqsQAZfYmNaILS9pfgkAAbBG4Qq2k4ytGcO
         8tkSz5YYW/947lui975dGHaddQeXXTkvSSjN7cR4efcuGyMb7sqysEjJGnWwhuDSKDkA
         cdTrDoxkXHei172KBSleRajp+gDtoYZV2eCHNg3liCYjGmGQxuwTvFQIQwqj8/Gcapl8
         R9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeuxWOCU7vs5QufrHiBHGO7haB7DAemwo3bz9I0joJU=;
        b=baav/eqGZt3V/K4q5x5whVdc+U2piBRdwSTkw+Pq+BpulcJNOCYeK7vXXWFBKrOBG8
         82LNLzcYO1KPszMlHGhw5pRQ4LjKwSv2WJz6X8gQUJGOaMsZvckbQcvhEVUcUbO8aO6Z
         32Fx53HluVcM+ERvXUgrlE4mI+GxUX2FVqjlx5Yil8IHdCVVUIaAZybiN8QSlb48Puao
         foV53HDz+GlavJjbyTS13NGbhv+JemyyHRRT5dsK0kfZDfTLiqAaP+3n/vIWHIadxA3C
         LiKiT08QOi+w2gl+9aI6InBjyPEUhB9gim8QRD75MAJ8z9SLijjbZpz+ili5dov1NbKy
         rYNA==
X-Gm-Message-State: AOAM530VGGHubB3SJSAAhi9AL+LTjQWuyCIa3jK2XEW5fZd95PoS10YH
	dk03aIjtX+iMZ7Y0yl/e3Mr5QKCgqhTOAw==
X-Google-Smtp-Source: ABdhPJz4VDZ5bHXzvxB/EkfsXybgrvWxnh+/dQ3KjiEVlHKaineenhRtay3RiKUec3c3NZsAfnad0A==
X-Received: by 2002:a17:902:7b81:b029:d0:89f3:28ca with SMTP id w1-20020a1709027b81b02900d089f328camr857145pll.6.1599599274731;
        Tue, 08 Sep 2020 14:07:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id q190sm338320pfq.99.2020.09.08.14.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 14:07:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iwd: Upgrade to 1.9
Date: Tue,  8 Sep 2020 14:07:52 -0700
Message-Id: <20200908210752.1821098-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Need this upgrade to work with ell >= 0.33

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
index bfbf3c7fa6..25500e6501 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
+SRCREV = "aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.28.0

