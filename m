Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6499FC77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:19:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103820.1683541182329369640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s24kWazL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541182; i=@fujitsu.com;
	bh=9imlxwhuyN6m2HheSMmfvM7DXPxREJu2p7x8UPsfOGs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=s24kWazL5/WVtQp/2rgNsufhdpw5bC/BLX3UD6k+cb/nHrdKPhF2RZQ21PgdZiBFW
	 7MwZ0RzitcID/Bpgf3B/0OJstq5BJCliKWS+iQSjAREEsywKRv+6MlUjtd/Mf26QSx
	 RWcktGJ57chDt+f8yv1sKNDmFmzeW5rN+gY0agpMhK+UONm3+d6z0LdFi8krTpCsQO
	 T8hr28jWt+9Dh2KGBn3RotJAo3PFp7gGmydfmD9M7b1b19JrTwkGjM8ZYCli9HlajE
	 1N7JnpZIAEJO9rWSbHdkdLCA9KOBjFjFJrUGUOOtSqa9xBThu56SP3Wqlmf0Gp7/+u
	 S+VZkbOV+Rx7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpLvvTES
  KQe82RouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHwn6mghccFS+n/2NpYOzl6GLk4hAS2Mgo
  0d9xixXCmcYk8WnbOeYuRk4ONgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+wgRiCwt4SCyaA
  FHPIqAq8fn0DBYQm1fASeLG8XdgvRICChJTHr4Hq+EUcJbo+XMTzBYCqun89pwRokZN4uq5Tc
  wTGHkWMDKsYjQrTi0qSy3SNdFLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iu
  uzE3OSdHLSy3ZxAgMipTihB87GG/u/Kt3iFGSg0lJlNf0YFiKEF9SfkplRmJxRnxRaU5q8SFG
  GQ4OJQlel9MRKUKCRanpqRVpmTnAAIVJS3DwKInwyh4BSvMWFyTmFmemQ6ROMSpKifPOBOkTA
  ElklObBtcGi4hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4GYIwJ8WTmlcBNfwW0mAlosf
  /lcJDFJYkIKakGJvnPN+oe+izlOZvNGTSjLuXSB+GHs1sX/Kl6vmFFQqDHxuu1nhcO5HaIlDo
  wX/rKbpcp9/zXJsVT6iFFjdenG9wIU+OIPJqbxPM74+SWr14XDLwVXp4/sEnuiuX2r/YpPEVn
  u8NC3VRl7026w1jx0KBK0PC3RdwEk1cuPIyme0Pf/+ht+M6bLNb2RT9hzzHvz8HuIXsWxDN/F
  dphxlvAs1Fe862ZVJWRXfXL9W2XRU9tOTNz/9flnN3WfqfP9dZ+elMqL15RbMW1u/re2lizwN
  bjazdP3nvUM9nzleTc322BGatSvc7eqT6eq23n5ZHH7vRyYRDLm18ZN9ds08ubl501M+ZOXMd
  Bw1cun358UGIpzkg01GIuKk4EACaWl4oFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1683541181!498186!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12283 invoked from network); 8 May 2023 10:19:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:19:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 777D41D4;
	Mon,  8 May 2023 11:19:41 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9E5191C2;
	Mon,  8 May 2023 11:19:40 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gast: upgrade 0.5.3 -> 0.5.4
Date: Mon,  8 May 2023 18:19:27 +0800
Message-Id: <1683541169-25445-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
References: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102413

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gast_0.5.3.bb => python3-gast_0.5.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.5.3.bb => python3-gast_0.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.5.3.bb b/meta-python/recipes-devtools/python/python3-gast_0.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.5.3.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.5.4.bb
index 7fd49456d2..9c750ea3b0 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.5.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea"
+SRC_URI[sha256sum] = "9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97"
 
 inherit pypi setuptools3
 
-- 
2.34.1


