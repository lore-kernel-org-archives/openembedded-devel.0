Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 209C17740F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:05:05 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id c47so222894577qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 18:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4lO7gPOGiGCE4IY+jBNqmqE91re9gErWXr+4tMmg9+c=;
	b=JmDEb0q0yp2RINOcFjolCzZJlKg80R2albwdeku+GsgtJaj1d/uk1q7sMPaQzFk//5
	DKMm0PJMAqBA0NmKx4PU9HGyAdej528jYSGv8xqHqwnvLfkYHo3JxvkCwF0VfrJy5Q4U
	BIm3KeapNGm6fz/qPPMQhFo81QqweRBAjpygHEaKj8unNa0mXeCqJ4whPAy6G0GKFWCO
	WyPHYW1pA75ayaRu03k2Ys7b/QuylnXKLc4NZEJvfAHfeXSMV2kzteWqE+rY6RKrKYqt
	qsinLMz39chfyf+FwFZC3nY7e2KFMlWrSfOPaPNlYlGfCylrPdQNPRY2gNy5/VREYhNL
	Dcsg==
X-Gm-Message-State: AIkVDXIluzPIVZzqPBXGbGNe1RImvqmMDOKGcu46WdbfOaFhRgb6SBf/8Ou6CFhVnoC1FQ==
X-Received: by 10.200.55.213 with SMTP id e21mr8663775qtc.106.1482372306896;
	Wed, 21 Dec 2016 18:05:06 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	h46sm16930453qta.35.2016.12.21.18.05.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 18:05:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 21:04:56 -0500
Message-Id: <1482372296-27289-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: update to version 2.6.0
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
X-List-Received-Date: Thu, 22 Dec 2016 02:05:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc             | 6 +++---
 .../python/{python-dateutil_2.5.3.bb => python-dateutil_2.6.0.bb}   | 0
 .../python/{python3-dateutil_2.5.3.bb => python3-dateutil_2.6.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.5.3.bb => python-dateutil_2.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.5.3.bb => python3-dateutil_2.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 5c9355e..d0ebc70 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
 
-SRC_URI[md5sum] = "05ffc6d2cc85a7fd93bb245807f715ef"
-SRC_URI[sha256sum] = "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
+SRC_URI[md5sum] = "6e38f91e8c94c15a79ce22768dfeca87"
+SRC_URI[sha256sum] = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
@@ -13,7 +13,7 @@ inherit pypi
 PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
-RDEPENDS_${PN} = "\
+RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-six \
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.5.3.bb b/meta-python/recipes-devtools/python/python-dateutil_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.5.3.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.5.3.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.6.0.bb
-- 
2.7.4


