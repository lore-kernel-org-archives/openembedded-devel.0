Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6A7C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1947.1751994878073159023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqURkm+T;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453066fad06so33242695e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751994875; x=1752599675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBHiIf6f9Dmll2PIyJiSW2uLpZ2U2i1IoI9o7vh0JrQ=;
        b=OqURkm+T808Rt9flveR+44cDHRImiV7ZFqWvjP5Nn3oEpx3TZ4eourJqYCCeSKSMBO
         qrYsYnKyAsy0GrWvlJJWM7VNrmfARA4EEvmLahpYNJFzItKA/OETRp+8Hib7NTxYxyaF
         fSGxLAd2rU/drcAUs++7uNbM0j+k+O6o+Dk6FrwEREte/klx0YmKjHqMGb7qmx1dR2OR
         I3EaPGj0NjbYikogt5n2baajJhbiBHSLCW0rvAZJd8qYMiAcJ2daR73PWYOcVlyk3n0s
         o2f2qk2GlFZoTd5Jr7UqH32bbawop6K9+60WAgAKPUhCVHmdYzHxbtH3OgiA77+Sq9lY
         NksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994875; x=1752599675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBHiIf6f9Dmll2PIyJiSW2uLpZ2U2i1IoI9o7vh0JrQ=;
        b=Oz0Tq8hhl3m+e71KV9WyTYKWL/ssx7qVHN3ufI+ofYFnDCu2epGMdeRnIg1EvPPcFa
         taH7dNFlTiYnm4UTNigjemVisZJk2Dz8kRo/d62rwvH5liFJaY78s888Ghfa+3pizEcX
         Z8xhsQJEfSujPEsSMPipq/eSl/5xhC+XAvdeDy3xHU0t2wCLH2GUapne3CYnGp+08N1M
         1BBbooentfqtkWVVTzgKRYuTGLsuEbvXqF6LVE7jWWqSkgvqYkH8UxWMSodUjF0Klbbr
         uFVjwXpcgLidduXVXdleC0cLzifhpb1PnZBkTRCMO/CHnPzwgw3sn5d4i17VFXdMcY6A
         tKzw==
X-Gm-Message-State: AOJu0YxyMZfEyDWA55QY1nXAAINBTMfZJYnkK/u8Rv2c8VOTetXwC8fh
	X2Z/N9+cT1FGI6J/bKAF8SdRn9xQridQtVW17qeG2bK5BzRwgUJw6FkEu152mg==
X-Gm-Gg: ASbGncvkAgGSvBcAo7raNSoKhir0hf/DSLtTac0wTD1uulDFv6hCYpKQvhmDpUZHr26
	wpTcWg2d6rNPWJHc/K6Jgf2NkQRU/jiFb+khr+LcuG4TiicrIG4K11lRQwU4S9ok8JhYuXMQszy
	xZjzoaJSBBeGdBHgHzrOe/icvVrWWhoP00jCjTS6k2dRR8m+W2MMMKNeyx71WZQLIPe3/W0B6aI
	Dw/KXRgQyd/6eUYDgUVNe8mXRyBOxWVS0vDbKRbM2t/tYgdVzM0SQNKkwlEeWNDfU+BO8CyAbTc
	KddbyoHdCdE0nUY5aUPmfsCFyUg49Q4mh189NBZC8DEFrs2Lfz17ynPA8Ail3AWv7T6BUA==
X-Google-Smtp-Source: AGHT+IHP351+J6cCBkawgYHUbYXtD/OHs7FHLr+5qqoIbHc+IGZs9gmimsq+XqKqpzUKd5sgkPb8kw==
X-Received: by 2002:a05:600c:530c:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-454cd4ba75emr41218425e9.2.1751994875158;
        Tue, 08 Jul 2025 10:14:35 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd49d0ecsm27801125e9.31.2025.07.08.10.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:14:34 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 2/2] python3-jsonschema-default: added recipe
Date: Tue,  8 Jul 2025 20:14:19 +0300
Message-Id: <20250708171419.2695068-2-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708171419.2695068-1-yishai1999@gmail.com>
References: <20250708171419.2695068-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 17:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118319

Added jsonschema-default python package

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../python/python3-jsonschema-default_1.8.1.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.1.bb
new file mode 100644
index 0000000000..03cba50b99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A Python package that creates default objects from a JSON schema."
+HOMEPAGE = "https://github.com/mnboos/jsonschema-default"
+LICENSE = "AGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ae09d45eac4aa08d013b5f2e01c67f6"
+
+SRC_URI[sha256sum] = "77e35e4a95519c7dbdbe25438c00af33c17bb766cbb0a29a2aa9d645ee3c1399"
+
+PYPI_PACKAGE = "jsonschema_default"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} = "python3-rstr"
+
+BBCLASSEXTEND = "native nativesdk"

