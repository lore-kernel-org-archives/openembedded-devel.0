Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF10778683
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id o2so6172440pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OHtvlaWjLtFCxjaMGJ4tFoxwEXc4+S/gjGeTFh+95tI=;
	b=Gz6TFH4T/DLO2/OkJQ7Rj0U3aFEBsx8jN/bozGeinAuMfqA07l3d7uk4EC2W04P3ZK
	gc2hKxuxYM0CrJisw1qOsWRUux0HxFYrfEvbo1epyx2epu5Bxqh9aU2NJ6D18i5GswqJ
	tgjOEmCLf/jm0+our5SMKQbTZw9FPW4XL3OM3Y19iqXLUlrBZ7KdpXf0w7NDeSQtsMHV
	8/uknVdnjheDfPDyJ+x5UVYuizVGWZCW2nj7zlhGFdqleRT94YtTHnT9imfkX3jo0Qhe
	OSdDxPad6M0wjJ8uuEhI7aYzGfj1uwhXz4jXcB94E/tqtj/nzrlAMfJHK1tDwbCr4Qiv
	3C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OHtvlaWjLtFCxjaMGJ4tFoxwEXc4+S/gjGeTFh+95tI=;
	b=dbEWENVCa40zWm3nxGcHdKqNIMBiYP6y1jAQ31mMxAkFASRMEDrL83a7FqlmdvXM/D
	xZeK1ClMKCpAcZSBTiGCAfzAkiVjBs/fAYASjYt9MV8X+YE+NF9ScqCjsNQ+dl0dt5rO
	oCruLGU6V0OQyyZ4AL80kCqEMfk2kkvMz/nJjwPpxBRaNpnY/ikfKiakBGtRI+Ecr34i
	dQArQ8WLYCzuBjFK69xW402V2KDNGF+lPcfie1fHH28MoKeDzmpPeG0hGVpyGP1+4R06
	DXhVBbxlrHnYvUqzAP/uFMQ1VZ2JmxH/DAQxEPdL9Sky+w57Jr2VgGWOnzm5dIDFA8Rj
	zKDw==
X-Gm-Message-State: AJaThX5mrgtEod+bwCn79eoH88G3SL3++r4Lhlc9revrpkbNoMlQ4/aj
	3PwwACIblWRn8KUhJQimsu3hqg==
X-Google-Smtp-Source: AGs4zMZHcyIkrJJ9aoPNyRldAa6Eslmr2EKEC2zZB5ghrAo8bT7oUH/Pb3iFJO6ruNw0jgwFNWkvAQ==
X-Received: by 10.84.246.20 with SMTP id k20mr29263225pll.209.1512712167025;
	Thu, 07 Dec 2017 21:49:27 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:26 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:01 -0800
Message-Id: <20171208054911.27014-4-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 03/13] python[3]-fask-migrate: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:26 -0000

V2: fix typo on .inc filename

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-migrate.inc       | 14 ++++++++++++++
 .../recipes-devtools/python/python-flask-migrate_2.1.1.bb  |  2 ++
 .../recipes-devtools/python/python3-flask-migrate_2.1.1.bb |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
new file mode 100644
index 0000000..7af4fe1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
+
+SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
+SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
+
+PYPI_PACKAGE = "Flask-Migrate"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask-sqlalchemy \
+    ${PYTHON_PN}-alembic \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
new file mode 100644
index 000000000..7af4fe1b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
+
+SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
+SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
+
+PYPI_PACKAGE = "Flask-Migrate"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask-sqlalchemy \
+    ${PYTHON_PN}-alembic \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
new file mode 100644
index 000000000..ece516f50
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-migrate.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
new file mode 100644
index 000000000..c98cbfddb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-migrate.inc

