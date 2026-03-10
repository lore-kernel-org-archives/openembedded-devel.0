Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC88FD2D63
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:14:47 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38472.1773144880779468301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HwFY2eI4;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2674; q=dns/txt;
  s=iport01; t=1773144880; x=1774354480;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f72lDFHP/XyV/UW9649lkVwQNahPnUeJT6Ly1jGOsUQ=;
  b=HwFY2eI4hLVU+aXAGN+pb6iVWo0uxB+eIfVPVqVqwNDRLBWYzaLOHTC4
   e4P1+bzebSIoVFSEdy/jlWUSQuycMTYmhjza83g5IW/v9AHBiY5vrbvw6
   WUlR9OPujDxOllBMmwSOkgjy/7/I98ViBSNcgY25vXPo3+irUomFFniNa
   q6Gz94CP17iMf7rTtNXEduGwD+sry1FR/EAUZ0xx/O0fRcuEL/OIJh0sM
   LDaQVSvgJxz0bo0ID/XrP+Dax4qFucHYLL7XEnrIRlrah+AVGnkl37Fbb
   0rJHZK6EMdQ5VXA85D4720q2AhUoui1p+Ya0MwqFscz9zWAiLs640BNQg
   w==;
X-CSE-ConnectionGUID: ywwugw+tRJ2fUNG6iNfHfA==
X-CSE-MsgGUID: eQiz4HQrSaOCqVxBdiDOhA==
X-IPAS-Result: =?us-ascii?q?A0AqBABFCrBp/4//Ja1agQmBKxAagkQPcV9CSYRXj1OCI?=
 =?us-ascii?q?Z4dgX8PAQEBDz0UBAEBkikCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaASkECwEYAUYTAwECAwImAi0jGAmDAgGCcwIBE?=
 =?us-ascii?q?ZRdm0R6fzOBAYMoATEFCQJDT7UIAQsUAYEKLoU8gxgBhQBbGAGEeicbG4Fyg?=
 =?us-ascii?q?RWDaIEFgVwBAxiCE4MOgmkEgiKBDoFhHoU/BoRPhw1IgQIcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+FzNYGwcFhR8PiHJ0boETgx4DCxgNSBEsNxQbBD0Bb?=
 =?us-ascii?q?geNdD6CNIEOLIIUGA4DkxSST6EOCiiDdIwelToaM4QElBWSUpkGjgmWUIRog?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJSRkPjjiFaIMUwS0jNQI6AgcBCgEBAwmTZwEB?=
IronPort-Data: A9a23:p8P1FKPRWOsIXjPvrR3klsFynXyQoLVcMsEvi/4bfWQNrUp03zICy
 zYaW26Cb/qLMWrxfNl3b9i3oU1T6pfcmN5iSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmH+E3F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmYsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WLLJZ5bDYYmSFk5ad8mvpLXrKzdVgJRRjVWEY0r4f7WBm7
 /cULnUJKxuEne/zmOz9Qeh3jcNlJ87uVG8dkig/lneCUrB8HM2FGvmRjTNb9G9YasRmEfvTf
 cMFaT1HZxXbaBoJMVASYH47tLjw3SWjKmcD8zp5o4I62mnBkCxIyoPkF/HMRMygScR5uUax8
 zeuE2PRR0ty2Mak4T2d/3Shg+XCkS/2VMceGaO18tZugUaP3SoUEBAQWF6xrPW1h0L4XMhQQ
 3H44QI0pqQ0sUjuRd7nUljg/jiPvwUXXJxbFOhSBByx95c4Kj2xXgAsJgOtovR/6pFeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:mQKkG6vf2YtAB8uqrZHY/mSm7skDfdV00zEX/kB9WHVpm6uj5q
 WTdZUgpH3JYVkqNk3I9ersBEDiewK+yXcK2+gs1N6ZNWGM0ldAR7sM0WKN+VHd8lXFltK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: 9a23:+w6VpWza+oewpSOz2NFvBgUFBd84fWKe0E3yeUGFL0k3SZubaVG5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aobk9pw5RLFm9ClH3UUlwIqNvxoxl2qW8VGA0i64?=
 =?us-ascii?q?PnOKdCzxaNzaxqzSeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208";a="703441233"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 12:14:30 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 6198D18000275
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:14:26 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 05DB6CC12B5; Tue, 10 Mar 2026 05:14:25 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH] libssh 0.11.3: Fix CVE-2026-3731
Date: Tue, 10 Mar 2026 05:14:17 -0700
Message-Id: <20260310121417.194408-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125024

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
index 0000000000..88e6ff1c48
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
@@ -0,0 +1,43 @@
+From e46f096ad5294428509077c887233554d62ead0e Mon Sep 17 00:00:00 2001
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


