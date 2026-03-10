Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A24FD2D65
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:16:37 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38655.1773144991861675197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kw/f831r;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2674; q=dns/txt;
  s=iport01; t=1773144991; x=1774354591;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJm9J1pabnZz3M309RW500Rx2owgsp1Ip/mMA3s6GZc=;
  b=kw/f831rCgK0AsTuHYKGOtSy0aKZ0f0e9AH/UbhtEWaOBW3Xp+C9A6Gu
   DOyPezK1rdTUe3WdKso7TgV6VVg+sjFXVgYo9MffA+RJbNkBHCnjeh1ns
   mJlF6Dq5VMSQYd8RYs46vT2aafekLtzDfrDT+JrM9Ymjw1AZKC0DI1qOv
   jtfuxEY6Qevbmr7q86TXXvZQI4Lmf03xpsiNbGUYLNsvGmTIb0r/2uRa5
   6ouu5z8QGcNEh7bRcBkLSh6mDzlQKVZWYdV1vWR7R7MeEqUWaKH/rqyvy
   AaQdNCz0UjhrwUatTkhS7B+SgzTOJs7n4FlznQUAS4v3iuDeI1KbjquXM
   A==;
X-CSE-ConnectionGUID: zCcpFExvTsCu0LT/C8uTfQ==
X-CSE-MsgGUID: 1/pSSwtnR56UNbZkcUt4rg==
X-IPAS-Result: =?us-ascii?q?A0AnBADTCrBp/5X/Ja1agQmBUIJID3FfQkmEV49TgiGeH?=
 =?us-ascii?q?YF/DwEBAQ89FAQBAZIpAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaASkECwEYAUYTAwECAwImAi0jGAmDAgGCcwIBEZECm?=
 =?us-ascii?q?0R6fzOBAYMoATEFCQJDT9smAQsUAYEKLoU8gxgBhQBbGAGEeicbG4FygRWDa?=
 =?us-ascii?q?IEFgVwBAxiCE4MOgmkEgiKBDoFhHoU/BoRPhw1IgQIcA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+FzNYGwcFhR8PiHJ0boETgx4DCxgNSBEsNxQbBD0BbgeNd?=
 =?us-ascii?q?D6CNIEOLIIUGA4DkxSST6EOCiiDdIwelToaM4QElBWSUpkGjgmWUIRogWg8g?=
 =?us-ascii?q?UcLB3AVgyIJSRkPjjiFaIMUxBAjNQI6AgcBCgEBAwmTZwEB?=
IronPort-Data: A9a23:R6S7Y6Dlo/Eq7RVW/3niw5YqxClBgxIJ4kV8jS/XYbTApD131D1Un
 DEeW2+DPquOa2T0Ktp2PIm0pxwDuJTUnYI3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8g2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE0d5lFG8bLZMk4c1qWUVys
 tdINQwDV0XW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FIhj+exbISOJbRmQ+0M2V6jn
 X3a+V6kXCw8Pu6cwgeZrmij07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Ps7g2arADkkppZkm+H7F5jgaV5ogeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHOBOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefygaYvp
 0QFJSXz7bLfDxHsfo=
X-Talos-CUID: 9a23:QScQ9WDGhLZegjP6EztM/1Y6N9A7Tmb20S/0HwiTWXtVRoTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AghTRGwwrBQ/Ya/BEnv/ktyrcwqWaqP3pEHs2jok?=
 =?us-ascii?q?AgZTaCAp6CTSWsSjrWIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208";a="687744637"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 12:16:31 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id E4279180001C9
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:16:30 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 86654CC12B5; Tue, 10 Mar 2026 05:16:30 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][whinlatter][PATCH] libssh 0.11.3: Fix CVE-2026-3731
Date: Tue, 10 Mar 2026 05:16:21 -0700
Message-Id: <20260310121621.196342-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125025

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://git.libssh.org/projects/libssh.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
Type: Security Fix
CVE: CVE-2026-3731
Score: 9.8
Patch: https://git.libssh.org/projects/libssh.git/commit/?id=855a0853ad3a

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
new file mode 100644
index 0000000000..9c3e5b9dcc
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
@@ -0,0 +1,43 @@
+From 4ba1c265b354056834fc835ecff14c0eeb834312 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:22:44 +0100
+Subject: [PATCH] sftp: Fix out-of-bound read from sftp extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-3731
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=855a0853ad3a]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/sftp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 37b4133b..cbcdb066 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -583,7 +583,7 @@ const char *sftp_extensions_get_name(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+@@ -599,7 +599,7 @@ const char *sftp_extensions_get_data(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+--
+2.51.0
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index 5928581312..9f66736b29 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib openssl"
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
+           file://CVE-2026-3731.patch \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
-- 
2.35.6


