Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.964.1613177604565847469
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tSNs9ruy;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id o63so728739pgo.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Feb 2021 16:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDGS+asInHFg6bEehcD3fbXW+W/dMTq6jfacovimpJk=;
        b=tSNs9ruy2Nvn8eWTmEgchAJxJ4VodfUfM8WRwboKeA32jpjQjandnB/zs6XvGFBVJ+
         WCZjKubA0RTlBroBoDZEF78jCjo3a14u+Pr2EykpFPxaVpaJYzJsXmLrAHi1qyompqs0
         aHRs8uPZtddaPpR5FLJbHb8LJHUmPCdw7XsMK4u9xqxHPmmKzYtRKLNGNGfsW6h4+DMg
         +IGDbhKvz39WD5PXniH9ozN/KzXff6MKrXOE6RU8IQJzIpkXHjoN4uRynjjp5xPJYhHn
         BqYhCVm0VLDTAkDitJipbWssOqKbdPff6taTNvmSeVAXH3BKRmZOP8nJF29HSJ7y6Gwg
         6RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDGS+asInHFg6bEehcD3fbXW+W/dMTq6jfacovimpJk=;
        b=HEdgCY11p1beaUAXjD/BJlZv0xS8E7C3qBevzdcN4YrwoO6wtPE5yanoGzcxrhct8l
         Kyo80EdTlOc79gaw3n0fRoqpHulzbGkhWqKLsU9myaChnGAHvDc5XcGXT6qRv1rNHVs7
         kTzgU74ZxCeXDT/MBuD1KUtU+zIqqk/XN10v8P8R225OUBIyRMQfWTqfJ+4KSax1nmut
         QuUfH5zlk4XfxpJGkaxLGUkCbzj+gOS10XrIGYmo0tkrfded1CSxF3zmD8GfHLMBg0uv
         yr/SxfNFDzO5MYKMOaRkdMTZViWmDelkKg2c/9suO2iBzuUUz4wfW59TRKHvpHrHSx/k
         a2Pw==
X-Gm-Message-State: AOAM532KLAowy+ehxAKm6uSW1//SeZ2DxtGQnlHzGBJ55eJx6cPddweq
	337YiZt28hXALvPmcJsk96xWffvyE3D8rA==
X-Google-Smtp-Source: ABdhPJx/H+eGJStpT4H3IoMQTvfPFGwFgHn9DSCFynaLB1kHlFQUh0VM2CGz1LXAx7TTfN9s/UjCnA==
X-Received: by 2002:a05:6a00:23c7:b029:1e3:aeec:d9d with SMTP id g7-20020a056a0023c7b02901e3aeec0d9dmr5131234pfc.56.1613177603770;
        Fri, 12 Feb 2021 16:53:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3857])
        by smtp.gmail.com with ESMTPSA id h11sm8609187pjg.46.2021.02.12.16.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:53:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] yelp-xsl: Mark native libxml2 in rdeps
Date: Fri, 12 Feb 2021 16:53:20 -0800
Message-Id: <20210213005320.1895784-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using libxml2 create a runtime dependency on target libxml2 instead of
native libxml2, which is what we want here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
index 6b9d769b78..14a8850560 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
@@ -16,6 +16,6 @@ SRC_URI[archive.sha256sum] = "4fe51c0233b79a4c204c68498d45f09b342c30ed02c4e41850
 RDEPENDS_${PN}_append_class-target = " libxml2 itstool"
 
 # ensure our native consumers are forced to inherit itstool
-RDEPENDS_${PN}_append_class-native = " libxml2"
+RDEPENDS_${PN}_append_class-native = " libxml2-native"
 
 BBCLASSEXTEND = "native"
-- 
2.30.1

