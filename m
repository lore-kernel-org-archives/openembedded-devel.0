Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id A91687F385
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180345; x=1602716345;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=raPGpBsp4Wme14dyjIFhvyXAKSykcxEDdtscLs6sJpQ=;
	b=jdnbrYL9mD01qF9vDpnJjLTZ/SDf4NXepRNPmk3LheA+JOLM6ou2FyLD
	VzCYgBY/fCQkA0kCoc4G7XPzn+l8N5zk3N7uxKVfT/WckqpcSpdJVcw8H
	sZJsD2gw0ftTrFFQKCWhSq3LkOLwwK/nx7/qQ9o+Cvn/5icJXMI048q3D
	RqltGmb2IgxVFFZ0J8RdYK4CiSYZYPIAMCbH85Xm+VTYp0e52HVjCDL4z
	m+cTPeR3qpobZ7SJqdFAZaUqVE0P7MxEm/4ZZTx+pE6pRvpwwwTR03H0m
	lrv8oqb8m0L24FBwVRWb0d46Vvg9q3b88qNiDnvtn1J4JTQY7v7KVbDDK w==;
IronPort-SDR: sBA97gMJdvYiuYzBYWPh19tsdWUZg8axe+iXV/Xwjf/7B3ZRDtHyH+zYZvRM9aX3pdhTN3Lbex
	LYvDHgKqp9nWA4sviwfP6lqQOV/NJlYUUIHwT+mQOxCjc41S3gvygCQyQ3zbhMDR7YddTCcsMg
	XdGX4JTbNHuXUl/QthzQ//zJyjwukYzKRDxr3I7q5BgevY9nTb6cveY3CSzobwN1hyNMNk+Vdj
	weHSGttQCipzPyIlRWHOWPUScbkbtC9yO4vlL1CJZ6jQQpwq81f8qnxJihLV7vXKQsuuOPDWlB
	xq8=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194674"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:04 +0800
IronPort-SDR: VNdIRrOELhhpqaMHpGYov6Pnpu9LtM0Mc0nDd/BIbcUYX9jEwmbj+g9Bag1UUdRDuni27fCfxw
	2YeCJ9wPJokhV/0s25NiJCxIw4izc/4Wg7PWEtZtaXgRArVOAcq1ltr6oP9EAMuP7po6hDrR3N
	NAhE2FFHG4wjB/LyR4gac6NiQgXcy6F5jfC9GdNTfDiK7UP5IchSFK333TJ/14GrQ/etquzU7v
	kcih9qGZz/nreQ0l6JhFtBmGjuulbJu3C8z08ADc+c/f65OhggS25hGu/BOR2VN812H7VMy6aQ
	+Cm/JI0d8XtJCKiZP6o49JI6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:51 -0700
IronPort-SDR: aCXnASZcJ29nsAoF5ZDuVHXHnwtlByKEfQisgHyD+DdliMpWeD2gWz0H2Gsu+/V6LE1OR4aJwJ
	N6NR52Uo5ZQn2BnfUmg3RWI9OD+MYBYrjEape99ONWLUZRBdStY9ejX1zg/nbd3vwuY7Qnz842
	6Hhq9d0YACcUWa+DEBEn/WDRTI+RyYh0apjUViQ/8sL4Vpq2rImGZP7nEaUkwSKXsoXWVXJ1si
	uHywmw9ru2g5goal5i4MRXeGXaIACzeSthJwllQONybpafCR51l9Ihp1JM8fHWQDbwC4TI6WB9
	e8E=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:20 -0700
Message-Id: <20191015225422.18179-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 5/7] python3-google-api-python-client: Initial commit of 1.7.11
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
 .../python/python3-google-api-python-client_1.7.11.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
new file mode 100644
index 000000000..25e3b9c3f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
@@ -0,0 +1,9 @@
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, Moderator, and many other Google APIs."
+HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
+
+SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
+SRC_URI[sha256sum] = "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
+
+inherit pypi setuptools3
-- 
2.23.0


