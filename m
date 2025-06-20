Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E153C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:29:26 +0000 (UTC)
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
 by mx.groups.io with SMTP id smtpd.web11.3009.1750433364348772923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=QXi3TUMv;
 spf=pass (domain: geanix.com, ip: 185.70.43.171, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433362; x=1750692562;
	bh=HIghIflVcoZLIlLeOhGeGA76cL86Bsrt0XVAV7qoVe8=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QXi3TUMvK+K+NeV2j/RK0aVsdNVAwxT5/EmxmMpwmOpbOb70KJU9yHnqWIk4CnOBC
	 SJkCMTxn6ZL/WY1Gg7W+LHezrfdNynwTI7KwUXcyRyX5zWHc20oC48QXGpG95Cjbd4
	 ev51UKmQqoxhRKFoCF2+L5ZK8LLaj3UwPtAjgQdJ9u4jGzh8L6CfNxjeVECOvlbtZk
	 wyXkIXz8EeBCcp62z3GIFw0EqPoEmT93eEkot+bB9p/L8etjfM1tKU8n5QJ1+4XwRT
	 KVDlo+knKjgeTffVUozRhP1rmJZhndSS7v59AeRFPWy3WqJHopmBkLdLNj5ErFGaae
	 wpPC7z/2Ec98g==
X-Pm-Submission-Id: 4bP1c02Sxjz1DDWj
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Jun 2025 17:29:07 +0200
Subject: [PATCH meta-oe 1/2] syslog-ng: Add stomp PACKAGECONFIG option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-syslog-ng-stomp-v1-1-4406b09e1e20@geanix.com>
References: <20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com>
In-Reply-To: <20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433356; l=1227;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Sv7eCO6AF4sbOjbeQoGmLMu/vM2WTRF3DZa0DjY0Bjc=;
 b=PUtkudqmAMOwvNIbOSVQT80IiCC46Pcar1ngckMfb+F3vTvMjmJWLCrmqCcVwEZ/4hyLU3c8i
 gmzuqnm8O6sBEiezoR5sHrgWQGxsLiovpyX6WF//wXuXgJ0bm2V7HJ2
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117974

The STOMP protocol is optional, and should not need to be enabled by
default.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index ebeab51961b2370653e32fc0601740c1a25492a8..d2af451dea64048fe44b6d80d87c1ae848e080fb 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
 PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
 PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
+PACKAGECONFIG[smtp] = "--enable-stomp,--disable-stomp,,"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"

-- 
2.50.0


