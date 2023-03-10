Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90107C6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:39:09 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.19120.1678455548324064038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZCYf5mFI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id cy23so20429963edb.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678455546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6RgbRmdhzhGOCYemeLUEPUNf3rFi02F+jwJ9G09JKI=;
        b=ZCYf5mFIVnzRuweOpLZHjeUwWdijhwdgtbfkVGpc7xmMp9RvILdwRGmZrKf1MSXGHW
         C3xrc4GsCWjVxZHYJa2YQJr1eFKHWY4zhXTspb2sTpd+dLz08/sB6FxBDaqewN727cyG
         nABz1QsVMho8GyNxgUuw5okWtvl1JOlVpyUzD/r5dEh5d2JrOI6HYQATyG+PoqUIRlLV
         8TcipHfbATJTS2fwnShVHH1Q4UKoT/mpCb4sJcVz6l+WJn8qUJYQ4nc1lsy75/7EQDPA
         CAT+HcrefK0O9udP7pke0UVtBTflvoyUZmzznEvz5IgWe1OgTOTCQ1THQjDDjkDn+Fgg
         V4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6RgbRmdhzhGOCYemeLUEPUNf3rFi02F+jwJ9G09JKI=;
        b=4bl01jQuMzhADegRx4RhikSR3vUeUx856LsHkU0GB221CBt5kfGZ+lA4ZxfwqEBr8B
         K0L6hT58xVINOHyZirMrEZKwqBRBTaqtLcf8zpTZubvjBRM6/bXPlcP+w+wzwaajzO6P
         HkeSV1bR838Ac8eMIgGLt3D7KOmxvuOMTNrgyUuAH5QV1TM5wee/1iZwQ//uxwndzDKm
         SgkGK1LpUMIehd3g9OfOq7aWSjziMSW9n/OhSxO2D2q6Hy4RSlDnlvIFQQ0eMROLkFq7
         FMvc2tlwVU4egvlKHGulfd8xCNWfbcAtR8YTRtDptMDLzZLevPPTEoYVSgR3j/QBPa+S
         FDEw==
X-Gm-Message-State: AO0yUKW/or42OBWsgopkFg4dMKzkTDJe+vgeNAwxLCRq55y1dZUcmi2A
	xLfjKj/ezxzvUVVMY5QDCrwWY0tAsIyRQg==
X-Google-Smtp-Source: AK7set91eRwkJf8EK3HC/CRm+hGix9EU2n6CmTQwMYGryk1lGCmtAe+lEA+NXZbjOojNI+5yx5WRdg==
X-Received: by 2002:a50:fb83:0:b0:4af:63a8:61d8 with SMTP id e3-20020a50fb83000000b004af63a861d8mr19229364edq.12.1678455546557;
        Fri, 10 Mar 2023 05:39:06 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004c041723816sm20562edi.89.2023.03.10.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:39:06 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-scikit-build: New recipe
Date: Fri, 10 Mar 2023 14:38:59 +0100
Message-Id: <20230310133901.4144306-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 13:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101486

Used by python3-cmake and python3-ninja.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-scikit-build_0.16.7.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
new file mode 100644
index 000000000..7eacd936b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
+LICENSE = "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+PYPI_PACKAGE = "scikit-build"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
+
+RDEPENDS:${PN} = " \
+	python3-distro \
+	python3-packaging \
+	python3-setuptools \
+	python3-typing-extensions \
+	python3-wheel \
+	cmake \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


