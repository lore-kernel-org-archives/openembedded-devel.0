Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 38D0371A62
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 18:08:06 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w20so5882092qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 10:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z9X6wwiPTcX5cghOjjvoOORpZF+YdzZhG+uIUD13Y3c=;
	b=Lj0dMaWYbQ2z2EZtl7lpSVMHssJTCJSreOCGzFxQ/O0q07Q0WNnUEa2KTgOLDuruF9
	22ZdWzhwg2Ub1/WpQdh7aGthieBaDfSmgkrUR2ohMyawAdqutAJRvNOW1axjod3Ouc98
	+ohJMxp/RE2oHuN5OR98Dtuq9rh4GoknYnuylyfCRwuBrY5eFX4D2i2Wvtvp82hOXv33
	8+RlGZa7vK+Fvh3QrMnV39paSVM4FCfnlcX+bdIBSg/F/2iviJvySp5D/FplfLYR5OPY
	ucvPut6tR8pUe/M8WFeJw6DMe3PIOBpAnr0c6JHc+B+IgidwqFxUPADr9PO0ioUyWwm9
	xF+w==
X-Gm-Message-State: AIkVDXKW3FE00EBFoVQXf2MrtAeio9EnlhG4DT0PYFMEcK/W9WW/md3VI3+lq+DuKg6Piw==
X-Received: by 10.237.60.49 with SMTP id t46mr15484955qte.140.1486145287140;
	Fri, 03 Feb 2017 10:08:07 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c41sm25069267qtd.3.2017.02.03.10.08.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 10:08:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 13:07:58 -0500
Message-Id: <1486145278-21526-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 3.7.2
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
X-List-Received-Date: Fri, 03 Feb 2017 18:08:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.7.0.bb => python-lxml_3.7.2.bb}             | 0
 .../python/{python3-lxml_3.7.0.bb => python3-lxml_3.7.2.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.7.0.bb => python-lxml_3.7.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.7.0.bb => python3-lxml_3.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 8319799..6299385 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "b78e6f7e859c2ff57add7f63a5e387b7"
-SRC_URI[sha256sum] = "9c62eb2a1862e1ae285d7e7e3b7dc8772d387b19258086afcec143c6b7b8a5c9"
+SRC_URI[md5sum] = "8dcf8d6c692b7aed9370f7462ff09935"
+SRC_URI[sha256sum] = "59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.0.bb b/meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.7.0.bb b/meta-python/recipes-devtools/python/python3-lxml_3.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.7.2.bb
-- 
2.7.4


