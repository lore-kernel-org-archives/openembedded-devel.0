Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E6CCCA47E
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:52:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.3646.1655110351665604727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fES9/XLY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110349; i=@fujitsu.com;
	bh=Abcu5ALy2ppI0R862jkNe/SgpoKvhch/RZyAnGLA6bE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fES9/XLYlgcFddvSyz1lpK9nqPpn5OXlJkeBH4ak+xdd/sjBbPzLVU+9/CHS/2P+K
	 Yenrh9jEJQqc1rk7GU9OgAokFzfR9F+3WnkLdWajp7PSH6rH05wxFG60xMRV8fEeop
	 fTFQcORrrgxWzemhJKPy73kqu4sB7HJpzBZvO9QcKs57u62SEA4/++YYh917glKbPx
	 Rm4+/20IeL+i+WHmsMndrFb4MGyaXyfZe8Ot+rEuhVirO1k+bRlQa+NKH0EssRI5hw
	 VnDY6wPN+leyY2BQJAgRO412hHPwfDcNKJNTBB+RSbONDFwKH6EC4fHd4huqwVlh1/
	 IUpmKKmw/g27A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqHv217I
  kg6sLpSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozZnQoFKzgrbtx9zN7AeIyji5GLQ0jgCaNE
  39QvjBDOBSaJ659/M0E4exgl9l49w9bFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC3RNeWVkYQm0VAVWLy7QksIDavgJNE25GLYHEJAQWJKQ/fg/VyCjhLfH3zEmy+EFDNoo
  WnWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1ttA1NDHQS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOOUYrWeHYwnVv3UO8QoycGkJMq798uyJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvI++AuUEi1LTUyvSMnOAMQWTluDgURLh9fsOlOYtLkjMLc5Mh0idYtTluHrlyl5mIZ
  a8/LxUKXFem59ARQIgRRmleXAjYPF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw70eQKTy
  ZeSVwm14BHcEEdMTGk0tAjihJREhJNTDd+xi/Pvjsg3ctW+SCDVcnGBhozrqvk7NLwUBxeUvh
  Gs5nE1ylzqmlBOneVfjUcrfonuTypXeNrqe/zrc8U8exXuig5er4vY5x9R7cwZ/9IoRXzXayE
  l9+T5stKLDbP8td1T4nWur2F+24Qwkl73bdMb5pH/gmvJxDYd9WYakNqwPPp7/c07p4zsVlVw
  9f3XB0dcxpO80wtmvzqmbequ2sCz9TKekosLqnluFRTFLJHr9rj0WsAsKmbDrY9cDw2KN5nb2
  fkqVzD73YvvLj8Td1Z2bpBm6oFWGZGM587ZeMjv/WJ8H176WnKNs+Lyn02x2xryF60nuD0Nrk
  33u1/1UnyiQ6tk+87H1ldlrN0UVKLMUZiYZazEXFiQDzbJxHagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1655110349!5200!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16202 invoked from network); 13 Jun 2022 08:52:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 08:52:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BB7AE1001AB
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 88E581001A1
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 09:52:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] inotify-tools: upgrade 3.22.1.0 -> 3.22.6.0
Date: Mon, 13 Jun 2022 16:51:55 +0800
Message-ID: <1655110315-25174-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
References: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 08:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97481

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{inotify-tools_3.22.1.0.bb => inotify-tools_3.22.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inotify-tools/{inotify-tools_3.22.1.0.bb => inotify-tools_3.22.6.0.bb} (93%)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
similarity index 93%
rename from meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
rename to meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 4e6bfbbc2..3d25eecb3 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "4b72dcd15299e1d0cb096397d9aab513ffed1657"
+SRCREV = "c8bdbc0a2ed822fc7c67c5c3e102d89fe27fb2d0"
 
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
            file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
-- 
2.25.1


