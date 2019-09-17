Return-Path: <ricardo@foundries.io>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 288807FD8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 19:09:30 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id x134so5263132qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DxRZJDwU96EcnW5JlmENfQHnqp8o1UP4G4xJ58r1Q6g=;
	b=mz04QpKJHmH0AxN2k1D/Rwn4f44bKowvkjSUKHj74F5WVczwpWFWe8kG0EJvBImDNe
	8MfZV2GgjE4xuE6nZR9y0fG8osN1pgEOYLr0gRGDysGT5kXvv9d2lFdo3b1NTIyNgfN+
	gvj6wcMNGwrqZFObRH5kGZHvVEoOi4Y6WPQGsG5fPGSxMbzk1CEDGU+A34SwCV4At8cC
	MwWoH58PpZgrK/FAEE0fRIxFnhgIxHPi3v0Ikw6wIIBb3+qZ17/17/P9J6tgkIuI1S4e
	enpIS2f303w3M14gUmbsd7oG3IfDYp6Y5O5lJqJ+KWVbhiFV/CFAYfrsEyoojKQuN85n
	RKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DxRZJDwU96EcnW5JlmENfQHnqp8o1UP4G4xJ58r1Q6g=;
	b=gEkg9Y0e7+lwnjtSSrq8pPF21NToFrSpmZ81pb7QI7TvLFIGBevSb8c/O1gYMnRmnz
	MkSD9EEQUqbCm7K4sQsbKBSejzoFGU2jXkvVu9STiRcmTu97/wdLVF7Ij+jpQRZZWIsP
	3cPDjSx/uSugbDH4yMxKDIuqQhGKZ6lJRuKjmlQWbx2nqRXkEx0Sp8mvHtoLC9nSA6E+
	6P1S7i+0IvLEZ1EHD75ayylVm7NjkUx0tDDajVKHG7F815pAXfs2tr8ZLloTdaxykbyo
	NqE5ViAgOpdIxZtazcD2leubPq+K6EGDq4NINd7xNqdnM8yW3wEijEO7zAs5wDx7K6rY
	SAtg==
X-Gm-Message-State: APjAAAXeQSrQ2b32/nOYR8FYRWb7ZxgwQkwqEWvsEJnIWUm2s/THQyV/
	JLz55WW1wev+qvuVZlMJ8KEfBHbUYgmq
X-Google-Smtp-Source: APXvYqxakNfYO0REGArjl4TCo3ZlCO4IOQb//yiCq5izK/Ab3EjNcV/GJCvGIUxTP5cUnu4jjPMZnw==
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr5630699qki.125.1568747371689;
	Tue, 17 Sep 2019 12:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f5:f380:260:55b5:ddaa:99f9:976f])
	by smtp.gmail.com with ESMTPSA id
	g10sm968095qkm.38.2019.09.17.12.09.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 12:09:31 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:09:13 -0300
Message-Id: <20190917190913.13628-2-ricardo@foundries.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917190913.13628-1-ricardo@foundries.io>
References: <20190917190913.13628-1-ricardo@foundries.io>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python-jsonschema: rdepends on attrs and pyrsistent
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
X-List-Received-Date: Tue, 17 Sep 2019 19:09:31 -0000
Content-Transfer-Encoding: 8bit

Release v3.0.2 requires python attrs and pyrsistent.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 8f5bdaa58..069a57f26 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "8d4a2b7b6c2237e0199c8ea1a6d3e05bf118e289ae2b9d7ba444182a29
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
@@ -15,6 +16,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-pyrsistent \
     ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-strict-rfc3339 \
-- 
2.23.0


