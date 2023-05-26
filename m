Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D8FC77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 20:24:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3984.1685132654251128918
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 13:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=2rDaQ7Pt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so8564395e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685132652; x=1687724652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3b+h/GgdTAwEkXwGMpD00Z2JLb3RaJcn1TAZhqrEmQ=;
        b=2rDaQ7PtqdS1bZdvJuq8c4WX6z1kZDhOqp7FuW/Icl/zR9aU2azlcRw6ksoByc1ffc
         BbVULASCZtbujFTvqKMYTZ7Axro/RkixGP7nkwce96Swm18eqteE4oYUOEu76TCWsUxW
         Nf/J3kCc/u7/exSv6fYwm6Sr6qmqSgZVP2dmDIsZZP4DhM7BQ1Sj98L7dNkkwtsrgCiy
         6OmTzEGwwcxK/oyAy8lrcBgH7hh44CueiKWj7aXF8ioU6C9Ow10dkMbcl7cPlXfsWB9O
         R/mxlSopZ1NfQIsReHE2y5iIpwCXEUaklIe0QmF75lII7C0Cjl1kxj/wcXk071VGRXZJ
         kQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685132652; x=1687724652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3b+h/GgdTAwEkXwGMpD00Z2JLb3RaJcn1TAZhqrEmQ=;
        b=MB6GJZ2TXDEED/v5cvK2GmYEwCCJA9t6HtLH5hf+QCwHVxwrXdamwjJgON4PgHaNqB
         pNNBu0fOjLbQmE8/RpC1OGubvszwmXaC3dlMmj7HYnuKN0jRjsf3kHyFcgDU5DHPs6dV
         nGEGaKOlkzLHB9fQiQJV2IWWNYRJjculi9TSEFZ0xXIwFxyOMYNtOkXI8061BiY4ZqMT
         HuVzaUg6aI9oRsWFLzm2gHfNiuPwGxKBb3H/yukCC18rBUCoF5FaP33BYjHzxFC8fEZN
         knRBLQf++SXu0Ot8iLPxNlF4tW8e0OnvXKk9xATqvT/ayx87ACvMteMjTxKuX7N8rOcn
         1DNw==
X-Gm-Message-State: AC+VfDwttntc6lSHO5E3FWRjHgHeW2GqhERFNCzon2CT7zoJOL44bk0w
	JmVaAvIxsoURxPt8jIZwLbxjyg==
X-Google-Smtp-Source: ACHHUZ4vpocAPUrDnGsiXeefEJe/IMzjz+OZyvkhhZCyudvqO0bIW4Q6T5f7GVFJiDx+mRTJJJ7O8Q==
X-Received: by 2002:a7b:ca54:0:b0:3f4:e4f5:1f63 with SMTP id m20-20020a7bca54000000b003f4e4f51f63mr1942724wml.41.1685132652527;
        Fri, 26 May 2023 13:24:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6afe:9c96:4503:ff6b])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d4385000000b003062b57ffd1sm5989222wrq.50.2023.05.26.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 13:24:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] snagboot: new recipe
Date: Fri, 26 May 2023 22:24:09 +0200
Message-Id: <20230526202409.74712-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 20:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102873

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe that builds snagrecover and snagflash. These tools are
useful for yocto-based distros used to control DUTs in board farms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-support/snagboot/snagboot_1.0.bb    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/snagboot/snagboot_1.0.bb

diff --git a/meta-oe/recipes-support/snagboot/snagboot_1.0.bb b/meta-oe/recipes-support/snagboot/snagboot_1.0.bb
new file mode 100644
index 000000000..1500353ae
--- /dev/null
+++ b/meta-oe/recipes-support/snagboot/snagboot_1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific tools used to recover and/or reflash embedded platforms."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI[sha256sum] = "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272e9dda6f868ee8715"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    bash \
+    python3-fcntl \
+    python3-pyusb \
+    python3-pyyaml \
+    python3-setuptools \
+    python3-six \
+"
-- 
2.39.2


