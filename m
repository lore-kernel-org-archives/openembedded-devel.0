Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB728C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 10:40:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.35601.1653907211189890524
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 03:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mImuX9G6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653907209; i=@fujitsu.com;
	bh=m0SA56TQuGwN+bjb9PpH5VYYJmbb1ppOanEvm8oK9nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mImuX9G6/sHy1fbVph6DLGweBsgl7nsnYwr9wX9ZlBYUKj8PGy/S1x8Awy1gZ7NYq
	 uH7ffEYFOzF2wz+wB+n4NDSEHyJvrqV/dMEjVr2nbZjbEBCBM3hrjrrJvz4FV+QR+n
	 J94Uzj4Fwh6l1EZqCgAsD0940FJ4p44KfPoYJA3KT0vXSjkgqgY2GPvVxsWt8c3Lhw
	 8Mv+2XKIEnqnbO5U8uRIOasyD74/ep3/yof8a92zquNhHuJS54y0ffKo0eEnFwZ867
	 pVfduGbtTg7XMwmhQZNOsawaJZs6RFPXzYzz/H68JhwaTFgXrxYPwYr+QfrYUCuFYV
	 GGlAalfIEQjaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpMsxf0q
  SwYQJuhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a7HVeZCtZxVHzYf4G1gfEWexcjF4eQwENG
  ifcrTzFDOGeZJC50LWaEcPYwSpyZ18/UxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  UCjODiEBcIlts/JAwmzCKhK9N6fCVbCK+AksbTnEwuILSGgIDHl4XuwOKeAs8SGy41sILYQUM
  3U340sEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZeboeZUSMyYsY0NwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU10DXyMRYL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIhTihk+72Bc0PdT7xCjJAeTkijvWdXJSUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeDPmTkkSEixKTU+tSMvMAUYUTFqCg0dJhFelHyjNW1yQmFucmQ6ROsWoKCXOOxOkTw
  AkkVGaB9cGi+JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5beYBTeHJzCuBm/4KaDET0GJ
  upokgi0sSEVJSDUy+m9oL/bOKTPkOqh3mykovVGYq0qtJSnnc0jdvUe+a8Nz0wHfm5hM2qbDG
  HUh11li2y6Bnw7oK44yn0ZfusUnqi7wVqPhhFnT2iwHb0clr+bQWTmwLWZUTYzdN6I+K8Zrnj
  VsUTJvuqzWf3r53+uPWtwuYvc1b3PiX1kzWeuJodJJt7Vqhq4syd/yuYlRrlHhx7105+7XWZQ
  amkgV96lK/q6/P53tmw7n4Yr3/LzblgAVl4ptV1RmCpjCl1ZV6l606JCLs6JC2pPfKzI+f6hd
  eaWeoY9t8I29Xq1rZM+8ntjlfT3P1Jjjr7/xmf23D/R/nX7j6/ZjOvTFunkLLs0cWjbtuNrwJ
  ZPzLeW76BCWW4oxEQy3mouJEAJhW1HldAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1653907208!235844!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19759 invoked from network); 30 May 2022 10:40:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 10:40:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 45240D66
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 39400B5A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 11:40:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220515.0 ->
 5.9.20220529.0
Date: Mon, 30 May 2022 18:39:50 +0800
Message-ID: <1653907191-24731-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653907191-24731-1-git-send-email-wangmy@fujitsu.com>
References: <1653907191-24731-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 10:40:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97322

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220515.0.bb => ctags_5.9.20220529.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220515.0.bb => ctags_5.9.20220529.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb
index 231deec44..1ec8d0e13 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "62bf9fcbf17eb4a3027cf9e97d6dbf5199817c38"
+SRCREV = "fff389b94b8e3fb53bdb59789dabc2693c534804"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


