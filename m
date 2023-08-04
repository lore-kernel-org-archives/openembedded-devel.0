Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8545C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 16:28:37 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.1751.1691166507816076392
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 09:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=Nu/AFEv2;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=JHfTVkjx;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id AF2593200930;
	Fri,  4 Aug 2023 12:28:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 04 Aug 2023 12:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1691166506; x=1691252906; bh=iVFVMW5gQY
	Gn1wcm8vMQ8rqqOoGl+oQf95n9vBfdjHI=; b=Nu/AFEv2nnlUpTyYmg45NCD6ke
	Ou2FHdfkg/pWS5ZpmT3qaAOK8USB7t65j2WVGGtQCQCCRAXBsXmHlIZ7mySdhVH9
	3DWVONXH0LMSdv5eW4/iF/qkP85+6lYBE6P2Lexo4GuuO2IMpMuLAJhuhPLYhM1j
	gcygx/Hd7+yEMET4+YzTIg2Z2+qcNDB4bXouswuZ0ZmBtSkEuU7cSU920gCzEyiA
	LYxFyL5D+3r6nyAPViP6d8p+2QfKJtBGKuZczlhXy+JNFZ1UIS0Qe+ZJhrEspBEY
	hhbStHwu7oiWYkIUf207k/0bc2dHwwRdUEbclobcKsXiQmJ9OajEkGGYmTbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691166506; x=1691252906; bh=iVFVMW5gQYGn1
	wcm8vMQ8rqqOoGl+oQf95n9vBfdjHI=; b=JHfTVkjxUiWXpnKmmn3Af6EyZTlm7
	MYl4po3Y1+JA+qJqWihV/mbV013WuljnVpBb7n41i/AzjN8tAzHAgeck0BQufX2Q
	XoiOhK0OSj/AaGNy0MqJrbzrnT9KkDCmlyUWLiwoiu9P+Z2y7nUv9G3Po+7UGG+L
	Zr3eoeav1LUTPyD3USLjACnrorHpe1ECIQmMd8N3453Iv3OG2JXWZANjrghRK64q
	gLKxvLDr/N7QHWbDUM0k4IvYUl8b2zl7vqONYBjPciJe27O/mUiP/PU3NFnjI8Rt
	ECayHuBOuHUxYlYW0uy2SHdnYOjHg9BngAVoqzwv+bNmz3DC1i//5Ll5Q==
X-ME-Sender: <xms:KSfNZPAEbFel6iISrabmLuRI-_JOOHG0jT3Naz7J7JknBm4zBakcaQ>
    <xme:KSfNZFjWozquBSkjv5PrnQZc43uLMyll45Cv9n4ra5ucfP2oCxTDy5t_yOUR_pVEs
    qUCtP6_whqZEh0uV1o>
X-ME-Received: <xmr:KSfNZKmr1QoPvhu1jilpXCylPJBmjHWRX8XaeeV1FcG5aMF1JtTNTAA4tGHVDWnk5Up0QVSWeuv53D3EgI6CaWJ-B6lwfmXXCLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeeggdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepvedtvefgtdfhfeevjeduleehgeehhffh
    tdetteehheduieeufefhteekjeelfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KSfNZBxZ46c8iM3OQeLvt3bwtauMDzQz9i1OXntYK4ZRyNkp3Ezmug>
    <xmx:KSfNZETd72dbXfDbssz2IvUl3LTScRs4nBHaip7KO7JgzEd93hmjEg>
    <xmx:KSfNZEbqgjVtahvB7OHcj1PLXGuLRXZfbfqMryXgUsQY9YwZVbQvVg>
    <xmx:KifNZPLrCTm-ucqjTLT6HnDL1-SZY8Wc_4biabUN0YrYW02adeCGvQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Aug 2023 12:28:25 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Stanley <joel@jms.id.au>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2] kernel: don't fail if Modules.symvers doesn't exist
Date: Fri,  4 Aug 2023 11:28:21 -0500
Message-ID: <20230804162821.2333229-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 16:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104228

From: Joel Stanley <joel@jms.id.au>

Kernels that do not use modules do not have the Modules.symvers file,
which causes the previous one-liner to fail.  Invert the logic so that
the absence of the Modules.symvers is a passing situation but we still
get failure checking on the install operation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 247ef4a48a..bb5995b495 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -486,7 +486,7 @@ kernel_do_install() {
 	install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
+	! [ -e Module.symvers ] || install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
@@ -555,7 +555,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	! [ -e Module.symvers ] || cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.41.0


