Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17842CCA481
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:15:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.37575.1658211349167506250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vbMaMk5G;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211352; i=@fujitsu.com;
	bh=Ce+8ODIGKeLP91MHnfy0vzCgBFD98dvhUvdtZ+1zhx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vbMaMk5GL1fWEZFFkik3v0uYeYqvTY8FyB/5taP2wphcA50tp1fK2IGpZbaPA66Mk
	 EwaKL1qKmclt/xX7u9xwH2nexhjiwEKSDBTOdByeBGooAiMZ4T62zaeahuwYRHtwwB
	 R7CKp/Cln01M+e9r+yel25jrrRK19fL0sFgOCfWQxaS7rIEsr7vNvO/XxgtKGkvs45
	 DJZqsZpRUBt6yXWBi6GxkKyDX2IRBmwQ7P/0Vsn65I2z+Xnzl2CBt6bJZjVyGe6wAy
	 RXw/oVZVVqUobYXqAr45S9bS39qFVniGu7y1QA5YI8bn17RJtR4zBnOnH2BGXxS5du
	 WUmQ5nYS9hBkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8MxSVfC51q
  Swfx7YhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bOT+fYCu6zV9x9/oetgbGTvYuRk0NI4Amj
  xIXb5hD2dSaJ2x85uxi5gOw9jBLr3jawgiTYBNQkpt+6AWaLCOhLLJ29hxnEZhZQkXjxuwdsk
  LCArcSZKStYQGwWAVWJG12tbCA2r4CjxKeXH8F6JQQUJKY8fA/WyyngJPFq2x8WiMWOEosPLG
  eCqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMyYsY0NwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itE6qSgzPaMkNzEzR9fQwEDX0NBU19JM19BML7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCIU4oTBHYw7t33S+8QoyQHk5Io71TNa0lCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHgveALlBItS01Mr0jJzgBEFk5bg4FES4U1zBkrzFhck5hZnpkOkTjEac1y9cmUvM8fMr2
  0HmIVY8vLzUqXEeQu9gEoFQEozSvPgBsEi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4
  qkCk8mXklcPteAZ3CBHTKJKcrIKeUJCKkpBqYFuaGfL7tddd30er15o/27xa2+D/xwruPok0s
  T72+XdUt+8/xPWOt8dPgK3zqnFx5nz5/9xc3XvF9bypXx4MNPpnx6k7M6vM/HNY51HMr/F3qv
  8ttU/sY29z4Klc8dZJsC5dTSffe1Tej9T5vgcIMpoT4rw8Lp+geLg3L49Yxu7Nr7nfVR6f+PB
  EsfWu6+p633Uwb/qaIhU+fPLD7qvKx4D3T55AdxzYfeLLEUOpVb/1iP6mGl8sNmML2zJf/IyP
  1ZuaifXm/5/Zzr+/a+7/wrv7nbCdb20eZomsy3XZwvlCrEGzy3rii22xeWWHzhZNH3f5u+Dkx
  x/VIisobnRWrFwV6n5vwTSvi5gEV1uKZAUosxRmJhlrMRcWJAFH63YdvAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1658211351!56421!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21510 invoked from network); 19 Jul 2022 06:15:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:15:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C5B131000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B94411000C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:15:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pegtl: upgrade 3.2.6 -> 3.2.7
Date: Tue, 19 Jul 2022 14:15:28 +0800
Message-ID: <1658211328-2951-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97895

Removed superfluous deprecated include.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/pegtl/{pegtl_3.2.6.bb => pegtl_3.2.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.6.bb => pegtl_3.2.7.bb} (87%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
similarity index 87%
rename from meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
index 7fb6850134..237828dbfc 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
@@ -4,7 +4,7 @@ LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dccf35ef30bf912bb07b01d469965293"
 
 SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x"
-SRCREV = "464d866d8bbf4c8ddc5b67422d09b60ad3b918fc"
+SRCREV = "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
 
 inherit cmake
 
-- 
2.25.1


