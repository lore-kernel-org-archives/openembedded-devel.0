Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1AA76E2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so477070wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=SJsGV+jspKp0PjbTMLI8KDn5lTeCibiolX/5gcNs55s=;
	b=E5hrBSeaeA3hoxyXP99i5/q9akMXnvnf9By/5Vip0WOJ/hgo2ctKWNKOTvRQTxH5b5
	NtuOFmbNhuLo0ssIlKGznBNXPIKgh/yaRq+A5eYI8EzWKLDDf5Y2L173qMlYWXZ4CvP9
	xHsSPJCXmhA5M3c06mNbfno4/B3utHRHo39XMtwytxFUk4TGHNyJtr7JYV3ooBojfeLo
	eQbkWKxlPXWUFiP685SmXpGyVJFj/CCqlVVyWYXiLrexYsu74NKmmOPFIBjahLMTCE1r
	9dJpl/PAY6BnM4iR2mnzU5CRSuBDmpNKjzZUQuvUy9s3pMiVhBmaXwR8i6u6x+mdcHY4
	1AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SJsGV+jspKp0PjbTMLI8KDn5lTeCibiolX/5gcNs55s=;
	b=AQ5qbULnzYyqvZ/YApBD9pY30zcqPSjfqZTXOM0LfZckO9It3bVPpxjHXEsm4uAYxq
	G1xRU1ZxPFAMP4eKj2IZY8B9oIHCYf09GwSqfRUiNN2s94Ddb/FzA9GzYiduNvP7sfZ+
	PauI2dhJVq5TZvdNNq3kFcRM6gzpgG+7i/5zo/xe8hcC8VweVSAzu7fcU2rJANZJqjve
	HqNGXER1uSnsJ0wMwH4GMs0y8aLexJsPjHBG24xvqg/uJKmHr4OFQmD+IHEcRoRxzjic
	weTKERz1WJlUm5ZZ9AdZNvG6ldrjV5S7ftGTUtAXHl3mlS3nn6rbFIkmSy8JBIz5HbT4
	IgOQ==
X-Gm-Message-State: AG10YOSDqhvqi1xE6AyMN47PGSTQYw+n5fMbCoiATzLNPe2HAqu64ZwGi9ZyB/eBWaLt6g==
X-Received: by 10.28.176.131 with SMTP id z125mr6388382wme.5.1453505451427;
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:50 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:09 +0100
Message-Id: <f6f7df92f184f0fe2749fd557b383761b457e120.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 07/21] python(3)-markupsafe: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:51 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-markupsafe.inc     | 17 +++++++++++++++++
 .../recipes-devtools/python/python-markupsafe_0.23.bb | 19 +------------------
 .../python/python3-markupsafe_0.23.bb                 |  2 ++
 3 files changed, 20 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-markupsafe.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
new file mode 100644
index 0000000..1b3e0a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
+HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
+
+PR = "r0"
+SRCNAME = "MarkupSafe"
+
+SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
+SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
index 4821c0a..396eff1 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
+++ b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
@@ -1,19 +1,2 @@
-DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
-HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
-
-PR = "r0"
-SRCNAME = "MarkupSafe"
-
-SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
-SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
-
-RDEPENDS_${PN} += "python-re"
+require python-markupsafe.inc
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb
new file mode 100644
index 0000000..765e3c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-markupsafe.inc
-- 
1.9.1


