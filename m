Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014AAC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:23:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.48907.1671538994456998805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IOVH3n2n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538992; i=@fujitsu.com;
	bh=wYiBuwtvVuPsdu/vLXOprNsB1UxLltaZqsmQBZKHi/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IOVH3n2nUN0IhsspAQ/uqZlNmoTGLsbdeb+mmn2QbeRIJVttVQzKcnQNHCFHIwnX3
	 9U1irhm7tP9cEX/6rl2F/1pOQVIRY3v6LGxTAO2+ekhPR4EEOkD3oEbJz4ZQdnsskU
	 AXF+QHkNLxzAAnQdLxgpCtOqYAQ6NPoj5HSqsGS+/Qv1gveh93OtCB/+d6+aozTzhT
	 S8jyxsWpr8EucEWQb0wEmjHt+W72265EQx+75StGMSjdeskVaf51uVM/L2fYOTCy3O
	 SjlSz92LkNl7DKX5N0jIIy0hovGy/SoxzoDGl2m5WoGe2kKQdniXRylRy8y92rouiI
	 FTpAujhYYxl1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8OxWddg5cJ
  kg1Ov+SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy5/2ezFSznrFjU+oK5gfEERxcjF4eQwENG
  iU+nXrJCOJeZJC6caIZy9jBKPNvzhrmLkZODTUBK4sb9/2wgtoiAvsTS2XvA4swCKhIvfvewg
  9jCAt4Sj3/0MIHYLAKqEg9enwaL8wo4SsxdfYoVxJYQUJCY8vA9WC+ngJPEpjNzWUBsIaCag3
  MOsELUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC9OLSpLLdI1tNRLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4JTi1OgdjHOX/dE7xCjJwaQkyhsWvjBZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvjEVAOcGi1PTUirTMHGA0waQlOHiURHh7ZgOleYsLEnOLM9MhUqcYdTlmfm07wCzEkpefly
  olzvtiOVCRAEhRRmke3AhYZF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrBDKFJzOvBG7
  TK6AjmICOOHRpLsgRJYkIKakGpubT+w4dLGCfovUhIkfgdJLm9o0WdUI/ip0rXDaE9+XYrWDg
  nfInzPjunK01XL6PPHbE3THu3N6m28DbXefWv6OCySTzpYDwhep9G0PddSzq3gmc69/+MM/AZ
  mVRk73dJMVHhoudGlXFf/5VWJwUbt30bGXx++xiXuFolo2pnvzPvi6/pPz3sunj5XVX3iyadP
  3MRt/lHByrr7pwqdWk24c/eFa48WDBp5PewSx6P3VNr5jkGvSLnjhYmLHC/Ii2ewf/59qziQ/
  ivHfOmv2tfArnxGt7S9+1hKgdNOth8r3zfEma/8b2tb8lDzH0L7T6+ubClCczi8xmsLaEfEk8
  0/U4sOvQn5AWF52VKVe4lViKMxINtZiLihMBwcROXWcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1671538991!381450!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21001 invoked from network); 20 Dec 2022 12:23:12 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:23:12 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ABA7F142
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9F38A73
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:23:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydicti: upgrade 1.1.6 -> 1.2.0
Date: Tue, 20 Dec 2022 20:22:27 +0800
Message-ID: <1671538949-7267-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
References: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100147

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
add type hints

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydicti_1.1.6.bb => python3-pydicti_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydicti_1.1.6.bb => python3-pydicti_1.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb
rename to meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb
index 17c52881e..18d3a0aa6 100644
--- a/meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/coldfix/pydicti"
 LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
 
-SRC_URI[sha256sum] = "32eb329de2023c92158ac6c2d67837adf96195f188ba8d768b3248a0218b5a65"
+SRC_URI[sha256sum] = "32d59407b3229b22702910bd10f53d46c330481b5aea7cce076630d661be9d1e"
 
 inherit pypi setuptools3
-- 
2.25.1


