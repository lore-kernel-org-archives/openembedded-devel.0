Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1FEC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11417.1784590758507364116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UkL1u3AI;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccf2360620so66285845ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590758; x=1785195558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtiXK4/bXeU5qDCgDVLSvCs5UOCdMpk/YIwVsJirKJE=;
        b=UkL1u3AIwpBD17SEs15CgmahgrKwUqzDdAIeDz6lWUZjH0QUUzFP/8ULN4OU7GCCjC
         vSRvhzwvAfGahuHSziPOFusIr5GXl4+m0RuVDImh0PMiqfH5y+bANIpBXIm6OUyV9mLe
         ee/WswinW4lA84RSI72wjbmU1f1wKJTHHiMsxVeMokdXS+e8fLAoyjWUcjMqIZeYrHSH
         PtDwC05nXbsTj/kPN4ZBJNtKpT2pZMB6h0Vihh73lR0YxPpljczq+BV6xcRfF6pwpjeS
         PMfXt7KIBgO0jLkoQ10ooAlPKsZmU/SXN2ym+OhtA7gJsbRViy39PVh3o5LjYA16Wel8
         FNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590758; x=1785195558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtiXK4/bXeU5qDCgDVLSvCs5UOCdMpk/YIwVsJirKJE=;
        b=DtYjdgl9YUchfLYzsU/46S7IggYFW6jdeIIRnq0rTWYOWtcFtxc4JBgxw1lxoTRM7S
         zon/7ZXTdqjxK/WaEluXdd1uuM07W9fmmbF9WA+f96ZZ8LVZGBaeFHI9yOCIfnjUN1fe
         eDIbDKevOUOn+B1zdKUgYiHi1ZL/2W8clo7wGiU0Gz9Iabb2Z1arREkblHd0GHa51QTg
         tRtpWox36Z+cv/9kanRiXgx/DUsGkU6lgIqHGtWHTGEdsoXxF2CtnaB2EY+/A6QDcUQe
         eogUb8/5hi6MjGnJ2ajhsGimePOz6helsjTKtOoNz/VKDkkSiVvqU+1W9WonAF4VrCWy
         IAKg==
X-Gm-Message-State: AOJu0YzojkXFRFU5W8tpkWMFZngy0CQLma07wTNVdutR62+c1yxGX0qO
	Ji+NbjW4yCpm0fES5LE7q2SNdzvL6fwhm68VFNpNV4EBuzBP6VG31RrBtw+arw==
X-Gm-Gg: AfdE7clgSwmNEMDxQLAN+xGXlBlOLRnGd8U/tD+DtkgP36o0wIE/X9NRmN3+cFtDVqd
	yrZHIGg3qnNFt298WYBOYc//92rjXc34FN2e6hdLzf1XDazwT8mvCw9B6/Z5ikMjlbmh4woMLgn
	bvpd1SU+ZlwuyJ0FFczhmx3yd1GeMo1VdWTbcjq3xl4lu+UfBokVOxAoIY1eClejaqfA1nMUtCf
	0RGx6DQfeKyTYjXIztBnXE2OdR/RuY5ZrEZkql9RwrVcwFFruU471qAFWEl5+inJ8I320jHwVDG
	Ax+y1IZ0OHBaPGRNP18He63hbRNepHaTObOU7Ry77U9iSZK+CSk0IwDF5yTJZMCxZ1STqeNaUNM
	gwm7BoFdaMQHK9fhkJ8/ZmrGGZVDgNh/Kcv4C36m9nREmxS+XFsu8SkG2jhfB6hvFM1DGkhvTPS
	nVkdB++a72ycBDN38=
X-Received: by 2002:a05:6a20:9143:b0:3c1:657:4c95 with SMTP id adf61e73a8af0-3c3ad7a3a04mr18912691637.15.1784590757908;
        Mon, 20 Jul 2026 16:39:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 21/30] apache2: upgrade 2.4.67 -> 2.4.68
Date: Tue, 21 Jul 2026 11:38:02 +1200
Message-ID: <20260720233811.2324493-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128322

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 23cdc4ca431e2512aa5fc3a0dafc3c2e8d264c99)

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.68

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index 082f533c85..dc8c0df12d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
+SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 

