Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40E5F7826C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:23:20 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e2so21852855qti.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 13:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6KDmUt1mUatvzIKiGsmmx7+B5fcL0Tv6L1Y643upNUk=;
	b=C5uVAmYbWEkgNovbAbTvBtspbcVSJRX7nZwrT82pfZv4rxGktPn646v8j6YCw7fItd
	SUCRXlFLbC27lNBAYG2PPURjR+flnsX9NMLF0vJFWbNE9Xtf4f5ownTuEWgBtY+jYMCt
	CMrr4C5dCg8ei3n4/1RoPR/GOajAEBuUOmun9WKwnldg8hB1vcj4cOnMKgEeBsm7GkGy
	S6zxGNwx0XgCTvxP9VAQRSLAYj2iPRQ2b1er9hmVx4gsRJLemJNhfFmsTKhSN2+AjOfI
	h9HPpIYoe7xCWjkwLpPZgi1Ed+lLAuo6zQ9uU0Iw6OLMIsPbPsl4cI8vnm63IWXramz1
	Ni5w==
X-Gm-Message-State: AKGB3mID76aDQ+rZm076yl22to93qkVewr8xpIo1IFiMrjtbNu/UJ1cG
	9JEP+3yOW0zHGdVLMeAq95trQ9yS
X-Google-Smtp-Source: ACJfBotWuqma7yLd9ZE4zT4A8dXkW3g9rDr9T5ZHcvbc63aem/vPh442/RUxPvqXDBf/Cj2T6BL3fw==
X-Received: by 10.200.19.129 with SMTP id h1mr1696596qtj.233.1513632201962;
	Mon, 18 Dec 2017 13:23:21 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v81sm8386925qkb.73.2017.12.18.13.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 13:23:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 16:23:12 -0500
Message-Id: <1513632192-573-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.6.0
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
X-List-Received-Date: Mon, 18 Dec 2017 21:23:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc              | 6 +++---
 .../python/{python-pymongo_3.5.1.bb => python-pymongo_3.6.0.bb}     | 0
 .../python/{python3-pymongo_3.5.1.bb => python3-pymongo_3.6.0.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.5.1.bb => python-pymongo_3.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.5.1.bb => python3-pymongo_3.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 075bd3d..2bb075a 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -6,10 +6,10 @@ format for Python. The pymongo package is a native Python driver for \
 MongoDB. The gridfs package is a gridfs implementation on top of pymongo."
 HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "35ae53073a25603591e085b18bc5a0ec"
-SRC_URI[sha256sum] = "e820d93414f3bec1fa456c84afbd4af1b43ff41366321619db74e6bc065d6924"
+SRC_URI[md5sum] = "2f64fa7691c77535b72050704cc12afb"
+SRC_URI[sha256sum] = "c6de26d1e171cdc449745b82f1addbc873d105b8e7335097da991c0fc664a4a8"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.5.1.bb b/meta-python/recipes-devtools/python/python-pymongo_3.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.5.1.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
-- 
2.7.4


