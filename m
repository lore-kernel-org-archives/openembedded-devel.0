Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAD76011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:04:26 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f24so1058976qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/9cFySQjYIWpUGZBu6wHY3p9rPUUNHbyCH/u7HyZE70=;
	b=CgE5PN+E4a5Z30/zWv8ecMl0KJUl9nDzsUuPAEmLjS3pzspl6L9vwChrHydi4rUd40
	jygy/tPgMdfe7BJy71IRABp2hia2tJSrdPQrvW47avJE5ubesnSzHMO+rvtdnS1ax1Xu
	onrRRC6ZRJeuI/Tk5L4QIbk9DOO0wk1fnt0jecdvYpStx0CdrrOyu4roG7SInd4iiTjy
	Odr6boZDeVmfDtJKG+I0CdDWU56/EDTjNa2GhG0//g43+vwltW7OqJxyihq8BYsFl06+
	oKVe6/9hk+pSW7wpMFU5Ed28UN2ydzSeXD7wapvsk00teRQicb2PUjTlsUKg+v/zBw4t
	YOQA==
X-Gm-Message-State: AHPjjUh1Jhx3iFx4zAGB8glplPw5LygSIIJsgYJmmfJB1YW7bMcUnLLp
	w2SD6vENDj7BdIA/Dgk=
X-Google-Smtp-Source: AOwi7QB24iMw4JCRLHIwIRHZPSe2V7qLMV6XbTaU3tdZmuDOOd/ZnPrWTH/VmvSYLM0BDr6szHnHCw==
X-Received: by 10.200.38.68 with SMTP id v4mr40505912qtv.128.1505765067150;
	Mon, 18 Sep 2017 13:04:27 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	n12sm5571029qkn.83.2017.09.18.13.04.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:04:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:04:19 -0400
Message-Id: <1505765059-7918-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.10.0
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
X-List-Received-Date: Mon, 18 Sep 2017 20:04:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.10.0.bb => python-cffi_1.11.0.bb}           | 0
 .../python/{python3-cffi_1.10.0.bb => python3-cffi_1.11.0.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.10.0.bb => python-cffi_1.11.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.10.0.bb => python3-cffi_1.11.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 8b5e952..2d1f18f 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "2b5fa41182ed0edaf929a789e602a070"
-SRC_URI[sha256sum] = "b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5"
+SRC_URI[md5sum] = "2c5939cc2fa0183fe0c2fcb6a4f1994d"
+SRC_URI[sha256sum] = "5f4ff33371c6969b39b293d9771ee91e81d26f9129be093ca1b7be357fcefd15"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.10.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.10.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.11.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.10.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.11.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.11.0.bb
-- 
2.7.4


