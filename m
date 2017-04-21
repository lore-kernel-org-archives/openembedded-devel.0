Return-Path: <andrej.rode@ettus.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2128A6E671
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 18:02:42 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id j201so105746651oih.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=RlVBM5VzKLpj+r+aioqpY/rkWjO+wlcY2M0V43naLHdNLPnh6PVw7YtViPFH9A+547
	b261ztg4MoZKEc/sUNuAaMR/Kq49RdlZ0GuNOi/s/G0dXbN92aJl/3O37ZptE5hrPfpE
	67yQJkLgiwLkkS6ZWd1oo9uEc4o+yhmQc1Tl+KtgCvU/MIiTa2+8+kTlXphaWG2DhH8u
	+0TttNk548WX6JoPnqg5B5e4bizViCpU6fr3FuB+DQPi4qkdvowuDOt/75FW1qSfcPaO
	SOx9tT6YxPXjGhAOQea6TLxhw/hMWmBLrhIq+PgBlUC1pSNPGQp+2zMEc2nJsXVjNNu/
	I5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=EPPGaIxHxb8nc1w6TFDLIQAzXxDUA8uYqVJn3nF9MU3TU/js1330rQ30ySIkf0FGGb
	aFeoNuSs3uuI1/nLaohUcXHtbNJ5m/H7/tF5l7dO4CKib+DZHp6ApEXFfQmDAd0cRFHI
	eIX80CslvVXwOU0xi8rVb43/RPLG5zzIRD2CfFrIxxb4Y6piVcoxqP1VFvLVtkJ2pyDU
	G2LHxufFscrbVReW6L1MCFj6cpFnH3Mxa1Y+Et3XSdkwCEXvD97vX1VO/kK4JxPp4Y6Q
	55QOmzyEIa7kukcoD89iqYBGPImyPhniVupEscyiLRzkSr6xI00Ptn0RwzhMpd501gOV
	CQmg==
X-Gm-Message-State: AN3rC/665L8YjxeTJwRM2wdNUN+q9CjFtLb6Hs+159D+eg+RdE8cLJGk
	6z0LK1H2XQ2R9SaX
X-Received: by 10.84.194.195 with SMTP id h61mr17693817pld.182.1492797763282; 
	Fri, 21 Apr 2017 11:02:43 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	o23sm17284007pfi.100.2017.04.21.11.02.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Apr 2017 11:02:42 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 11:02:35 -0700
Message-Id: <20170421180235.8389-1-andrej.rode@ettus.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 18:02:44 -0000

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


