Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C31C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6958.1790170231357679136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DaF0YToN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A16334E4102D;
	Wed, 23 Sep 2026 13:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76AA760580;
	Wed, 23 Sep 2026 13:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C9F810328ED6;
	Wed, 23 Sep 2026 15:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790170228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qsY6yyKE8fR3NpBdcwjxVLAqrCy1PkWF0bMfd6fs8WI=;
	b=DaF0YToNjOuNPIS5sqayM19Wmjisk3BhfJZkKHbDN17W3Iu/UBlxFprXZFDj9HuC0rMjtp
	axaO08VXUcgzJeOUwcdYAzAEpd7HkdZL9rdV78STir+6U4xmpnw6BzztqpKw+mW/BzBrbk
	6kYY+fdwxUxI3YZSMMqK+kxb2mdd/xubLrHh51a10UEXPPrHE/qMR8JuZFB62qzX9C6+1x
	cUfGcDbfQt4JCIfXoknF8uKrWJMKsa1KckfH3V4MxbXp3vtBnBbnrncEMFDGE1ag74Uu9t
	r062rO780LxgXw7/C1j57cuy6c5MFn0vu/5QBgzerdDj/GNwFF3GPvGmlMhFaw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [scarthgap][meta-oe][PATCH v2 0/2] libwebsockets: update to 4.3.10
 and fix CVE-2026-19773
Date: Wed, 23 Sep 2026 15:30:23 +0200
Message-Id: <20260923-update-libwebsockets-fix-cve-2026-19773-v2-0-d20d96496e90@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw6CMBRFt0I69pl+EguO3Adh0JYHVJGStqCGs
 HdbXIHDk9zP2UhAbzGQa7ERj6sN1k0J+KkgZlBTj2DbxIRTfqEVF7DMrYoIo9Uv1MGZB8YAnX2
 DWRFyClglpQDOTFdRXcpSC5LWZo8pdTzVzY/Dou9oYp6vg1E+Dr2am/qJUYHDJrcGG6Lzn0NvZ
 bn7v8nKgIIQyaQzWrKK3rRzcbTT2bgnafZ9/wKEvLWTBgEAAA==
X-Change-ID: 20260923-update-libwebsockets-fix-cve-2026-19773-21cf90b878b3
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 13:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130236

This series updates libwebsockets to version 4.3.10 and also fixes the
CVE-2026-19773 by backporting the fix from v5 branch.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Fixed the missing [scarthgap][meta-oe] tags
- Link to v1: https://patch.msgid.link/20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com

---
Benjamin Robin (Schneider Electric) (2):
      libwebsockets: update to version 4.3.10
      libwebsockets: fix CVE-2026-19773

 .../libwebsockets/CVE-2025-11677.patch             | 161 ---------------------
 .../libwebsockets/CVE-2025-11678.patch             | 128 ----------------
 .../libwebsockets/CVE-2026-19773.patch             |  32 ++++
 ...websockets_4.3.3.bb => libwebsockets_4.3.10.bb} |   7 +-
 4 files changed, 35 insertions(+), 293 deletions(-)
---
base-commit: b5874ea07d69919d9b40d59f2c2f0bbd24bc3259
change-id: 20260923-update-libwebsockets-fix-cve-2026-19773-21cf90b878b3

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


