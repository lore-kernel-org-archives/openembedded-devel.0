Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4F06C61115
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:44:27 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id l136so10534396oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OCNHiNEWi+tubeqXGnqgRYiNqMkBLYUINQWkSZDMucM=;
	b=uZTd6iSN1+nQMLSzpSn8LRweQTkeTCZWGmYkA5/xYA1mBUfYFuhAJGL9Ya5/Y2l2ZR
	aVExfAAKvNvDYeQdSpUKk+nR7WRTAFqHpRJAL7kqCaeOkLKgDlYfLAVAEmlSFl2YmuKQ
	3sRvUKB6OKwnleM+mbCYEmyb1Fi2QvT3tc8pR216V4wVLEuycJVtcreiGDj9yuNhNOTj
	49nAMahs1brXo++A8UJIh7Ij3kHiRtT84qPveju8Cv+/ER6aryxFz89lV12cTD3YITE1
	BwKJpWtJxgNIYkW3b/WT86303f7MU8KpkmmvW14+IDDHEKQFM35vie6ElnTRvwCBwQ+Y
	Jehw==
X-Gm-Message-State: APjAAAXQbcCTZLbUQ6YFVKHD+F6VzIE0Bm+/LUxTag/Hf7x9Eovfk1Zg
	jAydwZ1QexdFJN0hbffAT7VjRkZ32Xg=
X-Google-Smtp-Source: APXvYqwKavDcolm9lCnVBSOI4JWkPqFhe6GskpP4ybjOLa5hhD0U29oWkgPtP8+vK4/GGllgs1j1ww==
X-Received: by 2002:aca:100e:: with SMTP id 14mr3015495oiq.88.1581709468092;
	Fri, 14 Feb 2020 11:44:28 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	k192sm2038479oib.55.2020.02.14.11.44.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:44:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:44:14 -0500
Message-Id: <20200214194414.32332-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-booleanpy: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 19:44:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-booleanpy.inc | 14 --------------
 .../python/python3-booleanpy_3.7.bb              | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-booleanpy.inc

diff --git a/meta-python/recipes-devtools/python/python-booleanpy.inc b/meta-python/recipes-devtools/python/python-booleanpy.inc
deleted file mode 100644
index 335d7d396d..0000000000
--- a/meta-python/recipes-devtools/python/python-booleanpy.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Define boolean algebras, create and parse boolean expressions and create custom boolean DSL"
-HOMEPAGE = "https://github.com/bastikr/boolean.py"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
-
-SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
-SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
-
-PYPI_PACKAGE = "boolean.py"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
index 5f8602d187..ebf7ba4e74 100644
--- a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-booleanpy.inc
+SUMMARY = "Define boolean algebras, create and parse boolean expressions and create custom boolean DSL"
+HOMEPAGE = "https://github.com/bastikr/boolean.py"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
+
+SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
+SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
+
+PYPI_PACKAGE = "boolean.py"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


