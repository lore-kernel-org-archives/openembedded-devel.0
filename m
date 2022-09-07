Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431BBC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:23:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.6391.1662549832110070469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xxdPVjIY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549830; i=@fujitsu.com;
	bh=MAOjeIH/KjWKrA5e8CPZOe3LCNUw65xcRrTmLn3wxxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xxdPVjIYwVZaWBhrhgiFN8s0u9MtuAtcfrS1yiEg02woQtwxdJkWCnOvXmfVSaCic
	 UwgrecNOfiH7ODk7twE4WI0G83LZ58d8GD3iY+DPeNJL4zGlimEdbqyp+ieJkKKd6o
	 +NQf3AJ0b+9qjauoMZQbpKI7SaJLKEnh/QBO0Ot+wTbyDPUD0thpcKKWQDZyfDeS43
	 rUsiQkoawoiG9hR2sbiolu6e6Hh6oPV/w2MCZ7RgehHZt9XPhHZJLUjMiCDb+5vRJU
	 xINhDhhsg15MSDuwurA2e4Nx/5s+K0yIvk8t4G6COe8FlbDDhgvkf/nj6pscUft2ox
	 dcv3KxGsYSFTQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWde1XiL
  ZYO49U4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPD6VbmgmkcFTdfPGVuYDzM3sXIxSEk8JBR
  YmnrXlYI5wqTxMcfMxkhnN2MEvP+PwEq4+RgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAU+JW0172EBsFqD4xaVdTF2MHBy8Ak4S3xoTQcISAgoSUx6+B2vlFHCW2Dr3P1i5EFDJ8Q
  nrmUBsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamuia6RsaWeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgUGcUszyfgdjU99PvUOMkhxMSqK8cV4SyUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeKVqgHKCRanpqRVpmTnAiIJJS3DwKInwPqsFSvMWFyTmFmemQ6ROMepyzPzadoBZiC
  UvPy9VSpz3LEiRAEhRRmke3AhYdF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLUAc0hSc
  zrwRu0yugI5iAjtgaKA5yREkiQkqqgWnitD0OryY/0tgmFCiVsuXh241Fd27HrNj61VYw5/j5
  ZL1ZpwIb57S696XmsdxrOsr4XkCDL7FRxecIW3JQTk/f8/f3j3Rv2Pxmneypnqjfb8IfVoj93
  KP5bN1x3VU/3hS1BGe++cF561AIs+yWa2HPH8ZcsTz/plyxrepVclT96zaRG8Hqz07vv171Of
  xnne5pfXv7UvOubMdp8w/PEFJNP/5k0t55XRKeh/Ywcq9xfn/03arGzhd3d2rfuLTx7rt98ut
  3ne5J6LmhZlX/epHu/27ThLs1GY/P3auR0374ZlH3cbU/yzse6ep/K152/G3DCrtQz8154Tmz
  tvEtiTq41upJqvTspP0u3834ZSJTlFiKMxINtZiLihMBBM4WwmkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1662549829!331015!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17703 invoked from network); 7 Sep 2022 11:23:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:23:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7FAFB153
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 725A3152
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:23:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 3.2.12 -> 4.1
Date: Wed, 7 Sep 2022 19:23:17 +0800
Message-ID: <1662549799-17908-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
References: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:23:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98683

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_3.2.12.bb => python3-django_4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb => python3-django_4.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/python3-django_4.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_3.2.12.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.bb
index 17d402d652..44ea5394da 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
+SRC_URI[sha256sum] = "032f8a6fc7cf05ccd1214e4a2e21dfcd6a23b9d575c6573cacc8c67828dbe642"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


