Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C12D67874E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 15:18:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c2so10909077qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 07:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N39lxcBwC87UjdC+qIguV1fZa6QlFlWW8M5jE9ffrSU=;
	b=XufHBhpshM9KBclTNUpLCEbFbpIFn6/aT4Lt8zypdFVr/O22n6T4JPQcqocPuYJGny
	hQbUUqDSGVwBIeBRNSTzk5UwHUiTvQS86SxGgclzIBRUZyRxhnvzRmqQUTFDP1OUKpJM
	cjFG0K9CAf5OxjbLDN5WtEdFYnUGlDlMYDv40mbHxHtTfsYQOyAawG8HsK6T4bXiGkXH
	zgIdFoTilSdGnCqAry9dkHFV3zJy6Met8/6UwMRaLz11FPqrndlMLaT//Sx5h6mDxgen
	nYONOiCHeSWHzce84CAKTT8EoZMMcNT7YZlPCcxKR9qtvg6hHyZhdOW8YS+L3qtfGQNO
	SuEw==
X-Gm-Message-State: AKwxytdLidmhWGxhlyIG277KbPEdtMMSMuOFMWvdz8AqXjHT5s4/Oib3
	nbvWiLD8j0o4mjl0iVGeiCZRhG1K
X-Google-Smtp-Source: AH8x226UEXqgecdh01138W6s2rR5GfAYvmqvZbH3OlkKYkqfEYYLOJgWe4Xo2nY3/U8mqR3PQP2pIQ==
X-Received: by 10.55.124.70 with SMTP id x67mr2665710qkc.114.1516461496556;
	Sat, 20 Jan 2018 07:18:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	j61sm7798660qte.50.2018.01.20.07.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Jan 2018 07:18:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 10:18:09 -0500
Message-Id: <1516461489-3716-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-setuptools-scm: update to version 1.15.7
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
X-List-Received-Date: Sat, 20 Jan 2018 15:18:16 -0000

Update license file as LICENSE no longer exists in the package
Update checksum and verify package is still released under MIT license

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-setuptools-scm.inc       | 6 +++---
 ...hon-setuptools-scm_1.15.6.bb => python-setuptools-scm_1.15.7.bb} | 0
 ...n3-setuptools-scm_1.15.6.bb => python3-setuptools-scm_1.15.7.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-setuptools-scm_1.15.6.bb => python-setuptools-scm_1.15.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_1.15.6.bb => python3-setuptools-scm_1.15.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index 81bbf33..7a58f14 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -1,9 +1,9 @@
 SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "f17493d53f0d842bb0152f214775640b"
-SRC_URI[sha256sum] = "49ab4685589986a42da85706b3311a2f74f1af567d39fee6cb1e088d7a75fb5f"
+SRC_URI[md5sum] = "1b55f9cedde4a33ab5d286c5f30e86db"
+SRC_URI[sha256sum] = "e163e8a12d2121f77575773cfc2b5988275dc1f1d2541fdf780127c29dbbea9c"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.6.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-setuptools-scm_1.15.6.bb
rename to meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.6.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.6.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.7.bb
-- 
2.7.4


