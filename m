Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A2C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.29496.1652084771653405414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=itYhcZcz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084770; i=@fujitsu.com;
	bh=iF5b2hZ1ysI8DZQgaDDxyW9BM0dBfu1zyNGmX/vLiRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=itYhcZcz5F/qkzTF/CQTGWUshoMs8Tb+8ll4/lD54vC+7gRVsJQEY2Sp36WDqPMss
	 uroVDjTmzgd4eabuaOdx0UKMU4KliFdWriRwkBZjekKV+bOCddOzpEBOF0q+M4dhwT
	 t3PS5rmHaSsHjALOXHUSMbSZDN7M57KnGf5b66w6c1a8Btwrvn1RLuA6uI3vMl3WWK
	 wcqu+DhZ6ixDrdv5ar8sprwXJok+eRHE4f5oz8oBPlwzjAE14h2UHFdISwtQ8u6WAd
	 GTNcUHE8dhK5Tp7RHdEte5l/4v+/KL+nYcFQkioDvX9am3NodpKP//q4TSr3cihqGI
	 wR1Vw1Bv9MWhQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORqKt4oSL
  J4O8GTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePSv+qCw5wVjed+sjQwbuToYuTiEBJ4wijx
  7+UN5i5GTiDnApPE+jfKEIndjBJz/25gA0mwCahJTL91gxXEFhHQl1g6ew9YA7OAisSL3z3sI
  LawgLPEtZWTwepZBFQlJm2aCRbnFXCSeHnqDiOILSGgIDHl4XugXg4OTqD6HYcrIfY6SZw9/Y
  AFolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrGFrqGJgV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAIpxSr9exgPLHqp94hRkkOJiVR3sqmiiQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErwh54BygkWp6akVaZk5wHiCSUtw8CiJ8N49AZTmLS5IzC3OTIdInWI05ri7cO9eZo6/n/
  7uZRZiycvPS5US5y0GmSQAUppRmgc3CBbnlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8yq
  dB5rCk5lXArfvFdApTECnfAwoBTmlJBEhJdXAxLjeKXUbV5vxlfcOzxY49x1I8VX6xfO8+JgM
  R/xWSfG0lIXrrRzCWreWfvkgtu+aSkKGnn+dGvfJkHCG50qfH+301mBLergl9qrurwPpHLs02
  la/YHozwfFhFZfvC4YZtUmvU5IDyv8EBt6OWsAydeX5CzGFzG+mn5llLOkwc5fy085o2ZBF9i
  9ONJ91TOOYyx0hy7Sm+ql08H49v9Sv/Vtvflg+dYrAcn29IpuJf2t2JvY+ZG9R9FPuiZ/urJK
  rI3cgvX1dvP+sT63mIo8lJ0i6fG/l/G7xcGv4TZZDU2zunxK+7+TY5LtzpiOz8TypeZvZp3yW
  9LBk55/3dFKDmVhATH3jFpvatTEH/KuUWIozEg21mIuKEwGYexuBbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-548.messagelabs.com!1652084769!205943!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13909 invoked from network); 9 May 2022 08:26:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-27.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:26:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0724E10019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B00E610018F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:25:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libyang: upgrade 2.0.164 -> 2.0.194
Date: Fri, 29 Apr 2022 16:08:07 +0800
Message-ID: <1651219689-27457-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
References: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96998

Main changes of this release are:

    major yanglint improvements
    minor XPath fixes
    nested extension handling fixes
    other minor bugfixes
    RPM scripts updated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_2.0.164.bb => libyang_2.0.194.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.0.164.bb => libyang_2.0.194.bb} (95%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
similarity index 95%
rename from meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
index 2817be7c8..548dcdd2f 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "a0cc89516ab5eca84d01c85309f320a94752a64c"
+SRCREV = "87375f15159545a87a1e0de200f5d9d67e9091d7"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://libyang-add-stdint-h.patch \
-- 
2.25.1


