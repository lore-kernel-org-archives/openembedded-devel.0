Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.13108.1615312104950066504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=ZSk9KPsc;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 597DB10B2;
	Tue,  9 Mar 2021 12:48:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 09 Mar 2021 12:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=a7yGkStOOzApC
	l1YWuA7bJHd9lP2QI3zfH+/sBmoTo0=; b=ZSk9KPsc9eUV0B+T8fla2nSFJZq0k
	sVaGF0fe65ek5+q6OdNMloucKz+Rty7ACcsbMXZZ4HPOxtIPl525gkBNMRmDDWHu
	ZlSPla/nTUkqnE2gS13yNNDDSdVXGr6lJlTZDyui95Rzvypajc+lk9hJ1hvgX8Zh
	lUr8hwiUUMMBdbk88PY87Vt1s66PiLGBlupuW1F/bp6Tw99tlq11AROPZKNwhrLH
	WUPPj7RuYvur4JwSV39AuOBHp0V6Zz1jUPbUCEI3hXWbmJoRJh1gU9u3ozL4pIeh
	Q3Q4yQJ2XnnmzdyKw/+xOgHScMV9KnDa789TdMFr3q/n+FD6IQ6BmaSSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=a7yGkStOOzApCl1YWuA7bJHd9lP2QI3zfH+/sBmoTo0=; b=F96MUEfr
	qrAUjIgAufyhBdaxpMxmuyp1QbZOfWkLg7i/ONqh7ubQcO0kwJU1MqD4fSP1Adg9
	s88C94T6oQrJR94Z028RcHx3HciddrtL7czkGdyDI2BVFfyI4+/ht4FUzIQaeECD
	X3yUIRr0SD7yFGwb5DgncXXPt//xdpxvlP/Lq/Dt1AL0gzS3zyhGxhS3FNCH83pb
	tVO7xquQEbrxQ5rvSMWOBRMDdgI+LAwn/M73eqcMnSa00g7jFf5tpdfME8gVuIPf
	keDJw/ylEtQnQIb+Xi9Uhm+n5BCodX46UJhXCv/xa3pxG6OcvpbKzcJbziOCfr+w
	npF+gofqd9i2JA==
X-ME-Sender: <xms:57RHYLVCe6r9kv-SR6d_MrnXg7UIrCCmhn945DTdIwLh3YVT7mEAQw>
    <xme:57RHYN_stmdGptU9_yaH7LgoYMtZRE3l4eEteEXfdrpruaMc_A7wCcOawPgl76LxL
    9Pn1SqxNs1fTAcmEt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepleeliefhvedvvdejgfeuue
    ekgeffieevhffgleduhfdugeegffdutdelfeeugeeunecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghn
    rdgtohhm
X-ME-Proxy: <xmx:57RHYC-2IN2Rd0m3jG2Qj0hqCofjEVMCqThrsxNfI3cw5cY8mCKWSQ>
    <xmx:57RHYAWHj43WwJ8sHgoY60hoFvX_rROGKnJWyf1IGHArSqBcu9wS4Q>
    <xmx:57RHYPaMP9d8s0c3-6JoQnpwgHU_KT9CQaAfIPJQX4_ZLLdXd4SP_A>
    <xmx:57RHYCYA83i5Fec6dsGbxSbTBmBGORFHj386iqB_MjGoRG9V5Ki2Bw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5BE261080063;
	Tue,  9 Mar 2021 12:48:23 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 5/6] python3-pep8: Fix HOMEPAGE
Date: Tue,  9 Mar 2021 17:47:27 +0000
Message-Id: <20210309174728.207503-5-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309174728.207503-1-andrei@gherzan.com>
References: <20210309174728.207503-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 8291281ca..e8587c832 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Python style guide checker"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
+HOMEPAGE = "https://github.com/PyCQA/pycodestyle"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
-- 
2.30.1

