Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D150C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:29:36 +0000 (UTC)
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.web10.3025.1750433366420685070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=hkwfCxGM;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433364; x=1750692564;
	bh=ZD6gwGfSSiNLSL1a5YPNljnq3Pb12exRwzgJydO+GcM=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hkwfCxGMyYtys90bzLtT79vGey4Kqypj+jBXOMfTJneWN7E0jy34SGvGuU/aNhnzO
	 vp+RoU1v/h8fxoLY+7PyI/mnP4b5TyzMkOztx/874p8/NO3K/JPBR5X2FcGxJy5cgm
	 /4pbZKp70d6jCmA8Zv5PtzECr7WYGUadEF8diPPigN7kZGqXl8mWZ2wVNw4paosB3G
	 xTtG/o7R0z89L957w6sK1jV63Nd4UqDzGkLcq6xDndhmEZl2SNMEM//w94OaQ6Y4HY
	 ZvSnHzfzdSIR2PFceTkrvS0zmp4nIL5ec5AqtV3DI46OJR5uO6X1ysiBGo7UGRWlnK
	 IHbB0Lm5kW/4g==
X-Pm-Submission-Id: 4bP1c31HQdz1DDWf
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Jun 2025 17:29:08 +0200
Subject: [PATCH meta-oe 2/2] syslog-ng: Add examples PACKAGECONFIG option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-syslog-ng-stomp-v1-2-4406b09e1e20@geanix.com>
References: <20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com>
In-Reply-To: <20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433356; l=1139;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=yW1iTGUARREntvD6eUW6jQdo29YSHf4NSG60HafkVSc=;
 b=xanxz0fRTRzB9qSQKAssE1Wap0pc3AJdXjXsNRchYSjwdmQSZofZ469MCmqIV70f0DolmV6U+
 VWaeK2n+Mf+B0yUGhGWIdzdifY4QcK2vB53GXkTUHAiYFeM/Gais3c1
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117975

There is not much point in building example modules for most people. But
let's disable them with a PACKAGECONFIG option, so anybody actually
interested can easily get them back.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index d2af451dea64048fe44b6d80d87c1ae848e080fb..9968b1d7a58c174c2b327e2f49de452fabe63693 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -64,6 +64,7 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
+PACKAGECONFIG[examples] = "--enable-example-modules,--disable-example-modules,,"
 
 do_install:append() {
     install -d ${D}${sysconfdir}/${BPN}

-- 
2.50.0


