Return-Path: <prvs=146f6ab91=alistair.francis@wdc.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 07 Sep 2019 00:14:37 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 7E05D7F440
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 00:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567815279; x=1599351279;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=fxTzNH2twPsz6XVTUZ9/cKbthjBU8q77c+KPfcZbbF8=;
	b=iIaP3Gam7OD2nZK86P/iDWaARe0HzZlwNwz/BM8ISI55do1WRnswqVPX
	9mrI63A5tijrNmmlx8g+6GaR4hx/khf6tzKqB2vR3AgI8/yzFIC/xz0Ax
	VxchAtqxhENqSZ0o9Fn157nvWJGZxJjYqaxgLCqVh1VbhOtSvPToezb4w
	tbemlwWRrJRZVACADInhsELzh+zHLRrGL70+tCEm1nL9ZPgk+Kuapvb9k
	E+MqIWZ8VUoCFt/OmsnKx9FX6qUtOZjHsBPPY/rhOKyqhh1a83kB+v5bt
	yDc/9K2P2Xio+LMWkXuOdi99HCwSPl35dq34j9c4gypnBtPNCf1UzLrEt g==;
IronPort-SDR: 5eymmKOn8ZZtN5V27mgo/11rEyL2f4GIDv47ZucEawpKj4ixNZyBujQokCJ19FtSVbwD9wdaJJ
	83eKU7oqMaSowYdm3W7esuKgHLZPYSpENv6X/Jv3Jegbx3AB70jcQFSWzJClgUgHtb5c7Do122
	IBOnzn8h5KBGPOt5l+PWvoXQTvyu/vt/rLj0URBApStV3hMxNpKbQuZgvCwDsUSECwG7EUJqwX
	36/jDH0WwGOTHN6gurtLLep0guLkXSak3eFXoMBqOpvcC9sqxzOHvQtmLSZ15+iMCM7dak6rFe
	Tn0=
X-IronPort-AV: E=Sophos;i="5.64,474,1559491200"; d="scan'208";a="224458638"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2019 08:07:32 +0800
IronPort-SDR: OJHfQMQv92EKwdHR8qSgwpgXyBYxng3DbtXZYoLHkovP9y9rt4D/Kuu63HCd3M5vZ4IvTXaC31
	I+D67GOqHCjkT1iTDOXVliF8lauawRjZe9d2jgQ4TfCJlf39wo9sJt4lp7QeBYMk0fodhpAvLM
	sq4eQaqWa/pJaiqeOR/4urKXl8P8pu8xMvBgjqleKEG9c0Mp480Q/K6w4cUWtDirvNlZ8BYaEX
	oSfJpjnRCtV16g1O5GuMeF4vfzFq3PO1cdD/LxIXD6DiMSQZeFe10rnFypn1oz3OOHPvEAEahs
	ftURCZLHjCnAW71aHEBaH+mp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 17:04:22 -0700
IronPort-SDR: yudv/8X7uvIb5bVLy57g/23E01T/I9kaOg9LOxrdPbXZtcROHNtSzesFX/3QN2ygt8x55yB7Xh
	cXPeueExKsq7+LzF7QGuU4SnvrYA/s3PygOrHEl8Tv27laucg5vOm7JUKd4f9lyYkg4ZvVnSE7
	Ej3dbKJarBJu5lb6EvhLcsAf2k/xr5vkp6XEW0a2c2gKhnjX15s7ANIVhAOCMmGIw8jiYI4jQP
	lmlNNvAd/EAzsefnjeAzyPD4N2PEUXVWDg/ynpYJUPFieXjUdgSR14AlKrutXW4+8ApcWHcBcJ
	1Ls=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Sep 2019 17:07:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 17:03:37 -0700
Message-Id: <20190907000338.15544-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 1/2] python3-twine: Initial commit of 1.13.0
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
X-List-Received-Date: Sat, 07 Sep 2019 00:14:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-python/recipes-devtools/python/python-twine.inc  | 11 +++++++++++
 .../recipes-devtools/python/python3-twine_1.13.0.bb   |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-twine.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-twine_1.13.0.bb

diff --git a/meta-python/recipes-devtools/python/python-twine.inc b/meta-python/recipes-devtools/python/python-twine.inc
new file mode 100644
index 000000000..2bc778da2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twine.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
+HOMEPAGE = "https://github.com/benjaminp/six"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2"
+
+SRC_URI[md5sum] = "6fb4da0c7d81ddfd48f619b8caa1493c"
+SRC_URI[sha256sum] = "d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc"
+
+inherit pypi
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
new file mode 100644
index 000000000..0456ec92d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-twine.inc
-- 
2.23.0


