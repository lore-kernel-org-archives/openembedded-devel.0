Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB1577610
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:30:46 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s186so20288685qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N/SmcYGbtv+Em80KkCxtHFB32nwjuY7IVDWBG/jmOw4=;
	b=D1LsGzNS6gu26TeUEwtdHs+XkvAhYxlJbsJy1q56suSo1CKWwYXZMgSQhmL2nNStaP
	nSieNtlDXNy1aQDlFXQqFhGXGKldHusEX3IBCdGvGtAuOcWm/TJe1XTcPKSqmiuFehWj
	Q6NyxhR1ZsClJTmfEyigRe84uTo0QRJ+aIuYoE0PkjrJ/46VehOBOds9j6CG+MdWu7og
	ywUqEcGPn6hMWFOiIXYBWMu3H5iETOShSnjoC9/ZdeXBovKCP1V5njskxv2NFJrcuGX+
	QVgxcQixUnAYNcUL2zGPBJVvADpu07NvzhzwktAOL6KOSXnCPwZzH6RcjsBbL+4ScJ6P
	7mBg==
X-Gm-Message-State: AMke39kWGxxpaZp1fETyHq/fovNCpMjCQ6UFy9uGyTp3FaRzHSXlpV3jiovvK2JdJ41FpQ==
X-Received: by 10.55.93.131 with SMTP id r125mr18608480qkb.208.1488472247337; 
	Thu, 02 Mar 2017 08:30:47 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	i140sm2773265qke.2.2017.03.02.08.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 08:30:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 11:30:41 -0500
Message-Id: <1488472241-32504-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-anyjson: add a recipe for version 0.3.3
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
X-List-Received-Date: Thu, 02 Mar 2017 16:30:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-anyjson.inc      | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb |  2 ++
 .../recipes-devtools/python/python3-anyjson_0.3.3.bb        |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-anyjson.inc
 create mode 100644 meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python-anyjson.inc b/meta-python/recipes-devtools/python/python-anyjson.inc
new file mode 100644
index 0000000..a0d20ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-anyjson.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Wraps the best available JSON implementation available in a common interface"
+DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
+provides a uniform API regardless of which JSON implementation is used."
+HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
+
+inherit pypi
+
+SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
+SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-simplejson"
diff --git a/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
new file mode 100644
index 0000000..31b8749
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-anyjson.inc
diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
new file mode 100644
index 0000000..199e225
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-anyjson.inc
-- 
2.7.4


