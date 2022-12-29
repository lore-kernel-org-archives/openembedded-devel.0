Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85697C5479D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:30:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.56106.1672716628578112531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DWD3hDHP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716626; i=@fujitsu.com;
	bh=A2Hl7nlIZimn6cxjJ+YVz+bdoDOxWASsl4PXOUgPVGM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DWD3hDHPqXr/G1u6gz4ih5VGcdCTrYDtyNMsz7HYMWPOPxmUa6dLI3y890MBWzHgl
	 0jWy+eFIeiFEE5ExsGfx+M27ONrmABAQX4o9NCyurEAntHLd3JCtLQe5s7x58iiUcq
	 xkmI3YuXF6J2gNACtZYKwmd9sppgyR/XNMPJLuFqP8Bqy1r3uss2QIdniY+l5QLYpz
	 X8mV1SptpMtEwtLc27Y8qzdMFNDs6Rkj1WVTF2yDKTttV8l12XNzOf6K9Fn17/4rOQ
	 tqiELEl6k+s864whOYFk1t20LpeD/B+121xU5+WSyYaSBF2G5vJ7naRo9RAlRKWxFf
	 mbx1zt6BacYSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpBu4cHO
  yQXuPnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH14Tnmgu1cFbfOH2RpYNzJ2cXIxSEk8JBR
  4nzPN3YI5zKTxKbHT1ghnN2MEnsXPmPqYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAS2Ll96tgNSwCqhLPlq5kAbF5BZwkDl+bxghiSwgoSEx5+B6sl1PAWWLq6xVgcSGgmg
  8TNzFC1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQvTi0qSy3SNTTQSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDOCU4pSLOxifLPujd4hRkoNJSZS3fO+mZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvDzzNycLCRalpqdWpGXmAKMJJi3BwaMkwntoHlCat7ggMbc4Mx0idYpRl+Puwr17mYVY8v
  LzUqXEeUXmAhUJgBRllObBjYBF9iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzzQS7hycw
  rgdv0CugIJqAjktZsBDmiJBEhJdXAVLBj/TXe03fW7p54/JrR/fl9hfKd7EsffTqVtfCn6EzP
  9K+2Yh+3Pt65pyTWWL/lV8yi6XEmx9e/+yTRHrXr4ixp/9P/nGQ0rMSXPXvhueRZo3vN3Bq3w
  ++a7AKPfLCdlFEv9v2d4aqUF/WS06Zv5nkuL6Bevmh3BPc1rvkaDR985DZNtrWvnsN+5bD3p7
  BdRdsnd5htFCvec+Pb8/2Lnkm+CQvReuxh889v5WKeecZqsdNt9INOH/x92vFv+mKvox+r8r6
  lPpFfo3w265h6UWrexS1rNR2yJmV9e+wffWbrh/RZJ+Nd2zW2uewVEat/y+pXt+s7f6/k1R2J
  Ar+LrALj7gpevHKBPbfKLGhry0klluKMREMt5qLiRAAZC714ZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1672716625!277078!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6087 invoked from network); 3 Jan 2023 03:30:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:30:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 352771AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2A2987B
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:30:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmime-types-perl: upgrade 2.23 -> 2.24
Date: Thu, 29 Dec 2022 12:46:53 +0800
Message-ID: <1672289215-16118-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
References: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100351

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
- vnd.gentoo officially took 'tar' and 'tbz2', but 'application/
  x-tar' resp 'x-gtar' prevails.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmime-types-perl_2.23.bb => libmime-types-perl_2.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.23.bb => libmime-types-perl_2.24.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb
index 8bf383014..a3d9ceef0 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "a28df6319a3e8c5ce117fbe5dcdad0bc9eae8eef65c1a0a2f0c00e00e77d7e30"
+SRC_URI[sha256sum] = "629e361f22b220be50c2da7354e23c0451757709a03c25a22f3160edb94cb65f"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.25.1


