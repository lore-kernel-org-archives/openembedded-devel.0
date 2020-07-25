Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.7718.1595674792658077523
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=oQ1jjMnW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id b11so6524881lfe.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA9t9Nv6rRXjtnRbWzH9eNj9zLZiD4IBjHyQUDkUbbg=;
        b=oQ1jjMnWEm7nL3n+P0gPUNH7SH6LAp7iSvupploDnB6Y+/n0Lp3IADovulAc2vKIlS
         TqW2rjX4Hke3ThQRBXx7m821fHJ2OzY8r7llFThtorToeQVFORbvuTJmQMnmKO1fWKnF
         uHVPGeTtyOw7E4XBvDGPxtKRe7v0GXpSFEU9Uqq1YYVMm1oW/ZXexf40aa8O69ZeGdKk
         alun0Plv0ypP5MiTG5nJvuoPpmqEO6vzLpqs419yVAoSAiFSzqtf5Zh+ftvwY65y2lfx
         7+zGN8Z0oPdK8atgwAt/b9E8BFn8Y0HNYYRg58DnUFHn6E+9eHuAuTqykKxNFNZd0Vfm
         AyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA9t9Nv6rRXjtnRbWzH9eNj9zLZiD4IBjHyQUDkUbbg=;
        b=JgxB4x1kjWsy5sKvolfeRCYwn+HU5ATuaBBnE0RpNOGAgVq8EHwF3ehg6zZLBdS/TN
         kDcqUFi7ZF2MPA9sy02kQFdRyaTdYIUt7H4Y40g+4Un3hwWf63kIxpm2vez4WOOfOg+8
         4/qlQkmUjubMmKilDPSkZYdDYD4zatVEN7ZUUCoN6kvfxSgisMSacyfj6lBfE83QzCcI
         FQ395I3ykHDk4bvFT8u+ft4HIrgqvhjBX3+nO4v1DNsopngmQ1ZOonLvMmZNhLybxIfz
         jZmZ5sw1eGZFbGRdkzfuSHQXtHmcDr4oxB5gaWdJAQavs/TX7c9E8wpcPpVQnPURahZI
         cGjA==
X-Gm-Message-State: AOAM5335Vm2p2cwjpG90csS9Eu6RaV3WGxby/wwKPI90rWnUJmRfNgQj
	fEketGGtSL55REJwe9X65b2DY2trSXg=
X-Google-Smtp-Source: ABdhPJyyQ6c4YPaQGGFdRNroUop4INnbv33+uk9FIjU5VYoC3nUGGiQcSatD/lYddvffqojbsfQQRw==
X-Received: by 2002:a19:2d41:: with SMTP id t1mr7176849lft.9.1595674790651;
        Sat, 25 Jul 2020 03:59:50 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a1sm1203735lfb.10.2020.07.25.03.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:59:50 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libmbim: update to 1.24.2
Date: Sat, 25 Jul 2020 12:59:48 +0200
Message-Id: <20200725105948.2149916-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libmbim/{libmbim_1.22.0.bb => libmbim_1.24.2.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.22.0.bb => libmbim_1.24.2.bb} (74%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb
similarity index 74%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb
index 61e314f1f1..c7a04b6642 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
-inherit autotools pkgconfig bash-completion
+inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "87060e8957013177e4140edc6f64f5bd"
-SRC_URI[sha256sum] = "5c0778eb1cd12c3604523134e55183f5147b0cae71150e875b583768f7aa1f38"
+SRC_URI[md5sum] = "6c2b490af87773c8446f37536e7411ac"
+SRC_URI[sha256sum] = "32198c099987849c5f442d1cbf4b6e43e645cbdbe9cfdc197b19ddd63c6981e4"
-- 
2.25.1

