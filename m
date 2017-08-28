Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED34360290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 05:38:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r133so5574799pgr.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wmC31c525cZuPhsxx+nUjCho6hUKVvjVynSjZ8Yv9Sw=;
	b=YUjWfEFY+LLGTMAEYlxxyz5MiUlSdwz9zWiX4NxDS9Dqjz+ziz1xHehzDS2y0KMHKP
	vLuidOGDC5uA1OyqAZAZBmVrwuMD1IW7xlKHgnOZYXQTgV/4c8oHqfbOZ2JTEtckO4/O
	dNbYqmRmjPuWmDJkCTddeQfMf1hnVyagmgOQAWRacG4rui85xb4/TDVZO5M0xupyOQvC
	xWmehbkbA7+ExoKNxFlCnFynXdstEtIQF4NY1irO0DQ5TpZPODhy77QFlX4sTCSVOx3W
	7pviCbytBUXCc+mDRO5teLb1Mtyh+8qBmti3eCHaaN3w6DOfcgXYQMhDT4f4gL4ez2Kv
	Kdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wmC31c525cZuPhsxx+nUjCho6hUKVvjVynSjZ8Yv9Sw=;
	b=aPMYGTkBb2ktkf5wLPwIKlL2K5WPfSP0yx41h2zCREPyg+h4nuSCQWFPImLeQtuQPR
	l1iV4xGXQ1jvZFAjmcvu9iAzrif/AjYUY8l2+QsHdm7THLBNmgulSRxGQqLA2c6xVLPk
	XPMqml/dApNHBgH5wqx35qRQCMb2kbETxlsivpQRq2pnh5b2vYSNsbh5C0AtV2yzLNgB
	fULbrKxUi8I56LxKzle38OITkXuZA98gYGNBqOlS5sjOoqYG3TaMOIhz8DBrILjmk/E+
	YCn9z4MtP4WCQ+QsMxkOs128VnUQHFAJPPVYUGvB3scqkQYT3CLdlzDNJgw4OAal5RHF
	XX6g==
X-Gm-Message-State: AHYfb5iaJJztJuIqPqX6tp6r0UrUA+HqWif0bIFOngeh5/OTQVUQ2r3a
	NKU//AOtdrmNfjKL
X-Received: by 10.99.109.139 with SMTP id i133mr2241597pgc.440.1503898693073; 
	Sun, 27 Aug 2017 22:38:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c80sm22113515pfj.26.2017.08.27.22.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Aug 2017 22:38:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Aug 2017 22:38:03 -0700
Message-Id: <20170828053804.37296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/2] openhpi: Fix ptest compile failures due to narrowing warnings with clang
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
X-List-Received-Date: Mon, 28 Aug 2017 05:38:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openhpi/files/fix-narrowing-warning.patch        | 20 ++++++++++++++++++++
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb         |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch b/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch
new file mode 100644
index 000000000..4c545708f
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch
@@ -0,0 +1,20 @@
+Fix
+
+sensor_factors_000.cpp:66:5: error: non-constant-expression cannot be narrowed from type 'int' to 'unsigned char' in initializer list [-Wc++11-narrowing]
+((dRExp << 4) & 0xf0) | (dBExp & 0x0f ),                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openhpi-3.6.1/plugins/ipmidirect/t/sensor_factors_000.cpp
+===================================================================
+--- openhpi-3.6.1.orig/plugins/ipmidirect/t/sensor_factors_000.cpp
++++ openhpi-3.6.1/plugins/ipmidirect/t/sensor_factors_000.cpp
+@@ -63,7 +63,7 @@ static cIpmiSdr sdr =
+     dB & 0xff,
+     ((dB >> 2) & 0xc0) | (dAccuracy & 0x3f),
+     ((dAccuracy >> 2) & 0xf0) | ((dAccuracyExp << 2) & 0x0c),
+-    ((dRExp << 4) & 0xf0) | (dBExp & 0x0f ),
++    (unsigned char)(((dRExp << 4) & 0xf0) | (dBExp & 0x0f )),
+     0,
+     0,
+   }
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index 64b2cc38c..6375c2ee0 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-failures-with-gcc7.patch \
            file://c++11.patch \
            file://clang-c++11.patch \
+           file://fix-narrowing-warning.patch \
            \
            file://openhpi.init \
            file://openhpid.service \
-- 
2.14.1


