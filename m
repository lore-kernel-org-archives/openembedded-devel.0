Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FC7C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:47:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.4040.1665391655580955879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vm0sGSlr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391653; i=@fujitsu.com;
	bh=lUDJK+BDcZUuv5YvBJ6vdI+zJNQeEw9JeBfQlMbhT+w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Vm0sGSlrrttLSSFZFiCbLO/ycZkqaVd6ZvIgmSzTGP3kA62eNw4h2Nrz2dWdLac7B
	 emKrianIy76jmtN2+ljt9UK5ZuVKrJRER9EI6CKkMtKVgeA3Hcxb10urwusxHcGsQs
	 AJ7dEZfKmyqTWJSweJFP4ffJP4OGsIFScpgXuJkkSWCb6qZo7vxcNJXGpx74GzQvRR
	 aLLam0i0Uhqn9Gm7Yr2q15y1522hPKVRqYy2ggPy3vn3dKU5lMGl2ZnMhvsgnqg5AX
	 2HrWLsUo4BBQMhWDR+6MkjoSez/MYVRQPlBErFpMacghVoDqfDY9LHTZHJaj1mVsjk
	 IcaizYHBgVCdA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORpKt8xzn
  Z4MQDOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPz0AemggVcFR+v3WZtYNzF2cXIxSEk8JBR
  4s/bKewQzhUmiR3PXkA5Bxglpi1rY+li5ORgE9CVePFjMZgtIqAvsXT2HuYuRg4OYQFfiZ0TK
  kBMFgFVidaH3CAVvALuEtdPzmUGsSUEFCSmPHzPDBEXlDg58wnYFGYBCYmDL16ATZEQUJSYPV
  0eorxCYtasNiYIW03i6rlNzBMY+WYh6Z6FpHsBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY0t
  dCyO9xCrdRL3UUt3y1OISXSC3vFgvtbhYr7gyNzknRS8vtWQTIzDwUorVg3YwflvxU+8QoyQH
  k5Ior8Eh52QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxPbgDlBItS01Mr0jJzgFEAk5bg4FES4
  X1wESjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VClx3rpbQEUCIEUZpXlwI2AReYlRVkqYl5
  GBgUGIpyC1KDezBFX+FaM4B6OSMO97kCk8mXklcJteAR3BBHTEyatOIEeUJCKkpBqYji1U9vo
  S8WDlQp8+ldqHNxX/WxrenR6mvaOlw7ltWbNL39kQh4nzl9s6JEwPvcRd8upMrwzjBccjNyV2
  BURNfKJ6r8rD7O3dXQX6ro7L2l4q18c5v19tM1HrddTjs6tcHcI5A09Etyy4Iiz7rG/O/Mnxi
  5g7otuOyMw/8Kjv25Nr6xXf3NxR7NAmunHxOf4yBYYzyifnvf79w0yj1ZhB7uuuBbWMmyITbF
  y6zz7rPPbBZbupxNegmsTlb5Of/Ze07RRNa2OwKnvj9pjP7eFbvuAtZuXvr85wePyt9HpHbYv
  4GdM5LO1Pz04MerSr+32ciynDEReeI4/Ou562u8J394bn37LyRze8T8ysCeATV2Ipzkg01GIu
  Kk4EAI2nonNDAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1665391651!4470!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29822 invoked from network); 10 Oct 2022 08:47:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:47:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 319751B1
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 262E81AB
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:31 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:47:29 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.1.0 -> 2.1.1
Date: Mon, 10 Oct 2022 16:47:20 +0800
Message-ID: <1665391640-2649-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:47:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99126

Chanelog:
=========
 Fix schema_path usage in XMLSchemaBase.iter_errors()
 Add allow_empty option to XMLSchemaBase validation API

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-xmlschema_2.1.0.bb => python3-xmlschema_2.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.1.0.bb => python3-xmlschema_2.1.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb
index d7988b8761..ff7e9696d4 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "e7f70c305e0def2a2293ab7110827086c477ab3c6f8757d2acb3ccbfa6b425a4"
+SRC_URI[sha256sum] = "5ca34ff15dd3276cfb2e3e7b4c8dde4b7d4d27080f333a93b6c3f817e90abddf"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


