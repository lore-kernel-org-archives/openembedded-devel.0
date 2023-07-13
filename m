Return-Path: <michael.weiss@aisec.fraunhofer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03657C0015E
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 07:48:52 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by mx.groups.io with SMTP id smtpd.web10.3314.1689234525055249569
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 00:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: aisec.fraunhofer.de, ip: 212.227.17.10, mailfrom: michael.weiss@aisec.fraunhofer.de)
Received: from weisslap.aisec.fraunhofer.de ([91.67.199.25]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1ZQT-1qGpBy32fj-00329C; Thu, 13 Jul 2023 09:48:41 +0200
From: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
Subject: [meta-oe][PATCH v2] pv: Show progress bar even if no terminal is set as in 1.6.6
Date: Thu, 13 Jul 2023 09:48:11 +0200
Message-Id: <20230713074811.97041-1-michael.weiss@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NZBcokjo70S1HaDM14cmgGVPQHWZeLHbFrO6AEpS/teHAQtBqjE
 eLyXvKeTrAcFkbG/JPJafVNc7Vw0uxtnqmc/Q8iiaWSwvk8Rg1LMMSegfYOpXd1Cpk7Z4Zx
 jkX/JjLnhy/eYcnUBpneUrK9z/ieYGdo8gISM5eVANHlBdrodl2JDOTtZEc++B35PMC29dv
 K+R6oC3/dwbPXkEdWkKtg==
UI-OutboundReport: notjunk:1;M01:P0:j2r+ck7hBEE=;gJ6TiDF1BcR/cJJ+oHM+nrYWcGO
 E88F13R+Ma5K7EW7L8T7pvTseOUbJU2rmL2q8OXy3czqV3R6D1jt4eIgacmGGcZ8ZFsnwuiGI
 m4Rc3YD6fjOGozl/8dx8dRaY+d6LaxQPbmtchh41jHTtswxzlt4uVfwpfIryl+ypL9WOOqeRg
 /1cbABkzpiKPJ8sUozd+9idwzFNrmYsxHY4xIYc2ofBPEyId6VkjFCw2DHqyu5890ogavq0/d
 BNAsAgMjUxp8xGbEBPC29LGwZTqxoT2xQ8VpZpUiXCW40bDH3wH9+rxVj4lCDOfQQFSjmmhBX
 oVxNocHFsSm9Bz6lh/RBEsjCBZMz2lsx4pxI/jobcj3IHDilwbODU96/rGaciJzTyDCIVevXq
 02p5/BtG/o4RNwzqiEdUToCz+cshf2SNPT8kFomFlC0JCUoKaICGpt/iflLVbMQpQyLOwgOhS
 +7i1SWVHbah21HN5Jk4wStqZsuKXRLV0P5RiQ/VFzLek8A9RiVS3PH7Dv6lOScjUFprBMo0q3
 5UrBxTqs6oMiYb5fsyMVqP91C9gxYNJQFBH4ySu7nw4HQyYkEunDU3N6aWm4r8cgVzoo94akp
 vPxcs5FjHiG9Uc+AM/pTMd3rMakr8vJcxyRLG1vAawxMB38wMCVetI9KYhsJ1C5sFkfkeGkAn
 RKyvfF+3KB/0P48NMvOFWQpdhT+hp/YMHnKwejqLBA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 07:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103855

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
index 867a621d1..6d449a945 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
+++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
@@ -5,6 +5,7 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.bz2 \
+           file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603"
-- 
2.30.2


