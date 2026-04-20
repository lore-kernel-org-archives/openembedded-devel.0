Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7696AF55817
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:21:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17209.1776683850151639876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kHUQdtX+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F1AB4E42A7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:17:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5738D5FFA5;
	Mon, 20 Apr 2026 11:17:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F2F51046156D;
	Mon, 20 Apr 2026 13:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776683847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GJfQkuPQcYIEzOf/BNUEvTEbeJSAyf91iPWwnlOE1c0=;
	b=kHUQdtX+1ODo80ogFvyRbzTvzsP5ZdsKy5e4TgtVHbJyvHe39bXeN2JRJKrud4HNJbKU6S
	piTccdhQoLnJGR4RJn6f8R6ln9vcHkOdch/cu9ijJjDmpDdCaVqYCO/PsqDa6XhYKc5nVv
	49+ZB8r7vOw2yfWAQfELzfTBhqWHPX8Y3/cxi0E/ZurJ+BgsEanPBiNREI/SgFoRW2p07K
	XG3kaddnj6EVecBx9saJQFwnAutry8Fgn9uwTnR57tBFp6jXPdTwhlt9ZIjUdr0+FYg/D8
	tf9icQA6fbVelDFDTvBFIVmom2Taa1fgdIPKmnRDiu97rPd48d+0Pki56Shmkg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH 1/4] kernel-selftest: rename vm selftests to mm
Date: Mon, 20 Apr 2026 13:17:09 +0200
Message-ID: <20260420111712.26945-2-joaomarcos.costa@bootlin.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126496

Since v6.10 [1], this category of selftests was renamed
to 'mm'.

Update the recipe accordingly.

I left a mention to the previous name (i.e., 'vm') just in case.

[1]: https://github.com/torvalds/linux/commit/baa489fabd01596d5426d6e112b=
34ba5fb59ab82

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../kernel-selftest/kernel-selftest.bb           | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/=
meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 430b5974b3..d90720de06 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -17,7 +17,7 @@ SRC_URI +=3D "file://run-ptest \
             file://0001-selftests-timers-Fix-clock_adjtime-for-newer-32-=
bit-.patch \
             "
=20
-# now we just test bpf and vm
+# now we just test bpf and mm (formerly known as vm)
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5=
aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGEC=
ONFIG
@@ -25,20 +25,20 @@ PACKAGECONFIG ??=3D "firmware"
 # bpf needs working clang compiler anyway
 PACKAGECONFIG:append:toolchain-clang:x86-64 =3D " bpf"
 PACKAGECONFIG:remove:x86 =3D "bpf"
-PACKAGECONFIG:remove:arm =3D "bpf vm"
+PACKAGECONFIG:remove:arm =3D "bpf mm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is neede=
d
 # progs/loop1.c:21:9: error: incomplete definition of type 'struct user_=
pt_regs'
 # m =3D PT_REGS_RC(ctx);
-# vm tests need libhugetlbfs starting 5.8+ (https://lkml.org/lkml/2020/4=
/22/1654)
-PACKAGECONFIG:remove:qemumips =3D "bpf vm"
+# mm tests  need libhugetlbfs starting 5.8+ (https://lkml.org/lkml/2020/=
4/22/1654)
+PACKAGECONFIG:remove:qemumips =3D "bpf mm"
=20
 # riscv does not support libhugetlbfs yet
-PACKAGECONFIG:remove:riscv64 =3D "bpf vm"
-PACKAGECONFIG:remove:riscv32 =3D "bpf vm"
+PACKAGECONFIG:remove:riscv64 =3D "bpf mm"
+PACKAGECONFIG:remove:riscv32 =3D "bpf mm"
=20
 PACKAGECONFIG[bpf] =3D ",,elfutils elfutils-native libcap libcap-ng rsyn=
c-native python3-docutils-native,"
 PACKAGECONFIG[firmware] =3D ",,libcap, bash"
-PACKAGECONFIG[vm] =3D ",,libcap libhugetlbfs,libgcc bash"
+PACKAGECONFIG[mm] =3D ",,libcap libhugetlbfs,libgcc bash"
=20
 do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
 do_compile[depends] +=3D "virtual/kernel:do_install"
@@ -48,7 +48,7 @@ inherit linux-kernel-base module-base kernel-arch ptest=
 siteinfo
 DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
=20
 TEST_LIST =3D "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
+    ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware mm', d)} \
     cpufreq \
     cpu-hotplug \
     rtc \
--=20
2.43.0


