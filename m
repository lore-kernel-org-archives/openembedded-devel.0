Return-Path: <prvs=1507a981f=alistair.francis@wdc.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Sep 2019 17:37:41 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id A746A7E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568223470; x=1599759470;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+vcEhQcXXLAieTnAqUChwKa3uaUeIWq+LrC3XAG+eFw=;
	b=pf53J3oVsEnzEdQZM+az9H6CG+H8I7JRTapYc8PLynb6tMDkbeN4fLZt
	nDCPfxlDnTA3T17dMjf8ZT+cI1pWNSHvN8pUKgZYbat0GqfsYrXruGRE/
	bNNcmSTHH5W/dXqsLGyvHvvr8Im+VDSrAYlYR+1UM3o/y8xyD9T+aTwi0
	QOseZ5z7nzr7kPEu3Y6T8VyiHh4FwZJP03i+SX5FgIapBKg9bZdB+Vwy9
	WdAfL3kMCrccnu4qAniQKlf5LX6/+bPqwygEdc4RiGTbQROJlf8gOGkq5
	1fQ0M50kAkPKNC6IHqJuYV8Bi1BVEfBlWxpxMfDRnV5ZN8SYVgAP0cPZv w==;
IronPort-SDR: 3GoG+FajvcYTwxXvzoWxOdVoCSZqBCfWLLcWPcD3MqiowhRZvNohs/4WEqDpjO1goOABzXhltv
	1Y+MWpWAky2KWuGV83QUo0u9WY6Z/EDvkTjCZdZ8M5TTupFzMF271BA0AqtWO9YYPSOwTyiupa
	Z2dyR5JQOwtbqIbS26tJNXuBpRdGMYMCgO+ZW1bxdMcdYdcN3PlVp6XCH19eW0RdATY7LZ1ozT
	M3J3Oq/ykKq3q386Hrc7XyaQgb+zNsS8SPtlkAFE8p7Eo/rdCkniio/ksZ6unRbe+FjOXK7hos
	IVc=
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.64,494,1559491200"; d="scan'208";a="218717328"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 01:27:55 +0800
IronPort-SDR: Qzs7DI8aasn6rZv49ZNvReV3iDqu3SlrbK8kNGOUc3GyffEGYLQUsUn9bIGyD4wr1COPGehSlZ
	l5FNOIt7Q2Gc2qcex3fRN5DtzDOFY4w/K/6sF82+FjbTpolNYDuvsuZ96FqmliguoujG/HpmCG
	7Mt1hmzEv83/f6anEWmxRKB2RcK8W2/l7GLKAiZoqvC30CnXsBPSiItezNI5FBcZiOHbFU9wnY
	d2lILm33AtTX5Iz3PkNIms/HO7ieTp73j6+QldNMuWzzN6v8q6JXikn/9nzTngEe4AKq5OfoEw
	94MMU4Kqb/77HwoX9bV4THaE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 10:24:27 -0700
IronPort-SDR: CZC7Z4UnqEVWjDKZn+wST7EPE3XcMpg7qzchDCH1bWnBcpHhr2M/bLrogjPzXWJl1P6M78M5TR
	2xiKdGmZljiHODe5yefCtHTsb2x9gf/3NmaRWhfXn4OYIIXwi8crM8rtGT32ObdUoKxs0MAjG/
	r5zIPjfyIGQ0XETL35z8EC8PmlsGTCoAZXpNm4/UuWaqXwRnK8NrHm/nOz1S9LYhsFkykOQWqB
	zOziI1bfOJnUdx07EIFzVm7SfKposqvSrx0M+NnlVsY8y/jiyqA0Nuu/C8GMGmDHRO/XsHm1DA
	4JY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2019 10:27:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 10:23:39 -0700
Message-Id: <20190911172339.11778-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911172339.11778-1-alistair.francis@wdc.com>
References: <20190911172339.11778-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-xmlrunner: Initial commit of 1.7.7
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
X-List-Received-Date: Wed, 11 Sep 2019 17:37:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-xmlrunner_1.7.7.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
new file mode 100644
index 000000000..7e7b5235e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = "unittest-based test runner with Ant/JUnit like XML reporting"
+HOMEPAGE = "https://github.com/pycontribs/xmlrunner"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fa964f202b6ae067ed5828fe43c77c1a"
+
+SRC_URI[md5sum] = "7b0b152ed2d278516aedbc0cac22dfb3"
+SRC_URI[sha256sum] = "5a6113d049eca7646111ee657266966e5bbfb0b5ceb2e83ee0772e16d7110f39"
+
+inherit pypi setuptools3
-- 
2.23.0


