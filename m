Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EC6C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:45:35 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.15804.1668843926395435621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zaia4PhN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843924; i=@fujitsu.com;
	bh=It0PHI6sqigFmWFzZkuFGoGaV4WqgQC3SbHfTnMQ2GM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Zaia4PhNBZaE1TS/+qqaGAyytHpIVyoKXYZSUxejYrEZ9p/oXP21wlMy2B3VIsoY3
	 B3HMxu6kvObG2lioGHstWdbjNmpUZt1/wqfk9std5+RYIe/vXp5fxhm/70ibaIPrY+
	 sDc8v7tpQg67objnIvPaehLZT7JAHSQHvC24vOF56vX9iMbi+mlrsOD9jnAsM4Eu2b
	 etGnEK6e/I6SqDEaPJxgMcqkGuTn9VuA8y94b6CtHcjwlOeLp+PZ1fv1pC58leNA+7
	 X8jx0U83xn8FvCMedw3U7J3Mj7c+DtVXwiu8QoXhr+JTsekK7VQ7Qbi9a1inwaYvbz
	 fMQqzSuUphZQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXdyZ0W
  ywfN2JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePnusmMBa2cFRdez2RqYFzL0cXIxSEk8IhR
  YsuldmYI5yqTxL5vtxkhnD2MEue/dbF2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKzGncxkjiM0ioCrx8uUrsBpeAUeJKVcOgtkSAgoSUx6+B7M5BZwkzi+7BlYvBFSz5+
  gHNoh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYymxalFZalFuiZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIHBm1LM5rOD8d/SP3qHGCU5mJREefe2lycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCNa
  6tIFhIsSk1PrUjLzAFGEkxagoNHSYRXxAcozVtckJhbnJkOkTrFqCglzlvfDpQQAElklObBtc
  Gi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6jIFN4MvNK4Ka/AlrMBLQ4x7kMZHFJIkJ
  KqoGJn+fgDC3jnsCsJV7nlXf4BW7e1ZvwsGB78BR596K0QJunP/e4HXZ8aGPgl/l64e+za2T+
  rHv88EJK4Ptr/x9eFHlUzyDR6axdzseucvmU6jsNW2a5xh2S3x6sSFhb8tE4SW/uL5VJ6YImB
  xxfnZ3/tNHe7SrDd9ezZQp3oj/yPDyrbVRkW5IbEJ9sobUnpqJ5Zepdjs4Nu1l6jkn/W+qW5v
  dm73a2Mg6xDI9NZzZWGpx2/HY75MD8BzM1XheLPwpPStbjOOC7s35N4ludTrZWNbkTh0NnOFh
  /nPZMdG6jukfReheumgqNzzMMGVxs/V3uOkhK5kmbGJRtqb7gPJOvqybrlfhXiV8Pjl6WXaPE
  UpyRaKjFXFScCADecNjhWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1668843922!177576!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15763 invoked from network); 19 Nov 2022 07:45:23 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:45:23 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A0DF44B1B
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 942754B19
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:45:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.0.0 -> 2.1.0
Date: Sat, 19 Nov 2022 15:44:55 +0800
Message-ID: <1668843897-3019-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
References: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99633

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_2.0.0.bb => python3-eth-utils_2.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.0.0.bb => python3-eth-utils_2.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb
index ff7caf5bf..da45cc7c9 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "32f50edb14c5be0c4f0e8c2e6117286ccc5dfda21d170f358add554a048398e3"
+SRC_URI[sha256sum] = "fcb4c3c1b32947ba92970963f9aaf40da73b04ea1034964ff8c0e70595127138"
 
 inherit pypi setuptools3
 
-- 
2.25.1


