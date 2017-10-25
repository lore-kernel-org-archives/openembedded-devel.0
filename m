Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 524D371C75
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:44:48 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z28so5371qtz.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hk54XQg6AD0Dccyt3CL20Q1gvdgFqH58XsOjrfxx7fk=;
	b=cDI3mIW858oa/t1D+zlHMdhR/DJ9+ekpG2DcQi9bNkg/LFGjDGi6x4ySE/ndYeRhjh
	rwbeq/teE58Ht4T1b9mrMv9IUSEXmH3gjOFwUVBEdUasudiFEgbXZYwA0pdSKPbW0VwY
	eaLSUqgHtlST5JcChkP8X9Aajb6/LzYjm8J/K2vUiceMlZk1IJWktICBuPuJnQV/4KLG
	e+lhDW+XgUhgoGtrUa8MgZQUJEcSBqxVQX3czRqw5HiDqPhLD6Ry986j7yw3J4lT+qw8
	dUpk/FnuFsjraZ9JrXWV36yoaiwPbs0kYwUo4qwQxBMs/hNR/BAzZ8wL9jeiOie9AOBl
	ih9w==
X-Gm-Message-State: AMCzsaVfGBfmweZvi5SgTw8xADciayIXSbXl7rKsRC9JgZ3KuaYWPoDw
	9XBtJb7IxPD6qUG1RhTC0Z1VuyZj
X-Google-Smtp-Source: ABhQp+STqkpKJ+l4o3e2qbIp1Bd1W6cM27woYsbaYe25bGIVI8HaxrekEIDKvZAxuK4vL0qp0h+KNQ==
X-Received: by 10.237.47.195 with SMTP id m61mr29396913qtd.143.1508939089936; 
	Wed, 25 Oct 2017 06:44:49 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	m39sm1975815qtk.30.2017.10.25.06.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:44:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:44:41 -0400
Message-Id: <1508939082-13107-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography: update to version 2.1.2
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
X-List-Received-Date: Wed, 25 Oct 2017 13:44:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc    | 10 +++++-----
 ...thon-cryptography_2.0.3.bb => python-cryptography_2.1.2.bb} |  0
 ...on3-cryptography_2.0.3.bb => python3-cryptography_2.1.2.bb} |  0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.0.3.bb => python-cryptography_2.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.0.3.bb => python3-cryptography_2.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index a4d1bbb..371ba73 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -6,17 +6,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "24cbdab3fda22be31dd3aef2808f5d2f"
-SRC_URI[sha256sum] = "d04bb2425086c3fe86f7bc48915290b13e798497839fbb18ab7f6dffcf98cc3a"
+SRC_URI[md5sum] = "f0565d3e85cea64f0f01382e525a33dd"
+SRC_URI[sha256sum] = "d7f348e4f5df146a0e75998544bab6d42313cf19a81a6e49990ab7b27cc9c73b"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
@@ -26,7 +26,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-setuptools \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.0.3.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.0.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.0.3.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.1.2.bb
-- 
2.7.4


