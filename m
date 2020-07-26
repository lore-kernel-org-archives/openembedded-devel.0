Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.26624.1595759450212375489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 03:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NSLTCAbv;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id i80so7422246lfi.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sJjXRHUsP2TyMko3LZj9eH9iLrnA42kZSXm2MJDV5fQ=;
        b=NSLTCAbvq3zMmnX6wVyU0DGJW/DWHIBJL3mf6zZlp77Lux5MGPCQw4SOuE9Wam48ZG
         v91fepxDSdsuzi7mxFlpWvkFj/E+EAeCanyL2wVBI4yLMNukjSD/pIRWybzqkBT1FJLX
         Cyn47F3XDLh/bkU4nZ/9czkHuQRVrs6rHrPGKR1AH6rTvENm+0CIXtVNxukPkwANQe0v
         Bfio4IQrN9hfST1tOzHCTgkY143qZtY24TBGV8tup+2GlHsJNRMxkFv/VUzQNapdeEif
         0kdKE9m1rwC4mhkyjtNPpTZJt1Fwsr0AFPBvqeuZsnTmTMrZWC/7jN6/C+hMv9kypoi5
         qlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sJjXRHUsP2TyMko3LZj9eH9iLrnA42kZSXm2MJDV5fQ=;
        b=PszmUCnAfnvXKLxe4Y/ai5Zd1/+mJ9qGtii9ZWQLoHLbxa4PZ/bkTJsNsPcHrGqRl8
         YYtfUgGFsJej8u4n4V38YpjDXLFnwMDdvDTVNvBLBSJpAGEYeON08liRpXIaY0vYW/Xs
         W9DH185pDHyX1a+k23VK9cxhPi+si3ydQl8vTJhyhROmL90Jpaa4dJMuMIo6A0fdHNv8
         IADQ57x5of/aqI1TI1XTVVe9VflFFTrvCh1V21n5LCvYPQj8qb/DPSldE13m97DnjdBK
         c8KJqvIsz/cbO4ocSV719MD9GHuDKTlZHzW1pJSznrwIo+NWK8gPI+6iUAoFXLi9aPb5
         PUTQ==
X-Gm-Message-State: AOAM533ERmD55+ywCTk/FIDj+slGEGJffvrbOt2m/awPyV3x3WCZAZz6
	WaCFsUOZEBPSOmuKMlUNkyA2EeypiTg=
X-Google-Smtp-Source: ABdhPJwWaT+5P29U1rt6dBs4sw+cAGeQCX3qZjun0PPyQjIYze7tkxkbLyBhB+bAK+XruhSPm5Ek3g==
X-Received: by 2002:a19:9c2:: with SMTP id 185mr9472432lfj.113.1595759447952;
        Sun, 26 Jul 2020 03:30:47 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 29sm601356ljv.72.2020.07.26.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 03:30:47 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] lsscsi: update to 0.31
Date: Sun, 26 Jul 2020 12:30:45 +0200
Message-Id: <20200726103045.3995966-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-bsp/lsscsi/{lsscsi_0.30.bb => lsscsi_0.31.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.30.bb => lsscsi_0.31.bb} (63%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
similarity index 63%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
index af34cdc483..2c96de163b 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[md5sum] = "298a700cd50bb4be1382d618f7b038f4"
-SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
+SRC_URI[md5sum] = "efb68946f51860e8eedc18d6784afdae"
+SRC_URI[sha256sum] = "12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca"
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-030r154"
+S = "${WORKDIR}/lsscsi-${PV}"
-- 
2.25.1

