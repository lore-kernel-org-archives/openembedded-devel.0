Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B2C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 19:41:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.50734.1753126901494041973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 12:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIPgvDXE;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4561ca74829so52102975e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753126900; x=1753731700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=In0q/L3deY/q1NvTZRE6u3JrlgHiu59kFRwFhW99NJA=;
        b=JIPgvDXEcyY3AnpSV9nGspdD9t5dV+4Tg0dkumkPC/iJqPTRGB+N2L8oERi0Py3ofu
         zdOwXRCN55BYy8XVrqPEvl5DGiqd51TMEkdAMAw48uU77+BHOM50xt1jPMnRE/AZ37hE
         bzoGVJJb7Znud9MIsqPL2mDrXqfOdTwCONoB2Vv2QepVtgKx0Vp5VwYRfH93zOj/06aH
         Qcwy1hLq7eChWpIyJWSwXeGrOcOLUHrvYTYJb/F+cSjNvhySIn4rxFQfRjRUivvN0ASh
         qNIKaipXqbOJPse1zm/fWd0XkXQr0FFF4hge86fSuNaaF7+4yEI+C1279plHvS0X2F2y
         eeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753126900; x=1753731700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In0q/L3deY/q1NvTZRE6u3JrlgHiu59kFRwFhW99NJA=;
        b=P1sQUmsbfPM16iXmOZDdl6PLdhWmV673VhCJayn28HjK1nYjoYnbGNY0+Yc+ghemQb
         5V73LOzcmL7X5RBK221kF5BsBjEbrM5H5mKM8doIxQGzrisQ7mMJaI31wBmWoOkn0k1d
         19asP7T/q04GyP0EETJ3PEFI/+9wzXalwTqL6UjKFE1GJ0r5L1R4AC8jXj4fjRIOP/7W
         VMeXMbKN0BCIeC9xscqqvAJeNGDnC7adF2YAJWQFtI76PuJu+sZQWz2+ZpjHqPl65Ngi
         H5abJEtSv7QlLK46R46l4U6JTdhGYniDCuDn2eEhCtkJrRQ9HHMleeVuYYen9XGowZbp
         cEbA==
X-Gm-Message-State: AOJu0Ywlkryb0vCrLkOjipLDA63trx6QhpsNzPnQ9qLX+l48y0Ef33to
	VSdDdrGCS7sWjvYBDPmVnuo21J21f7nmVxNPWyyC1TveqffY8yCkXOtYKRukXw==
X-Gm-Gg: ASbGncv/MSQb+WaEOO9qP2qpiAKRiBHLawc6doui+0dtCEpO9e7UipbgOIPocQarLZS
	CgfqvAyyVnPitUwxqzgpwf7DeTcVQQYaff7BpkAr3lmZzp19Lcd+Newr8dyW/pdIWgCvv2LasH8
	TL6oapd6Gimz8bxpohIvQ18qrZ76oyH544vaCpx9nBwZSq6QcegtJUtb7GPP0F65wZFlYXbgBY1
	aEQ86Sq/vwRpVs0h3D61ZFDcpW8eZ+BC3ohJ9AOBZ5gGqGUSVUS7lJZIuI8KoJUx16g1Rgp0rsB
	kjlVIzYryzuxHW/nera3AmSYklshlQjk5cbQpLE9mXNGkAS6v/r07O09WnL+A31VbAGRwTnv/D3
	oh5Qh/kkhkUs3XIPfwMmh53WKpKD9XXG8OvAmUc52Z2ApaJQhGPvxujCE2Eq+R4uPFa4ufjtSMl
	qa6i1GUiUbWv+OK8PTKfJWsdsbQ88J
X-Google-Smtp-Source: AGHT+IHTLN7wFHk0jWQe9YTAunXO2GT4BghcinoftNDwmUiule/r42i6g1JCEkLmKxVlUoyum7XHvg==
X-Received: by 2002:a05:600c:5298:b0:456:15c7:ce90 with SMTP id 5b1f17b1804b1-4562e38a72fmr214889565e9.12.1753126899373;
        Mon, 21 Jul 2025 12:41:39 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b754d0fsm110493955e9.30.2025.07.21.12.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 12:41:38 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-myst-parser: added missing RDEPENDS
Date: Mon, 21 Jul 2025 21:41:32 +0200
Message-Id: <20250721194132.2756304-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 19:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118662

markdown-ti-py [1] and mdit-py-plugins [2] were missing

[1] https://github.com/executablebooks/MyST-Parser/blob/master/pyproject.toml#L39
[2] https://github.com/executablebooks/MyST-Parser/blob/master/pyproject.toml#L40

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-myst-parser_4.0.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
index 01c98b8db1..24a3953d42 100644
--- a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "myst_parser"
 RDEPENDS:${PN} = "\
     python3-docutils \
     python3-jinja2 \
+    python3-markdown-it-py \
+    python3-mdit-py-plugins \
     python3-pyyaml \
     python3-sphinx \
     "
-- 
2.39.5


