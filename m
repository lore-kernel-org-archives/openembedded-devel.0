Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8777C7523F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:35:07 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f1-v6so1839233qti.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZW3SNI+d7X7P6MOBqFfm5FWdurtWnV9UlW09b8p+O7c=;
	b=Gklp0t9mB7d2ntDO5U5LxEg+cMjSBDb20Wf/0F+xwtXkjt1CbRxhDfcS5dPh7rVeHf
	2UmLUk/dik0LTjNV3SKw3p6bdjE5Ju8oRhuruanQYeDSC8XlVb7uVah5nCIvq0IN1XKA
	3oM5l4CNgXOhsx3kOVqleuJp6E6bgDcVfRW1hjb6gfqhTQV9N4Wms6FgCsxzT9Mg6zM9
	VW6CqB/FJO2P0ru6B+m6cMXj8sldSRbECucTsyQtby8J9RYKGWtpdjsLRH06GRB89Y+n
	iXnStv9yQkWFCm/mt5iCXNPv7Za/R7ZA6jgs+T21obu7/56CY4Bmlj/8gHjLd5sVw26E
	cpng==
X-Gm-Message-State: APt69E1xdocBhaxq4DgWbPq3vivjA5Gci0cMwS74045K+iaEeUh0Ow8r
	2b7+bRPtTQDCADVeG3HUy/4tvzdu
X-Google-Smtp-Source: AAOMgpdIRFF6ixqIm4NUobRktxdinXk7ugy8sCA015fvmSvWGuGBW64orNeyAo2q1wIylzWd0rXE9A==
X-Received: by 2002:ac8:5393:: with SMTP id
	x19-v6mr14499543qtp.402.1530300908037; 
	Fri, 29 Jun 2018 12:35:08 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	l2-v6sm7041749qkb.27.2018.06.29.12.35.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:35:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:34:59 -0400
Message-Id: <1530300899-27430-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: update to version 2.6.0
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
X-List-Received-Date: Fri, 29 Jun 2018 19:35:07 -0000

License-Update: copyright years updated

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc                | 6 +++---
 .../python/{python-babel_2.5.3.bb => python-babel_2.6.0.bb}         | 0
 .../python/{python3-babel_2.5.3.bb => python3-babel_2.6.0.bb}       | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.5.3.bb => python-babel_2.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.5.3.bb => python3-babel_2.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index 4dcb255..14b5a9f 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eebdc057dc12abcc2d6c4453628bfcd4"
 
-SRC_URI[md5sum] = "152a6b17fe4110b95675aceb9af9fab2"
-SRC_URI[sha256sum] = "8ce4cb6fdd4393edd323227cba3a077bceb2a6ce5201c902c65e730046f41f14"
+SRC_URI[md5sum] = "c384ac03026e8fe6f9b90f55201f1bff"
+SRC_URI[sha256sum] = "8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.5.3.bb b/meta-python/recipes-devtools/python/python-babel_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.5.3.bb
rename to meta-python/recipes-devtools/python/python-babel_2.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.5.3.bb b/meta-python/recipes-devtools/python/python3-babel_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.6.0.bb
-- 
2.7.4


