Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 17C7574D0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:50:32 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id e11-v6so3332216plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DmBl/Vl2nDg3Inp6Q/OTZSvt7Kle6/Jj8lQ+7D5sfoc=;
	b=bJP98RLoOB6zJH0MJRzQ7wCQGDdPOIuiLWKuqC8pT5Qxgd3V2hFpjh8DnxmmuXYFdt
	f5Ta4oWVYRi+AMGYxHXnR6cRwpO8GUr6EplWsS9dhbZI+mPwGuuxjRqG0CgbAYf420kx
	rNf7tYUoue0z2HBURpDL4T/BeBeDwgN/HIQ1MV+yivV4qz894JnjWEdLRPC/o82PLjix
	723PMHj98KQcxcQpRekOPcfrUDw867K4B+Cvnj8aIuJkmcuikrz5B6ABwDmAGI/C0LI+
	s50lRPcsGmVU1vk4BjpTvJwHZJ8o5H6v2dgA9nc4VnhdkEQ4l/E8h18dpQAZ6aY8dIXZ
	PYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DmBl/Vl2nDg3Inp6Q/OTZSvt7Kle6/Jj8lQ+7D5sfoc=;
	b=r1dIIqAZfXNH4E2xtM4dg86nxqZta7FrDdNeT4wVBKFDT9pZOYyM2GHGE8WwY/uTQN
	ERImqbH/ggp+cLXhz3gsV2DixZLCK/RxlVJNZ4aXYbRhf/vMJFsLWJJ/CU+S5q1+CAV1
	c/sZZ3RvhFKnqUJxri7bFZVWEo3XCFsEE9nd3SyC+bYDPWbZyRz0WR2w4OTqXsj9kkfj
	wHYj3PAVvRgNO5eg0ykF6xY/cPcvG2Joy/XgJLoCXkcmdGeIhV52Flfsq/b0bAUCFSIW
	En/NPKENQE3ZemTY/NpHMrOyFmEUbawMs0eGMvBPXfs+Poq/XAa8UCFbHDfRslB0g2Z/
	vZOg==
X-Gm-Message-State: AOUpUlHdygr5QE/52fFQZpqWn+gCBL+1N81EgM+Tc8zzQo6asumytmjg
	Y7GEQjYaUVx1svnFEv0pSBFBlWH5Nw==
X-Google-Smtp-Source: AAOMgpff/PtLp7fWMJ5ovQE+Q7xYgz1BxbRDtHu9CYl2LfhYqeLkBAJ7c7S9c0s/BLQfVYe6TXlXOw==
X-Received: by 2002:a17:902:6105:: with SMTP id
	t5-v6mr21333727plj.92.1532526633995; 
	Wed, 25 Jul 2018 06:50:33 -0700 (PDT)
Received: from localhost.localdomain ([116.7.217.144])
	by smtp.gmail.com with ESMTPSA id
	q81-v6sm31592877pfd.15.2018.07.25.06.50.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 06:50:32 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2018 21:49:54 +0800
Message-Id: <20180725134954.4746-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python] [PATCH] meta-python: add python-inflection recipe
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
X-List-Received-Date: Wed, 25 Jul 2018 13:50:33 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-inflection.inc  | 14 ++++++++++++++
 .../recipes-devtools/python/python-inflection_0.3.1.bb     |  4 ++++
 .../recipes-devtools/python/python3-inflection_0.3.1.bb    |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-inflection.inc
 create mode 100644 meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-inflection.inc b/meta-python/recipes-devtools/python/python-inflection.inc
new file mode 100644
index 000000000..556b26820
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-inflection.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A port of Ruby on Rails' inflection to Python."
+HOMEPAGE = "https://pypi.org/project/inflection"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de7833d9c2ce0052a4073928c76a13d7"
+
+SRC_URI[md5sum] = "7941165e9f148e0520023941c0886b40"
+SRC_URI[sha256sum] = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pytest"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
new file mode 100644
index 000000000..4a9d49791
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-inflection.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
new file mode 100644
index 000000000..cc36a02a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-inflection.inc
-- 
2.11.0


