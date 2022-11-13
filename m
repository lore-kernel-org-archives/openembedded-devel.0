Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27865C43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:15:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.299.1668309342327562863
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Mb/ZEXIP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309340; i=@fujitsu.com;
	bh=7AkH+ZBalCEMCQOwjE3kX4o/gvMLD5jrdUm9LrkUEls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Mb/ZEXIP8Vsw1DmOPQgaLmQ1DoNlOtVog+DPdXiU0gMwrazleqdOuWsg4cizOv1rG
	 QiyrPxb5KV0zGToedkGI6Z2QnJVXfzwcZTw4aW306lVmKhCc4SR3Nc2jWmIE9OL9mO
	 sxgkFsB2smym0mWyCSxXdDW4edgEnJyw5ovtdDkSLqkdqxx+3uvty2NGgb1ngDQGlz
	 5uAFLztbdzMrD3gmHR0totShs1r0DyV8hNiXnyESvSVusvPnLqC+1w5c3rVbD8PPkh
	 5+PWifYunCETmKQWwin7nCq0s2Ambu4lJUjUBRFmW3mqQbAD9bTYGkhIZJ/Xp7ki3b
	 Q9aFn/Fw8EauQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSTcqsSD
  Z4Nt3bYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPSqwXMBc84Ku4++MHewPidvYuRi0NI4Amj
  xPSj85ghnOtMEh03z7FCOHsYJY4faQVyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFjCVuDP3OxOIzSKgKrHkTQ8LiM0r4CSxaNdKsLiEgILElIfvgXo5ODgFnCUmHJIBCQsBlU
  ydcYIVolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdITFrVhvUSDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0jfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDN6U4OWwHY+/SP3qHGCU5mJREedOu5ycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uD9HVmQLCRYlJqeWpGWmQOMJJi0BAePkghvhR1Qmre4IDG3ODMdInWKUZdjbcOBvcxCLHn5ea
  lS4ryzE4CKBECKMkrz4EbAovoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHetdFAU3gy80r
  gNr0COoIJ6IjvkXkgR5QkIqSkGpgWmKRNvmgTOCGt9FlPt6uy94Jb1ib/lSZ/Cf2s99MwSn+W
  2C8f9xOLmZkNvx5gPM3a9a37OGeevhr3DdVT77k9/lVduaZWvFmocF2ZmbbhwVu1m3KOrjzj/
  +MuQ+JX9R9p3hPOKnnE/jgRnsEzdVtdkMqn5/cXu384PZ35s+3rpgf6LddiTlltPzirqXbXis
  cZJ+pmF3At4Jz288njkKfR6zYEn82ZZWSw6/sa1xNv3ud/lM5Ki5JaPF1x66TmTeV5Hm9SXcO
  d5vcW9p/8utq/pqni8VOP2SxXd6hzXhacwp64fEV7m1eZzxox3qUTNrjc+2rwRH3fjaXMCYdP
  v9TfuOtgK//0OWIZ69f/nWeWq8RSnJFoqMVcVJwIAA2pTZ9lAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1668309338!685312!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5839 invoked from network); 13 Nov 2022 03:15:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:15:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2FA651000E7
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 235C41000D5
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:15:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] libforms: upgrade 1.2.4 -> 1.2.5pre1
Date: Sun, 13 Nov 2022 11:15:13 +0800
Message-ID: <1668309316-15398-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
References: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99568

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libforms/{libforms_1.2.4.bb => libforms_1.2.5pre1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libforms/{libforms_1.2.4.bb => libforms_1.2.5pre1.bb} (90%)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
similarity index 90%
rename from meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb
rename to meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index 01db3c4d3..52bddbd0d 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
            file://0001-Modify-include-dir.patch \
           "
 
-SRC_URI[sha256sum] = "78cc6b07071bbeaa1f906e0a22d5e9980e48f8913577bc082d661afe5cb75696"
+SRC_URI[sha256sum] = "92b5e6466ea2dffca7332aec12734e65b3e961825eb3100b7d889c0d1abb4697"
 
 inherit autotools features_check
 
-- 
2.25.1


