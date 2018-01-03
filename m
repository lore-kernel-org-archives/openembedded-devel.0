Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 51D927841C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:39:43 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id g10so3976250qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bc6dgMe+TO/M1zL7nkJqnSqXnsWtHZsrFw9+E6CZD6E=;
	b=S6hjuzYnqvnp/SXkDvNO1FREhbTkDYZlpBzWNCXhGqv2+fPM0EldPLrlKeubPvq+iZ
	5fgI3lxodN/CqaObsw1j5Yy/K3ZAzbgTYHITxK5/waHt4M2E6dLcmmujv/O3ea5Vi8l0
	glEgyD0HawsTGC2nSIUFIjGVBQKB5K3/lnKuBOa0yMMCBeV9XyRe7ivpK4Wb8UzRyycV
	BqldaRqFxYe17Y0qxUxhPWHs0q/qTr6AIUMM/TNIWbPWkBpk1QQhMYil8FNWX0Evs+hb
	6t1eGn942qEaglThcQiOgH+NTC6zxtu24r6z7MLzfkEq5kJcDAiwJGqaTcJF+f3+zO1f
	T/Kw==
X-Gm-Message-State: AKGB3mILq0w6kWmhj0tiwl60en1AKNvjdEj4dNYJtIOJwnXRP7cvQmD5
	wAlpiQ77nYrm5Bt0lM08x9VPjgPo
X-Google-Smtp-Source: ACJfBotkvVbf1Wpsv7OPRloAm60kIrXUp8mkuAMo0r1RdMlF01i+tWJ/Ak5IYarXQBbC/BNlOxf4yw==
X-Received: by 10.200.16.3 with SMTP id z3mr3857653qti.61.1515019184006;
	Wed, 03 Jan 2018 14:39:44 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s41sm1241142qtk.37.2018.01.03.14.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:39:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:39:33 -0500
Message-Id: <1515019174-24971-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515019174-24971-1-git-send-email-derek@asterius.io>
References: <1515019174-24971-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python-jsonpatch: add a python3 version of the recipe
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
X-List-Received-Date: Wed, 03 Jan 2018 22:39:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonpatch.inc   | 12 ++++++++++++
 .../recipes-devtools/python/python-jsonpatch_1.20.bb       | 14 ++------------
 .../recipes-devtools/python/python3-jsonpatch_1.20.bb      |  6 ++++++
 3 files changed, 20 insertions(+), 12 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpatch.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
new file mode 100644
index 0000000..8653de9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -0,0 +1,12 @@
+SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi
+
+SRC_URI[md5sum] = "b82b9ecad4cdef86bf0b88cbdbf7a8b9"
+SRC_URI[sha256sum] = "b12594a0cfe634bdd2a5c027250af2dd84932d493568e88ae722871edc3eb02d"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
+
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
index a28294a..e45699a 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
@@ -1,12 +1,2 @@
-SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "b82b9ecad4cdef86bf0b88cbdbf7a8b9"
-SRC_URI[sha256sum] = "b12594a0cfe634bdd2a5c027250af2dd84932d493568e88ae722871edc3eb02d"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
-
+inherit setuptools
+require python-jsonpatch.inc
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb
new file mode 100644
index 0000000..eb55934
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-jsonpatch.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+"
-- 
2.7.4


