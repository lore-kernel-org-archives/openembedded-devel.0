Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D8AEE57FB
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81799.1767167683410287443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MIchq235;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso108773125e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167682; x=1767772482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCiy6Fwfs41YX9XtzIX5Sc3aCF1SVM8nqZw7lEYd28w=;
        b=MIchq235U4xHsrWeV2dvf0M9BfCQAYzEONgXS/t/oGwJfRVfVb1jp+QI6aU9IZcvMb
         qlGjDNKnsL0Hq/uCetWDwa3WrcHbrpzKryZNx5Gej4lj285Q6XX7xxulZ5PnOsYwYyVS
         Y+biM1xneHaqyOFo9qKJfxU97tMBc00l15vBXkegHYViiodoWZ2k/v1PFzEjo/3u0Hx8
         kj45sdjQOY69cfwSWO/sfuicE20XIo4PlM2tDlLFxURxdwDzFF900jkjfpdOVFF3RA2E
         AmVAczRw8rhwJCVB/na4I6/ygYsnO84zlbW0LV4tsnxGJ7b8108Z2DsgwbcjkTOD4l+u
         2dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167682; x=1767772482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCiy6Fwfs41YX9XtzIX5Sc3aCF1SVM8nqZw7lEYd28w=;
        b=scJTQUimKYTD/I5+3QHG16U+UMYLzZE+lJOpp/SX4fTA7dMPTV9ehoslhxVPpHDAWc
         oyFvJ0GlFPwAQaSXYug8xc7rKG3yra8mXHVjkU4uRD8cg/4FybqOCHfglDjdAEq3FuUQ
         IaGy73E4SmGxlKDlYjzb7YfmWMTGgpp4w3W4ETVob+JcfJuJKsSRc38SBcUhCs7R5+Pw
         P9T+LTs9s36TxAYygBrjGlkJ1rU+uBlGDDa7/MGumFaXLyz06eB/GcU38Y9ZEAT53EJb
         TX7FRcJkI7TDrDEi4wbW7blQQeRg6L1JPBoPYyLsW29dzlPSYyKWLx+0F8M5uEwnDPSP
         vBDA==
X-Gm-Message-State: AOJu0YwUOFbPkeb7dzKE2ycf+hGHX7zTs+s+szu/E4/OBe35Mke7PcQ8
	USiIP/Jxv7VqQzAC5iW3bCtsRqLkBueIgHhBb/JuD/0bP8d0QB9Ur/hMM5cdWg==
X-Gm-Gg: AY/fxX4lK0/iJNdH7LUh9pdeJpozuV4vSfI5faC7GRji6ztu7X4dxwfg7cNRWYkL0Sa
	1EDW6zCpSurhqNjKQAZI3vIHJfIvRvgeR6Xs9lIOSHAeMgOku4CkqxvXJGAf9B/mfFIXe4qmZaV
	S5SL/iTt4JrkKQmP5sOdW7sAozf4wm1yojgqoiIfB1JRYp3bSbwieCy9U+4/9qA55zWwNrr30e/
	cZ1K7uaQ5NiQ/0s1BrQANw945xt/GkuQdB6nxFIqMUMG9fWeyR2O4Un7jXVq92YedjOvQ4pRTRK
	e2+ylYYs99C0S54Usxw0RSpk0e++gWGBE1r/zm+YnQxkCwzHQ5lYNMWL0wb6dhomnXFnkMmcM65
	I6Gx7fMfokprRc5VrKW4zYNlsKu4+H8G0ePPH+9pzPmYD8MD83d2qCuf0FvCrmMk/OluIsznUEY
	Nd/UoWlg/z
X-Google-Smtp-Source: AGHT+IEgw8ah02qXyICQ1+bwLNigbtLohtAWdZ9Tz+WzNXsFO/im9h/Yv5npin1UHETPLyjtil41Pg==
X-Received: by 2002:a05:600c:5493:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-47d19595fa9mr377242495e9.18.1767167681715;
        Tue, 30 Dec 2025 23:54:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/34] python3-brotli: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:08 +0100
Message-ID: <20251231075436.771395-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123046

There is one brotli repository for all language bindings, and the same
CPE is used for all: google:brotli (instead of the expected default
of python:brotli, in case of the Python package).

Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'brotli';
CVE-2020-8927|google|brotli|||1.0.8|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
index 2f7016a546..5676d4ef97 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 PYPI_PACKAGE = "Brotli"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
+CVE_PRODUCT = "brotli"
+
 SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
 
 inherit pypi python_setuptools_build_meta

