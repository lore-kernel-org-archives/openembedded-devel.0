Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C13C474598
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 15:52:08 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4-v6so1670748qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tI0l9OCpPOAX7WudH/6BXHymnzqZTWISoOnYFwY6OSo=;
	b=A3mmiwcq1KhGWoXBdnMI50L+kOVRLISiriIBPHdk8eO4jk7zvzJsxhIYAyGhidYlcD
	wBu5DPRFdYbcj3ldkUJboR/qPj0UsAY6OKRPJBYrJ7X2Y+0cfBe8j0o6JkOfLX/k5d5N
	1u1o0Sqh8GOaZlNMV3qZuVRRJ7WEhJQjlN8wlDGKlln+DoJgM23b3zX8m8N19uksWLy6
	Mc3YoQFD8rY5zMcsnLrTsaoxuIMlxanTWqNnBGHUqvl30DxNJWAK4xK/5vMoaCW/ufzX
	hFrxAZ258jThNDO6gPLzWb0VxV1v4rXZoEtfuorvgDSyJN5fGM754xgihkkAtqwWbwaO
	P2Mg==
X-Gm-Message-State: AOUpUlEJ7z90UtFG33w1xYFERrK2//wLlP5siH4jWQXP9MufZkhsGfwd
	qBBkA2E31QGZ/IY5DpCmIr72Y6NTEw0=
X-Google-Smtp-Source: AA+uWPzYdV1wdWbpFJQmND2ncJj+t6dNC38BSYfLir5ZfkQu8Gvg9W69rCMBN6AmgteTI6z16uHgSw==
X-Received: by 2002:a0c:c963:: with SMTP id
	v32-v6mr23287268qvj.215.1534348329021; 
	Wed, 15 Aug 2018 08:52:09 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm13978689qkc.20.2018.08.15.08.52.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Aug 2018 08:52:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2018 11:52:01 -0400
Message-Id: <1534348321-7741-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pip: update to version 18.0
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
X-List-Received-Date: Wed, 15 Aug 2018 15:52:08 -0000

License-Update: Copyright year changed to include 2018

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_10.0.1.bb => python-pip_18.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_10.0.1.bb => python-pip_18.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pip_10.0.1.bb b/meta-python/recipes-devtools/python/python-pip_18.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pip_10.0.1.bb
rename to meta-python/recipes-devtools/python/python-pip_18.0.bb
index 5aaf818..6b943b0 100644
--- a/meta-python/recipes-devtools/python/python-pip_10.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_18.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
 HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f8d33acaac5c5dac8c613904bd56a6f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=593c6cd9d639307226978cbcae61ad4b"
 
-SRC_URI[md5sum] = "83a177756e2c801d0b3a6f7b0d4f3f7e"
-SRC_URI[sha256sum] = "f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68"
+SRC_URI[md5sum] = "52f75ceb21e96c258f289859a2996b60"
+SRC_URI[sha256sum] = "a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76"
 
 inherit pypi setuptools
 
-- 
2.7.4


