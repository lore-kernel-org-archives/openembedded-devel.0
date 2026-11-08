Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2910.1794165994091105810
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so145047f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165992; x=1794770792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWILsTJiZ7PNajPKO6F9MLiF6hge8rkONNrkxgXfeBI=;
        b=T4MdDwQSpSZSOUftZeoxHVTdVVyXwzEQm3xYfA3KHhpDWjN7pwtBEZnMAp/1zSLRsi
         zv6FGZOa5jiwefWg1nXLbhyE+VUD8ed2q80V3oS7Hpa9dWplUJy8wp3OGn1NQrXV8f1Y
         r+pceEJlNjvaF1cVZ5lcdMHbs+ZByNjR6MZlg7HvS6Q2BfWuRqabb4XzT0PbmZNeVguA
         mkLzgoeyqJPs3QTrPY+voqADXxM26alFivAUIBDf+osydy2BG26dejKJ3Lrmweyn/87X
         qED14+2vO1Z9QxCPUY0XyShm4AhnXpTOqqmLRTNU6ADMq98995tiIeyBC1/PwCYlD+AM
         PEfA==
X-Gm-Message-State: APuU4Z/WyeW4ea0F8OLY4HjJishDO6HBTWTKtQyHVwTeKv9zoxmxJpAg
	dt6cJ6Ybg5F7Tmr9jfsj9sQGH9FSBoOP9IE5YvX7Bk0yRLfD9t4yo9+IyAauFw==
X-Gm-Gg: AYBFou1nisCwimjS3ReBtpMFiXiNLnK8ZWNPkP8my/bdvsXFnXuonUyP4wjjvnsSWJI
	YkrDYB3/cRODP5QxmlNykZiUg1e8cNKj6rinvi2iSTv9bAtdxL0coFBgMxAR4be/Z5ShTqtGDOj
	gSyE9T9n+/so9NyctWT9flVHENb3a5eKbgIQUsldtFpY4LQkSYToEdj5JPJzsszDRHM3v0M6SO+
	F34UhzPwIwZR5TEZRuofXOj4uAWr1+hmtBnIc8jBW9cSxg7fFTBObOXVzID6rchgvJb3moU1OLo
	kvw08x67tfJnR/M4Qg+IMuuzuLrOzuwXQZqeQeDPy2m1fgYu1h4n0BZOfjUl0l4cdvYrWWsGY7H
	RgCbd4HZYMee8FxNt91nuEON7n98bXM/vic9/oudNJiH9H+G05eH0o/9YIdRteGQeK8Enr/1LpH
	ZyH1nQ8njlHwSz/aSo5TaI0YJg1r+8g8/xVOw2CBJeJGEJH3qbOCyATL5GF2GLlAWKAFpV7zBM9
	XY9naDi/qo5h9slD9sh0msm803UB0TaJZzq0jWpuFz7408/EolseHdAb6RwAAYPyEE1AWBOm2O0
	mCCjD09OMnzkryyQQKcZgalTLQnKcrzwo+WYUxCM+cPqfI9uYdB8JN7GImsMFgWvr/HvmwyQcWS
	qU2I901u6/7c/MtT/vxrirEEb8t9/gSQkFRqwueotdL7kaJxno9Gn3MS1tQ==
X-Received: by 2002:a5d:6f0e:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-4958b34c506mr3764479f8f.23.1794165992323;
        Sun, 08 Nov 2026 11:26:32 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:32 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 10/13] python3-pydantic: upgrade 2.13.5 -> 2.14.1
Date: Sun,  8 Nov 2026 20:26:15 +0100
Message-ID: <20261108192623.1082770-11-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132032
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins pydantic 2.14.1 in its test requirements and
package constraints. Upgraded together with python3-pydantic-core
2.50.1, which it pins.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../{python3-pydantic_2.13.5.bb => python3-pydantic_2.14.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.5.bb => python3-pydantic_2.14.1.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
index 508414c18e..85234a7175 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
+SRCREV = "b2212c787fb5c73386dc770681ec49cd09da8e73"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes;tag=v${PV}"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.56.0

