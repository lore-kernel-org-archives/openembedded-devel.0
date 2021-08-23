Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.37202.1629799033795592314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 02:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M2yIBAoa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629799031; i=@fujitsu.com;
	bh=mQszMxJdrSXmYBy4cEkLE2bV58iV5QFRK3Ru4fVjZEg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=M2yIBAoafSNJ/768A2QVHXZrshT2jn85uQVM6tJRznAXAi7Zsb167ddLflAOlhul4
	 hmm0zmCG1ZJ93xiDZya+yJNuSVIYCY6ZFap+W6jnEj6LAypiPz8cRUJBNrQe1QaUSr
	 AfhNR7AhHglCfQrx5AnI3hVYJXboHLeAC7YThCoWRZmh0CkunkBo3tzA+gw3hgYio7
	 2oQ6s2+TxSkAtEwr7oRve0++F8dCVvywf9XQ1dOtUxCCwQJfodcK3JtIh6wAbfPmiF
	 rH9DlWxQcIit8JPSUFgOJDWz71wVLG7lfIPeERUQWPADfvtvQrxWIb/zz3PP/UzYxA
	 extg30YS0d2ZQ==
Received: from [100.113.4.190] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id D4/56-24028-772C4216; Tue, 24 Aug 2021 09:57:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0b29TyX
  RYP4OMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP1j0fMBas4K7beusPUwHico4uRi0NIYDaT
  xMzuNewQzh5GidVH5jN2MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAlMen3azCbRUBV4tu7K
  UD1HBy8Ah4SR376gYQlBBQkpjx8D1bCKyAocXLmExYQm1lAQuLgixfMIOUSAooSs6fLQ5RXSL
  w+fIl5AiPPLCQds5B0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuma2hhppdYpZukl1qqm5y
  aV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMo5RCtl07GD+//qB3iFGSg0lJlLdkm0qiEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQneJzuBcoJFqempFWmZOcCQhklLcPAoifBO3AuU5i0uSMwtzkyHS
  J1iVJQS5/29CSghAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwzQMbzZO
  aVwE1/BbSYCWjxfUlFkMUliQgpqQam2iDXAhfue5VfglJ2lz7a84FreYbfrM0LJ0w4HzLxgI5
  C+qqjpfpqe03jlnGnZJrdrXlp/GyXbB5vYG3uZrVlt4QfccgbJ92a+EUh8e5LLs89ZzcXrWXa
  Yh60e35p3MEArbcucRsqXhX89VzSLDSLwd9TwEHZSsbE/Y/KbZ6pVdsyZUzSrsrk50+u5VGsX
  Pm1e4uNK+fm29PObZiWFfvx4plde0SXzMx60BPgmhfCM/VmXhpv5Lev+3vZI0PfxgieSX20Sl
  uE8e0l5uB50+8/tGLapzGFcatT6nSmh5P4Fi5c9rAofR9bvcvZxzVHSm/wOZ7pvzr/9ta3adJ
  rEnNVWlaeOnu/fveJHl65+eYTlViKMxINtZiLihMBMlwE0x4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1629798107!147259!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11652 invoked from network); 24 Aug 2021 09:41:47 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Aug 2021 09:41:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17O9fk9m004297
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 10:41:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 24 Aug 2021 10:41:45 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.62.0 -> 4.62.2
Date: Mon, 23 Aug 2021 14:52:13 +0800
Message-ID: <1629701533-89395-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

fix notebook memory leak (#1216)
fix contrib.concurrent with generators (#1233 <- #1231)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-tqdm_4.62.0.bb => python3-tqdm_4.62.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.62.0.bb => python3-tqdm_4.62.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb
index f9b530d652..bbdd795aab 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "3642d483b558eec80d3c831e23953582c34d7e4540db86d9e5ed9dad238dabc6"
+SRC_URI[sha256sum] = "a4d6d112e507ef98513ac119ead1159d286deab17dffedd96921412c2d236ff5"
 
 inherit pypi setuptools3
 
-- 
2.25.1

