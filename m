Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEA3C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6270.1640012545502530132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hSNYlQbz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012543; i=@fujitsu.com;
	bh=ivHkU60uHMFbit1Qa7kwwgebXbpYQoxiBSxvdRlCk/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hSNYlQbzVGi4XxUBXIHfJYmz+slwqwf72TWbfKSKu9cmi73kXdkMNE1wUNvI5WBMo
	 edLl0kEazXzeYT8mhVbYLy+fDJa3sv+D9bdUGsl1kT7G0yCCmqA3jssiBxwLytPT7m
	 skfPy9zdjg2FqZTMedvZCK/m6idlQJVs9lYgwzzblz4G6bUSWVT64Ijbtz3XnLGybQ
	 lktSKxXFcTpmjAE5dEqPa0wLtiUBh0v8Gpn6eUbXeahG02k/B9zj8DEkDAZntKEu0u
	 7+qRlHQxr3BLm8U7jWQi/HbrSKRziSwoFBBWAtOv2QwpXzeK0kk59laYWC03nMHsRq
	 dIE1fDyZf+8VA==
Received: from [100.115.32.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 42/14-23453-FFA90C16;
 Mon, 20 Dec 2021 15:02:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqPtv1oF
  Eg1tzrC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxJ/yYyFSzhqPg8bRFzA+M59i5GLg4hgSeM
  En0tv9kgnAtMEo8vX2KBcE4wSvy5/Y+xi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBW4lNrTvB6lkEVCXeTTwEVsMr4Cix88hrsF4JAQWJKQ/fg8U5BZwk1k/ZBWYLAdVs23
  iCCaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xha6hkbleYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgIKcUq9XvYHyx8qfeIUZJDiYlUV5+3wOJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4f84AygkWpaanVqRl5gCjCiYtwcGjJMLbBJLmLS5IzC3OTIdInWJUlBLnjQPGopAASC
  KjNA+uDRbJlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86aDTOHJzCuBm/4KaDET0GKl8P0
  gi0sSEVJSDUyqX3yajxn77BB70iz+eaOjyyIV0+nvVe0Kjl8UEljy89KbPf2vjlxJPi8sf1a5
  qPBd3LOvZ7YxlBQ2Vs8q0DJ1FzD7sDfTY9GV9Lq0wrKod0e5XMMTZlhYK4hOqW7fnnpEX9B/p
  S/rZIYteinL3/G8ktpkrxz7a4/pppjJ/C73O0Qm2l2Qvrt/lbRpokxt6c6/6+w6F55nPLc1dG
  6srOYH5QerDH4e8DcvYT7HufFiibLjL7nZFREr9/27Lx9v4ucnckfD7p7A7uri1JxCzpvnr74
  S0LPN0PogfWazoST7YTarEiOGl8LHD+f+MP7S3NoT13C5/bXgVBGP38pGDQuvdSkttpp2Qle3
  9/GJA0osxRmJhlrMRcWJANKlCQRfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1640012542!4841!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22392 invoked from network); 20 Dec 2021 15:02:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:02:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9587D100248
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8A0A5100239
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:02:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mpich: upgrade 3.4.2 -> 3.4.3
Date: Mon, 20 Dec 2021 23:01:48 +0800
Message-ID: <1640012509-3594-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012509-3594-1-git-send-email-wangmy@fujitsu.com>
References: <1640012509-3594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94445

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_3.4.2.bb => mpich_3.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_3.4.2.bb => mpich_3.4.3.bb} (95%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb
similarity index 95%
rename from meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
rename to meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb
index 1fa916c0e..52648eb18 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.3.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5c19bea8b84e8d74cca5f047e82b147ff3fba096144270e3911ad623d6c587bf"
+SRC_URI[sha256sum] = "8154d89f3051903181018166678018155f4c2b6f04a9bb6fe9515656452c4fd7"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.25.1


