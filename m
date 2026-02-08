Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C735AEE0AF5
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 00:11:35 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16992.1770509486718386673
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 16:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0FrRz8f;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8870ac4c4eso303136866b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 16:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770509485; x=1771114285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7+ha8pCChirMjJz4tVA1N68HRuc+n3rOFrZF63XSxM=;
        b=f0FrRz8f5f49P5e9wNZ7QgPIb/xRm9vUqEjloabYOq8FgxGnPFz6T7JSx7Hq/nAtl7
         dW+zeqDsUIjmPXJGJFVv+rme1qmC5ap3Ef/BoHK9IuTcmnA+CKK6KkdNWVwAHMWbyMEa
         SIpWCF9FJ1IPOikyVfvQICiyxoLclOnHi3DjjDVHDBL+wafa3HEiIz4bQev/MnOfBM1I
         HRL+yDVOgLKuw8QzW6przc31oLMZBu17jErTeyPAl4OUVEsmMI12YmXpnpkZbaHBQYVv
         E5AngHQn+po/stCQdkKfrLWfzWzjcGDsGinwjFqgb6Ht2g+DEF2oGzkNNiYzlIUsEKvh
         d4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770509485; x=1771114285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7+ha8pCChirMjJz4tVA1N68HRuc+n3rOFrZF63XSxM=;
        b=ZwBJuNz/i9QiDzCF/K+Akjk8GtobJ8PY7rdhOXWz3AYmz5SYzYw+Y0UDH3nKrtMA9j
         fwPKSwaCthsrvc6Wc/4h40w/gFxLZsf0HWZ6XZCg+9m0082377oLjeFxJWt4nkIdonq5
         pnQjuw/2vcW2hDVX/27EJ4n1ChdZ17KIFAbTVJFqa6/9jN09+4naRbvo1gy3SeaqKBGR
         5fbNrc6XmxmAwe5gXUuft/Y5/Ut7IE3yS+Dx2LHbGg8j/CVheLlOpbmw2BATmSqWNPut
         vkd5uXixYdTf1mhIhHWhouvPmpfb7WgtQMbufQfmaHyfv6GF95NJ8rQaMIx/cxLaEWKF
         Zrng==
X-Gm-Message-State: AOJu0Yx5N7DS+cj3DALtl+udvwGc3ur8Y8iLxBDhEjgjNLmLSJlx+OMV
	qiqjp6AxG0KPUPxKaAHCVV5cPf2tYwsnNcaJaIYcI2ZhCPf3Q9dlbe1H0JCNcA==
X-Gm-Gg: AZuq6aLSqa2SHCOdzkPIMZUjZCxBZ3oWtnmR5TMHnolEQGsfvKJEG7Me9+UFOvq4Ahu
	PmY+aOIVHunR2zRD3z1gLFVHlpwgsigTRjoPuAsag+UUrj1DdQls+7S9WzNUcKHKcdOKrea43/N
	DtbYKTX+F5d2HEKk7rbhHqA2rg9jE69v4Zmbk/QOV+P6P7vsWve1UM03hiTDV9Qhpp2npgqzaTd
	/nFMxf+/nO0AdeS7mh2SO8gjStb9dFKSsBy9X2cwZg/2IOQ1UIGenGsWd8rLZsmH1meZPi2V7y8
	AhVQeNAbJAK3suklsG7oiEBqJjpE5Adp4sKLQK3PikdGAToB+Bbspois5IvfZpkBuvvVlcz5A6A
	2irww7w3wWEWjUz1FFb0jGMM2kQDnWLMBAd4pqk6GBsbQCDjVLT0NDnTtOXLd4smmKSVclJCgbw
	ipGbVNYJ2X8QWFF8Kt6Ft0Or/ZPetsHPyALyuIJaBkkY0bE2Ytr6D9gyZmp94YZYEx
X-Received: by 2002:a17:907:7b8d:b0:b8e:4470:6caf with SMTP id a640c23a62f3a-b8edf1f5d27mr386017166b.22.1770509484497;
        Sat, 07 Feb 2026 16:11:24 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb3195sm219826266b.35.2026.02.07.16.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 16:11:23 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-env: new recipe.
Date: Sun,  8 Feb 2026 01:11:00 +0100
Message-ID: <20260208001059.1766407-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 00:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124271

pytest plugin that allows you to add environment variables.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pytest-env_1.2.0.bb        | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-env_1.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 15172e7f22..d01483afb4 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -80,6 +80,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyasyncore \
     python3-pyroute2 \
     python3-pyserial \
+    python3-pytest-env \
     python3-pytest-httpx \
     python3-pytest-mock \
     python3-pytest-picked \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.2.0.bb
new file mode 100644
index 0000000000..f7ab022894
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "pytest plugin that allows you to add environment variables."
+HOMEPAGE = "https://github.com/pytest-dev/pytest-env"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
+SRC_URI[sha256sum] = "475e2ebe8626cee01f491f304a74b12137742397d6c784ea4bc258f069232b80"
+
+inherit pypi python_hatchling ptest-python-pytest
+
+PYPI_PACKAGE = "pytest_env"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN} = "python3-pytest python3-tomli"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-covdefaults \
+    python3-coverage \
+    python3-pytest-mock \
+"
-- 
2.43.0


