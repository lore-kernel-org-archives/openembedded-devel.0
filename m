Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A581F55818
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:21:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16830.1776683845067221918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vVxc3xZH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1305E4E42A7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF5105FFA5;
	Mon, 20 Apr 2026 11:17:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7EC610461556;
	Mon, 20 Apr 2026 13:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776683842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UOfhVJS4TcleHSR21SCsbA6VDqrn3JmB9Xkcj66ZPbw=;
	b=vVxc3xZHIuHZqnaioh1JnQA7DItVVU1SfcdwVv+sEfrn/YsVwjnhAHKVMXb7BeOHcrpPAZ
	QIRTJRuKUezKhCwcbR0Hejtps60lKN0U9VadkgQ8taDt4/zlJJiIE4D3sdNsU9Kc9L6i7x
	rZZbREGa8YIq7rIICtYY6BDyD8UFHsj48Pj0GXWhQbjez8u6RM/G6OrWW3Y99CnWP+i44V
	6fZdmkI1BBYCMNvptYnrv6vMB64Z8Y/b/LsT13ZRe+jetUw2CSA6I2UldHWNBHYQqqkQ+8
	dGEr/tCwklP2QAjntS094R/Lri8RqEXSWVztYvKOKt3u9TpUuwbJA3bhaHU6jw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH 0/4] kernel-selftest: update mm (formerly vm) test category
Date: Mon, 20 Apr 2026 13:17:08 +0200
Message-ID: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126495

Hello,

After a recent change in libhugetlbfs recipe, my attention was drawn (in
the mailing list) to the impact this could have in recipes suchs as
memcached and kernel-selftest.

This patch series includes my latest changes regarding kernel-selftest,
and the memcached recipe will be handled in a follow-up series.

I tested this with both clang and gcc, in qemuriscv64. As you can see in
the traces below, 'mm' collection of tests is available and can be
executed:

root@qemuriscv64:~# /usr/kernel-selftest/run_kselftest.sh --list
firmware:fw_run_tests.sh
mm:run_vmtests.sh
cpufreq:main.sh
cpu-hotplug:cpu-on-off-test.sh
rtc:rtctest
ptp:testptp
ptp:phc.sh
timers:posix_timers
timers:nanosleep
timers:nsleep-lat
timers:set-timer-lat
timers:mqueue-lat
timers:inconsistency-check
timers:raw_skew
timers:threadtest
timers:rtcpie

root@qemuriscv64:~# /usr/kernel-selftest/run_kselftest.sh -c mm
(...)
# ok 60 test_page_frag.sh aligned # SKIP
# # -unnin--./test_---e_f---.s--non-li-ned
# # running ./test_page_frag.sh nonaligned
# # -unnin--./test_---e_f---.s--non-li-ned
# # ./test_page_frag.sh: You need to compile page_frag_test module
# # [SKIP]
# ok 61 test_page_frag.sh nonaligned # SKIP
# # SUMMARY: PASS=3D25 SKIP=3D20 FAIL=3D16
# 1..61
ok 1 selftests: mm: run_vmtests.sh # SKIP

Best regards,

Jo=C3=A3o Marcos Costa (4):
  kernel-selftest: rename vm selftests to mm
  kernel-selftest: drop libhugetlbfs
  kernel-selftest: fix mm selftests dependencies
  kernel-selftest: add missing sources if mm is enabled

 .../kernel-selftest/kernel-selftest.bb        | 23 +++---
 ...s-down-full-CC-and-CFLAGS-to-check_c.patch | 76 +++++++++++++++++++
 2 files changed, 89 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftes=
t/0001-selftests-mm-pass-down-full-CC-and-CFLAGS-to-check_c.patch

--=20
2.43.0


