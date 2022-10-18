Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D9DC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:06:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.1742.1666055200068040024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ICpWy5uP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055201; i=@fujitsu.com;
	bh=Ntzg4ZVWp80/AMocph5O9YSAV5o0A8wqrWF2JSOkCmE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ICpWy5uPy7y24XYc+ufZq3Y0hg/SctVuJsoUWK4nuuZrZ6UcDrC1EUBdvomi1N3+l
	 5SQBHf+iU4MxO5JC7l6N4Iz8SSyoDxtEfARzqkpvsuO7CgCkaLt7NfFfPRr/Buh13C
	 F34gVzQGdItU4hB6ZbDWh0Du/4L+ZaSZ2svnP2hiF+OMlkOiYUOrB3bZ1i1VP/KZZc
	 a2NuwDcOV3Y1Mz74enji5PqUqUwwA17y2jzwTAu47qIzOPJCc8efoFdAMRW5odIfOE
	 ZUMjTYPaa3/H64NIX0WoM0gXv1LDlTr/IEmdzpCpAxnElRrDlN9KrBNtYZQKxCt8dt
	 uKVnuT6tmtCGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqKvwxzf
  ZYHOfocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGirZGxYANHxY91X1kbGO+wdzFycQgJPGGU
  ODzlA1sXIyeQc51J4t/JeIjEHkaJ+Y87WUASbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwv4S6xcfZOxi5GDg0VAVWLtjSSQMK+Ao8TzbdfBSiQEFCSmPHwP1sop4CTxr+khM8ReR4
  mJlxawQNQLSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0LU4tKkst0jXTSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3JRi9oIdjDOX/dE7xCjJwaQkytsxwzdZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gRvxw+gnGBRanpqRVpmDjCKYNISHDxKIrxRZ4DSvMUFibnFmekQqVOM9hxXr1zZy8wxdfa//c
  wcy8HkzK9tB5iFWPLy81KlxHkNfwO1CYC0ZZTmwQ2FRf0lRlkpYV5GBgYGIZ6C1KLczBJU+Ve
  M4hyMSsK8b34CTeHJzCuB2/0K6CwmoLMy9nuBnFWSiJCSamCamX5XLeqjxzaTealTXViP3F56
  JWm1TeXdikrW1Q+mSEw3UYgU8fpkHfxwwc/PL35/+BfO0hD64tC6e6+ur7s4T0ir9Xel4MKjZ
  xY5Bu6OW/T8I9+B5FghoVfMT/lfbZtTKREu8sX998d/T+Xluv7MffuizvDUPLd/4ocY2KaxJV
  hd/a2yPeJRUEdN3X/GifoK727w/Pb+H7Rt/mKWFz6mR39db5/y8Xo7R1r5guAFZg33lGfld/3
  o6ZYKVq/Mj70gcilMmWGG5uoJNiGfpgrbBpSLuil3Sj7xWJo6IaSNLan9p3DPKxshCev3D3N/
  2ZV7vrpZ7vPpV21U2oxvV9bG3FHbmOGmkzc7vXdzcvshJZbijERDLeai4kQAbdEA43UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1666055200!278307!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21615 invoked from network); 18 Oct 2022 01:06:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:06:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 71C92100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 66096100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:06:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221002.0 -> 5.9.20221009.0
Date: Tue, 18 Oct 2022 09:06:14 +0800
Message-ID: <1666055176-8001-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
References: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99209

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221002.0.bb => ctags_5.9.20221009.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221002.0.bb => ctags_5.9.20221009.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
index de9e6dbe6b..5564a9b853 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "132379f59e223696f2382a84c2e12b6e7860a7ac"
+SRCREV = "5d506a1a3b6850f05de5e785c5d14cfd6f9b1620"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


