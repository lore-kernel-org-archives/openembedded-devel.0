Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA2F531FF
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:13:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14569.1776243920746623792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xFo29DlR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B0631A32DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 09:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 460DB60420;
	Wed, 15 Apr 2026 09:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D6FD1045055E;
	Wed, 15 Apr 2026 11:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776243916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MpTRu5R0fBhCtKfjc6sCkVht6KkOuGjiHZO8/XeXFx4=;
	b=xFo29DlRSxDfY2J/o1VkqvlQsnHLKmFNkTqUXuKJkKNee8UUphtKfBQ4dyJOtMwwUTqAyF
	bz4JKXsDZ8UldX/dDWc0XmZdsGGN48SG+eqDsikZXcMaILuNgOo0/biQtneZktwlbb3TwW
	3SRMDiadFu2qAuEszU3I+JlK/PhStMyBVHoFVtaYxSy/mhtRSwO8IaipkRGpmXsi1q8rfn
	JeX0pzYMqvkzDuN9Q8NasQ0T2BvqD1bhSAmMUXxx/hScqZnc7+y7sF/gvZLXY50TpWJCRD
	Swe8yJjVquImf+369Q1Byg27YRoxXThtp4Wa+XGIkfYaAdC3bKSg5UyqXioDyg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	thomas.perrot@bootlin.com,
	nylon.chen@sifive.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH] libhugetlbfs: add RISC-V to COMPATIBLE_HOSTS
Date: Wed, 15 Apr 2026 11:05:07 +0200
Message-ID: <20260415090507.819848-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126352

A preliminar effort to support RISC-V was added in v2.23:

a529598 Introduce basic riscv64 support [1]

Following the guidelines in libhugetlbfs's HOWTO, here are the outputs
of some commands in qemuriscv64:

root@qemuriscv64:~# grep -i huge /proc/filesystems
nodev	hugetlbfs
root@qemuriscv64:~# hugeadm --pool-list
      Size  Minimum  Current  Maximum  Default
     65536        0        0        0
   2097152        0        0        0        *
root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:10 --add-temp-swap
root@qemuriscv64:~# hugeadm --pool-list
      Size  Minimum  Current  Maximum  Default
     65536        0        0        0
   2097152       10       10       10        *
root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:-5
root@qemuriscv64:~# hugeadm --pool-list
      Size  Minimum  Current  Maximum  Default
     65536        0        0        0
   2097152        5        5       10        *

Regarding toolchains, libhugetlbfs for RISC-V builds fine with both
clang and gcc.

[1]: https://github.com/libhugetlbfs/libhugetlbfs/commit/a529598dd256c797=
99d5e43e6d79146ca15f1c16

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 89ce11f6e4..dd2fbbc7cd 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -31,7 +31,7 @@ SRC_URI =3D " \
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
=20
-COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
+COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|riscv64|aarch64|arm)=
.*-linux*"
=20
 LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
 LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
--=20
2.47.0


