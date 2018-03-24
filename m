Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA23719A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:43:05 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s78so15773783qkl.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MHBRBAbuPY5fEAjj9LWSMO35G7+o0vNFDUYl9e6ZhZg=;
	b=W8xt7oH8rQO6xWqdnHPh4a9ShRpzaSU7YllWwQmLtOt5fFtNRqDG2tQruJO7asZdjn
	vpbscNbb2fcXCa/IVQ9lYCFHdZOHqukR/yf8VaFpMjl+9jT75TiCad8U2/eEvF+4oThf
	qDmX+ZFEZc1eo0LfRxd9WHxtViuDktTCNhYzrzx/jA9+5xTnIo0YU7OCyf0L67Hk7D4L
	p0flhCrGb5a8RXL3S/TEHWavmzAkjN23BmhC0FhZ4CEI5/tW6qulHIXe+qJF0H6EiLtN
	Z+DwVlWiexkRUOtKeJN6wEWl5ddEmX0KKlOfQMcG/3T8m9x1db9MOvUdoAQ7lVbrFP1o
	j7/w==
X-Gm-Message-State: AElRT7FyMrqoDEUJ3iQuet+JXqEbr7D0He79pVlQgXmBJVAnm6S5Ou13
	fuXwCY99+0dYOirAyrCu8gfcGIoD
X-Google-Smtp-Source: AG47ELuFKUeIr6u/LCfvM2Flvt1cmXfGsKJnNVDhKiI/lQVx2IXQGDN0UWASKY9oeBXacQBRr5XayQ==
X-Received: by 10.55.149.135 with SMTP id x129mr47126838qkd.279.1521898986864; 
	Sat, 24 Mar 2018 06:43:06 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id p2sm8267330qkf.71.2018.03.24.06.43.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:43:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:42:58 -0400
Message-Id: <1521898978-3587-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-py: update to version 1.5.3
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
X-List-Received-Date: Sat, 24 Mar 2018 13:43:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc                     | 4 ++--
 .../python/{python-py_1.5.2.bb => python-py_1.5.3.bb}                 | 0
 .../python/{python3-py_1.5.2.bb => python3-py_1.5.3.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.5.2.bb => python-py_1.5.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.5.2.bb => python3-py_1.5.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index c7d6727..9105234 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "279ca69c632069e1b71e11b14641ca28"
-SRC_URI[sha256sum] = "ca18943e28235417756316bfada6cd96b23ce60dd532642690dcfdaba988a76d"
+SRC_URI[md5sum] = "667d37a148ad9fb81266492903f2d880"
+SRC_URI[sha256sum] = "29c9fab495d7528e80ba1e343b958684f4ace687327e6f789a94bf3d1915f881"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.5.2.bb b/meta-python/recipes-devtools/python/python-py_1.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.5.2.bb
rename to meta-python/recipes-devtools/python/python-py_1.5.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.5.2.bb b/meta-python/recipes-devtools/python/python3-py_1.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-py_1.5.3.bb
-- 
2.7.4


