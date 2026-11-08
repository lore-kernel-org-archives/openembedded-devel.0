Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2944.1794165956056704226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso171165f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165954; x=1794770754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+nkefYpeRZCtmR7YlatoilnCk2IrvR0bSRODDsU0aU=;
        b=0X0BwPwF82vif/xICcoOUbrz1h8lStBtad9Q6syRl70QaOSerCZ9NhTeima7QJE210
         72trkMwXOFvdwpC5yqT7jW9C3wCObSCP6EEUgABdtODwX9vf/zI3RvTG+wqwQ3Tl56Ri
         Uo952xdjHM4/OBEaWsQ+l6zGEdXCS72DE7dnJC2d7CR2cGRYewJI+e+hrjlkVeEPIZK1
         ylBYbF6ucZOae2P2yHF+cFchMVhgqkGZJc8I6PbE6stcT8TpVb92KSMZRtoL4eZMUbkI
         2eQDNCjE5I6XmrLlGZXs+IOkF9sfc6yEy6lCKHO4qrEKJdNe/rqUsUHjuxmfR7dXlFLa
         yvMQ==
X-Gm-Message-State: APuU4Z8KAU/jXjFifzC4jCgcDkFFo4xNUF52XxxgsV3y6aAuCP3Rg5Y8
	bddGz/t9adGYmOBS68m6bUWn4KSc0iEvmdBh/+Olml9ocYMWQp4A8W1/px0wMg==
X-Gm-Gg: AYBFou3Jh6dnDGM1Mk/uWBm9Bu5jPFFk5jKYycN5OH2MsBzHuCgjTxUzEjfmNALQGJw
	0h+ZAAkEdl1aU9uJrWho4B0SRWudVRRH3ky+m8r+GXtvoZ7AC/jPsO/JUKuFfD7Tdk4o6b77Hmj
	HrqURZEcFBu6A11MzPFMD14mIgEjjuH+NJup0krfYXFPXHjVReVVnS1OMqxQS+m6Sc4iZdsY2Fk
	OW+C7VSF3+MvAAjfBtV69E9ku+Z2INZJ9v9zlE8U0w0pOMMFilFGZWuPvKZVBOuhy+AY6vxWLfM
	7ADdSr638Kay3l5ybx/oIaGHKUT5jkXCsaQwPdsen6Nduzf9wZLdrWqPduv+VZba/jowrRcVN3V
	78XkbE4kvGg/SNNBDGBzMWm1iR01ogKtNNXQWsXUHe2TNx48QcGL4ry2stjwpTUgs4444/3QCE9
	mWHsBWDHOEHWj9FsntjeG4xyPfHIS3WKh9cj7mENBQgZo8PLvjaOxwYuj0SV618AYlBcylOZqRX
	2zMqHLfPx7Y0JXNB+iLt00Umd5Nv9/hkIQyqLJD8WRIcvoOf3uKRrMZvRv6m12tHkUn8EBL3TKG
	7LOZFPSTiz11vFlxXuuvbMZHa4EZHw7ZRqojlYb9F9IO5k8vEg5RihYnpZfqBwNb0Wyd9eE7uuN
	vG32To63hf0okvlWf+6cQraqEErMT8tvx6rTU3JWhKoiYbaGR2zel5bbh3g==
X-Received: by 2002:a05:600c:4583:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b963c77f6cmr53258765e9.15.1794165954234;
        Sun, 08 Nov 2026 11:25:54 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:54 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 2/6] python3-pint: add missing runtime dependencies
Date: Sun,  8 Nov 2026 20:25:45 +0100
Message-ID: <20261108192549.1082715-3-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132017
Content-Type: text/plain; charset="utf-8"

pint requires flexcache, flexparser and typing-extensions, but only the
ptest package pulled in flexcache and flexparser, so "import pint" fails
with "No module named 'flexcache'" on an image without the ptest.

pint is extended to native and nativesdk, so flexcache and flexparser
are as well.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 meta-python/recipes-devtools/python/python3-flexcache_0.3.bb | 2 ++
 .../recipes-devtools/python/python3-flexparser_0.4.bb        | 2 ++
 meta-python/recipes-devtools/python/python3-pint_0.26.2.bb   | 5 +++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index d46f9eb16f..efdeaabf1b 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
 	python3-pickle \
 	python3-typing-extensions \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
index e4e15d1a35..7ab1c713f9 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
 	python3-email \
 	python3-logging \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb b/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
index f370da6a57..dba437a0dd 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
@@ -17,15 +17,16 @@ BBCLASSEXTEND = "native nativesdk"
 PTEST_PYTEST_DIR = "pint"
 
 RDEPENDS:${PN} += " \
+	python3-flexcache \
+	python3-flexparser \
 	python3-packaging \
 	python3-platformdirs \
+	python3-typing-extensions \
 "
 # python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += " \
 	python3-appdirs \
 	python3-attrs \
-	python3-flexcache \
-	python3-flexparser \
 	python3-misc \
 	python3-pytest-benchmark \
 	python3-pytest-subtests \
-- 
2.56.0

