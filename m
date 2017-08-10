Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 964E67809C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:25:48 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id p3so7451528qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IENEL7G6FvOvBcjgqrIH562/VO25KsLtt+EVJINgwzY=;
	b=RVfA93ZC7BIU+AZSqaZg0ECR0Z3QcpA27Cv+LZE8isgoPX1qt2kWMyI+WteYtSrCtP
	xkThQjDOT6QqOJe7eC9XjLUIpCP9phcXvxD1tU4vZRUBA+Tp91z0irUoOIimSwTNwkYY
	v2gVk1RK2yBuxxW4KzDXhBeRgTdabHuuXkEc0cCohk3J05rpEYTHEmVdoGEC9ee2OYBA
	jDARx9wOOnIiSD6NEAJ9f+kwm+eIYf80HicFhc4tg6vRsJTH3+fwPSHTa7G0WEonNXIL
	NEPdxGMh8sPhaXJLVvp8QpkNdUSF+swxzLt5NIg05bVcDWd/WgynBnVWwy90BHn1repy
	wuBg==
X-Gm-Message-State: AHYfb5jMF5FTNN1PxtU+thvBNtH4/moXgtjmaWy9GwxODjGlxJJY+UuO
	9lsQDxAcdJJf/xF9asU=
X-Received: by 10.200.38.212 with SMTP id 20mr13555381qtp.112.1502328349283;
	Wed, 09 Aug 2017 18:25:49 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 74sm3033110qkv.31.2017.08.09.18.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:25:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:25:42 -0400
Message-Id: <1502328342-5253-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.3.2
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
X-List-Received-Date: Thu, 10 Aug 2017 01:25:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.2.3.bb => python-pyasn1_0.3.2.bb}         | 0
 .../python/{python3-pyasn1_0.2.3.bb => python3-pyasn1_0.3.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.2.3.bb => python-pyasn1_0.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.2.3.bb => python3-pyasn1_0.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 4eb2d9b..b234a1d 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "79f98135071c8dd5c37b6c923c51be45"
-SRC_URI[sha256sum] = "738c4ebd88a718e700ee35c8d129acce2286542daa80a82823a7073644f706ad"
+SRC_URI[md5sum] = "a014715fe010038dc773cec810cd5ad9"
+SRC_URI[sha256sum] = "90bd82e0db59d4319eaf01c2549b34c817d645275fce9ad41bac7429aa380690"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.2.3.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.2.3.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.2.bb
-- 
2.7.4


