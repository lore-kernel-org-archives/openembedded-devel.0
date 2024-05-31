Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4A2C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:49:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.22860.1717184942971478090
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 May 2024 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W7QF+ai3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42101a2ac2cso13983225e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 12:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717184941; x=1717789741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9illaEObLHRv6khyfyph9mep+F1r8osFvBHikwYPH9I=;
        b=W7QF+ai3C7JRpJ7DOQDeCF89a5xxBiF/0lXSNUthwbG6jmxkenWQTPle/j+WScdB0X
         qGQydni++1z+uVqkB+EnwFchyCSxqH/kdVkfI7v7tgJ0HBhyecbcwEu0iWVBmCbii6TG
         0HUvdW9yJBl1AIIRqthxbHMhfhgrbtwYiTOuJXVE090/XphS7CwC6kb8x7e03wr/R328
         6ftF/sB6w1XEbc9GComTDd9+SuPnN5MJo1/E+ZayhA8N55+ieEV5Dk5dOH/GZRS7AOWE
         2ZwWYJwN395tEtovbqKIBxLIH38bODFF/X5yR1zb+V5qatSTSoPsGicdInk/V3OP1S1P
         Kl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717184941; x=1717789741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9illaEObLHRv6khyfyph9mep+F1r8osFvBHikwYPH9I=;
        b=IdB/IiFQB6drIfjCPDspkOIsHRdMq5z80ll0k4mKu8X0aiPZPTs7pEW0jwK7vhkJi9
         67ygBzPqUHHXTd6oJ8AV4vg7IlDxADs3AAeL8guX6KhwpYJA8EjJZEHSSv1a2SejtjvI
         oZr/MmhCJ/eIYvMXmFto+22PYdhtHvRljV0xR7aYyJEsrhi6POWbvteH1pKSQovrat9T
         RpKf1/AZZEvT0y3GetXy3EGvFCTyZTD9JBm0/RA1xDo6mYkbeus+pOTcubWiDgtkWoay
         gCB38Azd9E/FPRmWjfssu1rEp5rdkmbosXPwRnrkXA5nGqIx0VE4PbZ4Q/uManbmA1SN
         eT3g==
X-Gm-Message-State: AOJu0Ywuvf+Vl6JEayO6cKtgZ5SMQ5JRUkOlh53d0bMCM+Orvus9Z0By
	7MQW2yHP3j0+C1IBCZI0QRGvLwAmx/1mNZDtt+GMxDVe/ok/wGc1bGpy9A==
X-Google-Smtp-Source: AGHT+IHpTKGIL0CqO62i5OCByQq5ABp5TLMyiDCO51lcAeuiZ1vz3AxpXcKTYcOuYp+pyR6Z0Upr/g==
X-Received: by 2002:a05:600c:4f46:b0:416:536b:683a with SMTP id 5b1f17b1804b1-4212e0ae76fmr23360115e9.32.1717184940684;
        Fri, 31 May 2024 12:49:00 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a5658sm34697745e9.34.2024.05.31.12.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:49:00 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-flask: upgrade 3.0.2 -> 3.0.3
Date: Fri, 31 May 2024 21:46:50 +0200
Message-Id: <20240531194650.3279149-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 19:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110656

Changelog:
  The default hashlib.sha1 may not be available in FIPS builds. Don't access it at import time so the developer has time to change the default. #5448
  Don't initialize the cli attribute in the sansio scaffold, but rather in the Flask concrete class. #5270

The license file was renamed from LICENSE.rst to LICENSE.txt without changing the content.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/{python3-flask_3.0.2.bb => python3-flask_3.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.2.bb => python3-flask_3.0.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
index 1de1a827d..fa2ade536 100644
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
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.39.2


