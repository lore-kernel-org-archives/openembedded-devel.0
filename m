Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA4F776C9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:50 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 123so468720wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=B8pDDJBTvY7CDQ7fB05VL0Kuncfh9/rKkKdxNWnxBc0=;
	b=fVMQiECDZDrAatBPgN+fZ3J+FGjqLvtSWirbsSxnHXZLxzZ5u8Pl3Azd2BhPtuRy2p
	d5Q/Gly1inEej9RJV+x4yo63csQsvxQPRSs24lOXPHcboN3MtBYE5OL3w4IQQwIItbzx
	anUdoC3MxpS+y+V3/DdbkffE1Pux6R1QtJ3UJdCLqcGWT0ZZn25JgVTqbSE+gSalm0u6
	pPPrLvJennQGFLXBuH7DAdimW4C4s1CLRfFqI6z7bpB7RiwYWtB+EGoBogYg7JNo8z5v
	b1MbFb2K87fquncxmEdvAOJom6qFbQMqRXy1XJQuyee/aq2MunPk/7dlXl3F3Ui6tFti
	c7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=B8pDDJBTvY7CDQ7fB05VL0Kuncfh9/rKkKdxNWnxBc0=;
	b=bjhDl5aJi52aFRPuQxfDmbG7GFUIoPSbHclec2pLG/UJSC0Mt2XF7T2/bxWUQKkLfS
	qwRIuE/BJs6RwBoa/nb73GxhB2dtHKBbSoMTeBqMbjugSR8rv8s06Z1Ydm20cdgAajFR
	D/JVYJvUGYXLDfIOLWry3dnWQwhrWIaIcdn+R/gBBn6VujzBKMJ/YvAjQO8PZuYuDVLG
	EZjZ3/ZO5IiRuUwW9/89nl7kyrRyUn0e2urEy9yuLPluPJ2JBmg6gTwBihmLA69CEDCf
	9N9UXxsu8Yo9lQFTztaqtJ933NQBGHtinNTl+aiRwHLjBZyOy9YDWe2OOEtbDg45/73s
	MBjg==
X-Gm-Message-State: AG10YORbUFlCLfGKgJHXEVrD7oFSDKB9+cnnPvhDVxhODyIZJKrG5wdbsd77XQ+20nGJlg==
X-Received: by 10.28.223.134 with SMTP id w128mr5741895wmg.69.1453505449488;
	Fri, 22 Jan 2016 15:30:49 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:48 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:07 +0100
Message-Id: <f4224b41607c62aa93375db60913b9f376e5a3ff.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 05/21] python-dateutil: 1.5 -> 2.4.2 and add python3 recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:52 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-dateutil.inc    | 23 ++++++++++++++++++++++
 .../recipes-devtools/python/python-dateutil_1.5.bb | 22 ---------------------
 .../python/python-dateutil_2.4.2.bb                |  2 ++
 .../python/python3-dateutil_2.4.2.bb               |  2 ++
 4 files changed, 27 insertions(+), 22 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-dateutil.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-dateutil_1.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
new file mode 100644
index 0000000..b38c448
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Extensions to the standard Python datetime module"
+DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
+HOMEPAGE = "https://dateutil.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
+PR = "r0"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4ef68e1c485b09e9f034e10473e5add2"
+SRC_URI[sha256sum] = "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d"
+
+SRCNAME = "python-dateutil"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+PACKAGES =+ "${PN}-zoneinfo"
+FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-six \
+    "
diff --git a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
deleted file mode 100644
index 37f19a8..0000000
--- a/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Extensions to the standard Python date/time support"
-HOMEPAGE = "http://labix.org/python-dateutil"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
-SRCNAME = "${BPN}"
-
-SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-PACKAGES =+ "${PN}-zoneinfo"
-FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-datetime \
-"
-
-SRC_URI[md5sum] = "35f3732db3f2cc4afdc68a8533b60a52"
-SRC_URI[sha256sum] = "c08aca7d85f8f8eed61e83b3423b829262c596a9a78f7ca3de0bcee2217d0e3b"
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb b/meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb
new file mode 100644
index 0000000..12ae4c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-dateutil.inc
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb
new file mode 100644
index 0000000..1d2baf5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-dateutil.inc
-- 
1.9.1


