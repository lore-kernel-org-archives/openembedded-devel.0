Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A75F3ED46
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 11:15:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.191326.1775906105860007201
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 04:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gW+fX8OW;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1321778a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906105; x=1776510905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m4ZWR/wDPPDnaFi5M7FEGUSp12J+9rEpUQAdL3kNKI=;
        b=gW+fX8OWwDjSuCP6aNqzEb+3fVnArx/BL93smkhljMtY5bEFJsI6DljZeUITlL7rJt
         rHsH77NBgzWIOqhOnnBNkjPNgV++s+Jc9EOBadKatfzMeTQx9yKf1czKPIDBgmQN4dTV
         +RUTkYs4UDUApChA/JkOtCufX1npX3gmPmsdRF2AIvzWDdujc+/ab+oaXrQVNH5zrKhH
         8k4Lm0qBdQEFgFp1bGrEoP6xH8Wlow+No59zkvvLLfIkrbnHNNvB4BWAFbdkQVNkpr7j
         7Dv73x1WmSYTfwoc7ENPZ4ZLfCD2BT+QfDjQBCjpAAHRn9np68w93R2MFK/txHIo4L4X
         qYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906105; x=1776510905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9m4ZWR/wDPPDnaFi5M7FEGUSp12J+9rEpUQAdL3kNKI=;
        b=o5qglceTd7U4wXVc/1pFBvtO1/woReSr5vy2/eTMBi9X2ucoWkj5YXOuTr4iC5C+3C
         Rgn3Tje9b0SfVCAMeuNwLWLXwokqLS+2u/fG31tEZ0Yj6CMVqDQZx50g9EXPtBxuPhz9
         06uyskIL5Ckin4lUW91C8wR7osIoBuWGcp0JtBIhlKKFVv9e/LlSUY9chDNjkULLTBpx
         K3cy++Brmoqltx0lTo+7vJsF50HnxZX4Z98fkSUWD+mWcrATxasKgMsNx/ngxlc/3JAn
         Ep9DcbAkA7sLxbJIY+UbmU7vhJ/88x7C36Y3pgpQv8CRNsy1MDEu53b+MFbC8EcU/PZd
         xKxQ==
X-Gm-Message-State: AOJu0YzImWmN6phnzUtpRHOTfSoTVN6CCbvEv0aWzZ82i4J+07GXu7oK
	gfSedkwlS9bNTToCzkVn/wJ1/He/ZnSolUOrIDMBoVyc/cR4aHsvRIH7MZpsoA==
X-Gm-Gg: AeBDievtkG7LnVuayxkRky3XROMa3qG8PZVt2iPRFshqytZukg2Bhso0BiisMYLjEoJ
	QGyFfoEeXVP81jwuwhTOcciKg72Fkk/womsdc1bZn6Zpeso3ybn7E2uQMSLE8K0e9aK3vThe775
	UYSHBXVRcwmsg13WuKbyHykeZUMjv55BJuQ89MgEBM/XlEaRcPReJ2nm15SQdPwlwke5bt3Cu+N
	lOsDkuFHoH2yfcHNZLcZhf3+RQqlvdcvaGJaI+Tt19T/ZPXc0gO3Cex0PKZ/+gBV0fgGIujaX9D
	NeR4wncrYjlRPlvLUR+fpU+LDWkUfGYnl8krpVg3KU3LyDOC/xkxeUVBNESWpQhJhGNlglqcm0a
	9BvOUb9LWRxivduhkGxg9Mobgdw4fd1efjD5FqspAJAWBheW7knx3IpMS3R8LhUtR5k22XwCrsR
	jFrqkQ8IlozGYKwIMe24Oei5ngtSN91Assn7ft
X-Received: by 2002:a05:6a21:33a0:b0:398:7796:ddb8 with SMTP id adf61e73a8af0-39fe40dbb56mr7788269637.60.1775906104975;
        Sat, 11 Apr 2026 04:15:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm130447a12.16.2026.04.11.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:15:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 3/5] python3-flask: upgrade 3.0.2 -> 3.0.3
Date: Sat, 11 Apr 2026 23:14:47 +1200
Message-ID: <20260411111451.2739610-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
References: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 11:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126255

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License Update: File renamed as txt[1]

Release Notes:
https://github.com/pallets/flask/releases/tag/3.0.3

[1] https://github.com/pallets/flask/commit/87d5f5b9a9697434e6d972b021201105eabb54e6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-flask_3.0.2.bb => python3-flask_3.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.2.bb => python3-flask_3.0.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
index 300ca99ddc..b68946ba0c 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
@@ -4,9 +4,9 @@ Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
 intentions. And before you ask: It’s BSD licensed!"
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "822c03f4b799204250a7ee84b1eddc40665395333973dfb9deebfe425fefcb7d"
+SRC_URI[sha256sum] = "ceb27b0af3823ea2737928a4d99d125a06175b8512c445cbd9a9ce200ef76842"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"

