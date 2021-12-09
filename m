Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C011C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 16:14:20 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.13668.1639066459846152514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=ayrqucTi;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A3D75C01A3;
	Thu,  9 Dec 2021 11:14:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 09 Dec 2021 11:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=e6CaIv4dOoJA3rQHYGBGmcvwfv
	UJO8RHq+2EjQ+N6XU=; b=ayrqucTiSudVia1NM3OWBg0w0RxpsV8tTChYkTUiR8
	OjyKPYNhNJOrJZ5uYz0CEv6QqnllCs1YBnXHIk9eWuLQ9OeYjrrhHUSU/d6QtUIP
	6rC3nunkQ+lJvIYfEYcoJSKK9t9naciT+tyzB6RbLyqW5j5dUnNdkAU0NF8xc5Kj
	bWRTFhDSfQoYpjRBaDqQq6UGyRXhxxtAS+fEw3IL2n8VDFnO/eMdtk36kf+TPELr
	HFAgVx9SNaBCPgvOfgXnO3QIPghUYxKY3GL4PmOpXQRjQ6dbJYjMq8RQy6DvfJOA
	HYD4WqhOjV7G5NBNmxT5WoZaX3A66Ix0qT6PA8Vy54Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e6CaIv4dOoJA3rQHY
	GBGmcvwfvUJO8RHq+2EjQ+N6XU=; b=UjUpgrxkVbVfXyCVTrRuAlBhkHYntkGbB
	7ZR510nxNha3FTtLKiUF22CLyxeeK2u0hqnTu5g07NQ1ah63anMGJBn7nXwCPwhj
	vje8Oa84baZrTweuDVUIG08dcqbtSdSHdd2ZIdKbcS+GVH8ibc8GWXzxjmbYadLJ
	aHn5b9jrmunPk8DeowWUYR3bOF/BcP20s9oQDepP3JaU5wIdcu1cGh/rLAjXtddR
	AjzWxCOw89/azfFaXXS0pppDr2QgeKzMRvQHRME2C3fANMVAxQOJl2uuSrM/GDay
	MmXqUhcGwYineZPdo66/yVRBdw/ol2hjVhzfC/sFQW+i1eWmmxKEg==
X-ME-Sender: <xms:WiuyYRfNS1VJ2HmljmBDbhchgHIzB3mzjvipAbffiogOcLG62xjIVQ>
    <xme:WiuyYfMYs7bG5GCEOX0utnyAw5nHNpsLU2H6cVHEav1rC1YxDnQZKWg33h8pTE0Yf
    L2dk2pHJ5Y3s57NCBw>
X-ME-Received: 
 <xmr:WiuyYahJEGS2n_YW5YyyyKCipDdzha50kvRthuiN4D6HyDyctzBtSQ9RZXSah63CVcmSZokNEvITcJ0E1m3Haxq2a4h7Ov5uFAlCcptoTzR9kSKUDOffnX5o>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdelfeetteekkedvgfehleetkeejue
    eutefgtedvhfejtedvkefhkeeltdfhgfetnecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:WiuyYa-43xhvx-hEP5XU6PVN9cr9bBO-0zqAA2KiHumY4JyGljtzSg>
    <xmx:WiuyYdugxtYjOPglxt4X-VwCxxyow2LqXflkMOzn-HHuOwey1XHpYg>
    <xmx:WiuyYZHb4ZvckohnRLMb8VMIaZ4rTj_srpqCEufmqTtRDGgvO1y0iQ>
    <xmx:WyuyYeWKLaayuyVouhLA6CSH4yY1ujwnB600O6l2B79zF4NWnGJPAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 11:14:17 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v2] python3-pymetno: Introduce recipe on 0.7.0
Date: Thu,  9 Dec 2021 17:14:06 +0100
Message-Id: <20211209161406.2348004-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 16:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94264

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../python/python3-pymetno_0.7.0.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
new file mode 100644
index 000000000..20f40d98b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python library to talk to the met.no api"
+HOMEPAGE = "https://github.com/Danielhiversen/pyMetno"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
+
+SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
+SRCREV = "15f1e887aaaba3bf243cc8f88eb761e0ad85c355"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} = "\
+	${PYTHON_PN}-aiohttp (>=3.6.1) \
+	${PYTHON_PN}-async-timeout (>=3.0.1) \
+	${PYTHON_PN}-pytz (>=2019.3) \
+"
-- 
2.25.1


