Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D57C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:15:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.6996.1651130149594186711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eRtEo9vk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130147; i=@fujitsu.com;
	bh=G1rQ/k7zSFw6j46LS+A4fDv9E2BK41j1OzkeDV20/oU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eRtEo9vk8BtEphOCtT8EscLYphYo1j4V/5puVqsdR1yv56LPOd1wocTG/mdkCh8KO
	 BByNgE1gCJ+7v4G9SY9cTnxdF0Z/KHzKPQ1eo3AbY2PrRH5nyEAYXTFcwOHYgTxPL1
	 h7jYtYDMbiz1Rk4ijmnbuJkp4/CnJUwp66FfHiqcZPphwpdQeYvAVFscp3RRXR/z/U
	 5C5Ux9zb4LtTx37Ql5EtgurA3WBAWoj9BQaPt//eyum11fsPnuPeQGGdlRatMpzM1Y
	 qGzQk7ngcqyV+3mFT/Kx7BOpzqrsI6g2uv3F0Sxk9q+CDeGrEKXV2gB+VHjIIgdTHL
	 MucXWBfKB9/tg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8ORqKtsn5V
  k8LJV2eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzZi+ew9TwXHOigPtV1gaGB9wdDFycQgJPGGU
  ON9ziBnCucAksfjwDyYI5wCjxPam6YxdjJwcbAK6Ei9+LGYBsUUE9CWWzt7DDGILC/hIrFq1E
  qyGRUBVYkfDebAaXgEPiWcfrrCC2BICChJTHr5nhogLSpyc+QSshllAQuLgixdAcQ6gGkWJ2d
  PlIcorJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWibVJSZnlGSm5iZo2toYKBraGiqa2a
  ma2mml1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMwZRip4QdjI/6fuod
  YpTkYFIS5bUyzUoS4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrZAeUEyxKTU+tSMvMAcYDTFqCg
  0dJhFfGGCjNW1yQmFucmQ6ROsWoy3F34d69zEIsefl5qVLivPdsgYoEQIoySvPgRsBi8xKjrJ
  QwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4WkEt4MvNK4Da9AjqCCeiIlUWZIEeUJCKkpBqYSjq
  sek+8ybWfwmTufVQ168BzxnJr3o9aq2VlW/981CtdYBrDy3CtJGH6N9vshh18MZ//bQx1vpjy
  SWTjpComb7uS2pWC/lOdKvMXVQdv/fHz5J12k5pFunaVi3WU123xzfarn6b3dsGZnQlTDmVHW
  fjkzT6b331kcXfuZ5/wL5eF3SI2Wi7n6gyo09rRs/mm5BOxWe982U/oHEpzVtUWu2T/VkWf60
  ya8pTde4yrQ8pZlQQP3Ev9//l4xwOdKsf9ZTleK84l1+Z+mrx1ao7Uwj9rv/NwrDyw5KRN74b
  N7Um2n6dsun5MeOWEE5mOP9/8lbjFMjdA33LO5Mv3dvX0aikJu7jm1iRsunDlQcwWJZbijERD
  Leai4kQA47MV+UgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-528.messagelabs.com!1651130147!26503!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14913 invoked from network); 28 Apr 2022 07:15:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:15:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 17B73100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:15:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0AEB2100189
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:15:47 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:15:35 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.13.5 -> 2.13.7
Date: Thu, 21 Apr 2022 18:00:42 +0800
Message-ID: <1650535242-15530-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:15:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96837

Changelog:
==========
Fix a crash caused by using the new config from 2.14.0 in 2.13.x code.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pylint_2.13.5.bb => python3-pylint_2.13.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.13.5.bb => python3-pylint_2.13.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb b/meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb
index f64d976b46..0aa645c82a 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "dab221658368c7a05242e673c275c488670144123f4bd262b2777249c1c0de9b"
+SRC_URI[sha256sum] = "911d3a97c808f7554643bcc5416028cfdc42eae34ed129b150741888c688d5d5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


