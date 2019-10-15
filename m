Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 38FAB7F46F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180344; x=1602716344;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=yqWriy/w7dvEUyuQysJgbh0iQbG6kWdhqmZtIFZaO2M=;
	b=I4trGyceOYVLHT7SucrSYSESdAmVUXyZjdUhoi35zMmxvoQoZYVLurRI
	ZJ4ghzg1r14Q0Cd1utladHPHnxexnMZYGc/KkHx5qlsW8yguTpZ98rnWs
	rVm3EjuFHTR4FucsUtbw7yg/4+MFafnsGO6zEXnIiRmpMELRLVeQIzhG+
	AJygeRe4D3icaeRezAKbIakaog7m0Woq5EE1CyEuFpupLFlVQ1FgmtYdZ
	nweG2iAlK5NtJ7p4Kpu8Mejn3iw+SzbTBqN2CyIRigEfiMrYqHbYYzfEY
	9heVOc4wNty9YGDhmPYR7tjSpLqTSC+NxwLC4+muENZ9uMe0vEJpSAHsl Q==;
IronPort-SDR: iuVIy4Um8HD3eSrbjwNTVZee642ANWXgv/H+6Zf3/gMNuOdxI459r0pJBURLeWPDdZJIaqszsH
	zgQWveKXDE4de3y3vuxoOBbcgJwoS568UQzfeyoLoiTVLtgK+eASDrn+MKJo5TOmRcoTJP3aoc
	6QzgBgA0t0r3mmKzX2IHlO27Ztqepilq3LuIWp9sQ5Arm4n1c/0TCzcx9H0Xsf8pEmzus0RcKB
	HPJVks+k1D3PKbK4HR0z3hrQzi+hRWxOaiHkYB6Q/Ut2vTQyK250pwUCGHXLgkkyKEm89HjGm0
	ToM=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194671"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:03 +0800
IronPort-SDR: 7RC0nGel5n77LqgtBIBony4OkvZHsQ9G5FclgpRuL+PSkjd8U7dufypWeDkYkTIh15x8NHurKo
	5asxDcB2rFJptPgFiUtEna82N+6v4yMCbgINy1meCuhw+N0pqFGzgSxxAqIz60BLnOvOzTID2h
	st5Jkml2DuQ1eQGkguDBqUqi6J6OdCGvCi5iu8O4rBvtbJHvoHkDg96vtZK5jFraaRwlUVFS4R
	0ohZ1IHVIhflwUVCAZdKby9GiBKZdLKzznDxGE29kHzAIAoaC0VWsafSrhujYcGqZIjEuVX0D+
	XkOHZjcIZHq0r4pgqJpdqxS5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:51 -0700
IronPort-SDR: TJdjx9PqbNxsjZCMxaKMyGNJvr8JzIS4mtTqne3d+3lCO3CTRrCUxwdc2QelL29A6qy+SJ8gUu
	/49FBD0y5YlcVMQjf3vTgFIBATgl/kpnz8ngieLbYXPeAFlDrUQo+6a5baeddWUtnAD6E+5Y/3
	Nyg4AyjnxJTm11FSLFIHD/JYNl9Xcb/VIVZSCK3nePQ29x2gvVoTI5yHSpnK+2KTlvb3N52HbD
	56gsXWPXDWV9fJGDeZ3ssVb9ivtYygX1TaM3ARs2NdOE/XgcY0QCwx2FsqYs1HIgs85eEtgxz4
	rIU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:17 -0700
Message-Id: <20191015225422.18179-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/7] python3-monotonic: Initial commit of version 1.5
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
X-List-Received-Date: Tue, 15 Oct 2019 22:59:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-monotonic_1.5.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-monotonic_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
new file mode 100644
index 000000000..94b90524b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = "This module provides a monotonic() function which returns the value (in fractional seconds) of a clock which never goes backwards."
+HOMEPAGE = "https://github.com/atdt/monotonic"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
+SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
+
+inherit pypi setuptools3
-- 
2.23.0


