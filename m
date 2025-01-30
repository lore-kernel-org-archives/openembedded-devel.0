Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE28C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 07:14:48 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.10676.1738221283978968712
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 23:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=DVG+wnlO;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=yyS4gB9gSVKaxHVfb4xfIBNt8oBWoEmsi31qkGf9fp4=; b=DVG+wnlOZM69d5/MWfFE10x3zV
	ZmIFISGkBXNolKqQP3Avi+M54YbAnJveIpA6QBlFJIIxSjYvDy+GFcbj4nXS4lRYokS9f0V0HwEqs
	CX3KkMaS1R7OU3mbk+3HFgYTAxy5hC6TfKZcJiGwgMF0Lkn1bdnp3OGxtjDpe2u7DOwspYhqJ/U6L
	RW7OSDJBWQLyg4bh87NxtyLZkJK3CdE1OSUNdEvlm/rKI/xqcqCfyLr9sMAQNucP4bKVwjw2pkKJn
	UNwpGlDAVp9YkyFs0Y63/I847Qybnnmj77XRDIIXX1I5Mt0kuibfhlqGxhRjQBVOKQaEEilqlUq4I
	eVOZYWXg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tdOl8-0008Vk-0i;
	Thu, 30 Jan 2025 08:14:42 +0100
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tdOl7-000GXx-3A;
	Thu, 30 Jan 2025 08:14:42 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH] can-utils: RRECOMMENDS only ip from iproute2
Date: Thu, 30 Jan 2025 08:14:29 +0100
Message-ID: <20250130071432.2946804-1-sean@geanix.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27533/Wed Jan 29 10:52:33 2025)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 07:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115150

There is no need for RRECOMMENDS on the full iproute2 package.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
index ca6cb7db58..51d6327b75 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
@@ -46,5 +46,5 @@ ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
 
 # busybox ip fails to configure can interfaces, so we need iproute2 to do so.
 # See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
-RRECOMMENDS:${PN} += "iproute2"
+RRECOMMENDS:${PN} += "iproute2-ip"
 
-- 
2.47.1


