Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0120078489
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:30:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j137so5879208qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gxPFa0o5EMUVmsCAd74VlZ/6x4KRyVYWEaa/seqPWh0=;
	b=CsJpxgyiqUsWpn2oEtR4C+5KSH4hyFzy54ZTSwv8fVO0b/m32U8tkhv28E4mm6S36A
	p8K5zoQrsf2MMrTGuoBLR5FwS6UJk19nakB2ImjcUSV/UQg5aVbL/kgwAQZmmMp0KU6d
	OYF6dGI7UouXAYlnJRLxkp2527rC8wU9hCeilzhTThWLYolxS41hCcTvtzgiKc0rEQ++
	G9ivtKQoEN0L04QSuAnMNs3Lx+DHZ1Du3WA9XBcxpAdVix4fXmWKorgmVHjVO/95uGbe
	a3DUmA9LCg+78sgkBVpfFg26PCZfOEuiGIeyVztlJNOXXkKXH2JK6djZcpK3IHvMvcX3
	OaxA==
X-Gm-Message-State: AKGB3mIbV4H3qWIKRghtDQ7SytZxU+H1tMMMT18dfZcajDejwcXkegGU
	6MyIIGePNb3lW54Yx3FceDUUHx/D
X-Google-Smtp-Source: ACJfBosL5SGD4nr56PGY0ZRTJBRTuaDKyhoqEDo6dvMn2cnkj8tlYP2y/hswesB5RSHN5hoA82qavA==
X-Received: by 10.55.75.202 with SMTP id y193mr5937570qka.118.1513708201620;
	Tue, 19 Dec 2017 10:30:01 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t41sm10128832qtt.84.2017.12.19.10.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 10:30:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 13:29:55 -0500
Message-Id: <1513708195-1689-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-html5lib: update to version 1.0.1
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
X-List-Received-Date: Tue, 19 Dec 2017 18:30:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-html5lib.inc            | 7 ++++---
 .../{python-html5lib_0.999999999.bb => python-html5lib_1.0.1.bb}   | 0
 .../{python3-html5lib_0.999999999.bb => python3-html5lib_1.0.1.bb} | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-html5lib_0.999999999.bb => python-html5lib_1.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-html5lib_0.999999999.bb => python3-html5lib_1.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
index 9c59e0d..0eb8bf3 100644
--- a/meta-python/recipes-devtools/python/python-html5lib.inc
+++ b/meta-python/recipes-devtools/python/python-html5lib.inc
@@ -2,13 +2,14 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
-SRC_URI[md5sum] = "8578e4e3a341436cb9743a9e4a299239"
-SRC_URI[sha256sum] = "ee747c0ffd3028d2722061936b5c65ee4fe13c8e4613519b4447123fc4546298"
+SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
+SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
 
 inherit pypi
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-lxml \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-webencodings \
     ${PYTHON_PN}-xml \
-    "
+"
diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb b/meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-html5lib_0.999999999.bb
rename to meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb
rename to meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
-- 
2.7.4


