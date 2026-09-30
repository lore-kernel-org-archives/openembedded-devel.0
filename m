Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F429CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:13:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15855.1790781171245586183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 08:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=VV71p+zo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CCF81A107A
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 15:12:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E81E560749
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 15:12:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 317B71032839E;
	Wed, 30 Sep 2026 17:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790781164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KXKevaglmT58bLQxhdZp/BJQ80BdYVTNC6XTWdzyG30=;
	b=VV71p+zo129KDjkDJmYqrhTyKroFr0Cq/MU/ZhUYHgFTM7vkenySV4PEp7ri6oa8j+zJ3g
	nyo3NXSj6WZS7iFx6MC/uV75fK+bPSMD+bJ6jlYzcDLPZ4nu7LMHkBtbRHsZrReWJMoor3
	4Enr8JyqQxNg4I37cz7FkHjL2FWCqxojMxuwikmislCREE7FZxjTlE60kbTUT2rhEqEg1l
	RQMvkp5PsrSwt2EI1ANZQ3DM/pMZJDLAGfbDZ2EE8emLEjYaPyEgAtcUnYvn3/DVsCXUK1
	d+FkNxOioEHms/ookdmGDO7lChR+sXSVz/ASOSg//RKXVyiboQ8q3ScSKEi58w==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2] ntp: add CVE-2016-1548 to CVE_STATUS_NTP
Date: Wed, 30 Sep 2026 17:12:38 +0200
Message-ID: <20260930151238.1968167-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 15:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130531

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This vulnerability actually affects 4.2.8p4 and earlier [1], and
meta-networking provides as of now 4.2.8p17.

Add it to CVE_STATUS_NTP so this CVE is no longer reported.

[1] https://security-tracker.debian.org/tracker/CVE-2016-1548

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p17.bb
index 4ed58cd6a4..ba6e770618 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -43,6 +43,7 @@ CVE_STATUS_NTP =3D " \
     CVE-2015-8140 \
     CVE-2015-8158 \
     CVE-2016-1547 \
+    CVE-2016-1548 \
     CVE-2016-2516 \
     CVE-2016-2517 \
     CVE-2016-2519 \
--=20
2.55.0


