Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25256D3C54B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:10:03 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15024.1765372192839878571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9kW/A99;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so8210815b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765372192; x=1765976992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LogkxWOWpUTuk8Y+MCsd5UnCU+RRfo/QxwQELHbe6I=;
        b=I9kW/A99QIjE7CeesPa72cArDWD1DhqU7wxjWz+jIsNn+t3ZJ0HVdeVf/Z0kGy1r4F
         hkkdIoqKjqek7OST7pUINRNVmdHVzGtasYIoEfxiGwRsKX6INc8hBF6Spvfz7OnSBsb6
         QuM+WsFMFtddHojGqccI63M8OUE8LVZScZWqu0/IopyielUAVB18V8JH9pk2ucyi0NWz
         rgkr2FimE+dkXHZTOsiqCRseLEQyGMX+eAWK/EWHWXuChNebO/Jn8QTCOBnJ2oP9mhN2
         jrWceRz4QGSC84zO02MXBua+cJvm3sbKChGqEvXls6E7AkSJdG2D76SdRKhKDpBaPEWs
         V78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765372192; x=1765976992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7LogkxWOWpUTuk8Y+MCsd5UnCU+RRfo/QxwQELHbe6I=;
        b=VF3RnwxkaEpn+HZPtqh9vQtJh3pMW1h9eX4uNuhdymwy+dAsPqcdVA7sVzSSsD12hT
         bgqoujHJSsu0oS7P1X3Ir4Bfrai6iFqYeeRTdkNiDNLAbYjziXqAOsTTmYImZY76aFLp
         rmCsy0alHF3tNT6r30WPN0SqusgS6CmkiFJrcncjyRzLNMymtQjtVG5Y1ywrgBfoJXQx
         VZJ/Tlfw8wEEdqktyUjighBOs0AvjSliplHnZR2nOPHObYu3AEA+s6c+AXufwqol0srt
         PeKHNrTEGQe865QTZ+bFyzUmi05DcsEPhGc9iMXSb7WViXoRQ61AXV3tuwO+YZYobson
         9oSA==
X-Gm-Message-State: AOJu0Ywjg8GFvCMNPDsQQ8h2WkNDFPnFyUsusXg21r+TjqzyaGCJ6odJ
	1f2ex4w8NaehoWf65I1khPgA7Dj9xCS25qkIBwRY/RH2e+vxKLqp8dtEAh4MJg==
X-Gm-Gg: ASbGncvzcbRBkr+uEUau8Zi0x+XQfvUNdpErqoFSSGvHAgntLUwxo4L9PegvTppE++k
	P2ac+XYGXumOa/4ZNvOVuqB2NrlLsubgVq/wPAUeb53Lsl+jY5qYBTPCdrPtcD81GqzeZ2MJK0s
	vNNA97NagX+UgQT0dgUTAmGcFUkRD5E9zMv7R+0hjQMpRohcBiiPaClG97MCfaLtgLcHcRTRSFH
	CXNbqDuXeBBP9pS0aM9jcajTCN/ot0r6L60fwnuObQBzkc9qvkpCEA+BHeDXEvaLl7Ib1bLoybH
	CrijPO+Azkfyvi1bxDyKQOm73Nu63fjqIEWvd6n5lK8lgYX+llB87Wbb97Mz9hzSv9Rsnhe4OPJ
	NgG03JHjqQhHiB3SVlIaADWWK8VgAszCqt2eEWngNe1U26w4Tm2zsjnsj3YRN56LHHTvuruyPbP
	8siEAKVCmq7hHVu3IKcnMuqwc=
X-Google-Smtp-Source: AGHT+IFLXbKLx33MR/CKud6ELe+UyvvKPdeevgj06gJYEOIND/VIKF3VPSmu4O7YWGPdXx378wrilg==
X-Received: by 2002:a05:6a20:7d9d:b0:2fa:26fb:4a7b with SMTP id adf61e73a8af0-366e30b6dfamr2481157637.57.1765372192028;
        Wed, 10 Dec 2025 05:09:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17803086a12.16.2025.12.10.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:09:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 15/43] libplist: Fix buildpaths in ptests
Date: Wed, 10 Dec 2025 18:37:11 +0530
Message-ID: <20251210130747.18149-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210130747.18149-1-ankur.tyagi85@gmail.com>
References: <20251210130747.18149-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122519

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 3a6b83c075e606c1bf2b46b9c51bbe22ff4c72c6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libimobiledevice/libplist_2.6.0.bb                 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 17b1d7cfd3..5f8d1f8d72 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -49,10 +49,12 @@ do_install_ptest(){
     for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); do
         install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
     done
-    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
-        ${D}${PTEST_PATH}/test/test/plist_cmp
-    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
-        ${D}${PTEST_PATH}/test/test/plist_test
+    for f in test/plist_cmp test/plist_test test/plist_test++ test/plist_jtest \
+        test/plist_btest test/plist_otest tools/plistutil; do
+        sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+            ${D}${PTEST_PATH}/test/$f
+    done
+    sed -i '/notinst_deplibs=/d' ${D}${PTEST_PATH}/test/test/plist_test++
 }
 
 PACKAGES =+ "${PN}-utils \

