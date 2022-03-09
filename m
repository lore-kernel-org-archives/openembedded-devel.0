Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8E1C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.3113.1646811027240554060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 23:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tIDQ3m9c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646811025; i=@fujitsu.com;
	bh=S5SHlf+NTShT7VbN/wIriYnnEehyXTSXiY2MW+1axsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tIDQ3m9cAx05CpLfzuNXE9e0D5kRy0ME6qdmBVYJ43CF8MS2c/GIfpunPZu13qH5z
	 DwQbsEy3N5yCgCEUXRC5Z1UWUz6kDxQ7DJU6vF++3xTBQz880I/FbmpbPElyLfJgpx
	 577/z/jNLR64a1LA7EzuTnK1AYWfWsx/xfV/5v3wI33WQkdqq3f3fndxbctoYeFkpB
	 qV/c+ooZoHtlJubHi4uSjwgFsDP1FphpYkQtGJ5ZX2vRF7VQzssSerbWJ/0YrYtyz7
	 lRhRZkajDuhvJTymld6wHdKUilEsKjsPKOrJ0pnWoFcttbyYQa3F6x5PAKy/Y5y+HC
	 TPiRVdWjFKgDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqDshXCP
  JYMlZfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNb80u2gtXcFcd6XRoY13B1MXJxCAk8YZSY
  /v0sG4RzgUli6v+pzBDOCUaJVTsa2bsYOTnYBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovrgGr
  EZYIFyi6+k6JhCbRUBF4sCGfWA1vALuEoe33mMFsSUEFCSmPHwPFucU8JB49XEKG4gtBFRz+d
  0DRoh6QYmTM5+wQMyXkDj44gUzRK+SxIkVH5kg7AqJ14cvQcXVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SyrKTM8oyU3MzNE1NDDQNTQ01TUz0zU0NdVLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfr
  FVfmJuek6OWllmxiBAZzSrHT7B2MO/p+6h1ilORgUhLllQnWSBLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwVsUBpQTLEpNT61Iy8wBRhZMWoKDR0mEty4UKM1bXJCYW5yZDpE6xagoJc57FmSmAE
  giozQPrg0WzZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNqgUzhycwrgZv+CmgxE9BiOyM
  1kMUliQgpqQamrPzy4+8XTj5++16+sk7vNM/NXtPyo+rTb23Te7NNZueH3fWvpSINt89+Zsm4
  MnPZpHjveVuK1ntd0tX3bNnAz31puabA3rkcazVtX/izXuxcNnlV4uUp36zKS5InXdzF5bhor
  6boLfmCbfeavbxMYz/uqWL3m181e8tzK37udw/vNOw9plFnbcfrGSq1f1eYXvRvZrY1UQuipC
  cxxGs1nP0074D2vktvf3tdUthXNu3ka/Yqc+mmczkTKzdfavvunukTt/KFVdne+4UHPX4kWT5
  eru4u6VRu53DeJdi1/YP+dIOOFdtXGNole6zdKrW6ZDJHVXx3zgJTK4uMD+elQ60CbzKuO94g
  UWzil/VBiaU4I9FQi7moOBEA7C50xGEDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-528.messagelabs.com!1646811024!16282!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28214 invoked from network); 9 Mar 2022 07:30:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 07:30:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3DAB8100199
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 30CE4100190
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 07:30:02 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/5] [oe] [meta-python] [PATCH] python3-txaio: upgrade 21.2.1
 -> 22.2.1
Date: Wed, 9 Mar 2022 15:30:27 +0800
Message-ID: <1646811030-14487-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 07:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95894

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=============================================================

- fix: cancel handling in python 3.8/3.9.
- fix: gracefully fail if coroutine called with wrong args
- fix: eliminate redundant dep. on mock
- fix: doc note that twisted supports native coroutines

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-txaio_21.2.1.bb => python3-txaio_22.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_21.2.1.bb => python3-txaio_22.2.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb b/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
index 8b55b3641c..e2102695ec 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8"
+SRC_URI[sha256sum] = "2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01"
 
 inherit pypi setuptools3
 
-- 
2.25.1


