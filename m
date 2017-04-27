Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FB6093E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 21:19:02 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id v14so38072353pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=uDiciffaGYbktt7ftLBWdaVdJqHPtuI+fwotTk6vFuIS8wAPK2GrKFbuOCcbPkgmr5
	CXNWah0aPSbKWu9GJ4zB3ZL4fNOuMOPCPHNI8g/Qr2VNvBFCkCoeff9hdDfYuZzTPPGe
	EYsq0934xjc/3EwYFqWBpE/Qfhw6QYSw5c1TrX4JvKJ0pUUgkGA4ppJyzjy8ZBku1Nb+
	/0OD58Xb9I6UWP04eMSS+4DN/BRNd69+4fRE2pkSv0BMjNUT8mI0/1zO4rHbRmSv1WZ+
	cvKpNnXDmZBsg0UrdLiYsvntuCQhddaz9BxXW/tvVvzh5o2RV8k7G1XMCc7AthpR4MBA
	guCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=MhGhQjtiNrfZjAIAjv2t4EXXVmP6yAcs5wn7IwI+aW4Jo1A8lidjiKcuEn51zt1pEa
	iJasTe6ApDeOhLsn5z81ld92bj9N9DfG30jAahn8D+y8bMWH/fRKS3tLEVKcHdggt/9R
	KtJgj7Kf/0GTAPUISxNBEdxnbx4mKtTSrXletHO5Ho/lhllx8p9il0ZDrE0kmc3Svx2U
	kF9UeOfQ0lCtm7dgEQrmsWg9uk5UNbbFkDsFSSRNlziwmaq9Pf0FTQwd9IV106o2oI0Y
	BZaWd2wBqv8+y8m3ZQUUmG0iBRjSvm/Tm22mh2+BoSzn1S+b0XD6e0S+jbOQMM6qt06g
	x7fw==
X-Gm-Message-State: AN3rC/7dW91MLHjyRVIKpW+dXzCGG8TwY6j1kz6tMmKuLhV3qzQDW/8Q
	KlkDVSw+77lgMdXj
X-Received: by 10.84.129.67 with SMTP id 61mr10304283plb.150.1493327943461;
	Thu, 27 Apr 2017 14:19:03 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id g7sm6572677pfe.6.2017.04.27.14.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 14:19:02 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Apr 2017 14:18:51 -0700
Message-Id: <20170427211851.10351-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v3] python-systemd, python3-systemd: add a new recipes
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
X-List-Received-Date: Thu, 27 Apr 2017 21:19:02 -0000

Adds new recipe for python-systemd and python3-systemd
which provide python bindings for libsystemd

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 meta-python/recipes-devtools/python/python-systemd_234.bb  | 13 +++++++++++++
 meta-python/recipes-devtools/python/python3-systemd_234.bb | 13 +++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-systemd_234.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-systemd_234.bb

diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb b/meta-python/recipes-devtools/python/python-systemd_234.bb
new file mode 100644
index 0000000..ef11831
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+PYPI_PACKAGE = "systemd-python"
+DEPENDS += "systemd (<=234)"
+RDEPENDS_${PN} += "systemd"
+REQUIRED_DISTRO_FEATURES = "systemd"
+inherit pypi setuptools distro_features_check
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
new file mode 100644
index 0000000..845b7d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+PYPI_PACKAGE = "systemd-python"
+DEPENDS += "systemd (<=234)"
+RDEPENDS_${PN} += "systemd"
+REQUIRED_DISTRO_FEATURES = "systemd"
+inherit pypi setuptools3 distro_features_check
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
-- 
2.10.2


