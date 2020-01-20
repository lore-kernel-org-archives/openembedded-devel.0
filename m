Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 62E9F7F847
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:35:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id t14so4464232plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iWR8l0yr+auTSoMD7RGq8u6+oBKmngXC2GaYCOzcfHo=;
	b=dedm2E13jVpG4zLdwlbyUsNoMztfY8pqxdszvadPp/skcyWYiJ/Y6KLLbjkJUARqqw
	X2kIvhEVbsA1/6xsraOU4t2qYhFGF1XHFOnIQel45B1U4/zUM2B2Y5hqaUlWXZo0R308
	UTTWzGk2fiPx8y39XGZDODuP4JaxdrJ494GlsSAQsjbH8NHNB6lCw/nmYGVpZlEeU4L7
	djwIPUUFjFaF6jExg9sPd8gT2kLl+v1tO2G7N3T50glLaoHPa3jhG1SbzUShTBUNMVlD
	OdTYfPmLo8oEkyqjvA5RBWeJTQhCiKzLpQAk44BvH9KKBSqvYnYBMHQtcxTC0jGwXwpQ
	d7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iWR8l0yr+auTSoMD7RGq8u6+oBKmngXC2GaYCOzcfHo=;
	b=pOdgNCyWWhXfmWxYSblAl1cmn/XQbASRZ+/dSS5skmHd1lmcw7nia31qL+fBI9gGKu
	EhCO1gMek2bl2Foa97vUhtG5qIXz9JF0UMHW0a9Vtah1/FPXgO95c3Ti3ptpNgwQH+cx
	53dPA/zFFayS10JunwuUdNtjlaMU0KrOxEvHRbKPmhq4irUz/y+Truh4h3othY7iy4us
	+FOf9vW3s5MwrjB7zsYzoNGDPCpifDK/WbCYZME56mW0E1/jeCr6nx1dAwtJpM/qv3K7
	OEZqCARIEHhVhgvDHT6nnUaDNTJFirW220J5Tv8RlI8ng3HHjrr7KMUogJttVpDy/jJs
	DdCA==
X-Gm-Message-State: APjAAAXxs5PFrPvIcRMau6CjFMdrFDwdam4EZDxwM39ZFLsHc+EAA7Rv
	RloUR2iFYVAM0JTOFX2Bun/u7A1ctN4=
X-Google-Smtp-Source: APXvYqzLX03xHZ6SoRG6zNvAPdZ3mF8TRWGr9oGR9fNrfTvXeWJX8a534iCpdCouUQhOBFC7rgIKJg==
X-Received: by 2002:a17:90a:f30d:: with SMTP id
	ca13mr21093051pjb.27.1579480529871; 
	Sun, 19 Jan 2020 16:35:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z11sm37881115pfk.96.2020.01.19.16.35.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 16:35:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 16:35:23 -0800
Message-Id: <20200120003527.1518697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/5] python3-pytoml,python3-jsmin: Add recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 00:35:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pytoml_0.1.21.bb  |  2 ++
 .../recipes-devtools/python/python3-jsmin_2.2.2.bb    | 11 +++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-pytoml_0.1.21.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb

diff --git a/meta-oe/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-oe/recipes-devtools/python/python3-pytoml_0.1.21.bb
new file mode 100644
index 0000000000..ed6a4d3a6b
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pytoml.inc
diff --git a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb b/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
new file mode 100644
index 0000000000..ab657e6f08
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "JavaScript minifier."
+HOMEPAGE = "https://github.com/tikitu/jsmin/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
+
+inherit setuptools3 pypi
+SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
+SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


