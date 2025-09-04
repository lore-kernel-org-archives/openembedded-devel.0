Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A21CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:27:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.35855.1756981676693145748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyQy0zv3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so5607985e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981674; x=1757586474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ+dqLplbXMhCYndYTSpFQ5ZNwYrRX734CiQEQJ+Rr8=;
        b=TyQy0zv3/RbSKxIYZtlj9aCO8aSfs5R+xOK1S6laL6kyWdxxwoSCTsqJZOc30M6HXp
         67hcUG5NAkgM0V1eI2GIc8qRz8P+PuX7n8/Cb4ZmFxRFyNTMcJ/BRbXHHIffPSOGij4M
         hWMQhAUBJeS8zR8P2rXXlnZPXdR620S4VGes1GJFWoC0yx3E5HJyh6C4wMKaDR5XaF/T
         8kWvS7iNZ43mfoRH9UJTTNcKrWaZRmiZ/hjyKFgY//01MeiACdxKnHdLy4fwePyAqNb+
         Qj6OjkygxE6E+upJAj8kCmJN9GkTrk+uGeSPAv39BEHI6h7UUsDYPAAqBNC2iIuxDvFr
         4p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981674; x=1757586474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ+dqLplbXMhCYndYTSpFQ5ZNwYrRX734CiQEQJ+Rr8=;
        b=ii+YbtoTrG61Y9oWJIYo2b4oT+zxj5Kw/Si7I2W4LI26TgAMP+W0sMLvNsPLbJKPb/
         PubchcP1VhGUkleVwcB7mLMvAWEIiYtN17RvQQAmG0vFUEQrofD0qq3x6p8Xp1TL9GzT
         LBRa6K9Nl121tcVJ2g9qsxRJyD9HDGF3oXyuw93pYQj5O7STU3/Ptmwhoe+TKIX2pMA9
         KNmuZ6dYip6X8x0oyyH2MEYfYl8tNIto417WhwdeksY3Bx01F2jZJK5+z6OU1VXGW/Fl
         CDmMRL60JS4E+bhnTotGE51s0ZbM9uv5l9pK8S3pbzWfHiCCLh/M4BYQAMLKXROjdI2F
         wqHA==
X-Gm-Message-State: AOJu0Yw1cYnCniKFFRzsdwU59ulUVKjESjMNGEETtY8ZavoETpAWHbRh
	MlVeymD+Zt5sLhln3B5FFffOSfu3C9ytEWs1Hy+RzkBnTmI3tLPmEldv+7aa2w==
X-Gm-Gg: ASbGncvqCHdaFfKNuOrQGA3fciIl8/nk4LuiGG1QERInEQm8WZzlAfV1MT9fBDdo6Ge
	Aff4wzkxxx43+Zf6NBktoVeIV/Jy2LFP0gZM8X917NipIJtdXlkNvmVgn0mgFmFzFEUcxv7+UtG
	C2+IYHZfPCm7B2/ue2PO4AmMcy88hOj8Y4rZze+zSRG9Z9XmztW4pSYyd2NDCBmJuuAfnUjjXlf
	ZZ8W1CN/c9sy1cdX/RXgQPH597TVplVCj1zUU7fQ3wKHAQ3tcXmYj8FEyGR0fzwQWK70B+Qbup/
	pRSPdGYkqAmz2jBCugXrQQQ7eUrS8VQmzbpDHzaho4sjyC+sdC+OBWdWNFQjlTKhXJYzm3cIAj0
	1LoMds94wHKQ2ljwP9lnkPZquAcgB6xXgFp+r0PbDK46l
X-Google-Smtp-Source: AGHT+IFew71jkx8fqmCI4xKnJR7I8/WM3aBniRCJuOmUUSw8hEFVeZarEA5Pp04skxOdlZ5X8mItzw==
X-Received: by 2002:a05:600c:19c6:b0:45c:b580:f795 with SMTP id 5b1f17b1804b1-45cb580f971mr43302915e9.34.1756981674244;
        Thu, 04 Sep 2025 03:27:54 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05faa9esm14925335e9.3.2025.09.04.03.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:27:53 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-ukkonen: New recipe
Date: Thu,  4 Sep 2025 12:27:45 +0200
Message-ID: <20250904102748.602126-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904102748.602126-1-zboszor@gmail.com>
References: <20250904102748.602126-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119280

It's a dependency of python3-identify.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-ukkonen_1.0.1.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb b/meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb
new file mode 100644
index 0000000000..f1f35ecceb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Implementation of bounded Levenshtein distance (Ukkonen)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7e49a187324d5a1a6c4ba2b9c3fd4033"
+
+PYPI_PACKAGE = "ukkonen"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "976ad9a991c9cb99a7c318695a5f6b46236bbd4c33c5b55273fa241dfca8e0fa"
+
+DEPENDS += " \
+	python3-pip-native \
+	python3-cffi-native \
+"
+
+RDEPENDS:${PN} = " \
+	python3-cffi \
+"
-- 
2.51.0


