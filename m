Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2366CC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:09:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.11094.1699963790281460364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VYMKBDiU;
 spf=pass (domain: konsulko.com, ip: 209.85.167.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5099184f8a3so7532674e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 04:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699963788; x=1700568588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHcQHtnsfQ7mWf8lTBOSd3VxRlNQptKmhUT2A3ESjiE=;
        b=VYMKBDiUIXJ7nq7TUwe2kYhKCHX/lgT6q6vZicsPDPt6ww2QsYvYW43LX2GmoQw5aV
         zUVOP36E6dhJ+EQVPcaJvDNLxAmAPO5hdga1+BYtMcJNl6gd+iLGZ+1IDf+2Ai0acX9J
         BQ5K9pPSPPEvEtImCoAtev0W/P7HMtLiBtW5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963788; x=1700568588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHcQHtnsfQ7mWf8lTBOSd3VxRlNQptKmhUT2A3ESjiE=;
        b=CIz3eM3CvXOYAk4p09Hxbrvt19Jv36C8D+dCPjGumrFkkC9n8WKIOpNsfSBfB+HoM/
         zD5brhVsUyfhzyPAaWIWXAE2wZ9p99YGGDYQ/+Nx2UMG/rQpY3xg0712uHV6d/kCEa0V
         WXs+ZiLZqbk3gHbKQ+zSpNgmoP4caZBpChCIuDuKEbRyMAuY9RDotpntPVPQikrRXWLJ
         rPt0By6H6Y35qpEG8cenqld3IRFU0dakbi5IjqroX5p19yvQ8dA4SLVkKTpBjLhM1oGE
         3datet7OhwoL0ngi810uMcvNj96hHUwvNf382ogoF/6UXhEOtuMvNVecaRaONmaZKFcg
         6iig==
X-Gm-Message-State: AOJu0Yzl8R6RAZYVf4orwPKzli4EIWjs7kNzggqlHD5wij22tLyx02T7
	SOKzc9lb2a5rXm5MCPVv7MI8V1ZbOXwEgtMiBXk=
X-Google-Smtp-Source: AGHT+IFIPDT86lLeU8EFquSYr4dFvO3YX8cGnDr04XAPBF7NBLhY3w1M77z4OSuWXI03L58N5znhaQ==
X-Received: by 2002:a05:6512:468:b0:507:976d:89aa with SMTP id x8-20020a056512046800b00507976d89aamr5796947lfd.67.1699963787933;
        Tue, 14 Nov 2023 04:09:47 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c505000000b00532eba07773sm4946958edq.25.2023.11.14.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:09:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-polyline: upgrade 1.4.0 -> 2.0.1
Date: Tue, 14 Nov 2023 14:09:41 +0200
Message-Id: <20231114120944.3741068-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114120944.3741068-1-leon.anavi@konsulko.com>
References: <20231114120944.3741068-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106710

Upgrade to version 2.0.1:

- Relax setuptools version number

License-Update: Copyright years changed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-polyline_1.4.0.bb          | 26 -------------------
 .../python/python3-polyline_2.0.1.bb          | 25 ++++++++++++++++++
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb b/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
deleted file mode 100644
index 486e70c8f..000000000
--- a/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A Python implementation of Google's Encoded Polyline Algorithm Format"
-HOMEPAGE = "https://pypi.org/project/polyline/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fbd13500cabd06dd751ba6b2be304c6"
-
-SRC_URI[md5sum] = "b97c57378605c4a856c437569f95a0cb"
-SRC_URI[sha256sum] = "7c7f89d09a09c7b6161bdbfb4fd304b186fc7a2060fa4f31cb3f61c646a5c074"
-
-inherit pypi setuptools3 ptest
-
-RDEPENDS:${PN} += "python3-six"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
new file mode 100644
index 000000000..2eae0caf9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A Python implementation of Google's Encoded Polyline Algorithm Format"
+HOMEPAGE = "https://github.com/frederickjansen/polyline"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
+
+SRC_URI[sha256sum] = "74cb5cea098dddf09d1a5a1f17af9184d371cbf3e9723de0194e530ec39ca1f6"
+
+inherit pypi python_setuptools_build_meta ptest
+
+RDEPENDS:${PN} += "python3-six"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/test
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/test/
+}
-- 
2.39.2


