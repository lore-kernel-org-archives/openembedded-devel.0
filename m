Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC6FC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:53:08 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.4975.1645602786539151993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n7wEk5Zp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602784; i=@fujitsu.com;
	bh=oC41wO/8FhhjXsOOHv6w4KtEBs4XCpwdsDkODK4SBIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=n7wEk5ZpJiI4VnwNLoU2sj7WO5oYzGALXUrmBb7mwIGNFPhFl+Wjz2scF9wjmjxnL
	 5oYdAKwkIAs39sOhgopDm02qx71LCsApQAgHgDjLqHBqXHMhvrSiHeb2T3Yry7031E
	 hffioCHtBfEZQspJpTVNaqMpY82JCmhihx05jdiILeC1I24AUcuxTmjeYNCUeLb4iO
	 4Io2P1SxCF9epmKqlBrgb2EJB2fAUvuIU9Tzlt3Z1D6XRPsNz8EurK4t0nfWQZiGTL
	 IDsFL4/CubTIHaz1SW9R742EHUNHUFr/d5rgWhjJ84DGQbOu/6m9mhxITZfNsBIpEZ
	 lRHvP1bqOuw5A==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 49/F0-30582-0E7E5126; Wed, 23 Feb 2022 07:53:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MRovvguWi
  Swb8eUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNi41G2gnm8FfMvnWNpYLzE3cXIxSEkMJNJ
  4nnLfWYI5wSjxMlbv1m7GDk52ATUJKbfugFmiwjoSyydvYcZxGYWUJF48buHHcQWFrCR2Lv6P
  FgNi4CqxLSHP9hAbF4BJ4nOB//B4hICChJTHr4H6+UUcJboXb6KqYuRA2iZk0TTthKIckGJkz
  OfsECMl5A4+OIFM0SrosTsy80sEHaFxKxZbUwTGPlnIWmZhaRlASPTKkbbpKLM9IyS3MTMHF1
  DAwNdQ0NTXTNLXWNjvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5xZW5yTopeXmrJJkZgYKYU
  uyruYLzW91PvEKMkB5OSKG/hEdEkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8fU+AcoJFqempF
  WmZOcAogUlLcPAoifCKgKR5iwsSc4sz0yFSpxh1OdY2HNjLLMSSl5+XKiXO+/0eUJEASFFGaR
  7cCFjEXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCvyDGgKT2ZeCdymV0BHMAEdMSVLCOS
  IkkSElFQDU+dlrmNzTBQ/9TRa6irMPqpqlBVayhqXaHbG/9YeUwvend7ycSbrymuir6pp5PWe
  ehu7/0hk6r2jpk4n+E6bhzmuMfnOqv9w6dXjzKIqRzecfnRH/BFz+xaGE/EhLybkRyq7Tnh6y
  mfdu45TSbtyjVNES+1erPzLK7hII2amShX3vMdK3186FpUK8UnLnZTY8IRHr1hik2utmKzl90
  37jd2u1Zw6zKxhEjZhsnSWhLeItpbbyilPtVPec0hK8G9OZbwQazLrTZp1Ap+hYi7XvweCijd
  mbctu8V1r2OjRptH4bOrbLwo8ZkFvD36fxn/kZy/HSoXTZsHLLuop9W76liW/rz1jGT8Pt6/U
  tQwlluKMREMt5qLiRADR5u4uUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-545.messagelabs.com!1645602783!62283!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31923 invoked from network); 23 Feb 2022 07:53:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:53:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N7qwWZ017790
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:53:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:53:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 2.0.1 -> 2.0.2
Date: Wed, 23 Feb 2022 15:52:47 +0800
Message-ID: <1645602768-28412-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
References: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:53:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95474

Changelog:
=========
- Okay, apparently the stddata addition is causing havoc (who knew how many
  scripts just haphazardly hand programs random file descriptors, that's
  surely not a problem.)  Going forward the stddata option will only work
  if the environment variable STDDATA_FD is present or set to the descriptor
  to produce the JSON output on.
- Fix HTML url output issue. It was definitely broken in the 2.0.0 release,
  and this should normalize it with respect to older versions.
- Update MANPATH for OS X
- Fixed an error with * in the patchmatch code where *foo*bar would match
  *foo alone.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.1.bb => tree_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.1.bb => tree_2.0.2.bb} (86%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.1.bb b/meta-oe/recipes-support/tree/tree_2.0.2.bb
similarity index 86%
rename from meta-oe/recipes-support/tree/tree_2.0.1.bb
rename to meta-oe/recipes-support/tree/tree_2.0.2.bb
index 9e1e787f10..ec68db2456 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.1.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "e3339c5a194cf6b4080f15ec59faa3679f02d5a793b2147912fbfcfb4cdf2239"
+SRC_URI[sha256sum] = "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


