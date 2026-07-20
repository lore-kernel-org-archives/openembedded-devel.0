Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF28C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:59:49 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3711.1784570388797419872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lM4uJAMq;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2550; q=dns/txt;
  s=iport01; t=1784570388; x=1785779988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Zq0tAD321dZBHzb0zZVbcqCaNMjIqSwlFMTHu2Hgvs=;
  b=lM4uJAMqh6JfivSaIc0PRnKCctCUv2sSYx1zGSUq3nR60Fm10YiW0mua
   GlT+NOn8HZSCFpccKqeGpvb8kGpZPuHPb2VbJtOoqh6pWFNyALhk7SaPR
   10kUgXiAIEjkwGVl5mUh1/92qTf4w2Sn6HpGVGcv79cA4e1ES1X8Ku3wp
   ouElSG+G+hlcnWCFD7mrxYUgSH7KFK47eBusSmGJqNGtyPkjPq62LgmQY
   a67RAyQlMMcBfdawiVhBjIhvU5tj2gBDkfatdWeYC35GyFs3DNClU/cDx
   oaJNbY7iluOk7xJ8PztPFvMiz6reQvB/JR9a3OybfimZnEhzXUU5G3zrS
   w==;
X-CSE-ConnectionGUID: f1QsE1MZTf2WJ4L/LEW8fg==
X-CSE-MsgGUID: HobieQoESqinzJo7UysztQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCzYF5q/4z/Ja1aglmCV3ReQ0kDlkcDgROdCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEbt8giyBAYMoA?=
 =?us-ascii?q?YFU2y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKBFYJzdoEFgVwCgTh1hXgEgiKBD?=
 =?us-ascii?q?IFaHo90SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BOoECh?=
 =?us-ascii?q?HQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNSBEsNxQZBD5uB41AI4JAg?=
 =?us-ascii?q?Q4BKxeCFaV2oQ8KKIN1jCGVOhozhVulEQuYfYs3glOWUIRpgWg8gVlwFYMiC?=
 =?us-ascii?q?UoZD444g2vOWicyAgkDLwEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:u6rfIqqhc/Gz+qt6NC3UFBtQjQheBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnSO/nZYWr0Lo0la4+1/ElQsMPSmN83SlY6+X8xRCpDpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8ks34pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uguOHpjr
 NkqFD5XUTLfo6WS7Y3rROY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHJ8PxR7D+
 TOuE2LRIhYQNdGmzhe+63OqlM3Iwh7qQ5AOLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIdgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYkD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:pcr9oavDnhhmjj3RmxrbJW1j7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3ACad48GtvZze51/tpRUZ0Yazq6IsrK0TG4S71EXO?=
 =?us-ascii?q?2U1lLFJnSbXKvqK1rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AdZirOQ928sST+R3WW9DC3PqQf+dv6aWjMUcgqow?=
 =?us-ascii?q?HvdumMnNNKiyPkA3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512230379"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:59:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id EA46A18000612;
	Mon, 20 Jul 2026 17:59:47 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 922CFCAEF78; Mon, 20 Jul 2026 10:59:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][wrynose][PATCH 2/3] jq: Fix CVE-2026-49839
Date: Mon, 20 Jul 2026 10:59:40 -0700
Message-Id: <20260720175941.2521378-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175941.2521378-1-dkelaiya@cisco.com>
References: <20260720175941.2521378-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 17:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128285

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-49839 as referenced
in [2], using the upstream commit identified in [1].

[1] https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86
[2] https://github.com/jqlang/jq/security/advisories/GHSA-cfh2-vwfq-qfmm

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-49839.patch                | 37 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
new file mode 100644
index 0000000000..c5729fd4df
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
@@ -0,0 +1,37 @@
+From d06aa59975de9c469bf77bab901999d446ec739d Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 8 Jun 2026 22:14:48 +0900
+Subject: [PATCH 2/3] Fix heap-buffer-overflow in raw file loading
+
+When `jv_string_append_buf` overflows the string length limit,
+it returns an invalid `jv`; `jv_load_file` then re-entered it
+on the invalid value and overran the heap. Break out of the loop
+once the value is invalid.
+
+Fixes CVE-2026-49839.
+
+CVE: CVE-2026-49839
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86]
+
+(cherry picked from commit e987df0d463d85fd70825e042a082427e8275b86)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index b10bcc0..40137c3 100644
+--- a/src/jv_file.c
++++ b/src/jv_file.c
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
+ 
+     if (raw) {
+       data = jv_string_append_buf(data, buf, n);
++      if (!jv_is_valid(data))
++        break;
+     } else {
+       jv_parser_set_buf(parser, buf, n, !feof(file));
+       jv value;
+-- 
+2.53.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 18a7093885..4bf8292ac0 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-43896.patch \
            file://CVE-2026-44777.patch \
            file://CVE-2026-43895.patch \
+           file://CVE-2026-49839.patch \
            "
 
 inherit autotools ptest
-- 
2.35.6


