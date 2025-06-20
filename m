Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138CFC7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:29:26 +0000 (UTC)
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.web11.3007.1750433362553946482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=CBKmfvkU;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433359; x=1750692559;
	bh=CQd/u4kDhfvOP3SwaMW80+nW/mOGaaPQL8tBfS3nEG0=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CBKmfvkUQfFLVyhpmGFaIgN8Hglsd/3l5X+JIKQssmBCMfxWT+UDlrElrTDRdpwT5
	 UGVC57WoSRUw1NjwtluMbPb1hV705Xc+5h9P2VbGsXWt2bNRh6VnL/0bQzdA8kODS1
	 vbZjlJNQV0o9oV2nTv5p3xS40Rh0Yxp7Bu06xEEqeJlYd1HPmQupQu3oHB7Iar6iXx
	 Y25zhExJP7LCb0nueSerD5+cgLHdteC3FpQYaRsfHtL6S5iWsgR3So2RXvJ1ZbuE/U
	 DWwkt5yJmNHlnZPhePEY83e4tUz/YLLBTPggBrUExj76i4cmkHYRS+ho02ZQYDfH7n
	 1hEuYiWay3lWg==
X-Pm-Submission-Id: 4bP1bx6Y5bzNg
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH meta-oe 0/2] syslog-ng: Add stomp and examples
 PACKAGECONFIG options
Date: Fri, 20 Jun 2025 17:29:06 +0200
Message-Id: <20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJ+VWgC/x3MQQqAIBBA0avErBtQKYmuEi2sJhsoDSeiiO6et
 HyL/x8QSkwCbfFAopOFY8jQZQHj4oIn5CkbjDK1skah3LJGj8GjHHHbcXLV0FitrW0U5GpPNPP
 1HzvY6HAYCfr3/QAdXSYMagAAAA==
X-Change-ID: 20250620-syslog-ng-stomp-da4b86116680
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433356; l=713;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Va7DsbfASPFeU8ntDzYfgNRvekvwFgfltkHMi6qLaPc=;
 b=wCg7TwjXEhrr2dbGjRA3b0xpVa16YTiS7leM13QW5q3DEFn8+/+I4/qExzINoDO+HBd2mfOTj
 guLmHiR58pHBX2WXJ/C/WKqteVLnLqYFZYVxOU/8yy/ON8woz3cZXXq
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117973

While STOMP module is optional in syslog-ng, we have been enabling it by
default without PACKAGECONFIG support to disable it since forever.

This change disables it (and example modules), requiring anyone actually
wanting it to enable it through PACKAGECONFIG.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (2):
      syslog-ng: Add stomp PACKAGECONFIG option
      syslog-ng: Add examples PACKAGECONFIG option

 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 820047afe48a0d48056f4752defc3d2803c9d906
change-id: 20250620-syslog-ng-stomp-da4b86116680

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


