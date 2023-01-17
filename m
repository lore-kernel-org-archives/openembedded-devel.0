Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2694C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:24:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.191349.1673940277344835101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qqzljG3t;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940275; i=@fujitsu.com;
	bh=zoRzXJ0gbP4dJS0Rfuw2WIMWRopSLNm2teZO6FQdFvw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qqzljG3to0Nz/fmZlfE30+yhIM6iK+Lnccdf3t7LjWjjOre7DaytTiWVXerw5Jt5U
	 gl9pXNQGqrCDnEGRdvY+eeyqID8ORsRfHaid5DpbsTG9TTIQTYggg31a0b5W01cFGD
	 a684mxazg1f6EpKFSrFkOnRkJPSjlY8Zb7EtcvDVzURDmcIuPy25D7HKq+YjXl6bHP
	 n1c2F1w7aSFhF/mPJ82Xv/5tbY8597/ZSiFPSX9wFaxgVUBNGDQ9+N1azkQDRMW/GE
	 OTS823MPQ6E63AucytRBSj3uIByhgGzZBcnqWy/SecdS7nWc4FCO22sifPI17Exa7R
	 0iAtHa7Ca9Tjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqGvkeyz
  ZoP++pcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH+5CzWgiO8FQeP3GRsYPzC3cXIxSEk8IRR
  ov/kA2YI5waTxOL5LewQzl5GiQn/VrF0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIXFvxh5GEJtFQFXi3ek5YHFeASeJn5tug82REFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjNUfaVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuoaGeklFmek
  ZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSrBawg/Hjsj96
  hxglOZiURHlPmh5LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe8oLKCdYlJqeWpGWmQOMDZi0B
  AePkghvuCVQmre4IDG3ODMdInWKUVFKnPewN1BCACSRUZoH1waLx0uMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHkdQabwZOaVwE1/BbSYCWixR8lRkMUliQgpqQYmnqVtiT9n2iZMPPv/Y7a
  xbq3dscv8rR03rrVvYug9GcI548/7RZybirzv9+cetrnC62/Tk5XheuHZR1bRdDWb/MLXBw9F
  SnXPep38i7f1yI+UFvnWA4r6aekBznEnJ176IPK+pVsu5rha7tFbBYd6dRKZ63fsOHxq4Z6pB
  12v8m5YrvAx1i60s1My/6GYwY5T+4p/Rms2y720a5K5qa24VS95SlSz4tlDt63qHorvvaByeu
  4BtqtTL1/5+X/H5zMP7rG0vNv1udxtOfO9r/0dUgv3Ch2TY9Oru7LOX8n7q7DMNYddL2NuG/0
  IZRANnBGrbbSstXv+t1LpKb9mnOY2V5m/a/4rxn62vXmixnJsSizFGYmGWsxFxYkANzN5JEID
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1673940274!87119!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10890 invoked from network); 17 Jan 2023 07:24:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:24:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A29AC10018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 95B06100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:24:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mock: upgrade 5.0.0 -> 5.0.1
Date: Tue, 17 Jan 2023 15:24:20 +0800
Message-ID: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100620

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- gh-100740: Fix unittest.mock.Mock not respecting the spec for attribute names
  prefixed with assert.
- gh-100690: Mock objects which are not unsafe will now raise an AttributeError
  when accessing an attribute that matches the name of an assertion but without
  the prefix assert_, e.g. accessing called_once instead of assert_called_once.
  This is in addition to this already happening for accessing attributes with
  prefixes assert, assret, asert, aseert, and assrt.
- gh-96127: inspect.signature was raising TypeError on call with mock objects.
  Now it correctly returns (*args, **kwargs) as infered signature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mock_5.0.0.bb => python3-mock_5.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.0.0.bb => python3-mock_5.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.0.bb b/meta-python/recipes-devtools/python/python3-mock_5.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-mock_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.0.1.bb
index dcc57c22b..b916a7b4e 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.0.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[sha256sum] = "fd552787228eb2ab8352f270470fa93c9ad8b9cbc565c5558ee3faed8edb3853"
+SRC_URI[sha256sum] = "e3ea505c03babf7977fd21674a69ad328053d414f05e6433c30d8fa14a534a6b"
-- 
2.25.1


