Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0A4C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:21:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.3116.1663064468763888239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qrKqtzKy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064467; i=@fujitsu.com;
	bh=b7EvhYPAVfOGj76hJIrc7EXx3TTDt2RcMVFM5i0DODA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qrKqtzKyAYK5sJzyhDyJ8vJ4pVSUMGIpR0YpG7xa+z7JsxVzuqQR3zslZwyGN3TkY
	 B4HxKiJUY4BEFZhUOh4gmf0/XcxNuq8FgvUFSqiOBDduXlb84vRwXrtsIytpBvjCEg
	 yFUtZirnwrXoE5CoTMEXrG9n/p5nXvTRqj95GkngRNKIn/1bopTE/g1MkHF2PPPRC0
	 VK/9YXXZLXcnCXye5iof29OyIFwU2Gqn6wHldkNLq6I4Ydx0hZvp6vdjZxSlzl/kvD
	 +Sg/xtVUab/Ta4SmXS/r9OmLnpDT0glrI7GFxqswWckGTjJUjSaCFt4/bpQNU9jZhi
	 1TV6p6DbV/EDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqDspUiH
  ZoOWKssXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHgbBtLwUzOirfTGpkbGI9ydDFycQgJPGGU
  mHt/DhOEc51J4vG6fWwQzh5GiX+ds1i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIkFjz7DojiM0ioCpxacNVsHpeAUeJDxu3gsUlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJtUlJmeUZKbmJmja2h
  goGtoaAqkjXUNTYz0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMzpTi9
  bwfjxn2/9A4xSnIwKYnyRnopJAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0PAcoJFqWmp1akZ
  eYAIwUmLcHBoyTCyxMMlOYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8M7
  2BGgRAGjJK8+DGwaL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXokwoCk8mXklcFtfAR3
  EBHSQkbU8yEEliQgpqQamw24nVG4VPBWQXMOx3S3w1NMdvfJ51U7ltlJm2nmBCyr9+GdcvZI8
  0fiAY0+Y/72W+1+/2eze5V3AImH4duLtfBUdNwGO1ZmGd9+sL3xXc+vrzhu6W+IWmLo2qCz7N
  6U/Tk6xfNvelTH3bVb56yyrnX78xu5Thmzetz6u29rTf5xh9cZpbXLyv/7KXLix5Enaviurkr
  K2zD0hoSz88d7CnF2pWUH2e+Y+l436q7b4arSP72MOvhVTnm6tXnHTxU/52ZZV8XMaveRcl/9
  msviTo5fKc3nbu1b/nbVc87K+cW/cb1RiG2pxqDb0o8ta0USfT9YrmheXnY99p7j93u5IF1Pf
  F001epN/JRl6JtzYocRSnJFoqMVcVJwIAOshhWxhAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-732.messagelabs.com!1663064466!294543!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3441 invoked from network); 13 Sep 2022 10:21:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:21:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F187F100194
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:05 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E1975100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:21:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.40 ->
 1.4.41
Date: Tue, 13 Sep 2022 18:20:53 +0800
Message-ID: <1663064456-3336-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98782

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.40.bb => python3-sqlalchemy_1.4.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.40.bb => python3-sqlalchemy_1.4.41.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
index f61030fc10..5b93458792 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "44a660506080cc975e1dfa5776fe5f6315ddc626a77b50bf0eee18b0389ea265"
+SRC_URI[sha256sum] = "0292f70d1797e3c54e862e6f30ae474014648bc9c723e14a2fda730adb0a9791"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


