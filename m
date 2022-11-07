Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD7BC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:29:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.1212.1667809744188295616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xmqT6AFA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809742; i=@fujitsu.com;
	bh=SLkRekJX9UB4LRCjM7um+EilhplzKtt+d8EpFDE+hWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xmqT6AFAzinD8dU0OS5MPJHCstaEnwJBaE9Bn+jNcraDhJoOZyemvCsNkRqV4Y66A
	 1peC3g3EPXyAZBrERIL1wtjAwaXp8wmBn9qgs6uWMB8hLbY3zt/pKz3tpscSum3H3S
	 87z8rluWAoLK2rFOqhUWRPlKgG2SpzuQL1PYl4ZTPEop5dTCDJWn7UhuoZWHt9r6KB
	 VPRz2zppJrD1bc5Wa0ErX/eHYPAyHbjjLz0kjqgtJLSReeadroL71fuoY405s/2aKp
	 Ys0O7iK6AQXFtpJHJWD/vtYbbyqDsaNE0aTmAFQdmIMFUKW7/RhwyaxbDQgye941Ta
	 xxGR3maN27mzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MxSffcwYx
  kg+nfhS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy3Nz4yFRznrLh/6iZjA+Ntji5GTg4hgSeM
  EmemOkHY15kkDq736mLkArJ3M0rcmLacDSTBJiAlceP+fzBbREBfYunsPcwgNrOAisSL3z3sX
  YwcHMICwRLzFuiDhFmAwtfWX2cHsXkFnCQOLX3FAmJLCChITHn4HqyVU8BZoufoEmaIvU4SF2
  63sEDUC0qcnPmEBWK8hMTBFy+YIXoVJWZfboaaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka65XlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg2KYUq1rsYFy/7I/eIUZJDiYlUd7fyzOShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw3
  tgIlBMsSk1PrUjLzAHGEExagoNHSYQ3bB9Qmre4IDG3ODMdInWK0Z5jbcOBvcwcU2f/28/MsR
  xMzvzadoBZiCUvPy9VSpz32m6gNgGQtozSPLihsJi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZy
  DUUmYl3kP0BSezLwSuN2vgM5iAjqruiAN5KySRISUVAOT8YLtmpNX2/zKK/rGtF9KYTNzzXqL
  nRl/Y3dXVsfHcRfMamANudm4mDnY8PH9pbfiWv6Ys/bdfdlU1Bd9wWBh5UbWHoHtF1osSos+8
  muc1VFjOiYd3blr0ZElkSHOGf+3v9zPuezu2oWpQnkaRq0mGlZGeVGXuUtuCN2/uHfbp1h9+f
  tqzqpVbrP8/4eU8LZNXHg+QsooPErTNmPbLAWdjxP4j9dN5mk7VuTFrPZwsewJFZPJ6Vt3OGi
  v14pWfO7ifMRd42TogwM1JzTmMz9kua57u1Lum1X0T8XEr06CzZvjao7Gzb+/6+S69z2l77f1
  RU+IKNNOPbaA88jV8tWhKWGPtE++Dw6890drY5sSS3FGoqEWc1FxIgCxkgJQdAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1667809742!262914!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25746 invoked from network); 7 Nov 2022 08:29:02 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:29:02 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0E30C1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:29:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 01FFA1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:29:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:29:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.10.09 -> 2022.10.30
Date: Mon, 7 Nov 2022 16:28:23 +0800
Message-ID: <1667809704-30790-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
References: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99445

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.10.09.bb => xfstests_2022.10.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.10.09.bb => xfstests_2022.10.30.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb
index 4965d0586..19e16c591 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.30.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "3b5cb74c03312b5ac3349a0759c8d32bb9d0dada"
+SRCREV_xfstests = "7d839ccc1a13148d1a41d32fb9be83a0c8d31496"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


