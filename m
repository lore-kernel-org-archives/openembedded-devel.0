Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0515C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:27:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.4722.1644280019292929249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=twFpH57p;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644280016; i=@fujitsu.com;
	bh=tTvZrDnpcX6xppPnjG1Jl7i7T/7Tl/sV30ubh2gTvgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=twFpH57pvEJNE56zwK6ALbbsQzHwtFsL2tLgZKh3qKWuU9s6xBjlBmiBJ4NGZL7wd
	 fkXpZ48kyi6ctW4kIHkbdBIupjWee3ceMXQ7Tub3lWwZcgN9sIOlCClFY1dPGM1ECP
	 GSkZsmnrSdJRMvupgdq7ms4J7coThuYxZnZntzyEgd0UA/uAx8XGJyYRqMGKp8vSut
	 PBN2JZT1Vv5kREGRtTjP9euh4j5KDZ6fLxWIl1ZWL8DoAHif8bR4ti5E9VwKZObTW5
	 m7oXnaZMWI5h3tswh7PNwLV/4sJ9OkunYc0md5c1RrmUWnO6ham7mflEI7BoxQ70fX
	 y8wC/ZApXUj/w==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 74/3B-12986-0D8B1026;
 Tue, 08 Feb 2022 00:26:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHt+B2O
  SQe8PC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePP7w2MBY84Kraf+szUwNjI0cXIxSEk8IRR
  4uD2A8wQzgUmiQPTfjNBOMcZJRp/XmPpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jARuJw8zSwGhag+O6/HWwgNq+Ao8Tdj6fAbAkBBYkpD9+D9XIKOEl079sI1isEVPN/5U
  FWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxWSUWZ6RkluYmZObqGBga6hoamuiZAlqFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yT
  opeXWrKJERjGKcUsqTsY+/p+6h1ilORgUhLlzUxnTBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  Xt2O1BOsCg1PbUiLTMHGFMwaQkOHiURXm2QNG9xQWJucWY6ROoUo6KUOK8pSEIAJJFRmgfXBo
  vjS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeRtApvBk5pXATX8FtJgJaPHXRf8SgRaXJCK
  kpBqY3G/4+j+5OqVnRbj9L4nfUqct1G4m/xO3XfaQwYh52WO9sl7JJY+17lcGKHxJntTB0brF
  6kKw7scj+Ztnq9/+bOW700lbf++7c5zzT63/tP3m+gtJfce65wVIujNz7P+62MJmB0flpTUfI
  lLdnv8Xmyt194n+k6U3LimzRVYb268MFVLc+ixzFhPnTQatt8Wz/88NETFbFhEdbrf7gWTAw9
  q3z7OeixxbJ/IvOmDl0U0WfhHqSxyq1m7tFVKtUJ67LYXlXwv7wd4lYvavfY8v/5es8nFa9+p
  Z9Zvn3PPSZ4l6Lbdb/B5/EHfngTmfM/rSDmZN3vzQfNWyEvaUspnbMjp3r90S7jW3U0+Jfer7
  WUosxRmJhlrMRcWJAIim/FVeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1644280015!51652!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13858 invoked from network); 8 Feb 2022 00:26:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:26:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7AE471001A9
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E2CB100193
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:26:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lcms: upgrade 2.12 -> 2.13.1
Date: Tue, 8 Feb 2022 08:26:26 +0800
Message-ID: <1644279987-4303-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644279987-4303-1-git-send-email-wangmy@fujitsu.com>
References: <1644279987-4303-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:27:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95257

Changelog:
=========
Fix for pure white going gray in grayscale transforms.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.12.bb => lcms_2.13.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.12.bb => lcms_2.13.1.bb} (70%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.12.bb b/meta-oe/recipes-support/lcms/lcms_2.13.1.bb
similarity index 70%
rename from meta-oe/recipes-support/lcms/lcms_2.12.bb
rename to meta-oe/recipes-support/lcms/lcms_2.13.1.bb
index f07b881a76..e018c5bff7 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.12.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.13.1.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac638b4bc6b67582a11379cfbaeb93dd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[md5sum] = "8cb583c8447461896320b43ea9a688e0"
-SRC_URI[sha256sum] = "18663985e864100455ac3e507625c438c3710354d85e5cbb7cd4043e11fe10f5"
+SRC_URI[sha256sum] = "d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88"
 
 DEPENDS = "tiff"
 
-- 
2.25.1


