Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.7984.1588332960744115837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rr9Qyuvk;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id e26so5685219wmk.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wbt4TzKr20ES/sdwCpugcaoO4gof7IbiDXONgh/ftys=;
        b=rr9QyuvkTFaJWTuNJjuOIMfw76T9awSyl+zPiLAz6A9a7jubygOgaaWp/BcMUUfhlO
         javOYbW+wOQuWsHYrsq3ymwKv+cR6p2aMc+vAm2Pi6KyvE4CqLAHr+h5BMhZzDNxMqU5
         QWPJ5aB6H78l4B4l26ceHR9srEI6I46aTuLgTX5rZsdBiBTEVltTsyb0HvzpbTKlZtEM
         p8SfCzdMLhfa5xIRM+fbQIpPM2JpZQwXcEnPJa9mo9Mr5IXMrFcVT7s+nXM5B23vqovx
         vCnCO5H0m9dvT/q7yArqdr4WVEqutOe+2ZZ844HRUNPcldG6mMyzLIrR1h6rsJbvwBIR
         XFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbt4TzKr20ES/sdwCpugcaoO4gof7IbiDXONgh/ftys=;
        b=FLjVljjqd35XJ+TIJARG+cEoIi1403ecMdIo33ofhv9+nX9V0GjeU3Jf68vG1qSHJY
         dlfEKORVEG6oRry/nmNgZtxZblBMKEusJeJEKza+ZR6d/o+hIc2l0CxPJDUT6XEcMUWV
         9/EvtP1QzzIkUWZeCWB7qEtGSI5/5IdZdHCxTFC/sxU/DzxNdPf3+wVDGmm2/nrAryHn
         fIVvS7dlA+plQYWdJG++O5qWkA8Ga1gx7ci0fhtz81VqhXGzgVByuLPKBk7yPkl4D8Pw
         Lf7U8Q2kLGytFSIEK+k00CaEhTb5V7N0vl9/oxF01ItL4yiDKS6B7JKh94AzM1hvHaBf
         BTRw==
X-Gm-Message-State: AGi0PubRmGCxGQvJIG9rpbUOxcCJiGppYVhDmIBor4swbp6IgQhFoN2U
	L6um5jgsLHs5T7/gQle3XXXp9jCP
X-Google-Smtp-Source: APiQypIRoxZLyG57MQsmhlzWWBv/imGFtzIceVbxf3k4ZYCu8MZpHW9rizexoTNiCWVBiW6itT61+w==
X-Received: by 2002:a7b:c7d6:: with SMTP id z22mr3833618wmk.73.1588332959067;
        Fri, 01 May 2020 04:35:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:58 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/10] qpdf: upgrade 9.1.0 -> 10.0.1
Date: Fri,  1 May 2020 13:35:33 +0200
Message-Id: <20200501113534.16030-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb} (85%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
similarity index 85%
rename from meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 44a5fea84..f04e437d3 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -7,8 +7,8 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[md5sum] = "090d03ab179c281233f8240ade179d54"
-SRC_URI[sha256sum] = "3abbbb7907f2e750336b9c97e67b6e806aca91ab537402ec080656d63940ed79"
+SRC_URI[md5sum] = "eb7fb7c6cd5d3036bf4f7a5e3f44d995"
+SRC_URI[sha256sum] = "5d2277c738188b7f4e3f01a6db7f2937ed6df54671f1fba834cd3d7ff865827b"
 
 inherit autotools-brokensep gettext
 
-- 
2.21.1

