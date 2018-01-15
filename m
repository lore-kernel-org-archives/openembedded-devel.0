Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 23D40786D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 81so11573021wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B3KO1t2y7cP4PKGtlAe8k3y/CrW8g+Y5h5BzimOui9Q=;
	b=Fc/+2ZhQGcLxuNLKOO5GlHUv+EQwKJqgBvvWud27Sez0bYfkCwdycz6R5N4ncTLSUd
	dbunHX72y1Zo/FCDl4JcRF1xYxCxzII+EgcMU+PdqANQpRE6QM1bGCakQngeKkGEE2v6
	x45Z4qmBLs2PIfv0fZRufQ4SQ+Bts6HqDisI2ZpmmyZFcdw4U5bIGNQA5ozfcic+DG94
	Atr3zMccLnxlQkVYvek0nEzGqKn/1kNrBKOw8jvmhxX4xAZz16EoEIFuN7O01TxEyvZY
	JDWVXSP8JoQJK9Zy75f3q6JGgsTJEKhLEFmeMROD2ExBPro6mKNEF8HIgYKaQb4K9GUr
	S5MA==
X-Gm-Message-State: AKwxytfhIYHlGb8t+yJA0gVc4rNXl1yzPDbrmGOSDmntbcm9mQa0g0qt
	WqbmSzPTkmlrpFmNEMTRgz9J1Rzn
X-Google-Smtp-Source: ACJfBosuUs4QRrTvWw2Hi7t2H11qZ5xcsv/JRxV5wVDQaBD01tenxoF/PHIDRYgWh/zmkdH9T0uRdQ==
X-Received: by 10.80.204.4 with SMTP id m4mr1639891edi.146.1516007653742;
	Mon, 15 Jan 2018 01:14:13 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:05 +0000
Message-Id: <20180115091408.1133-5-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 5/8] python-ujson: use beginline= in LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 09:14:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.
Also, 'endline' was wrong.

  python-ujson: The new md5 checksum is 88df8e78b9edfd744953862179f2d14e
  python-ujson: Here is the selected license text:
  vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=8 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  License: BSD License
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=8 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-ujson.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-ujson.inc b/meta-python/recipes-devtools/python/python-ujson.inc
index 9654d5ad3..c3d0bfeed 100644
--- a/meta-python/recipes-devtools/python/python-ujson.inc
+++ b/meta-python/recipes-devtools/python/python-ujson.inc
@@ -2,7 +2,7 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=4f369b3c3c290b4aede8796a4065e5ab"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
 
 SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
 SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
-- 
2.15.1


