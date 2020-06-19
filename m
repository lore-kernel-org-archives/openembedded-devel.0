Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.4675.1592566332011760100
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fPE2FiwY;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id w7so7362100edt.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGEvnFyHKRFn/USkxFaYEi2f4oFcKs0/kADH1W0z5G8=;
        b=fPE2FiwY9Y00p1HbVNOmUx+j7aED0cgdftoYJc4NYL8AqwQOmSRSb7vtpYLteHBMqX
         n7wESVUdaLkfYcoaddcCvSN8xr0cg4ShRid1tDAGnVsF0MGwHIVQONqd21xPO1kWeQtr
         +ovgAXfq4TFwgifKyj0q5+2jwu6zmeQZzoNqa7xLNDwa0lV0E3eISzW+GWmW6wHEEu06
         o0iVsHWtdKuPKEX32znr9tZ6UXSPWPEbMoPZ4Bqjf2gk9fHy5CvFWHMo7v7qX1b2T3VC
         +ugX/xBSufw0TNow2svWFIsi17tPw7W34mFPMwgErttBwi6FLgGCVqiwu44JzX1733Yp
         tZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGEvnFyHKRFn/USkxFaYEi2f4oFcKs0/kADH1W0z5G8=;
        b=mlVpdiqeflvtQoYR4flKTBkvzP+FkM1q83qtsaIc0IrtPHVG9U9qyEbCG1pW/d/Dhs
         MvbDQUHoCvDfQYiNe9Jyn9MeuDNg1pTbGToBKVCg8wWmQ/eAZfHdP1ZGpezcJK/sDnY5
         G0+ZbsnO70AprBftnU4wPafT7GAsWG9uTtyjKiPFgyp3ZamvjAhdV4++tygGeji0GcoX
         3f576brXSa6kzUIeEUDRNzIqDdWlRNgGO6ONCK/IJkqtHBQnosTIvoLnCy4ST/YsO0j2
         D8gtFvjOQ/mapVwFRufjIQbhATyCqamnIgjPPonHH1RjPYoDDM/VXTzzuKPadDzy5Oj4
         AHJg==
X-Gm-Message-State: AOAM531+jcke/Tj/b8rNptnukV2QloojguwUqO3og9urL5ApkOmvuE71
	WhJeiddOyXSYQREUZmki7SaJpNrqFg8=
X-Google-Smtp-Source: ABdhPJwRNpwaqHIXUDdtQUwGTUzqIPdTi5ijhH2YdaaXF/QfBTypA0Mbugm1267+y5KVcWSfurXQZg==
X-Received: by 2002:a50:9ead:: with SMTP id a42mr2703130edf.129.1592566330051;
        Fri, 19 Jun 2020 04:32:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:09 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/10] squid: upgrade 4.9 -> 4.12
Date: Fri, 19 Jun 2020 13:31:52 +0200
Message-Id: <20200619113201.2811033-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum was changed by change of copyright year

Changes are found at [1-3]

[1] http://www.squid-cache.org/Versions/v4/changesets/SQUID_4_12.html
[2] http://www.squid-cache.org/Versions/v4/changesets/SQUID_4_11.html
[3] http://www.squid-cache.org/Versions/v4/changesets/SQUID_4_10.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.12.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_4.9.bb
rename to meta-networking/recipes-daemons/squid/squid_4.12.bb
index 19949acd8..6e49790fe 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.12.bb
@@ -28,11 +28,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "b315d0dce37627dfe61eec7f5304baaf"
-SRC_URI[sha256sum] = "0f5829d878002147e7c4d9b8901c2c3c051693465e82e45cef9ab0e226e3e729"
+SRC_URI[md5sum] = "5d058f7f8f1db9fa4ce3db910a008b0e"
+SRC_URI[sha256sum] = "eae0ad993921e472ce36cce34674c47a224fc2868b65ef0c4b41b2f5f18378a0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=19cc4dd146f397e72f3ff6f9f58fbfbe \
+                    file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \
                     "
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
-- 
2.26.2

