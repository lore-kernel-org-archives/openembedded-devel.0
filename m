Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A7DC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3743.1672803692730297018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LGl8e0Mn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803691; i=@fujitsu.com;
	bh=p63tLcquE5svPNNZ8LBNlHwLaV0NIg3S4SU/uWp7RwQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LGl8e0MnvS67l/obS+HOfKfYmgC8fpd3prjEI4Y6c9olQCaYO9qQo6GxE2DT+KZQ9
	 YyYmbNBCyps2vx57ecrAQQiMKU/OZuday/W8IcKxLPOCNIQHfLOO8jCKqG1cLWl4R9
	 wq9AMf5m3FZkc4vPDIehTtjk1IC9i1KWJSofVgSK+ilKY149gRTXzF0s/uFkQR8NAA
	 BPj4aa0oAshmthOGMGRTUZxLPSvBJn12CKuaynbP6A9QMUuwSVVyVLBBPEq2YG68TX
	 a72btUZIReyaQfC/2p2pAUUUC/Hz6kzbvMT+6STLEUZbUTG6DPxQDGj1J6sqJyUolS
	 ZgD8t0UpHl1bw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpJv1dUu
  yQf8hc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNyw3r2gincFdfeNDE3MPZzdTFycQgJPGSU
  aLtykQXCucwkcXdnM2sXIyeQs5tR4lyXLIjNJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICPxLcj05lAbBYBVYm2+R/AangFnCRW3moH65UQUJCY8vA9UJyDg1PAWaKrTQBilZNE88
  dmFohyQYmTM5+wQIyXkDj44gUzRKuixOzLEDUSAhUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFula6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm5KsbrqDsZzy/7oHWKU5GBSEuUt+bwlWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr
  /onoJxgUWp6akVaZg4wimDSEhw8SiK8WSCtvMUFibnFmekQqVOMuhx3F+7dyyzEkpeflyolzu
  v6BahIAKQoozQPbgQsoi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZdDbKKJzOvBG7TK6A
  jmICOSFqzEeSIkkSElFQD0xJpkYucPaJ7p0kpqWZq73hwLPLedzfpL3pMi0VU5iVO/MjpeN8v
  e0fZos2zk0Lsp9+2XrXPt9e04EJovcI5g2WTgpZ9MAuc7yi05sFVvTL1/ruSjcFJv7pcTnS0R
  DNsvne8fG5fskah+d2JFyqfCrflbKyOzXuw6GKhikyDVvDSZbfSS/g/z/718cZPxSe8ebJMaw
  1V2Jo9j32u/1cyve6s7fLP121535r22X/0rv01XWpJgdO6SKXu9z1u6qXR8t1SVqErahN1wtY
  rbExoXVDqJzNp+pJNjIwpWhfmOHG90aks6zu49s73pi87p9SIR7qeevV+Ce+5GsvaUAPzhzo+
  n1SNJVQP1uq+ulWnxFKckWioxVxUnAgA3dZSRWMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1672803690!363571!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22849 invoked from network); 4 Jan 2023 03:41:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:41:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9BD321B0
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 913C17B
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:41:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bidict: upgrade 0.22.0 -> 0.22.1
Date: Fri, 30 Dec 2022 12:57:58 +0800
Message-ID: <1672376281-25331-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
References: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100377

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Only include the source code in the source distribution. This reduces the
 size of the source distribution from 200kB to 30kB.
-Fix the return type hint of bidict.inverted() to return an Iterator, rather
 than an Iterable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb b/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
index 088931d14..1ed0af81a 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=858e74278ef3830d46481172ae03c819"
 
-SRC_URI[sha256sum] = "5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8"
+SRC_URI[sha256sum] = "1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


