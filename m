Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1CEC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:05:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.4398.1652940321697672666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D1hGHWwK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940320; i=@fujitsu.com;
	bh=J05Lz1XiilA7bZw4XFFWc4LLSM84byF1d6X/ptxXGio=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D1hGHWwKX6m+ltjc8h3RGIVbHEEkyFRK3y1yeduW27kSZzVYwx4eitYTqyL0slQFT
	 k/XKI6KQBzM9ovZHEgOFYPz+Es7DFpqrQVhEfEe0YNUkRclE2lnE+4leXf9ON1EbUM
	 D7U4WQHyH7IEVgACc+CrOPHSjDyZ1e28li4kBVfZb3jmELyLl4J5XVE9+CaltwWLhO
	 5UV0/D6B2MRJzOuAK5pvrpG8PMxpoJS3JFQSImlE7ceD1j4GfJKj4UvwI2aahnacub
	 JJ+wT/eU9m6dHATaUevnWg58MAy//UbxyaUWBYoVdkgG9EjNQC/S5nxLMGzyoFknEz
	 D2oZjwwRK3aFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8ORqCt/rzX
  J4PhzWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPPTI6C85wV/+61sTQwfuboYuTiEBJ4wijx
  7+sHdgjnApPEocMzWCCcA4wSDf0/mbsYOTnYBHQlXvxYzAJiiwjoSyydvQcsLizgJ3HxyS8wm
  0VAVWJD510mEJtXwENiSutzsHoJAQWJKQ/fM0PEBSVOznwCFmcWkJA4+OIFUJwDqEZRYvZ0eY
  jyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhqa6hrqGuk
  lVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGXUoxI9MOxmV9P/UOMUpyMCmJ
  8rofaU0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMG75w5QTrAoNT21Ii0zBxgDMGkJDh4lEd6WX
  UBp3uKCxNzizHSI1ClGRSlx3tC7QAkBkERGaR5cGyzuLjHKSgnzMjIwMAjxFKQW5WaWoMq/Yh
  TnYFQS5l0Isp0nM68EbvoroMVMQItvKYMtLklESEk1MBXznA7Lc3w57axdv2F3Q/aVBcqrOwv
  efU/wWH3esv3hEuNKRovfdxe71gUFsFjbvomqWZFm/3PCpAPnFDZlyetUb5+z2ubkwbAjLJ/n
  KMTxbnqf7PF54o/m5inTa76Virpq6n1f7zxT5rcVb/GPHPc/e500X/kapGTaXjxTFz2x9Bav5
  8VHe3vt2CZuUYq25FYOdHmZE52zWfXIS6YU/qdP9Lr0z9+sMjh6QJQ76eipXtcq0ZWXUz0Npw
  gtuTj5NOuP018yOBN4+15sedJyUVr4l3uE3yfn49ppkXEitxpO+PIX/rzetyVjekz7mbeSNY+
  dhHQ8d65h/Da5pJujSWPt+WnsYhtN0rJrH/zJUGIpzkg01GIuKk4EAK2olQk2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1652940319!20575!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19976 invoked from network); 19 May 2022 06:05:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:05:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 09B36100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:05:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id F185810018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:05:18 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:04:52 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-eventlet: upgrade 0.33.0 -> 0.33.1
Date: Thu, 19 May 2022 14:04:42 +0800
Message-ID: <1652940282-25013-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:05:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97182

Changelog:
==========
* Prevent deadlock on logging._lock https://github.com/eventlet/eventlet/issues/742

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-eventlet_0.33.0.bb => python3-eventlet_0.33.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.0.bb => python3-eventlet_0.33.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb
index 6a4449cf5..afaaf4a97 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "80144f489c1bb273a51b6f96ff9785a382d2866b9bab1f5bd748385019f4141f"
+SRC_URI[sha256sum] = "afbe17f06a58491e9aebd7a4a03e70b0b63fd4cf76d8307bae07f280479b1515"
 
 inherit pypi setuptools3
 
-- 
2.25.1


