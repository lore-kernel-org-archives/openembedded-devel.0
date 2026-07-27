Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A88FC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:20:59 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27766.1785147650937995767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B14O3Z7d;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so29189575ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785147650; x=1785752450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP14koBenzxF4+0nwVGftnxBDt7FgvazK2ddrgUpkGs=;
        b=B14O3Z7dszeUWiR9Zjev2bZgfrHTOY/n3uxIIrmoPa+DM9lr6HHbXuzRJ8pVIyGSie
         eiJ6BUCZnjVxbnEv9gttq+7MY5pumdz/91doDuiVLfCXZ9kLlaetP+lyunlncP0SvAAt
         cxegqCF4HZVNngrbTV29sgZhJi4HlrBXqHMXWLEzp4+CCVMTJKxXuF4I66Wi/+C2PN33
         EDbll9US67ndbSOSvHITxqYuS6+IOHuyXwpuucwI/zy8n08M4puNnBPdnbaE4MEifbFg
         6vd2DPPgqhdnOaCRhN1Toa2+sDxeQPJ3DAjpYTNGkfHLZ7oljK/nLIvrYY3e9hqzpxKS
         rsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147650; x=1785752450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP14koBenzxF4+0nwVGftnxBDt7FgvazK2ddrgUpkGs=;
        b=pAKbQecUP71B0ijEyI/UJ0bvyaEcVCzOA+wY5E8Aqc1kk2E5gqWSVNS0kC9J7kEY7n
         j73Kd9xS/TA16PHoUq4AX9dDGsBkMFtaeZiE/GRFCstGv1W2BpvnkeuMfI9+wVneie63
         3FmWnJ9+9wHu8t+dEtmqJC+50YwvCGJcWThNCygaKwTn9pgtp2SQBY/wFkYrOp05P4W7
         jesUCoo20OeYNAPOTJUmbbVHqfCu0KlhP0iGEwl0xO8aj/e+hjPbgaSk+2KKL5Oyiqcb
         HHWxmhEF96R8kHbVRSm9S3xH0JFrtaHeBLQMeGl0W54Nlzd0V9z0O2ln3jUW2BiWWrpm
         eDkA==
X-Gm-Message-State: AOJu0YzRYe9bvqP5Np5vjfehTIb+gGGZUvavAw9RXDd07l3FO875nikZ
	H3+O5TSEw/rcfdYvqkNv+c+mOf9d3K/tlGLisBh5stf0IhQK1YfFjdfNWY6zWg==
X-Gm-Gg: AR+sD10nUMq2xrPyvQkbDtmPV0fvoEypeuVnFDQ1l7U7mNzbZ1rjl37BP6tDTHKDo+2
	ZPevnIL76W4sZxg1YyeJ7OD+RUHOBffDwlQnj7+fRPx9JuCCVov8355UmwAe50ckmtbk8NtgD0j
	iUvI6/wb0QECRX2+TiVVxyT/xZBj1InclsKG3dVIPsiPrh2BKaRGGlz4UbB88ynPE6WrVJUPK+G
	3WkzY5+v2leDrF4bOCKYKnXGxslDsQqSuJTI4YRmVXo4y26jRNFBWAyOR5XEs+1o8Vfk8g3UUqg
	dvunS0r/3Os92uClu/j+136Zp6UdqosR3J3vzHqi3yzBYtdUb+jCGNMnjLM93pk6HKzIGY6sGL7
	gf8hKwJnsPRSNxKCzeDkwwdhFYUnmF/HUjQn+cH9jj+EdouKvBcYU/P3Kwl2sPBozqBPvCiWAOQ
	yc4xW64YjCPeqj4pI=
X-Received: by 2002:a17:902:d2c8:b0:2ca:e0ff:e696 with SMTP id d9443c01a7336-2cfde78b881mr72028385ad.9.1785147650185;
        Mon, 27 Jul 2026 03:20:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm32511885ad.27.2026.07.27.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:20:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] libxmp: upgrade 4.7.1 -> 4.7.2
Date: Mon, 27 Jul 2026 22:20:43 +1200
Message-ID: <20260727102043.3796387-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 10:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128461

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changes:
- Fix loading Startrekker modules from memory/handle/callbacks.
- Fix cmake build failure for certain Apple targets (e.g. tvOS.)
- Fix stb-vorbis floor1 inverse_db_table indexing (missing part
  of CVE-2019-13220 fix.)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmp/{libxmp_4.7.1.bb => libxmp_4.7.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.1.bb => libxmp_4.7.2.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
index 4e87ee275f..02fb8ee9d8 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "12f76e4bf1dd6765e3bf46cbc1ff35c4a4551671"
+SRCREV = "a13276d27feabcf9ee4f982913f718ee05a65cb7"
 

