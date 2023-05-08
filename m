Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653FEC77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.103889.1683541442254900387
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=btiIw0iH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541440; i=@fujitsu.com;
	bh=RqpRkIKKjUvO45xlv4DsJNtaTYyzF953zaTVM0u3yZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=btiIw0iHvaInWy3uMDoH8zo/b6MEKvyN9kDVes6/cJKZsdDCqnsrxmWOOWZxCV07d
	 NuPfjhQa3uIId+J7jFeo4woYH/XURuwfQhvWYhyE7ZRlVJdzga7OcnKCgHj6YAhT4s
	 jxVHsgSXjN3xMLu/azxGG/Q2DVB2Icfsud/w4hLkgzlHk9OJfhvNRI/y1ELIcwyUC8
	 9ZYfNwClFV6szYFdbCQygHYs5ppuanKNZGXMzsUibq+LN1BHQffpxYuW/D5pOAsDoL
	 7fXvona1jXuMK6zzCZ+CPSsvnTXM2K88e/KmoDyH5zJ6t1vsUtTVhop8VBvMTJ6+QF
	 KDeST46dQCtnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpHvgbES
  Kwe6PohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bWi2+YC9ZyVvSv3szcwHiMo4uRi0NIYCOj
  xJebOxm7GDmBnGlMEt8WiYDYbAISEtP3nmQHsUUEdCU+fpgLVsMsoCIxY/IRJhBbWMBLYu2Vx
  WA1LAKqEivu/mQBsXkFnCRO/twBZksIKEhMefieGcTmFHCW2Nn1jA1il5NEW9djqBo1iavnNj
  FPYORZwMiwitG0OLWoLLVI10QvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7g
  yNzknRS8vtWQTIzAgUoqVOnYwXt/5V+8QoyQHk5Ior+nBsBQhvqT8lMqMxOKM+KLSnNTiQ4wy
  HBxKErwupyNShASLUtNTK9Iyc4DBCZOW4OBREuGVPQKU5i0uSMwtzkyHSJ1iVJQS5+U7A5QQA
  ElklObBtcEi4hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4GkCk8mXklcNNfAS1mAlrsfz
  kcZHFJIkJKqoHJjlO96MEt49vvmNqi33vctT3B8PTMPYbw1ADWELObMW9465tUNbjEpDh33d4
  f5sTx757zYXn96h+W7/akzNWZPvtqaPePfqOIxZJMPx6JiUgctMqd6fzmX099wfk//Ouvh6uy
  PFIpybl8t2SG1NRWnhvHWFt5zm77tO48k8T586/Uzm3qmHCvaPPZVd6H+77Jub/5s1VrmZz/e
  f+Mn5fztfODayduKLj2xHpO2pPW95d+/zqWqy7VdiuV5bnFRfGDDxc7To259+bV90DzyXKVdu
  Wn8+JlUjUYT7rN/Hw94sDsCXMDjxotv8SrxfVbeJPSh5kWjkyTn4V9PiXW7nZka8q2mW/9l66
  2+ZbWsLItQomlOCPRUIu5qDgRAPgpEqMDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1683541440!415343!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10419 invoked from network); 8 May 2023 10:24:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 10FA61D4;
	Mon,  8 May 2023 11:24:00 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 37CAB1C2;
	Mon,  8 May 2023 11:23:58 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.3.4 -> 13.3.5
Date: Mon,  8 May 2023 18:23:44 +0800
Message-Id: <1683541424-25761-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
References: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102426

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed italic indent guides in SVG ouput

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.3.4.bb => python3-rich_13.3.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.3.4.bb => python3-rich_13.3.5.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.5.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.3.5.bb
index 2a832f1716..cedbed3ca8 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.5.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "b5d573e13605423ec80bdd0cd5f8541f7844a0e71a13f74cf454ccb2f490708b"
+SRC_URI[sha256sum] = "2d11b9b8dd03868f09b4fffadc84a6a8cda574e40dc90821bd845720ebb8e89c"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


