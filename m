Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.8596.1631784212834454938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 02:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IXj/zOZx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631784211; i=@fujitsu.com;
	bh=rPCpw46ozaPhq8xhpzOJLIfNyWP7D+c0rLp+arYBONc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IXj/zOZxXbUJy3aG3p4hxlzgIVfFJsKNq+XRCnluvGD+357rccjYdAMGY82V1u+q4
	 0h4KZ5t0oR0u3gcyVJlzZzWPn7DUfpdTN9g4CPJgvCzRDwWWMV8CODacRG0zxyDWKu
	 FFdpzMirYOUL9bU0GCj555/wwC0Fu+xn6zFElJp3fmH1VMmXdRv761lfTBu0fLwtkd
	 kJF0qcoPOaXMaOy3GtzzQbDCIi1cDTbkT5byaPM6Ujg+E13bNDiyHP/ciechVFsVu/
	 ov/yyRtn39fumXt9E6+4bdaT21QhVmC8k4mmaNJSZvq88R2QEXG+ypta6qOasJTQog
	 IIrDRH8cQKyRQ==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 2D/F8-19003-31D03416; Thu, 16 Sep 2021 09:23:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0RXidU4
  0+H5Z0+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzZj6qoG1YCJnxb+5p5kbGA9ydDFycQgJzGaS
  uNLTwALhnGCU+PSzh7GLkZODTUBHouNFNwuILSKgL7F09h5mEFtYIEjixNX3QDYHB4uAqsTM3
  9YgYV4BN4mZf9eDtUoIKEhMefieGSIuKHFy5hOwMcwCEhIHX7xghqhRlNi+8wwLhF0h8frwJe
  YJjDyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlua6hsbleYpVukl5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAYpRQc7dzB+OvVB71DjJIcTEqivAdvOiUK8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuB9wOWcKCRYlJqeWpGWmQMMaZi0BAePkghvAUiat7ggMbc4Mx0idYpRU
  Uqcdz43UEIAJJFRmgfXBoujS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeV1BxvNk5pXATX
  8FtJgJaPGR/Q4gi0sSEVJSDUz79NrkXrY0npKOTZyg+lto15J7U3I1Zrnv0lgzd97RHofiW9N
  zJzwM1fFrak7YWGJ/TXiRiVsgf77HVQuR17qFilwvMo4ohdzftWfbQTvWggipZw2hHzgNrOVF
  psvtMCz69SmKZYlWz5ndkc9/+z/+Gbsu29M4Xmdfe9G6HSKVeTsW2gid91QM6zG+fe2ZU/0DL
  zXZrn6Lav47y1pZl0zYz6XOY7mM7Y7QFukbCkWzcr1XSkz3sfw/69DXpkMW8cwn25a6nVCcX7
  GmPy00dhZXO6PjVd3jXz3mdCfUCQj4vs9d/bew8F6Iw5HgwvorGT/nt2/R0lz61H5Bhw1z/3w
  l6eQjjAp3He2Mj3o9UGIpzkg01GIuKk4EAKEnGWEeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-291.messagelabs.com!1631784210!261489!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32112 invoked from network); 16 Sep 2021 09:23:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Sep 2021 09:23:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18G9NUAO006520
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 10:23:30 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 16 Sep 2021 10:23:29 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.39.0 -> 1.40.0
Date: Fri, 17 Sep 2021 05:23:23 +0800
Message-ID: <1631827403-4625-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.39.0.bb => python3-grpcio-tools_1.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.39.0.bb => python3-grpcio-tools_1.40.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb
index 865124450f..f86bf008f7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "39dfe7415bc0d3860fdb8dd90607594b046b88b57dbe64284efa4820f951c805"
+SRC_URI[sha256sum] = "d440f2bc089ff628618c536904d5bc39d0b44f7afdda4c4c1ecd15fcf385bfba"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1

