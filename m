Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295C8C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:13:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.4587.1648714396498837687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iw0BX31O;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648714394; i=@fujitsu.com;
	bh=cod1lHhAyCLLaFd8I3WmX/p6CW+8Gh9QfA3hjqrv3xE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iw0BX31OTUjyayDk3q85Qf72L28k5LR2dkrN6Cxu4wuZEaRIrbldQHmvAvbeilYeo
	 H78G2CcQ9iV1sRXNOm1n7YEzI+GeovF+PR+NYonwRP3yc2anX0awrlWpReZs1SptsQ
	 Nb8FekGe/eVRR+Hkyazo1wyNCs3vN7kuN+otBDpfbhifXDNKob/9D1ZVaD8TjTqKKK
	 B2Erj8Ce/iP3Sxvli3QK+6nKBUoKIJZoKUQnlGBfUPw+B18UddkcHFeDNTUbAd8af6
	 SA9uj4j7ipMEs8F2msEfMZxvhdHoKnjZh8YqHDB2Ia/NG4BiC6upDOt6Wf7ms3zCva
	 WJ1QiuPFxaCqA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSXdmkmu
  SwaVp2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aOp23MBSc4Ko7vkW5g/MXexcjFISTwhFFi
  4YaFUM4FJok7h6YzQTgnGSXWLdjM2sXIycEmoC7x+OZrRhBbREBfYunsPcwgNrOAqkT3xTXsI
  LawQKzEkz8TgOIcHCxA8ZedbiBhXgF3iUOrT4CVSwgoSEx5+J4ZIi4ocXLmExaIMRISB1+8gK
  pRkjix4iMThF0h8frwJai4msTVc5uYJzDyz0LSPgtJ+wJGplWMdklFmekZJbmJmTm6hgYGuoa
  GprpmZrpGRhZ6iVW6iXqppbrJqXklRYlAab3E8mK91OJiveLK3OScFL281JJNjMDQTCl2erKD
  8XXfT71DjJIcTEqivE4BrklCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgz4oBygkWp6akVaZk5w
  DiBSUtw8CiJ8M6LAUrzFhck5hZnpkOkTjEqSonzTk4ASgiAJDJK8+DaYLF5iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5Iw7xGQKTyZeSVw018BLWYCWlz32BFkcUkiQkqqgalOz5Gd6/Phun0
  HXbr833/M/scY+3CL2Lwdty3V33UFRnar5u+yNG+9GPvrKZfzKr51/FsNd0rsXcNjJDzrzLzz
  nxTLdT197m9JCuh6znnyVqjxB+uq3fNjuz3EtM4VcRbtYN7EZ7KcZcPV5qNPiid92ir15Nryp
  QxrjOQMA/LW2ej+P7Hs2lPL95m/Flsr86pa9qw7lbDWUUBWMI9rAYf32lmXWpdlZhncfjEluU
  Nl38020UlP/ms+Ov0xcnn7Rr0Yb9WHPPr7TCOXh2W+13o0Zca3qQYTLjxUY/h9OOJB0tfpKXm
  JEmWTpmR4ms1TTvnuzHWZc3LCpnU7Kv/e4H960WrbBofbRm5beHfIOyYosRRnJBpqMRcVJwIA
  cLDW0UgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-34.tower-532.messagelabs.com!1648714393!161901!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7302 invoked from network); 31 Mar 2022 08:13:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-34.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2022 08:13:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3ABAE100446
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:13:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2E44E100352
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:13:13 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 09:12:56 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/5] [oe] [meta-python] [PATCH] python3-cheetah: upgrade
 3.2.6.post2 -> 3.2.6
Date: Thu, 31 Mar 2022 16:13:24 +0800
Message-ID: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 08:13:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96288

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-cheetah_3.2.6.post2.bb => python3-cheetah_3.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.post2.bb => python3-cheetah_3.2.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
index 8eed99ee30..802eab2a07 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878"
+SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
-- 
2.25.1


