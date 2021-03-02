Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web12.875.1614703075914647869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=aDtHJP2T;
 spf=pass (domain: gherzan.com, ip: 64.147.123.20, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F15FE15EF;
	Tue,  2 Mar 2021 11:37:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 02 Mar 2021 11:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=AektYAnIA+NVy
	qCtoFF1psOA1aR6PbtvftqTDKGww7A=; b=aDtHJP2T01kiQPtlIyu6DDJ2EcxrA
	yqcdHNkLnRzMwRQMEb20+XwGPARxQQjeosT8mi/+CFwsG8YuOrpQjNwvx8y9bKKz
	oGhCsnQdh1Nf+oijRu/bNqjLd2SYhYxW2VV7bcIRKmdh5SEnTBYwq6AffsC61ICI
	WdQmGr3yTTkmzJwHmqD0IKej/Z4NCI2G4sYMQFOsEYEinm9epvhzfUNUMJR2dAZV
	97Pl83Ia42hffP6zgJMHsOCERHnQbeMZ21E1+b4QlLU+3ybolebJJnQ+yJLmZjI6
	DkM6wEEFLiBNTSoayJjVLCZc+cPg2D7DHUsY/Wy48Py5jpk7mEk9+GfdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=AektYAnIA+NVyqCtoFF1psOA1aR6PbtvftqTDKGww7A=; b=MtHqjV7H
	dAxS2CuD+hvW6iuqto+zaH/q3Mes63iCAWa8LTqdjTYj836jcJ5pHglosL2QUpkC
	2V/NCpPig7DNk2wk1gykt3cl4vWVp9sHjsko9UYAk6q9mNKIzeAtZQthksvAkWyb
	4TNRBtJJMUVegRyDCO4yWfkhzoVD0BaY9cdSkE9jcUftdePyVV3q4qc1tDoqAtMP
	dAYFFxfggc1kyoWH6UBeGVdabOKKjD0CvPRhSLi0j9nPoYAV4QZMtZ/fHoOtKLx+
	Me2OVzmNc7DS2kN30xNsa1lhPAUjGdUGu1RRYgrJ6mhCabUJSd+ZcbThiwEW8UGh
	UGkHDGHtwq15zg==
X-ME-Sender: <xms:4mk-YOPJ7nsW22HwjPaNQaG8CsnmTRfZmjPP6g_fjf8zEOoqx3aeGQ>
    <xme:4mk-YO9SdMHQWIfDE1mxTw-U12MR0GP7bxvgLTMxIQX7mguPeF05U5ZYPk640PJK1
    yHj90bSO6Mjr0HqfAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejudefheeiffffheekue
    fgteeuueffkeefjeduudevueekuedvhfefleevheenucffohhmrghinhepphihphhirdho
    rhhgnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:4mk-YOqK0__Lg3OagJK4xxoL_yq7dA1-zgAAo4D5eTCcJap1SVlcEg>
    <xmx:4mk-YA5XvZhUqt0Up4ScHVafzrFVY5ZlRM2oudkvDNox-1pUdudvMg>
    <xmx:4mk-YOORZ0txzBPdhosz4fMkOHi2-AdaX4YE6pK9vrPAEcweN3WZXQ>
    <xmx:4mk-YNAY7uyCOfS3uPfGJGOBF0A6gcj0i-T5KvWsdFunRBESw1X3fA>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2456324005B;
	Tue,  2 Mar 2021 11:37:54 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH 2/2] python3-aiohue: Integrate the SONOS control HomeAssistant module
Date: Tue,  2 Mar 2021 16:37:42 +0000
Message-Id: <20210302163742.2047086-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302163742.2047086-1-andrei@gherzan.com>
References: <20210302163742.2047086-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-devtools/python/python3-pysonos_0.0.40.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-devtools/python/python3-pysonos_0.0.40.bb

diff --git a/recipes-devtools/python/python3-pysonos_0.0.40.bb b/recipes-devtools/python/python3-pysonos_0.0.40.bb
new file mode 100644
index 000000000..dbfa0dff5
--- /dev/null
+++ b/recipes-devtools/python/python3-pysonos_0.0.40.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A SoCo fork with fixes for Home Assistant "
+HOMEPAGE = "https://pypi.org/project/pysonos/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
+
+SRC_URI[sha256sum] = "3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+	${PYTHON_PN}-ifaddr \
+	${PYTHON_PN}-requests \
+	${PYTHON_PN}-xmltodict \
+	"
-- 
2.30.1

