Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1411BC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 10:10:28 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19996.1784801425767595518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 03:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=RHzfMDTk;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ngXXesf1SQLrcGSnYQeuVL55f3ffLJ6mpadkCPbZlJo=; b=RHzfMDTkhxxVAYO2GodWZQ4Mtj
	5egYgqJGy7NcUP8mJ5C7KB/ssGvtdo0qE1TVvnIksNbVP7UAHz5inE/nZXZ7CvkaSQ+daCkEyNZkQ
	f3xKakeuBN688FkUFuHP3ZQbJJzmABecDygoSTemSg2prLwIBcTfeqpugbUGfY4q8aXn2UgkEvzih
	x32vXN0E85WmVwtb9eK3R2HCOOP0frWxJ28jaXvt/ErlXkcv52rPROjFJ48YvomlfXlqreuAV0+uW
	JXiNOt6gsOxrWmRh/33UuzNjMk4c84ZW6jZuks0Wrhu9AeYN1ecvJzb2Y6Qp2EumWSUoQBMbh1x3K
	ru+dotGg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmqNj-000F2q-0M;
	Thu, 23 Jul 2026 12:10:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmqNi-000LIC-0I;
	Thu, 23 Jul 2026 12:10:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe] iperf2: Fix compilation with --disable-ipv6
Date: Thu, 23 Jul 2026 12:10:19 +0200
Message-ID: <20260723101020.145255-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128415

Cherry-pick upstream commit.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 ...89-Compilation-fails-with-disable-ip.patch | 25 +++++++++++++++++++
 .../recipes-benchmark/iperf2/iperf2_2.2.1.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch
new file mode 100644
index 0000000000..f1590dab1a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch
@@ -0,0 +1,25 @@
+From ffc2004daf5e8335b7a87664426728f53fc7a5d0 Mon Sep 17 00:00:00 2001
+From: Robert McMahon <rjmcmahon@rjmcmahon.com>
+Date: Mon, 12 Jan 2026 10:14:08 -0800
+Subject: [PATCH] fix for ticket 389: Compilation fails with --disable-ipv6
+
+Upstream-Status: Backport [https://sourceforge.net/p/iperf2/code/ci/0fe3730e2c1d045077ac2cf76a796e95f3455952/]
+
+Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
+---
+ src/iperf_multicast_api.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/iperf_multicast_api.c b/src/iperf_multicast_api.c
+index 48c0184d..06f3399d 100644
+--- a/src/iperf_multicast_api.c
++++ b/src/iperf_multicast_api.c
+@@ -176,7 +176,7 @@ static int iperf_multicast_join_v4_pi (struct thread_Settings *inSettings) {
+ 
+ static int iperf_multicast_join_v6 (struct thread_Settings *inSettings) {
+ #if (HAVE_DECL_IPV6_JOIN_GROUP || HAVE_DECL_IPV6_ADD_MEMBERSHIP)
+-#if HAVE_STRUCT_IPV6_MREQ
++#if (HAVE_IPV6 && HAVE_STRUCT_IPV6_MREQ)
+     struct ipv6_mreq mreq;
+     memcpy(&mreq.ipv6mr_multiaddr, SockAddr_get_in6_addr(&inSettings->multicast_group), sizeof(mreq.ipv6mr_multiaddr));
+     mreq.ipv6mr_interface = mcast_iface(inSettings);
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index cc7a1561df..840e79bd35 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
            file://0001-fix-for-buildroot-linux-breakage-ticket-342.patch \
+           file://0001-fix-for-ticket-389-Compilation-fails-with-disable-ip.patch \
 "
 
 SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"
-- 
2.54.0


