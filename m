Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C208CD3443
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16081.1778066223896533283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DF76Ji3J;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso60696275e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066221; x=1778671021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnhjNPZUGOtyyfvhSgziAd84liXuuheKtoaC4EFkMzw=;
        b=DF76Ji3JeHIjsat6rKLGM9duUeK2269l+Ne4LLEF6slTwXQ+kJUGsPxq7R6MkEKL/R
         GOX92mU1Noi4J0A80zbbH/UxCbMFLKJiRkF1w2frsXxAimfRgNQnbdsulQm7JmYQ79BY
         BIUgq7+2RgQ4MkbSlHBkrVpxs3FhIgSRyFMCFSxtOxyoopm8ZKdY/CnbPpFAYwn6wXh9
         j9WbygU/aV2A20Rthnq5FEciytVNU2ZY2cu+Xz+6LUcTQM0il5dzYSP2N7poFkWFT5CF
         hf5yDhzl3jbYIKjLix4I5sAP5tffEwgV46BGU/ZRvdT53HUPREjfvvzCkm8JCc+up5Ul
         7E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066221; x=1778671021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnhjNPZUGOtyyfvhSgziAd84liXuuheKtoaC4EFkMzw=;
        b=U1/0cerdzvD1Ah/4DVcqcxei+bFbf/Zj0NXqSx+Asus78I8BL91V5KZX2PaeBm//TD
         38/eyo1FUs3N+BPthMeNJcHXKe4446npvMxL3XSxXMaidrA2EbYCk8jtnaF+WkzyU5Nk
         lyc8HE3NDx5qIVym5dyPujLWdceryz34zubXwHMOn9rMER2JjhSoFQRIdtIS88T/NMrZ
         qcUBIrFXo+ZkRW+d2B2Dy1K8Cjk3qFve//5+qtbUlU5l34fRkHbVuQwIn8/KthgZc8jw
         jdiWuJ5RsQ9cMGTDKBOjSndha6VAyHL3vwaMbVBxQw3DSWLfHZRGKbwM5C8Nd3109z9t
         WF5w==
X-Gm-Message-State: AOJu0Ywu3D9DDuczUFI50thiyAtjyKfywZxTeb1XHsVsqdXnqJ9GnagL
	JNSz1/HKxMLnc1G2sLkO+5QLlgFLBZdR476mWaJCdXClrHaDgNdRei+uKzK6dw==
X-Gm-Gg: AeBDiesTB1VbeW0qvLt3sQASAk52j301WNNxjSqQ/JDy9BpGss77/9L2WC0JZkUZjVI
	0/DqH4I0BQIbbT82smr3Fqqux5lEZvQtvsWdX9iNwzdtxex4ldxH8amzJpI/HS/sU5GLmyZ+NOY
	iAOGpDDuXXLvjIjMUIMbkL+mXX4Wr08T5dD0VLCKagUpvPa3WUD4/+ayu7yYh+IU92kw4NAuoXu
	ktKwzwcJ0KmSCuSC5BpRNt67wTwD1828DxwtKzCf6Tpruvd2m4YQpJxWRjRjvO1IQoJxBeW7y81
	pOG1HUn6gswFMrgsw3YhEL6fwpIuay0H4dnCtVSl/KbPxIzd7y9Cs3VndsRqMetu619XRAaF09f
	GAyXqIZzl5H7el5HPQzfJV+fCyYYeUKJxepEBz4j8Kb81e9jsvOFG5JL7X4CLI8ORmMX/9OoJDz
	cksrsSfJvcTw2GkebojPgFlHTUawisiI38zom00jUMOgdu5/n0PKNRmFLUhIIo/3brA58EZk3eC
	fj4DgC1RDNHdwYXL26/soCxwy+5eK4=
X-Received: by 2002:a05:600c:8485:b0:48d:364:e236 with SMTP id 5b1f17b1804b1-48e51f30493mr55085845e9.18.1778066221315;
        Wed, 06 May 2026 04:17:01 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:00 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 1/6] libyuv: add recipe
Date: Wed,  6 May 2026 12:15:47 +0100
Message-ID: <20260506111552.2782-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126798

The libyuv is an open source project that includes YUV scaling
and conversion functionality.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-multimedia/libyuv/libyuv.bb       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libyuv/libyuv.bb

diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
new file mode 100644
index 0000000000..bc897830a7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
@@ -0,0 +1,20 @@
+SUMMARY = "libyuv is an open source project that includes YUV scaling and conversion functionality"
+HOMEPAGE = "https://chromium.googlesource.com/libyuv/libyuv"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=464282cfb405b005b9637f11103a7325"
+
+SRC_URI = "git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=main"
+SRCREV = "5a17753597d77dee881d9d93097ca2c2079e9409"
+PV = "0.1+git"
+
+inherit cmake
+
+PACKAGECONFIG ??= "jpeg"
+PACKAGECONFIG[jpeg] = ",,libjpeg-turbo"
+
+EXTRA_OECMAKE += "-DUNIT_TEST=OFF"
+
+# QA Issue: -dev package libyuv-dev contains non-symlink .so '/usr/lib/libyuv.so' [dev-elf]
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
-- 
2.54.0


