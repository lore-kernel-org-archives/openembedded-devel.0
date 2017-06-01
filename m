Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC8277D2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:13 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 9so31959333pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t86NrH8kZmi6Ap7j6Tz/OI7wMWW0piCSKgjAiJG0y7Y=;
	b=OCI6XBud+/SHW4Q0iirHIoA/5aHoHwsxEW8onuAw0/7CYjmlDsxBS2NzTs5eTrB8hV
	CzhpIbbOYZVUYdmQJtF5ox57CPHkFm4A4CltQZT1W83vphjPO7kC66DyeIvdTFjlk8Uk
	/9oOilujHh8dYU7F6JIxWbWfIrzuGgjtaHvE5umMs8zfyAnkbQNB+IY/WYdWx/8yERg3
	+O61LKxFkTaDZGpmidlouGIInJxcbrXf02fO8uG05LvgPMtDREDkALj4T45vpGm8dfCm
	s6huar/6W823rYa+LShWYhwlqMoF2bosX5o3LrDkDTMp9omaQKBSQGpXnqwiLJCfg6qR
	+gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t86NrH8kZmi6Ap7j6Tz/OI7wMWW0piCSKgjAiJG0y7Y=;
	b=IMX+m3LZuD/Oubheu0NKFXLb5TeT874Ocklcg6yBdWyvRhbJWoMUK7yb7PeQjm80wa
	TrnCP5R231qWm21MvW7zuA/3K0RBDqj/oW5N2U2cBT0HVt2J7uh8JOKAgitnfZlFkGkL
	m86+OB3LCdKGngTB1tSQrb2OP3T11Z4dTK4eZNT+y38RMKA9JK8PS74GqS3lPOSg1xpq
	4+29udQffe74sHhRM3afdF2bNnURszWyANXuLOZ6E3hOUvwGEeHQW4UGDFE7g6iZjadB
	eibZQ60K9At0JrGlFiQH7KdcTWV4cQ+cnILJg3IwSnOfJm1eJjHvF+RBrc4ooRn+Q9CT
	dDIw==
X-Gm-Message-State: AODbwcCWNs2HCA3XWY/nfJ2I+gBWlv1s1v/cWBPv0HXfneC4PETHApR2
	csPRos0QtDcYR5Fo3aEANQ==
X-Received: by 10.99.113.20 with SMTP id m20mr1920775pgc.120.1496335395121;
	Thu, 01 Jun 2017 09:43:15 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:14 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:52 -0700
Message-Id: <1496335374-25575-6-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 6/8] python-mprpc: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:14 -0000

Extend recipe to add support for python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../python-mprpc/python-mprpc.inc                     | 17 +++++++++++++++++
 .../python-mprpc/python-mprpc_0.1.13.bb               | 19 ++-----------------
 .../python-mprpc/python3-mprpc_0.1.13.bb              |  2 ++
 3 files changed, 21 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
 create mode 100644 meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb

diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
new file mode 100644
index 0000000..3a1c0be
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
@@ -0,0 +1,17 @@
+SUMMARY = "A gevent based messagpack rpc library"
+DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
+It is based on gevent for handling connections and enabling concurrent connections."
+HOMEPAGE = "https://github.com/studio-ousia/mprpc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "${PYTHON_PN}-gevent"
+RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
+
+SRC_URI_append = " \
+    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
+SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
index 78df00a..6b2ea21 100644
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
@@ -1,17 +1,2 @@
-SUMMARY = "A gevent based messagpack rpc library"
-DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
-It is based on gevent for handling connections and enabling concurrent connections."
-HOMEPAGE = "https://github.com/studio-ousia/mprpc"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "python-gevent"
-RDEPENDS_${PN} += "python-gevent python-msgpack python-gsocketpool"
-
-SRC_URI_append = " \
-    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
-"
-
-SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
-SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
-
-inherit pypi setuptools
+require python-mprpc.inc
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb
new file mode 100644
index 0000000..837d604
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb
@@ -0,0 +1,2 @@
+require python-mprpc.inc
+inherit setuptools3
-- 
2.7.4


