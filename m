Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.12998.1615312101620703833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=bGXduOvG;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 0359DFC0;
	Tue,  9 Mar 2021 12:48:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 09 Mar 2021 12:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=OgRuXieJ3Gp+l
	NIbkAJkyf3yf1qhIS1NCrCFJip2J5Y=; b=bGXduOvGy7gPkMETW1dia5yFv9EAW
	mhn/YZlYQ96z4pbxzvRcNe+sjFd4JHQVI0fIkDW42bA/nVarRpgjDSJaqPWae2Qw
	qY/TVKLU2WWE5LSdKM5nItHytlVLsQwLdtL4ljTm4PoSvKDXqHHM/6pq16QdoGTj
	oDCVwrFquEsp6b2KPU3akVr/MwxNsJ5/NCZqvAM/kJcAyyTTfV5Qd1DiE2EkCSZH
	tckpNzCup+TVacs/f1OOVdEcO/KSVnDwTU3sIBFr4DukLT9Zyt/EawR0J2G25uFu
	zG51CpCqhz31oLX9TosBzC4YboaA5B5GxvoQW09FhgzFY964yN4YYEWDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=OgRuXieJ3Gp+lNIbkAJkyf3yf1qhIS1NCrCFJip2J5Y=; b=bw2SpDxO
	/oX4jkbECHEo+ocgHbFehE0Dw6gzAxEMOn9uvXona0Gykn7qQkN8Cvgykq0mSctd
	jhHrVbyur3xITTv2UCex6VWbjlTjbBLhMKC9a56+BbdjduteSV/Fd1pVn/XXgRyx
	/RJyEzOgj6Qdw5fFAYnJoFNrZN/vi4LM7aul1LAdgmybWsNSg9w5x2XUjTeM3bwW
	YGXSjCgJzHf3pBLeJIslookNaG9rrsoHcoubUjvrFb1hwPObsafcDY6lKiBCARLa
	Y15MtSxrr8hlolNmoB9eX3Gk7sLw6ohAe9pp9iJX/SpgMnAlkptgmkzkPKx7l/wX
	s4TradG6m1oKUQ==
X-ME-Sender: <xms:5LRHYMCwMjRKAx6tiHpHPLGoaKkWmliWVqIB2kYOKMnfXJEGmM--ZA>
    <xme:5LRHYH_3ouLdZ5RJLR8Pt8n6oTQ9BSVkjVh8CSLWyCGuev_XyMmKrYKQ302gsy6p2
    g-l4dDobOBPeIn6O2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhephfefjedufeehieffffehke
    eugfetueeuffekfeejudduveeukeeuvdfhfeelveehnecuffhomhgrihhnpehphihpihdr
    ohhrghenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:5LRHYPLIaYM_Ej0y3GoKV14rueV1Bp2Dehf8UjX93Ce3_2oOcDpOVg>
    <xmx:5LRHYIgOl6GuE0vUe1apPuVzMKeJJVMuEunR9eYA_ffTb0Bj6fL55Q>
    <xmx:5LRHYH5G7PSCzntZ87X7yhf_ZGBbDgoxfRKHamBWpqqye2Od6F-MAQ>
    <xmx:5LRHYF19BOswbDP_auVk7gwy-e2opmbZAyrp-6voHmsKkXwLyeADww>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id A33F11080054;
	Tue,  9 Mar 2021 12:48:19 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 3/6] python3-aiohue: Integrate the hue control python module
Date: Tue,  9 Mar 2021 17:47:25 +0000
Message-Id: <20210309174728.207503-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309174728.207503-1-andrei@gherzan.com>
References: <20210309174728.207503-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-devtools/python/python3-aiohue_2.2.0.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
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

