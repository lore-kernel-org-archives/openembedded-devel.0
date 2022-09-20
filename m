Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A25C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:25:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7364.1663640723664597201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r4E4KLcO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640721; i=@fujitsu.com;
	bh=8I9Bu3LfRC4gEkW5oAZZMQNMjDbqwBFDpaN9v5wYtsk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r4E4KLcOhlv0kMxmm3jR6MxrgfmbxV93txaiFt8PpXxusYt0nE7yGz2nrGJpv9xLC
	 P1PBsVc7lM09eGHVBUBkKghMlkOFqsMTMi+Tds0c9WNkQ4I5ne+dN/tb2K02duH6fB
	 Zl2i9vg6XssrOhMs1R02iz4aXJ5PKXG2R+ZiUB58MJXvTiuXGUgammjPy4KoNWot8R
	 8+jNmvsHGHMG7DvjFhJCQUTXjFF8uf7ovSF5xGfxHsrqzIeO7EVgV2daltpGQtLnAH
	 Osrdrjm+8grnw/mNuA0iO8aRH+QMCHr4tsZ/9f4FOwGs8yC5wDvoIovIK9Ll7pkoEW
	 rSVKsXlkbk5Fw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqDtBRTP
  Z4MEeSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPmsYnsBU85Kp4tf8LewDiVo4uRi0NI4Amj
  xPo3DSxdjJxAznUmiavNJhCJPYwS+z8eZQRJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJzFpxkuwGhYBVYmeX21gNbwCThKfJxwCq5EQUJCY8vA9VFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNtUlFmekZJbmJmjq6hgYG
  uoaEphLY010us0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzZTilKM7GI/t
  +6V3iFGSg0lJlJerTiNZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvvaBmspBgUWp6akVaZg4wT
  mDSEhw8SiK8W5WA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEud1UgYqEgApyijNgxsBi9
  lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5OUGm8GTmlcBtegV0BBPQETdU1EGOKElESEk
  1MMXvvtHy/Qbf0px785bMv+t22WjzwtjCvJ0/fn4zOFOf4nnj1x2NhhsT5AIrX/2dKPBRS0xv
  dcQWducPe2csTQzYVz/jxm3jF3tMF/n13+tf8Pue7u7ug8VP/30XWqERGRV3WPLE2ZUqD/5ka
  0zSTdmx6O28gIPLM90fWn7uY7kx4+POytnZR3csL9+xVsKzmifXqYfXQiAyLmNS9ZvtP/2qFf
  xWV3Bmrfk1/fX9SyxHS5LuywXsns3S4bTp+s9eN/0XmqlWueufrlTbUqV3rM/wvpuXxNcyl0U
  dS5e/1ntz3NbgdL3eke7Ygy+ZFu5Synon5qPeXrbp0oOvAeWCS296nFY65cEWden9pPN62suZ
  lViKMxINtZiLihMBTdsYelQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1663640720!298533!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31915 invoked from network); 20 Sep 2022 02:25:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:25:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D3A21100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:25:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C78BE100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:25:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:25:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.1.0 -> 3.2.0
Date: Tue, 20 Sep 2022 10:24:57 +0800
Message-ID: <1663640697-27650-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98887

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_3.1.0.bb => python3-eth-typing_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.1.0.bb => python3-eth-typing_3.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb
index 0e274c25d8..b810341d2b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
 
-SRC_URI[sha256sum] = "92698268be83c75f65a028d47421f7c0aed459be76dd7ce916af166dca8bc53e"
+SRC_URI[sha256sum] = "177e2070da9bf557fe0fd46ee467a7be2d0b6476aa4dc18680603e7da1fc5690"
 
 inherit pypi setuptools3
-- 
2.25.1


