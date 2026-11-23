Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55122.1795444536518666689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so31675665e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444535; x=1796049335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0npYLaBYt97MMT7mEntgxETsB9/T8M+GMa6yWx03k4=;
        b=JOXpaYBrS9Y0pvG/YMpNHhxfiEX52o3APkzwtYoHhkV9DsUWGQHuGJs4L5aKv9B/2A
         cfUHwUUDP2JtHZJSfBcMJOwtddchEAMPuF1WzAqymV0IQQC+IBM6Mw1Fk+ZTVRpFgP6m
         nZEi3SW3HOf4wkCeJ95sCL0KElgLgDeip4L7OE+abH6x4h04J1RFihwuYrlUzrd1TvHk
         nDzxsQkYjjBf4jXvgByhTQRpJRlN6BDKLbj/+4+Go0ntzJ56JQKGimk8BciRy4KiVR0M
         5tC5I1WWXbARJD8SzVFkIf0i2pHzhiDg+JIGNL9mcc93HHVIhwcYHVe8N/WLvXGgTMTd
         GDuw==
X-Gm-Message-State: APuU4Z8CJGH9Ft46lnFi0cA/tKQ1WdP8zTREcKvUAi8nF/AtbQZ/G32T
	YC5jmXfwdq91REcZFNiUwFagiaOAl7HkhyJa9HIbA1yIiiC0/zK4cn8WdcNuWA==
X-Gm-Gg: AZFdTZfZA/ohhRZcVtzuOtoYiX3VAigjXEaStgvjI6HKgz5AlStzc41Gpg2kLw/Qbki
	zdhuTrqRTlJ+35mixJhHWhre03BtjuKb7gPT5ZigVt9zd20DrNWG+SNX/bGgg4NZJ6+is/pBV/T
	wmXkSa36fFyCx4vkbPJS798Vp9BmXKwlycjDAY8ErP8Zq0C97mbUdK9ddgRPqhT3lQxMpHwcTRs
	KWOwQUGkqPrVfS4/CsrNJv+lnsrU8fNOnWZoEzZ9SzxRjjrHmfnQjnuDzXALqfhyMU3HM0MB7k+
	VdzR+f/gNIp74np6/r2t7sAk3YNxnSg4unFHFxPWkyq5+APZLCG53p7AfHtjvA+Xu0WheKpp3Fl
	egvyIbcx3ojjTS2chOcEvGycnE6Pbt/4VIs0uwqwZcvuxwqlp+vzR907nvIzaQ36pp8cvYL9o83
	qwyZDRh0IfoSqoI1KaXEKZG/E7PI9PV4zTZBrp8FX7LAvcPL4fai9LJqXTerQ9/8DaRZ86jkBvZ
	o02EDTUyXKNRl03sq/PgYq3OG4LLIpjB8/PZgejIwPtlsthtP9Qpq9QL5bxRHUJAbSiVGKAhOBw
	maw7D9nLdZM71frwiKnxLJTX/eOKlYH26vKHISrl6bP3bvY9/ySdVvi4GgmxMfeKvb1z9qGYlg5
	jFNMusE9LtS6Po413KwvxGo1vqezsDb04tM1i9sEhGg/EETMrS5xjLkSm2A==
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb887e220emr234032785e9.2.1795444534700;
        Mon, 23 Nov 2026 06:35:34 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm168368555e9.0.2026.11.23.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:35:34 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH] python3-orjson: drop maturin and mypy from RDEPENDS
Date: Mon, 23 Nov 2026 15:35:31 +0100
Message-ID: <20261123143531.3985105-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132901
Content-Type: text/plain; charset="utf-8"

orjson has no runtime dependencies (its PyPI metadata lists none).
maturin is the build backend and is already in DEPENDS as
python3-maturin-native; mypy is only used by the upstream type checks.
As runtime dependencies they pull rust, cargo, gcc, g++ and binutils
into every image that has orjson: about 630 MB on a Home Assistant
image for raspberrypi-armv8, most of a 4 GB rootfs slot.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---

Tested on top of master 2b551b71ca for qemux86-64: the python3-orjson
ptest (meta-python-image-ptest-python3-orjson) passes (1633 passed), and
meta-homeassistant's core-image-homeassistant-full, which uses orjson,
builds and passes its testimage without maturin and mypy in the image.

AI disclosure: the change and the commit message were written with
Claude Code (Claude Opus 5.5), as the AI-Generated tag says. I reviewed
the change, ran the tests above and can answer for it.

 meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb b/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
index cad988c2f7..36a2054d94 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
@@ -18,8 +18,6 @@ SRC_URI += " \
 "
 DEPENDS = "python3-maturin-native"
 
-RDEPENDS:${PN} += "python3-maturin python3-mypy"
-
 do_compile:prepend() {
     sed -i "/panic = \"abort\"/d" ${S}/Cargo.toml
 }
-- 
2.56.1

