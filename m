Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8159CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:29:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5196.1791617338531468066
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ao5XnRCF;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso133103a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791617338; x=1792222138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y2dfV6ziYdrKE/Fc2n5+YG0EVjAejwGrO6yuGWLH/E=;
        b=Ao5XnRCFHF2w4x/tWspisDfBoRhRACQ0i/lsD0vQJehuKwCkRNzN45LVhLEoDrgG5w
         2+Pq7VzOln89qoxmHrA/7RRr6KS2Q/DwtoWOD8ZeLICqAl4yHPZaYdEmcuWhOYbtpDFj
         rjRe6ByehZZln3K3NabpFPkzBO5Zl3uyo3TMUquovez2Sv0TPOogQpsbibhdNiAEU33L
         aVXrBMMHMeFAVqFXl2VH5FjV+m42tRzL3BhpurJ0haOCoaVJ/qmvZoDIRkRguAH8bG/J
         RVifLBp2w/qRjmthU2dK41nhD5tMrANx2NI74olRHKlE63nC8cMNooehjnm9+WbbixlN
         MgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617338; x=1792222138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y2dfV6ziYdrKE/Fc2n5+YG0EVjAejwGrO6yuGWLH/E=;
        b=buyaDDEAfVo+wdQu4aK16AvLxOk+RM3oXc++kxrYwXd+g3QFH8CmhFGkeBMoEwWe4q
         t1OH3gxcLLajYl832pFH1iaelep7q3fXX6q5E0ySvWLyOhNT1k/ptp0+W2xpdDM7Ymrq
         L11wAJJaXlQ8tjDkxAD4JI5T+bFk5ij1iURvIlwZDc6UW5PZ08Gm0y7kT3xUdB0FTill
         N1B9VVa/s/2rVFtcJ8SUElU2Bh6or9SVwhoxAs26p6MniLsacT2jBGVyygpduMThqJ73
         b0MNCcPBD9QgP/8NMBi3Ad0MsTbRUwp8LAf/9wHPy1HMXus/OA/qcFuQ/W3iHC2WvSy6
         9BSQ==
X-Gm-Message-State: AFq9FYKUlTA/ryS8GAIlF9DhG1UnV01wQq3pRpvjimIxMLgV7Eu5pruQ
	Z9kYlIZI8Y1a2XffXcmOZogEIUxJDqVOH1o+mtxRIVuGObx8wbqGnzXjO6DM79lHN48=
X-Gm-Gg: AYBFou2sVdadwBUVDxgjn7NXX9GnJeDRAfPrzjc4j2ZJgQkUdwWN6ghWiPL+h2s44JR
	QbQKGZdEdX3a73g/rBnnZJLwmc9gXf+lvYBuxfdmvgh40OUluWFBV3QLAAJEBDuhh1jf6YVFD6D
	Ctd87UGfUB3QIvi4GBIXmhpcyw8A/z/TiFZz5Lxhw5cRp26P8+A8VZb9syPqXs/74TzD3ackxoE
	qThzbJ2yKgXJKyfRyCcqALgbtq8Bm2o6ycPPv3Xjx3tFZpw82jwUD9B8zb1w/1PTCYSvzq9CkCL
	4swYUN2yhiNCWi/EtH0t7xzHzsi/Zx8QKWMBgX0R4wU6w2gcyVIjJbeEYQKsViRUd/OmDHHzLz6
	o8UarbmsGFNyPdzujwQyfA3ESCOzRCW3pVDTobybWUkkDWp0RVS8I3+pojEf9eTABhSgNPq9LxG
	EBndTcXLP+qToaV4EIeSSv5wviYnTmANbd50MGW3AQkXhpGKh3822YAdHm0XJiHuT4WK3GenjW8
	Twaz0QP61YALuBjNwJA6SiPZ4Z4xm1nkOAk4Ac=
X-Received: by 2002:a17:90b:4b05:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3ab3a97a18amr3754144a91.58.1791617337709;
        Sat, 10 Oct 2026 00:28:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm7232095a91.13.2026.10.10.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:28:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/1] apache2: upgrade 2.4.68 -> 2.4.69
Date: Sat, 10 Oct 2026 20:28:49 +1300
Message-ID: <20261010072849.3258980-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130714

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.69
---
 .../apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
index dc8c0df12d..fba4667bd1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
+SRC_URI[sha256sum] = "c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 

