Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09606C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:30:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.43223.1682307041370562649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Oq1xAwvE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307039; i=@fujitsu.com;
	bh=JrLrUKCq58DwEOGhjcwg8Sf/ynUhP9smt2WNjltwMfY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Oq1xAwvE/xjJkNAXB1nq4YYWU65Dfz+F3e8vf52Su9znlk3/noneYZOiIGeendiZs
	 x693+yuZIcY/zpQXJ/hjW1hjdgPHgxk4Q1ULmVkoU0XH/n0n5ieMOcfB387sCBwN46
	 zfhsWvtkgNEQypyuwx2Uct455xl9dmjxykB2tQSnGa3ESuWYREZoDPK4mNfxi+lCx1
	 Df7iY2t+A9zUfC2rv/u6jiOvshOuPY9l6rJCeZE85VG8IA/nX6fynM3b/KUDVt9tXa
	 SMS/ZdJaXYLyPk0xH9xQuvuuB0R48Xm9H98unwTdExE1V4L7WZaCNN50nLZqBmR78q
	 iis6DXM3qVvlg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffed9c
  Ug7YfChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b8fd4FZzgr9v5/wtjA+J6ji5GLQ0jgIaPE
  spmz2LoYOYGcq0wSy3rMIRJ7GSU2vuplBEmwCUhJ3Lj/H6xIREBfYunsPcwgNrOAisSL3z3sI
  LawgLtEz517YPUsAqoS01ZOAqvnFXCSeD1/GiuILSGgIDHl4XuwXk4BZ4lj+w+zQCx2kmj/8p
  EFol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo2lxalFZapGumV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5q
  ySZGYOCmFLO83cH4aedfvUOMkhxMSqK8Sza4pAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4C365
  JoiJFiUmp5akZaZA4wimLQEB4+SCO+yL0Bp3uKCxNzizHSI1ClGRSlxXv9vQAkBkERGaR5cGy
  xyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5pX8ADSFJzOvBG76K6DFTECLd3G7gCwuSUR
  ISTUwhb5jj+WafvWPifbEe63J6j1Kiw6ZzayV2LAjprXsg989hesp93IvCNyvWGK858jMBq0b
  6ofuan6y/pQvEnxD6HSy0/ttUo9WfnzMU3E5+eJmwf0mpvr/c/fmiF94fWLe+uTC08vC2kXX2
  24TntW/5azZD7YLQbNnd9cHRJ9we3WMIyt01QfVJ0JaRfdkZkRPyC9K403+olN2av3CytZvej
  KffIq//N6VVnju3Z33MbG/mQPvmso//Mmv9+PcbP9YcS32pTOMZhxnPzGdxbos/bYP9zOtqZN
  ZNy28sPj9naJ3FnVHNygeftNRrxZ+S2DlYZFDWQ3/60RLuDqc9pwqLGoQFmb5f51Vbrror5dH
  byuxFGckGmoxFxUnAgC1hB4hVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1682307038!485362!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13071 invoked from network); 24 Apr 2023 03:30:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:30:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 22973154
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:38 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 16C1C142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:30:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:30:36 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tornado: upgrade 6.2 -> 6.3
Date: Mon, 24 Apr 2023 11:30:11 +0800
Message-ID: <1682307012-11984-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
References: <1682307012-11984-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/tornadoweb/tornado/releases/tag/v6.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tornado_6.2.bb => python3-tornado_6.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.2.bb => python3-tornado_6.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.3.bb
index d94fd3927..1535214b7 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9b630419bde84ec666bfd7ea0a4cb2a8a651c2d5cccdbdd1972a0c859dfc3c13"
+SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a18683f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


