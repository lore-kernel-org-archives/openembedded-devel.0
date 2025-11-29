Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CB4CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 18:27:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.403.1764440843162472377
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Nov 2025 10:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWZPb4kM;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso29141815e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764440841; x=1765045641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJOT6UPiFrMU5Zf2E4OPKRu+IcN+NREHvNoU9gvsOgc=;
        b=TWZPb4kM1V1SI1nRz7Bxl39vJBZrBTY4ASLysS/B1FcGoPCO+UAWwH9vsnu1pkEHUH
         1AsD7CK6cbljY5YHmixOLk3nMZKBi6LTn93UaC/U18XN/iPU5Bnttzsopgy2cDw1tn59
         GoB/rqgoMZXpyCHIxqXhbZLkhq6hngG6cuKEjj+d8GVISQciUyHIME5W3qpxBoc/Tyve
         4uS18RqmL0mY6N3hrtgnpLrZMeNiWnxhpH0HBLcE710Z7VrZHZrfAvow82OOwcGInGRC
         uIxsFFt1Qv1RKhbjb8o+Dbz+vH4EH3HexldiqnxPf7cE4tXS0iXa0at8I36RDGxhtCOg
         2zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764440841; x=1765045641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJOT6UPiFrMU5Zf2E4OPKRu+IcN+NREHvNoU9gvsOgc=;
        b=Kk2bR4xfTSam+FeAI4V7mydvQMD+VkKvM/Cnf24awbUqSvI/b/pOzsm/uqrKXXxRsw
         se+HOSolXjjjT73NPAJzhOu7jRU2XkTNC/7VF6t7CvuKt1PlerPAtJ96QTFm3BswYjIX
         DnxLc99r3P6J2aE6DRHoWNnLWNkD3O9FTbrWxQonTm6qfNGD4d2seo8sXJa7iP7aauyL
         Zk6wjZP21b6k3+CBSCj7rSiy2l9pYaiTJGgirJ46TxHVxs/+FM77DUMJZrkithZ4IrvG
         0AuNgdrBeHDJ2+tj/N4sFnXDuHXaEgeXWRkybGtOs+ykF3l5OUdiCSYTytUgJEm5dzFR
         13Gg==
X-Gm-Message-State: AOJu0YwkjFuRGIlluXQnqKj7fKGYz5OS64fDz2wHLRlAvoBAn3n2MXOv
	pP/GHZarq18+Q9jsIMC0CWcUqM8HlH11FICb7zoPPBUrhslE1o6LwAAPrFUOm1vc
X-Gm-Gg: ASbGncvQNnZ5d5Skc3PXvGcViw0NNaq5ywgtWsbgXSxwSzKtPj9l+Np+/CXRUavk9s/
	1GmaJXzaCaN1IdI5AgUK5FMbbMVTPVpT6rI4PRNiIzHCUWM0yUAM1QgJgm409qj81JJU0QwammG
	rcQ3/b2sosJkRxkQpJI+OpJU3ob9QMFXO5Cy0lj1EMdO9fRTwTBNbYUv9sMibYEUX/QK4QIyrtq
	6eZ+UsniVMerAK/+HwGZeh2eE/cUtoOblBUtnY/ygttSAvlYwOjpVVHvX0UmtY7mXPum4YjAUYs
	T68smJd4/IpbUVOQyqsdqoZV6WoQE0jcI8k8xU4JUE+c/NkoWnGyvmdH3+qEO7niJtNQulvE6J5
	QN3qUOQ8b1UHlWP/U1q0mTmbC9RgMagIrDeY6yLfV7PoS6o6GfbjHJJo+f5VfDz3VF00RIjQHC8
	TMN3XSCzTEeUVgVAX4Yl7dI6plklm6ouZX+FGSzk1AhooJNIoQvQVTBMuJIzw/RsYMUPSVvUzD+
	mwTwQSZ3Lx7w244maA910RxlxM3XXBCxjsRiQxHNiDdYafGgfJCoU+6EQ2WFjIrJ37OFY9G
X-Google-Smtp-Source: AGHT+IHR5YMOHElSnhastgpoHOGqg7MTHbpgMDfiROukdZ0NmgydWLvcc1fatgDHt1D2+fadsKIh+A==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477c11325c2mr348086115e9.31.1764440841084;
        Sat, 29 Nov 2025 10:27:21 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-360d-8737-6ace-ce95.ip6.access.telenet.be. [2a02:1812:512:2c00:360d:8737:6ace:ce95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bbbsm223547325e9.3.2025.11.29.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:27:20 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rob.Woolley@windriver.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-annotated-doc: new recipe version 0.0.4
Date: Sat, 29 Nov 2025 19:27:08 +0100
Message-ID: <20251129182709.459094-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122158

no tests are part of the pypi package

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-annotated-doc_0.0.4.bb          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb
new file mode 100644
index 0000000000..10d567d46c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Document parameters, class attributes, return types, and variables inline, with Annotated."
+HOMEPAGE = "https://github.com/fastapi/annotated-doc"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e36e91f278975b8bb76a769f32582892"
+
+SRC_URI[sha256sum] = "fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4"
+
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+inherit pypi python_pdm
+
+PYPI_PACKAGE = "annotated_doc"
+
+RDEPENDS:${PN} += "python3-compression"
-- 
2.47.3


