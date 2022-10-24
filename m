Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA1BC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 05:51:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.16207.1666590664528757359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 22:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v61vBCjx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666590662; i=@fujitsu.com;
	bh=ETu6FbLJM6ZN3SN/jfIvVFPFWWYN1grhEsQyw/78POQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v61vBCjxjtG112pSQFGQlaPW14rMxUvN3wluKr6dT3p3JPSs5uovkNQj2Lzyg//uy
	 1fLgEUg3JhLsropBWrTR9HBOeJPIDPZLtNlZLmY4I4fETlFLcIwWbMAgjRku3hNG7P
	 tMrXMFq25+YuQv2y3LEF1PuTuICDb8DJJY9P8euozkxR/ApxgB+mpd07rijoCfJouY
	 Ojmquz6mqJX4SUhmEEhBX2wzEkKEeXVBolm+wN2Bj2EHYDt6qMQnsiryNL8+EVsbzu
	 NtXeWZErO0js3z2TDuk910hf8K3/z0+sPMCYDn5MqU+PhZed6pv77/s7uPeG2PI+CI
	 eZ7+W2cXzNcvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8OxWfeYeli
  ywZctwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bD+kaWgtWcFVt6vjA1MG7l6GLk4hASeMgo
  8ePQLhYI5zKTxOqNt9ghnD2MEo0nTzJ1MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIvF79ncWEJtFQFXi+K9GsBpeASeJrv9vwWwJAQWJKQ/fg9mcAs4SS1ceZQSxhYBqNs
  zbzQhRLyhxcuYTFoj5EhIHX7yA6lWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNfIQC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHxTihmn7GDsWfZH7xCjJAeTkigvg3hYshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  pPKQDnBotT01Iq0zBxgLMGkJTh4lER4L4KkeYsLEnOLM9MhUqcYjTnWNhzYy8wx82vbAWYhlr
  z8vFQpcd6zKkClAiClGaV5cINgMX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvfJApPJl
  5JXD7XgGdwgR0yqUVQSCnlCQipKQamGZOPVK99+D9w/EsAjzqige//5vG80De6cju3MvTsp53
  LHrcYvPZ80Hyw0SjzIXVLZvMNW/7/18hZ2qq8P7y5iD9z+0VRm/eiGR4yqw2tUza8OZa049U2
  Q/LXpyW6Zz+O2ffAr7VVzSX23ttD97UEh1TuXxd08KHT2aHv3DctWTC+e1M7NnMj3/W3auQNM
  oOVdpuIHFK4pLcq4mPe/a/m+Ow5Ij2ele55qdt2y6Es9lbr9VdkSJ95FPMvWuq1stnMhxneDD
  Nam3U5A3RzG8WNmZe2qGTKxnJaTJdxuFR/5WVL7gCpcKDXld3KU2c4R6af2LH42XbrYykhTxl
  b0z6f3q31gZJz1QdEVPD73/8zk5QYinOSDTUYi4qTgQAO58Om2wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1666590662!194312!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3226 invoked from network); 24 Oct 2022 05:51:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 05:51:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E894C142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:51:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DC18B73
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:51:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 06:51:00 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] makedumpfile: upgrade 1.7.1 -> 1.7.2
Date: Mon, 24 Oct 2022 13:50:32 +0800
Message-ID: <1666590633-27850-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666590633-27850-1-git-send-email-wangmy@fujitsu.com>
References: <1666590633-27850-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 05:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- LoongArch64 architecture support
- Support kernels up to v6.0 (x86_64)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{makedumpfile_1.7.1.bb => makedumpfile_1.7.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.1.bb => makedumpfile_1.7.2.bb} (96%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
similarity index 96%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
index eb004c2ed5..1c3538a3da 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "74bbdd14ec861552ace1ca63953eb2ef73e1f965"
+SRCREV = "9fefc6848d0b3765760e709cfe92fb9d76d5d452"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.25.1


