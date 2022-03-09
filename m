Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC426C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.3112.1646811027015985349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 23:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xCsVvtaY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646811030; i=@fujitsu.com;
	bh=e7G+JWDg8zOnfs39sTuGfimOajqVdwGMRxurOpEUHfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xCsVvtaY774AWUXlv+Vmz4s+WaKgyi/K/zOc7XBVTaOhP9q67qTKb8h628/0ZhnV0
	 1vsMq+hzIjnXIjfuK4g35TksXhujsLnpl192HFJLk3NajsqAJ5/BrnixOxL9NOy0s1
	 VRCBEgqEgb60CneFXS7AXJTYVSXT3xC8cckwND/vb/oeNLOjaHSYaFSHXz5Q7LSuIk
	 B+O5jZZPcW24/PHqghBMn8KjLkXdQ8OeIiYRHMUE4T6HfrK6Dp6bHfs3UlIs8XMZEq
	 iWfqmXRdcHYMU/gP5DZbnMKFWj3k+ktddnrJwjkKCq2Q1i+fsSdKmktGpjSqYSyR7q
	 K0QOyqoE49mCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqDshXCP
  J4OVCI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ188sBf2cFVM6tjA2MG7j6GLk4hASeMIo
  cWF3N1sXIyeQc4FJ4vwXJQj7BKPEzfVxIDabgLrE45uvGUFsEQF9iaWz9zCD2MwCqhLdF9ewg
  9jCArES7f13geZwcLAIqEgs+60DEuYVcJdYfhBivISAgsSUh+/BWjkFPCRefZwCtdZd4vK7B4
  wQ9YISJ2c+YYEYLyFx8MULZoheJYkTKz4yQdgVEq8PX4KKq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJVUlJmeUZKbmJmja2hgoGtoaKprqmtkZK6XWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYwCnFrI93MK7p+6l3iFGSg0lJlFcmWCNJiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gRvURhQTrAoNT21Ii0zBxhNMGkJDh4lEd66UKA0b3FBYm5xZjpE6hSjopQ471mQmQIgiYzSPL
  g2WARfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMqwUyhSczrwRu+iugxUxAi+2M1EAWlyQ
  ipKQamFb7JgifzXsYoPfYWP2dzIVrIbstVU8rdUu/KG3qzVi/IIhf4Fxi3JffTYJt2od5rpco
  rdVh1P0r8GX+3uR7Vz+Wz0rS/nXz92utxzt0q5hT1/ztmxpRprfcY+u5nZX+E3lsrk/elr1YJ
  GV6bXLBmtNZ+9Iub9so4lHzs/tQ3g2XRdv63lfEN2SqscxsuqM/59xn84chy4rfalVN9RDa9v
  DlLqW8/ebBec8uHoyafvlTVoTFVH/x3UGxze1bsmy6jr2RLBGdvjM6tDr2wC4W3efTcsRWbTc
  48Lte7FXaQcm5asoHZXOjTkxomefz/G/y5epzX/M+sIfE/g5X3lT5nHlPiM/1sLmX7p1gm52b
  0K7EUpyRaKjFXFScCABhtnfsWwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1646811024!14313!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31623 invoked from network); 9 Mar 2022 07:30:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 07:30:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3F9C410019A
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 32B0C100191
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 07:30:09 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/5] [oe] [meta-python] [PATCH] python3-regex :upgrade
 2021.11.10 -> 2022.3.2
Date: Wed, 9 Mar 2022 15:30:28 +0800
Message-ID: <1646811030-14487-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 07:30:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95896

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-regex_2021.11.10.bb => python3-regex_2022.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.11.10.bb => python3-regex_2022.3.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb b/meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb
index dce232ba68..c71394cb38 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f341ee2df0999bfdf7a95e448075effe0db212a59387de1a70690e4acb03d4c6"
+SRC_URI[sha256sum] = "79e5af1ff258bc0fe0bdd6f69bc4ae33935a898e3cbefbbccf22e88a27fa053b"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


