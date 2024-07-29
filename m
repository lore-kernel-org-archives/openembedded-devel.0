Return-Path: <csokas.bence@prolan.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D750C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 11:54:36 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web11.54476.1722254074274129060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 04:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prolan.hu header.s=mail header.b=Ze1xozKT;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E6E43A09FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 13:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=VeEWNu7+QtfiyhsvpgNS0AvIeg3WKwLwKvM6Bz0CeSk=; b=
	Ze1xozKTqGkWMojdde6bzQh4X9yAiU7JeZ5hdFVp0niaPZRCpqQ8ZekkXkV+M19y
	4wYpp4mKmqdOSq3jZBDDXaCY6RAu5PBwYWSBiE3olfSsODCM11GV2jxoGR2h6QZz
	89He9JgSghKIE62Rd1cUcgDQhPRGwtI0jV0CtUSYrgkWhpbhGxOI9ECGuo5Ngkpf
	PQuCgcIB/b3hmnjVHfSBtm5sTD35nmk+CumeE38OzY/UvmsgXTTTpFdH/uI/kkfM
	CwSJcjXzdEk74+P2+9xB0te3GgrM4jD51Z7pByUSG1WkmG7m6D/hA5f8XKaBIaky
	WDPkaXdkxVKJlucnRXD2VKc6XGuvmMO5XGu3T3a9fmRwOpHQ1nY22dmMVwVbpjlJ
	TkplvY20/kgXcr2UGKv8JA+mbf2Vb2cYoYGBv34cKwiizN9twk47srtvQLIL0H55
	JVaCdgQ1982nguDkxapBM8HFTgZq5Hq/4nQUsixudqCy2YX2/kzChzVEoqsC4C8H
	IyV2PcLQc7JyeRcvPEwiL3dIaQSrPAvToqqHC4RXaxK3dpKgqm0Ari+Aj50O3W+w
	hdoPaYtzdxwHUMxG77ckkIxwc/nCgwmOSrQupvkVqqApHiGnJmv/acfBjljcjW3M
	pmhjvVZPYYfDqI1Abj1PHEvXhEJ/47oR16kMuvdQhC0=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <openembedded-devel@lists.openembedded.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [meta-oe][kirkstone][PATCH 0/2] Fix PHP-FPM
Date: Mon, 29 Jul 2024 13:51:20 +0200
Message-ID: <20240729115120.1375412-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1722254070;VERSION=7975;MC=1811511808;ID=216796;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854667467
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111454

PHP-FPM is broken in kirkstone when using systemd.
The following two commits had to be cherry-picked:

Upstream-Commit: e0035d6e51b2
Upstream-Commit: 4cefe0196f7a
Related: #822 [on GitHub]

Emil Kronborg (1):
  php-fpm: fix systemd

Wang Mingyu (1):
  php: Fix install conflict when enable multilib.

 .../recipes-devtools/php/php/php-fpm.service  | 57 +++++++++++++++++--
 meta-oe/recipes-devtools/php/php_8.1.29.bb    | 25 +++++---
 2 files changed, 70 insertions(+), 12 deletions(-)

--=20
2.34.1



