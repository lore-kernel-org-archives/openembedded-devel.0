Return-Path: <prvs=145ea1953=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCF27F43D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567803741; x=1599339741;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=fxTzNH2twPsz6XVTUZ9/cKbthjBU8q77c+KPfcZbbF8=;
	b=iZhe9nZ+hwqXByg0qYuSlVEYB9Q+CBOcC0JNBy7Ae8vIx8A4NA7pyh1p
	tz8kyfA8KUXrNuTMHuDW/4CxYbAHRjg+6Aks83DM1Ifm4v3DCQe5ddctG
	zgg/VA3yTenad/pr2leEl6YUnNjgIfI2evRjFnLUEDoqqfseOzeVOLiXL
	r1ERctffZx0B8WBluU/mt2PrY8SxB/e0IhuLkeFzmPNDJr1IFzy0p0TjY
	GMAM6fMLiKl5B5/l1onaOSXBpEkppISHUQz0lDwkJHXJ0mY/s10psy1Rj
	ZNbeBhtCCPqgCvJb7MHAa8BhfeDKMa72pLlfbn1im2oOXC9UJhc0AOv2n Q==;
IronPort-SDR: mfX2tj2N2B2ZkTAt5zvHABiWtH2TXnGFe9G55UQdR6bjP5hT/yWotpG4UplmYZdprJGFthMSmg
	QdW43S6dS9jh0Zrn55VHctnBnHyu5HH00Rt0kOP2ijfAXQJM7vZ2rLzG+usSM3TUndY1P/s/6c
	DU9nZfcTfCt5fkHU1N3fzDSG4kJotOwyyYI2TeLWNkTkIzjD15wiP0R8LCu18TvvgWBkERlWNE
	YlD2nsswVq1Tz+KESERu9iejqCTkNoyQlIK3/4YRJ/pJcJS/rk9FBNR9UbCBEXddmVGFRbPO5+
	DMs=
X-IronPort-AV: E=Sophos;i="5.64,474,1559491200"; d="scan'208";a="117692388"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2019 04:55:13 +0800
IronPort-SDR: QlBFJZnoPB8HnBZGN4rG0tYfCHXK7x9soXcGieZgkY7uq9E++aqm2J1nmtfvRrPakdTGrTZ8VP
	HOFpic5NwV9SLx6bkP+x1c8rJQlXq/RpP+Vcw0NKgSs1kE0ClAfHeB8lMhCSNDCcc8gTVyOtyZ
	0u/neiyh3HODcCAc1cbEjIguuxEv8qN/xE4/1+JZu5HO+myZECHOsMmKYA1Inz/st4fFkCzjCM
	yWFmH+2EbCKb5AoFHxW0N3ahz00rkoOxio8m8SNVV9DatWLxZh3jPkaoZFPR/edaOpKJjws5Xe
	4TxWfeHLo8LJqgnAEYIW4CAM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 13:52:07 -0700
IronPort-SDR: GN99wDrO/I6Lf+ip2YQwN2y4XC9jybTQvypQ4o5hdaKF4ncvuF23wzB+H3Y/w9tS6baxZKO+gD
	hRY9uwLn9YJ1dROnSBCopnej6ywJpmP9oDaqEV2JaKx9qoy37tGyvMN3O13/3Krm/Va9ceoomj
	jXCqNnMyQ1sYfWhdLafjeetFxIn+v60NZbjABIaXaoKJaYvVlPz12hAJbgcr4P1TeY2o82Le84
	gDkdpcHuN+W51PmMgbyyWWQucf6pcgZtDQOeHBbj2G5nB6dN8G/+q3NbnofV4NL826181bZzj0
	ees=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Sep 2019 13:55:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:51:18 -0700
Message-Id: <20190906205120.19040-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python3-twine: Initial commit of 1.13.0
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


