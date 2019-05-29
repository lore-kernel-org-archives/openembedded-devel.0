Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3327F7E271
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:25:36 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z3so1012776pgp.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1eZjpswUi3+vMZckVXj5lIJqG62sNkVaAMMbku9ljhE=;
	b=rYOXWRvS4+iXZgMD09MFF1qyXmycBWRgMok2vz+d57GNDqwN5FZytwn4yOiV+P9B06
	SoXVpcsefmEM5d9wgFOtJIi7HM0JPNtzriAolZwnPxoNqIygpOXZLJvuWaJOaRiV8quh
	H9hwHhvQzuXNpsB9mSkTLh9gF9Gd8Z6K288Efr3U/mGnU+a/tr3+TbCRZ/Gfh9JPfjBQ
	eDTFUwpekdr2IC/9nw1pyZtAwXWl6GKEn9KsvaGeRkWmgLlH2uvoMUbDBkiLoi5divrR
	jsjokIG0E6h4CxCpKsuFyVsd9Sy/6W6crENsG0Wfpy3OSORGw008coiLxcYxEqx5zUUD
	UYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1eZjpswUi3+vMZckVXj5lIJqG62sNkVaAMMbku9ljhE=;
	b=iQOk2jjcsMAKFREC5RXUbxWo4Agd3kEmYMXxP7MPKzj8x5npcyYKSEf63ceaH4MofR
	jEOli30It+u4cA6T/3uzXuLG6sInXSw5spRiHP7GkwL9q0TrX1Ub3gXtFhYml8i4bxlt
	q6ehqV5f6L0c5E8KtvSSiHBKLAMQMV18heKbV+wEKknn1uamRhQv6YGzHdmG8fXzxn8K
	mxgMLfPv2ouw4prhTZ3asm9wROfq0RZKDKuILASR3ZgaU4Lkr9cXZufXvGX3CgjvyKX8
	Kl+jxaL8BCYRSqFZx7u8Afn1JlbfP/9iAc5qDjOyrqVS2ElwYFm7eSisQxG6pZqmVezW
	VlOg==
X-Gm-Message-State: APjAAAX6zRHVdkQMV0PCzsvJIaqGKRCQoP4HmdDjMACvqPFiOf4cRxiS
	ZbziuDUEtDMD71QbPdFHSyiU/eUTntg0HA==
X-Google-Smtp-Source: APXvYqwhl8gaennC/ymoqzI6xUpH5TI6DYDkXfzTfmF4H0MIlncrS206ezDljCZpdgDhe9Wujwo+Vw==
X-Received: by 2002:a17:90a:248:: with SMTP id
	t8mr10847340pje.119.1559121936600; 
	Wed, 29 May 2019 02:25:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	h123sm18896231pfe.80.2019.05.29.02.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 02:25:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2019 02:25:26 -0700
Message-Id: <20190529092528.23660-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529092528.23660-1-raj.khem@gmail.com>
References: <20190529092528.23660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 2/4] python-jsmin, python-pytoml, python-which: Add recipes
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
X-List-Received-Date: Wed, 29 May 2019 09:25:36 -0000
Content-Transfer-Encoding: 8bit

These packages are needed for mozjs 60.x to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 .../python/python-jsmin_2.2.2.bb              | 11 +++++++++++
 .../recipes-devtools/python/python-pytoml.inc | 12 ++++++++++++
 .../python/python-pytoml_0.1.20.bb            |  2 ++
 .../python/python-which_1.1.0.bb              | 19 +++++++++++++++++++
 4 files changed, 44 insertions(+)
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
index 0000000000..901fdc7637
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "which.py -- a portable GNU which replacement"
+HOMEPAGE = "http://code.google.com/p/which/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=030b09798681482b9ad12ac47be496ea"
+
+inherit setuptools pypi python-dir
+
+SRCREV = "425bdeeb2d87c36e2313dc4b8d69ff2bb5a02ee9"
+PYPI_SRC_URI = "git://github.com/trentm/which"
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+    rmdir -p --ignore-fail-on-non-empty ${D}${STAGING_BINDIR_NATIVE}
+    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


