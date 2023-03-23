Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B375C76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:13:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.65751.1679548397935149650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M8e+gHIW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548396; i=@fujitsu.com;
	bh=je8Dg0VCeSICovjQTFzb3v1Z2ldZZmNqCC5IZhmUaY0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M8e+gHIWQR0jWaLPYCuAEKKOt6WmqSrolayFFkrAm7eqUyMp7XZYtYQksdwIokX9e
	 SSbtwpzZoS/nMS3G4Sl5z4v3MJ5IqQ8XifUm4l5l1dU6R0+n+I93VW5/Fap7cxW7op
	 yFdwwjI5dxcJWssB1goSAQqeCwdXCTTOVr9ckWYCYNwtGCgjAVtQvxHZAfUYyHVFB7
	 cQG9bQYi3eP/Y+xRtE4rAAkedo8vcspgcIHH3hOmQ+f4eVyCTKq8q8dWhIAPc9M/0C
	 N6owwROPwTh0zg9/Sh/jFJLtKOzI5oYLWQzyBzvOuGMOA9fgvFIVNKCQiQfv5IPyr3
	 3i2i0B+I26FuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWff1fek
  Ugx2/zS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owTU6eyFrzkrfh9/CJLA+Mmni5GLg4hgYeM
  EgvWrWaEcC4zSVz83ckC4exhlNj6th3I4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBXYs+sPrAaFgFViT93u8HivAJOEs27/oLVSwgoSEx5+B7M5hRwlrjy5CLYfCGgmufbp7
  FA1AtKnJz5hAVivoTEwRcvoHoVJWZfbmaBsCskGqcfYoKw1SSuntvEPIFRcBaS9llI2hcwMq1
  iNC1OLSpLLdI100sqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN6UYoYbOxjn9P3VO8QoycGkJMorESqdIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV+AOU
  E6wKDU9tSItMwcYSTBpCQ4eJRHeuQeB0rzFBYm5xZnpEKlTjLocHw5d2cssxJKXn5cqJc67/B
  5QkQBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMqwMyhSczrwRu0yugI5i
  AjoibIQFyREkiQkqqgWlBQfGsFS3ZpteXZsj51x/YV/jm+uVDpTsn7mv3nfjFO+BGSNSx8vn/
  Xh+NXv+yqaL98yyD6l05N+55LfqWcuPQOy4OHpm2osIXl0Wq107g/Rk1s22p/RPj4FwX+8xtr
  WtnTf55qMB5gRu/rJDZpMcZd51myEWJW53d5hvyZOmafQt/zbRd+XPHlxsVMquWLRNaXXpLZj
  rDlbYHTXo70/2vXvX2lNn1W9VqbduJnri9SQe1lhczPOvtz2lbeKGJ7VaKOX9h43opx3kP+dL
  X2Um9uyZZ+az9dILxp+aGTKam4+ExJakTRbPDT0VHrX/hJ2p7YsqXf7Z1vVHNJ+dbMti8XTTF
  qaZ6Tg9jkKj5UgElluKMREMt5qLiRAB7MCP8ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1679548395!141147!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27086 invoked from network); 23 Mar 2023 05:13:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:13:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 848E8150
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:15 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 77DB17C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:13:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.45 -> 3.47
Date: Thu, 23 Mar 2023 13:12:51 +0800
Message-ID: <1679548374-20397-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
References: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 displaymode: Update description to describe behavior
 network: Move new options to Fedora 39
 Add conflict test between ostree sources
 Fix missing seen check for output generation
 Add new ostreecontainer command
 Check the conflicting commands automatically
 Fix tests for conflicting commands
 Add conflicting commands support
 Fix handling of package section arguments in older versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pykickstart_3.45.bb => python3-pykickstart_3.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.45.bb => python3-pykickstart_3.47.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb
index b1f26d01c..64a11ec8b 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.45.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "6bd4bb5f411ae98f4d01958534ff937f59c8b2c3"
+SRCREV = "fa2f233f735a082dccaf03c234238f7d8ce93fa1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


