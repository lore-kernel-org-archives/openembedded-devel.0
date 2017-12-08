Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFBD878695
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k134so6191090pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pwixQW6OdoteleWsxCaaHSLOSR81+/4j6rO1rhnVUCc=;
	b=osDeJ8Ko/TRb4Vqgm0R1wLePgl6K4dTJXeM8625qYoaQfeyCY7Pkaujqtu32Np3YUz
	ypyvbK1Kat9gsc+/34QSDROdwvKeBPCbM8SbNXeguc43+YsJD/r6pi7tadk4PUWpGY1C
	kT7l8PMU8UYij4h11Djimq30NT46SnnfIeayKm+673RbwrBVACH8GDxzdot4UQpYVMKn
	R2wbVTFsSw4cId1Hlb7nsrJ01QMdgmfyH1PZrxnZSPMHS3oscrnI+iJVagFvy/C1SlWj
	+3bN/isZhSJWXw0p0lwl7O92ot6XWZHzFZOAcDiFyU12jMPBPfD46qgNYApFzp6Q+C5S
	RaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pwixQW6OdoteleWsxCaaHSLOSR81+/4j6rO1rhnVUCc=;
	b=LSudfKs86yEpgJY7v2Wgjd6pLyfGCPujUc/RJCgScEiIwIXZ1my8hlTd44Oop+X2mR
	ePSCC2a7ztbGDI67OmE/f8ddCburNGB4+XXT9sXvxDT6NGyby17d9SMyJEciY2NCqLvc
	Tvb6RYriHymmJuQjzS2obhvPBTL9pgEKLHx3ffOg3J6Bz0rQL4pazwRbJYh8pkZ31quL
	i0RzcYJlA7DmQB4Q2OmD1JmwOxPVNckcv6SLJk+qlYWFLEgSw9w2ZURo6kXOOz5zsC7P
	87QCsIKUXq+M7xpPbCTk0Z76o006/ohIQvQJ7Ep2iRp5SWDTGcAOqCLfMPKqazK+zr1B
	Uwhg==
X-Gm-Message-State: AJaThX7Y1aI0KtIYYhcf/vrITXIvQqkARCwdH1pXbwy9auWk/fB5R0+e
	JXntoGPamSkR2KZfn8H9yJpDqA==
X-Google-Smtp-Source: AGs4zMahteBN+4tZpVC2Zq03CezpYpt/PsACys5lVr4oybX/ymUKF1WRJMm7mWAb5SfHI5l36l3Mkw==
X-Received: by 10.84.245.149 with SMTP id j21mr29035269pll.315.1512712168595; 
	Thu, 07 Dec 2017 21:49:28 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:27 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:02 -0800
Message-Id: <20171208054911.27014-5-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 04/13] python[3]-flask-nav: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:28 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-nav.inc    | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb |  2 ++
 .../recipes-devtools/python/python3-flask-nav_0.6.bb        |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
new file mode 100644
index 0000000..932ccdf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-nav.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Easily create navigation for Flask applications."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
+
+SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
+SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
+
+PYPI_PACKAGE = "flask-nav"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-blinker \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
new file mode 100644
index 0000000..30b5b3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-nav.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
new file mode 100644
index 0000000..d251152
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-nav.inc
-- 
2.7.4


