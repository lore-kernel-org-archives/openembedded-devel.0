Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA1EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.741.1689654385898396203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124701736"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124701736"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5962DE8526
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9298CCFB9F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16D4520077821;
	Tue, 18 Jul 2023 13:26:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 4.0.6 -> 4.0.7
Date: Tue, 18 Jul 2023 12:25:47 +0800
Message-Id: <1689654348-30702-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--10.685400-10.000000
X-TMASE-MatchedRID: 0LRGK1b0mamjz0nOeth/yUIIxwDaU5mrFo3SyXfoXMvEWhdVdXNnvwsc
	YS3HCNn/algKKGlY44YOe6UQgyI8eTuZPz8QQL7+MB2m5K0KuIloSqduj1qvS//uIR54p90y7kO
	yZefHxfeJTkxEqpxvoeWAL3Qlk9WwDG9q9xhXZ0iLzZSKyQypzKhjckLFaYvMk4cPqhCnOBH2wV
	qcxIeACrezBTuf/LXdHAK4FsgrUaroZFYafiKelkXBhxFdFgcQhA0VjIpLz69zOAUUviTGIwboT
	DS3zulADJohTlq9OKulWzapND8lPMmq8U2/MJXWSCtgxgcsrMq061diBteN14fgjpBknTuR9fzY
	bFQZLPt3oM05MdTMEEHBJCBpcunAvbGVlOsfQKgapIb9znReA5qzeC0+8vPggz2Uv632lCi+qcW
	0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ABgA+oehWZhE+uG9Or5gEX56ba/
	D5x6cp585VzGMOFzA9wJeM2pSaRSAHAopEd76v5bve4SNkEHYHJe8f4mAwnBhIJE1ZYsHni99bK
	eQ66KvG6Hy5dTZTiw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103937

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
The following vulnerabilities have been fixed:

 wnpa-sec-2023-21[3] Kafka dissector crash. Issue 19105[4].
 wnpa-sec-2023-22[5] iSCSI dissector crash. Issue 19164[6].

The following bugs have been fixed:

-Crash when (re)loading a capture file after renaming a dfilter
 macro. Issue 13753[7].
- Moving a column deselects selected packet and moves to beginning
 of packet list. Issue 16251[8].
-If you set the default interface in the preferences, it doesn't
 work with TShark. Issue 16593[9].
-Severe performance issues in Follow → Save As raw workflow. Issue
 17313[10].
-TShark doesn't support the tab character as an aggregator
 character in \"-T fields\" Issue 18002[11].
-On Windows clicking on a link in the 'Software Update' window
 launches, now unsupported, MS Internet Explorer. Issue 18488[12].
-Wireshark 4.x.x on Win10-x64 crashes after saving a file with a
 name already in use. Issue 18679[13].
-NAS-5GS Operator-defined Access Category: Multiple Criteria
 values not displayed in dissected packet display. Issue
 18941[14].
-Server Hello Packet Invisible - during 802.1x Authentication-
 from Wireshark App Version 4.0.3 (v4.0.3-0-gc552f74cdc23) &
 above. Issue 19071[15].
-TShark reassembled data is incomplete/truncated. Issue 19107[16].
 CQL protocol parsing issues with 'Result' frames from open source
 Cassandra. Issue 19119[17].
-TLS 1.3 second Key Update doesn't work. Issue 19120[18].
-HTTP2 dissector reports an assertion error on large data frames.
 Issue 19121[19].
-epan: Single letter hostnames aren't displayed correctly. Issue
 19137[20].
-BLF: CAN-FD-Message format is missing a field. Issue 19146[21].
-BLF: last parameter of LIN-Message is not mandatory (BUGFIX)
 Issue 19147[22].
-PPP IPv6CP: Incorrect payload length warning. Issue 19149[23].
-INSTALL file needs to be updated for Debian. Issue 19167[24].
-Some RTP streams make Wireshark crash when trying to play stream.
 Issue 19170[25].
-Wrong ordering in OpenFlow 1.0 Datapath unique ID. Issue
 19172[26].
-Incorrect mask in RTCP slice picture ID. Issue 19182[27].
-Dissection error in AMQP 1.0. Issue 19191[28].

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.0.6.bb => wireshark_4.0.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.0.6.bb => wireshark_4.0.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb
index f822dce672..d7df76a692 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884"
+SRC_URI[sha256sum] = "a79f7b04cbff823e30452abf4bcb86773d8583eb62d5f71f16c09f019f8a8777"
 
 PE = "1"
 
-- 
2.34.1


