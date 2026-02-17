Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913CCE909C3
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:14:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14270.1771341288338854391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sw1A89bo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso33094265e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771341286; x=1771946086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGv9JdBse4Qs9OQpCtk+bjDQcg31hfLoPa0e7C02rEw=;
        b=sw1A89boHd3Y51d7y05WYCie01HYIjwvbBnBbNZBWMXdsX+fzR13475hEUI8EvODTX
         Eq2jabHFjJox9Jmf5egkjyfDhLOOYZIYS/Kn5r6GVdErEyMrTSw3MJI4coPARGYTHQBS
         JoDQTxOvHRhnf3R7FDlmoyBnfW0mmCaz7k4vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341286; x=1771946086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGv9JdBse4Qs9OQpCtk+bjDQcg31hfLoPa0e7C02rEw=;
        b=caFHFLCDtKqNwe53Wdcd7Yb0hv+0o9r9N8XETti0YGpOYMH38vToJQgff++t87+aoi
         1vbF3kgF3TnVNgKEzBG7ZFL9ZPgc61LrcQ5CESDJfeAWdOekGqob9TFAMwN3GZiNOnCt
         ZC04SgOEqp7dEkpmW1fs9epesbmowxfSbbIBSjB8op+YqxMW21q8BbFygmagWVkuceZx
         ggQG5Lls4p5+09BfVVmQKPT/gxFJZA2Pe24ME8QFnoD3Fw4DTv+u++FZIYyUlBPdswKs
         NM+1cGmBPNIhVauKgiRfqeQTj/ZkvKKoHed1bYvlO5MugpTW+881397hxqfqre+1kQ2F
         IngA==
X-Gm-Message-State: AOJu0YwojkQOrBqQVlK17Th+o50kalt6AFAegLqHeIrQUn5DwaOtD5/j
	BawsHNtz6RQSuGF4b95cxbQDUyQK4S85GmXR1ujn/MubZzBxFiQf5+JeK0exxvXULwPFSxNXKNA
	TSLWw
X-Gm-Gg: AZuq6aLHUmzD1+RsDxbMMUHmpBqqZktKD7uZR6dGUnf44mmw2+7PLUtqx3nZSJIlSmF
	Z0UsmLmaHAFhwizoPSJz4JPaZy3hWb0G5lLex5ovEgW7FXrdEeD1SlCK2SXIr4VrPHTR0t3T66y
	d7rlQRijT/BlIXEIixEY6+1TJDvYKfol7gbCdcLwAZMikbXlewEczsrzdngjlGcFeD70ginKcBg
	PwiWleOBIykr3eP79X6qvUzui56ZPiBIMx6o+NIDPUBDS1R0A4lxVPiUZD+ZV57+Wv8wrL3OAy/
	uI776KBAeJhqUFVGDuOFB2G7/FirapoKYxN8bunSG74CxJEwE8CBjVmHVVMyDiEdA/vFkrgxHBV
	bYJ8pGE5lP90vzNA4UzkdvoORiG8oKy0f/WeEsZD5fBc4S0UIKCr2V4+tI6yAXqfz6TTYlPSfY/
	LFX9rS+g+HvKyDMdd5+FtLlVGFYRx2EaVF0ypaQwVg5Jt2B0M=
X-Received: by 2002:a05:600c:818c:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-48373a5d230mr223767735e9.19.1771341286240;
        Tue, 17 Feb 2026 07:14:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm32169581f8f.37.2026.02.17.07.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:14:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-flask-limiter: Add recipe
Date: Tue, 17 Feb 2026 17:14:38 +0200
Message-ID: <20260217151438.2960648-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217151438.2960648-1-leon.anavi@konsulko.com>
References: <20260217151438.2960648-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124460

Rate limiting for flask applications. Add recipe for release 4.1.1:

- Ensure cli commands fail gracefully when cli dependencies
are not installed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-flask-limiter_4.1.1.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
new file mode 100644
index 0000000000..7c2e18ffba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Rate Limiting extension for Flask"
+DESCRIPTION = "Flask-Limiter adds rate limiting to Flask applications."
+HOMEPAGE = "https://github.com/alisaifee/flask-limiter"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2455d5e574bc0fc489411ca45766ac78"
+
+SRC_URI[sha256sum] = "ca11608fc7eec43dcea606964ca07c3bd4ec1ae89043a0f67f717899a4f48106"
+
+PYPI_PACKAGE = "flask_limiter"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} += " \
+	python3-flask \
+	python3-limits \
+	python3-ordered-set \
+	python3-werkzeug \
+"
-- 
2.47.3


