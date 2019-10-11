Return-Path: <prvs=18080c46d=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 5E63D7F382
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 21:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1570829158; x=1602365158;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=/kPJ1hKCAfkALvwq9ZWoUg1Twc3gHa3Aa0NgBgAtmp0=;
	b=VFDApOy+GBF42E+QIwOBBOX0GL/W5xA7EAm4nnrPZdhfSG2tY3qxeBa7
	YLntIbm0Mzj0kktp3q6D5tRh/M3w4uR8Xkk48Zh2fTgwMRxC8MXOmz3Ou
	kogLvSXRwHiGXMqTQgAJjzq5L+E24/MtN7hHRTBjbVx/ip3kr43B9206L
	f6wmiUQE3KminS+aB0oafiLYg75zJSwgN6wNAq6iIY4eTdtJPfoLfIGd0
	XO0TDjInKo0i1KoqNXHZijdti6HWtM7CZk8cIEoMxPTye6Uvwyr9DWbc/
	+pFBsjlfD7w9Uf05ZBXklSazJbmDGBjmVExgwSbNXSxiSwnhj7aqdhNy4 Q==;
IronPort-SDR: PvY1dD+ryJNBhRBGWgTntFnq7v4BUCn0p9O+/DCSruZV2xD1Zb1FDShdfAg7B6tKeLKTjMx90e
	PbBmqN7Tnm1/YHclq2d5vH+4Uq1Zh3lYPTtpzBD6cSu0O9z/JD0SoVVVinxjKLO00ym3vNWU79
	GKpkVv0whKwfPsuCUXAfaIqmYEYgLSna2pEnZEewpDw4yKZPV61t2cbiX1kaKNYHBJehDuh/DT
	dCW6mKmrQg7Y8BF+TCoP1mGyeBKYQyjzt4lLCGY9UmjiStE3YoQSPlefA87nj6QCROPlBuIUjx
	mHA=
X-IronPort-AV: E=Sophos;i="5.67,285,1566835200"; d="scan'208";a="227380805"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2019 05:25:57 +0800
IronPort-SDR: ED6Sg+Z6TsR4Z13XZ50jMe1bbpVZaYdqdxUWdTaSw/mqQB36PXY1z0L6qE0go9kHKYmfEWvkVC
	r57Akcutc4j/QTjueYwuM7A5StjWzKQeKCi3mJ9zbK4XdHflTjXLGrDpv6Pp2FD7cIYe28a5Bp
	0ril+/bHFadphb3c5L2bB3EqcAZTt1IFXU1MqHEY/q5FFFQAZMlYhbWBLAD3HlxyrAoGUb0ojm
	qHW4nTN9Z/itK+4tB2r6pToabbJMmPYsO6BtMpTe3nWCI0NpuUWn4pUWiUE9vORW7uB6hoCkot
	21FWQbgZT4BbzYb0/jCnevyE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 Oct 2019 14:21:52 -0700
IronPort-SDR: mGbs6NoG8t24t8ovdiyS16wZxH5snPIvBE9YxIFfnyvcc/5xO5txqwL0Mst39x7Wa0uUyd28S5
	+FdZKN7Oh7aJQvj0PsY9rqhoASPbglhl0BeJthbolAjZftVbVdljcJCzKaT+XIcpT60r7VGULJ
	iqJ3dWLmPX+gWqcGP3X2XxlYfOSZFw3Wb2ff/7kMqgUSOZoZmdISjQ/65wQJK0XXGiV/Vhi2fH
	pXvWDpwn67/1H7b/DoANdTWBKxsMwqZ3xaN/JzGmx2UD86V+yNTYINavPyZQt13KFodkOZ4twm
	9LA=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 11 Oct 2019 14:25:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 14:21:20 -0700
Message-Id: <20191011212120.11453-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with zeus
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
X-List-Received-Date: Fri, 11 Oct 2019 21:25:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
Also, can the master-next branch be pushed to master?

 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 90236be..cdba2cd 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "thud warrior"
+LAYERSERIES_COMPAT_meta-java = "thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.23.0


