Return-Path: <prvs=07907f1c3=alistair.francis@wdc.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jul 2019 23:24:41 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2147E9E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562109883; x=1593645883;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=DW+vnPf6qAwHu0cqo/eIPbtHN0D/vI2/dvMT8ZzZUZA=;
	b=O0/Q6XTOF6rk+knN13ReWzb+WrV7VwNXlxeMlHCxDFC6X3jDeHQVm3zb
	Q3A9w3yMKA8/I/Rxtm6SQ4eD2s8D48ESJr7AQbucb8fRxzg7IodEEufw8
	vn2OrULSVZegqyFwuqu5pvZ6n7dl0CdN9CctruGcT/1YicwJ8tZEYRZ0L
	UJ8ayPGzcqpDfO6TtYzgcvf944zIE8ohE9g5bv31uDsCaiKYmzPPyq2cd
	ktWviSDn5WfL6QioKWnlIhD6/X/KWLDWOieRa0BrxNbLb9XfmkBimBo5A
	SZSgF+w2+LTvgQiEFK+Bdz5sajyx9mEkUY2MlksDz4oR1MqdNsi3yEh28 A==;
IronPort-SDR: +lQ/6tQgfe0vpR8RAgUhQpmwQeCscvmbkQOUlUC5XxI5wt1AJ+D5z3x/Vk+4WuNhSAghL2Fbp2
	k0cCHoWmmEV3e3MIi/fHlcgjQ3yf6JVYQDqQT6AZ6zjVs7O6D3qYXkpTX0hlv/XnyTzAV3C2Oo
	s3vXnia6DxS9EZZe/CubuA8Xz8CAQFOE0hMkErDp9C2cbUDT1MitNi0yDlTEyISHBx3kzUomhJ
	2Iifk1axOAx6fj0h293bouNkUZtnZFH4Xn+xc0aObojX3nSCKOp3kVXEHIEPVwjrSgCKaypNAT
	Etc=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="116935300"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 07:17:35 +0800
IronPort-SDR: ac6SaBDjQeLHWn0rzkbrmRUlae2TNasHVt619GBtmHlopyFN48vYnnVx0V/3ej/GLQBUkRjQh7
	ZqxAxP5u0o/rGUXDQH4dduIy/0JgwYKtm2IiKPnqTttW3H8v2qafEtwmzKK3yVv4HJI9i30Afr
	nE8qcofR7DKWaIiH7qlPsokNUU52c7XQyHsUD3pmU9oFyBH5hvtuXvrjm+HYDUrwD565Hv5pH7
	vKyfr3eT7i5bsp8O3QNFEZBOhl733yxP8N6XV2d0dWx+Ou1JExIixxFySWUf1wLbOz4TwnK1EB
	vHrp9vx/8u0N/tpT8m6ZvGzn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 16:16:36 -0700
IronPort-SDR: dFMSrHOax8+dSfLZlliuAAErEBZrhqkgdoyVbFga0PnO4PsHh7c4GaR4w4Zm3tHUJmPl8fGgAH
	rZcnhQc/W65innfw5R/SoH48AEM/gKATV+y2Q7hS/Wx7FpFbjqCYualiDBcZzrfDkVs5FIapUo
	lLPAoX7WM5MEkyGnFN2aMfpYLGABgVAqnqksLUIpkxBkOPBmOZQETj0Qufzp+AVlHIkcQSSchv
	N3c2zryamEHe+zp5OOLZbRT4DCvNuMx+lebNAngEpjdetAKC+YQlEpPomyT2989M1ALxv+pGk/
	/A0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 16:17:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:14:56 -0700
Message-Id: <20190702231456.10327-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: maxin.john@intel.com
Subject: [PATCH] Remove OETestID from runtime tests
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
X-List-Received-Date: Tue, 02 Jul 2019 23:24:41 -0000
Content-Transfer-Encoding: 8bit

commit 8e2d0575e4e "oeqa: Drop OETestID" in OE-Core remove OETestID
so we now get an error trying to import it. As it was unused in
meta-jave let's remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/oeqa/runtime/cases/java.py  | 1 -
 lib/oeqa/runtime/cases/javac.py | 1 -
 2 files changed, 2 deletions(-)

diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index 142a49c..c1e1498 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
index ad6de25..39ae298 100644
--- a/lib/oeqa/runtime/cases/javac.py
+++ b/lib/oeqa/runtime/cases/javac.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class JavacTest(OERuntimeTestCase):
-- 
2.22.0


