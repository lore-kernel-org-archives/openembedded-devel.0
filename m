Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F2AC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:54:23 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.10682.1646153663003125499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=TwISBfD3;
 spf=pass (domain: cold-front.org, ip: 64.147.123.19,
 mailfrom: jsbronder@cold-front.org)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id EDF8E3201FCD;
	Tue,  1 Mar 2022 11:54:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 01 Mar 2022 11:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=MX3H7CA8GcQJX7fpeW9gSNpkkKifqXvnuaL
	ZaXNColI=; b=TwISBfD38twy+nTfL+jpT657hFIKnVKrLROfu4FfLUusQf9RXuf
	OlhqSBGSXmqFfR4rKb2Ph9HK7B1TPlxCPAnLTX1o4JCmMljh2+I3821hKylB5fLm
	Gjkrkl6vAeXyMihsOr+CPpswaOOHKVRS0dM7A+CCxS7V3hqierTrkcnQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=MX3H7CA8GcQJX7fpeW9gSNpkkKifq
	XvnuaLZaXNColI=; b=bj8It97Q6oVzKvAQIlgp0YIna6XrHeHLETQbksOZCnYPF
	QCIl86QVi/wMjfgSPNxF/LbaB9HQZ3FIp5SFKcR073h5kYbXXaOzvk5VcacxUHGD
	aIbJJnFTSFwQuGk0KEoAJfda+efoClD6laV9xrgMsM6yZn/vOl4gfD0XD3WFFVmK
	SqbHXn+madm+fppaNYNTrspY6Q8aAQqZpdBzWUXXClmey3Uvtpa1YdZMYpg7wrq9
	TqIlhAuMAW0pDLuKZHhMyOGZ33jNeabP7Uk+fQ6excI9cj6sEiiGMs9vOZ9S4qH7
	CSvgO+0N9Pv2EdSVJvrbB5LGkMfL2qufC5ai314JA==
X-ME-Sender: <xms:vU8eYrdSzPFDwAjQDj5m0saEum6l07nJvOKzPQCcRNf5AfJZh5HmFw>
    <xme:vU8eYhO--cBSsiNsbqsaxrLLF-7Ft4DRFDiS2gVXWit9-iYqVpVRyi5aUefenDjAq
    fRzQqcXXJi07vLi-w>
X-ME-Received: 
 <xmr:vU8eYkhY_zX_egKtkkSIvxiADwmwScisblAPynrvSD1VK1BNj-E-DCa3Fn42RGz-QV5lc80QeW0guxnsLZ7khsEyWNSCMmbK2__8CsDAHW3g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:vU8eYs-yTH7OWgKJzSnQ7OU2pGpnOyAMAmmWE-Y64BTBedWpAVKczQ>
    <xmx:vU8eYnvgZUQi8yuFzfomFFQC48D961KxzWRGw_aBNxjINSJ1LqeXbw>
    <xmx:vU8eYrGyWcODae7ehp6ZioOEX3FaHX17ae5OAz2tIwAgCFVmmj8eew>
    <xmx:vU8eYl02dDDcovvWn9bfTM70kZYDxCHqiCd0FPuDw82c5TB9PNbcXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 11:54:21 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-gcovr: fix wheel build
Date: Tue,  1 Mar 2022 11:54:18 -0500
Message-Id: <20220301165418.11653-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 16:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95640

Recipe does not inherit pypi nor would PN be a good guess at the name of
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-gcovr_5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
index 330831a0b3..27ae198139 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
@@ -10,6 +10,7 @@ SRCREV = "2b50284e8a6792b4ddcba14e2050c5c05f15deb6"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "gcovr"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments"
 
-- 
2.35.1


