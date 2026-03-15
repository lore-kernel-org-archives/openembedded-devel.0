Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B3EFCBAF
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28710.1773581757445980601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jDxh2oEg;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1034; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ltgfxeu6q+xMG+vxtO6oORF3VfWOCHqvDVucQYsDst0=;
  b=jDxh2oEgLdXj7+fbw13kRe9bq7nSkgJTXea76ssAlWGzx+aw8KJKY0pA
   b4aD5EVLvBqpODXUv1YoDDLn5Vo3JBHr4Num8qo5kylEt+qcRYXp6T16C
   S+rUzdagsNWawtcBAn0WUHMJUE7w9yDVz5LAPUhELwwSD0LmPX462ipyc
   T3fDJfRCXuABZKqwrfHkB1zI9mugx4yI9gdzIs45mvp1Oh9NPTEA4UUYL
   3G0w8yxtnq/TYjQqIaDLo/Hka274FiJVcd/8vyxHMHtA39r666Goi9xKt
   vNTV/NMq48CxqvMXKbcAa7JWtCvA95He+FaMCusGwI1r7GQrZGBRDn64h
   A==;
X-CSE-ConnectionGUID: 9t3tdjG1SUiILbVuWVA77Q==
X-CSE-MsgGUID: yUsni63tRa+sgfLDMB19gA==
X-IPAS-Result: =?us-ascii?q?A0AjBwAatbZp/4r/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6HOwaLa0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYUaD4hydG2BE4MtAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeNej2CMwE9UYFHaAE5pWOhDgoog3SMHpU6GjOqa5kGpFmEaIFpATqBW?=
 =?us-ascii?q?XAVgyIJSRkPjl/MfSM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:5bC7uaBLSxVb8BVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDlx0jJSm
 mVNXD2Aa/ncYWL2c99zPdvlpBkEvZHRyNRiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEkuk1EE00EtQjx+dWJWtw6
 MMmAW9SV0XW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FIgiOKxbYuPJLRmQ+1Eo12ep
 zyd417wQQoVOviz7BDco32F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:3z3Kda3JRliTuD7iBGM4DgqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: 9a23:1RfS6GDQsyWLGnv6E3h7r1IYGO98SUDc7VPaHVKHN082F4TAHA==
X-Talos-MUID: 9a23:xyg+8ggJW9wVCd8f+usLJMMpJfpz5aXwU1w3mNYdtMegGQlaYmaSpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690245926"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id CBA3C180001E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 2C5E9CC8C9D; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 06/24] tcpdump: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:23 -0700
Message-Id: <20260315133441.3034831-7-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125230

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require tcpdump to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
index f1bd32485c..6432632913 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
@@ -52,3 +52,4 @@ do_install:append() {
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
 }
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


