Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E662EC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 03:43:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.2157.1641267812388702701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 19:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jxRuSS6I;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641267804; i=@fujitsu.com;
	bh=/BR/AJnwIMXEJIA2PWXibF8IoswLg1DiN9LASroSYdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jxRuSS6I3snjHMYHpgKcfjjp5sabxWb5DdFYcmZjWkrvuMsVp1VCYMUFcSbBMX1V3
	 MVAEtvWviRlh/KgZWKDzLukR9S8SEE412DMtZxEZ4t4xeHu/7rdEHC8JRW55CE++pS
	 TGOvGBbQhjNExMfHizNX5S5MoKJaRIOo3ozUj2fEec1W0DaA+26bOWCA38s6ZqkaO4
	 IOhT+t+pnEFiIaeG3K5JCgWg4Yyv6Za3IQdfXtNcA6rKNWIvWP7mYt4QycM54i0FvC
	 IcvIJ/dIcUHNSN+wzCPJ9sNLvrUwU5UHMn7VsvbGgC/6kklvJGHI2zMKCd2PMP2wuv
	 /DbxGn2txMPOQ==
Received: from [100.115.2.141] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 13/B4-13695-C52C3D16;
 Tue, 04 Jan 2022 03:43:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORqBt96HK
  iwfcz1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b/k93sBR84K1YdPcvUwDiPs4uRi0NI4Amj
  xLObH5ghnAtMEkuvbmWBcHYzStw8fYCxi5GTg01AV+Lc47XsILaIgL7E0tl7mEFsYYFIibYNh
  1lBbBYBFYmTl86wgdi8Ah4SK3ZMZgKxJQQUJKY8fM8MEReUODnzCQuIzSwgIXHwxQugOAdQja
  LE7OnyEOUVEq8PX2KGsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYrRKKspMzyjJTczM0TU0MNA1NDT
  VBZKmJnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBl1LMMGsH46y+n3qH
  GCU5mJREeSusLicK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAVOQiUEyxKTU+tSMvMAUYCTFqCg
  0dJhJfnAFCat7ggMbc4Mx0idYpRUUqcl20PUEIAJJFRmgfXBou+S4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEeZtAtvNk5pXATX8FtJgJaPE5ObDFJYkIKakGpsP2Ebeb5lb6vp57/6daj4Z
  X2qkD01aHLilIu2t5hv1zh4Ar/6wHf4489Ap/oG/Rv43/w2O51c9OCv7kKb/4dE/GKauX9ok5
  pgqmN4QFllxwZy1b57Je1/HBvkUhbpFqOybcUNjXdffChPXvnDeZvdDlXyu2Lmz5zDdvDG9M9
  bKKXPb1cVnBLMalxxZeqf95w7Rv6hebH78L/Z0iNfxX/998Mahjuu7THW2HC+x7F8XMYLnwtO
  TIGfP18f9LP9+52h51wTmjWnqG4/NZVZavqs2CT+W+7MhrkmhbohUcGn8kPj1nqfeSXJVnT0p
  kvQ6Hv34jVimUIxp1SPRbJNuipdZ/fxc0Kz3Kcq+f653R+0mJpTgj0VCLuag4EQDVZIOSOQMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1641267803!82218!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30864 invoked from network); 4 Jan 2022 03:43:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jan 2022 03:43:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 85539100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:43:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7809D100196
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  4 Jan 2022 03:43:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 03:43:02 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-djangorestframework: upgrade
 3.12.4 -> 3.13.1
Date: Tue, 4 Jan 2022 20:42:57 +0800
Message-ID: <1641300177-14478-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 03:43:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94654

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ramework_3.12.4.bb => python3-djangorestframework_3.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.4.bb => python3-djangorestframework_3.13.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb
index b05a8d817..be85827ef 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.13.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "f747949a8ddac876e879190df194b925c177cdeb725a099db1460872f7c0a7f2"
+SRC_URI[sha256sum] = "0c33407ce23acc68eca2a6e46424b008c9c02eceb8cf18581921d0092bc1f2ee"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.25.1


