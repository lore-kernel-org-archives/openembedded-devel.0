Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB48C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:01:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.3062.1657180904299384698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QgKP1XmB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180902; i=@fujitsu.com;
	bh=YxJyw7c1ZZQ8AeEr91vTq4KJK9AA/Jwfenrl61AnsZg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QgKP1XmB++re5i4moGxYfx9V+l4QunapamMHtcLiuEPTmsRD3YS0kMb3LHXmcVtcN
	 IyoFxpl/TKuGKlDLlpr/kyXi5Kj+2ea2mSZjvXYsBJr7crhCHWFDxwQWigNzL769uQ
	 y/NQTZ5sav/XzzKq36WUfXUTiiCTTma3Or+dmFBY029GQMHzHBuAqS+JaRgu8hm+ev
	 0JqCRqeXeuyhc8+8s4fO9hEgeJhvBa019ZBH47brGIf9k3gZAdWKuzy3KkpBo9O3vL
	 AAt8sXR66gs1lMeAEyDQDeZJfiJsqCt4bTgvimiBcB4yw2tWYYA3BhqeGHnCA2AcUL
	 MXThjckV5Pvpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORpPts0rE
  kg81/eS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz5P/tZCpo4K849XcjUwLiEo4uRi0NI4CGj
  xLI795ghnCtMEkff9bJAOCcYJe5Mm8LexcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  WA1wgIeEktvzQOrYRFQkZiybSaYzSvgLnHnzE9WEFtCQEFiysP3YL2cQPV7dl0AqxECqjny8h
  IrRL2gxMmZT1gg5ktIHHzxghmiV0nixIqPTBB2hcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJl
  WMVolFWWmZ5TkJmbm6BoaGOgaGprqGlvqmhrpJVbpJuqlluqWpxaX6AK55cV6qcXFesWVuck5
  KXp5qSWbGIFhnFKsbrKDsXvlT71DjJIcTEqivKt7jiUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCVngiUEyxKTU+tSMvMAcYUTFqCg0dJhHcJSCtvcUFibnFmOkTqFKMlx9TZ//YzcywHkzO/th
  1gFmLJy89LlRLn/QgyTwCkIaM0D24cLO4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQ8
  yhSczrwRu6yugg5iADlqWfwTkoJJEhJRUA5O2tdmDv3uaX/779k/gs+VOPYYlDIXJ0jONTjwP
  KmC8z/ZkSsy8y1FrH3ft2mXbaF2uICFoy1RrVJq92njR0cVMJWJPshRXuXlwvXTM+tY9h6WFw
  fW8sN0Xx5jGA1JuN7yE73u4MNlGF/LNSqrqYH38Mjjovk+PtJr7pY08dd36Uh+tT0QIXn580i
  ezS03zfWvb+jbzb8u2vnJIfNH/KFZPwIP/0vH4E2q6H8K9w5XvzOrvrbVd9Eft2mehRf2npv3
  iXtVqcLAvJca07bvvuRx70+KyeZ8Nirs27zjfOP3luzuTud+df8VQaVJ+RO77FMOf956V5nHy
  P9ukdS/27seOcm+drCi2+c8OvTM/q8RSnJFoqMVcVJwIAGn8hDB2AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1657180902!20900!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11454 invoked from network); 7 Jul 2022 08:01:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 08:01:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E32311B7
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D4A9A1B3
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 09:01:30 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lxml: upgrade 4.9.0 -> 4.9.1
Date: Thu, 7 Jul 2022 16:01:13 +0800
Message-ID: <1657180875-31986-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97754

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-lxml_4.9.0.bb => python3-lxml_4.9.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.9.0.bb => python3-lxml_4.9.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.9.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.9.1.bb
index 74c5e480a..92a30f790 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.9.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "520461c36727268a989790aef08884347cd41f2d8ae855489ccf40b50321d8d7"
+SRC_URI[sha256sum] = "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.25.1


