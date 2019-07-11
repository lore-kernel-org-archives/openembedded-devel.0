Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 57D5C6BA0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 09:08:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e2so4995822edi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0Ei/t+CVlBmAWmw6+oyMXc3rJnvoUpU4Ff5pI+tHlyw=;
	b=tLGdlQAQTNyKN8xjQvKCM36mlR1ei1yWzbX8+wrx3usmhlUJGD6mg+CwFJWzU7LUki
	FdKWE81+zep9dW/lo9HallRnvH3pO0/Jcd0YuYFSA4xOeUH6pdJoY/n32lSKo+d4JiwM
	O8esn61RG+dNpzjzsjBvfqlFtUioPTIpk2tf1PKDXYz8eN9KnpNK7EWVWjFNoCXWvbgO
	fDFNKzJ7+iBCeBsHb+jHbeE3Ims59qndqD2VHUXHHmpM/N3TViEjFer5l0Vt9lv5QQpC
	Sn+ejdJVCNowa0rYcEcm5/OuklKZ3EscZylbRQvc1GoflSukP/IadOqGtNeVw6/z11eN
	sLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Ei/t+CVlBmAWmw6+oyMXc3rJnvoUpU4Ff5pI+tHlyw=;
	b=iBIf7rMrQ8UmGfuIA79V0CoDexydtjIvm8Xo62PDF2phmiijX899ahJ9ooVAmORPZX
	RXzwt2KZTKmF8Y4al/0VUdOSL9LbEK6kd21+y3pHj7Nx8X1YgdIxLFYZL9tgR48Qnn/R
	jqtTY84Ycu1slPOEXOIe8VWcU46SXQvqEmWmodn8FKvJCkTl0uE5Nf48t8y5gX4cS8Bx
	tyhS68QHZZdkBgvtOjyX3tpSeoSyRdTjTFKhnyA1bbiDrtJDy84thtD2sRDL1083nEA9
	A5QpbvLBJvBZCeVhZ1TfKssGCjHcYIULtgUom0SL7eB4s+rklNyFd4RvZ3+A9f10wIDJ
	Evgw==
X-Gm-Message-State: APjAAAV34nGEkbBFaNawCU7woMjFiCUiokdyy08hTuZxva3ASm6I/z2y
	8PsXrOzDkvACgjwg45q2DEHs3V5L
X-Google-Smtp-Source: APXvYqxVpmjW0SvC6xRD5J6GeSHKRK8zljMd8XGr8X7kG8dradS7PRgypTZowX6vViO5ZHHGeLSlhg==
X-Received: by 2002:a17:906:6dd4:: with SMTP id
	j20mr2162919ejt.173.1562836107619; 
	Thu, 11 Jul 2019 02:08:27 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id
	gz5sm1050687ejb.21.2019.07.11.02.08.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 02:08:27 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jul 2019 11:08:03 +0200
Message-Id: <20190711090803.18931-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-humanfriendly: Add recipe for the humanfriendly package.
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
X-List-Received-Date: Thu, 11 Jul 2019 09:08:27 -0000

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 .../python/python-humanfriendly.inc           | 25 +++++++++++++++++++
 .../python/python-humanfriendly_4.18.bb       |  2 ++
 .../python/python3-humanfriendly_4.18.bb      |  2 ++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-humanfriendly.inc
 create mode 100644 meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb

diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc b/meta-python/recipes-devtools/python/python-humanfriendly.inc
new file mode 100644
index 000000000..94f7f8b81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanfriendly.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Human friendly output for text interfaces using Python"
+HOMEPAGE = "https://humanfriendly.readthedocs.io/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+
+PYPI_PACKAGE = "humanfriendly"
+
+SRC_URI[md5sum] = "9573f9f37a5454d8205cfd1b9b8db9d2"
+SRC_URI[sha256sum] = "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
new file mode 100644
index 000000000..4e03a654c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-humanfriendly.inc
diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
new file mode 100644
index 000000000..2ca5fe36f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-humanfriendly.inc
-- 
2.17.1


