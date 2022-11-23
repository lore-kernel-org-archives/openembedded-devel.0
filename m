Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE517C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:53:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.14264.1669186430482374031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xLGY3+XK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669186428; i=@fujitsu.com;
	bh=eYYSQjL4Ok1URdo9LyYKMnvodUElOToVsB9GY7j3HkY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xLGY3+XK2W8KRdUFs1CBRWEr3qXPKdJvcOTKo6rw2IzbPCOKvAwkjZXY7GCjtpNKl
	 J6oxiJKffFQlPWLBUscuYl71eaitADJuWSf6eF8h17PH4M2+6hErfQV6/lLQb0tQ2m
	 3CHKUg36B9QguF4rmDprqHOQ79zXJZV/aTvRpf2Qw0/MDPRjcoE9Z0lye/XVN2Nce1
	 N+Q3F6r5p8vheQCy5WwBcd2uDEnqXL5elyxxo0rTRwGEC0gWAszgctsFeEsPADA2Yr
	 peJJlurs87jVe64ZdsmjGfxgxSRmmlJ1aQU9nyQ86SaUcoqBA9gUzRaHNZZ1qgWQZA
	 N9vJUE0WGDB6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWbf6cG2
  yQdsGA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPm8avMBTc5K5qWz2VtYPzD0cXIxSEk8JBR
  YtaK2WwQzmUmiUffXjBDOAcYJSYvmMTaxcjJwSagILFw6xkwW0RAX2Lp7D3MILawQKDExpPXG
  UFsFgFViRs/D4HFeQXcJRof9IHFJYB6pzx8DxUXlDg58wkLiM0sICFx8AXIMg6gGkWJ2dPlIc
  orJGbNamOCsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYjQvTi0qSy3SNbTQSyrKTM8oyU3MzNFLrNJ
  N1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDLuU4pSAHYyblv3RO8QoycGkJMqr
  tbk2WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr84GoJxgUWp6akVaZg4wBmDSEhw8SiK8LgeA0
  rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuflAEaUkABIUUZpHtwIWDxeYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTM+38f0BSezLwSuE2vgI5gAjpCzaIK5IiSRISUVAPTvhJ9rftN3Wa
  6XofufrxteOrbZu26zCWruTeEKMY5qW2X0zP/GvyEcVPnkkPzpIP9vkfertulHdN5vNr4d8ju
  JYveBE+6kbdVa8JmHsle70l3dnyIfWttfuGhxJ9rL3ceKa6PefSPQU3z4R+Xxi9f3NjfqKyx+
  WazsZo/k3nhtSKmLLupWV2XlvC4RfLlvBIrzXvg11nKvaIhI+l54k9ZQYO39RuvT1/yk8X5Yo
  es4lQ2n9/dyuIzb3/+wGFjGb+nrqMyNqQue5VQi45aBW+f0v2wvW8TTXncY1g1/Z7KyteXrHz
  8rnDX4m+Gyx5z/DPznMD9+PQJoydLVtbMOWLi4WK/veKBhO5H8YIZb3SUWIozEg21mIuKEwFy
  sjCyQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1669186427!392045!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30425 invoked from network); 23 Nov 2022 06:53:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Nov 2022 06:53:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4940C151
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3CB5873
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:47 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Nov 2022 06:53:46 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.5.1 -> 5.5.2
Date: Wed, 23 Nov 2022 14:53:38 +0800
Message-ID: <1669186418-3028-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99696

Changelog:
Add support for building arm64 wheels on macOS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-zopeinterface_5.5.1.bb => python3-zopeinterface_5.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.5.1.bb => python3-zopeinterface_5.5.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb
index 00c2eaf28..0384d46e5 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "6d678475fdeb11394dc9aaa5c564213a1567cc663082e0ee85d52f78d1fbaab2"
+SRC_URI[sha256sum] = "bfee1f3ff62143819499e348f5b8a7f3aa0259f9aca5e0ddae7391d059dce671"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1


