Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E31C7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:19:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.103818.1683541179603883393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HGt/Usq5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541178; i=@fujitsu.com;
	bh=JyPtqHa7d3303Ft/fOmnW3xFRbhuCjtVYkpwx0d5IWY=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=HGt/Usq5dYQdVIfuI7bBgdFa9bWpAw+bRgzvmW1WM2PeKsbh20wmfkR7wJYCVEe5C
	 IdqpTcXg9TAW+3OyvRnoRop9uTtJRSKfciBCnnrLTmNXNTbudUpuSn1fF1f+FS/vMl
	 FGl8b23POAgbgb7vMeE5N6R5t0MAIt66ZX29YzVOgbipiRvFW0HQlgOsDscWhb9vEY
	 sHv0puIrwZeBKX6aLrwMmU8tA7zpNXdc+zWNHDUlyC6gDJd5PsS5E7lcVEh4DFW09y
	 gBlIPaVUg/jEBN80hNUSGhXbWpKFZI5B2jsOCOWFyJn7xn0aIX72XVwm5SXv9UdR5H
	 0EuUgZkUPORPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRWlGSWpSXmKPExsViZ8ORpLvzTES
  KwdovahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bHWRuYCi5xVVy9uYutgfEBZxcjF4eQwEZG
  ibVHWpkhnGlMEmvuXGXvYuTkYBOQkJi+9ySYLSKgK/Hxw1xGEJtZQEVixuQjTCC2sIC/xKPf0
  8FqWARUJf5+OMMCYvMKOEl0nfrOBmJLCChITHn4nhnCVpO4em4T8wRGrgWMDKsYzYpTi8pSi3
  QNjfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAr2cUqy
  +dwfj/l1/9Q4xSnIwKYnymh4MSxHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwetyOiJFSLAoNT21
  Ii0zBxhwMGkJDh4lEV7ZI0Bp3uKCxNzizHSI1ClGRSlx3pkgfQIgiYzSPLg2WJBfYpSVEuZlZ
  GBgEOIpSC3KzSxBlX/FKM7BqCTMywCMGSGezLwSuOmvgBYzAS32vxwOsrgkESEl1cAk87XeR/
  LmrpMTmN6XBF35+ztimT+n6K7H643cBbiXndxy7/+61S62WlrxuecWzmASi2EvWL61cOnZ3uM
  bOw48mLVLR+BKSl5kifpx4Rnvv+08dvxa8msb3XShpZuy7088UMCw8/NZ3qAvrd13nROW75lT
  E/z9f7bPXc3IgwtMbzntbNjWP5fjsGoL29v4xHsvPx/n+6aTuJ/5jqJC++dXvxrU1pyua/Rxe
  Ra8QY710dUQ4T+utjXPsuTTk5gyhK72Cn39ujonumJ1ecarXKEs5rZ1qqe4+J4cCfRZV9Qxc7
  bX+TmpesaKXkYplh5H0zWnlBbZTVUqZCtvUF645UkNx+bEzqcpb87Mfnp5reYMJZbijERDLea
  i4kQAtSjG4e0CAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1683541177!415278!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15892 invoked from network); 8 May 2023 10:19:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:19:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 58B6E1D5;
	Mon,  8 May 2023 11:19:37 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7FA7D1D2;
	Mon,  8 May 2023 11:19:36 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.1.1 -> 4.1.2
Date: Mon,  8 May 2023 18:19:25 +0800
Message-Id: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add support for Python 3.12
    Fix self shortcut operator (adding is_schema_node() to node classes)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.1.1.bb => python3-elementpath_4.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.1.1.bb => python3-elementpath_4.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.1.2.bb
index c5f96f2ded..4a49e0cfa1 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "cd2bff3de8cddf8a480f728e648c6cae47d8ab66696c7d830a7a84536d8cae58"
+SRC_URI[sha256sum] = "0bd0ef5bad559b677ba499e9c7342ca1f2ae2bace90808ee52528ec8d9f6e12b"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


