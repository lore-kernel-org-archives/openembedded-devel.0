Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.27431.1595199941130392457
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2020 16:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm1 header.b=Hvcxm4Nl;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.26, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7A3B65C00DB;
	Sun, 19 Jul 2020 19:05:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 19 Jul 2020 19:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=98489t9pz13E/YmntCqajEU3hz
	5U/bsLDqIphk9TfFo=; b=Hvcxm4NlTpr+wMUdmxOkStvRe3er2xbuwUBrIfuVdR
	2WuNHRxiw/r/742bs3/UTAQsZsuEWtlpj5uG7lGxwNv5espvD+tYdOxJ0BG/uH++
	cFJNGBEqSLPJDBNS4+anSC4IXlyNTY37cUYKN7z+4w621TFNZYOzybeMXft5evXN
	Uj24QyeIUXEEH5rD4dum9haVpHOaPzyA4NnIvkdY/qVwgEKM9q/x7DMQexdW96I7
	iSXzC/N+iFf0dR9mks414FPS7f2VbtTjMny8yy5Hbw2qJz0InzIGICHCjX9z8l6c
	KUPKwWcRSY0C7X83rnerp+Xjajvmcd6A2+H8eiamxa6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=98489t9pz13E/Ymnt
	CqajEU3hz5U/bsLDqIphk9TfFo=; b=k9JzTn30rE4f3TrltPvXfFW1KTVtE/w0i
	GbWt44xEYnNNhKWlgomgCIceTDCLt6+CwLR84QLHwSD9o0KzERfvl0NdppNNRJHP
	cpYYYqU6O7ZgJ4a2RDeMly+zOGdkve1f97PBWWP6ei/fi3MkOfKmdv3aVwxyeVJl
	gPMBaT5AFyedo0r2lKlMnMka/RFPVK+ulUvW9HLuHZTqNKQ81c4WIM+00Apq+TLp
	EIczF3aI0sa1Vm5+HONlDf5qzm6Bm11Dl6mcoM8mKjA14qPNwSJpoAd2fREs3uQg
	K4J/4rthYUHvL6mp+d07KeXl0mn7w4Xr0ziQRNu+/rjC10tBCGYsQ==
X-ME-Sender: <xms:xNEUX5OeUxwm-_OdcH4MlrS9D0ZZowLbn_JrZCvovSORk4paNSCjTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecukfhppeejfedrleefrdek
    gedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:xNEUX7-yjCFNt-Y4IppezSB3_v2-OaYgp-jKAkLLb8KTNB4Fu6UnvA>
    <xmx:xNEUX4QN9BJev48W04qElU_pkQkH8YUy__uvm6F_E_0fFMkCrjBRHg>
    <xmx:xNEUX1vFoYj7h1MtulQKAe4oxxaFSliz-h7lf-9YgH1H6sj8lDEtOA>
    <xmx:xNEUX8-Ky150QO-k7djbH3MdmsCXJ6czD3eP6muocagzG1V--U5Fmw>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id C550730600A6;
	Sun, 19 Jul 2020 19:05:39 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] python3-obd: Add missing setuptools RDEPENDS
Date: Sun, 19 Jul 2020 16:05:36 -0700
Message-Id: <20200719230536.2343426-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python3-obd_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
index eb8a5a747..8f17068a4 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d32681
 
 inherit setuptools3 pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools"
+RDEPENDS_${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools ${PYTHON_PN}-packaging"
-- 
2.27.0

