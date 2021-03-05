Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.14028.1614960194117639327
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=pHQi2/cx;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 806012A37;
	Fri,  5 Mar 2021 11:03:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 11:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=Na46qRNHa94eT
	6nWAWpHHW3KXs+gwjKZh9ypWy7dYxY=; b=pHQi2/cxRAqNb+HjvX4LtqNG9c6lc
	SkO+ft/NiJWv+6lr0+RZgnx8jF3sbx5yvJWgyO4bCsDMsCO2DIz+sRp9QqHXIA6Q
	pTvqYUpLXiyX3Z34ZX4znPbUBDWG6OJuNo9jXhWqgCiT9soKVjTYWYCn7YMeNHfO
	o2TZgm8TaoCf5w6teRGYKPk2Qh9nyAjsTGvKyeaKPqDgLqSDZVXS5kVyI3nHoVTo
	szawVwCZ3Qs83PKFeMPSL5TZUD8wEhmfzjeHEaqirN8XhKI+thRw4Psw7jjNdReC
	DSU75N7wp3KkKv1gX6WpNhGDopIDk0UyIZXrjf5rGUE2yS7RdDOX08Opg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Na46qRNHa94eT6nWAWpHHW3KXs+gwjKZh9ypWy7dYxY=; b=sXp1Y22y
	TuHVWps40oFfw8c5RXxorinbPNVd2zohXr9A3ATgupCfTCqrJQ1JH4ClPFxKwpNF
	lUJLuePR7EwGWon05R/cBrCl15YyYUYTLUIf2FggN1wHtNWQ2iTY9CawZxBMrIwY
	E8ByYdg1FQpJGgGO+TVyCKy+qygdHPDXIuf4z8BslZFDO3eBL2u2zA9YALCgbmHK
	Zt/RzpUSJEZh4555H06LjEf9pCfW+8U0FVoN1ZAccJxZmo2jFBla0TwoyHbN+Nhj
	5RnmY0VRfcr6amKhhzp8hDnG472PfOBVy8CKSUb7D0tTr36AhQ5m49ovS6RiD0gb
	DTdqg/PtCBhM1g==
X-ME-Sender: <xms:QFZCYONyqUUaGAjXGLx62ZYzwADUhvJ_KuIE502YqyORhPTLhB77gQ>
    <xme:QFZCYD-d0AyKCKywMCJUqTZeO_JpPKWwzVf05IzOSGAlIzoAh9ez0bJSIYtyd8MtI
    VqA6Oasf0rWa2Y8pCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnhepleeliefhvedvvdejgfeuueekgeffieevhffgleduhfdugeegffdutdel
    feeugeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddtledrudegie
    drfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:QFZCYKSbF-jQkocIfmCy7me_uip9V9jB6RXs1UOhoazwQjtByXxggA>
    <xmx:QFZCYNmqMpT5aOdwE-XmNGIu4UxoqFMya_QJJgrKfxGfASSpgQ4VMw>
    <xmx:QFZCYCTqXvpVdQHsfJe3kRv-MXyVEy7dBFet2h1c1AkMObvEp5GjpQ>
    <xmx:QFZCYK0sHbfzGHboANZ-whtIRHKDnAGdyxDzMlmzKznPZEdYEhnJOA>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 34B7D240064;
	Fri,  5 Mar 2021 11:03:12 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v3 6/6] python3-mccabe: Fix HOMEPAGE
Date: Fri,  5 Mar 2021 16:02:56 +0000
Message-Id: <20210305160256.3333334-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index 63a9e35ac..b366f0430 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "McCabe checker, plugin for flake8"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
+HOMEPAGE = "https://github.com/PyCQA/mccabe"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
-- 
2.30.1

