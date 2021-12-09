Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B6CC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:00:26 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.12461.1639062024914245878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=O7xnnGdr;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 2E9255C029A;
	Thu,  9 Dec 2021 10:00:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 Dec 2021 10:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=1zWRn7D6fgqWOq3D8+SS/IK69Q
	kRfaty0V0xwNCQQSg=; b=O7xnnGdrqR37zIDt1srjClHrLmNJFiiZ/DaMlLB0U6
	q8/nwCaiAD7ISJze8CBHvyyLzxnk/2RotZbaeS4S0oopzSZPcgt9xRk6fbPYSnQc
	W6i9KrXBVcwpeTrZKBDmjZYRJ7aaVHJnz5g6xvJl7v8alwAajD0OFkiGwJbZPctH
	4Scp0TJ8QeieWRcxSyHmuinUl5PMOvEgGx0DsdY80skKOgNIlycCg5YYDr82e7uN
	91iQrDLQt4EgRsLe0LmZMvZQg/VX/CdHAb4bclrkiEs9iSrUNyQJneG25MVlV1Vw
	jm9YqNTri+GuAbHhnvupfQwivkaBDSYo3Sb87JOIrBtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1zWRn7D6fgqWOq3D8
	+SS/IK69QkRfaty0V0xwNCQQSg=; b=Y2Wq8TQQSe9MAZV8tLhmkIWww+iMb3KIS
	k2n9U4qAuBPT5Tqb0VRucmPfiVUtBmiLNhGCen8bJuhWkrQVEtZlh2fKnnbltXpC
	N+oT3+Rww6NT3OdQqEculsAllIOqkLrmIszwhrwPRaR9MboSAybEmOejNU10i9m/
	aYVq6JsG0/JsX0sVnC4T30qSHcjxOqGbDtojY67w8gIQ29DljNtFxOtFJvcuQDb+
	pqLlriQcU9nFkuylH3ABjtuUJLBkrKoEAUYf5uC6itIqT/YDfAJCdg5CS4IlDQnE
	LNZJUV1UHvbd2pq7+ByrNfkc/dSUEI5+rLnzA3ZXNzKJWDHRVAmdg==
X-ME-Sender: <xms:BxqyYcHxSQ0a1Qifd_yCxWd8zliove0L0G_TdVQ4G4sRXTi3R1Y8Cg>
    <xme:BxqyYVVxkZsvOsuNZ-FdHDY_SxmbEqgko_n9cf2V6hk55z_ucyYLzO_Imu5iflkmf
    Zflanlmiqg0BkHVENc>
X-ME-Received: 
 <xmr:BxqyYWL3exA61Cc1qjJKknp4stl-b-eF3KuuVKG7012T-TOxzwjHwAun1nHpeSJthwvZLjW03ijg5F74sVW62nltd3cp8tXXdNBNQ01EOyuLlWI8TGPfjzLI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdelfeetteekkedvgfehleetkeejue
    eutefgtedvhfejtedvkefhkeeltdfhgfetnecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:BxqyYeHMRbREhKKLeM1Px9pB9EpMPbQ0u0TpV-AwQlKsWlOY6YJnuw>
    <xmx:BxqyYSUmerELrLXTvvaLZWPrKgvUyTzdhfBWHxUJtJrytiabtEGTxA>
    <xmx:BxqyYRMYShDxvf4ogg1cvMcm1l8pIMkkrGzQRZ7gBEnbs_B4hNMPhg>
    <xmx:CBqyYVczGw6Wy05LA0a4W2pcdEnFP2WFWhXRBc4uq8Vk4qet_JXNfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 10:00:23 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH] python3-pymetno: Introduce recipe on 0.7.0
Date: Thu,  9 Dec 2021 16:00:14 +0100
Message-Id: <20211209150014.2294075-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 15:00:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94261

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../python/python3-pymetno_0.7.0.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
new file mode 100644
index 000000000..453f66afd
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
+RDEPENDS_${PN} = "\
+	${PYTHON_PN}-aiohttp (>=3.6.1) \
+	${PYTHON_PN}-async-timeout (>=3.0.1) \
+	${PYTHON_PN}-pytz (>=2019.3) \
+"
-- 
2.25.1


