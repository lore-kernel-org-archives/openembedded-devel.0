Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF02C77B78
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:21:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.42786.1682306509922091098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KEBEN2j4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306512; i=@fujitsu.com;
	bh=2zUNyj6/KUetv9S/tjQOdHWFJa3KGASWsoAiIXv0HXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KEBEN2j4hwyO1saTq0NWbt0OkWyd/eXfgyS5pIYpXqyDKkb5bySvs5DyWS6yKT0OU
	 kEYGVWn4iWA9CU7NhJ/wYvMtZVwPiSQCJYRxRjYENEIN79u0V2BMWymqnnPBuIbTU1
	 h5r/BrngICuSkhhBONdUdg2ZJZQC9jZYjyiA4tg6rS8dKbdysP4vePJEz+NfDx8ftY
	 4ZYl3IYEyNkKErFtNVHlbWIyMRhY6uKB/LnVRXNBNWaeoqOvmcPC9Oj+NhGOEDh/XH
	 1PRRQhyRvy4Gvd73bB4bcPVwKwcF/FPiY2YDU9JYFNb6LMPS2nLCIw9L4UuJofW0FE
	 wcISvCbpvz6Tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSffCV9c
  UgyeXmC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozuqQtZCo5yV/T+3MnUwLiZq4uRi0NI4Amj
  xInDDewQzg0miY+vLzJBOHsZJd6em87SxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAuUTL6QdgNouAqsSe3ftZuxg5OHgFnCRevVADCUsIKEhMefgerJVTwFni3crjjCC2EF
  DJixmHweK8AoISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYzYpTi8pSi3SN9JKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM3pTh50Q7GIzv/6h1ilORgUhLlXbLBJUWILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBG/RJ9cUIcGi1PTUirTMHGAkwaQlOHiURHiXfQFK8xYXJOYWZ6ZDpE4x6nJcvXJlL7MQS1
  5+XqqUOG8gSJEASFFGaR7cCFhUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCv5AWgKT2Z
  eCdymV0BHMAEdsYvbBeSIkkSElFQD06y5n7cHTi0TveSwLeejX6MR4zS2HSrhszg/u+Vv2bxa
  XdlqigOftZM081omHekkucpO/nVi9k2aXk225o3Gc80+bf/f03B37Zlp7JsSLOPd5PiTMmyaT
  TbPjXX7/iZ0w9YGphepi0tZz7NtlT+4oXr1t4BTGbsP/JRr7tJizl47X9pr3qodBtOjf/Ms4t
  blqOROeVihHJTvz3lBUmRfSeeKVH3mLSeEju9r7u2a9mqa5/sdc8zueNu3W2g55W6senT4zt/
  +S/1Pm+NedW3OyFB/s1i0d4HY10v+xo0G/oX/Ck9OeLf0oFV7XNY9BaWKJkY3QS2x+6s5bn46
  IyvJ2+Hr+NY+X+u0Q0zWsb1KLMUZiYZazEXFiQD0cYdQZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1682306511!288746!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23817 invoked from network); 24 Apr 2023 03:21:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:21:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 78CE210032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:51 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6CD5D100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:21:49 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mbw: upgrade 1.5 -> 2.0
Date: Mon, 24 Apr 2023 11:21:25 +0800
Message-ID: <1682306487-11783-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
References: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102156

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Update spec file with new license:
 from LGPLv2.1 to GPL-3.0-or-later

Changelog:
===========
Merge pull request #17 from raas/add-license-1
Add LICENSE, GPL v3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-benchmark/mbw/{mbw_git.bb => mbw_2.0.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-benchmark/mbw/{mbw_git.bb => mbw_2.0.bb} (64%)

diff --git a/meta-oe/recipes-benchmark/mbw/mbw_git.bb b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
similarity index 64%
rename from meta-oe/recipes-benchmark/mbw/mbw_git.bb
rename to meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
index cfdcfeb9b..bb8c4625d 100644
--- a/meta-oe/recipes-benchmark/mbw/mbw_git.bb
+++ b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
@@ -1,14 +1,12 @@
 SUMMARY = "MBW determines the copy memory bandwidth available to userspace programs"
 HOMEPAGE = "http://github.com/raas/mbw"
 SECTION = "console/tests"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://mbw.spec;beginline=1;endline=10;md5=34d71e08e6337a8411d82d7dd0c54fe2"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://mbw.spec;beginline=1;endline=10;md5=9ead6bd5826678fcfe229a3cf7257c56"
 
 SRC_URI = "git://github.com/raas/${BPN}.git;branch=master;protocol=https"
 
-SRCREV = "d2cd3d36c353fee578f752c4e65a8c1efcee002c"
-
-PV = "1.5"
+SRCREV = "c3155b544a5065e8235508059c6512af6c46bd4d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


