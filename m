Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web09.8138.1614691284138654335
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=lQFxkZrQ;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 0134A135E;
	Tue,  2 Mar 2021 08:21:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 02 Mar 2021 08:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=YdB2DYhAkWehlkFiSsVNc9oiid
	4ja/k4eTi6r+GhsTs=; b=lQFxkZrQDYDK3Wy2668tXHRbybHyFKqFAHWG2Uah3Z
	C3pGqIYAfltGdtjlxlA3YspC+tqeWfu9Am9xfGH5l8miNWzwFG99lMzLhBcAmOl3
	Ttjnl5SwV7xzYCY1lw6RZZQuFyypFxTvJQUDI8SbiHQKQWd8GNPr3aRexwcexs1W
	iLNNzwFH6uLjOb1LAtOf93akORbJaLNVn+PwGFiPxKYHsfPMSRo2L8pvrQU5yC2o
	JNw91lxEVZbIJMlarg7ZrXS2WpAKqddjkTH1E7Fm/6qFfpfd3O4l/JY/bX71hrYB
	59bDbaUCWd49BXZNYUqIYS9PuEDzVTbrLNxyNuIu/0yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YdB2DYhAkWehlkFiS
	sVNc9oiid4ja/k4eTi6r+GhsTs=; b=QeoIhUmTXxI74l5tR5JYFk8olxNo3upSx
	QbhGGfqacarBA/xIfJUKdZOJusimW9NO6NOZk2u8pqdcTYhBDEh1FFq4tRUA3hvU
	0VggMbJRXcrDrB5qRa4D4s1wMBaMH4EEYzC56raodUSQ1CKGPBsOgrsA01hzZk7O
	oDUwatn0mplrmBLNz/dXUrXcOzgQLFLM/q1Dn8bWbt6xYbTcP2mAcUL0W1Lo4P/c
	ocVzNBOWp/ztHrjUPXm/xWVQD3YyMldr2W/iTX64+aP1vlrOq1chex/a8HjTlAXO
	1Jm5IXVTRROxhkTjumrWYviWrr0Fs0pgVJckzLU96uk7qKIRC0UiA==
X-ME-Sender: <xms:0js-YMFrDVkmwxb14eLHYap6SCG4MAcRuo1rnxF-s45O92vgsXLvRg>
    <xme:0js-YFVjaPXz-xqHyOYD2OgUzdOavFlxpBu4mkKeWxqEr2ylExLLg4uD2d45JQHcO
    as66Npy5CQEDB2cODk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvleefteetkeekvdfgheelteekje
    euueetgfetvdfhjeetvdekhfekledthffgteenucffohhmrghinhepghhithhhuhgsrdgt
    ohhmnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:0js-YGIBbYZiXmRYjQGYnZyyFMw7xsFJmQq1lR73uZGSv1wAixUzXw>
    <xmx:0js-YOEO47JkHYpsMLTym3kPcBDFQtkL3nYrryxTjh8K3lWu85WJtg>
    <xmx:0js-YCVAuzsx3tmiz9kkMD_JsIrGtDbgA47m1VD4cVmqzXVG_hmE9w>
    <xmx:0js-YNDLMw5Xgf3BU5A1hfaG-bkOfJjDduJpx3hTrqQq95R071P1Ig>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id B15E71080057;
	Tue,  2 Mar 2021 08:21:21 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.com>
Subject: [meta-python][PATCH 1/2] python3-mccabe: Fix HOMEPAGE
Date: Tue,  2 Mar 2021 13:21:10 +0000
Message-Id: <20210302132111.1644601-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
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

