Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.1845.1621647344343773266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JZqNaZ8g;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id s22so32796905ejv.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hnv2Ld0l731T4Y6+Fvj69Da4J3MoXtnBRGPxTHICwPQ=;
        b=JZqNaZ8gey6bxfQLDSatfqtxqrOkyOQ/uk0VKvgt/cDIJGbEWsJsPMHWj4cRaiWJmH
         p017T3qDaJ998R1LEBKAxnyvUpYTSrPnfGQH8RWfyxNvN8izH7GNpvTSLXj/TlQ4WO4y
         65KR33WxJAnVRAHJ7WUPZnhZRL8LWR4HdupQ+w4SESnX0rxnwuLWo8xCpQ1UExYFT/id
         6rUSITM94fEFsFIsDwYSut7/fGB+5O6FoqH+izgGS1IuxiHNVzQzK3cRd/d5ayd5l5cF
         qMe4vv0nqN0SQFOFjErMaSXVo779wvlcDmosW7A/R010EKRanpI3OZkmEIdyI1dFj/3X
         ArNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hnv2Ld0l731T4Y6+Fvj69Da4J3MoXtnBRGPxTHICwPQ=;
        b=hIiGpLuWIgYShemEpSOy5PgUwiTf2xa7Qjx9ivx1RFvurd7IQKjagicyE+e75wq7Cy
         8DRjfFKC3JmeFckyeE10h1rmdrSaw4kxPtLmyydAhJoCeNGl8+uxzoge5KRCJwo8DUzW
         bAPwLRLbnRQWQF564vppE7P/MmhED+HNmKQAIg9cobfn374g3prFiS5QjIvrVGajGzcg
         h7oscyhbsulSb18G9OpXkQCQEkjcS1HO15JRJESiMyh6cGxx3rLObdsYGISKoTiVy718
         vSAmShkp9BhLDioDCVjDUBIH9Uen9/mFQf21hukTQ2ct0UgPsF3WMtxUhjKpJ4dJhQhV
         FCaw==
X-Gm-Message-State: AOAM530/06J7UFwEuUMp3qNTG87bTjj5eMpX8wa8NoVMlsqfv1mNRdLq
	3ofLCOmmrJT/8E/sTkCAg+TLZk5iyRQ=
X-Google-Smtp-Source: ABdhPJzOMxbykqZpik3xH7ySpOS5LPrI30+YB49kD6Blw+764DXPR+9QEstNQbBS/PVmXJ+D9D76aQ==
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr12922943ejb.421.1621647342949;
        Fri, 21 May 2021 18:35:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/17] libeigen: upgrade 3.3.7 -> 3.3.7
Date: Sat, 22 May 2021 03:35:20 +0200
Message-Id: <20210522013521.588774-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simplify packaging a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libeigen/{libeigen_3.3.7.bb => libeigen_3.3.9.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.7.bb => libeigen_3.3.9.bb} (77%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
similarity index 77%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
index 6ce318d0b..d6ef98f94 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
 
-SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
+SRCREV = "0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
-FILES_${PN} = "${libdir}"
-FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN}-dev += "${datadir}/eigen3/cmake"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.31.1

