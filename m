Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F75ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:46:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.67468.1661755601178978993
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=orHNLWZ4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755599; i=@fujitsu.com;
	bh=hT1t5USU1+9Hs4SunXM2g1VpKmHxGBuSU9ileHMzWRw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=orHNLWZ4g/U6tMSPgdzwieAVDtiGkO28W1eYbvJxCr5akWoLIVX09vHmCT91aocuD
	 edBNG7urXgdMp+ZHyCrzHOFzDBxT+fH5LcxZVbvE3A7iibRORChWa0HoqP3CJOiZFj
	 st1sbUjtrK8wZoTE2hkHyaS08pns0hdvL+W9rmiz1fenHI0V3O/uZYKxNT8jnGQmCa
	 YrMjaVUHME+e3S3408aco7FAQ9U8SR2G/lBfk9IN/+3/IRjVBrtGapMqVUxZcp5X6q
	 jISWp+wzlYEPRpHrI5K4+6TDyYpdAP+cw1lY7G2ASzSKnaJd1v5KHw07t1viM+5jHt
	 2SJbSnLeue3Fg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWfdcAk+
  ywdJ9ahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b31f9YC/ZzVky51MTUwHiYo4uRi0NI4AGj
  xMEPM1khnCtMEt0nbjJBOHsZJb5N6wLKcHKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CVxfdFxRhCbRUBV4smLCWwgNq+Ao8TdX1PBeiUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0rsmdXPBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVom1SUmZ5RkpuYmaNraGC
  ga2hoCqSNgbSFXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmBwphSnl+1g
  vLrvl94hRkkOJiVRXhNznmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryOsUA5waLU9NSKtMwcY
  KTApCU4eJREeC+ApHmLCxJzizPTIVKnGI051jYc2MvMMfNr2wFmIZa8/LxUKXHevHigUgGQ0o
  zSPLhBsAi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY91Ac0BSezLwSuH2vgE5hAjrl4RJ
  ukFNKEhFSUg1Msh7N3CnLa5NURXc+vD5bI6tsWaTIO4uMi2rPHf2530d878tzVzY7vVjWf5FJ
  M4u3s7vc3YIJYm7/o4UezclTf+BRWFHFm6VvcOBNcOACDh/TeW0zHmkHvWW0ULxvxP415v/cn
  Y8mz9ncn9X14lFRseU9rrVWN7fd0V9UW7inVaFy2utfR8KXzDAsfd997/ylecl+7Lt2xLb6bj
  VnPLjzWC+7QJ+TxFUu+YR62WvnJ7kwGLH7tX7Z4r05d/sf25wS3R0P/qs+YD2ave5XUvZVNen
  kML2fGwvj0o60XuQVk4yvu8Qc331ZptAq4LG9Xt2Dokl705yXbdkd+7y4KaZj7a23c03Omoef
  i9pXGaTEUpyRaKjFXFScCAASGmN8WwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1661755598!140640!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3482 invoked from network); 29 Aug 2022 06:46:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:46:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 110A47B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:46:38 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 042EC73
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:46:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:46:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsdump: upgrade 3.1.10 -> 3.1.11
Date: Mon, 29 Aug 2022 14:46:24 +0800
Message-ID: <1661755584-4872-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98510

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsdump/{xfsdump_3.1.10.bb => xfsdump_3.1.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.10.bb => xfsdump_3.1.11.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb
index fdaebbe02d..2e5977cce7 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.10.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.11.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
-SRC_URI[sha256sum] = "9aab7a53aa05cd46edc97269ebf1456aab2b60ab8c1fffaaf8aa492f0b5f6517"
+SRC_URI[sha256sum] = "5657a2ca26a55682dc9724fb0331c860fe362c778225cbfc8c710f1375f458a3"
 
 inherit autotools-brokensep
 
-- 
2.25.1


