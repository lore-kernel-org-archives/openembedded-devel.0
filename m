Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A85F5581A
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:21:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17210.1776683851818973898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mgU9iob9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31DC04E42A7C;
	Mon, 20 Apr 2026 11:17:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09F7F5FFA5;
	Mon, 20 Apr 2026 11:17:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E0AB10461577;
	Mon, 20 Apr 2026 13:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776683849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ud1qek31gN+lGtun4rZgDQu86yB1WrntzOqIuBf537c=;
	b=mgU9iob9uluivcAcbrmoZaJholacxEt4JoXh+k/em1VEqYqH9SeMOdgRa8gAdFYjKzQLWn
	+iFCE/gnwO9erfydg6T1CJzdsAvKYNY8aci02bvK3BEApKjYCWQLoY28e5ppJ2vO092uD7
	8eqF2jjEIc3ySvKjdMFi5BlVKjvJpzgtI4TGn+u+CkPonL49NoSagUyPoTtH9f35/LjduS
	JYsmZcRfU953spEVRwUlvGSMrnIPx7MnwA/jhPSindqVaRM7bT8+3iVqEAfMaJlxPksXxZ
	ea15SeI8SoM8rUzH8I1FLJUS2uwg6P/fz/Yq1JNASt7Lb182YM4+g/InqLk3lA==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH 2/4] kernel-selftest: drop libhugetlbfs
Date: Mon, 20 Apr 2026 13:17:10 +0200
Message-ID: <20260420111712.26945-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
References: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126497

The support of libhugetlbfs was removed from mainline Linux a while ago,
since v6.1 [1].

Since libhugetlbfs was the main reason to remove 'mm' selftests for some
specific architectures, the respective operations should only remove bpf.

Update the recipe to remove libhugetlbfs as a dependency of mm, and thus
unblock this test category for some targets.

[1] https://github.com/torvalds/linux/commit/6f83d6c74ea5a5b267be85206822=
da280cae110a

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/=
meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index d90720de06..08b0c60c6c 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -29,16 +29,13 @@ PACKAGECONFIG:remove:arm =3D "bpf mm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is neede=
d
 # progs/loop1.c:21:9: error: incomplete definition of type 'struct user_=
pt_regs'
 # m =3D PT_REGS_RC(ctx);
-# mm tests  need libhugetlbfs starting 5.8+ (https://lkml.org/lkml/2020/=
4/22/1654)
-PACKAGECONFIG:remove:qemumips =3D "bpf mm"
-
-# riscv does not support libhugetlbfs yet
-PACKAGECONFIG:remove:riscv64 =3D "bpf mm"
-PACKAGECONFIG:remove:riscv32 =3D "bpf mm"
+PACKAGECONFIG:remove:qemumips =3D "bpf"
+PACKAGECONFIG:remove:riscv64 =3D "bpf"
+PACKAGECONFIG:remove:riscv32 =3D "bpf"
=20
 PACKAGECONFIG[bpf] =3D ",,elfutils elfutils-native libcap libcap-ng rsyn=
c-native python3-docutils-native,"
 PACKAGECONFIG[firmware] =3D ",,libcap, bash"
-PACKAGECONFIG[mm] =3D ",,libcap libhugetlbfs,libgcc bash"
+PACKAGECONFIG[mm] =3D ",,libcap, libgcc bash"
=20
 do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
 do_compile[depends] +=3D "virtual/kernel:do_install"
--=20
2.43.0


