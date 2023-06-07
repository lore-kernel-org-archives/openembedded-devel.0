Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE64C7EE43
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:55:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2662.1686120954455207923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=p4B2Ayk7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso1780365e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686120952; x=1688712952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZA51+vXwYl5va1tR2A6UXUHS+ctOXoOp30fizTYeuQ=;
        b=p4B2Ayk7tLylByN03XQvS+rtDZd7i+iKwPhD6h14GUAOqEraxkzoN+fp8RhaUUPgx+
         XcQUWOYO9Q8PR1sn9ees3YRIFkNtCozA4FI9SP+y7mJlQsY+EkNMr1H3+u3lnKiQhCwS
         lyk+2fbBQyYuo1AQ6uCy3B7a8+TICx9NWotU7ZWCzB4+DxneS8P4qvwR5qb07x8+iKRc
         J01fhExfeyX3tlq8tb8LNWIZufLfz3U9uXG0wi6G/iEPWiCP1M1MLvA7RAmogmV30nnF
         LCooupIfDSmh5xKiBOSzBJJGGWr3mAMAqFjKgdWATsxXuRg6TyXlBhrf1Y0nsaTOhDRC
         RYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120952; x=1688712952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZA51+vXwYl5va1tR2A6UXUHS+ctOXoOp30fizTYeuQ=;
        b=AG8OlOywvjMv0ZN3wPtZr0ZU17G2olLUwFw11/bj3meUzel/FxpyKfRyPx8iC2c5d4
         vjmArvzehlY4lpNAI1NphOLmL9CJVpaE//N3kQBKwpKSj/mRpEJiLf/k715lc1pBIbDK
         ks1gOdskm3e+SFjjNXCi/TESUGelmg3CfDJT0Dm0L9sRY//uuflnu5Q644vrcHD+XOEP
         UAcE3ggLdbsDx4OEAKe4EILGtgwv6a+WHxtt2N0kDFkBo94W/4Y7rHubOvoiAgzSYA/j
         E3YX4Her4IrLGLD/G4gpwpnCg+itovrhKeQ7IED5cDKoB56j+0c1Ag0M9y/vFGHH4qWf
         G2Ww==
X-Gm-Message-State: AC+VfDyDlSQK+e4aR98YmKlut1Hsr3Jv5eZn+Z0T0IW/kXujg3giB7jy
	VRMpb6sJiRxcZ7wq3pqUCGqCv66cwTQ=
X-Google-Smtp-Source: ACHHUZ4hYqYk8alOnLVQAoB4fLXFHqM5u9i6egXgBDe4jYRSUiI1OK4yNrqCKbXzPvyW0Z+oMHSUTQ==
X-Received: by 2002:a7b:cd0d:0:b0:3f6:1ac:5feb with SMTP id f13-20020a7bcd0d000000b003f601ac5febmr3483691wmj.16.1686120952333;
        Tue, 06 Jun 2023 23:55:52 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n18-20020a1c7212000000b003f60482024fsm1050274wmc.30.2023.06.06.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 23:55:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-meson-python: New recipe
Date: Wed,  7 Jun 2023 08:55:46 +0200
Message-Id: <20230607065547.128661-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103162

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


