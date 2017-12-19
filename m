Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 441BB71A18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 19:27:15 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d4so25557398qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VDoKQT095iDN/FklXgraI2MaFC/9gmsHAzGLoeCrUaw=;
	b=qYiMkL7BIIXOnLBr6bsBWFqBYI9N3GsB25zIf43QJ7+rTpeRCllKZv20GlhWHLr7iB
	M1HU4QoyTkQW9nS9OUawOesyqFGH1Xp7ly8Me1zG38uqpWq5ktkR1b7vmfMnGrhCx2c1
	LCoDi4c3vmUMSbCJCe11t4jZJ6PzkiguxSa/ExLEkDdBfvYGpg7PKGwM51enQPDFcQmQ
	DkFWDDII9whp2F4B+3G4gLuywvdd8ShWU2d8PitRSowYD/RF9j8f/184bDP5gFBR6o7H
	T0UoedXQVTmRV0yI4D/xjj6L7A7Km6i1mJAIvQGwJw1uKZX7GZNnGJpI+t809qWP7jsL
	uqtg==
X-Gm-Message-State: AKGB3mJtuggWZZY1gfiro/9Vp8H/AfzIvKxh7r9SlBlOaW69mXHM7qUT
	xoF00XunFQifxtLz+OU+XozyflTZ
X-Google-Smtp-Source: ACJfBovxEu+p3pME/S++qNHq7NxZ1hMwI6EFRVVEO4TZqx1IR+ftNPzCoXZ9HHorH8UC79MS16T5hg==
X-Received: by 10.200.40.189 with SMTP id i58mr6723690qti.128.1513711636109;
	Tue, 19 Dec 2017 11:27:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id g9sm10154727qtg.2.2017.12.19.11.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 11:27:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:27:08 -0500
Message-Id: <1513711628-22874-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyopenssl: update to version 17.5.0
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
X-List-Received-Date: Tue, 19 Dec 2017 19:27:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc              | 4 ++--
 .../python/{python-pyopenssl_17.3.0.bb => python-pyopenssl_17.5.0.bb} | 0
 .../{python3-pyopenssl_17.3.0.bb => python3-pyopenssl_17.5.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_17.3.0.bb => python-pyopenssl_17.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_17.3.0.bb => python3-pyopenssl_17.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 1bf8324..7722e8e 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "09dcd307b8d2068f9dd5aaa3a3a88992"
-SRC_URI[sha256sum] = "29630b9064a82e04d8242ea01d7c93d70ec320f5e3ed48e95fcabc6b1d0f6c76"
+SRC_URI[md5sum] = "d9c5134db8bf3183573b7840954cac94"
+SRC_URI[sha256sum] = "2c10cfba46a52c0b0950118981d61e72c1e5b1aac451ca1bc77de1a679456773"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_17.3.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_17.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_17.3.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_17.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_17.3.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_17.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_17.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_17.5.0.bb
-- 
2.7.4


