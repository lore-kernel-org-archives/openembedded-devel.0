Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5071.1624439659130182582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 02:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sN3dV3sZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j10so1105002wms.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jun 2021 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJ4DvmPWKm7j3mlXX4vXrEdJ/9UuoaZ8Szp4Vn9C/w8=;
        b=sN3dV3sZsxEFEqxfSfqJsOLeQuNn8cEzDsMTjNsknQFCydXTImy45vvG2QLZC2Ys6P
         EKl20EL71HQ2RvkyOxjkG2E0bHKwVckm3cYRdpjA51UD8JlZonH8fRxQ3MXHYjdmci+E
         usGsF+lqqHiGVIm+HzXp2sM4FXlcqWthnc1yIxty3wyJzh+IEkf43qQ9PAZy29S0ASOm
         EtilnNtd309eu0EWXfzT5iI8GUbW+r+1xuQSPRhhQo+WwVYD1wepo0Q0cs2OE/6hlJhC
         Opgzesp+fn46G6Hd07kZxGcpttNGyaAZLvT0SikNqUCRCi16AZkU6Hdc8j7SFeQMelay
         b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJ4DvmPWKm7j3mlXX4vXrEdJ/9UuoaZ8Szp4Vn9C/w8=;
        b=pojFy/zoCD+I0Nfy/FeWIZaLgIi8MzXxjO5SEzv2jzs7UFQov3y5WHPDR6UIC6Ozqf
         /UOhFLq8Y+A6PDeLSxQGblVI/nPJ1/uBQ2hdx4cPgn4RuGh+aPcmFXyj2PIaPuKo/meg
         CTSbg2o8+JaTYWeQd6BNSGh1mFMJ4IrQteX/3ZATtQomZ+Ed7zuhzc7bIWFRPjppOfOS
         3YzxQog2JgziI0fN0ERfr0zcLq2PhF8HY7I/WudCmkiVpH7Xwd4GLLLEYHi+aYhfWxSC
         mGDqrk2k+LHFFUFe0HyR5P5wSrtDehhTzQVKQ+dzQkIZPAv+vjufZS8ZFp0OGrTCFMW4
         Xz1Q==
X-Gm-Message-State: AOAM530GSmT0yGNBuSZesuWsPHUYy4O6mfj9Q/Mr1FYSIYMh3Uady79c
	850mMMjDpugG4AgHIjGy41Ps5agItrs=
X-Google-Smtp-Source: ABdhPJxnWxpqUkCb0d5XsdxE1Ecdpd1QhraKMvIu43cHuBCh9MPr1oX3mh7g+AGN4+94cZZQqzpyCw==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr9745007wmb.48.1624439657486;
        Wed, 23 Jun 2021 02:14:17 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y4sm2182429wrw.71.2021.06.23.02.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 02:14:17 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][dunfell][gatesgarth][hardknott][master][PATCH] python-chardet: rename ${bindir}/chardetect to avoid conflict with python3-chardet
Date: Wed, 23 Jun 2021 11:14:10 +0200
Message-Id: <20210623091410.20811-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* to allow both python-chardet and python3-chardet to be installed in the same image
* now it fails with:
  Collected errors:
   * check_data_file_clashes: Package python-chardet wants to install file image/1.0/rootfs/usr/bin/chardetect
        But that file is already provided by package  * python3-chardet

* the only difference is the shebang:
  --- python-chardet/3.0.4-r0/image/usr/bin/chardetect 2021-06-23 01:24:17.172638046 -0700
  +++ python3-chardet/3.0.4-r0/image/usr/bin/chardetect        2021-06-23 01:24:17.412641733 -0700
  @@ -1,4 +1,4 @@
  -#!/usr/bin/env python
  +#!/usr/bin/env python3
   # EASY-INSTALL-ENTRY-SCRIPT: 'chardet==3.0.4','console_scripts','chardetect'
   __requires__ = 'chardet==3.0.4'
   import re

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-chardet_3.0.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/python/python-chardet_3.0.4.bb b/recipes-devtools/python/python-chardet_3.0.4.bb
index 19d7b77..d84a305 100644
--- a/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -26,6 +26,10 @@ RDEPENDS_${PN}_class-target += " \
 
 inherit pypi setuptools
 
+do_install_append() {
+    mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect-py2
+}
+
 RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

