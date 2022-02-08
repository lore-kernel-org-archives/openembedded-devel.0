Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDB4C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:26:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.4755.1644280018199148448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NKYi+hfA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644280016; i=@fujitsu.com;
	bh=ViYAD6pQrh7KjidFWXNr/n6NhxW6XXgEXk5mRTf2jwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NKYi+hfAFXZ67AU+n6n7QKpv65TqLJcOZwaDaz8TMnU8iQQvllR2GaCTBmZ1KO/eU
	 KLBHBPJn3TY5RkPxHVYmjXjOxFFWNsGqboSDKMLBbSKcATs0X1WyMR4zm/DRUfAU/7
	 212m33lv4nsTxgsKRVunIcLnYSLgIvxh0FdvrZdY2oNiBFekcXrLfij+9W9icap1dX
	 rFHeimUTDKOjOM1ZtQKt9fWOCbHnhAZ4KZZhyZ4gLcg3KqZzKKsUqplThPtQCgoHJp
	 8PNRvIgGjI92Ggf3iRFDDVmxlvL6pfpxB8OGAeJiG85pK/RMqbKmOgn2vfkl1z3K0l
	 hvtnsRSUV8O2w==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 29/86-28285-0D8B1026;
 Tue, 08 Feb 2022 00:26:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqHthB2O
  SQYesxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa0b9esaCfs6Lr/AHmBsYlHF2MXBxCAk8YJbaf
  fsUK4Vxgkjh8cBkbhHOcUaLv8mT2LkZODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787gGrE
  RZwljh0bj0jiM0CFF+ztBWsnlfAUeL4/MNgtoSAgsSUh+/BejkFnCS6920E6xUCqvm/8iBUva
  DEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9MqRqu
  kosz0jJLcxMwcXUMDA11DQ1NdQ10jQ3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzAEE4pZry5g7G176feIUZJDiYlUd7MdMYkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8Z
  7cD5QSLUtNTK9Iyc4DxBJOW4OBREuHVBknzFhck5hZnpkOkTjEqSonzmoIkBEASGaV5cG2wGL
  7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3AWQKT2ZeCdz0V0CLmYAWf130LxFocUkiQkq
  qgYmtlatkmt0q9fPT2nbJCh5XbV/7uj+w4cPTgAWyfG4erJf2Ct5n/LOYRcjjb9mxnsbNC04E
  CX3v9P95cvuOlAVMb4xZWDsjGsqusbaFuzkWCpWdZLYwENXtd73W9KFGnrle8P2BpydXfeD71
  5hy7S7bzO4YXfdv7ELaHdUr/XT23r3F9C+iqfrOoXX91wqMGhPXSfQ6W9x8Yvgnp+DQUp0Npx
  a/mh2d1ZZR+/z4r5o3a7Sjra9Vx+xd7+zPwDJH0cjD6M+Dr8X5SjebM+4Ls67ZadD+bV5L0+v
  qSyXbxO6KzDvnsyotYee15c1Xek3+nD4cYmv/Y81Bl6PCoY+ZtsxTPd+vn726pH/Z0VgFPiWW
  4oxEQy3mouJEAG7hI+RcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1644280015!51387!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14276 invoked from network); 8 Feb 2022 00:26:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:26:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8B2F71001AA
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6FEC310019C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:26:40 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.53 -> 4.54
Date: Tue, 8 Feb 2022 08:26:27 +0800
Message-ID: <1644279987-4303-3-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95255

Changelog:
=========
- fix use of cache when calling ->cookie
- thanks to Sergey Panteleev for the PR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.53.bb => libcgi-perl_4.54.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.53.bb => libcgi-perl_4.54.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
index 04bc362dfb..bca20f6a4a 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c67e732f3c96bcb505405fd944f131fe5c57b46e5d02885c00714c452bf14e60"
+SRC_URI[sha256sum] = "9608a044ae2e87cefae8e69b113e3828552ddaba0d596a02f9954c6ac17fa294"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.25.1


