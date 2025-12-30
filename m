Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51690E95A86
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63150.1767097501349799338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lK7hjNev;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so5844187f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097500; x=1767702300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nHulfxIaFp0eLnWLsc4jYd5JbBPSzuVnUMOmRQp42o=;
        b=lK7hjNevJZ7MvNUVpjmmKITqdURrBC/ZT9mXhjA/NkzZjrnYDydaGULGepEVwY9MLV
         o+QWlo5iIpz7FyWZ/wsP2ZIpXdgM7VytUGxORgRBWK08SoJZp0HCdXazxlK5QJoNunN4
         /yKe+MaoR/N/CvKJJsx9JY28nj26M9UAto91b0ds3j22xW1TqQsXkKrhKvg0iiCxlMKP
         4l/+/UiStGyS0TwcH1SnSpFQGLYXJvaOIoNakLOGkPmwdaHoj1pOlZBubt2BaWDnvNK9
         w0diLA0P0CRjjxcv9sHP4qgtPsQ3fBHRv5jiQ0Z0lTVVPYO7J6UQk6432eM8AkoJFYCs
         fiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097500; x=1767702300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nHulfxIaFp0eLnWLsc4jYd5JbBPSzuVnUMOmRQp42o=;
        b=H4WJcpLXJh1Or2XIIn72B/0TlaChAN8EdOyAtaIH6IR7qEIy8cZRYpqjeiNpeo+NCM
         b9Q/qN1x3enmvQXnsjEm/54AE13JSj6QToWaNjEe+0NXrp7ZhXnz/Emdue6KTUODNXXt
         M4Xt55MipoXTK0VJ0g7VyomoPIzfjmLyjmHQVP/3ImnDwj0fGsjv1nQclayAPThd/Y5c
         o8gAFghopC+IPsta+/Q+woUH1VRMvucFqMcBzGxfMdm2GgtiLgv+XHOBsj3iEQ/5Sd5Z
         ahfTHtEfscvUBulhw/MPlWh6lpUSR/2a6g7rZxVDrhCNC47gsD4HRKsYfdWGyolS+nxw
         7atg==
X-Gm-Message-State: AOJu0YzzNHp8GMKNLKNYG7N5XJ7F/F8HU5Guav0jNZ9icQqWcKTRnD3n
	Mo15laGRTwdpizbyBhllBuQWSxoCtU6Hvhykoc2ei3T3YMEp/Gd3w0PSVwmycA==
X-Gm-Gg: AY/fxX6WIaMOSFqnL77bVrewxV4EIMI/xOpyf/fFTeb2jdX8nvGj7zZnC5OdR7G6Ttd
	JzMmNVsKYC1kXTs3sBtknIcnWA0qwH21Ew25Fazi9mD9ty+fShTDuhaP7EL5r/w7YqTnXTj0BcK
	bCQH66faYcCZf5sWXPtiF6tApfH9lzTYxBQds3GoLbPKzKI9O6szs/X+fskmQgPzkrdvn+0zTof
	Fq79Cewplkv/GLlr2uWb/w17hABMH5Xh3574Wdtb/PSys4SwvFa0bbRcALkcMni22RMwZEOFhAQ
	OTHpm9XmFADXM5PtkHAjce953cPB/gK35P+9jOVWgLwd6paWVaTZZHpHttCv8PH8NkUkezM0KT8
	McstiPn5d4SbORd0hhfjpK80b3E7t6dH7ARTRAPmwJ2l/Fn/C3JeNyFexm+57+XBPofl5xUTxLq
	160btlKXKy
X-Google-Smtp-Source: AGHT+IH0wdg1ozZnWiuizvMDrybZJQxcrgvTHEDAZ+GbTI3DjwM9rrV9n2JTgoICMqX+NYA5P4XwwQ==
X-Received: by 2002:a05:6000:25c1:b0:431:a50:6e98 with SMTP id ffacd0b85a97d-4324e5061e4mr37086920f8f.30.1767097499692;
        Tue, 30 Dec 2025 04:24:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/10] python3-matplotlib: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:51 +0100
Message-ID: <20251230122454.721515-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123013

At least one CVE is tracked by debian:matplotlib CPE (and no CVEs are
tracked by the defaul python:matplotlib CPE).

See CVE db query:
sqlite> select * from products where PRODUCT = 'matplotlib';
CVE-2013-1424|debian|matplotlib|0.99.3-1|>=|1.4.2-3.1|<

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-matplotlib_3.10.8.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
index c92af94732..ce8c7a276a 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
@@ -47,4 +47,6 @@ RDEPENDS:${PN} = "\
     python3-packaging \
 "
 
+CVE_PRODUCT = "matplotlib"
+
 BBCLASSEXTEND = "native"

