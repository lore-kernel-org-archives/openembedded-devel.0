Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B3BE5780BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:41:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id t37so7489283qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MIZ0s/a7cEZeHiDCipAPka+sY9Vqb/g70FkvZhbuKYU=;
	b=VCXZ/urzXeiidXmtpaO+qQG1mP0lwVvxtuEZHD60slyJraj5XF4w/n9p0goC2np+s6
	DDId0rfQscfrsD0eBrddlhkSR53NSaHdzCxY7dlFcjmhl2HcYJwQnRDkZKW1eE6D27fL
	VYYxJ9N/xr66pr0J3YA15ihUYGEYvgNKucRL2nWBj56fiPJgDbJZbj77iWx/WViAzbVS
	8xp7m4cBoQ5wGzOSiTJQlfjphCGxRXwh+UpRC5zj2IXyQiNQlMWkyomsMcv+Aj+K4Y8e
	nwbrgUzL4Y3fUEapfQ+/Gq0f8Ku1/uymVs339yag0SQui3WdIbwl0g+Jr7sl+l6MzFmH
	EzFw==
X-Gm-Message-State: AHYfb5h4JAkSPiWuY/9D/4aHk/4YHFq4dQkVaChbQJxyyRkIu4Uu5fzK
	YGE+Q4XDeG8MqORW5BQ=
X-Received: by 10.237.59.59 with SMTP id p56mr13822874qte.341.1502329283539;
	Wed, 09 Aug 2017 18:41:23 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	x123sm2823197qkb.46.2017.08.09.18.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:41:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:41:16 -0400
Message-Id: <1502329276-14991-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.4
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
X-List-Received-Date: Thu, 10 Aug 2017 01:41:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc                 | 4 ++--
 .../python/{python-django_1.11.2.bb => python-django_1.11.4.bb}       | 0
 .../python/{python3-django_1.11.2.bb => python3-django_1.11.4.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.2.bb => python-django_1.11.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-django_1.11.2.bb => python3-django_1.11.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index d83e7d2..370dc62 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "f089f1f86d25f2b78f6cf36478d4edd1"
-SRC_URI[sha256sum] = "3c5b070482df4f9e5750539dc1824d353729ee423fd410c579b8cd3dea5b0617"
+SRC_URI[md5sum] = "c851d892cd5ad3a90808703c4f36e3fe"
+SRC_URI[sha256sum] = "abe86e67dda9897a1536a727ed57dbefb5a42b41943be3b116fe3edab4c07bb2"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.2.bb b/meta-python/recipes-devtools/python/python-django_1.11.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django_1.11.2.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.2.bb b/meta-python/recipes-devtools/python/python3-django_1.11.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django_1.11.2.bb
rename to meta-python/recipes-devtools/python/python3-django_1.11.4.bb
-- 
2.7.4


