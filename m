Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C63C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:44:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.8133.1676879045643029986
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dWvCRfLb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676879044; i=@fujitsu.com;
	bh=3Hcq6/0O3x2gZkGN7tMYwSAYiiITiU6Qdvp2v6huM0E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dWvCRfLbiINwyul97Nqum4qGRyIb+D7xuoWkq8odC0B0JvnPNmwkvmeV0uLZ0vRlI
	 uq37Kgv94n+Kuitfkx8TB49MDx8f5NkunKTwrg1bQ1qo3VxzatIfnHfqg3AtWXd3Ka
	 pD9vgyLlslclCduA69utSS1v+2U3xp9emxt5kOtCle8bG4woEpDTNqR6pJZS+cMedz
	 mpIB5Zcy3RQgDTZiMJrxyqmws3rkwGtmWrD8Cu5gWNfVnNf9m+xCshJ4YUsIwnrGn2
	 oDUQuBzrarz7Wy7FgPssz4ymkbm6cqX4pORbx42PCUFSWLyzeLwhvJfDsmeH/0qMSw
	 qJDPBhyGOcoYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSfewyud
  kgycrdCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyNPSeZC+5wVnR0nWNtYGzg7GLk4hASeMIo
  cejzYjYI5waTRM+v16wQzl6gTOtPpi5GTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBRwkbvUeAbNZBFQlPs/7C2bzCjhJrJ46FcyWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDF
  GjKDH7cjMLhF0p0frhF5StJnH13CbmCYz8s5C0z0LSvoCRaRWjaXFqUVlqka6lXlJRZnpGSW5
  iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgMKYUszrtYDze91fvEKMk
  B5OSKO8m4c/JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4qxSBcoJFqempFWmZOcDIgElLcPAoi
  fBKSwOleYsLEnOLM9MhUqcYFaXEeRWUgRICIImM0jy4Nlg0XmKUlRLmZWRgYBDiKUgtys0sQZ
  V/xSjOwagkzHscZDtPZl4J3PRXQIuZgBa7//gAsrgkESEl1cBUNHmp25t/Qjc/CCTKs82vuG4
  t+77i/WnrmuginXO5JdJRKqvfPv73rmSy5fx1jf97D/VyZgt/nBN7ft1b6XWCkjtWv/7IfVle
  0fbcRgdZnhlecm3mXy37jphcPzWlqzr/svCD0hifyueKLQplnsu+MuludnyWOetm45Olx9pbx
  ZbMUPtz8sj2FUmeHHzW/T576qdKWvXVmOnsOPnvs79Vsgn3zVsH9x3iyGM8XJx+dd4FhxnHZx
  3fUPpioXlH2Knqhsf97RlODhVbT124tIrhx02ZPbLTZKflyjyV3FjCY6zyTfWGFPeeKsNMvdL
  XRXJdu2KX/j58zN6eXzTers6qQpPR5mez+f2UnTNsCx8rsRRnJBpqMRcVJwIAhQ78G0EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1676879043!324712!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18902 invoked from network); 20 Feb 2023 07:44:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:44:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 591071000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:03 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4DA3F1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:44:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uchardet: upgrade 0.0.7 -> 0.0.8
Date: Mon, 20 Feb 2023 15:43:48 +0800
Message-ID: <1676879030-15591-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uchardet/{uchardet_0.0.7.bb => uchardet_0.0.8.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/uchardet/{uchardet_0.0.7.bb => uchardet_0.0.8.bb} (57%)

diff --git a/meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
similarity index 57%
rename from meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb
rename to meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
index 9087c8b29..3e164cc26 100644
--- a/meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb
+++ b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
 inherit cmake
 
-SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.7.tar.xz"
-SRC_URI[md5sum] = "623406dac5c5ad89e40eedd7f279efae"
-SRC_URI[sha256sum] = "3fc79408ae1d84b406922fa9319ce005631c95ca0f34b205fad867e8b30e45b1"
+SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz"
+SRC_URI[sha256sum] = "e97a60cfc00a1c147a674b097bb1422abd9fa78a2d9ce3f3fdcc2e78a34ac5f0"
-- 
2.34.1


