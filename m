Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8397E3D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:45:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id a5so1792608pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VYoyFvwn43JE05Ktg2GjDSnQ5T2LnCqAHgC1O9MZ95w=;
	b=gnGMw2FmDA+oudyAeb64fDy1R1coEGJDrVdLb43BzT7kq4kOl4NN94apVq38oh7AmZ
	nGEG8jafRBshOMeD7w//VPTdYgYl/dpmOtG3P2SbbkemognkFYwFsAZXpeYA/fzT1f4V
	s4/pk45e0+8LtKBa3OVJPxSrPD9JWHJXJD5HfY07FXZl1G3Q+6Bl17oFleGYaXSC+zZF
	2Pi+N+EKJj1irUaJo4KVXYZszXu2N6wWmy6I7qpOJPUB7PRppzJ5hFoNIK31NRUpUapd
	F382k5rB34lYghdLqdl0Bh1TC5IX+C21W/0kHAm8KMPvDo0ywCeL9ig/+7gIQ6Q9xqAi
	jCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VYoyFvwn43JE05Ktg2GjDSnQ5T2LnCqAHgC1O9MZ95w=;
	b=sGfETjYWOj4zHBtLPTUfQLScEjJiF8JISs3wUOSzgJ3lnPkRok8v1KEyLL1TucHTN4
	Zm/nS1plaWQDkZiAgCb66LiPNo1rTQ1AiWoUunqP8zTOgw2rGoCLQdaPcUscmMXFgATw
	pHFzvOZKhkIqJWSY4dD+ycm0k+Z2es3MAoobEDxnNaCrtB5VQ0h7D0MfVQwwd6ZMlzQl
	EowY2kN+mwVs+1IF36LrbtpCb7LruMTiay9pKCjywoVfwPEsGj2TfNUZ6XI3dNgeDBRt
	kiZ+31nrxSP1nAQEbM3Eba/eNA9JJY3ytRvliFGcpaSsR7BRIc6JQJ9L9AQFLjnoSzmW
	iAYw==
X-Gm-Message-State: APjAAAWpDC8SZNAmjfeaxCjMh+gHy/J1IliX7sCiWGUWu6Fw8cuAKeDG
	ckVUoNLCcy4abGkNuXais4DqXvHm9ts=
X-Google-Smtp-Source: APXvYqxmczBqrZVubRdD6fYZWxNPaNyHHSBU2EPVanjWJzIWKs9lQOx7UCyC7j1H0CDZutyK+BrM8w==
X-Received: by 2002:a17:902:9691:: with SMTP id
	n17mr31287020plp.283.1558568703132; 
	Wed, 22 May 2019 16:45:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	k27sm18567808pfh.147.2019.05.22.16.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:45:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 16:44:53 -0700
Message-Id: <20190522234455.13121-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522234455.13121-1-raj.khem@gmail.com>
References: <20190522234455.13121-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] python-jsmin, python-pytoml, python-which: Add recipes
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
X-List-Received-Date: Wed, 22 May 2019 23:45:02 -0000
Content-Transfer-Encoding: 8bit

These packages are needed for mozjs 60.x to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-jsmin_2.2.2.bb   | 11 +++++++++++
 meta-oe/recipes-devtools/python/python-pytoml.inc   | 12 ++++++++++++
 .../recipes-devtools/python/python-pytoml_0.1.20.bb |  2 ++
 .../recipes-devtools/python/python-which_1.1.0.bb   | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-pytoml.inc
 create mode 100644 meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-which_1.1.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
new file mode 100644
index 0000000000..d00d1e2a08
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "JavaScript minifier."
+HOMEPAGE = "https://github.com/tikitu/jsmin/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
+
+inherit setuptools pypi
+SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
+SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/python/python-pytoml.inc b/meta-oe/recipes-devtools/python/python-pytoml.inc
new file mode 100644
index 0000000000..1019c09d03
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pytoml.inc
@@ -0,0 +1,12 @@
+SUMMARY = "A TOML-0.4.0 parser/writer for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/pytoml/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
+
+SRC_URI[md5sum] = "a11d8a4859b53f6ebe2f782314428911"
+SRC_URI[sha256sum] = "ca2d0cb127c938b8b76a9a0d0f855cf930c1d50cc3a0af6d3595b566519a1013"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb b/meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb
new file mode 100644
index 0000000000..88fa95317f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pytoml_0.1.20.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pytoml.inc
diff --git a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
new file mode 100644
index 0000000000..41ffba0d2e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "which.py -- a portable GNU which replacement"
+HOMEPAGE = "http://code.google.com/p/which/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=030b09798681482b9ad12ac47be496ea"
+
+inherit setuptools pypi
+
+SRCREV = "425bdeeb2d87c36e2313dc4b8d69ff2bb5a02ee9"
+SRC_URI = "git://github.com/trentm/which"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


