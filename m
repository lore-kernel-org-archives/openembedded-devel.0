Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E92FC4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:19:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.111530.1669616367107187369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ulStZnqV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616365; i=@fujitsu.com;
	bh=8B3FzolQs+/jdxrjahLHifkAB6ZEJ1ilhRKxdW2LUe4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ulStZnqVaRx36miuVWUdYXNfJaH7zn0UrIv17nxa5jGuvfYytku2dZC7w0b3iu93O
	 9yZI9Ab4msrffc1qp7+vmNc6r4UOf+MIes+65g0o/jHiCMX1KOTjtyb7JTbTNRtJOy
	 8/YaHzCkkBWruqWkr17BotCZBs7kQIm+OiHYKeoNO94DA2Wg3fA+dNz0YUkQ0OzHrj
	 FxlEkZ9iyTNE6zpfyeCnGwnV8FGc1kQ7006schQ54mcnrWIwwPMO8LuztO02kK0AbG
	 Sww7NwhmFZhQNuAQ4f4fyDtPaV2aAZOerM9ZNRvaVZcSIHSUlQG3vUYukgQoogEQzr
	 BuHZDPnCKd/Lg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSfdtUEu
  yQeNhDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPP3IdsBSe5KvYufM7SwHiEs4uRi0NI4Amj
  xMyzOxkhnOtMEhc7z7FCOHsYJVY/usLexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgL+EvunfWAFsVkEVCWON/wCq+EVcJL4c6aLBcSWEFCQmPLwPVicU8BZYs3V82BxIaCad9
  e2sEDUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjWXFqUVlqka6hqV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPimFLMX72B8sOyP3iFGSQ4mJVHej4EtyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  OeC5ASLUtNTK9Iyc4CxBJOW4OBREuFdbA+U5i0uSMwtzkyHSJ1iVJQS5w0B6RMASWSU5sG1we
  L3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3ssgU3gy80rgpr8CWswEtHiTYhPI4pJEhJR
  UA5PJIj7WE+8im5n/KLS8SM5cZnVd6mOAtet/zRL+herPU1ZOL0jOu6Vm+92rON3oeU0Z452m
  Kb/eTPdO+C+hJ31zWuAn27VFNTJ+uVdYPeLD5C/k6EkX6DKLtFXUxO+P9bycaOi8+uN/adMNH
  xo3ZtY88+QodbLa+zV718rCu3MsP+3b6DTHZKJMCNe19b+OfGOYVDqx1fQG2/XOPwrXtB1Tpp
  Yu3/F3n2Tik3m35n0++8un7zzztiVLBaYtuPzXXOaKtuf9s3OVHv2UeNd68tGlK+X5tWsXcPl
  apsvevf1iprDtdc8n7C88JEp6HePZPF/sSDFuT5j1vSey+OgbRaPG7QLR54/O0o/ZvOZFy3kl
  luKMREMt5qLiRAAkPQxuWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1669616364!201027!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11772 invoked from network); 28 Nov 2022 06:19:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:19:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BCDDE1000FB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA5A81000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:19:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.60 -> 0.0.61
Date: Mon, 28 Nov 2022 14:18:50 +0800
Message-ID: <1669616331-13256-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
References: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add mnw_MM.UTF-8 and ckb_IQ.UTF-8
    Do not run test cases using Python2 anymore
    Add bih
    Add more translations from CLDR
    Migrate license tag to SPDX

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.60.bb => python3-langtable_0.0.61.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.60.bb => python3-langtable_0.0.61.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb
index eac069f04..6e924ac42 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.60.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.61.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "ae77d62fe6002308ce6197310c4a933c4e13632bbaf7219a3533dc45d36223f8"
+SRC_URI[sha256sum] = "2c09f561463f18b038373b1fa8a4f68143dd3bfb59fdc8edbbba00548fc70db4"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


