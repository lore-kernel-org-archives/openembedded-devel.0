Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149C5C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:34:56 +0000 (UTC)
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
 by mx.groups.io with SMTP id smtpd.web11.3123.1750433687649690452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=TMYDLodf;
 spf=pass (domain: geanix.com, ip: 109.224.244.107, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433684; x=1750692884;
	bh=6e5n9GxJTi5VzsiFZgVxt+J3gDL5k2nLrmLjSfP9nPY=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TMYDLodfGQuRhVJr2VE/yddVDJpUEYzznBNk7n2Tlc9HXXDxmdLXsamc3F08s9Yoj
	 f5lAUGV9JYhiAG3Rm/QLi84a5c7742RKGWp/bUARq84ljw7SWShGWcjgEknxTpO8uC
	 fMDloTPBYSmLRJufX4SmUc7ezFeSaiNiSlnQ9+I4FjSxiDTD2PhIFAXAR+6VSXqpeR
	 dSVP/RNI2tr4Py+SenFsVjSJaqqaajUqm7SPg5qikpFXMxBhWTBll2z5CMyw/kO243
	 MZn1JhQU45XGFNfBy+OpNh3r2fqWIgH8zm55oIjUTIxEI7xFEoWBSibtYwMc6+ZbuX
	 Xs7ptSdJcoDFA==
X-Pm-Submission-Id: 4bP1k811HxzB4b
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Jun 2025 17:34:30 +0200
Subject: [PATCH meta-oe v2 2/2] syslog-ng: Add examples PACKAGECONFIG
 option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-syslog-ng-stomp-v2-2-3c9a2da1dcd0@geanix.com>
References: <20250620-syslog-ng-stomp-v2-0-3c9a2da1dcd0@geanix.com>
In-Reply-To: <20250620-syslog-ng-stomp-v2-0-3c9a2da1dcd0@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433674; l=1139;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=5i/r3wv8kWWJpUnAS/sokWjmaWaEZ90n4M/bB9u5Dso=;
 b=dh+4NvkBqK8po1yVj5ZubIepH4bJP/oBx0EdxC9C6ZPJXwQyJu2wgWP9+O+sM6yRaRnJqSYVn
 NDyysLiXd5nChmN3UAwsF0/NsHgl1bSGWfepJKeOAKe9rsMD/xkS1ak
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117978

There is not much point in building example modules for most people. But
let's disable them with a PACKAGECONFIG option, so anybody actually
interested can easily get them back.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index b79118a93d384886f44685949ce8599a0f285fc9..1b46d66d6cbda1b97eb1cbea33c7bd274fc59b05 100644
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


