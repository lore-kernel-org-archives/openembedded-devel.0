Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE08EB8FA4
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:07:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2581.1693966063068070299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130431199"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130431199"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:07:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FA2ADB3D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:07:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACD63CF7CF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:07:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2937F6BF41;
	Wed,  6 Sep 2023 11:07:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 4.0.7 -> 4.0.8
Date: Wed,  6 Sep 2023 10:07:29 +0800
Message-Id: <1693966049-15266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--9.021500-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yUIIxwDaU5mrFo3SyXfoXMvEWhdVdXNnvwsc
	YS3HCNn/algKKGlY44YOe6UQgyI8eR9qffoMBlLMeXXhejkivZcMAtcrQt9+kVKFxY7/zfGicn0
	xufrhxdFNWe0PkRg0m0F3Ld6FxMa5bC1/2cudIH/ARoxw6PTfnzWBEYnpSn2FHBfAJS7y0Ip92L
	7T9+yFOMPOAVBbL5BTmU/J5maPYneoDchK4Bztmm/6CCblACLhZ7Rw1p6uSHC7Iv2OMTayQXMIa
	paDo9OKRtqxwxytKE60aw4Pc//eXcgsRQTLEO1A0jkOdkwgJjBzq96Ia3370/2HqI6PY56evqnF
	tM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgAYAPqHoVmYRPrhvTq+YBF+em2v
	w+cenKeLzNWBegCW2wgn7iDBesS0gBwKKRHe+r7Q+mA1sGYoIW4gDhEyp3TUgrMHpC+G7TgViop
	/yzmcNUyOdyyRaJsQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104769

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
The following vulnerabilities have been fixed:
    wnpa-sec-2023-23 CBOR dissector crash. Issue 19144.
    wnpa-sec-2023-24 BT SDP dissector infinite loop. Issue 19258.
    wnpa-sec-2023-25 BT SDP dissector memory leak. Issue 19259.
    wnpa-sec-2023-26 CP2179 dissector crash. Issue 19229.

The following bugs have been fixed:
    TShark cannot capture to pipe on Windows correctly. Issue 17900.
    Wireshark wrongly blames group membership when pcap capabilities are removed. Issue 18279.
    Packet bytes window broken layout. Issue 18326.
    RTP Player only shows waveform until sequence rollover. Issue 18829.
    Valid Ethernet CFM DMM packets are shown as malformed. Issue 19198.
    Crash on DICOM Export Objects window close. Issue 19207.
    The QUIC dissector is reporting the quic_transport_parameters max_ack_delay with the title \"GREASE\" Issue 19209.
    Preferences: Folder name editing behaves weirdly, cursor jumps. Issue 19213.
    DHCPFO: Expert info list does not show all expert infos. Issue 19216.
    Websocket packets not decoded and displayed for Field type=Custom and Field name websocket.payload.text. Issue 19220.
    Cannot read pcapng file captured on OpenBSD and read on FreeBSD. Issue 19230.
    UI: While capturing the Wireshark icon changes from green to blue when new file is created. Issue 19252.
    Conversation: heap-use-after-free after wmem_leave_file_scope. Issue 19265.
    IP Packets with DSCP 44 does not indicate "Voice-Admit" Issue 19270.
    NAS 5GS Malformed Packet Decoding SOR transparent container PLMN ID and access technology list. Issue 19273.
    UI: Auto scroll button in the toolbar is turned on when manually scrolling to the end of packet list. Issue 19274.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.0.7.bb => wireshark_4.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.0.7.bb => wireshark_4.0.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb
index d7df76a692..2117e9ee3c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.0.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.0.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "a79f7b04cbff823e30452abf4bcb86773d8583eb62d5f71f16c09f019f8a8777"
+SRC_URI[sha256sum] = "16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8"
 
 PE = "1"
 
-- 
2.34.1


