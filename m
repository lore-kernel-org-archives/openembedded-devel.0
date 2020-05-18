Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.43432.1589813436014294137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFlt7t+L;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id n15so1831901pfd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k3ckpMK7528XI24VmG6NURVft1x2RAXF+iWRsA/5jq8=;
        b=GFlt7t+L0Kp7acEsJ548Mz5IwtERnZa3B6xyXuMb7/GP6JeJQIKH8xokyq5po4A9S9
         0KdfiK3IUliKljZXdcmQPH8XzxTo5CygAxrJY5Hy6Df+CI5Q+DFYNEyupeef0LklM+nG
         zT25xqf4AgR0Gd5r29IXi2JLqXrKM6CgVZO8bMnn59Ovm75MctGlCHK9wuTN9xXxpOut
         L/CrwpOWKBvMV74G2dGPaXsTimorvlxrEj23fl4i/ZPIPcPoVv6gOgWLKWYBn61ECg4C
         pPn3jNSc76+Ve1Ym7O4EN/7VdYeVFJJTS06emH8JnjVGponA+iRpXesECi5X5/4WlCLB
         merQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3ckpMK7528XI24VmG6NURVft1x2RAXF+iWRsA/5jq8=;
        b=jSSQjm5oWmhGnkmUAsYUrfxQMDhdH8LahFKltbaozMBl37BKyoYk/IHhV4q7c0xfZ+
         VK6UvF/Vsu/MXZjtf9Pw8IYeDplJH/8lp1ThraAarFmlwyVOYHUQzwaxjDkBNTVufzYf
         h3ePhHldoeJtuvzlsmCxDzvA+OdbMOJyaqDNY0MiaaKHqWxaFyhO78cbNIPQkMWMv7GE
         3JQQ0wfYOiyOjSVDIVl97iy/mObNVahFwIeTkhE4YBeRoIaCKRo2J6ol096BHkCV1FMx
         hk0silVCXFq0hqHnj+4wLAfzF17aOmx0IS5jDjDP+9QCZQRpZFBn4J+YAOE7fGngZlFT
         Wb1A==
X-Gm-Message-State: AOAM532vUM0vCimCAKGbIWqx4/2MKw4rJlSRDsmkaKXzk5t8gAOl0AeO
	H/Oqnvo/zUI+5WGnvjRuQoP6PwKS
X-Google-Smtp-Source: ABdhPJwHWnxAnc8RKxMTowMB9ugp44vpyHxqfXz+pCMsGlPbw9X3+xFZQSnadvSv4LfdDxsKe1rG8w==
X-Received: by 2002:a63:4d5e:: with SMTP id n30mr15133419pgl.154.1589813435294;
        Mon, 18 May 2020 07:50:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 27/57] qpdf: upgrade 9.1.0 -> 10.0.1
Date: Mon, 18 May 2020 07:49:32 -0700
Message-Id: <1eb8798237e3be9b461698af1912ee824d0e6391.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 831f3fd5023b87cdedf877e07f72df3314ff4d58)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb} (85%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
similarity index 85%
rename from meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 44a5fea841..f04e437d34 100644
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
2.17.1

