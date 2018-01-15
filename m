Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD6C571A72
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b141so372714wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eu5AlNJu4E/a1LTlWF+kY07BrPUF79eOhBTd2f5OBYk=;
	b=KjXunYjZSofZeEQbJKsu3Pdvbmw0S5ENWmqH+4nzs8azcpu7SeCBPttqlJCFigSnZI
	OS+7BNbs7R31/XsIvPEpfOac07pujDV9L/zTVwhxQXafa70PqCEWVsCW8foLLCgUEb7S
	vnhu4c8RgXJ8L0fe0TGGvoaenJH0wtEqCuDV4/AsFLlkjElvE2B/mnPm5SUQ+5ofW1ZT
	JgbpQ+JHBdslwDs9EZ2DMgKCQqbF6IFTJ+tIyFqY2WOTYECtflmsQTUKfhxT8JgKzU5r
	yBDOssMktDX/b7VV7Is7CETOtDicJb/cLlFc2MQ9tn3bfwu/ob1QtPvjy4y2K3IDesv9
	wySg==
X-Gm-Message-State: AKwxytcgHorBcXZWojIvwPRWApEfV/7T4GrJ5xz+A0gkDlo6cjFWlLSL
	FBE5fK+TX33o42stZ/TuEFA48Xy3
X-Google-Smtp-Source: ACJfBoszdU7OTSionxj1bGc70rPgPYfHZs/yNuE/7lRxc27CpsiOiZmQK8Ry22hxI+UYNBey/i84Iw==
X-Received: by 10.80.146.182 with SMTP id k51mr20110568eda.110.1516007829436; 
	Mon, 15 Jan 2018 01:17:09 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:08 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:03 +0000
Message-Id: <20180115091707.1539-2-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091707.1539-1-git@andred.net>
References: <20180115091707.1539-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/6] python-pyasn1-modules: add initial recipe for version 0.2.1
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-devtools/python/python-pyasn1-modules.inc    | 16 ++++++++++++++++
 .../python/python-pyasn1-modules_0.2.1.bb                |  2 ++
 .../python/python3-pyasn1-modules_0.2.1.bb               |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
new file mode 100644
index 000000000..9fa54cfe0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
@@ -0,0 +1,16 @@
+SUMMARY = "A collection of ASN.1-based protocols modules."
+DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
+ classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
+ data structures (X.509, PKCS etc.)."
+HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
+
+SRC_URI[md5sum] = "ff938698590f314ff9b3d5c48737d899"
+SRC_URI[sha256sum] = "af00ea8f2022b6287dc375b2c70f31ab5af83989fc6fe9eacd4976ce26cd7ccc"
+
+inherit pypi
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
new file mode 100644
index 000000000..eb7888408
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
@@ -0,0 +1,2 @@
+require python-pyasn1-modules.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb
new file mode 100644
index 000000000..3b1186f06
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.1.bb
@@ -0,0 +1,2 @@
+require python-pyasn1-modules.inc
+inherit setuptools3
-- 
2.15.1


