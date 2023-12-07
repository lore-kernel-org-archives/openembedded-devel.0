Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFA2C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 08:00:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.78650.1701936038295093874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 00:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lLcDUQWo;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c09b021daso8629425e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 00:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701936036; x=1702540836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOCd346E8WCLuHNJRxSKhRB6HLNJqlBjhsZqqlES/zU=;
        b=lLcDUQWoP3LOrpJaX7X8brr188LQOCmYDfotTlxGfvKe1dHGrOabA09ymfoq7mNQzP
         NJZFBlf1TDJ557ZzJoFpCqxji85IcX53MHd+wmNCPE6o5BOi1mxwsz4ggULLg166CXGq
         ycsSR55xYwvppG7aFmTNyoOSUhHKFBOLj2hmmgD2kzKdEM2y1tcWWLEXy2mPZj2JCveW
         f7UNkZaW6tSdpDB0EhwBWgVegKpH405VENzVqO8FFJ/8Vhy55Z+OSY75DxAigibrHOII
         mZdXr7CN4luLZgB0lP6tJ8IzUw33MIHNjQ9U6YE6UIaK2S8M+Aj43gWBPU3SwF9XtXpF
         9VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701936036; x=1702540836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOCd346E8WCLuHNJRxSKhRB6HLNJqlBjhsZqqlES/zU=;
        b=BnJQ/RWCSfedG1S2UA0R3ctq5GASwOg0c9uScHG0UnhvnNhyPdYwwQ4qJGBNYP32UU
         OOJDUooKS5Pw6HroZ7W946ZKWU6dd8tIKl1wRD+V1Q1XrRdRuJKdITxWMIFGNWBI01RF
         Wn42URdCBuBrvmV0pY74dANkfiXmkoKF1zPIBfMLMAbbwG2TVCYqNSupM1C2PNYnAowX
         6aP1FSZolSyVzsUGxM7YmyPxGVYBMO//qfaRj5C1nz6Aq0fybdoVzkwEPpV02PFsYGkJ
         95YLMjIi+WQzg7udWqR7qBFLkQx8AzVglWdd3ch/g4dre9StJ+WEO+nHh8lxHsMH3W4N
         T2eg==
X-Gm-Message-State: AOJu0YwuibPTVJai8WGvxMaZ+aU8jMuqPuYIahAEVrvAbFqqHR4S+Vgn
	cB3ScyKAn+0T+aLJIbwAFdLMz0dZ9fLVVw==
X-Google-Smtp-Source: AGHT+IEZ+FDToY84j3zETatqPXlLr2w0Z09paku9cgfvYH886XH81a5m/znFhSrCK5rDjlmVv40ZtQ==
X-Received: by 2002:a05:600c:2111:b0:40c:1c6a:796d with SMTP id u17-20020a05600c211100b0040c1c6a796dmr1065703wml.158.1701936036007;
        Thu, 07 Dec 2023 00:00:36 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm1086315wmb.9.2023.12.07.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:00:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] xorg-sgml-doctools: update summary depends and inc file
Date: Thu,  7 Dec 2023 11:00:21 +0300
Message-Id: <20231207080021.48450-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 08:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107273

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc    | 9 +++++----
 .../recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb | 5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
index aa4795edc..042db48ac 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
@@ -3,10 +3,11 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/docs"
 LICENSE = "MIT"
 
-SRC_URI = "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.bz2"
+DEPENDS = "util-macros-native"
 
-S = "${WORKDIR}/${BPN}-${PV}"
-
-INC_PR = "r1"
+SRC_URI_EXT = "bz2"
+SRC_URI = "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.${SRC_URI_EXT}"
 
 inherit autotools pkgconfig
+
+
diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
index 050cb2982..21a0ed74f 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
@@ -1,10 +1,11 @@
 require xorg-doc-common.inc
+
 PE = "1"
 
-DEPENDS += "util-macros"
+SUMMARY = "SGML entities and XML/CSS stylesheets used in X.Org docs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
 
 SRC_URI[sha256sum] = "65a9fdddedc17bd5e9c0b00d904960f03f047c3a62de5458989d493c29fec806"
 
-FILES:${PN} += " /usr/share/sgml/X11"
+FILES:${PN} += "${datadir}/sgml/X11"
-- 
2.25.1


