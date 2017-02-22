Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B80873026
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:24:43 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x71so239409qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MV1AdXh8GSvbbpcMGzNH1DoChUw6s9vM8t8LKbL2Ung=;
	b=qJLKq8elTaDuUq9XWP0e3/QkeHGdJtMfdLSOANF9kypNwdshyXDB760WreZEg6Ia8Y
	iQA2PBlqe/1m41mfhYOF4NiffBsxlKhaXvhpWJ+wwLSXr8MEJ70kMs11Km2HcdsHH2qP
	2ezJkT+RIQbbOz8xKIBJ4aT3CZJrpr7QGHFufyHYjLTCDw2hJIV62JDxK7LYQTJt5eNm
	l62u9spNVEcyX4XV4SmeDfBGB2nJV5qRVRwkzXM71D0t3aybTqiPhF+U0yJt9labbLPx
	PbdXyzi6pxgNawrLX0k3kEF3C4lbssqMcuwU2zr/onFv5bvYszT6b4UYM6mLUmCyQcpS
	a/Fg==
X-Gm-Message-State: AMke39moCrIgaMHFK9zw5SKrzjnFCJq37kSmU/b7jrjTaQd1pEIR0K6fRF0d3GPXQgQJJQ==
X-Received: by 10.55.178.132 with SMTP id b126mr26831913qkf.225.1487744685212; 
	Tue, 21 Feb 2017 22:24:45 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id f7sm157242qte.33.2017.02.21.22.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 22:24:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 01:24:38 -0500
Message-Id: <1487744678-17408-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.2.2
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
X-List-Received-Date: Wed, 22 Feb 2017 06:24:44 -0000

Verify the license terms remain intact and update the location
and checksum to match the latest copyright modifications

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc               | 6 +++---
 .../python/{python-pyasn1_0.1.9.bb => python-pyasn1_0.2.2.bb}       | 0
 .../python/{python3-pyasn1_0.1.9.bb => python3-pyasn1_0.2.2.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.1.9.bb => python-pyasn1_0.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.1.9.bb => python3-pyasn1_0.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 72cabc4..e740305 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
-SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
+SRC_URI[md5sum] = "800d0114db2084f7256586dadf37d1aa"
+SRC_URI[sha256sum] = "6b42f96b942406712e0be5ea2bbbc57d8f30c7835a4904c9c195cc669736d435"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-lang \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb
-- 
2.7.4


