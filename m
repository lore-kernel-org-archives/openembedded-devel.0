Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id EF2386FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:50:05 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f15so31713017qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 06:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S0nb3I754rP0D7cheAFbdXKbXnHaJLBQIqGzCKgepXg=;
	b=ZXei4Plhrb92chwGydkIoGE3Kxzjv6DtR1abecFDmTmngFcGCEwJOC0Yr1s+dQgoHE
	YODHTn4EE8jLGFZcgwgXMpnmer0HT+pgviqdO8PdTdach9+pRFZlIEtT6frTkjAMzEWm
	wKw0XAdAs9UzEEnOdN0u2L5iNnwg1ioK+v+pYuyWrHpkrbQvbHMzeeMrF8cKrE9FnGbC
	E5n7zH3VXZnfV/P0pEreliJ3J5mq6d2reIgajhOIx288oUwmlaUqCelJvssIu059OY3X
	r8kd55LjYS+nHbZ6EAJr/hLdQxDfrdxMTQCc1dtJOc1pf1fePXg8HsIm5L/rYR+nvbTB
	u6EA==
X-Gm-Message-State: AMCzsaWsVj+18h/2nWWye4Ca8ToKEsG1/rWG77N6LuoZQdRO9R0zFTcZ
	NIz+no0cu+oFitzvmu3cQnDSk7ob
X-Google-Smtp-Source: ABhQp+QQvaK+xICFVQ7JQmewplCB1GmHk5/PPwr1D/AqEf1ZbR2DwSH6WTtIbxZ4cvT7dUxkBop9aQ==
X-Received: by 10.237.62.84 with SMTP id m20mr14702592qtf.82.1508161806498;
	Mon, 16 Oct 2017 06:50:06 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	j48sm4913662qta.96.2017.10.16.06.50.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 06:50:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 09:49:53 -0400
Message-Id: <1508161793-27699-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.11.2
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
X-List-Received-Date: Mon, 16 Oct 2017 13:50:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.11.0.bb => python-cffi_1.11.2.bb}           | 0
 .../python/{python3-cffi_1.11.0.bb => python3-cffi_1.11.2.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.11.0.bb => python-cffi_1.11.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.11.0.bb => python3-cffi_1.11.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 2d1f18f..8dcdb63 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "2c5939cc2fa0183fe0c2fcb6a4f1994d"
-SRC_URI[sha256sum] = "5f4ff33371c6969b39b293d9771ee91e81d26f9129be093ca1b7be357fcefd15"
+SRC_URI[md5sum] = "a731487324b501c8295221b629d3f5f3"
+SRC_URI[sha256sum] = "ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.11.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.11.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.11.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.11.2.bb
-- 
2.7.4


