Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65659780CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 19:25:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d4so52160346qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 11:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YBCzqXAg359CStE5InX9BUewp5v6r40l0/ZketgNzUA=;
	b=Qvrhj5/Tl02LyYsNSxSHHkWhenOdbGEvcXVbfrD+vVrEgkHHcRaTqIy9tW+lhnk7cC
	MFhx2zdrT9m2FDi9VVG7BLl1xzJXXq76Kr8TNf+34TrssX+SLbwLhRBn3u/slrqRCuEC
	KHhPe2hRJ8uE+0rBZs8EkE+Qh+PJBl7miEiBfex/OIPTaXqO86MCT6LkScjfLeh73B5K
	XsKovyfxgeYmqJnNtD9jHUtyAxZbvWh0QfjDosHpoO/K6KTJlUwcI6bxpRaX6Tz3AF7u
	jrj9uvjcyEIRuE93KXrs4mxTQUoS0Kr5lzthuJ/DCwewul9GOS+FZ+gmO1nTIH8knoxb
	CK9Q==
X-Gm-Message-State: AKGB3mK+3ItGk7v7oYNhLGVBYDAVeDOpPqwCPha/YQSL89CbDWVb18ss
	1vHbIee4ymFd4Wa/B+JWRJWJKGBo
X-Google-Smtp-Source: ACJfBosc6X6jnWCLe/MzmpQ+u4trGJeQCiN4nag7PnqK/hyIEq22aj5bTB4xskMptKw29iUarUhLBg==
X-Received: by 10.200.40.66 with SMTP id 2mr43858245qtr.177.1514489158103;
	Thu, 28 Dec 2017 11:25:58 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r55sm23765371qta.57.2017.12.28.11.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 11:25:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 14:25:42 -0500
Message-Id: <1514489142-25603-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-whoosh: add RDEPENDS to work on minimal python installs
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
X-List-Received-Date: Thu, 28 Dec 2017 19:25:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-whoosh.inc       | 11 +++++++++++
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
index 0a2cf3b..f43d8c1 100644
--- a/meta-python/recipes-devtools/python/python-whoosh.inc
+++ b/meta-python/recipes-devtools/python/python-whoosh.inc
@@ -12,3 +12,14 @@ SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b4537
 
 PYPI_PACKAGE = "Whoosh"
 PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 5d8af30..4a4e679 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -1,2 +1,9 @@
 inherit pypi setuptools3
 require python-whoosh.inc
+
+# Requires _pydecimal.py which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-selectors \
+"
-- 
2.7.4


