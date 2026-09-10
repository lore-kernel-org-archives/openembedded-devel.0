Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA4AC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 09:26:58 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9671.1789032412116157541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 02:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XKVjb24n;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6753; q=dns/txt;
  s=iport01; t=1789032412; x=1790242012;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BxagLAO3EPFWd8hn3wHVHTBed1bqu/H7vwN3jiOYjjI=;
  b=XKVjb24nACQM03qIkGdTMeF4Yae/l6F7enQlfL/aGKhuRWkH4cjAwTM9
   LgSwqIRfIZF56NRmHm/1X3x0pwQIMTw7DXkCn4MksIaVboZQPbvboJ3EY
   3c4FwwG44cu+bAfBmZMH/KlM3a3eJ1B4UUVQ3KzhN0eNXkkDxK9ZGhhXV
   5Sv6KYnv9tju6xc/xriOk4WTEXBDiE3wg4WlaiRxXp8IlVpGG5aXhPRyn
   Ujap+/ZK2A0aAn/b+XSQPcYtuR8q9mfUQa1aubvLxoKkJRhwz2pHvDaEs
   csj6WYqQEMTqd9LxC9dZINxl2PI275ncAcItKsVddZoVE1Ibzdvigzx4p
   w==;
X-CSE-ConnectionGUID: nyjtSLO8TiuvcXGJs8fqhg==
X-CSE-MsgGUID: iSnJXSWHS+uNW5/nnys8nQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgAFd6Jq/85K/pBaHgEBCxIMggULgld0YUJJA5Qmg?=
 =?us-ascii?q?iGRTYxRgX4PAQEBD0QNBAEBhD9GAo4FAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAS0LAXIDAQJaIxkIgwIBgnQDEcEYGjeBe?=
 =?us-ascii?q?TOBAYNuQFDbMQELFAGBOIU/iCJdGAGEfCcbG4FygRWDaYEFgVwCgScRhm0Eg?=
 =?us-ascii?q?g0VgQyBWhgGgWGDQYxgSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BJ4JkIxk2eoEJXoErKWESF4EJgggCglSCAQIBSUMOB0VTCSdLEkwpG?=
 =?us-ascii?q?AsYDUgRLDcVGQQ+bgeOex+CXQFYCisBCiEXgQlIRAYJK6U5oRIKKIN2jCKVO?=
 =?us-ascii?q?hozhVuje4EXC5h9iRyEbpVoCw1QhGmBaDyBWXAVgyIJShkPji4LC4NghlDFU?=
 =?us-ascii?q?Tw1AgkDLwEBBwIHDgMLgWiQAAEngVYBAQ?=
IronPort-Data: A9a23:6pAh3a22MqupHMLzr/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzEPz
 WUfD2mAbqncNzb2fdFwO4Tg9x5UusCEzYVrTwM/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7g28tajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGClA0IbY83bZLAHxQ/
 sw3CitdYAmDiLfjqF67YrEEasULJcTxeYdasXZ6wHSBULAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEqojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjuC0a4ONJIDiqcN9n32eh
 FL9wETCQQw8C4HYzzyU6SKqv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:ww5coaGXGRPHIwFNpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:sxYfCm6fcqK0PTodldss8l8WBvsBVS3hzWrOKH+XK305RqSVRgrF
X-Talos-MUID: 9a23:rNuS1AWm5WRxE8bq/D7XghNSD/hI2OezLn9Q1pMAqtLUMxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,95,1787011200"; 
   d="scan'208";a="60131064"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Sep 2026 09:26:47 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id B21541800023A
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 09:26:47 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 6F71FCC1636; Thu, 10 Sep 2026 14:56:46 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH] rsyslog: Fix CVE-2026-19654
Date: Thu, 10 Sep 2026 14:55:29 +0530
Message-Id: <20260910092529.3739156-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 09:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129911

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
 .../rsyslog/rsyslog/CVE-2026-19654.patch      | 51 +++++++++++++++++
 .../rsyslog/CVE-2026-19654-regression.patch   | 56 +++++++++++++++++++
 .../rsyslog/rsyslog_8.2512.0.bb               |  2 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
new file mode 100644
index 0000000000..1e6b390646
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
@@ -0,0 +1,51 @@
+From a680861018de25b2fb2e83d64c725ddbbb91a7db Mon Sep 17 00:00:00 2001
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
+index 363d8fa5a..8470e93eb 100644
+--- a/plugins/imptcp/imptcp.c
++++ b/plugins/imptcp/imptcp.c
+@@ -1009,7 +1009,7 @@ static rsRetVal ATTR_NONNULL() processDataRcvd_regexFraming(ptcpsess_t *const __
+         pThis->iCurrLine = pThis->iMsg;
+     } else {
+         const int isMatch = !regexec(&inst->start_preg, (char *)pThis->pMsg + pThis->iCurrLine, 0, NULL, 0);
+-        if (isMatch) {
++        if (pThis->iCurrLine > 0 && isMatch) {
+             DBGPRINTF("regex match (%d), framing line: %s\n", pThis->iCurrLine, pThis->pMsg);
+             strcpy((char *)pThis->pMsg_save, (char *)pThis->pMsg + pThis->iCurrLine);
+             pThis->iMsg = pThis->iCurrLine - 1;
+-- 
+2.53.0
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
new file mode 100644
index 0000000000..afab77b172
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
@@ -0,0 +1,56 @@
+From fd358cb6b9a773d6c4c223735745104c0deacc4f Mon Sep 17 00:00:00 2001
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
+2.53.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index 186e1ccf24..9a0702af93 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
            file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
+           file://CVE-2026-19654.patch \
+           file://CVE-2026-19654-regression.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-- 
2.43.7

