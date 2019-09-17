Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id EEC967F94B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:41:13 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id h195so1450830pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=YyZyl3ujF0zVvpAeTM3fHn+MRZXRgajUaGbHC/14okQ=;
	b=L0065uMdBqWfdwv2zxgnQxMecyoC8Geu7ApAvTQH/uoOUwh1VnlS9/gBP4bztkiHaA
	GsPsiRJc566dTXzTVMQL33+RkX1BrkzuyNpaAlBcbNitJkgM4Kw0wJ13cvY1ZawYhUOX
	PaDKg7Sb+S7rsR8bUGQ//dh0mYhQwOSLZIzBdwb3K7XuIU5mXVegcrI8tViTa/6S0J5E
	g3vqgicfRKbUX4MVKaUigFcDjikJEKwdCJrx5zuQEWUBlzO+bK//GtKh3rvdKFF/+1re
	MPqIdiq6WP9lZC9KAz381Ku+4CpEWjHvzRI9ksfK5F2IfDQZNR9P/swFh0r1XwcxyWfe
	DHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=YyZyl3ujF0zVvpAeTM3fHn+MRZXRgajUaGbHC/14okQ=;
	b=EUyAd+kWw9fEiMxba9k5JjtIhqa/3dOlJcd4DD4t+c+9rVBLwJN3ZXZ2wgIgkN/EbF
	rxFcl6OpTv2CTRTw46nXDvKFI8jZfjBfBLBFSuQYZhksF51WYad4DI4w2sC3PN+84o7P
	umKv0aLBY2laKhw4QRq4tM3IijPUK2Vq/jTF6vbpeULReqApu1qTs6GX4puXxGOGoTKI
	KopexdLYcjX0UhVmTl6vQUIHStL7R7tILV8gvtpK7nw9dAs38kypU+8bfJyQr7kQ5aSF
	ZZ2coKwXuxC3R+phAcBCxp24/imnzMzQGmYkCKE5enpDI5Z7ruhcjWcZWGXcupZbDQEZ
	kprQ==
X-Gm-Message-State: APjAAAXx+Dd6SY1pcILXnNWbkHnTUihk8f7erwVE1JjwqrtQH/rpqRCd
	Hhr/v2Hf0rHTmlcaW7+d29/GTzHi9EGqdw==
X-Google-Smtp-Source: APXvYqzD8a00me+Y6V5AI83fiTECkZMPAqe4zjHuE6+3ovD33NNWoRnN6fLumGlJO1tkIXTyJKtGag==
X-Received: by 2002:a17:90a:9f04:: with SMTP id
	n4mr3103702pjp.109.1568698874589; 
	Mon, 16 Sep 2019 22:41:14 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	q13sm1063121pjq.0.2019.09.16.22.41.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 22:41:13 -0700 (PDT)
Date: Tue, 17 Sep 2019 05:41:09 +0000
Message-Id: <20190917054109.20435-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-python][PATCH] python*-pyserial: Add native and nativesdk to BBCLASSEXTEND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2019 05:41:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta-python/recipes-devtools/python/python-pyserial.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 52a7e05ce6..870f1d8a8a 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -40,3 +40,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \
 "
+
+BBCLASSEXTEND = "native nativesdk"
---
2.23.0

