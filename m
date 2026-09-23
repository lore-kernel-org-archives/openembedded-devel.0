Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E43CC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 12:53:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6218.1790167984390002513
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 05:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WuCPkZvA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AF921A0FDE;
	Wed, 23 Sep 2026 12:53:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC1DF60580;
	Wed, 23 Sep 2026 12:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 925A71032885A;
	Wed, 23 Sep 2026 14:53:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790167981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jtZnLObY5LIf3Y0mBs637Ky2A8e3mGbggZywGmXU5gc=;
	b=WuCPkZvAn5k+hBvL6M4wBgUfumsorXDsp43Dtqzo1K84ud2hrlgDrSbu0qceQL04GbhayS
	A0ZWHlNL9BrRnKStnqxiD2ZYRPd+1fOunmdY7fpklIR8pvpVHXFQk2jhkHZ3Rx0A+5YsXI
	VltXXnOJIx3Dw4V9Jxc7HQ5wADz32WFUjTh1X/q9U+so6QJLuxcjyzHe/8cfyxwKd9nhDH
	pfl+XgCrTlvRMA/RCnigDfFcS3btsg1abxx5yAq//hvECtD/3i2EmDu5FWhbo3xbhuIFrP
	YEQtKkpCDrRO3IEksn+3h2mFs2y91RBm73kI17hU1byIDgGffHIIBDO/wpGMtw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/2] libwebsockets: update to 4.3.10 and fix CVE-2026-19773
Date: Wed, 23 Sep 2026 14:52:39 +0200
Message-Id: <20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBAAf0X23IU8oDH9ldKDiWu7bVHJRi2I/
 260x4FhZgWhxCRwq1ZINLPw0BfQlwriq+mfhNwWBqPMVXljcRrbJhN+OSwUZIgfyoId/zDOhIe
 F2jtn0ejYeRVqVwcLpTYmKtZ5uj/+LFN4U8xHHrZtBz+9KFWLAAAA
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 12:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130231

This series updates libwebsockets to version 4.3.10 and also fixes the
CVE-2026-19773 by backporting the fix from v5 branch.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
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


