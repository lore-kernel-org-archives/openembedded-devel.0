Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.12971.1615312098580566750
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=HyqeYXJM;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id F357610C7;
	Tue,  9 Mar 2021 12:48:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 09 Mar 2021 12:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=Vjn0NXDZoFFmD
	zCDUyHQIA4EJYlAJDKm2KJhmNDtH7E=; b=HyqeYXJMpgJWjBbqtWUg8ALQtkk0s
	0JDt1Mg4NeGfWdwj3JHZL+yvDYFc90ycvpPAQq+0LieLfVj7Qh29LzrHKF3IaGPN
	egSnzbBwa1u4O+wMlZkMD8kmtA1EdXhME4V043L8PvKBEhnQzbNkKJ8+JbVu9dhr
	/EaU9o62Yjh4kgFL4q+rJo3w3WdQSlAExJK2QY7YA7Yz74MwsiscEEKzaUel4t6z
	odu/jtl3zNIXZ/CIcKzvSa87JCmYyfYICvEsrOw6767nIUfCzUlma2my8szGmnxL
	zJZEXS+ZRkBf+ZIS5+PDrzKPpJdEoBywW0J0ZkJCaZH952rcov2/Pttnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Vjn0NXDZoFFmDzCDUyHQIA4EJYlAJDKm2KJhmNDtH7E=; b=GaYWGu6Q
	MHbquPh1o1DOcKM8V0oEkHWL+EY2vKZUQIlomGIgq1EDP1Bg0tyNo4sn8RoVk7IW
	l3/7KTcvmLviB87k+xlzUq8/D/UdbduEa/gGQXHHqZIIU1TUIYGkoMhgCKNNFN7a
	NnvcMVTfQBMN+L+xB6zE3Ux35pigw7xAEi0guWjgw/AT3ULrJw9tpq9ouG4LTyHX
	Mz7UaoeDHly/rexJZwIRjB7/ZvkzOILDp8+VrUeZHOIrwndMGkPrpWvd5t9W/hSU
	/Uq+iQCagr7SKUM5xherdVaRcTYKpP3MZdb4Aul9WB4GkqHCfFux5i75XLwWvJHM
	mR/qSGG3Vapoow==
X-ME-Sender: <xms:4bRHYPIWOvb75kXStvO-eL-bQTsnvm6V949JnY0OeqFbfUvUsu_IOA>
    <xme:4bRHYIV48TqSl9Z1xHCphvSQB_uwQSopSusXUeFsmALXZQI_Rr6V0zP4zy2msYIGo
    XLAZwWtB8fprnDz1qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhephfefjedufeehieffffehke
    eugfetueeuffekfeejudduveeukeeuvdfhfeelveehnecuffhomhgrihhnpehphihpihdr
    ohhrghenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:4bRHYLFWHptuRaapz4W1QAuii3wbqTGjYepXwrC3myxpbAqCn_5smg>
    <xmx:4bRHYH4uGFXwlOtsK8L73AQq1Bwif0HgmwzLeuTsS5wjxR1GSuih-A>
    <xmx:4bRHYBeTtPd1r7Rb1rB6tcz6w7J2TUoHw0-g_wwr_msidnrp9MM9qQ>
    <xmx:4bRHYLx81X-u5uNiRGYXF0H28ODpHJ5x1e4KY7Lo1OJWD7AHrUUwew>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1886D1080063;
	Tue,  9 Mar 2021 12:48:17 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 2/6] python3-pysonos: Integrate the SONOS control HomeAssistant module
Date: Tue,  9 Mar 2021 17:47:24 +0000
Message-Id: <20210309174728.207503-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309174728.207503-1-andrei@gherzan.com>
References: <20210309174728.207503-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../python/python3-pysonos_0.0.40.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
new file mode 100644
index 000000000..dbfa0dff5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
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

