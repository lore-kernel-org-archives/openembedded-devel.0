Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D981CCD184
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.7546.1759409973418899037
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IdRGatMm;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so193688266b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409972; x=1760014772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnI5JawQAIijxHraXX5QHUX3uQY1Z6GX9VeaAKocZt8=;
        b=IdRGatMmvq5cOTPTSnWBNObIJ3miQYOXJewPZm9ZOsVMXkbEMmGEerkbpt9IZDeg02
         Gu+BHvDrWV0HDmMpj0C8xF695K5DFttb8u6Ujl2x2BUQ+P+zAEQ1bea3rllcuGAg2m7r
         EjlsT5El7yDJOAuii2T8aMhCDwCXPad2yV0xPZg5/ZKd0biPM/zKhcBCwwz1+0w9DlBP
         e74qq16qJTJSbh0YsTgvGtrB5Dxg3A+y2wgcgidIzbcliOGwXHXA4oKfi06cuU17OCNa
         I2ikfWYbyEzFAB1b0drYliCeAsAQDANXeC5xw0jqit4vblJR7OIgJ97o+S0beADhMKDr
         qwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409972; x=1760014772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnI5JawQAIijxHraXX5QHUX3uQY1Z6GX9VeaAKocZt8=;
        b=btbatmykFFrsb4H+JGi2woCaPhesGzv1on1EmFrGl02WtNhUxy5FPCk8Y9bh7BbkfO
         ZayVwqdjdJBiK1SmehbKFjC5PfWMLrfZGMjpcNLLAmLp0eOkezcuwY0umW+kgDkOncv5
         4+dWZVYGfRziT7Pgmy1ao9YJpG+iQvfBQgVZq507xTef/scQXofTZEKVnybQVZf8JKM+
         4dfel8b8UfvKyoqfPDT00JY2h4kNq/26hGyNaLE7QvC378xalbQ7olECjS+6zhX8hIXJ
         iuj0iYB18arx6LWE7nGiW7+EprlkbZaChxRF4ulHxV4Mo3gFurK4xjxMDs0LJzoTFLhp
         CFdg==
X-Gm-Message-State: AOJu0Yytj+KooF5KdnRcsXrJiSwHBPfnLpHDxS+bRtatgQ27BLT5i5v1
	2sKNnvtRRthH01EKhVSYUAcn4fhRJQL8zCbG751DsiDAAxsZOWTQ9qoihV+mmw==
X-Gm-Gg: ASbGncuHgWrJCWNuHz/P8x3yPum8lmzUwVuSu1E3jUHH9fTQmEVUQ9O33xQkXIxBFC8
	zG3hDrLWPgoMRt6a9/2bJb7t0dln/LrBuN6QQWKAHppjRWFvAacHsXs62nULZ/y0EXruLzKc/ho
	Jn9u/ipMlQxF5u13hGi/bljMJJBhzv8MPbKpkN6EcHsmSV5bmQv4blAXBZvIVtiChMz1AQeIMsM
	9KpPrpzrbwRVasBMvTerrzBtlL/uQzowRv58x9ENUYXeengqTSi+Y5OJUm3yq/MJ8avgLx3J1YY
	lIl3FMDALvBDscsZb+6xRGONd8r9doBunjwtnEY5vgzXH891qDYoXzhfeRUmcM0W47ANj3/IDKU
	2ctnhPX2TuoeS82mnh1flkzH2d4OFJ8IZeuP4bOo2jLbMI0NfhFT0N8o=
X-Google-Smtp-Source: AGHT+IETbS6dL/Y8z3/yqVrtILECnrbxn0Bdhb9qo280+fcz/3pmGvKMTT2WialzzgGmaROJmUC3Aw==
X-Received: by 2002:a17:907:26c9:b0:b3c:82d5:2119 with SMTP id a640c23a62f3a-b46e4b8e6e9mr788571566b.6.1759409971655;
        Thu, 02 Oct 2025 05:59:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/26] libtinyxml: patch CVE-2021-42260
Date: Thu,  2 Oct 2025 14:59:05 +0200
Message-ID: <20251002125926.2624522-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120174

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/38db99c12e43d7d6e349403ce4d39a706708603d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 066cf35ae588ef5f81266b216624b95d37777661)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libtinyxml/CVE-2021-42260.patch           | 27 +++++++++++++++++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
new file mode 100644
index 0000000000..8fc623744c
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
@@ -0,0 +1,27 @@
+Description: In stamp always advance the pointer if *p= 0xef
+ .
+ The current implementation only advanced if 0xef is followed
+ by two non-zero bytes. In case of malformed input (0xef should be
+ the start byte of a three byte character) this leads to an infinite
+ loop. (CVE-2021-42260)
+Origin: https://sourceforge.net/p/tinyxml/git/merge-requests/1/
+
+CVE: CVE-2021-42260
+Upstream-Status: Inactive-Upstream [lastrelease: 2011]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/tinyxmlparser.cpp
++++ b/tinyxmlparser.cpp
+@@ -274,6 +274,12 @@ void TiXmlParsingData::Stamp( const char* now, TiXmlEncoding encoding )
+ 						else
+ 							{ p +=3; ++col; }	// A normal character.
+ 					}
++					else
++					{
++						// TIXML_UTF_LEAD_0 (239) is the start character of a 3 byte sequence, so
++						// there is something wrong here. Just advance the pointer to evade infinite loops
++						++p;
++					}
+ 				}
+ 				else
+ 				{
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 138df9f300..96c765299b 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -10,7 +10,9 @@ PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
-           file://entity-encoding.patch"
+           file://entity-encoding.patch \
+           file://CVE-2021-42260.patch \
+"
 SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 

