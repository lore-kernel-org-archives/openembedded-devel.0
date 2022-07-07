Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B82C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:59:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.2736.1657177162837053387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EHzAk/fv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177160; i=@fujitsu.com;
	bh=v5OsFt0F/g30oqS1abeYqcM9V+Ffl7sqi1PUk0W57bU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EHzAk/fvEO/Tk1Z6a8OSh7o1s6zXVY0PhYGKp08YmSNnXTv/VL9PX6+iiJvEXWERB
	 +XkvMVbNqw+dtnl/rwsgajTSslzBLK/eYjDQGFO3tw7539QXrtCt0ms2kvyY6r1z6t
	 /NqqMPEUee2rfY/7SfEiFMlQ5LT6moqNkWEF3gLxyNOfHbqnOGdJpfPQpNZcv3PJCK
	 WBA8NBb4T3N+t41Z9Wgmk/c/1ekvvpvdZptfzA5dBFkpK8pwUDP6BQSn1SGpjl4HEu
	 SZsCiQNuDgCazSUho8au4HDTI1DQ31cFngA0CtLeTivzIcfg2yPRGpS46SB+ZK+YyS
	 s9NsGXXlGaNtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpOvRciz
  J4PE/AYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWN17x7GgtUcFSc3PWJuYLzN3sXIxSEk8JBR
  YsXbS8wQzmUmiRuX17F0MXICObuBMsvUQWw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBawk5q1aAdbLAhRvmPaQCcTmFXCSuLjgBZgtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtCYsaMbWwQtprE1XObmCcw8s9C0j4LSfsCRqZVjNZJRZnpGSW5iZk5uoYGBrq
  Ghqa6lma6hmZ6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGZUpwgsINx
  775feocYJTmYlER5veqPJQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4OVvAsoJFqWmp1akZeYAY
  wQmLcHBoyTCy9gMlOYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK890AaBE
  AaMkrz4MbB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeL5ApPJl5JXBbXwEdxAR00LL
  8IyAHlSQipKQamGb83BJwhf3678iWd1N/qz/4LSq7PpM9vyOg3H+9d8O1iKt8v6/3/zKdvLGm
  VzFRrqrM6f0pH3vdVxNkVTNfz3zfpn+tU5aT602aDptbwcQ+ztNNKy4v4bwhXNp3//nL84c+V
  XuYP5q7d/YXpvstsYHXWqbpXjBkizhZ9XnNrzJ/rQNBrUI1jdfj3Q45M8toMYdlxi3WW3fql2
  LFFWvOcsH0XapGs4smHp4uceGP9rFwq1sVrtpLHuvPv3HO6viGZ+4/eqJ0d9nUMJyt3R+ncXX
  pe7lTwd99rn/iaXgtaHrCd6pzK4OX7bwrrZ7LOC2XV/iZbY9ZqmfVV6SglLaV6S7Ds5s+J7Vz
  mu9OcpX/o8RSnJFoqMVcVJwIAKeB9qpeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1657177159!64952!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17954 invoked from network); 7 Jul 2022 06:59:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 06:59:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AD7A61B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A1D167C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 07:59:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cloc: upgrade 1.92 -> 1.94
Date: Thu, 7 Jul 2022 14:58:53 +0800
Message-ID: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97737

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_1.92.bb => cloc_1.94.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.92.bb => cloc_1.94.bb} (86%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.92.bb b/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
similarity index 86%
rename from meta-oe/recipes-devtools/cloc/cloc_1.92.bb
rename to meta-oe/recipes-devtools/cloc/cloc_1.94.bb
index 766d34f69..2f92d8100 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.92.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
@@ -6,7 +6,7 @@ LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "73570f9da159fab13846038de7c3d8772554117c04117281dcbe6e5c7b988264"
+SRC_URI[sha256sum] = "08212290c4e9b21c7bb1abc0a9b4a365ce1c5eb0d8f3ebb74d50b29559a71a9c"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 
-- 
2.25.1


