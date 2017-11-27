Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9C27A78411
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 20:00:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u42so40690476qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D7Tcc9nXND7SR9JgDdTaNVYSm1gr3L1nlPHrSXzXqWI=;
	b=W3j4bE/A1zhLc9qKUhr4rSncizX0ZWvpYlZRlOvGrEvQlSXVw5o3+BNn0/keyFBJAz
	9gLk1EwEb23cF3M3ituxMxGRfRteP3gkIlfO8nSWANxx0JOgz6SSNd5xcgtshB6ZEO/r
	rKW3YqcNfBthskQnUfa0gQIdXdwrtd/p48hAUhRoP5l9no5eR7ytIdMB+3fHyVB5E5zz
	PGPxBIWrllJAeVk9RRszjMDr6hLDssINBeRmIfcqXgy0dKqBnGgFpLCftUeqb+QV9ne1
	l8pqoQ1bW5avTTUJe3ClN89c1I9YUHdQbXZs+XjNQ+UFquZlqpxRAtZ7+fIDOrJIndX/
	OCyA==
X-Gm-Message-State: AJaThX56P24h6qXj9CLghVufF2Fp4vqkG2nvBsQwYxp1YVCdbwp2fRjo
	qtB4qG4XJd/WAaNQdYUKsyRht1qQ
X-Google-Smtp-Source: AGs4zMYXxyMBc2oNHlmSxc1MOLK7t7Yl67FPgu196OYCeqsWVrS+BQjZTSOonpivM2i2l4h/qAR+RA==
X-Received: by 10.237.58.133 with SMTP id o5mr37530104qte.265.1511812809582;
	Mon, 27 Nov 2017 12:00:09 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v129sm381998qkd.42.2017.11.27.12.00.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 12:00:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 15:00:02 -0500
Message-Id: <1511812802-23482-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.4.2
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
X-List-Received-Date: Mon, 27 Nov 2017 20:00:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.7.bb => python-pyasn1_0.4.2.bb}         | 0
 .../python/{python3-pyasn1_0.3.7.bb => python3-pyasn1_0.4.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.7.bb => python-pyasn1_0.4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.7.bb => python3-pyasn1_0.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index aa375f6..2539101 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "d58ecd0d9ff07218073c5acb12974254"
-SRC_URI[sha256sum] = "187f2a66d617683f8e82d5c00033b7c8a0287e1da88a9d577aebec321cad4965"
+SRC_URI[md5sum] = "cb5883ddc6a9f405600429f37cf0759c"
+SRC_URI[sha256sum] = "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49b67d15"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.2.bb
-- 
2.7.4


