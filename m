Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB080E7DF0A
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57085.1770050241513419823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9EDz2q3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee07570deso38951405e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050240; x=1770655040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkjjj0WCudB6H8eTkGVvH0GMcErXyqBuQk6SfG2VsDA=;
        b=U9EDz2q3/BPaexgwivq7IIdGylF3Tzk9bMelBtK75rOagSbX7zJPObrWL79sFwATE5
         +kV+WcsgDFmrRNqgyjDmiRe96xvl59zFluAiPy70QRcsswpfgUqXadbuWtWhVtnFitTz
         YU0xoxS9bKIPBw/7ICbb24UtlfiDbH50d6SksX5YQrxYn7Tkhyk5XYckBvIkfRFA1E41
         r53jx5QAEAE6syYlTOfbOxrtAgrp9vQo8+aLgdHofjpps9K7NHMQuhMKtUcedy268lZN
         UfK2etQ79RR8khRa2J6z66Irljf+WPxkQMYWf2p15eglSCyXAy/upELSxb9BMdVAeS97
         WH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050240; x=1770655040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tkjjj0WCudB6H8eTkGVvH0GMcErXyqBuQk6SfG2VsDA=;
        b=oLrIOCCPEaLcIf+w9AttPcma9g+8rprNIbEIy2GkN9irKI1RbddJy4zAwsVbXSle7l
         FmCu0OJHHe5kqcv1lIBTyxtsqN4Yzu2b9rtWy4QN7jw8jLJmmhYwZ9EafGcsA8l4SBRS
         JReVT/m+eTxiDwWhzYT+f1xmBO8BjW2mPFvRb/CiEOryzLPGroS49mQ6VgvrWOEgAAdt
         Mwh26A1sdPu1wngbx/9GApotHwauQXI6bVtCu6FIWJc4Di7X2A3QZKUNyhSxAfmBsGFP
         WjXz+4q4hKkdOW1zQgQLHBZe0y4dikruQqvsh5nklgGUic+82uG6WGqCiUJywtuPvD3t
         UYHg==
X-Gm-Message-State: AOJu0Yx9lkDCle4+tutEEln3sgEzrOreKdx8ZtfJdJwGV4fBPx4p7U/N
	lkbBrgqRRp6wt4qojfvR2E9BorWgb5ZxyppNBDo6Szx0lpfSkK5RJ7G38IM/sA==
X-Gm-Gg: AZuq6aLUu0iUWZgYEwaQV4F8YEHIackxQizs7/nzOjPRKK1les8/OvA3M65MXInbgh+
	sJ02fHAse0H1HGjuIlpu5QQCSFul4hSKAYpZ3wTL7nJbrkFrbfDEO2TItiSpmBEirfhY/IsjhEk
	Jg4FEXfznWda6GmBfB2ur4r2oasMTFxdz7igwlRxM3pgy1A81frCjIsHcDdzCyQoc6xdVjAcfzZ
	GJ83HnPLeFjEnIRTo+QEugdoyncaYFUcwv1VK2nvX/LN4y0G+vtkay8VrebqEpb9AfuUPYYdD1d
	zs4E/o7ksk5X5mQi98w5WedGUcDuNVnEHTcQSDmCQlFCiG2Su0F1Pa7ONVPSEONzu3cKwOravla
	WZ7+F3+njIC1hwF/HAy6szDK4WkXoFLlFzJGOqZ6pq/3THiyIFNIUdKCO7H++tHfa+Sqzyu3f2m
	+BorBl7odU
X-Received: by 2002:a05:600c:3e1b:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-482db491ea2mr154891425e9.22.1770050239773;
        Mon, 02 Feb 2026 08:37:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/9] python3-pyjwt: ignore CVE-2025-45768
Date: Mon,  2 Feb 2026 17:37:12 +0100
Message-ID: <20260202163714.2359370-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124068

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-45768

The CVE is disputed: though the vulnerability is there, but it comes
from incorrect configuration of the library by the main application.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index 37675f1b63..0a928dc2fa 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
+CVE_STATUS[CVE-2025-45768] = "disputed: vulnerability can be avoided if the library is used correctly"
+
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\

