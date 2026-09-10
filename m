Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A690DC79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 09:27:38 +0000 (UTC)
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9681.1789032454909514392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 02:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TKJLfm4W;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6704; q=dns/txt;
  s=iport01; t=1789032455; x=1790242055;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7wSgfGhHonZAR0zmuN7k+t1xoupVsPvJe/7Yw+olwO8=;
  b=TKJLfm4WgD1UGsLaxS4HKHFrqggczFGUHScE1lya1uQEz9NSSWyLoWZD
   sBEn4elrLYpuNC6m2hnVmTh8iMJH8xzpvAwPdh4PFT2mBRLdr+Dn2FHrD
   VqrxO74iZbYR/7walX6z2dSu3qxOz6Vuhaqy1bQhWfj/8AT+5gM9z66bP
   YmIqq24fxhcIOkiErDGECsxME0obZZhwmpu5IE0gOa2hr74yGXFZKdsiq
   4T3cpMFsuKSkQJb1dglgCBrvvc6QQPdTDutZrkvHRQeRABGlq7BcKF/da
   XZxy4TxCFq45OEaM3gSnMN5SJ1qGhbVLAwNgzIOUMHrC5nLUhrkOxneie
   A==;
X-CSE-ConnectionGUID: +2xZsLroQc68otMCSh3crw==
X-CSE-MsgGUID: xGd1xM12QVmmJr7ee+X0bg==
X-IPAS-Result: =?us-ascii?q?A0BFAgCYd6Jq/85K/pBaHgEBCxIMggULgld0YUJJA5Qmg?=
 =?us-ascii?q?iGRTYxRgX4PAQEBD0QNBAEBhD9GAo4FAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAS0LAXIDAQJaIxkIgwIBgnQDEcEOGjeBe?=
 =?us-ascii?q?TOBAYNuQFDbMQELFAGBOIU/iCJdGAGEfCcbG4FygRWDaYEFgVwCgScRhm0Eg?=
 =?us-ascii?q?g0VgQyBWhgGgWGDQYxgSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BJ4JkIxk2eoEJXoErKWESF4EJgggCglSCAQIBSUMOB0VTCSdLEkwpG?=
 =?us-ascii?q?AsYDUgRLDcVGQQ+bgeOex+CXQFYCisBCiEXgVFEDyulOaESCiiDdowilToaM?=
 =?us-ascii?q?4Vbo3uBFwuYfYkchG6VaAsNUIRpgWg8gVlwFYMiCUoZD44uCwuDYIZQxVE8N?=
 =?us-ascii?q?QIJAy8BAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:b5LnaK3jm3+Rvqt/4vbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2MEz
 mJMUT3SbPuONGXxc4tyYI+w90pX6MeAx4IxTFA/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7g28tajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGTxsmD5Y84OFOCj8e8
 uA9AwsNNRuZmLfjqF67YrEEasULJcTxeYdasXZ6wHSBULAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEqojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjee2YYCLIIziqcN9jmmU/
 3Ljpj7APBQfFsbAxDfGwiqmibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:9Y/s9q5oXp1GOXHLsgPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:Z8ldZG4InN3sp+CuztsstxQEKNsBaHrkxymAJFOdIl1pE7aPVgrF
X-Talos-MUID: 9a23:i3PuogX6zUNwEVbq/C/DiGhyEZ4y2pqrDWIXzpgL+PncPyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,95,1787011200"; 
   d="scan'208";a="57392628"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Sep 2026 09:27:11 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 32BDB1800023A
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 09:27:11 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id EEC96CC1636; Thu, 10 Sep 2026 14:57:09 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] rsyslog: Fix CVE-2026-19654
Date: Thu, 10 Sep 2026 14:57:00 +0530
Message-Id: <20260910092700.3740102-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 09:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129912

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the fix backported to rsyslog 8.2402.0 for
CVE-2026-19654. The upstream fix commit is referenced in [1], and
the public CVE advisory is referenced in [2]. The regression-test
commit is included in the same upstream pull request and referenced
in [3] and the individual commit is reference in [4].

[1] https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
[2] https://github.com/rsyslog/rsyslog/security/advisories/GHSA-cj5r-wh2m-7w29
[3] https://github.com/rsyslog/rsyslog/pull/7410
[4] https://github.com/rsyslog/rsyslog/commit/8e67ae69539153e4e80547dfb5f07ed17222e292

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../rsyslog/rsyslog/CVE-2026-19654.patch      | 52 +++++++++++++++++
 .../rsyslog/CVE-2026-19654-regression.patch   | 56 +++++++++++++++++++
 .../rsyslog/rsyslog_8.2402.0.bb               |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
new file mode 100644
index 000000000..4371a0715
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
@@ -0,0 +1,52 @@
+From b80f0ee2a0e42bafdd9c13f9d6155b4c8b425a9a Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 20 Jul 2026 17:19:28 +0200
+Subject: [PATCH 1/2] imptcp: guard regex framing match at line start
+
+Why
+A regex match at the beginning of the receive buffer can form a
+negative message length after oversize-frame recovery.
+
+Impact
+Regex-framed imptcp listeners reject that invalid transition instead
+of submitting a negative message length.
+
+Before/After
+Before: a match with a zero line offset submitted an invalid length.
+After: only a match following an existing line can submit a frame.
+
+Technical Overview
+Mirror the line-offset guard used by the shared imtcp parser.
+Leave existing regex framing and oversize recovery behavior unchanged.
+
+Security advisory:
+https://github.com/rsyslog/rsyslog/security/advisories/GHSA-cj5r-wh2m-7w29
+
+Reported-by: Raphael Eikenberg (@eikendev)
+With the help of AI-Agents: Codex
+
+CVE: CVE-2026-19654
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586]
+
+(cherry picked from commit 07b3c40a5a78c79ed9109251f842ca7e955dd586)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ plugins/imptcp/imptcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/imptcp/imptcp.c b/plugins/imptcp/imptcp.c
+index 351dee077..9e16e4b19 100644
+--- a/plugins/imptcp/imptcp.c
++++ b/plugins/imptcp/imptcp.c
+@@ -1053,7 +1053,7 @@ processDataRcvd_regexFraming(ptcpsess_t *const __restrict__ pThis,
+ 		pThis->iCurrLine = pThis->iMsg;
+ 	} else {
+ 		const int isMatch = !regexec(&inst->start_preg, (char*)pThis->pMsg+pThis->iCurrLine, 0, NULL, 0);
+-		if(isMatch) {
++		if (pThis->iCurrLine > 0 && isMatch) {
+ 			DBGPRINTF("regex match (%d), framing line: %s\n", pThis->iCurrLine, pThis->pMsg);
+ 			strcpy((char*)pThis->pMsg_save, (char*) pThis->pMsg+pThis->iCurrLine);
+ 			pThis->iMsg = pThis->iCurrLine - 1;
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
new file mode 100644
index 000000000..d33188617
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
@@ -0,0 +1,56 @@
+From 49d897a9fb76d340978b24ced7d63b3786bb1c51 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 20 Jul 2026 18:19:17 +0200
+Subject: [PATCH 2/2] tests: assert imptcp regex oversize diagnostics
+
+Why
+The test called a nonexistent helper, so its diagnostic assertions did not run.
+
+Impact
+The regression test now fails if oversize recovery diagnostics are missing.
+
+Before/After
+Before: missing helper calls silently left the diagnostics unchecked.
+After: supported regex assertions verify both expected diagnostics.
+
+Technical Overview
+Use the testbench content_check helper with its regex option.
+Document the oversize-recovery invariant and clean-shutdown oracle.
+Keep the existing data stream and expected framed output unchanged.
+
+With the help of AI-Agents: Codex
+
+CVE: CVE-2026-19654
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/8e67ae69539153e4e80547dfb5f07ed17222e292]
+
+(cherry picked from commit 8e67ae69539153e4e80547dfb5f07ed17222e292)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/imptcp_framing_regex-oversize.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tests/imptcp_framing_regex-oversize.sh b/tests/imptcp_framing_regex-oversize.sh
+index c5b74ddb1..67b63d8e7 100755
+--- a/tests/imptcp_framing_regex-oversize.sh
++++ b/tests/imptcp_framing_regex-oversize.sh
+@@ -1,5 +1,8 @@
+ #!/bin/bash
+ # This file is part of the rsyslog project, released  under ASL 2.0
++# Regression coverage for regex-framed imptcp oversize recovery. The configured
++# 256-byte limit forces the recovery path; clean shutdown plus the two internal
++# diagnostics prove that recovery completed without corrupting parser state.
+ . ${srcdir:=.}/diag.sh init
+ generate_conf
+ add_conf '
+@@ -40,6 +43,6 @@ NEWMSG: <33>Mar  1 01:00:00 172.20.245.8 tag multi
+ line3
+ NEWMSG: <33>Mar  1 01:00:00 172.20.245.8 tag test4'
+ cmp_exact
+-content_check-regex "assuming end of frame" ${RSYSLOG2_OUT_LOG}
+-content_check-regex "message too long" ${RSYSLOG2_OUT_LOG}
++content_check --regex "assuming end of frame" "${RSYSLOG2_OUT_LOG}"
++content_check --regex "message too long" "${RSYSLOG2_OUT_LOG}"
+ exit_test
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
index c5bd9be5b..7c5687f76 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
+           file://CVE-2026-19654.patch \
+           file://CVE-2026-19654-regression.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-- 
2.43.7


