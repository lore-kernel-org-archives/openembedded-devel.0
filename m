Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D1C6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:21:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.6720.1678281657019002019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NevXWgjS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281655; i=@fujitsu.com;
	bh=PYv4rS8ulFML5TQTHNMR0l9wauDZ7ezb0e6zDFCAUZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NevXWgjSVu/jbwvuy5Zyre2VgxYQHnO4PVLQR+h3c35DsM6IzZ7jS1PILkhZGTIeN
	 /PHtNCTu6g0NkNOc84ue67b1WNDSEjk3dfNQonDjzc5HXs/TqfLC4Lw0iUVXNpOAVj
	 7i1YZ4pfpahSlxHpvlL/nQGkmX8dw0msgf6jZ6+HXzZNJPX0ymZpv3GFO7QG40JEdH
	 LEC3UTQRl9KYTWxGjZkLwC4xpYPdSuohdsW6cT39+Rwqak3r9hEvt7dr/vwVAXiEPX
	 bdrzpeYZb4Y6A40H8afcdwYKDvk6CWoyXuTw5hLW65a727dCoVvptK3Qv9nSCsQtL6
	 BWpNcbdDqP2HQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSXdbN0e
  Kwd5FWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8axt19YC65xVLx+sYKlgfEvexcjF4eQwBNG
  iUNH3kA5N5gkptzsY4Fw9jBKbDx+na2LkZODTUBK4sb9/2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAX+J9Ru+gNksQPG1vzvBangFnCS+zHsFFpcQUJCY8vA9VFxQ4uTMJywQcyQkDr54wQxRoy
  gx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuuV5SUWZ6RkluYma
  OXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFDO928G4vO+v3iFGSQ4m
  JVFe1hiOFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJ+6gHKCRanpqRVpmTnAyIBJS3DwKInw3
  q0HSvMWFyTmFmemQ6ROMepyXL1yZS+zEEtefl6qlDjvBpAZAiBFGaV5cCNgUXqJUVZKmJeRgY
  FBiKcgtSg3swRV/hWjOAejkjDvdpApPJl5JXCbXgEdwQR0xIX9LCBHlCQipKQamBzv8y0wrbr
  os/FE344vSdvPro+J3Pkt5hZvUtYk9hl3k/ybMkUyNt2ZFSnVdlnjmur6lgd/r8kkf3pSdSnV
  Y8PDS9unbrvAeJzdZ2fQOoG8d7YVDTvcC1a3Lnpe5ep4/kZRhV7wqivrf/su2VGw2n7fFG1eD
  ZmubRZPzjD8mMW3aWVS/iPz2/2lT1ivFTxmfuxnLVh2wlx6xatp+yZ3sxrY/JOcF3J10vS2V3
  6Tv6+Q3NX7f0q8mv20LXuv5/QEB3oe6OpwOnsisfBLxT7VfaW1mtpp8dmbirYF3BNukzss1xc
  VevpSY4eBYdCm7frWznsiXj3Ja1VkmcHfVtBlGbBf8/AKxgeOxx7HbnbIiVFiKc5INNRiLipO
  BADw5kKjTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1678281654!459987!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25668 invoked from network); 8 Mar 2023 13:20:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:20:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4EF031000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:54 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 430C21000DB
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:20:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230212.0 -> 6.0.20230305.0
Date: Wed, 8 Mar 2023 21:20:38 +0800
Message-ID: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101411

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230212.0.bb => ctags_6.0.20230305.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230212.0.bb => ctags_6.0.20230305.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb
index 8a4977622..fec2420db 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230212.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c74bf5a7ce99797dfebda2e1cab65d1086614278"
+SRCREV = "9e62e165afd56639c7624d9c0f2ec69aec84af18"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


