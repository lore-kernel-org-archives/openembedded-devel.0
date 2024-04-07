Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE47CD1292
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 23:14:58 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.94326.1712531697180873567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 16:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuS8nUUH;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51d90def9eso18169066b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712531695; x=1713136495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1TzuPOzxRisPWgS+2RWZK7jc8RUts/z5anpAdEpEXw=;
        b=SuS8nUUHbmavVeuWZFpEJGQ2Rb53bXG+dbzR5mC4kHq9RVy+u9pTThFgcr2Y7HXDSg
         Gv8kjPjadhSC5J6iEbvgmiCJYo4EZ2iT/2X/IGSlTLZiT8KLUnV8K0BEHgj2yZXkTOiO
         r/55tTMRrNaRTi1sUpPVfZ2KFIVBiZX/acMUhmg++yTbm7E3yFJRrU7xJnGmUaAJyy+n
         6hXrOb5JLNQ55KlS2e1dXrY6JnNsICt4tr7Hvi/ejnRVVibQUiaCfPvIz/PsyZ2xfxul
         7z1x0gj7JkX/pnphr/VQS8EKPy6h/BE/blrG9Pw01OiNiTVrb+vhttMxgJdZ5W360QD9
         xhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712531695; x=1713136495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1TzuPOzxRisPWgS+2RWZK7jc8RUts/z5anpAdEpEXw=;
        b=q36MQaSP2phuBAVlJqX82SCiiyHegVi8faS0wvDUWzT8aGSzeLMqZbJ0sZIZfD9Kxx
         VkxQfjxdoWOWqB8E7z1udD1Mqi2k3fmz1szvOTAKvDPb3ZR3hOAEZlnI1YmuqV2PLGrF
         PuNNz2xNUnCLicxKvkgyVbdbvXEH97WtiionHZwBzAvVavubT/stJEXQ/tyMV952PVM3
         kREmwzskgGp6iQS/2eEm/nBQPOUVHPJv//K4W01ACXc4JZhXfvnqP5dUWRRVs3/IH7q0
         I8Om0WfBI/LnXnIUzLRMxPJ2FtM7GbWy46ybQYZtm9ub27ow7Fz6Zr6NDqAzq8roHawT
         cIRg==
X-Gm-Message-State: AOJu0YzwtlNZNlmtfQaY2zeLsJP/6QQrbBj7n/gLoJsa9Z5fsAZhyVJF
	fDHsK8/qEi+2XplYzNNXjAYo9yrBGT3IW3ltzzTYHf6xjTympEclalDbZKln9FU=
X-Google-Smtp-Source: AGHT+IEHBbR0rzW/vOMVz2CRoVtz2fnPT25J3uh7YBEpgZGAWoIJ7iNQDXorRGw1umFD9LCGKuNigg==
X-Received: by 2002:a17:906:3941:b0:a51:99ec:7062 with SMTP id g1-20020a170906394100b00a5199ec7062mr5229241eje.66.1712531694819;
        Sun, 07 Apr 2024 16:14:54 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm3736566ejc.12.2024.04.07.16.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:14:54 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 1/4] python3-casttube: upgrade 0.2.0 -> 0.2.1
Date: Sun,  7 Apr 2024 23:13:40 +0000
Message-Id: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 23:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109856

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-casttube_0.2.0.bb             | 13 -------------
 .../python/python3-casttube_0.2.1.bb             | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
deleted file mode 100644
index 64948d2e9..000000000
--- a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "YouTube Chromecast API"
-HOMEPAGE = "https://github.com/ur1katz/casttube"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "4bb24ba1639d16c8fa367537bf3b88a6"
-SRC_URI[sha256sum] = "f25b3c634efe702896233690f7590e8d6311590910f18dbb763b90419d9ef53c"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "\
-    python3-requests \
-"
diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb
new file mode 100644
index 000000000..af3daf016
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "YouTube Chromecast API"
+HOMEPAGE = "https://github.com/ur1katz/casttube"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3aafde5479a4102b867156e2527a34e"
+
+SRC_URI[sha256sum] = "54d2af8c7949aa9c5db87fb11ef0a478a5d3e7ac6d2d2ac8dd1711e3a516fc82"
+
+inherit pypi setuptools3
+
+FILES:${PN} += "\
+    /usr/LICENSE \
+"
+
+RDEPENDS:${PN} = "\
+    python3-requests \
+"
-- 
2.34.1


