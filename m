Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0502C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:40:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3181.1658454030251660576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=leR20hPu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658454028; i=@fujitsu.com;
	bh=V+SilbK/v8I2q2CBWkfVcS6v2XCeq+UJyF58UsGZbFc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=leR20hPum17aQ3zPGXE0FOgZSuC6DGaGa7LfZOfRILh8NTSMcJtSTpmDaagZSFFDn
	 XzJ2J8/nEeErEItfto2eiUmlmz0UEl9DzUykWPTS/NCcblt5yZ8dacO2w2GTS5+BEm
	 YxXiw2Rd0uBk35+xgCtmFeTk/gXWrTVaM8EE3UNQtt8DahICTY4YBYjIA5atAOzzl4
	 XoKLmY4yIQ9RZgq0ouInIxP9R9yXsC6DvNWalRHzfVGKi3HtZDCydsMaW9XlWm89m0
	 k4JroBTenYABwpPoHZotsEV8C7bInkmoQTwuZn0G1tHKGPFTkIoAdrXrbj1j+PtcJ0
	 cBPm5TSt0n7aw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORpMvNcCv
  J4NB+IYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP//kGWgs+cFfdnHGBpYGzm7GLk4hASeMgo
  sfzWGXYI5wqTRN+p+WwQzgFGidmT5gI5nBxsAroSL34sZgGxRQT0JZbO3sMMYgsL+Ep8bt8GV
  sMioCqxeWsbK4jNK+AhcW/NLXYQW0JAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVQnAOoRlFi9n
  R5iPIKideHLzFD2GoSV89tYp7AyDcLSfcsJN0LGJlWMVonFWWmZ5TkJmbm6BoaGOgaGprqWpr
  pGprpJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZfSnGCwA7Gvft+6R1i
  lORgUhLl3TfpZpIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6Cv0A5waLU9NSKtMwcYCzApCU4e
  JREeC2+AKV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOu+QrUJEASFFGaR7cCFhcXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzCv/G2gKT2ZeCdymV0BHMAEdYW5+A+SIkkSElFQDU76
  Je+LkDZM81wvu2/7IKJNdYsuZavGuDZqHs2cqxs5MdrHcwWzy6O+RwiTd6a93nTvmnd1Rn56/
  dvIiPWeB887tjmf13kr1TzAqiJ15c16nmUHN/zPctdd3vnbZxNXjOzlbPeDRN/6nXyycn58wP
  XncTDOf2SGraUfeNuOdDQGWxX3RJ/9sKrRzFsrS5vZNKLV4FBunF+Pzy+fyRf29fq5hb9If/J
  rWzHfIYKLkXdnIba2/qlfH7Zht0Peov0C/Qs793XmGi8vOLNZRm7nh1Jk5mRv0H7Zyvrhs3hL
  D5vf2lL7m+k2LLq8qLNdn852h3nbs90LGU7a85f/Md7VYirmIWfxLKxBnnay0RllbiaU4I9FQ
  i7moOBEAF6+vh0YDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1658454026!296743!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5771 invoked from network); 22 Jul 2022 01:40:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:40:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B4F781B5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:40:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AA1331AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:40:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:40:25 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.11.6 -> 2.12.2
Date: Fri, 22 Jul 2022 09:40:19 +0800
Message-ID: <1658454019-24115-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:40:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97931

Changelog:
==========
    Fixed crash in modulo operations for divisions by zero.
    Fixed crash with recursion limits during inference.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-astroid_2.11.6.bb => python3-astroid_2.12.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.6.bb => python3-astroid_2.12.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb
index 4f9d1af939..ae2a4109ef 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "4f933d0bf5e408b03a6feb5d23793740c27e07340605f236496cd6ce552043d6"
+SRC_URI[sha256sum] = "4675ef501edbbb143b3d9bb4c81d5f6338f08f960beed2ce41a03dc4cd20d777"
 
 inherit pypi setuptools3
 
-- 
2.25.1


