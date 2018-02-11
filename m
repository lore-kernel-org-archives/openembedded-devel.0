Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC09077E66
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 15:43:30 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z10so16253175qti.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 07:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CC07swL+WXf4+7bxG+Cm2Psv/T+PVy8vZAOFyZVdWeo=;
	b=GbNtH+NGSi+y51jiIZ/nw3CkEoBNRy0L26SOXj8iI5o0ZMPvAHKBE61g/ISLqaVTsO
	s2wwqpkajIgV/RAUu7Nzrf1GqTjPQyq9v0qWwZjcZXnm45qZ4DghH7lN8FT+Mml+qJGq
	qZpYu5UKZm/v/IFm7pMfIlLc8nPX9NUW1lez1NOk9YuwS7UKm4AI2uvNnU5T/Sr74oJV
	m2TkfD6JLDjYCY0Z0FQJtaxRgf1tpcIZEy70eMaz0uQ3xqur/CEA4lZiD+rlNE1UipRl
	Zg6l9aZmbLcPskGBdqm5PyVk8OQ6oYy9yxS/R/OURNjhgW/E/i7u5gSKpdTL1Y0wOyUq
	ZLcA==
X-Gm-Message-State: APf1xPDQw+OsR3jt+LIUtnX0a/auuxqXaS6MU83so2EPbG/uho69EAZQ
	5ccYxKKQDq8x0aU7Pxc4x/LcgxHm
X-Google-Smtp-Source: AH8x225lUBwgeb1bIegKE+rAR1H/ESdHvYGhNl0BLTlqAhaIBYxQDRk6ZgXfU1K/5d82ygON0RnNNw==
X-Received: by 10.200.97.86 with SMTP id d22mr14275409qtm.217.1518363811489;
	Sun, 11 Feb 2018 07:43:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g57sm5280339qtk.54.2018.02.11.07.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 07:43:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 10:43:24 -0500
Message-Id: <1518363804-7570-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.10
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
X-List-Received-Date: Sun, 11 Feb 2018 15:43:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc                | 5 +++--
 .../python/{python-django_1.11.9.bb => python-django_1.11.10.bb}     | 0
 .../python/{python3-django_1.11.9.bb => python3-django_1.11.10.bb}   | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.9.bb => python-django_1.11.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-django_1.11.9.bb => python3-django_1.11.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index ac0808e..4ef2d7f 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "08ad028fc50ee961dea35e1e1f657b65"
-SRC_URI[sha256sum] = "353d129f22e1d24980d6061666f435781141c2dfd852f14ffc8a670175821034"
+SRC_URI[md5sum] = "f306015e16a8d5024dbac923ac34fffb"
+SRC_URI[sha256sum] = "22383567385a9c406d8a5ce080a2694c82c6b733e157922197e8b393bb3aacd9"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
@@ -20,6 +20,7 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.9.bb b/meta-python/recipes-devtools/python/python-django_1.11.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django_1.11.9.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.9.bb b/meta-python/recipes-devtools/python/python3-django_1.11.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django_1.11.9.bb
rename to meta-python/recipes-devtools/python/python3-django_1.11.10.bb
-- 
2.7.4


