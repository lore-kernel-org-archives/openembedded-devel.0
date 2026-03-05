Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCB6F33A79
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:51:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45871.1772722309532543310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOM0c7bN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b790af67so2773810f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722308; x=1773327108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcC3ksaKIhf/6eb7f8QZ+SHrrDnM/Yr4OSmO0yXinMQ=;
        b=DOM0c7bNyMZFRdLtHYNzv5ICiyGwhr6Q0hlL4foQhc+vCPjYflaaMLvN8QRHlAGl9c
         oN9QG2zvLmcE0/dHN3PsL9Imwfgk547hbW4sQJIGx/RLsewZf70Wojo9FeGaw/8KbQsR
         /DIFWBacH91XDSo4OaetRjx+Yx9l77hhC1Y5gYnPuqNMb/CQdYa7JTaCZ7Gj0s601pDt
         hQGkM1VLmzmg2xZvFYH/WeHdoUYdqXTiRkdFenVa9O3q1UlWwebULU1EEzYoRSiG7RXK
         g39qXwLKBVxDFJ5eYSf5w550UW/GqQmVoaNERlBsRIvIByWDF/39k6EEFcmAKusvRI0P
         YcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722308; x=1773327108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IcC3ksaKIhf/6eb7f8QZ+SHrrDnM/Yr4OSmO0yXinMQ=;
        b=j4pBbzh2uiHJbdDjP8toAZXUn7kLb8U3P9gKfwyPCCY5gzJ+05n74gssa+qrpMEF+/
         OrIqh+VVfRGY+S0TBsPtNUrGhCefBYMk+weobalLBQI2Eb6irM9sFX4MKTY7arK/nJ1o
         SYPB8tlRS5ENLV0wVQ+Cn4aWFNmDbWIw/awN/am8Q4U4Oebd5zqG54YEu/+fmYrzwJIf
         qRL//JsW8IJzdTuXrXjx0F/pJIqEQJwaGN5dD1V6qciMUE1fBFR9IYHlAtdBp2thvBkw
         i59OLJlQmITWsEX4rcFgkd0rq2uePefNqWzlhoLJMJZxmstln6JlwniMMBkmF6Xvv+cc
         q3gA==
X-Gm-Message-State: AOJu0Yyk0a4Fa/HZ4EnJf4JRJ2fxVxRX+cLzXkhrMUm1UkEChoFLqh5J
	wcV78ubTvpR0nMMEKhSn0r/JSToNEUzQKBS0px8qeR5iLbBhUcKbAoEEJWVMyQ==
X-Gm-Gg: ATEYQzy6AQ7Eh1mAQghbnKT/HVZV/4pgD9h41SmyQo4qAwDwOhJNOmWwUqLUQOjWJkT
	Kvza2e1dqrJjLxA37dbfIgO55d2GSSxf2mN6GtsOagneSyXunUM+ZPRAbrNWVpilPNN745SD6v4
	fsQKKfXKa3Nbg6Rpse2jIv8PMNSBdmy1+F2JiCtnWsfvr/BL6iz5SrrHqFCdydmclsepLFtQBLm
	zr6NZiAgJyJr+3UO7JK2dX9oK4mTZZpQxIQYEwuJkjOA2MjqnStwfa3M8t4ilLBIBmJ1yC+HbwD
	nMGkKeJ2v0eymWDAk6SHKJQy/hG/rRwmMufRrOEt1ZHzwMGRTzQX/h6an5DyL4SPaBkPrY91d9F
	KkZ+09mcegQFtIcH2H2Xn1vBCn/MdgOhF0mTv+6kjfXlKRJA0NTJhCzTBG4zByheFdjG2fhOyaq
	XYC6KUlSIK+11EtA+LLPdv
X-Received: by 2002:a05:6000:250a:b0:439:909f:c5a3 with SMTP id ffacd0b85a97d-439cfb2b4bcmr4958469f8f.4.1772722307773;
        Thu, 05 Mar 2026 06:51:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm49302136f8f.24.2026.03.05.06.51.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:51:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 2/4] python3-django: upgrade 4.2.28 -> 4.2.29
Date: Thu,  5 Mar 2026 15:51:44 +0100
Message-ID: <20260305145146.3068524-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305145146.3068524-1-skandigraun@gmail.com>
References: <20260305145146.3068524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124879

Contains fiuxes for CVE-2026-25673 and CVE-2026-25674.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-lower-setuptools-requirements.patch                    | 0
 .../{python3-django_4.2.28.bb => python3-django_4.2.29.bb}      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django-4.2.28 => python3-django-4.2.29}/0001-lower-setuptools-requirements.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb => python3-django_4.2.29.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.28/0001-lower-setuptools-requirements.patch b/meta-python/recipes-devtools/python/python3-django-4.2.29/0001-lower-setuptools-requirements.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django-4.2.28/0001-lower-setuptools-requirements.patch
rename to meta-python/recipes-devtools/python/python3-django-4.2.29/0001-lower-setuptools-requirements.patch
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-django_4.2.28.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.29.bb
index 694a0144a7..c8d2c17589 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
@@ -2,7 +2,7 @@ require python-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-lower-setuptools-requirements.patch"
-SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
+SRC_URI[sha256sum] = "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7d5659d4709542014"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

