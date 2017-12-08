Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63349786CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b11so6166386pgu.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kGkddZ1WVgvnKXVofreLBRwAXxMTduMKo4HvGCKhUkw=;
	b=HMzg2835qhXKjztF4Bf/uFmAAv76yrkjrWnZ80aKmLLS5DfchtoxY9stoIsIbxLvDr
	v50CRRULlCSwa/1tlTWrArx/fkqqAJ09B/e0oS7ZfDcc9Tu+mAsClAk9aFY9hCY+gpbe
	ncd7yyboT+8t3i+FhMhH7pj0tSM6YkEEMU9YsLVQ346yNr6xw/tCTgdNWgx3JpMUvzRp
	Cxx67+U6ykfCKKSc3zJ8ZzgZPsAPyhHWDmMsNWDGOOLTeuFSMayc9LamL/hdVpFWkr2w
	oVLXYJCFnOOvz0OHv6PrW8TCQZlbd7gcuVIia2bTR9rnE6xsOqIah9jxTBMab6fGU3Yf
	HWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kGkddZ1WVgvnKXVofreLBRwAXxMTduMKo4HvGCKhUkw=;
	b=pHe/yuPN78nR9cGQeA6J6uFEz+90PH7+8ckrhY/N0hW83waGND4LZAUynRREHmhiDQ
	x6zA5kYvb6poJ2qatSIG+WLFkK8Jx9VarItOkLg7ZIF1+ghTukapdaKBxiSWad3ZSEhD
	BK8ZtKFbXgRWQEg83wuVkU+8oLzgMJNl1NGIAHCC/CrMPEXuNr66bMjQ3Xl5VJK16Dm7
	aMG+1d9FjZ8J5nPmpZyB3KHJ9koSBynNXNa2+1a2f6LrMzTr52sgrsBHnS6Jbqu3cmHM
	RINsx/d+0NOXNEPmIvaNS5XejIJRYQ4sfgAPfxN2Mi1o8LtgPJL0h7oIoa4LTPG9AUmj
	VC6w==
X-Gm-Message-State: AKGB3mKSa/hQjv9uorhD+n20hiOpc0NEeuJ6npZigFCeJuB/HA3SHjAH
	lCA8Y7nF9HVGrx9i2vlJsvTm1Q==
X-Google-Smtp-Source: AGs4zMb/Wc0KqkIY7K1zC2VXmB+86QQZ1mR0fsntQPpP2HHzyJMJyiL7hWi4vV5l691nxqhsgu6RvA==
X-Received: by 10.84.132.33 with SMTP id 30mr19972266ple.292.1512712176085;
	Thu, 07 Dec 2017 21:49:36 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:35 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:09 -0800
Message-Id: <20171208054911.27014-12-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 11/13] python[3]-xstatic: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:35 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-xstatic.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-xstatic_1.0.1.bb        |  2 ++
 .../recipes-devtools/python/python3-xstatic_1.0.1.bb       |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-xstatic.inc b/meta-python/recipes-devtools/python/python-xstatic.inc
new file mode 100644
index 0000000..f7c7db9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "XStatic base package with minimal support code"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.txt;md5=36a1e7eaa71e1bd07b8d2247839f228e"
+
+PYPI_PACKAGE = "XStatic"
+
+SRC_URI[md5sum] = "7064b5ea7fd1ee990e0ae0538301d9bc"
+SRC_URI[sha256sum] = "0ec93d7c66ebb9e0d31b664753437dc8634cb66e13310cb47c9eb1e0bc66d726"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
diff --git a/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
new file mode 100644
index 0000000..8073037
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-xstatic.inc
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb
new file mode 100644
index 0000000..76cb702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-xstatic.inc
-- 
2.7.4


