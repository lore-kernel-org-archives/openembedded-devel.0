Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 522 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 08 Mar 2020 08:16:15 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 3736D60115
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 08:16:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 418A22203A;
	Sun,  8 Mar 2020 04:07:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute3.internal (MEProxy); Sun, 08 Mar 2020 04:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=hHfxixNv90KCm0xligtnIS1P8I
	ARXKQIEa8fj9gXGKs=; b=akfilTFI8YxLjPbylmr4uLFlCKrVGvyoYMBeeIjJKm
	EQp4e8HkGRuNvTLqyoxD/boxjYElfA2aIYSTzhCE/iXduTDBXYyG2vTYpqryfcxr
	Tqe/WBLZfy4SFaEgdmRsd8beNBagxXzwnn7jUVJex82RBMq8+sicZvbE6GbobG0x
	X8Ucz8gGJOsJLbwtR2Lw62YN3mWkjqIGL1coDtn6x/F1AP5RO/DXO51gSAr3P6/n
	AkDL8GYP3I874BystV/mqaR7i/S37NxlZDZpE4RBqTXGD7zdZf8j3brvX+/Mn4ui
	EOIWMBGttvM/01hBUYjyGZYKR81ZT72PuqJqa9xxpGQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hHfxixNv90KCm0xli
	gtnIS1P8IARXKQIEa8fj9gXGKs=; b=dEzynkFrrTIGWiT/5xaF5pj6n+SvDo97i
	AEiutwWWkhnFafNGlqtWFF3fiIGi1B4gVeRTEdxMyG7Ecm/SDMoPDRYcAmoqqryB
	M9PcJUbBODxxopEW4DVttfMRlUY8i6epMSayijRcZ4Xs3mCL/5o48IJsrqydo/Rf
	62n7KDSWdosJvwaSGIv/8aHT9EciSHmsY3i8GNbmGjEBkMxjyFRGtyEEcQHOXL8n
	VDHJM6PjnG5+AksLZzzvo2yO7qNPUU/9E0/L9pNU/z6A0BRdr5imNqmg587fuNS6
	3dd3qDd34mMYlAmVNi5snU8p8kIHsGVpY9splMW5LNoJBPnjRAvGg==
X-ME-Sender: <xms:w6dkXgFSMz51pz5c0yp8EbSX8fAyx8lEkTk2Aob_IqY7D1kA2VBV5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduhedguddugecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
	rhesrghlihhsthgrihhrvdefrdhmvgeqnecuffhomhgrihhnpehgihhthhhusgdrtghomh
	enucfkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfr
	rghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmh
	gv
X-ME-Proxy: <xmx:w6dkXqA3aj2og-p16D7I5ZD_awy8JF3rAcdtd0haORPwfiQ5yVx-Eg>
	<xmx:w6dkXupAhP45R-fDAcqSR7c3QDTuJwqPVS-iwcp9dUbjwRwHEIZQlA>
	<xmx:w6dkXilprAbeiG1lGumTTEXDNDSqNAJw3gDx-CYXjxfNhKR93P_oeQ>
	<xmx:w6dkXrSiZB-9MSOMOroK_AZqWjoEp1BX7UZcfi9IMgFSGoToVKfBXg>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8DCD4306130A;
	Sun,  8 Mar 2020 04:07:30 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 00:07:26 -0800
Message-Id: <20200308080726.6318-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] python3-obd: Consolidate into a single file
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
X-List-Received-Date: Sun, 08 Mar 2020 08:16:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python-obd.inc   | 11 -----------
 .../recipes-devtools/python/python3-obd_0.7.1.bb     | 12 ++++++++++--
 2 files changed, 10 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-obd.inc

diff --git a/meta-python/recipes-devtools/python/python-obd.inc b/meta-python/recipes-devtools/python/python-obd.inc
deleted file mode 100644
index 51e663b51..000000000
--- a/meta-python/recipes-devtools/python/python-obd.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"
-HOMEPAGE = "https://github.com/brendan-w/python-OBD"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
-
-SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
-SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d326812ad77b"
-
-inherit pypi
-
-RDEPENDS_${PN} = "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint"
diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
index 578e38d3a..55131b333 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
@@ -1,2 +1,10 @@
-inherit setuptools3
-require python-obd.inc
+DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"HOMEPAGE = "https://github.com/brendan-w/python-OBD"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
+
+SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
+SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d326812ad77b"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint"
-- 
2.25.0


