Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4801E77E77
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:47:47 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id g2so35336538pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=uUafvM7j4qExsd54ij2Kjn/3JdFl5Eg8bOZ5lot5XzX8mxPt3YrnzjnWBBYwW1P40k
	Y/9hAwkKfPF+WoNxVO2vyvpmTraU8kO4JG8q/4F84VOhq+hGCxuhMefjrf+aIQLCChCo
	ox5gX1gQXHz9wxkjJ04q62b/T5xe36qe+3FLd3AgLptySV8YgK0/iTR5r2c4mhiFGwg8
	I3E34OkE7Q4nBlnllyzUgWG+jc3sIf3fD9xolnhRsbd9Ooej8OKbPCrTif8MqdQqShcv
	QiqYg4NCBfstxpI5nO8vBhrey7SWDk0Br6ZifojwmddTD547MnR8E2vO04HtgaCsstzN
	JPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O4TcrZuawC/KN3zII0akj5UWdfVOHDuHVIPaFBb6u9I=;
	b=FGSz60CxZt7s4oosMQ0UwMm4FV5kqDimAqVsvdocJ+VKGd6Ld17vCQhNlJUshXkQPw
	uPeqvci7l0v+CKJH9NgobpoFMuwXfGzc6gTjg6uGb1W5AflBc9BlMBB++JW3AlBusMnf
	gUF6PBMAe5r3iS9hXHaDgps8QYVzRIsVgx32J6ELziD8Cqq9LqgGHF1WRuvad5cKoWzZ
	+Pmys6Rf9omYTtucINSWTbljS5Jcd/OaWPt0Mh/Rx7TOeDB2qG/8ZjkrF3Pjr/y4w46e
	4IhhVwAj6/oG+TQz9m5yA38XY25gUoUEgOUnMEgTwGCejGmXjYWMEIrvRZgEbyWKYUb1
	r1Mw==
X-Gm-Message-State: AN3rC/7uN0vNTMbzAo0TBh2HohoE9+xeJoO/e5ezrubAr1jC3F2cO+dO
	OGNIEtEGJkOH9k94
X-Received: by 10.99.115.16 with SMTP id o16mr4333855pgc.4.1492116469214;
	Thu, 13 Apr 2017 13:47:49 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	t69sm44121483pfa.81.2017.04.13.13.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 13:47:48 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:47:14 -0700
Message-Id: <20170413204714.20110-1-andrej.rode@ettus.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 20:47:48 -0000

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


