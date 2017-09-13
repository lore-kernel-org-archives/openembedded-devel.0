Return-Path: <brgl@bgdev.pl>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id A4F71719A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 19:02:52 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c80so3062283lfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vbpFV1orIy/Kzbor/DrCZv8lUUJJFu6DYLD8S8t+l7g=;
	b=LJUxHJRu1IUu2KvFt+SbLVGU+pgZo7gStK8V3D058Z3I04sniM66MTfRpgr3CK/dNc
	xhWgIhhk6tpRRhHfKdVTCtIqb1xv3RgJTZK84RuKiKjHioIVusIGWz1fgj5OVcQQacYL
	NV2b/54Pm7yknnv23doJRethQdFlY2ZRauzynIAxHMtqwxmX5g+Q+3+DFFlHWAN54b/h
	YRiZFq/RX2fOQzDvqfogTwlCdeY+2vjBrfckhjPxJ6rC6Mx09O4F1jtDlrWiSitbbaBG
	ZlVFf3uDNuwb2rgDUGrWS8bVfwkcSNNnmBhZqrF/vDAT2I1harKQPeDtG506doq/cV9B
	39BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vbpFV1orIy/Kzbor/DrCZv8lUUJJFu6DYLD8S8t+l7g=;
	b=jnPxVaFs084wCzuA/h4XAYMqIz4ZvsoC0XecVOHAU8bl30tQNBwo9BlmT+xgvjKlA+
	mZ0dSXC/jhPzq55aH8hO4DY7dY9y0Blh8WNJvUeZxzoygHIdKfhd9z38xkPoDqcosYZ5
	wjvpI77tbXtv+Qdj7tGG5BMyDEWZbNYLXvNAKrgL1UqFmYJbm0tK9n/tOQEtbrtYH1c7
	wwm6J4IM2lIDLvl/z6ZzIyq4dthRIMRpRJiAm4i9lN0EZxfBE1+5uqZLf4Lf5EOjBAHA
	8qgT8e8HpeWY0WmqfQ8rMs6Tm7pUh4EX5srZ3+fYrwME+pRQufzcZhSLCWRNm8xc1ktK
	J6qg==
X-Gm-Message-State: AHPjjUheHjseX0EOCu2x6UDb5UraCzda3GxwUKwJgoMAr1B3wj7BXGOC
	H9ZH1FQR7rrKlRn6T7Fmiw==
X-Google-Smtp-Source: ADKCNb7I9EFkLCl9NTCSnXpT+K8V4MJ1U7N3pRnWSfmgt0bhLgLlW+yLFmTpbJNK1g7pyws16fYaWg==
X-Received: by 10.46.7.66 with SMTP id i2mr8110055ljd.69.1505329372972;
	Wed, 13 Sep 2017 12:02:52 -0700 (PDT)
Received: from localhost.localdomain ([193.185.223.3])
	by smtp.gmail.com with ESMTPSA id b4sm1517956lfg.90.2017.09.13.12.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 12:02:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 21:02:49 +0200
Message-Id: <20170913190249.23896-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
Subject: [meta-oe][PATCH v2] ceres-solver: add new recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 19:02:52 -0000

From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>

Ceres Solver is an open source C++ library for modeling and solving
large, complicated optimization problems.

It's often used in 3D computer vision applications.

Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
---
v1 -> v2:
- now fetching the source from git, not github archives
- only add a specific directory (cmake files) to FILES_${PN}-dev
- don't create the ${PN} package as the project is not building
  a shared library

 .../ceres-solver/ceres-solver_1.13.bb               | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
new file mode 100644
index 0000000..58d242a
--- /dev/null
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
+AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
+HOMEPAGE = "http://ceres-solver.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
+
+SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
+SRCREV = "19333b0f55c8462381038e70d42af43b52941128"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libeigen glog"
+
+inherit cmake
+
+# Only a static library and headers are created
+PACKAGES = "${PN}-dev ${PN}-staticdev ${PN}-dbg"
+RDEPENDS_${PN}-dev = ""
+
+FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.7.4


