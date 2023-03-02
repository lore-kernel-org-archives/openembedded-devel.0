Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C36C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 05:35:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.8376.1677735348122240490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 21:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hs+8a9O3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677735346; i=@fujitsu.com;
	bh=R5lrgG9fqWxK47B/ZZEQWFejtkBsizW/ZlwNUo9ypPw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Hs+8a9O3o74HeEbYEuRRVDL79rf0LRYz/KScq1fUU7Kx3jRhkJgvP7ujtwSyDWfZY
	 9gfm5MPR0x97fL37VyLyPV8iC27nSr6+kwOsZ/W/u4WZCuhEEVAZyaFZQf+gsExhz2
	 8uwVMxkReRaVcxYYXxQdRgfQNQU2grHh5wB+km5iJpK+Qb348sZlNZFDVLw113nqPE
	 NL1yKPFb9RNsgbU8L0JuleTFKKAZjxCZZagYyzoy/tgkPMQzGLmEt6pUHlL9jmgeoX
	 iAd5CoNUUNK+Qkxds6cL/iPYNm1+P7OO/Ig8bm9SC2Ok6r12UG1uq76FJKprXG8sqb
	 MgD4Aj+QEYP6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpLvRlCH
  F4O47I4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPvh262gg8cFWe6VjE3MLZydDFycggJPGSU
  OPTcoYuRC8i+yiTxZPpxZghnD6PE9fbt7CBVbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdA
  1YjLOAkcXJnKwuIzQIUb9i7F8zmFXCUWLr9K1i9hICCxJSH75kh4oISJ2c+YYGYIyFx8MULqB
  pFidmXm1kg7EqJ1g+/oGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdA3N9JKKMtMzSnI
  TM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECgzGlWN19B+ORvr96hxgl
  OZiURHknsTKkCPEl5adUZiQWZ8QXleakFh9ilOHgUJLg1TMCygkWpaanVqRl5gAjAyYtwcGjJ
  MKroweU5i0uSMwtzkyHSJ1iVJQS500yBkoIgCQySvPg2mDReIlRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMK+XCdAUnsy8Erjpr4AWMwEtbrj2JxlocUkiQkqqganJIrz99XNFw4mHd7L+CV/
  Bvp9DerrO+16LsEPb8wpnXjmd9iNCw988LDPr1f+igGTrXL77yj6KLr4Fa+yuiUgGCwrmmcdU
  XA18FXt67VUndYXjVtIvf719WM33VvDdqSdWxnOEwljlTI+K1FWJBEXOsrmy5sK3JsHcU1adh
  470av9UYcjXe51+oMvhSX1t378Uub4At0la3MaP6piWb9n8wdLFu/fE2xscjTO/7762cKvIL/
  krHQVbAv98TVGyMtnz4NfPW5PFFdv37W/VOGYgEsBd1fnuIlPkuZimO7H8fU05B+/MWuMc13T
  tV1zs3X/3tr65FZ0jvWqa6rHmk+taFM/92rkn78vx5Nzkg0osxRmJhlrMRcWJAAG2c65BAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1677735345!356411!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12767 invoked from network); 2 Mar 2023 05:35:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Mar 2023 05:35:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 87B051B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Mar 2023 05:35:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7C13B1AE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Mar 2023 05:35:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 2 Mar 2023 05:35:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] logcheck: upgrade 1.4.0 -> 1.4.2
Date: Thu, 2 Mar 2023 13:35:33 +0800
Message-ID: <1677735333-3823-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 05:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101325

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logcheck/{logcheck_1.4.0.bb => logcheck_1.4.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.4.0.bb => logcheck_1.4.2.bb} (96%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb
similarity index 96%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb
index 7436b9c7eb..1ad32b2dbb 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[sha256sum] = "dfd95c980727108cc9b8921736af9388dea0f6157688c03e8e39de378107b3dc"
+SRC_URI[sha256sum] = "0c651deb31dc201f1584ecea292b259932bae6e3e8cef846db3109e89a7f217e"
 
 inherit useradd
 
-- 
2.34.1


