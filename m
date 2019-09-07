Return-Path: <prvs=146f6ab91=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 97EB57F447
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 00:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567815279; x=1599351279;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=hOiGTR/IR93jps9fdy9IxqEEDzm0oGgJy5ZlFZWN8WQ=;
	b=POHWIc5xrniGvR86fdmaTv04CP4iSWfZt7ULF9Pg6GpIQ1zczL65yWEu
	DAfKSA4d/Z24DjXjo+FakbzX81cva2gMVQ7gr+mb0hu+QMRv2lGqk2b/H
	GGSHn4we1vHUyiEdD9s0i+Yr1Ov1IjMoGqnC8AABI6scJ9W5GUzty16Mc
	oHCiSzqNQTKKZBrLUuckkA7C9wSlTNf90IugPJp25PU+UJrlQtU36XQBg
	LAnNeayF0PvBABSOTKBlDgGedWyhoEXLtVHlogwkwbIY2W2Ns8EiSphB3
	Im+G96T487XAJvzTttNpHjyZv6nqFXWGZK3oEOf6KELuIp9XDK8aWS33/ A==;
IronPort-SDR: cxItJDetzN0oIEsGIAQkVyTO59FzAaiTftb99PBVnO2x1+iEclQPwfasrUnTMjmkqy4Obl2SEE
	iIHNnNp5gfQmOjAdNO5EY20HcBrb36zeV4GVjwrz4QoZJ8/eNIBKBd/oLtYzFtzBk5r/wFkkCM
	mB/n27hrqq45oVp8PKH2EsMJiLfoIoa574RSOwxoF18os6IIBBnsI2LaQFV+dFhfnLfFg+rNIJ
	x6p9hoA/ZhZtdB1UNHTjRZhSdsFd0aIB1+UClsExLCVTLMHydn9cKkj0wbfxvGsBEj3F1kjpH+
	H3Q=
X-IronPort-AV: E=Sophos;i="5.64,474,1559491200"; d="scan'208";a="224458639"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2019 08:07:32 +0800
IronPort-SDR: 4rYvl0PQw6xxFKoOvNZTm7UqVtVf5KGUYWbxbg2/9RiUx2hmkt5jqKsSjl0Rws4RBKuBSw+RBs
	b0dY1GUmhnrlLtxS1NFVs5R9isDChZLdwhMlhYvHdgrx1w5vgBMzcnfFNz5txYlV5M7Pj+wF1R
	udjJTgJmKihl6jrzgoN0t0RSu7FoQt2JuQv43bfw2NP7TKXi8fhD4406ftRMXgN/sgo9i25/4U
	C38E4HuZ0PhBLETceR1eRCkEAKrXc5B5pUFMCCxmNOEUG1Z1oWNrmqf1+ZIaSCKvQ7L660l959
	McB7pG+mCKxOW20426Jwze9V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 17:04:23 -0700
IronPort-SDR: tIKi2PlqRfyBf3Iz498Lwgj/oYgRfFb5ebLgTN49QXla/tp7B1147PN9BfVWnBfuK34KxUtBgh
	OUqt7XQGp8oADJVJpndfzym9tNy9VEqMR/qSvN5zEIQK15JbDcCt2YM/gx1njXS6ntwZeeLV5r
	WUNnmIue/1pfJfca41MJEx4K7c95qS6G6Ggzw+GYX/8Z7wQdvLIknxotHwaAl1xKtvwKIpEyAM
	owE99PYvrMjhCcVkdV5p52AujctcJDV4mNSi899VT/jxUSX8zXluE3L755DUpZvQYur2Cpaijj
	VIo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Sep 2019 17:07:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 17:03:38 -0700
Message-Id: <20190907000338.15544-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907000338.15544-1-alistair.francis@wdc.com>
References: <20190907000338.15544-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 2/2] python3-pytest-asyncio: Initial commit of 0.10.0
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
 .../python/python-pytest-asyncio.inc                | 13 +++++++++++++
 .../python/python3-pytest-asyncio_0.10.0.bb         |  2 ++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-asyncio.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-asyncio.inc b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
new file mode 100644
index 000000000..9132c7452
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
+LICENSE = "Apache-2.0"
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


