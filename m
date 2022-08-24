Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17959C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:00:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.5820.1661302827306894981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oAq58edq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302825; i=@fujitsu.com;
	bh=cR0FcHDTIHelFcLaC0IUBRq07nJc250uB5n3LdXO1GE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oAq58edq0UKpBAUGhlkWaU4xLRLLvbJWUKWb7Wb/Xeaj8Adamxm5FeJzrbTm3fk1M
	 bgfKQZeYMw/MGltW6gzqSAQNgJ3psmytb84BjvVh8rEk4wqlVWZ7y32KUrQGdZwHoH
	 ZarfdPNSADbnSIPzNMWv3KWs2KDKMbbRPJYbNCeKASjwruccOaV37UD4tn+5VTemr5
	 qOd+GFgrKVcsLJL8xpCJ9xg3DXlFzjfgDmaoPhMcZFcCHeUzNvhrDcEr5uAoKztSVC
	 OvYCzes1qPPHi8mZgjNu5Vxlni80Z1gNr3MPH2TRKdOpb3IgcDdodC/oA1MLAzAEME
	 rpU11uWNi1NmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpKtZwZp
  ssGSBhMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFs60vGgkusFVvOijQw9rJ2MXJxCAk8ZJR4
  fmINC4RzlUmi8cM9ZghnL6NEw/LpQA4nB5uAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuYQexh
  QUcJN582ccCYrMIqEosXPwWzOYVcJKYcegQI4gtIaAgMeXhe7BeTgFniWcPjgDVcAAtc5K48l
  sbolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdKbFnVj8ThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNVUlFmekZJbmJmjq6hgYGuoaGprrGlrqmRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuc
  k6KXl1qyiREYwinF6iY7GLtX/tQ7xCjJwaQkyntNjDVZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvbTlQTrAoNT21Ii0zBxhPMGkJDh4lEd4VaUBp3uKCxNzizHSI1ClGY46rV67sZeaY+bXtAL
  MQS15+XqqUOO+aMqBSAZDSjNI8uEGwOL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3Qgn
  QFJ7MvBK4fa+ATmECOiVoNzPIKSWJCCmpBia1lavX/v2XntYdtXSPzCGprP5bbHoPRWXLbjoa
  rPZkn1ul/KCO0enLx4SNlxe8ZHkm67zn+i72ojNn25qe7H7hYpQXd+9mqeTCVBEttuR47Y9nJ
  9x6YVRisyvBpE/4xzktMwbRsw859pQcX/tcVKWtaZL+xqmZG39+3ZiW6vusU/RUvdx7h91LmN
  +/0j4mJ768XIPpqMJbFuZm0VYRk9yYi0vmi+9yurR/lQPftsUXJN2Fwy+n+tzddndi5NydLUK
  ps2VsmZps/99OsUxXS69m9GjbdlhfaNeKqxoTtxw/8jz8XcONInOWg9c2KgtPKGduPf3eVHt/
  9mrpjI/hYq7TN7QGtJ00mHlcbPLT2c1KLMUZiYZazEXFiQBEL2HxbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1661302825!2087!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21350 invoked from network); 24 Aug 2022 01:00:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:00:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1FB6D1AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:25 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 13BA91AB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:00:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] spitools: upgrade 1.0.1 -> 1.0.2
Date: Wed, 24 Aug 2022 08:59:53 +0800
Message-ID: <1661302793-10559-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
References: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98407

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index e1b9302a98..9dfb23cc7c 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -5,8 +5,8 @@ LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 BPV = "1.0.0"
-PV = "1.0.1"
-SRCREV = "87da3bfc03f3088e2e880b6b48195bb225fafeac"
+PV = "1.0.2"
+SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


