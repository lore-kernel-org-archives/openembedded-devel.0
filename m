Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web12.911.1626399978108465798
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 18:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CmJrAdkl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626399975; i=@fujitsu.com;
	bh=cg3CzsZc5uubBBbDkocYiLeiu9nb2jQX3cp6z4h+vb8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CmJrAdklU3GhZkR1YjnXaM0ESH6o8ITphExY4/zn9BJ6RBoHLDLwVUtEuPknYovYT
	 IqSuVvovtprm7Jjl5KOp4G8rL0qsEHU2F6PnOGsnFjW2uwsmX8l1aGqRqDBi9BkgmO
	 JAx6+JEBbXHg3q8nHJ0AarQOp70UcZUrPUa7PY18OJVcGl7vk13XA3Gopo4hIfM883
	 Mkh1OED01eRtGP6cv7KBlMLgPFSb2XMpqXuikS5Dx6lXY/ccnKH8u+gXMB8q3jTJ5u
	 GzoZbETM9CMXflFpwXl7BqzY36p94WMcZi/rrJCe+RhTh6hPZ4c0QpgActZZ9mWbTZ
	 ChuXU2q4dKE2Q==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 1C/E1-07373-7E4E0F06; Fri, 16 Jul 2021 01:46:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxVff5kw8
  JBkt6mSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owrM3ILPrNXLFn5k7GBcTZ7FyMXh5DANiaJ
  /keH2CCcvYwSnze8Zuxi5ORgE9CVOPd4LTuILSKgL7F09h5mEFtYwEni6sQjQDUcHCwCqhIN+
  5JAwrwCnhKzf09nArElBBQkpjx8zwwRF5Q4OfMJC4jNLCAhcfDFC2aQVgkBRYnZ0+Uhyisl9s
  zqZ5rAyDMLSccsJB0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6ZqZ6CVW6SbppZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEBlBKwRGHHYz3X3/QO8QoycGkJMq7/vKHBCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvDseA+UEi1LTUyvSMnOAwQyTluDgURLh3XwHKM1bXJCYW5yZDpE6x
  RjO8WbtkkXMHG/BZNu9u0CyHUzOXHBwNTPHLDB5v/0QkHwAIoVY8vLzUqXEeZ+DbBMAGZdRmg
  e3DBatlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ81Y8AprCk5lXAnfTK6BzmYDO1V7zFuT
  ckkSElFQD0zR785aDDXOtG3+2JvmnJLBscTpvcfnZUvZbSUsnfstNOMY+q9tsUtg6hzMsWYfi
  OTKTPj7rN5+xUf9ryaH2VaIsK9Q1v0hOb4qctlomfIeu1B8eVdtJFR+WT3Weahah8/jD6ZhVz
  WdPrkjXrD3gHH7itsbnTeG3HIxk0zKy3vzKflO+/GBlwfpf7381GIm1Srz+oSYinHrqwcYTFg
  evZzzRaJguV5CrdfrCOf1eFYnXtdc3zrc9/XFl0aZ3nU9m3bWNnCvxqTMp8gAH7/yZXKcv7S5
  viTzR/F3glZBNeC2zTIhwWb0Ng5Sri1FpduWLTNme+ryzW0Xy/6+Jq8y91lu2qao5+IDMLdv2
  Kw/fKrEUZyQaajEXFScCAAaWkxRRAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-287.messagelabs.com!1626399974!70554!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6952 invoked from network); 16 Jul 2021 01:46:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 01:46:15 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1kBZb028970
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:46:14 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:46:09 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] span-lite: upgrade 0.9.2 -> 0.10.0
Date: Fri, 16 Jul 2021 09:45:58 +0800
Message-ID: <1626399958-103679-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../span-lite/{span-lite_0.9.2.bb => span-lite_0.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.9.2.bb => span-lite_0.10.0.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
index 16b7c3e540..4cf0dee112 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "126453198fe2236b31ddfa7353e95d3a06c478ab"
+SRCREV = "2987dd8d3b8fe7c861e3c3f879234cc1c412f03f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

