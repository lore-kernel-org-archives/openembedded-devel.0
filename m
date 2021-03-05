Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.14049.1614960193047665442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=kcew8UsB;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 69A5F2099;
	Fri,  5 Mar 2021 11:03:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 11:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=NxieFeBn8DqUN
	vDp9oCMSwByNMApQGtYOEH36wcwAgM=; b=kcew8UsBZh3YdSXnCERHCZaxW6C4N
	V4n/85y3Zvmit5Rw3rEimk7Lymz6FgG44UGbQhY4ph5dRoVk5K7RRMLU3eVlzXlg
	9ocy1XtKQv/PSvsJAtSJ+hGEBkvseQ20UzgjuLr/2/fvrKQa3TjFGJZjQOOVDcxU
	n4lmwLKOFlcdcc9z9g3mdWWsn4dX2e6YZLlgDt7ap/EXnaLQK3+Rv28yrf+/5Jh8
	z9wmanm8eas8NfInD9Gxj+OCoGvqO67Jkia8Ft4GJwUIA37f6fHCoALP1f+nsonx
	Li9opgH4geMEPjX6PfXg8ye1LwiPUjy6GaALXUv5nkc1aIj2/vyK5BPCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=NxieFeBn8DqUNvDp9oCMSwByNMApQGtYOEH36wcwAgM=; b=bU5KWEnV
	cbwbyxm689WMBsXzPnHBT1jxnxPaGfnB0RKbZng30Q021sJJi2wZKouszucfLrbC
	87SU46FuiUygSPl/4w7AoiwZSZID+qda/ORV9Uy13eKgzbR/vjNSuxAQatzZMpNB
	6tpKzm4YFBs9yCTx40K1LrNxREaIYE8CX7HKp8ixpSrjTLFXteT9jTHVOhlwPoKn
	opDwtkSP9sssKafk5z3EeTtEjasVJumcK5v7iGdIcAUmUlXTnQ3u7mYfN0sitRkn
	xLBr7A84E4MFFqWTS0a3gdIBEE1Rc8d79lcGyPimM1F+Yq5e/mYvZqrTumXzadQD
	Nq6fV7Ly53w2Lg==
X-ME-Sender: <xms:QFZCYN8K8n8h2IwtzyX7ZN8Vx4ZiytSVoB0As-2eFMQLsQRIWp3CUw>
    <xme:QFZCYMbTDHpnMhiPei3dxWdkx-yJhpMOx7LrJDPXOZPxdKnSEsJE5xfZ3Sf0elUcr
    L_ybi594K57EJChpxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnhepleeliefhvedvvdejgfeuueekgeffieevhffgleduhfdugeegffdutdel
    feeugeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddtledrudegie
    drfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:QFZCYBrCAXmBlQqyip7CXYw5h5ZGR9HaUiPZXySLage_6LSkXMGCVg>
    <xmx:QFZCYMacQzOttY8eAHgRQpeyrnaBwlP-GLV9ElplamPaj8udvU0uDw>
    <xmx:QFZCYM7DyhcKvJzYMY2L1mHp8U6R5fuPVWBslDkL84_CIJglf6LsJg>
    <xmx:QFZCYBG6UAIA9gb8AI6kCs6Fu0uqI65lOWaQ5Z6bZ1N1Fp_VKaSoFw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1F077240057;
	Fri,  5 Mar 2021 11:03:10 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v3 5/6] python3-pep8: Fix HOMEPAGE
Date: Fri,  5 Mar 2021 16:02:55 +0000
Message-Id: <20210305160256.3333334-5-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

