Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34503C7EE43
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 12:29:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7735.1686227376729585034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 05:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sD4KjF4x;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so581733f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686227375; x=1688819375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZA51+vXwYl5va1tR2A6UXUHS+ctOXoOp30fizTYeuQ=;
        b=sD4KjF4xTMf6/t3auaNVPvyl8zto05swRtx/Ad216lkk7aegss4IvBlUtcUjshhx6M
         ePebJV7wylo2UUfgHEPTC0Yc9sZcIqmANuPBzCS3e6Tjx86/D5pjQV7sJL7dKmmiRDSr
         5w9Uj4J5NHZ+h54wnjeOWV/ly9/OkNu7ftlM9p4ILlMXQSe+VgD9L7hxLggRvc7C9tIU
         Vq32hb72QO7hMng5m9OHYV+yfGZsJ8VUrX2faVMucYZR1NXbQ7qhRGvCURFk3X5BkTCm
         coBQwdLjQFkhjHpCRdoFFehRB3vI5Xdv4K0wP7TskvTfbfhSr0Q11+sXCfPLNbksH+jh
         4Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686227375; x=1688819375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZA51+vXwYl5va1tR2A6UXUHS+ctOXoOp30fizTYeuQ=;
        b=AmsgmWiaFLSbLoZo6/dJjisB3SQmw46DVj0taDqcurVAJNCYHudQFPg3eTZKAbRBL9
         WVCBnjn7LHHb5J2YdVsOhBmtXJ4PoWcsE3JMZ18htZpGYcvFlil/CjfB79lIlz/CRQlw
         /eAwB1eEOe1LmOSa4xuF9fZiHvqh16jaZnsLtR6ml6x92OXVO0zNDZPGDjDLlbrX7PJv
         aDYOl79gxT6vmqONX8KsxfkE96HYoYLqxR0MhlOoS/ux6cCrYlRuu9BoXC9Xp3Oi5J2n
         Xis1mBh7f6arVUGGhapUjRAKfd7W791MB4hujMBMt0SsZ0AH7d3v8CuuZZdayBSFX7VT
         idVw==
X-Gm-Message-State: AC+VfDw5CJxPXHjJrnUEmBz8BG/H5e7mhMl0AMCAC/XO+JprcUw5q414
	bgI//U1srGhbB3LKikUnOg0XXfx+xVU=
X-Google-Smtp-Source: ACHHUZ5Ha0z1bmygQyMmpjaUgp799sbsRDz+XiSzxMawFICkNhQHmyuFaVJNzj2ceg4DadiQnVJRIQ==
X-Received: by 2002:a5d:464c:0:b0:30d:779a:111d with SMTP id j12-20020a5d464c000000b0030d779a111dmr7335862wrs.17.1686227374661;
        Thu, 08 Jun 2023 05:29:34 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d43c5000000b0030abe7c36b1sm1445798wrr.93.2023.06.08.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:29:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 1/2] python3-meson-python: New recipe
Date: Thu,  8 Jun 2023 14:29:25 +0200
Message-Id: <20230608122926.1447252-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 12:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103188

This python module adds support for a new PEP517 build backend
used by recent versions of scikit-image, scipy and others.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-meson-python_0.13.1.bb     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb
new file mode 100644
index 000000000..6b9ff24f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+HOMEPAGE = "https://github.com/mesonbuild/meson-python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson ninja patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


