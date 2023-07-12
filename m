Return-Path: <michael.weiss@aisec.fraunhofer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ED9EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 14:58:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by mx.groups.io with SMTP id smtpd.web11.9627.1689173879038047067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 07:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: aisec.fraunhofer.de, ip: 212.227.126.187, mailfrom: michael.weiss@aisec.fraunhofer.de)
Received: from weisslap.aisec.fraunhofer.de ([91.67.199.25]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mrfgi-1pei5H3Bq8-00nkBh; Wed, 12 Jul 2023 16:57:55 +0200
From: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
Subject: [meta-oe][PATCH] pv: Show progress bar even if no terminal is set as in 1.6.6
Date: Wed, 12 Jul 2023 16:57:35 +0200
Message-Id: <20230712145735.88665-1-michael.weiss@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b/R3V1J6FJmI+IAgJK+IU656hrM34Vv5ezTmdhG3jE26RmoC6zR
 7TxhgbdfH9I9ULp57oC9VpWwekhjhPdERRRH0HVsOQ/FEBdluLwgBwjloWPSu7OS1BXlmiV
 MKWl37VtrkoQBkdBhAM2iDw5OO8nIpAC4yFgPsRFpMDlo5ajViH+OzMCNPld8OfZLQm8MUu
 ckTDYv5xCNIuPTX2+rpkA==
UI-OutboundReport: notjunk:1;M01:P0:/CnWQwovm1A=;d9lMGk0QWsvghBRaYqx04Pj+1j7
 jv1P2NiyNbKcpQgJFCMW9y42aAchSeao/vMPhAS1k0HXY5kKKUwEIWMVO3Hxj/KagfC4L0pMW
 o6piP9ZhodJaje4B4h73d12ooZ84hY1N1eEow8tNbI7rZ5EU5Ovw/WdqxOlo/zHChyboXWwNQ
 bIMg+KrCrEAkA+fTXNbRUulQQOvpjmQwdjWcM5zDPRQQFLxnbkPSVkYE6FBCrbDfnV8gfaQbK
 6akjtXUpFv/bjaOfZM+OXCDA0tJb9yQIrrtKX7ESD343bvHM56J1NQnV1McVXnaWTGjbCVHDX
 G6H9fYKaOJPNlRrBkOvshieiAzOfqCpRR356qUKlxjaZKav7kossEbrPO9peoydwudQkEqP46
 0weeaJitUzOYS9Ixo9Pulh82VKoOJF/AoZNJIn7U79zWPiuVvqW5udWU84yMhAdihPUuKFhhS
 +fPfBiPnWJ3ITvlw+yVjT6+w230SIcXi0lLlN6mOUt9eIE2Zl2GBwiXdAbPrbtgvFIdjSk/F5
 JpPoOJI1KgUN+yQiXO03N8vHZZl9XBTZxRvo0LEty14i+TCdZ/s7HsU0WZmoE2MOUnvCGm9+k
 JPYxWoeZdpZ6H0ZZ5uwxul8f/FlSlFUq4tpMHAglaErCF0yl9cD3rkIu3MJQIH4Na5aF9Q297
 R3XE4JH3VZTmdzmg8CiUFPoIQXmNnHJq4FCar1WkcA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103842

The currently used version 1.6.20 of pv does not show the progress
bar if no controlling terminal is set. Added a patch which restores
previous behavior of pv as in version 1.6.6.

Tested with pv in the busybox initscript of GyroidOS which is
running on /dev/console (which has no controlling tty). With this
fix, we get the progress bar back on /dev/console as before.

This was also submitted upstream but dangling since several Months:
	https://github.com/a-j-wood/pv/pull/64

Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
---
 ...e-error-of-tcgetpgrp-in-pv_in_foregr.patch | 38 +++++++++++++++++++
 meta-oe/recipes-support/pv/pv_1.6.20.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch

diff --git a/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
new file mode 100644
index 000000000..3c364dcc4
--- /dev/null
+++ b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
@@ -0,0 +1,38 @@
+From c5cd932fb08e7ce90cdbf9ae6c5cc7e65ac0738e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
+Date: Tue, 9 May 2023 20:00:26 +0200
+Subject: [PATCH] pv/display: handle error of tcgetpgrp() in pv_in_foreground()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Show pv progress bar even if no terminal is set, e.g., in a busybox
+init script. The description of pv_in_forground() states it will
+return true "if we aren't outputting to a terminal". However, this
+is not the case since tcgetpgrg() will return an error and set ERRNO
+to ENOTTY if the output fd is not an tty. We now handle this error
+correctly and pv_in_foreground() returns also true in that case.
+
+Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
+---
+ src/pv/display.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/pv/display.c b/src/pv/display.c
+index aff643b..8d1f4c9 100644
+--- a/src/pv/display.c
++++ b/src/pv/display.c
+@@ -48,6 +48,10 @@ bool pv_in_foreground(void)
+ 
+ 	our_process_group = getpgrp();
+ 	tty_process_group = tcgetpgrp(STDERR_FILENO);
++
++	if (tty_process_group == -1 && errno == ENOTTY)
++		return true;
++
+ 	if (our_process_group == tty_process_group)
+ 		return true;
+ 
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-support/pv/pv_1.6.20.bb
index 867a621d1..87b764ac5 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
+++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
@@ -5,6 +5,7 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.bz2 \
+           file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch" \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603"
-- 
2.30.2


