Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 45F6A7FD42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760126; x=1600296126;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=P1MPxwTGxmRYqS5uRHaaRzZ0POLu/W0VOYY4xrqRzw0=;
	b=TafxM+AkHo/lpvVoG+WmOpWb9ISPxTlyB9bNQJ/GX0rPtzq/G/b+UaBH
	w0j84wKE778lprRxTfyt2oaM3yCG9p4RS73gVqOrbpHZQg24HtM3du+f3
	uLL2M69aanADVlScDDNMYXTziTJNV8WRpbnm4VyKQSJJePM3cLmqviN82
	28GKPg/R61Oxf/GTvvIo1zyRsRrqsFBli+hiuYhAsXJfdQgxreJVwpSJ+
	OuTx0MeLEheWmJAQRuXagrTeEQtrb6UaaVPcB232rKdiR8tUDAXf6JoHF
	VqWzV/1lqKtfbPE6Ohi1tfTtjouVrEjIBN1/tTQZP4l92FErY5TFJBOOj Q==;
IronPort-SDR: iQz8Wb96bALcLEC7qrDdlqhpBjeEr1ev5nw0dS36U9Ze65WZg+HOKYnFpgqZzF3vtrv0+pXyND
	Ww7zuGBcdmxdPkdwMREpgvirxYMY2tA0ujvbF2FdjjmeW9MfXVQRAoWKU316YfXxbMKjA9/lAR
	K7TRWlO2w41ydWo8GioiaQpXMbKVrxEGJWQ7zLKko8237Ngp8ODXl2Ynw1ihKEN7Kh/n/T4zSQ
	MAZZJYbARWI1oR4W+Pjn/z0QPhN2qm0RLDXyS2RS0HFMMSd0SEdcoG48IVVwS7LDpZJ+zbabMF
	348=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052162"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: fuGvtdOlsYXm5LhpPHPIIHo5gIxX9bNqH+WGo4WF6Psforv30B7PXI6hn7lp6pn36cMTe1KHN8
	3Hl11hfrOvfRsKfW5rYyAbekv1geleLAEnvCgQCwACIT6YyjElA2P1sGsA4kmEC9BsFInKTQzX
	8hUSFPHUac/o5xSkbPa789eAitdERuatS+nnyYtTkc00CMSz4gdbXY8BFgM5pTtV38qV7KAqH9
	xnencx9K/+Nl6FmWNmJx6j6uvTG2glzEBdxQ2vMOeKQTsAUQpqlYiao3lWS6GHVlkp6ta5GDqH
	txEDtmAJV2K+Kym0BeNezlm9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:40 -0700
IronPort-SDR: FLfeW3HYJFD7Q/RBRKWqB1K1pd+QZ8sGiegvrMYQCi6iVCZAOmE91UHmea+U09GmCVZWCYHD5K
	5n1X6l8b63uAnGkhbitfuAOi0nQWT7FspugbTjhAP5jfALDoAPOllxqAFDRDj/7iUS0o5s0erM
	ddCPQtuUh8rWiPOpQmhhVafliNl37LOfbmpXf7GgadhhLVI1Dv4nNq0GN5LdyjoF6LEISxGvTH
	icEsxyvpnvVFO6YNsE78TnoLNTlNsmuOkPNQ2kH6UzO0f694iL2Pq6pzFy9CgNnmRqNxnMGRi3
	byU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:57 -0700
Message-Id: <20190917223757.19701-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917223757.19701-1-alistair.francis@wdc.com>
References: <20190917223757.19701-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] python3-pychromecast: Initial commit of version 4.0.1
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
X-List-Received-Date: Tue, 17 Sep 2019 22:42:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-pychromecast_4.0.1.bb              | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb
new file mode 100644
index 000000000..1b9301f96
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_4.0.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
+HOMEPAGE = "https://github.com/balloob/pychromecast"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
+
+SRC_URI[md5sum] = "d6f96d478fd768696a0e440cb0ea903b"
+SRC_URI[sha256sum] = "d98df28f340bb14a07236846518daad7107b66581512c33da921663df61ac819"
+
+PYPI_PACKAGE = "PyChromecast"
+
+inherit pypi setuptools3
-- 
2.23.0


