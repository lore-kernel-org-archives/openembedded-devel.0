Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.14127.1614960188409320729
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=Pca/J/x0;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 496632A08;
	Fri,  5 Mar 2021 11:03:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 11:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=tbiuKDH4TBonK9LvCbGXt1aAKq
	tNYEQm7JiB0mC9yxY=; b=Pca/J/x0QuyAddSisVXdOx7SQ3JrydEE9Qbmfh06Tj
	WT24s74rCLqPLzZkks6oCA4cpdEWZhD5x33ZLM7eaHDoGT8PMzEkwQHZ0FSOnJOv
	fezLzKwtjjOUOmXKH7e6Es8fMk4vpMNWzEaH6qjV/ZWwK8CwZj4ZFPttVz6c/Hsa
	wANaIoyphX3AylseCqcHDQ5+19vanC/B1eDA4fajOpr1irmyLqZSvCEeVzmeuubP
	7zQ3YcXgBNoIqyOv6E1jafczNeqXY8yPZKISv5hgr6s84iEklQZ1wzIZfXCTjFlt
	vQrtSkj8BVeyPDYAK9c4D1Z+E9zQChZk/5x3VS29yzIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tbiuKDH4TBonK9LvC
	bGXt1aAKqtNYEQm7JiB0mC9yxY=; b=vLzO69PgdXk8FTT3bAYwoT6W1T++kp3Th
	LRLlZdxNmFECPWrocKVOUj1dUHK8fkKPAZqVCZdy9ixS454wi9dwUqvzN+p+A5ul
	QeM3215Y5u+9EkXsRMosNmHJa8UUGyYQh/fo2e07jpjb20fiqq9M3Cx69An40TBS
	IbCR/z18uBm46rBO9neaZCqNEkUZxMX8wtJWEj41nq2wx7CDaZUCUdFnBkRZ0ghd
	yCwPsQyvjwfOOb6Yxa89ggUHLtdzVOBp9Pvooel48R72LQv76Glb9gmYlXZiGEyz
	xwNJUs4zUoBD2ctt9fZRJFVrbO1YjTBzzZU/NzPQIwP/BYp68+OVQ==
X-ME-Sender: <xms:OlZCYPEZLbLC92kZNRza5xS3OBKElQlOfjdCOt-klpTcLmNG42ijHQ>
    <xme:OlZCYI54esL7_835wjAE95Hk7qZoKqZXGSUidfyKVNIel77bxC8JhfNpxz3XzjtFZ
    Mp2VTmGCKgP3AuOMvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeetffevkeelhfevleduueekff
    eihfejgfduhfeiteeuleeltdegkeefieffieenucffohhmrghinhepphihphhirdhorhhg
    necukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:OlZCYFkhA5G0aKZbBOFUldV9eGq9SyNXBdyJ4roLOJD1u9mZbPbLIQ>
    <xmx:OlZCYD4qzKqnIczOU_qp_4hr9Nl2PDJMaQXRtYjB7npMqxlj-SJOYQ>
    <xmx:OlZCYGSIJzjqSl7LdFIswWc1A4Bqz900zcum2rWLxGRDF_mq55veWg>
    <xmx:OlZCYJptHkUhxOuLCITXMW3ZAXNTkyVQQz_0K_3bNj2jDh60_uq8Ng>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5E02024005E;
	Fri,  5 Mar 2021 11:03:05 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v3 1/6] python3-ifaddr: Integrate a dependency of pysonos
Date: Fri,  5 Mar 2021 16:02:51 +0000
Message-Id: <20210305160256.3333334-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-devtools/python/python3-ifaddr_0.1.7.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
new file mode 100644
index 000000000..cd7cd2803
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Cross-platform network interface and IP address enumeration \
+library"
+HOMEPAGE = "https://pypi.org/project/ifaddr/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
+
+inherit pypi setuptools3
-- 
2.30.1

