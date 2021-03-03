Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.6518.1614778387928652110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=nLNVF5Q4;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 39EEE17EC;
	Wed,  3 Mar 2021 08:33:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 03 Mar 2021 08:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=NxieFeBn8DqUN
	vDp9oCMSwByNMApQGtYOEH36wcwAgM=; b=nLNVF5Q4f4+ZJ3ReCAu5ICxnLYKC5
	O5jW1Oukc+t4zYCj8yWarCszO98QlufwtDi3nLm2Q+ZfLitrPeIYw33qZ5FoiA/e
	Rf0TAwtgIgGyPj7iWT2v9nbCc0AgdMvDnl1kCVxKwJKDWaCechKwvp8J2AS9EDuW
	BPkIqD7G0gypwj/KzM0mqfLOyQiKgENqe+W+Zyi+/Le+nbtE2hof8NfWv7Q+VLp3
	RUe1OtB1pYmxCmZhfnBfYsv4UUMQHH8XbeGNk3/SmNaLTJSN1sEoekibkbWBGD4t
	GpvZhAWI4Lc9qwPJ6p5mkSh0qsVwUhHo+Jjv8LlLYzJcRPY8O+u+wYSWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=NxieFeBn8DqUNvDp9oCMSwByNMApQGtYOEH36wcwAgM=; b=PGx53KfK
	2DgG6YYzCbQ5yHCo2dOIwi5sBsXrU1tlehpdRkxdioq8hn9GN9Opy62WV6nKw+Vj
	+h5qobUmBbK94CrPYmiHa2UO879+kFG5lOMo+bqbBvOd6ZmDq9+nsle5dM5tdnDA
	qP0c7Ae0PlaMAwFcyqaR0jzhjf5R+MHOTh93ZNZgBX1DY4Ma+mMqT6nbPAuadpWp
	STXqI8Y3r9R6oJiHe8VOexFoDRYKfKgznD7r0OTyIGXlpWeGvFT1aZzUVMWWKnXR
	QNlntrzbcUWSvod3/eWPT452lPMeZf5ly4FM2Epsq9nhmVjqygduYtsIfpF8SPTE
	zsnJDuMD9InF0w==
X-ME-Sender: <xms:EpA_YOb7sY7QFJgn-_yFTV78adi9xdHOPQoehwwCpEEPUjtdmz2zjA>
    <xme:EpA_YBYBF55uJmtZkQvq2Iu6tUBqLN4RD7JPGH5r2fPF6aDIqpMg0jIurasMJMEbq
    mhZNu0bL4eLwUNgAy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnhepleeliefhvedvvdejgfeuueekgeffieevhffgleduhfdugeegffdutdel
    feeugeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddtledrudegie
    drfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:EpA_YI-SbQbGrLUsYrRntHYXqg1_rvCdQb1I_S82B2pJr4ZN9DBKFg>
    <xmx:EpA_YApNC5GLEa_gRwnXGcM6TZMkg2RNmZ00ILwvrPsv5bPmT7E0nA>
    <xmx:EpA_YJqNgtYt8Dj5UXqv5Iab2Owo9N1uuRLqEJ4cX3Fw910ZakBJvA>
    <xmx:EpA_YITSHgo0Q8ySHgWWTJTiRnX_4fZ1A4W8Y8f6BcLzE63c854BUw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3472D1080059;
	Wed,  3 Mar 2021 08:33:05 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2 5/6] python3-pep8: Fix HOMEPAGE
Date: Wed,  3 Mar 2021 13:32:40 +0000
Message-Id: <20210303133241.29781-5-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303133241.29781-1-andrei@gherzan.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
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

