Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.12999.1615312106859704501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=P2QB7jfu;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 314C9559;
	Tue,  9 Mar 2021 12:48:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 09 Mar 2021 12:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=h9/UhY47TTcCh
	2579TN6HtShCydI0havdtzpPrM1E58=; b=P2QB7jfuj69RYGoOX1ziUXllo/8gU
	Mt8qY+iFOoXaCmEqO3Fn9FXFaPu1Lkz8DCapRzx4LEI/5Z8+oVbVsy5OGtVWpPWU
	RWYIyZRU+JwqIX8Vs8qmP5VE3z+Z4LKzfDXlnfVeibw0beBlSsGmw9RqzSDWZt5n
	NGX+BOxtISYTpMmQ0+FVf1T6VvpKGnsFeFiC0YKq/6aTgQ26ag2V+79BFAqonlTK
	x2x0ulCznyyeHe1TTzOCWcoLzX4DOJMniJB4ZE4OV2008DmmUC53Q/HvY6hFbDtu
	HeVhyUwkqVXTbCK7tgrl+WFiS6MumXm3HNTno+jsjxKZibq2ihF7ga5tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=h9/UhY47TTcCh2579TN6HtShCydI0havdtzpPrM1E58=; b=fTnQrYzu
	qXjVzJAD/RrFdp1hcFzY75xEZhGzaVo35ILBojTxrukgcF+zXn5yey1WyVIWF1jB
	F77guOtYunBZcbEHyx8wpgZSpxI2EMUnA8jTAPqD9EYe3bZu+yQD8OHS3YCFcWs6
	mkM4RvEIOs0NOnFymKRSBqHjLrCyxnkhpbf2b7xrX4VE0ieW1MFnTui/dDUyiXKS
	Gx1ZBGxvDaByG8Mi1wqzOo0jstE5Hgl72oVjwsrUNi/QMbHDHDe2v5RRq1AUXRz5
	lkBE1vo72N89obyhYuqYZvyeTOlGVpZagWyLuUalEeqhl0zdopuwu9EpvVdIUsRI
	mOtzsA01JiVb/A==
X-ME-Sender: <xms:6bRHYJWwTrDgtLbYP9iIX6MPvTQ52a8ZS5HqPkkBUrCoiKvjkCgy2Q>
    <xme:6bRHYBOGOrvG5ZH32yV9OgWVDxraZMlsYJfLcjg20iQDOAwJZWGDCY0i8vDbFkB_0
    eAVeqBpJPT9qg3DYzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepleeliefhvedvvdejgfeuue
    ekgeffieevhffgleduhfdugeegffdutdelfeeugeeunecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghn
    rdgtohhm
X-ME-Proxy: <xmx:6bRHYFkvrXUOwL5Btb0st9AFUrDcM4B7zco5Z4ARDqcybAtCc-_q9A>
    <xmx:6bRHYEUEFe7fSYaaCu2ES9xBmfl4eDOm2rcxkkUf4vh0Fx1RaIb9VQ>
    <xmx:6bRHYEJ2dsyxhP6_g1pw74YeDjdz0H3mYhxz9fhS58ftuKAy0k1WEg>
    <xmx:6bRHYCO7_k9SOvaBRItYtKHMxp3fGgObP0NZCGLuf9SetM0svcY_yw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3F2A81080059;
	Tue,  9 Mar 2021 12:48:25 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 6/6] python3-mccabe: Fix HOMEPAGE
Date: Tue,  9 Mar 2021 17:47:28 +0000
Message-Id: <20210309174728.207503-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309174728.207503-1-andrei@gherzan.com>
References: <20210309174728.207503-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
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

