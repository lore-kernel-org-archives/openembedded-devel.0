Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3061CC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:34:46 +0000 (UTC)
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
 by mx.groups.io with SMTP id smtpd.web10.3141.1750433681182770594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=cwehtWe5;
 spf=pass (domain: geanix.com, ip: 109.224.244.107, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433679; x=1750692879;
	bh=nPdla4P+o+eZbyqg+8TZQ0uJx8J0J7uLdFj37kUyMcA=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cwehtWe5IAhy8vhDKvCwE/2vAfM9DNCN4+h+r5v3iqMxK7PYEP/BXkiuuJ7YOl4eE
	 PV8sefE7JkKSo1LMospgTuWDsgPzThgGOdoQO14HgZAmJ9OSwfIqXFy43EFOHMzJG7
	 WbCR89rCVF4lWZA5hxrA9GCO0pbIzlePVMxSvIuTdqins+TBXhiD3fBt8bhWjy+opw
	 1IW24rkuig0u5ppMlj2K1XjjX6Cm0GgPePPsFnJb+/1PgdPW6wrvKL9w+zbU8rXe0X
	 rFkNgK2DvoI2Qu0bdupvDzQCLHzSwLJrb58AALpNkDtFRpSXMkqAoUtxHjkRYc9lYT
	 tpgtqykI8NgNQ==
X-Pm-Submission-Id: 4bP1k566zcz1DDWf
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Jun 2025 17:34:29 +0200
Subject: [PATCH meta-oe v2 1/2] syslog-ng: Add stomp PACKAGECONFIG option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-syslog-ng-stomp-v2-1-3c9a2da1dcd0@geanix.com>
References: <20250620-syslog-ng-stomp-v2-0-3c9a2da1dcd0@geanix.com>
In-Reply-To: <20250620-syslog-ng-stomp-v2-0-3c9a2da1dcd0@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433674; l=1228;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=NQHSAQF6CF2MBjZ+LbPrvc+0j/TzMWZG9r9cLU61aWM=;
 b=k5dHUrGxyRMiTEIa6ZBC+gbSlaJDsPAdtUGciUQk9We43usPBVr1olflkHiLuOkOFNEJHmiPH
 d/qib5v3C0/BjxlBjeBhi7Y4Iy2LNWGtx8FOD5dZYD8F/hZMBYNXlb+
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117977

The STOMP protocol is optional, and should not need to be enabled by
default.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index ebeab51961b2370653e32fc0601740c1a25492a8..b79118a93d384886f44685949ce8599a0f285fc9 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
 PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
 PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
+PACKAGECONFIG[stomp] = "--enable-stomp,--disable-stomp,,"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"

-- 
2.50.0


