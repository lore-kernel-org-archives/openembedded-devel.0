Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1887F8B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 02:26:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w62so13938307pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 18:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CctZy6jLenOijBVDhUd6yvRcaF/wuARwY/dw2x3CEF8=;
	b=U1WKp7R1Zb29DpXQQO8UQA4zBWUtBIL51boJLLimMHYnW0Hf6wo0S4MwEhqirNr0F8
	2zlzbA78a2Q0vWyQxC76rslC4TTRaRNiwSqE/+/mijmuUXTPiP9XuXqQjYPBT2VnQd90
	yfF9gA5HqJqbZzw7cLbmZ3Nry5v9j3IWzpgsaBrPLK7wMW1iXJYX0GLwUbniGcOrU+DW
	lW0Mup0QuRoM8PPR6h1aHjxH2aiRCieIA1uqCWtagtfx3X6OyhI2vEBcZ2kWfdPVqwqt
	DyVx+J+KdlSkO7Dc2nr0UQq+j5STqZbbhPrNejW+p1eoXJWcs6cb5KeeM2zVX+cB30Sn
	nbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CctZy6jLenOijBVDhUd6yvRcaF/wuARwY/dw2x3CEF8=;
	b=IlMExxe3yAfrKvwa/tu8ejVDg32kDdjpfHq+l0RyGHbYi+TgOpJ41W9REg4Mr/EybG
	znvmhLDcLQGcrz/KtkY1KWUmOeR75dLm7n3U6jX665c0JnafynkieQ4xqIknNFCiV4cF
	ai6m22PcY4D/HMhMTkhHYh79jUqJO7SUAIHJnwjPIoFF6AGS4zP6vrF8QXJ+9Xkih/V5
	XIM491vJvQaHhqqHORN5H6cqEGc09xAUmb8BoWlxD5rNTPys5zMXQ9+/s7XCIiJLTID1
	o0Jad78d3Ym/GhwNttG/Mh86L1joMFrBFZdxfreb+4tlFmqfWcsZJ+XBwVxPXenwLlmK
	2hHw==
X-Gm-Message-State: APjAAAWAnZFVGBCoYTxb6B764iJP7k2YhwvW54dHPJJFIihvjtBXTz92
	Ye/OYbJAtnUWam4A0nBUin2MNuTdhFA=
X-Google-Smtp-Source: APXvYqxovLT7aO05WZrg/7r2dApRXhlR/2qdC/kUBMi979SeVndbNiz+5VD9F44IjH6QmfFnV9AkoQ==
X-Received: by 2002:a62:be12:: with SMTP id l18mr11005807pff.226.1579400795464;
	Sat, 18 Jan 2020 18:26:35 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	t187sm34436426pfd.21.2020.01.18.18.26.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 18:26:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 18:26:28 -0800
Message-Id: <20200119022628.39901-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pytest: update 4.6.6 -> 4.6.9
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
X-List-Received-Date: Sun, 19 Jan 2020 02:26:34 -0000
Content-Transfer-Encoding: 8bit

Upstream release notes:

* pytest 4.6.9 (2020-01-04)
  - Bug Fixes

    #6301: Fix assertion rewriting for egg-based distributions and editable
           installs (pip install --editable).

* pytest 4.6.8 (2019-12-19)
  - Features

    #5471: JUnit XML now includes a timestamp and hostname in the testsuite tag.

  - Bug Fixes

    #5430: junitxml: Logs for failed test are now passed to junit report in
           case the test fails during call phase.

  - Trivial/Internal Changes

    #6345: Pin colorama to 0.4.1 only for Python 3.4 so newer Python versions
           can still receive colorama updates.

* pytest 4.6.7 (2019-12-05)
  - Bug Fixes

    #5477: The XML file produced by --junitxml now correctly contain a
           <testsuites> root element.
    #6044: Properly ignore FileNotFoundError (OSError.errno == NOENT in Python
           2) exceptions when trying to remove old temporary directories, for
           instance when multiple processes try to remove the same directory
           (common with pytest-xdist for example).

License-Update: Update license year to include 2020

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../{python-pytest_4.6.6.bb => python-pytest_4.6.9.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename recipes-devtools/python/{python-pytest_4.6.6.bb => python-pytest_4.6.9.bb} (84%)

diff --git a/recipes-devtools/python/python-pytest_4.6.6.bb b/recipes-devtools/python/python-pytest_4.6.9.bb
similarity index 84%
rename from recipes-devtools/python/python-pytest_4.6.6.bb
rename to recipes-devtools/python/python-pytest_4.6.9.bb
index a9b64922..c1cf0ac3 100644
--- a/recipes-devtools/python/python-pytest_4.6.6.bb
+++ b/recipes-devtools/python/python-pytest_4.6.9.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Simple powerful teting with python"
 HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI += " file://0001-setup.py-remove-setup_requires-for-setuptools-scm.patch"
 
-SRC_URI[md5sum] = "0cf02e80d916a81a3d4fa425eb8063c5"
-SRC_URI[sha256sum] = "692d9351353ef709c1126266579edd4fd469dcf6b5f4f583050f72161d6f3592"
-
+SRC_URI[md5sum] = "d0457c5ddd0438e3b68b7939339d915f"
+SRC_URI[sha256sum] = "19e8f75eac01dd3f211edd465b39efbcbdc8fc5f7866d7dd49fedb30d8adf339"
 
 inherit update-alternatives pypi setuptools
 
-- 
2.25.0


