Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F496CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 17:30:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13100.1782322046052074378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 10:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xYgaeRHg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 92AF64E407D5
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 17:27:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 556FE601C5;
	Wed, 24 Jun 2026 17:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45732106C8193;
	Wed, 24 Jun 2026 19:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782322042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=IQCp+pRvJmkflrddFTnxhJ3QtkMuwwYl7SoVd9JrWDk=;
	b=xYgaeRHg+Ta7b8SNFkC4JrTDjT3smxNXCwySJOxwlVodz+Vj4SGaS3tIx0C1QpJ3rD2zcL
	uM9ykSaJNKPl+uUapvMmFFvafGxX/NM3uMsBjHsa6Ub+rdSdX5mXNcn/HFn4/xR8EnD98C
	as0dgargFWc3Lp/BxEcNQ9a5GbzlTAHzLDpo/YfKa6gwzi0HC8PjB2ZvNCx5AC3fcm20Pi
	DgzK2WTt3kCrAqXKgsIr29aMExBwnR6G/PFv95iEe0TJUSuZqL2Zl+rJniEk2n6U5Xi02Z
	Y8d2lQuPfj2jLQmHZzJCxgpyjlRDPxx5cLQAImUi8vw9i1Q3O5VNY8gp51XVIw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/1] bpftrace: fix buildpaths QA issue in bpftrace-dbg and bpftrace-ptest
Date: Wed, 24 Jun 2026 19:27:07 +0200
Message-ID: <20260624172708.240536-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 17:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127724

Hello,

I marked the patch as 'Inappropriate', but please let me know if that's w=
orth
upstreaming.

Best regards,

Jo=C3=A3o Marcos Costa (1):
  bpftrace: fix buildpaths QA issue in bpftrace-dbg and bpftrace-ptest

 ...BPF.cmake-introduce-DEBUG_PREFIX_MAP.patch | 36 +++++++++++++++++++
 .../bpftrace/bpftrace_0.25.1.bb               |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/b=
pftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.pat=
ch

--=20
2.47.0


