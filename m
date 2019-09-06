Return-Path: <prvs=145ea1953=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 675557F377
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567803741; x=1599339741;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=mTmOzB3PzjQvXkivfwhvoY+E2AS6GwnXIhndDIdTTAk=;
	b=bLh+v+U+eOrU8AVLrju7DpZAvy8rQEhDbTTYYSZ0hAmN43h1pnadm45X
	mEo4sLHt6zJz4zDAZrb0buPytxKm76tsYUCN1evDuGd4CZF1VmnOW14aH
	RQDbAHHonDVKTTILB96uNmcR0X+7XCGbJvJJMOmyIWMRoi9X4mCJWPLHM
	KcjcNHjvj5bJWYdOqExcX1k8gV7kKprrmFp5BIMQeXzHGm3v57CQJT7qX
	t0WM8bEbC/S5HJO4KqmBVwpYcLLRPQkZMR583W2Fu42Y1b+bjBDLF7iYy
	r9pDy+nFb77/SJXSNoxlPfJ57nhimMBmKmgW+EFfkWb9mPq3HfDfYp4Hl g==;
IronPort-SDR: iIUQGYmbJdmCp9vqCPljKisz+XMRgJWrb+4XBVDmvgMTQ8Xoc+ZSvLrCRyAZg1kQotY/ESCmtJ
	uFKNfMOHtvjIomyF5pQsKMG5RmFxs/65zKyPSyd/fZAXQlKPplhy3xQ0q1jeHN+G0Pe1Yj/wJm
	Yc6i5HLin21TpSqpumkdco1SxkiroXYheH7hduEOSeJDEdDv3hhPR3Rad6eGGlRSGbAzsmkLXP
	FdKVrvlnZ56139e6Rvld0QclnZYtYCD42TBWjyBfVPiuWL2Fk1mrLzh4gdhT2QEIN5OOnhiQtp
	XsA=
X-IronPort-AV: E=Sophos;i="5.64,474,1559491200"; d="scan'208";a="117692390"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2019 04:55:14 +0800
IronPort-SDR: OBVEhptMd62fzi1e7oeHCHUaY2G0wMZMwN4TFVM6orhK202u1aWTPkAGCY9/yaEz6WVzMsTkN2
	v8SoepMOYNtg2hvaR5M0AH5GZq076FicThwFeZaQnDuDAGjJXA5Jw+Nh/EGc3ZeEp1dQHz7WIh
	aVU0a4bRcTgzLgHFufRu+ro8Chdok/jlQ/8aIrtwpICBAntXTWoZbOvuRiOqcoPQApqi6V3cDK
	YoikSQTgC3CLogRZZlgx30E2JDCBucfaiO5GjYTAjLPoh+IYWPoBdUE+9AcyI+4Rh7Ix+tME+k
	wVk3wXnzceQbRdFGCbwnjC10
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 13:52:07 -0700
IronPort-SDR: HxcrrCi/nLJqB5OyGPR1+Ry2P+iYYNyPqzTJVG1MF6UcQSaX+WITnNdsJSxtCJG+XnMXm70vKy
	Z2vgv2O5DB0KJabeH/6MJjSK1ppbv+X+inyld2RJAASOTup5Ccp9J1rIyKENiSI+6qkwg5YGzl
	2iRQ0+WhKHwfIWpKNxFICBvLIAkcfL9DyHx8AEEEdjzdtkoLuX9mIWfCb2RFQHImVn4PwDogfV
	TOveGsav9YsuqRGsyh/cFHc6NoD3GqpgMA4MR0ncx0VOkhCE6cR6ha9k5rmvY6grWyVFD+1KyJ
	PM8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Sep 2019 13:55:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:51:20 -0700
Message-Id: <20190906205120.19040-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906205120.19040-1-alistair.francis@wdc.com>
References: <20190906205120.19040-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python3-pytest-asyncio: Initial commit of 0.10.0
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
X-List-Received-Date: Fri, 06 Sep 2019 21:02:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python-pytest-asyncio.inc                | 13 +++++++++++++
 .../python/python3-pytest-asyncio_0.10.0.bb         |  2 ++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-asyncio.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-asyncio.inc b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
new file mode 100644
index 000000000..ad549690b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
+LICENSE = "Apache2"
+LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
+
+SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
+SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
+
+inherit pypi
+
+DEPENDS += "${PYTHON_PN}-pytest-native"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
new file mode 100644
index 000000000..09f26f8d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pytest-asyncio.inc
-- 
2.23.0


