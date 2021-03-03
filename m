Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.6583.1614778373945210138
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=l8SC9k88;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2B99117D6;
	Wed,  3 Mar 2021 08:32:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 03 Mar 2021 08:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=89jiIYEboY1l+/zqjPA9JPifsv
	8SU7YDUcnYSCLyeGk=; b=l8SC9k88WJ4EopzGgNMcketpl2p2i1eetNUVFy42Y8
	DdLxpu/WZ+z+opXcXlc6DUeZwbzQCCYn1+WO9mbEbJrMrP7/tNfYhCMMr4gz6ELS
	iAnVaUVM2oXWSKxYQYk6FlikG5bb7WmgG+D006VeyJTGlnsECAa2FtLupHuFgpCv
	wICVvBkdPF+s53x/ioNkHu1DYFDpFXeNLBRiBf/Ji0Y+/uZavlabNDyzMapQcyZu
	SWZ/iKENE7JG02CVfTz8YWhkR8cOjGT9H/27d91KsTIwfoMlCHsIv5p1FOBdwn9i
	TBMNa4eS3H5Ljx59tfQX2ew8XKskx3nD12E0AZDbWZxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=89jiIYEboY1l+/zqj
	PA9JPifsv8SU7YDUcnYSCLyeGk=; b=qN6D8ZgP4E6bCMBL0z88IWR3F4IszbAb+
	6/No3HFcPkg2YOUlQWADejFNzDklsMQfbSb3ZPIZgrkZ7zqRiv+ZxnG8925SfCnn
	Cpr+Cp4ACOmUlbuP+gpkSlup4KNxRd4JA2aFMxi1p0HiV81IB1xoFogiVPjh4CwG
	qnpXIt4EhStkCvDWvB7GiB6e1CfHvTToq+e4dbuqMdkBDCKoJqe2UbV5pH3y30gT
	RSn6tbqN67aHIQVup3849qR+y8UZcaInD4qpzpaDUvybVQ+aH44yAHbaz9phF81f
	lBdx/HG7I1DR0A5J3VNefbuHhlx08dt10D7BBJlrDullDNjDuUv4Q==
X-ME-Sender: <xms:BJA_YB8CBan4nKx05sYndkRocdhvE_OPEHwGPQqju-muYCfL0u6tZA>
    <xme:BJA_YFvdk5W0YzYNzMdzn3J0op9riQdLRd2GgMpA70TiW5wzRQRLsAikRJSSKvss3
    NovbFS7jQOakCTaBJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeetffevkeelhfevleduueekff
    eihfejgfduhfeiteeuleeltdegkeefieffieenucffohhmrghinhepphihphhirdhorhhg
    necukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:BJA_YPBZGXqzkq6JWa6Nbwfe83AEd-oxQFULyB2xm7WtHozOUyjLIg>
    <xmx:BJA_YFdXvBEhBTOUXRYye1xSHNCCzPGYwnsy0pyYtKVoFL37BDZpeA>
    <xmx:BJA_YGMeIfYO9dGanZq4EKEWQ_QqtVoEmDcOTEwFvRke0Kdatj1Erw>
    <xmx:BJA_YJZAdhEk9KDdXge_NA7fSXsx7--ThmdlgdiSn9v_oRw0Ag6eWQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8ECBA1080063;
	Wed,  3 Mar 2021 08:32:51 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v2 1/6] python3-ifaddr: Integrate a dependency of pysonos
Date: Wed,  3 Mar 2021 13:32:36 +0000
Message-Id: <20210303133241.29781-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../python3-ifaddr/python3-ifaddr_0.1.7.bb             | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-connectivity/python3-ifaddr/python3-ifaddr_0.1.7.bb

diff --git a/recipes-connectivity/python3-ifaddr/python3-ifaddr_0.1.7.bb b/recipes-connectivity/python3-ifaddr/python3-ifaddr_0.1.7.bb
new file mode 100644
index 000000000..cd7cd2803
--- /dev/null
+++ b/recipes-connectivity/python3-ifaddr/python3-ifaddr_0.1.7.bb
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

