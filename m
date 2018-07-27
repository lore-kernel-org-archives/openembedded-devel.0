Return-Path: <lukaszgardon555@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1089460064
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:43:53 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t25-v6so6300620wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T5ufiSvoUsUaxo09s9O9c4MC0GDhF5iziMt278si/1E=;
	b=K/LcC2upUZ3Pi2yluBLdjr+sIjleLUO5RpqomKzEzPV0dzP8tcK6IkMyXS4AGtY3X6
	CPGc5nslYFIlojCSL/EQo/eAba1Sw0VTCTPhihfIoaLWossK3B4MCbDrGrZ0/tTAG292
	wwCXxlMTB2KHcrLuX3ff2qeZ0gkNRXGIRubO7uLCDrFzfLJjxi5cdn0yLMxCupAYSSNM
	3u5JKKalX8rS9Y2/vQ3OtM93LeMMxwE1zlEPGH6Y7vs9JDcgSV0k8VBfzd3PaqrmuZvQ
	LHBugVjIIkuOOfmJzy/cAG8eibbGNkT/7IJVbFobevqjR8L9OqAStkiwRADUDxNmMO7/
	N2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T5ufiSvoUsUaxo09s9O9c4MC0GDhF5iziMt278si/1E=;
	b=UCzPrPVAIxF9aJGEGokhrFYeJl6kIWqYgzDnpLxrFO/uC+r+u4P7PtEZ6S9d/uKEkH
	9EwM6U751w7r5N0Xl6cNq7fiNj7eWfihkuY+CH7pV8B2pMBWVUkmRETKVLCl6ZOenDJ0
	swuSHMEHjkszDliQj3spoWZogwcqdgj3ZIRbBM3laZx/rPiHiPjGdWmcXNrYclK1M9gf
	a7Ul4d7T4VH9HUdX0ychkQu6DW+8TTFQLp11StejvMSoDBy8xv9v7Uv81eVPzsgvEjpJ
	ShPx6egd33f37Bjmi6K2PYnPK5nrFc4K5+67ldLM7D30WQBCY0tecmA1ftdno+XM23cR
	FLSQ==
X-Gm-Message-State: AOUpUlG5p6Dwn5aIqIyzvKLUePjkaH7ep9g8pStyCukxYrpxoaweuOt9
	QC6F9Ific7UVsRJRYwPtEQlqjLOJKwmZNw==
X-Google-Smtp-Source: AAOMgpfimCqOniGpQMkMi07rYQAeQ3dZDONMl5zPJi8kON03EYuLYEzIiWhO32FFgYsVtFDcAYWQng==
X-Received: by 2002:a1c:c95:: with SMTP id 143-v6mr5465465wmm.50.1532713434491;
	Fri, 27 Jul 2018 10:43:54 -0700 (PDT)
Received: from localhost.localdomain (public-gprs216950.centertel.pl.
	[46.134.186.183]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm6298733wrr.12.2018.07.27.10.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:43:53 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Gardo=C5=84?= <lukaszgardon555@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 19:43:50 +0200
Message-Id: <20180727174350.17335-1-lukaszgardon555@gmail.com>
X-Mailer: git-send-email 2.15.2 (Apple Git-101.1)
MIME-Version: 1.0
Subject: [meta-python][PATCHv5] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Fri, 27 Jul 2018 17:43:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: Change license file from setup.py to
LICENSE, based on the same the same license policy Apache 2.0.

Signed-off-by: Łukasz Gardoń <lukaszgardon555@gmail.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc              | 6 +++---
 .../python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb}       | 0
 .../python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 29d10da6b..16899f88c 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
-SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
+SRC_URI[md5sum] = "bd264851c409f926d1dae1ad5055d28d"
+SRC_URI[sha256sum] = "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470ddbbd9317fd0801582"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
-- 
2.15.2 (Apple Git-101.1)


