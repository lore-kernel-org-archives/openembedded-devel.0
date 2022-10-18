Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18095C4167B
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:10:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.1766.1666055406604034009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U/55XhwT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055412; i=@fujitsu.com;
	bh=eOcTaS7ERViQc39n38joB+R1NxTmVoOwB1h3aT4/7hM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U/55XhwTKPeCfihiHMh5WWFx3eVbGGyXShs9gCqiZqeymedYxuM7gb7/nalJWRK5U
	 vPQzs+p8LmaTV9JNucpipKxSM64UIdMAdEzYfoSdWOWHvfHTQq7t5draB78MO7PsIT
	 B45o/Dj7vgwpVOd74J29ZLBP/2Ai6hLFygZLc73xCnb5OCunksb5Gr+V8VALjSh3A8
	 Vt4cLxdJzaRO/U6CKFvo+/EubE/OgJpDEqcEKGpZ8cFfBt3vLZiUCny7RD7jVZlZtw
	 D1Z8rhQcmCVMuX+wvsf7juv45PlYEr9p/4c3riSRi8IYmF9tBdQJHhP/PnlRCTjqsK
	 wFGXOVBW926ZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffzH99
  kgxn7JCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxVZw8xFlzmqHj9+BZzA+M/9i5GLg4hgYeM
  Ej/aHjN1MXICOVeYJLYcs4JI7GGU2HV7LyNIgk1ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  4AmcXAIC/hKvG0PBAmzCKhKzLpyEayEV8BR4tjqjWwgtoSAgsSUh+/B4pwCThKLfh9hhdjrKP
  H8yUJ2iHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYymxalFZalFukZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGBm1LMMnsHY8/SP3qHGCU5mJREeTtm+CYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uDt+AGUEyxKTU+tSMvMAUYRTFqCg0dJhDfqDFCat7ggMbc4Mx0idYpRUUqc9/RvoIQASCKjNA
  +uDRa5lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86b+AprCk5lXAjf9FdBiJqDFGfu9QBa
  XJCKkpBqYJJL4OLkK5187LX33SUxXsOuvidsOvVjWJ/U76ckNr20BNw6VRz6/kH6BxyAxWJ1b
  e+7hjYFzfvDHNj+WWV79f7a+qx2nBqd+55aLLMYKk7wWnSmu2XbX7BDLerGdmcfnbdg134FdR
  9huuawJm8V2kwD3BcWbJjfc2/KLqXRyRWr2w5m3Yx5/5gyoOum+rPqMab7oi/tm0mXcoQ0HBG
  aEXnVevePckel51jJFeR4cPm7rpPU/5uhFlgfsuJxX9icmbMm76euOe6pPnCd0/MmTuMosd4E
  pbIJ3quacZu5Ls771P/rRy/gCu9BNP//Eijy+Ur36fFrb/p28uncdOzJCQo1LuVw6HAsn5uy1
  XiGoxFKckWioxVxUnAgATD7/JlcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1666055411!282925!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29616 invoked from network); 18 Oct 2022 01:10:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:10:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 08E7C150
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F02BC142
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:10:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gevent: upgrade 22.8.0 -> 22.10.1
Date: Tue, 18 Oct 2022 09:09:46 +0800
Message-ID: <1666055387-8084-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
References: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99220

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_22.8.0.bb => python3-gevent_22.10.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_22.8.0.bb => python3-gevent_22.10.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb b/meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb
index 96a0cb78e2..9319dad89f 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_22.10.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "868d500fe2b7f9750eadc07ada8ab32360c0e71976be2bf5919482f14a6477c7"
+SRC_URI[sha256sum] = "df3042349c9a4460eeaec8d0e56d737cb183eed055e75a6af9dbda94aaddaf4d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


