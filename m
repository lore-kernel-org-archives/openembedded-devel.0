Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB15C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:18:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.7347.1663640321818181234
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rd13ngY4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640320; i=@fujitsu.com;
	bh=eCIYLJK3OCko0fvrPFi2OZKLD1PNH1lVbVCKkLlKKbY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rd13ngY4DuvmOaSyEj5WjaDYW0Pxe8WVIChltZBOQtPrnQW+mkJgdQ9j6LBjkdi2t
	 IUjCvCrrkH0M0wmx3Lba9veq3SBjJ+PxB8iuDhY/V5A3o9v8qtvPuGa63SZpJgaGgU
	 JCjvyWoNRC5v+kCZI7Ry4y0gl+mxkQjmKcaZA1t1385BaOPWsjPzQhw7K6j9Z4RfWj
	 ViekjOYeViA8tuAWACvuaoBiwUvb+O59rZypEks6elAm3capIt8kjz7VwU83y62hej
	 g20wSzXB1Ptujq0upLadN5h/MwW1Hseb8Dkyx3sfJYkl4DU9yaf+sV4ugWO2ZWImro
	 hAmDV82ukfEZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpPtfSTP
  Z4NsxHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePYtVOMBds5KprbhRsYb7B3MXJxCAk8ZJRo
  7jrKCuFcYZKY09oN5exhlDhx+QKQw8nBJqAmMf3WDTBbREBfYunsPcwgNrOAisSL3z3sILawg
  J3E15Z5TCA2i4CqxKVry9m6GDk4eAWcJH6tzgQJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA6+eM
  EMUaMoMftyMwuEXSHROP0QE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjTVJRZnpGSW5iZo6uoYG
  BrqGhqa6lma6hpbFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFimFCcc
  3MG4Yt8vvUOMkhxMSqK8XHUayUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeO0FNZOFBItS01Mr0
  jJzgDECk5bg4FES4WWTAkrzFhck5hZnpkOkTjHac6xtOLCXmWPq7H/7mTmWg8mZX9sOMAux5O
  XnpUqJ86YoALUJgLRllObBDYXF9CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzhckBTeDL
  zSuB2vwI6iwnorBsq6iBnlSQipKQamFwVTtUeFlqw8BxDkqdXm9su2Rn+W61uXpq+aP+apCvd
  p0vSTZ/fsmWf8zJq7e1Q5wtZixeveLuyXSNO3uJY2IbopiZT4dYIn7wso39yLxtbpe/PnOPAt
  uva1nln+Bgzd9etKDzk5rniocGXkgnts90XVPXwTbvzineV1651d/wfHYz/un+XcsWLR4rpHZ
  Hnmff/4G9X/ZctuTjKKim3z3zCnA37Yr9qMupstC364m2S9GenfgGf8V7Lx1Fe303mcxu4PNG
  d/zte5ueKhys7Xly4Kc+YPoN3/tF65X73a/NElvnOkHcNqWZb987mePEmh0uLzp7mXDdNt64u
  qIZdpnXm9EjuxTcSf701srj6+rQSS3FGoqEWc1FxIgAzpez+ZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1663640318!298632!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26689 invoked from network); 20 Sep 2022 02:18:39 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:18:39 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 984FD1B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:18:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8D61E1B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:18:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:18:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xclock: upgrade 1.0.9 -> 1.1.1
Date: Tue, 20 Sep 2022 10:18:21 +0800
Message-ID: <1663640301-27280-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98878

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xclock_1.0.9.bb => xclock_1.1.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xclock_1.0.9.bb => xclock_1.1.1.bb} (63%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb
similarity index 63%
rename from meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb
index 31c553eee0..a7360b6496 100644
--- a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
 
 DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
 
-SRC_URI[md5sum] = "437522a96f424f68fc64ed34ece9b211"
-SRC_URI[sha256sum] = "cf461fb2c6f2ac42c54d8429ee2010fdb9a1442a370adfbfe8a7bfaf33c123bb"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "df7ceabf8f07044a2fde4924d794554996811640a45de40cb12c2cf1f90f742c"
-- 
2.25.1


