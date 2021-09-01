Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.3515.1630536987870789851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=RauCNKR6;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 52B453200935;
	Wed,  1 Sep 2021 18:56:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 01 Sep 2021 18:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=Ikyy/pW64UEPfeg0MIHacV1vvV
	xIj35BPbslJs2qFS8=; b=RauCNKR6Udsh8GM5+srqObybfCVw9aMeXXnOYp/tsQ
	rIGEqo4uy0Xp5qjAPRPZnIdrHNuFMPXS4w1lKXesAX4k1LgYQhXghlpUQiKfNIe4
	zsXds1sav6TgOBEWnYrVSrc2aV8CDvbYm7s5pZeIEF9kGZ9yrwqpG1FqFiN0Wy64
	4avoff/NqfRK92v25mvYD/pqBYuV8Z53rLQLun4ajOaj8ZvlRUfaxx5lq7Qwl2zK
	B8Ao+jC0pJUad7P0kp+j5LZ3K3X99bnFq/XP4/Hc7FTq9khSKepntTCbL8onKKPi
	MhCRj43iFP+TpiLk4soBHtFmRLOiuRvnWkf7kAL8/gIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ikyy/pW64UEPfeg0M
	IHacV1vvVxIj35BPbslJs2qFS8=; b=DHT1BbZwZUOOa2cDANG7aqxl7Ommo0SEe
	baBnWpwBVVI+WIDNkC+SoTb7VjaM1nc0KxDpMSVf8ikpUHbRlo9vu18eUppMZgbz
	gnf/ElAb8nH8aSSlK3EfD9aFHXRc2bUBPfIlOdc3ZgR6TJPmnRHA4VoQ44oykz/o
	4ltnyw8C9mgK6AsmTzgI1fz14JNAM79gCH90PZ4qL4EgBmUv/qu/WqyoLhv53/pC
	hKDTEex7lGDUzi0KwG3bnpHZRhRsf1TSo1c+PO6ulKUQHNcICqj7tzpAi4BMCbxq
	pTaP0gFH5qXO2D5B+aTaGUBnWa2Uy2EWyqbJ+rRybo9vodvQxlUrg==
X-ME-Sender: <xms:GQUwYXYwbXmjpMcsnDtF4dx7oUpcQOBT975NaydDR-UtmVY9hiPcuQ>
    <xme:GQUwYWbCxRVsdsmwS4ugQ6wnquYC6S9DujKU9FoG4-iJR_yIS_KE-XOMSjLr3ZyRG
    ifMtY9L0aFHwYdjdNg>
X-ME-Received: <xmr:GQUwYZ_BQ5NPwJ9uh6goKkizp7lHjkuA8wa4bmfUXAXLaaLTFYIDMZzdeU1cH3izTdW1x2O-RteFofUVBhcgoiXRiMV6l5qop3ZB6im3oD-tVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
    eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GQUwYdq2RTlWJSGslxdsuRDs7IoqR0ynyEJJIcULzJWHb8bQEujrRg>
    <xmx:GQUwYSp7Mt47JHzvoUjpTHjkoIF6nqzN84LIUz3hVVKj9io_ovl0eA>
    <xmx:GQUwYTTJxG0_qjYLVD_UywNh-of0cFi_4_-hO9--8emTS4ZFX85zLQ>
    <xmx:GQUwYZTTRfYEpL9vyp0nIlxAMrOfxzu5kzxFtaI1lAfrSMa_P5iT2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 18:56:24 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-gnome][PATCH] gjs: fix typo in RDEPENDS variable name
Date: Wed,  1 Sep 2021 17:56:22 -0500
Message-Id: <20210901225622.3334961-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
index 75138125f..a16455bfd 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
@@ -35,4 +35,4 @@ FILES:${PN} += "${datadir}/gjs-1.0/lsan"
 
 PACKAGES =+ "${PN}-valgrind"
 FILES:${PN}-valgrind = "${datadir}/gjs-1.0/valgrind"
-RSEPENDS_${PN}-valgrind += "valgrind"
+RDEPENDS:${PN}-valgrind += "valgrind"
-- 
2.31.1

