Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAC5C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 06:51:03 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13896.1784875861829431732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 23:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=KqbqBU65;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=qnjcLDXPwyddWWyn0731duSq/aGWm4sauS7ADBCHzeY=; b=KqbqBU65TI9N8HIvselwZPxkS6
	2B/7q72Pbo422yepkxGH7pfS+EGcrNnl3rWCLEj5lr1HzUuI6O9WCEdvC+OHMXpmLrCWttT8VRQQQ
	w8/fSRoINDBh4FGUvGRUjqfXDCsQjpoTavLhYasTpDVlmkYMRFNqM6B96NFI9xQPyaAl/3klPLPJJ
	5nIoCCMMd7VBVFzpEgKAz+yGeYPg0QA5+UXxiLFuH3V0QKZSY/sIyXFefOMgE6TyMOqAaIcbsJvLV
	3mSj5x9DzrXVvjyMi46+nhU4fvHuYaS59eReW7OPwEMUheoBk6SEXSuNxJshilpdu3rjBcVKy8HyV
	2yA+rmig==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wn9kJ-0000mN-0J;
	Fri, 24 Jul 2026 08:50:59 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wn9kI-000LVs-1x;
	Fri, 24 Jul 2026 08:50:58 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe] libiio: Move sysvinit script to libiio-iiod package
Date: Fri, 24 Jul 2026 08:50:51 +0200
Message-ID: <20260724065053.773519-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 06:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128437

There is no use in the init script outside of iiod package. Package it
accordingly.

Fixes: 9b5fc1605be1 ("libiio: Add sysvinit support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 meta-oe/recipes-support/libiio/libiio_0.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/recipes-support/libiio/libiio_0.26.bb
index 99c153149c..2acfa138f5 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
@@ -52,6 +52,7 @@ RDEPENDS:${PN}:remove = "python3-core"
 RDEPENDS:${PN}-python3 = "${PN} python3-core python3-ctypes python3-stringold"
 
 FILES:${PN}-iiod = " \
+    ${sysconfdir}/init.d/iiod \
     ${sbindir}/iiod \
     ${systemd_system_unitdir}/iiod.service \
 "
-- 
2.54.0


