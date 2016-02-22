Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 66AA6770D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:29 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s68so55220470qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P6e75UlMWzOY+YefjpvP0d+4PKpqHQr+Lumyd/MG+h8=;
	b=CW10fdangMoX6+d4lHhQEwHEvSJhVoSyswhI7Bi3P1D1BeaW2UGTJbL0j4y9qUqZE5
	/MLJ5ByY9fIr0tRZPc6p8Yx3XPE4650Y72EfZSGUheSrSGH/kbajq71Pmh5ua6Dsd0+7
	5OKiDlEhGfUE3u0HICh3kEXqE3fZuXuvYNirVgo0kAihUBlcFAjbdkHuG+0E0aF3MeML
	A7Pu/pRKj0z6kFMfEw20KkM1IricqmvFTEYHuPJdzo+WV94oolMau97zGT+ndonOtM1B
	yxaz6xkLjqkR+dKOPXSVGpsagM8bD+xWs2bN5Pem/bhjXj/xyVsLlJmWvzlA1l1WqIvR
	ooBw==
X-Gm-Message-State: AG10YORxkYlj74g8FikLiSAnxjaIEUtM/lnkfnUkEPOqbGEWsRZnsZZV7jamntqQS9RsDQ==
X-Received: by 10.55.82.70 with SMTP id g67mr34295655qkb.57.1456148129836;
	Mon, 22 Feb 2016 05:35:29 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:34:55 -0500
Message-Id: <1456148105-9644-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 01/11] python-ujson: update to 0.35
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ujson_1.33.bb => python-ujson_1.35.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ujson_1.33.bb => python-ujson_1.35.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-ujson_1.33.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-ujson_1.33.bb
rename to meta-python/recipes-devtools/python/python-ujson_1.35.bb
index dbe432a..29207f3 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.33.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
@@ -2,13 +2,12 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5b206f6ba5e41c60df8cdcddf79a3d82"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=4f369b3c3c290b4aede8796a4065e5ab"
 
-SRC_URI[md5sum] = "8148a2493fff78940feab1e11dc0a893"
-SRC_URI[sha256sum] = "68cf825f227c82e1ac61e423cfcad923ff734c27b5bdd7174495d162c42c602b"
+SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
+SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
 
 PYPI_PACKAGE = "ujson"
-PYPI_PACKAGE_EXT = "zip"
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-numbers"
-- 
1.9.1


