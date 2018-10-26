Return-Path: <offougajoris@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8844779C3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 08:45:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id a8-v6so634177wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 01:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1bfMEnaJbMsbA2rcBWWFWu5FHG6vfowBf2FUB31K0kc=;
	b=JEDl4kpjXapYPuTGgDPu0wU2JR82QfMiZFWOBXetgdJdQT45Jg/BL8GEW9K3YFG4nX
	g9L5zyazHvmsupsm3guh/vm/t02YmIPRuLBBZKhYnAQKOiFYMJ3tQ6f9wrzsdZl6LUtN
	BqS8RH1r8YcBC/FkZ2gFu7V8w7miPY6BQ2S/mq/xBg3cEmUSf1vFZJq9sQ8FotYNgupJ
	eJKYs1n64pkIhsh5iWasfYuDiRsHZiCuMKi9D83ef5daydd+Fl5P2uIP2JfJwv8Jryea
	3gLsnFPQSI1OtBotUniwkfsx5QMUu52pZK1lGtAPVeWfij/ENi22PVH8rLxj1sJhW8Q2
	1Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1bfMEnaJbMsbA2rcBWWFWu5FHG6vfowBf2FUB31K0kc=;
	b=YiCpOFwVpcwa94pEEFKEUna0l68Y/oTw77TH+KHMqiryH0xpKRu2VTJ967aRTf1nB4
	36M3xG5/zUpINjPqt1p7Q19yofyXIKunaHo36cjlLHWEjin82A8EmSlMCVYkwGz8NcJg
	z5pUiJ+T0VktpdB9WBbYG9buA+X7juuaqkksem/LhGisdPkG/pgWZXHFNySCgKexd/ax
	KOYunz8luXNPOdZOX7pRAVtFQtKsMkfGHnCELI8JAwBMeKK6tXPPXRmTKSKJSuLWuHm7
	BMLOfNjCZrGQI9+vWn23Z09VzOVVc5bMl+DCbiQYqoM4M9Rgxh+fvEOX/UjSmRgwG2QG
	eNWA==
X-Gm-Message-State: AGRZ1gI5nNQUiBKadZNvdp0en+WIW0tPmbqn9l7YLY/XNDuJrh+W+dpw
	/0dxmOzDIwrOPJQY10Vm2b+a4BuJulw=
X-Google-Smtp-Source: AJdET5d+RD9emiaNxJDDdtRvTNzyMrrRMJz0Bu9ScQRQOmDaUgTo9Ci4pDMwhmXOC13IcsDeQHcLbw==
X-Received: by 2002:a1c:5a86:: with SMTP id
	o128-v6mr4570226wmb.138.1540543524812; 
	Fri, 26 Oct 2018 01:45:24 -0700 (PDT)
Received: from N2x0WU.auvence.co ([92.103.174.138])
	by smtp.gmail.com with ESMTPSA id
	v30-v6sm9826510wra.67.2018.10.26.01.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Oct 2018 01:45:24 -0700 (PDT)
From: Joris Offouga <offougajoris@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 10:45:22 +0200
Message-Id: <1540543522-26888-1-git-send-email-offougajoris@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [[meta-python][PATCH]] Add recipes for django rest framework
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
X-List-Received-Date: Fri, 26 Oct 2018 08:45:24 -0000

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 .../python/python-djangorestframework.inc                | 16 ++++++++++++++++
 .../python/python-djangorestframework_3.9.0.bb           |  2 ++
 .../python/python3-djangorestframework_3.9.0.bb          |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc
 create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
new file mode 100644
index 0000000..8551a83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-djangorestframework.inc
@@ -0,0 +1,16 @@
+SUMMARY =  "djangorestframework"
+DESCRIPTION = "pip3 install djangorestframework"
+HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
+
+SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
+SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
+PYPI_PACKAGE = "djangorestframework"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-django \
+"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
new file mode 100644
index 0000000..540d12d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
@@ -0,0 +1,2 @@
+require python-djangorestframework.inc
+inherit setuptools
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
new file mode 100644
index 0000000..9ed6d17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
@@ -0,0 +1,2 @@
+require python-djangorestframework.inc
+inherit setuptools3
\ No newline at end of file
-- 
2.7.4


