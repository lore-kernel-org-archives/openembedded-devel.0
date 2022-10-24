Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198F8C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:00:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.16380.1666594851418121071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IXHSz6tg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594849; i=@fujitsu.com;
	bh=vOqdykJ+cfU9a2sk/ABnC8PP7VkFuiPRX6WeGIqp2+0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IXHSz6tgi52bAyOx0hylJJlswiPzR5VxwebxkWoqN9zf6ssiBdaAniGruRMp+QUe2
	 Yzbi81jNd515Svfd1I1VP5BW5rUupbpDbPDA7RbUSjoU+SwcKqRw1sc299rgBk7bDu
	 VbSkmjLQx0QBcW+ADXQAd9hHgjZjX2W+5XiHMYGGaSlO49pIeYAoMwnwriN+w3u6dN
	 UaCV93J4dJIX8JdrZ14S6P08mtJ/MDfvJJtDL9U9ZL7/k1Q3SMepxmUbjmOK6iUuS4
	 0kdhxDHMe94pYL04rQjO3vDLe//Bah0aBfFcOhhNFf0e9rScfPQNiSppXrucQDpY9j
	 QZnnCYEHmlnVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWVfBIiz
  Z4PA0a4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP9qWnBXM6KU9+3MjYwHuboYuTiEBJ4yChx
  YdkMRgjnMpPE2Vt/2LoYOYGcPYwSVzu4QGw2ASmJG/f/g8VFBPQlls7ewwxiMwuoSLz43cMOY
  gsL+EjMfrQRzGYRUJX4sfwKE4jNK+AkcaR/EguILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmqPoKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGM2KU4vKUot0LfWSijLTM0p
  yEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQJDMaU4PXcH46Vlf/QO
  MUpyMCmJ8jKIhyUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCt0QLKCRalpqdWpGXmAOMCJi3Bw
  aMkwjvLCCjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VClx3p9mQEUCIEUZpXlwI2AxeolRVk
  qYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG+2OdAUnsy8ErhNr4COYAI64tKKIJAjShIRUlINTML
  6H7z5pkx6n6sU++lW0rXfKo2nPdhnTDOQ9y5++NYuVtBRu/HKmSzpW22+Cxe8P/wwivF2eJp2
  lOjp7UIXPFyv7Da3nD+tM1WwcJOVjF6FbN6Fbndh930FmmeevdEyTzzLFrXGc/8P7T+5S9SZc
  gIeW2SZbjj6wClCzUx/51GV9GdLuJn8H7zs+vYv2fdHfe1Dx5emfFGB4vopD55m7q7eX6ec/M
  R695Q1L3Nyrsx4YvxBIJT74ponuUaiB5UVd9ouPaZY/+zai3f+/elcrhe51/b+nvvv224PZ27
  L9def5jZ6R6SYcHNlK+2LyJeOPPCgIfvcEa1vi1ccOap5QFRXoJfVyetEzyXb2zkzlViKMxIN
  tZiLihMBKVNXxkwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1666594848!197087!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21371 invoked from network); 24 Oct 2022 07:00:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:00:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6D5BD151
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:00:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6001F7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:00:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:00:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-oauthlib: upgrade 3.2.1 -> 3.2.2
Date: Mon, 24 Oct 2022 15:00:30 +0800
Message-ID: <1666594830-29409-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99286

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-oauthlib_3.2.1.bb => python3-oauthlib_3.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.1.bb => python3-oauthlib_3.2.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
index 8cc30489bf..566279d71c 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[sha256sum] = "1565237372795bf6ee3e5aba5e2a85bd5a65d0e2aa5c628b9a97b7d7a0da3721"
+SRC_URI[sha256sum] = "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
 
 inherit pypi setuptools3
 
-- 
2.25.1


