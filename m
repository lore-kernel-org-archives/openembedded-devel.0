Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6B458784DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 13:32:24 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b198so17508152qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 06:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6nay6RMG2IzIMio7MN6lYu5fVMN4SvtXFyB+6sIYltY=;
	b=D0v44GA86felmb14y6xsbNYzbXX4sghve09kkOfbpPuUOevfMUHxQkrCmSFU6KyQ9B
	ehcp0SZmZfAm7OmjHmxtXWKoPAjIyZI30sChgK2+rBgWKWXlriNsdML1ZnLjlS+OuRp9
	lS7c/EdOBnARiWeyXqEKyJ2ICLondUzYNrCiKvlTVn5Cv9Bx9gC9Rke4Cz1XEZeYpoMu
	g/l/tor4kelSpc7A1O0LyVR9hBngAz1TGZQuzC5tSI9BSQFF1LEVaYk0DIi+zhn9hfjH
	XBr66ee13lmYJRs0iPb1mGCipecK9j3JRrwyatHqeyrmTTcjfnFaW9e6w9zl8phP3B2D
	9e5g==
X-Gm-Message-State: AElRT7F7B9GyY8KjToFXk9hQD01tds0bCz7ZuMUsyk+Uemmm/fHFnN/q
	pHCiNsSVQXXuKGZ7GTpDf2GoKQfI
X-Google-Smtp-Source: AG47ELvjEcagfvIVlIK+hFHHCdzgU7awNz/y7qnyIMYzCnBBcXG3rVLv0v37lOzW9zOVKsEYYMpfFg==
X-Received: by 10.55.209.79 with SMTP id s76mr51365819qki.89.1521984745809;
	Sun, 25 Mar 2018 06:32:25 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 61sm9608243qtc.49.2018.03.25.06.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Mar 2018 06:32:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 09:32:14 -0400
Message-Id: <1521984734-24914-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.89
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
X-List-Received-Date: Sun, 25 Mar 2018 13:32:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.87.1.bb => python-pymisp_2.4.89.bb}     | 0
 .../python/{python3-pymisp_2.4.87.1.bb => python3-pymisp_2.4.89.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.87.1.bb => python-pymisp_2.4.89.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.87.1.bb => python3-pymisp_2.4.89.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 6c7ceb8..7765cc5 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "5003442bffbb15c227decbe2a1fd2d66"
-SRC_URI[sha256sum] = "44af4fa5ba092a9bee413cedf4bf9453827fd2185b6a609a5388af8b72b6abd6"
+SRC_URI[md5sum] = "d4fee2abb2d7468010b7fe9ebc68b0cb"
+SRC_URI[sha256sum] = "304fbd8862dfde27d767c093de87fec42fc63c70d8393643d1a3b4f765aae78f"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.87.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.89.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.87.1.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.89.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.87.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.89.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.87.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.89.bb
-- 
2.7.4


