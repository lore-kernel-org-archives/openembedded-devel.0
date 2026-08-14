Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B09C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 13:57:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13587.1786715806576550060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 06:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=I5EKPJbB;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c4436d02cso5971331cf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786715805; x=1787320605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Au9UB43Va7LA752XK6RXBI6AiHDzVbX4sBnqlsxRYg=;
        b=I5EKPJbB85G8rzhEjB1XEpTx1BFafy72VPPVuenlgllOVOgX92o4m4ZFpytp2XFs8A
         YYOapER9C2oB7pL2stkvYux7B81lPg9kuUe/4wOd4o2E0M9f7WWE14/gKpYCUo33fTw1
         X1bvp51I2RJjxLPKRjpwJMjy6DMxixtWgRF3rAg00kRR28d1yTIy3xw9V5OtvQSanfsL
         t04PewA1OmNF/vrg5HhyCJKW9I0U16u3L2dd7P9qipuW8IoDvTZp7jfQiOw+C8pw8RXf
         lHoHLuec+xY+fwzkocRTi77mk3CDxIOx7QpmWEvvTr04E+B2Ls9dvfXAVGeTUuMzkZF8
         yVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715805; x=1787320605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Au9UB43Va7LA752XK6RXBI6AiHDzVbX4sBnqlsxRYg=;
        b=lzPLOXzVt9zm7fdUnL0oBRd1FBdJfFmgqzm8lAm+2jTgpC76/lMUJviTN4U+KtbmpK
         ccY2fTa13Tuy7+Aj4aD0lv0gpdFeplyC7DLhKJP8LdxZuqDFLjOCOlNajZ6Wcfc5oGhk
         nOyRBwVudDeDpn6ALlROG5HRQOZgFkKG3cayPTPmZdXHQu9EBXRuImGn4rvjL1hnuswQ
         1gbG9PSYmsVC3M5RA7sjeB/U9np6LzR4I6/TBDq84oaqYSvy/wU7Siqjh1Y8dc8fLKeM
         9eUR9lLt9vVKMEgaNekqNcVEpT0f8/VUzZo276p5ni2qUhpkFjqL2IzAZko7VbUG9Cnf
         //Fw==
X-Gm-Message-State: AOJu0Yz5WEomtRx6IuD4+6Jkt543jne7jNcH8Q+LeVt44O4Zjh/PrRWK
	vWp7Rq6DAnagok9+Pvx5Ve5tf9JsX0/FW8CL9TYnInB1PTiGEkXAW4KRCUxHm91vujZqelAHZ6Q
	eQzdZxdA=
X-Gm-Gg: AR+sD13mZHkPGo4kW1HbrP6Rxc1Ql3ah9eFD/f9KSgSaCGe1tNd9kf1GzgNt2InDvyS
	hITQ9ryYogGn4ZN9V2ILqXuBqRONUpBZDDTqFYEuqjWqfhcZT3R6G3fOEGgSoQUibyLyPxv0OiO
	HWWssVTFR73zhJIgG0n7Yzy6FoXlY6fioVbTcVkp5cgqjpDoqnS/WZfzHhOuJkckOGc/jMAzE0c
	O6kTSvAVDkWlRkhPP/jCit0rC6jGa0crSMqCRCvarRQ4rlm0mu4+y+F+kTIgPu3M5uzMTjHepN5
	F2pjrV1nYGyvtGPDVEZowZw/VJgZS7bjUv8u8kq2C9XKOd5sr++9qFZckm8/IWm+o7HgaYIqPPg
	LZDpbyc4pHKXba6fW26yWFvaGBPWo+7bDMzAg0Ig39dJXRJ4Wy2cJgd6zOOzRiRHLNWj3oZ0rOC
	INBg/gvhDFUFvhSuasbooi4h5rRNp8bwh4t/4MgezzpigaQpJtLh4BGTPiCFi0Q7/4
X-Received: by 2002:a05:622a:1b89:b0:528:38b1:b54c with SMTP id d75a77b69052e-52d85305081mr62697621cf.2.1786715805342;
        Fri, 14 Aug 2026 06:56:45 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a9220293asm19996346d6.12.2026.08.14.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:56:44 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: pidge@baylibre.com
Subject: [meta-python][PATCH 3/4] python3-glances: add ptest
Date: Fri, 14 Aug 2026 09:56:36 -0400
Message-ID: <20260814135637.537350-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814135637.537350-1-tgamblin@baylibre.com>
References: <20260814135637.537350-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 13:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129047

Example output:

|root@qemux86-64:~# ptest-runner python3-glances
|START: ptest-runner
|2026-08-14T13:48
|BEGIN: /usr/lib/python3-glances/ptest
|============================= test session starts ==============================
|platform linux -- Python 3.14.7, pytest-9.1.1, pluggy-1.6.0
|rootdir: /usr/lib/python3-glances/ptest
|plugins: putao-0.4, anyio-4.14.2, inline-snapshot-0.35.3
|collected 37 items
|
|tests/test_core.py .....................................                 [100%]
|
|============================== 37 passed in 8.02s ==============================
|DURATION: 8
|END: /usr/lib/python3-glances/ptest
|2026-08-14T13:48
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../recipes-devtools/python/python3-glances/run-ptest  |  3 +++
 .../recipes-devtools/python/python3-glances_4.3.2.bb   | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-glances/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-glances/run-ptest b/meta-python/recipes-devtools/python/python3-glances/run-ptest
new file mode 100644
index 0000000000..f56ca03dca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-glances/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest tests/test_core.py
diff --git a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
index 6acd8429b3..9b8e529c87 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
@@ -7,7 +7,11 @@ SRC_URI[sha256sum] = "736faa7faea3bcd58afffd6443974b4ed4b498627a71ce5d6c9640b7b5
 
 PYPI_PACKAGE = "glances"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI += " \
+	file://run-ptest \
+"
 
 # psutil/jinja2/packaging are oe-core; fastapi/uvicorn/defusedxml are
 # meta-python. 
@@ -26,5 +30,9 @@ RDEPENDS:${PN} += " \
     python3-xml \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-requests \
+"
+
 # Optional fast-JSON accelerator glances uses if present.
 RRECOMMENDS:${PN} += "python3-orjson"
-- 
2.55.0


