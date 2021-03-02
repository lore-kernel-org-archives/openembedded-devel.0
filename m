Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web12.1125.1614704021093339683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=eCR2e8iU;
 spf=pass (domain: gherzan.com, ip: 64.147.123.20, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 47CCF162D;
	Tue,  2 Mar 2021 11:53:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 02 Mar 2021 11:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=89jiIYEboY1l+/zqjPA9JPifsv
	8SU7YDUcnYSCLyeGk=; b=eCR2e8iUm+jxSyVpXHOwlCaHwvmatFlSuVaoF2/AxA
	pCTQ55nsVUaanjg58cazsEUvhXeCiHnYEpPzc2SBPiyLb9LDC+ICra6AUOQqwAxm
	PUWsKhzdmYYVeoB1oisSQOswylx+XfQrhkYbcfVgfnHWskYMD78wIkgNkSBTdFmE
	GZQMOvvhFzNGeYdpcYUx2/4Hxbdgq7taWUP/s8/7lBcmr8AawxQ7ikimaEjGPWjF
	3D1AzdsOYlptV2pCmItTlb09sZTqzztsLXawnU1AiIZVxaUJwVAI1w69ZrTDh9VN
	tn7MTsE9vCaCoJQzklHpGQj66oIIZRkfe2rnKxTRnnTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=89jiIYEboY1l+/zqj
	PA9JPifsv8SU7YDUcnYSCLyeGk=; b=eK5T8923S+lgcWR3gSZubwA/dYgMzjrXU
	jJXuFi4UcooGnmp5WJLx10aK16hZwzAmmLyPy3/rQp9Jonv2AN/VtM6tkfTFQ09I
	/QwplUV5SFefEhepOqXWus7AOemaDui2CKX2bLBfupGre25NBDlL/CKMddU5cduK
	LeBtKXALXHjU5hno5J/8HOEwTnscZoghlEWTJdp96WICk7b8UBijIG3gZRvptd73
	FGYYSkCuh6zDqFFZ5RmFFtQhXSnSkjGXV/2rVzyG2dVDUCpVU/YM0fXPgKk8HeuM
	lO5gW7wWJ5uVH6Mdj9/lbEo3R8cDvJ8VV9EemsnBUZtb1QN7hb5aA==
X-ME-Sender: <xms:k20-YO0Z5xytKWWv-g5Ki5vvhIfcYXTnJ6Z59zN4ZNvIHaKLwvepRA>
    <xme:k20-YO4FTTUYtnwV7Jg5_rjlOCZYRAGxdgqO2POnS6_E9KwDeo1JeloCZbB-O8zwt
    1lNgxj0jD-ttRukKwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeetffevkeelhfevleduueekff
    eihfejgfduhfeiteeuleeltdegkeefieffieenucffohhmrghinhepphihphhirdhorhhg
    necukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:k20-YBWQyG2JZm98mjWV303T6qlolYZStyiEvTCb2kzU1jGviLirKg>
    <xmx:k20-YNCEykc2K41beVeFRNDao5_wAGFJjJKvSxi2htClLv7HaHo5Sg>
    <xmx:k20-YA6AONwryrsm3zhQxiHWM42jKg-DvDcPeOrqPNFJYbdz58PDSg>
    <xmx:k20-YBWWCL8-znq1RjEEZ80YGctuSaeDHjaiBFW1QcKgrsEn6WYSuw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id CE6D324005C;
	Tue,  2 Mar 2021 11:53:38 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH] python3-ifaddr: Integrate a dependency of pysonos
Date: Tue,  2 Mar 2021 16:52:13 +0000
Message-Id: <20210302165213.2095816-1-andrei@gherzan.com>
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

