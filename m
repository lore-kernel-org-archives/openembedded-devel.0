Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE5E9B25F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18701.1771933482025974301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DAvdTO/S;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362197d174so3453486f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933480; x=1772538280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DNvv+eOPSgZRiK+IIMzichMM21t4WDlAUMh2wEx+mY=;
        b=DAvdTO/SB5AdiWL8dWpLrd22hTaHeczvtC0WjZShBG67H5HhCD0/+laG7ouQ08tzIR
         yZbBlzL7F9ytAb8gkepF5yLs4B0qzFeBtNHDk53EaX6f4J0Y7Zu08uOR+SG9UaX3Upri
         3vb2BcarFWGKfV44ssjj7r1Kjk0bGVGISNj30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933480; x=1772538280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DNvv+eOPSgZRiK+IIMzichMM21t4WDlAUMh2wEx+mY=;
        b=H/wek0LSYL5rWTT2UNQQBIMTNLyeszkrec0mRu320uddEkRaksA0R7Q8K4e1yyqiZU
         xEx5Tdn+aMCICKdqxMHEUxN9qjeu/5iJ1rvc4ahFia/soHqtHUBoapCwj7oYxUodAVG+
         KUcp9Z/gOzHPviCUvAdEcYSTtWH9t9dqU59zso7NV1zQDEkjywC/XWUoQmBoEFNIltPK
         Z6OFqwr4m9L1X1U+6tqFEvNIIPp3Y7A/9O1krIS2KVKMDJ2MfZdYvyBWfKLPx6MB/Z6G
         x+DpXs5DN4AVMXD0W1VpB1mOQFiGGzfBocPPLIuKjk/CgXwgBSwfMOR3HBHaoV9sSB7v
         XaKQ==
X-Gm-Message-State: AOJu0Yz+y9UhVG5Xbps/RMZvPmh1BW8hfFW4nNFjxVtGKV7AwUjZ4f/N
	nqxp4X/MIkKHxgvg1r/On4M8Wbpk+wUCXmnqsSXkFy8nBDbfJEc1H4Tcu19dB7Ws2VEGrOyCteE
	7P2yW
X-Gm-Gg: ATEYQzx7ETgqCbV9GIYA2yOOMVuImxnOBaNcV8q8ssBRdu05wS1TRWcsXSIkrwX1D7A
	6mqwd01Q1cpPwd1CswXrC1UgyciO1dYqDg3OeO/rT6w3y7U68s02+XtDPVvNTHM/oNOSI5H4gJc
	Hh+gdgyJvqWGCj6DANbcj/rfLzYrPeaac8bl25ic3HVUC8OKk/xnLv9KSDggnD7a2mv8umkw0rg
	wV5F7LaAeWyP5ajkVBiLldj9mo7qBbnHAVQ9XB8UC851JhFsKF8fFqSl6GwAgFFlRhXJfRrz3D+
	YSNO1CrSBqXocKigh8yKYbSPXL+N9GnRKhB952sWzxdPHsEqUoDxuKwsrJt2NjwffoUFeLRRkwu
	4ntBzmNBNKph6IHxqaz8C4h9oFZMnPRIEFZrvIX7K50mGkVrVET/DHGu0lVp/X8EWmqUBQbc6n/
	gjspp17/uHEwiHpryt6MhoyN2y3+YRnmxu7Sz8
X-Received: by 2002:a05:6000:2c0e:b0:437:6c2b:2f47 with SMTP id ffacd0b85a97d-4396f15338bmr21807165f8f.11.1771933479982;
        Tue, 24 Feb 2026 03:44:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/8] python3-flask-pymongo: Upgrade 2.3.0 -> 3.0.1
Date: Tue, 24 Feb 2026 13:43:47 +0200
Message-ID: <20260224114407.1760757-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124580

Upgrade to release 3.0.1:

- Fix link rendering in readme
- Fix handling of _version.py file

From release 3.0.0:

- Support Flask 3.0+ and PyMongo 4.0+.
- Support Python 3.9-3.13.
- Support MongoDB 4.4+.
- Add support for ~flask.json.jsonify().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mongo_2.3.0.bb => python3-flask-pymongo_3.0.1.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-pymongo_2.3.0.bb => python3-flask-pymongo_3.0.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
index 75a52a033e..7773e2830e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
@@ -5,13 +5,17 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
 
-SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
+SRC_URI[sha256sum] = "d225b51c21ceca2e670e6cca79b5c584ad17b96252b48e84e3b423ddb73304cc"
 
-PYPI_PACKAGE = "Flask-PyMongo"
+PYPI_PACKAGE = "flask_pymongo"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta python_hatchling
 
-DEPENDS = "python3-vcversioner python3-vcversioner-native"
+DEPENDS = " \
+    python3-vcversioner \
+    python3-vcversioner-native \
+    python3-hatchling-native \
+"
 
 RDEPENDS:${PN} = "python3-pymongo python3-flask"
-- 
2.47.3


