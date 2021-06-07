Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.33300.1623055420983420835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=M1BeGFM5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id q5so16627854wrm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bhSTnxTqTJXOMAjeJRtmiZrWpfpxsm6m1LKU2JtaNyk=;
        b=M1BeGFM5FJTmF+gx1eaMFEPZ4EYqwsn6so0wjU45gUguUWmozSCobPUpRtMkXBgKJa
         HkFLkuR9byN3B6GrWwqND7+6bwUnBACuWIV06ysYyGGToZV7/B2zWvTIzDTjVEFY7R7j
         8ARYoAYheiPOrvecaKoXuOvugDWW4pNeCTs867LLw4WpjRS+qh8P7WsiNWvS+OfQUsuo
         OA7IoTYLNZQmtM3Hm47VLi1YLD4MySQwzIntS0798bUK/MM6vxhMIkJXeq/PbNeQFAXB
         4k/Sq/UrgJFjpiSgppi41gnlNjxsxrGIJhqzZUp0/aYgtljgXpEZCO+6c+3WqHhc+Pk6
         vSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bhSTnxTqTJXOMAjeJRtmiZrWpfpxsm6m1LKU2JtaNyk=;
        b=bGrnsE+7y8BrK5JYhvZxejKZSP9si+1DZUI7N0zrlDC2tyav71924oiTyGoc1a7vWN
         DJRNkqvdgbMfaPJw0QOui+7d+jNPN48f3fx+Abo47GtduEQOQf84pPkdRPEBDjb/30Hr
         e7aNanXIeVfE6pwhMAEf9NpT+q7+Hm+B7Vcfwt1kSCsVDfkWonFY2TggJMgzlricg81I
         O5BosWqaGdi3ySqeccPqnnhU0vGp3nI+Po/py8Nf8DjGcX4xMHMUjsPeZcnqyYV/K1KQ
         Y7e/eeIhREGJj2sgKF9WEyRYg9ti6z+ILl1a62zFixB+9Osv1m7LROwZfz8BpRgb57Tx
         /MHg==
X-Gm-Message-State: AOAM532Dprak4KEtdE+IgsJFfxNXN+yPBzcO62ltRuXkTbdseViSBm6B
	NVtIDbI/GLpOenYNkgok2lJG2A==
X-Google-Smtp-Source: ABdhPJwvPuRtiqnjMHvUd3s+G6z/edZlpk+XNSAZTU//AnawHKRFi602V5s7C8BSr0Q8h4vIbNGMog==
X-Received: by 2002:adf:e907:: with SMTP id f7mr15984555wrm.112.1623055419301;
        Mon, 07 Jun 2021 01:43:39 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (amontpellier-652-1-286-103.w109-210.abo.wanadoo.fr. [109.210.101.103])
        by smtp.gmail.com with ESMTPSA id l22sm16014545wmq.28.2021.06.07.01.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 01:43:38 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] libgpiod: add the python test-suite to the ptest package
Date: Mon,  7 Jun 2021 10:43:35 +0200
Message-Id: <20210607084335.1885-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One more follow-up to the ptest updates - the python test suite was
missed and is still in the main library package. Move it to
libgpiod-ptest.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 48a1e23ef..4feb2a669 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -41,6 +41,7 @@ FILES_${PN}-ptest += " \
     ${bindir}/gpio-tools-test \
     ${bindir}/gpio-tools-test.bats \
     ${bindir}/gpiod-cxx-test \
+    ${bindir}/gpiod_py_test.py \
     ${libdir}/libgpiomockup.so.* \
 "
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
-- 
2.30.1

