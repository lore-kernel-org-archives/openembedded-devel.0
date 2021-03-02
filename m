Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web08.855.1614703075933263881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=NTcQsAiO;
 spf=pass (domain: gherzan.com, ip: 64.147.123.20, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id E6EEA11F4;
	Tue,  2 Mar 2021 11:37:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 02 Mar 2021 11:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=jmo4H/kbCAU9IOUrdQuIDH/uwH
	8OhGgFqwS4sjl/68A=; b=NTcQsAiOLPgE1DPishwRRHWJl1N9sEBhnBjK6dOIpV
	Zp+ujgVXAYrrxu0Jyrjd38AhCkJfJRrow0YDsuSUvggsJsq8WF3fkucnmUkMNVC/
	Qhn+CG95vBxTIw1t8C7LHMrhItnYt7/GQSd599NFBgWofMTqlziIabl1QY/3+gzN
	BGeq3up0doYquMTg1a0pqsS3TeePqvJwPuYC3Uc0ib0lXC69A4j8yl15K5clZs0N
	n6x16O8NBDDM3YH+Is/VUJVgB2am1+3FPZsNoiUML0pIhoOg4T42/a/EoyvOtEJE
	3oHgskC8noeeE+ZMAwMwAH/0XrugdE1riB5l8+AH6+FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jmo4H/kbCAU9IOUrd
	QuIDH/uwH8OhGgFqwS4sjl/68A=; b=sJsVJ+g5laSmMTQ2pVu8tkuRnlgcD/pj+
	bM7z8RNQyK3cXm3bB+xALZ5lMRib2sxEfl9QoVaPcAlnkWVzqSXVH7Z/yZMM4NLK
	DvrciIPG/CH1CVCuK8CZcv2bMdY4dRiFTJfiDP0QUKYIgSIV76u/ZDQYO58HtZh4
	7MHpvm8xYNWuZBezhQNVr9PbUMLZUcIqlge6ns3s0L7ATkfKqaNpr0P9iVSD6rtr
	/+/Vz2tafu98zwkhnukcKOix91yna35/Odb2ha19D2D4xBeqVfCUlCLLYbnL+v++
	Ksyok98QWYCWcdNhWCdbx0acQ8hna5wyJxyWjwYECGkFKdpCqKFGw==
X-ME-Sender: <xms:4Wk-YPSchUJElQWEXqxTAGGFxCDBi3nW6InVWeyU4hSgBt9gO-6cBw>
    <xme:4Wk-YAwoze6AP5fLaae_tZHcUvsW7JhggGk3M7Zqurur6a6dYToxhINT1N-48JL-7
    J-2EnsHCUtXiFixZS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeetffevkeelhfevleduueekff
    eihfejgfduhfeiteeuleeltdegkeefieffieenucffohhmrghinhepphihphhirdhorhhg
    necukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:4Wk-YE0txUkIwaYYO8j2m6UU1JfhAnn-X2vnjT17X-HMP7FydkPvIQ>
    <xmx:4Wk-YPDjhl0wrrzhKpqMtQtha3A-2ajyMyKqgeLOo1OfnZLJu5haqg>
    <xmx:4Wk-YIhxvIDu47vnHmJw37lHtLjhVSjA6aNrGha221Woyc9hJiMkRQ>
    <xmx:4mk-YGfQ0eEfQG3EaEtzkm_MmaI0EGlYJuEvwUAJ0Ch7sKROMR5ikw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 80247240064;
	Tue,  2 Mar 2021 11:37:53 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH 1/2] python3-aiohue: Integrate the hue control python module
Date: Tue,  2 Mar 2021 16:37:41 +0000
Message-Id: <20210302163742.2047086-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-devtools/python/python3-aiohue_2.2.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/recipes-devtools/python/python3-aiohue_2.2.0.bb b/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/recipes-devtools/python/python3-aiohue_2.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Asynchronous library to control Philips Hue"
+HOMEPAGE = "https://pypi.org/project/aiohue/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+# No license file available but the license is specified in PKG-INFO and setup.py.
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
-- 
2.30.1

