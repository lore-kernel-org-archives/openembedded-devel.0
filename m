Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C3BC5AC67
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 18:17:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26379.1786040258433588664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 11:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CAZOSi3P;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f84023916so2284843f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786040257; x=1786645057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/omK2X11UYq7HVHyekYdku9g8pUApplWUBR/aM0nww=;
        b=CAZOSi3POsknYGCblIae9i8LverQ+lmuwsjKq+oAVo68ca0f0E3IwOSPv6zRY2FaHf
         0zIqZpmNKdWXwMookqcB9w5NrKEM3JrGvTEClWwhP+t8PQY6wfzsPWq9/NRcqZhJIGkI
         S1XOpitqRVub+IQLeMWHabv+Kr1qqyYck59wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040257; x=1786645057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/omK2X11UYq7HVHyekYdku9g8pUApplWUBR/aM0nww=;
        b=qAoSY/iCP7xdkauHf3yb7dxtRnD2Xa1shPCEm9U59KXV6gDHBqTrsprwVwFjmWMdW4
         6xYP5V9xTzYK8X37Qgz3E7Nmol3Y5nE+WspgLHsbiMxsh2CjG645O2zt1I7Htl/mmdsh
         Rqv0+V3vSqONXagmt3qc3kwfXAIDXKRUzOanYvWcX4V/D5XwJJTGR0WDv0mJxh/gZ3Nc
         F6EM/6BZqcpQntRioil3J7xi75X6WRhzesMlp84f3nTXCJaUleLEXJS4zte16LduzJ2H
         BkPrUwoO8maufCgEsUy0SW9ZcRY/D5IZLsziukbgtM64/8+H5agark1zNXCdowHrDWpM
         MnLg==
X-Gm-Message-State: AOJu0Yy7zIzJTCpdG6Q/HZ4+pHNg47ayu60mYPkT4Bay1jNKv6/xySdj
	8FXlDoxQ628b33/oYd8tCiIDK2kJmOKzOBRRfdlHEV6SMY4YcWBVPqCvUpZ/GZs5vsIuhnUAxwo
	XO+uD
X-Gm-Gg: AR+sD110eqG+iioHNvJUMAaAgLJh+zcBP6R6gp2AMcVZhuppgrBuYVDmIfC7QRHa4Gr
	fYQfmtMolJn2L5JFCbQ9F96cxDcfsH+Txn+VhkdgYRk9ZkvX7U2ukumQYAXfXBYz0twKuUGApW6
	j5gbnLu2nbLmzD+pwNBNWWXJF47Xo3WRsKCI7dlmrchPfA/lTLgcbKP22nwfj3PUi/MLQcr2ZJW
	D6Hw0WtSzcamc+M0oxf3LUDE6sJJvIgWmhJIECsyuf4CqpoMXo3WMaRRiaSa/4+h1BxwfguUR3A
	52V+xFrOE17HnnXMU5ahFxPcm7nR5KQEliwD+aEoR5GmFgoAZAaWbxytodJLA8W7S3pNntZ72if
	nPUJ9vfNG5K8Vi843InXedQ3nrpAwpK6YVG61vJe1hzRcE1rKGSrcdDpJ6nk+5G+oln456lCX6G
	ooyfGFIXh56+/nBalyYFDaKIpkAIoyiV9XCfM75ZzVtE5V7kfumfHPk94V0PoTe0wHt6PbOasXk
	l3aCKyqgJaH7mdt/d1XZOb7JKKt/zAPqBDAocHYpIxsBBAn5MUrMCpQ9j95m9p+b24eG5NyfqIa
	GNzLO7KjyzJF7Q==
X-Received: by 2002:a05:6000:2309:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-47fec62e979mr26036379f8f.25.1786040256591;
        Thu, 06 Aug 2026 11:17:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b26879sm7918748f8f.30.2026.08.06.11.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:17:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] exempi: Add recipe
Date: Thu,  6 Aug 2026 21:17:33 +0300
Message-ID: <20260806181733.955051-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 18:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128850

Add recipe for exempi, an implementation of XMP based on Adobe XMP
SDK and released under a BSD-style license like Adobe's.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/exempi/exempi_2.6.6.bb    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/exempi/exempi_2.6.6.bb

diff --git a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
new file mode 100644
index 0000000000..887863dea0
--- /dev/null
+++ b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
@@ -0,0 +1,22 @@
+SUMMARY = "An implementation of XMP"
+DESCRIPTION = "An implementation of XMP based on Adobe XMP SDK\
+and released under a BSD-style license like Adobe's."
+HOMEPAGE = "https://libopenraw.freedesktop.org/exempi/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4"
+
+SRC_URI = "https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"
+
+inherit autotools pkgconfig
+
+DEPENDS = "expat zlib"
+
+EXTRA_OECONF = "--disable-samples --disable-unittest"
+
+PACKAGES =+ "${PN}-bin"
+FILES:${PN}-bin = "${bindir}/exempi"
+FILES:${PN} = "${libdir}/lib*${SOLIBS}"
+FILES:${PN}-dev += "${libdir}/lib*${SOLIBSDEV} ${libdir}/pkgconfig ${includedir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


