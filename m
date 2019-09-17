Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC5D7FD93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760126; x=1600296126;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=4g27aCL3S68v93KPNYhFLwkuLBmeC7O0JJB1ba+otC4=;
	b=AACB2dgSeIK8zWt9Eww+rGtLNRyf/9ST1cIAT4aXd2ULJ4+MPnjQf+to
	VdHmMqipxLAed0Ooq9Q3m9RwYoDC3rm2IIm7vAV9/tb6Ad+ppV5RQTSaY
	bAcmwyFoP4NM1H6u3IScRovavRkAtkbwueeRs+Ve4JqZ7G9Ztf43nDsX2
	Yi4Q8J6SpbgjIz+ENh6ewLSNYufjfS5fk3BLhMlRv+h28FccnKO9ahF19
	CgrrYBuoDFrdMrlswGGbTC68ghQ8qvbsV3N2NAeBq9QTOYZ/RPO1+4U7U
	8lBTkStSyDTk/2E7P5nSEE+w/l32IgOH2EGWDKXgDni/xQoCTAhz1UYtx g==;
IronPort-SDR: ixNffXnxvA3aTa3xFwnveYxdvbzzV2OJL3G1BdBza10M7IttCfFigQ+U/cZoMQ08IMUdRiQ2RQ
	prc7q8TvZ0Kg26lT4K3UeCmAFMGBLyg3+fHKEQq++YMBVcXtJFiDNTEvCwRWyOq+ph6rYPAb71
	VECLe2cJ7yFuOQ8fYrVTaQaY8zvlaGONyf79GIZp3nkmCIuILZd//q3MSY+knCC1O1ZzSamYET
	9inJl0Zck1lTVUuWqcAQoRlyIQ1WmYeWvi9nzLTiHPS4KwPgxEjRvApQ2gTOp64MJocYg4he7Y
	vtE=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052156"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: +2Mazy4P3DObGMpa4RO3CkjSt8pEbmtWa6tD0LpDBQlutIsRC6dgnQXHviaGIec+N1e2d5JMWy
	7GXCQ7zYRk1BtPx5n60riQNRZYbTsZ7+Uka5W1lSZpzNPOHLOAbv+5FTYsZnO6c4un1KqijGbu
	enfPsKq1MnevNmkAHUv6RSOYhuCLGV5NCYkBbOcQFq5jG58EPgI3QL5LSozcIqn5ZTPyzOvLSD
	Hx0t+zBhrq/tfFRniIenDxA76KUGuzL3gJXbdXLynAZwOH8NtAtjesTkrzv/4xcl5ljFdGQhUy
	A9dOpXSAHHC6DLWnukwjgXsD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:39 -0700
IronPort-SDR: PqguM5eIJv4QLGDuS+MhpWbxZplsKRdOF7pzvlm8uo8u/ZtMdf2v7qj2/Ahd9lGFk2k/S7QXW2
	A2jo9iD3MWO8ME2HkRTjuKiZO8SRXKtpO4fxJcMTlgN2hV1h5iziTysyluSIKKLusekO12w+ps
	HZVHQBKFwzPt0LFUZjeltLK0b/auKlVhuC+amxuCvUVoMzPeKM4LyjnndJMxP0CxbIdMTbK4NK
	NxhOdB+7ngPqzw0LpxHXkijYd7UrctyrUM5Cnpqf8cBiA0KtfFnCvllWA5xMXO5XFaKYHsXeyD
	Qb0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:54 -0700
Message-Id: <20190917223757.19701-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917223757.19701-1-alistair.francis@wdc.com>
References: <20190917223757.19701-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] python3-petact: Initial commit of version 0.1.2
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
 .../recipes-devtools/python/python3-petact_0.1.2.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-petact_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
new file mode 100644
index 000000000..58cd05e22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Petact is a library used for installing and updating compressed tar files"
+HOMEPAGE = "https://github.com/matthewscholefield/petact"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=c8533d4ba77519398cdae0173db799a1"
+
+SRC_URI[md5sum] = "47e9a6abc91b4022953e4007ddae9e68"
+SRC_URI[sha256sum] = "5dcb0d44f86a601e41a2def9770993cd0ea45c76d37eb3f35e3dd61aa50350e6"
+
+inherit pypi setuptools3
-- 
2.23.0


