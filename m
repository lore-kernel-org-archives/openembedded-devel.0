Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id A91D77FD42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760125; x=1600296125;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=sWSV0le7TsZQe2GH+3zQC9ekW6tCK/Wco/ccDzS3BSE=;
	b=XRYjS+jVfYVunafRsHU9LQDiLj377uCubxZzq17VfNJAcDeO53EkFozN
	FM9937vsGEsgY9hYiHcmDK7p5v7tadXfFCap3DcXKu5Pz3g2XPfXHj9tW
	2GYMMGwEBuNXzlo89/vIySKjYVjuQMOPjVwu1+OoCBPyDuTsiefd5G9JU
	4THiFNsigVrmEIdH9oI34foZ6EfoOJp3mtTCxtzxrjTxyBosEYHc8qXJ1
	qi0oG9VJTydXUYN/yz7nQsY4CA6K+J6BGtnsNXNFv4fu8wcydhOghCofW
	gmdY5rMOcj3Vaj9U+/GQT+OYqLXxLhBLHSeIWEpKHmK6deQbJDzeWApVf Q==;
IronPort-SDR: U3DWcTmLzkj5tJfQEn0LyQNGxkEQ5U9nuIUc8ODTAdKeanEP0zhqzNEd/iPxxnuAjV07HbizKG
	+mMx1XMx1s4/BqcUmI9LPrN2zwVYgaipRVy8PDSq3VGVgVCC5L1rT+9mi7v7o0lEW1uf7SSw9g
	XCvVbhI4FZBHPs59fb2uXCiRJhnN/bTt6xVlPdXy/ET0BwPTsxNKdaJc0oWCkFCH437J/t33hD
	MrNIjYO/Tr9pN2yhGJvXysssnUcmnWmxcsoRpWBprKQDkQQTPl+vEHGdojVTruTkuAC2+f4KCf
	zq4=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052152"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: Mwi+g7Eo2Jh8sZpwOsmM3wsYSbWJ3rTjKCYdqt7mZxo7aTWxeFYCiT3LexV0ScnCF3y3PId79U
	ZdKKZWQNQXuOXT0hEbXcXXeFv9HVY4LQWEUeQRi8iyTm5laMvWoE/8874UVfql3Ir4KBIoT8to
	/jPpKOAzvkWpQovYMhO/4M2/Voy5N1AO9mphBGKFuoBuosbkuiPPvqkx5KfyG84YE+USY3SNlD
	WWncNQ2DRnYDdYeCxEjGTeh9GTDPm+sj9dUtZCW5v03btOODFWzeHPYWxhCc4PKfLSh9mX2Rqm
	jj/h/wk85fesJmaf5c/sOIpu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:39 -0700
IronPort-SDR: o2VDjLuk0OdunLq0P++3nySqhP8sCmcBbupw8ZPTEOb5lmjZkZ2isLNc6SYkaFTcdfo8UE40vN
	aXEjGH1285+9esn+brEa+FPlx9VRJshj0Ojvdb8TsLSN/Aa/9IXcxO+jlhYjMx48pqtX0Ne4Yy
	Ojg6WvPaBRgqv0xIWeX3AyXQAeV4HaqZhDZ8x99Wo9RCIE8CCUiVPqddd0pelgElenp9RNl9zj
	vKe+RyHC0FvmjvpmiIgB8Yt4tAdccuGDZSbzUHVNtgV/uNF0jG1Q0rcW2c1CCDDAZ5Hs87Yel7
	TlY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:52 -0700
Message-Id: <20190917223757.19701-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/6] python3-padaos: Initial commit of version 0.1.10
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
X-List-Received-Date: Tue, 17 Sep 2019 22:42:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-padaos_0.1.10.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
new file mode 100644
index 000000000..f506a7863
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A rigid, lightweight, dead-simple intent parser"
+HOMEPAGE = "https://github.com/MycroftAI/padaos"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=b51c3e8e53a7cd95c13c5aab6cbc8e67"
+
+SRC_URI[md5sum] = "dbf852015ef87a6694549779fb475b52"
+SRC_URI[sha256sum] = "2ac05fcbc826873c574568aa5ce09945d6ea987bee10399e766eb8f7c6356d72"
+
+inherit pypi setuptools3
-- 
2.23.0


