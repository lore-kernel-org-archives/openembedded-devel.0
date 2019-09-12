Return-Path: <prvs=15194f099=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 585117CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568295963; x=1599831963;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=CgDvtHFv9rsn6lU1NBN3X1FPy71EospuNC4ypSb6i+w=;
	b=RFNCeFDPeLlpxV4lPwZqjmB2DwMOH4jbkbVbBtFbaq9htUdSXSs2Dbp9
	n3abqJEtJHYRr9XyFL4R7pMc57hgFPVEp6upMJATU1hrewsIP6IP/u0bx
	jiFyYPLj40Q1zM0yGPkOjKS/6ByMfR9GA6F+4MsbOsr2Z+sZOpF8Bsb2i
	dCttG4t7V6Cx+u73bBB3Sm4v5eh2OnrJw/A4mLGHD5EP4iLI+lOuee7Rc
	2J9KZX8iX8xIxl25uvOthT3sj2J17XfKPMd1gq/P1Uclhm4M1Tzuh4TL+
	XwbeVNlOy9xr6r2hjadGBdhoXci7bS1r/PLacwRB1o6FVggeurlqGDFiR A==;
IronPort-SDR: DBphW9Vk02PDF9jacDwFZy8bDcpbaLvK0sWdQPzeVZiyEm1pODdtDjBlQzybxKYAfm13lr4Phx
	kQxFuTqLBLhALgD4eTpSgWWbMIaCMK+HGinE522oANFiqWTjwIFzvYXu8n4ElvelQdl5ZAcDTq
	xv5dHEbPoYPBv+021DGRn5ZsV7iqhYhlU14AJfm4juFL5ywFziw7EdITr3fFOpDZqMfR4x58SW
	ENRyQvNnXn0P+b/usbmx1GX6NwXEkDHxIa4Cp0EMV0CJ+kVjSqdZpvR+VlLD4gHMGu0iRvOPwu
	Vs4=
X-IronPort-AV: E=Sophos;i="5.64,497,1559491200"; d="scan'208";a="119673085"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 21:46:03 +0800
IronPort-SDR: taT1MmP32giQKwFSkNvzjgL4ViYSEz+GgJayZljutX3Wqa5acxRbUBPy9kgYbUhI+smiilhy6d
	BcIrLah+5HA6GjWC8vrU6Dg3zTBWGpHyk/sxhcH8HqdD39RLFMOG4iJ4OEbB8mOJzaLGT0BuHi
	WD8Sq5GwCnoqgtOqMtRA+LhoQUd6keaJ6giBQro507Duxoy/q310u2ihrC1jLnOiuCFtZERvKX
	jVpDkTzPfNbosQ/YhP/OwMWbEBxiGwJIzkNOSNYHRH9XhFsD3iUw2VOIJX0BCk5jzO271So6aC
	Z6np5INYrM4yM50oy+MFd5+q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 06:42:44 -0700
IronPort-SDR: TvGC54qdvb168iUCvqr4Ysu5c3K/LKPmRfKV7sFr+XLXFzHftj7k7n/wV5aboUpIpgRSsS/18w
	ClOAzoDzyTxwSkSaeRvSLT8rLopWN4CDxXF0iUDmcCyvqR4TsYnh/h2naXZRzmxwBQIkxMO76q
	nQmN/hqxEO+WyNmXrSmXMiL7BKjIZfZ7IPcD+sJ8NaghO2RJxi6QJv41xfJ41Gfxmuuw4uu9Dk
	XBmucOFiTECvqFhCMo97n/1pys5IsNCqqZxGus1tjVa98hz6BLeXqmFQwYWo+E+Vh1X0uZHJQY
	zdI=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 12 Sep 2019 06:46:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 06:41:57 -0700
Message-Id: <20190912134158.22033-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912134158.22033-1-alistair.francis@wdc.com>
References: <20190912134158.22033-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-python-vlc: Initial commit of 3.0.7110
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
X-List-Received-Date: Thu, 12 Sep 2019 13:46:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-python-vlc_3.0.7110.bb                | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
new file mode 100644
index 000000000..be63fed02
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
@@ -0,0 +1,9 @@
+SUMMARY = "This module provides ctypes-based bindings for the native libvlc API of the VLC video player."
+HOMEPAGE = "wiki.videolan.org/PythonBinding"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[md5sum] = "e128abf7115d6513582bd460c0e74485"
+SRC_URI[sha256sum] = "821bca0dbe08fbff97a65e56ff2318ad7d499330876579c39f01f3fb38c7b679"
+
+inherit pypi setuptools3
-- 
2.23.0


