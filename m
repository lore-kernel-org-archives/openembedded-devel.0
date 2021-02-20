Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
 by mx.groups.io with SMTP id smtpd.web08.8426.1613837624690566942
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 08:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=rhB0QzKr;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.17, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id C0D0DDC0;
	Sat, 20 Feb 2021 11:13:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 20 Feb 2021 11:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=q0xt0ao5dtI24jRAP9za4yhuP5
	zfiWiIjNuLFW2Cqtk=; b=rhB0QzKrn3N41Zb72DU32FvVu0qXr9mNE9ZHolHjRo
	gODz715ImH9A69MiNruazev3pqZJzwbwvPq7TEvE/xvi0jlwTdPWMnbTTYNpn2SM
	h7Ic6nNcHBmRjktaaU4cPblV5TGY6iUTzZh3xBC2qi8o6+ao0QEZAn78D7R9RShb
	C7JZuStiAiRR/o8N+i6OBx7Eg9jNy87MJBPWiFp/MAt9Yn7npB2SQfr5Y7oBHPKi
	o2E7SwtwV1Zg0S5yZn3+8sauUftfEOearzlqyp9OR11TxEMR/J0/kIRcuForxC8w
	oNOBlryJ2dKFsRxV0TwkxyA0rw3hGQ66A/rIG4rDWQ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q0xt0ao5dtI24jRAP
	9za4yhuP5zfiWiIjNuLFW2Cqtk=; b=TmfLuN/qynBsIVKCSHmo3RUj5yKxTLCYD
	k7kREorp+GSTDl2oKSG21luih7SGx9B8tkxyhD+LrCWRcE2YdPFBYGDN+EQMoo+M
	wZ9DwIzu/quHKATFTM9tKN/5pkho9VCkQImc51fvM/x4e45FYDaH4jMl/z/RtC7r
	QifrESivgUBDf9TJcFCXmBxfkdD0ALgahmo2qMiRFTU7qg4oy6Ck1qGdI+lUxoFM
	uBN/iNDDRVeXC/Y9ULCxjRM7F3Tpxdh4v9qQTDkHy7JdzrzuvPHWWvBO1ymAFmFn
	yjV/7CaIm+N+hQuju+s+tpL2OlQ241CmIbPh5gAP849f48dcxZFPA==
X-ME-Sender: <xms:NjUxYGBa9jqQWdZ1E2XXk3EMebDauBWxYP-UE0BJVss48vW2wTMvcQ>
    <xme:NjUxYAjXjEjAC-f9iAu2kRrynVNCik-yjaHHd--t9dqr9vzboR9q14XE08hPGO1Kv
    m6N48REPiiKgoC1cGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeekgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnegovehorghsthgrlh
    dqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgggfestdekredtredt
    tdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeggeefteejjeeltdefvedttdfh
    ieffvedvteefvdeljedvheeufeeggfetleffnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:NjUxYJkW6Y8dlMmgJqTJ4rdTBFDIk6V090z4DP13iZLkW1M1udgHGA>
    <xmx:NjUxYEyBe3j5OsnzD_AedXFC7G1Wi5mMczf8R2OCa-femhGuBJOyoA>
    <xmx:NjUxYLQZFJlwpaV141WVPTTIDzw32md6hwieqBFqFE_yxORa03WTSg>
    <xmx:NzUxYOPioU9j6fSXVnQxn-F5vuO0rCWHgTIBHPDLkTTr4LDjc1Hhya6Ov1c>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net [76.250.84.236])
	by mail.messagingengine.com (Postfix) with ESMTPA id 70C731080059;
	Sat, 20 Feb 2021 11:13:42 -0500 (EST)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][PATCH] catch2: upgrade to 2.13.4
Date: Sat, 20 Feb 2021 10:13:33 -0600
Message-Id: <20210220161333.3872380-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} (84%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
similarity index 84%
rename from meta-oe/recipes-test/catch2/catch2_2.9.2.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.4.bb
index 57fc935f77..21004726a2 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git"
-SRCREV = "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
+SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x"
+SRCREV = "de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

