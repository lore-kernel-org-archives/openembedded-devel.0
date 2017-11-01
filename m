Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1494F719AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 17:37:04 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f8so3613251qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 10:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GItlEgeBPP9H2mR7Ww9zDQJYllHa4lBZ8Pyb07CCT2Q=;
	b=ubxbgn/4JdDrvpW90WRNxLfob3n65pD0i78kWwnmGS3/5cjinGJFIHv7IpONx217W8
	cma3QwB3dfrqWQQ6Qsp9XsJGumfjZYZzBLkqq4uj2OV5iwZJF8Ql27egGae+U1A69s3q
	0Lq6xSDq3v4xvM1mB2BSqbXwZ6dj2RVJtxoyRoavVywhNz8F3A2WEXc/BOGlR3GfbtyG
	EmYMVli+wtIa1sGkT+qYv6Q6ok0dbwO9D60i85xCPv0QOOfg7c44DrQVT7OslJ4bWnAD
	T2/XAuy1MhSWOQg7r8sPS5iE3SHf8KaEKIGf5SLOsr5/4XbQdvCvcHn6HyjIysuoMTgN
	nZNA==
X-Gm-Message-State: AMCzsaVhLMCjy7hpi9ynk76fJ3G7aXJF129xxNRs8znKt+HHUjX0IxlJ
	sw1UAbnHWi2lKEbaap/oyc3afB1q
X-Google-Smtp-Source: ABhQp+TKcKXqDK1mdDSCQzdhsm6fR7AhBEQK4JR+WqE4GedF2g84PigHzufc84C68WrPb6H6US+vpA==
X-Received: by 10.237.32.101 with SMTP id 92mr1087749qta.44.1509557825862;
	Wed, 01 Nov 2017 10:37:05 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id f12sm815554qtk.0.2017.11.01.10.37.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 10:37:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 13:36:56 -0400
Message-Id: <1509557816-26211-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-snimpy: refactor to use pypi class
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
X-List-Received-Date: Wed, 01 Nov 2017 17:37:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb b/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
index cbdc6bd..e0747b7 100644
--- a/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
+++ b/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
@@ -3,21 +3,15 @@ DESCRIPTION = "Snimpy is a Python-based tool providing a simple interface to bui
 HOMEPAGE = "https://pypi.python.org/pypi/snimpy"
 SECTION = "devel/python"
 
-DEPENDS = "libsmi python-cffi-native python-vcversioner-native"
+DEPENDS += "libsmi python-cffi-native python-vcversioner-native"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=7c53ab2d1240828625c3e093d049d4f4"
 
-SRCNAME = "snimpy"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "7f6270ce2e7206df165602e66d5ceb96"
 SRC_URI[sha256sum] = "10410614c7bff1053ca65bd760ce919f1a074f4988b857df4c57cf35847922b0"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "python-cffi \
                   python-pycparser \
-- 
2.7.4


