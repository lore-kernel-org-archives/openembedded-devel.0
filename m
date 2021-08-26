Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.4359.1630043189288360222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xIiah3aF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630043175; i=@fujitsu.com;
	bh=0UIOpaPZhRveZbJyiCqI2Fzbhxg7P1qjkLx5RI6Qs3c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xIiah3aFQfnDmgaPjyZW2vajgSjsjP9vRuks05aG1uLU39PuQVpr4UWZcb1jzoThm
	 fPGGKSZ49TUmE8wBy6jF99GJI5EdbRUmhkLyC1QKIzfKRL4DAiwYyU67Qs8ohoccoV
	 qw9cK8NEUZ4iMFMY5Ge/zkFyRNsf2YX2Rq5i0Wtekwdt5bBlYBMhOCPwhBN85Mhel/
	 Him1v5yEfRWI0ayW0WjCuxGEgiaop7Oebz4EhBpyb1gbHhBh2VK6lMhG84o4sLfpk0
	 m8JrPvkheV8Daam4Mccb3I4p1rzpe3EdOGz3kDvcAvdfk+U9hHgdt8tLFsJNYYTuft
	 DCi+NMTQUOZ6g==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 06/F0-28459-72C78216; Fri, 27 Aug 2021 05:46:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqqtWo5F
  osGevvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHk0UamgjccFbPv1DcwTufoYuTiEBKYzSSx
  /vkKJghnD6PE1BUdrF2MnBxsAroS5x6vZQexRQT0JZbO3sMMYgsLBEg07FjCAmKzCKhKTO48C
  RbnFXCXeHR1GpgtIaAgMeXhe6i4oMTJmU/A6pkFJCQOvngBFOcAqlGUmD1dHqK8QuL14UvMEx
  h5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSwtdI0NTvcQq3SS91FLd8tTiEl1
  DvcTyYr3iytzknBS9vNSSTYzAIEopOHZ9B+PV1x/0DjFKcjApifLuSNdIFOJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTBu64CKCdYlJqeWpGWmQMMaJi0BAePkghvTRVQmre4IDG3ODMdInWKUVFKn
  HczSEIAJJFRmgfXBouiS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEefeDTOHJzCuBm/4KaD
  ET0OICPlWQxSWJCCmpBqYrSS/V1F4eCf+25svh/84fdI8zRxgeMIvpk9tole31Uq+LKafeoNr
  63QWRHYv266tJt/AbnM1T+9RYrleU3Pz3oLnlj8X3J+zV07LO+27gXeG9aB6PhaaIs+6Zb6Gb
  xVIuVDcyXJ4kKybc+2bmOeaEYO3q/5Vfulf5pXCeWlobdXw9F/tf/U/B65eJm06bHbjhW1EB6
  +QjLefN/XRk2BMFcs/eXGUfy7g2MGWi3OE8v+M2/07Z1dXKHO9Jusz7sv/p9u8//dfVGlx/ZK
  0vsfbZ90uXpbdXN6mVBXZaSVR+8T/5ZL9vy9N+ibCJxwLNZD5N8tlQeWZW5tdiM++K6V3dnex
  yF4pXvom4oPSgV4mlOCPRUIu5qDgRADoc6ZgdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1630043174!120721!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24769 invoked from network); 27 Aug 2021 05:46:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:46:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5kEJ2028526
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:46:14 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:46:12 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2021.8.3 -> 2021.8.27
Date: Thu, 26 Aug 2021 10:55:55 +0800
Message-ID: <1629946555-7256-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-regex_2021.8.3.bb => python3-regex_2021.8.27.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.8.3.bb => python3-regex_2021.8.27.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb b/meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb
index 2c35faf553..c869003c9f 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8935937dad2c9b369c3d932b0edbc52a62647c2afb2fafc0c280f14a8bf56a6a"
+SRC_URI[sha256sum] = "e9700c52749cb3e90c98efd72b730c97b7e4962992fca5fbcaf1363be8e3b849"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1

