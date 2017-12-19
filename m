Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCA01783F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:19:15 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g9so24309068qth.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dD0W1mxlb7sGzNJ8Cun1yXhLGmlf3UGNCCMAx6Yn+Ns=;
	b=MnSL6r1IokSoJc6tYQM5Mi9Jf961yKFBS0lM/Gx6cpBM8EaXgwIhwR2MokEBZURwhR
	In1Bl+G+/9pguCf/QG5eqNDwQHsiwhjWt8+iQYNgs4mZXrGgfQBkvlHxBq+xzqfBDmW4
	0ZW3lbMTKBAvgyKY83CbEy6nd2dpWLQXPjUNZIGTaaMZrfd1QLu52ojKUdBGSLidqqWu
	sjkO4xXxEHH81sUZWUGrGqXKDHHlNEkeIZgztakA8gWBoR+ZKUKD9dzN1rTHO/ET+Sbz
	YzpRrLiT4ofsKoAnJDLlhKZeQZTHsyL3uyzv77rdESjE6K2gQ9xsb8+ZZcESvLDwchqF
	wRMQ==
X-Gm-Message-State: AKGB3mIIVUCM0wdQpL9u6Yxr2YzI5fii3420rKr7z3LsIb/Ow4Xt1by/
	/EIi4TrcX7pR4CGJlRI3xLgxQFiN
X-Google-Smtp-Source: ACJfBovmLoPK77aYzputAJx5HCnxQhQpmBdrmeeUE28Di3yhkd+ianupxBEf1kCrUlLgtfwfARFMUQ==
X-Received: by 10.237.39.211 with SMTP id m19mr5147088qtg.234.1513693156299;
	Tue, 19 Dec 2017 06:19:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	a126sm474781qkb.83.2017.12.19.06.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 06:19:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 09:19:08 -0500
Message-Id: <1513693148-6714-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.4.2
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
X-List-Received-Date: Tue, 19 Dec 2017 14:19:16 -0000

Create a tests package
Update RDEPENDS

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc       | 13 +++++++++++--
 .../{python-psutil_5.4.1.bb => python-psutil_5.4.2.bb}      |  0
 .../{python3-psutil_5.4.1.bb => python3-psutil_5.4.2.bb}    |  0
 3 files changed, 11 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.4.1.bb => python-psutil_5.4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.4.1.bb => python3-psutil_5.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 23f8e07..a50d905 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,11 +2,20 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "c0aa7823e416b4e2ee908c2d387d2662"
-SRC_URI[sha256sum] = "42e2de159e3c987435cb3b47d6f37035db190a1499f3af714ba7af5c379b6ba2"
+SRC_URI[md5sum] = "38aee50427a58533064491286dc2e3c5"
+SRC_URI[sha256sum] = "00a1f9ff8d1e035fba7bfdd6977fa8ea7937afdb4477339e5df3dba78194fe11"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
+"
+
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.1.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.4.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.4.1.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.4.1.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.2.bb
-- 
2.7.4


