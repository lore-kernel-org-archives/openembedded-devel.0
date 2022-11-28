Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882AAC4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 07:22:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.112155.1669620166911924308
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 23:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EbrB2/zb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669620164; i=@fujitsu.com;
	bh=DX9gAM+PdXT8hWP+M6Jy8PUpVcWh5Ucz2m6KwjAx/dI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EbrB2/zbBmiRK2L4kuI8hfNFJCFGRbtvsjMLVZLgdpbHXVRWK3R9k1zDu2BPihBlj
	 DOIxzQafgYNSiTHLyyK1RQ+xeZjYEcjWQ1PSuKsIc5exkNXuuuY2CzxaqSIZHxHM5s
	 bkessSWzeiZuxzBSOFlXPzTaGv6sbBgQKqdVIhuJxjCJ+WOyeHejmy2B7DrZeGpjt0
	 lYkE1L6d1lEZjyVL3Ul0KhfLlMhb4JUWeFRdZBZ/BpPfV4iTwfmxpuvJK/HDiANLCZ
	 hsmnBRtyYuso5RYKJcX5fExil5rJN2dy0KDCG5c7/KElWrPf1iNG5SKf4MlsVEWA+P
	 eCkxhoW7NCFXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSfdIYku
  ywaOzYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bD/kb2gnOcFQ86nrA2ML7i6GLk4hASeMIo
  seD1ATYI5zqTxLY3/UwQzh5GiXm3Oli7GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwkbh3rQGshkVAVeL252bGLkYODl4BJ4nPLyNBwhICChJTHr4Ha+UVEJQ4OfMJC8QYCY
  mDL14wQ9QoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFacWlSWWqRrqZd
  UlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERiMKcXpuTsY
  Ly37o3eIUZKDSUmU901kS7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7BeKCcYFFqempFWmYOM
  DJg0hIcPEoivO9AWnmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc77LRaoSACkKKM0D24ELE
  ovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmVUoAmsKTmVcCt+kV0BFMQEdsUmwCOaIkESE
  l1cBkNTt+B29Y6NE1Uz+HW+5Vj7nAmyYQFqnW/Ln14OyK86v+8myQvn3/1IrNO3vun2Ngf7Dn
  +/YngStSUn4c9X+htc6MZf2je4ZJdQtXscrLTfnb6V8p63I68Vzz8jc5dorsTbdzjpxmamSsf
  LVKW0BCVu/li0g/Wy3di61Bt9ew3D8zh6N8p+/laSc/uD+WvPbsq2bz8imTztvLPjt73FGVr3
  bjBabwtE3fZJVPhksuj3rZe30TK+d1pl/ubtpHazTn8vHc1mL6f/vHNIWYmqU516SOZP72+BC
  T7pNaNHEhd0fTug9M4fcU7ec/2F3+2lvox3RdibrDXvGvFVqS9hV9WDbh+e7/SwX2bVjCqdom
  osRSnJFoqMVcVJwIADcbeBdNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1669620164!278283!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12890 invoked from network); 28 Nov 2022 07:22:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 07:22:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D52551000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C90961000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 07:22:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyflakes: upgrade 2.5.0 -> 3.0.1
Date: Mon, 28 Nov 2022 15:22:18 +0800
Message-ID: <1669620139-13762-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix crash on augmented assign to print builtin

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_2.5.0.bb => python3-pyflakes_3.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.5.0.bb => python3-pyflakes_3.0.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
index 5c75ea48a..2e3a3474a 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "491feb020dca48ccc562a8c0cbe8df07ee13078df59813b83959cbdada312ea3"
+SRC_URI[sha256sum] = "ec8b276a6b60bd80defed25add7e439881c19e64850afd9b346283d4165fd0fd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


