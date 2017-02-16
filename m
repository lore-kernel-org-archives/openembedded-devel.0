Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 818F977240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:09:41 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p22so4498554qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=98dFDOwonuEUSrrJpXEzq1jULAtcANhVB1KgVgJ1Ylw=;
	b=jwAMlCTT5cSPjeLb60R7Kiz1PIDnQ0QT53hM4hQv5061tifIZJddKn5BFem0ppleMM
	rspgjmlgVe1+thz0C0VgGYJCKgk1mz6OIO6RV310A83RHGaCHYIWRJQZep1EzLrYnb36
	V7o45g/x/mRyBtgY5wKxmB/h3hkjKkfDG7pXAXeZhsmFJt05ogxyuhtdfYhsZURmW/nI
	OgANH1CSRH8xUc8HVXWWKHbk9LYibkz2hTqC+yPPMhaUIgwFSr7I2ALMg7tIMtKd6VOZ
	AABAGsSwALF4cmP+AkUr+QstZhfWL6cY2KbASZBXFpmOHtlFg2sfopmXnfWSZmhA7gYg
	i3mQ==
X-Gm-Message-State: AMke39kehRG6oxSNXqFkL1mJ5P7YShWS5bkM3OmXHWl/M5EXzzv8qJ63K/ssXlSaL3LvKA==
X-Received: by 10.233.216.68 with SMTP id u65mr4602836qkf.68.1487286581507;
	Thu, 16 Feb 2017 15:09:41 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id w44sm5358339qta.4.2017.02.16.15.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 15:09:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 18:09:34 -0500
Message-Id: <1487286574-29847-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonschema: update to version 2.6.0
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
X-List-Received-Date: Thu, 16 Feb 2017 23:09:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc             | 4 ++--
 .../python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb} | 0
 .../{python3-jsonschema_2.5.1.bb => python3-jsonschema_2.6.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonschema_2.5.1.bb => python3-jsonschema_2.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 3466457..74933f5 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of JSON Schema validation for Python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
 
-SRC_URI[md5sum] = "374e848fdb69a3ce8b7e778b47c30640"
-SRC_URI[sha256sum] = "36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41"
+SRC_URI[md5sum] = "50c6b69a373a8b55ff1e0ec6e78f13f4"
+SRC_URI[sha256sum] = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb
rename to meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
-- 
2.7.4


