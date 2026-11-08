Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2943.1794165955648781327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so165345f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165954; x=1794770754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsEzfQGJ7C5FAXZNu8G+SS+W/2pNgZ+pYFCPwvYneNE=;
        b=KcuH4qeMqcl5d62enPgLDL38eqhvjHNcZ3JRAhY4zsfvZVwJh3Px+uw5UmpVBkbcbg
         A0R42VIYje5K4/ZBFBZjsWdXL7uzKqNeUdAi7JeWJ60Q7zdA4tOm+T9KMSaakVeLqDqm
         16guX95WGxWA1Rv0oFqLt2HQkIkE/VaGWWXuz29rp9v17Jd8wlxr0vDHqZszdyVK0QFr
         MlQiNkHTKXqkeMAxx7ymo21k3TmccxXEDzLcMxEtLshiRmrCZftu8F9v/rDVCPwAvokB
         p2SB3RnnXGmfr8dNxeOyDdzGlbxRnHmC2g4SBiXngpvYp+xLlXxsSkEAnYdCBYgTcNs3
         9g/A==
X-Gm-Message-State: APuU4Z/mC0oPbGHkFGqTopWxZpPJmkLetQrS6Lgu+X3QQNsG3MBrLpZ9
	xFziO9Q7fCi3Qf0mZvnQ7r0Xx8JLMQOBqJbt75ciPfmO5+oVJcl9pQbpFsdHJw==
X-Gm-Gg: AYBFou2b4Frtn6bH14fkZlbXg7TS9Fxm4P+iyu7mfsHvLjCJwSoAFjvGbDXj/zb+ytp
	cbNWagsmptKYLbfr276GL2NxfIohafBkSr7dRV9nxBHLgNXsFE1B2V/5A6RgCTlWGhWMJUHhLbv
	8a//PlNj7P8ZwaCvxRWmG3HgCRGs8SNw7iuhzlHXSSq45UAS26uCII6H12Z5y2HWT4znN5iMvKX
	IqpzYbWLxcxY+uEydJuY/Vb3JeaWWN57UaBU+uMKuC94p9F6Qx2p+0lKiXJxYh5Y94rE0CvpFkz
	9CC2JpgZWQCTV4IYWVomCzNvNDXZtPZmzqcyaq/TYDkUf+vO8fEkEqFKPklbdMwAlZ9By06KR1M
	Q1qbHV45e38/9M/kZYKI1A6qC0VYDwgygQfAhTyXNspB45RwUnCLP9RECiUEodojibpYafNDdBQ
	fET4YDHTXSlVH1fTSl6LLiXm/h2RWy6J2cErGS+CbRhmEVKK8O3iEnXeWgq+TSJqf+UHxRiXs9s
	JS1AmmN34vTsUEDUHcTaOmQcewVKgcZM1q3fvhKfdVB4bNpPzuhyabSVOqS9cDn1wp592LLJH8T
	Or6yvJJU7QwZynm7AYITBwZRPDISO4Sr6QrXYgWUSMi65bwubLBvZ6RrntRE2m/ItbxXKL5BNxi
	7ymznMjGcEMurc6S+f6zApnlWKkRNgToubtraMo+1Im/ODswRGTYDY0xPOA==
X-Received: by 2002:a05:600c:1d05:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4b963c7585cmr40690125e9.26.1794165953709;
        Sun, 08 Nov 2026 11:25:53 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:53 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 1/6] python3-pika: build the 1.4.4 release
Date: Sun,  8 Nov 2026 20:25:44 +0100
Message-ID: <20261108192549.1082715-2-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132016
Content-Type: text/plain; charset="utf-8"

The upgrade to 1.4.4 only changed SRC_URI[sha256sum], which is unused
since the recipe fetches from git, so SRCREV still pointed at a 1.4.2
era commit and the package installed pika 1.4.2 under version 1.4.4.

Point SRCREV at the 1.4.4 tag commit and drop the unused checksum. Add
tag=${PV} to SRC_URI so that the fetcher checks that SRCREV is the
commit of the release tag.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 meta-python/recipes-devtools/python/python3-pika_1.4.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
index 2c18659eab..c4c1bae8fe 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
@@ -8,13 +8,11 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "8cfc8b33a5cb16e733bd60cffca9732c0d1d761ecd80a89f34ed7df2cd38d6d6"
-
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-SRCREV = "3c9b50d4167e436c73cecae8127e3c5b266b2fce"
+SRCREV = "60fee4203a30d5dfa0500857cea6a65ef571d46c"
 SRC_URI = "\
-    git://github.com/pika/pika;branch=1.4.x;protocol=https \
+    git://github.com/pika/pika;branch=1.4.x;protocol=https;tag=${PV} \
     file://run-ptest \
 "
 
-- 
2.56.0

