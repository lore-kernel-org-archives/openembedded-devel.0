Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.7098.1616724409097008471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 19:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GxExZDGa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616724407; i=@fujitsu.com;
	bh=XW6bnFzlUOGgIXBLWJg84c/yaiRmbkL0fwNAgp7KfsU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GxExZDGaneD/3V6NR98UrSX4d2mTMdLFekLWwRApOXo8iFOQniUPu/tMfZs+Pv+/j
	 MsCPdNYVFu1YZ5B27VYy3OrXhUr0qhs6Ych7mCpHezsfKul9qBL2WQu5+SKD1lfqx+
	 HtGG5rh5hGYrG2Oqsqh5jEsOrY+NqZE5nzD86LsV9/9is3aGi0Gsl+xYywkOIAgKu6
	 bAD7vddr9xRbj+aAxq4iwq98pK0z5jTV4CqYYt4V1aQkDNc4ThPyWkj0cm15BXvNvx
	 IlX79jHMP1TP3ZYTb9DACNL6XmnhreK3FyUBT1TJvu2GSaS6gRwsw+b9N+pGWALZ27
	 /O3FEsseDfTkA==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 65/88-35258-6B14D506; Fri, 26 Mar 2021 02:06:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxRXebY2y
  CwaMP/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bpR+dZCto4K6Z/nMrUwLiEo4uRi0NIYAuT
  xJdTLWwQzglGiQdL3zN1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC9hJXJz4kx3EZhFQldg35
  zxrFyMHB6+Au0TT0mCQsISAgsSUh+/BynkFBCVOznwCNoZZQELi4IsXzBA1ihLbd55hAWmVEK
  iSODJTbQIjzywkHbOQdCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmma2ail1ilm6SXWqp
  bnlpcomuol1herFdcmZuck6KXl1qyiREYQikFRxx2MN5//UHvEKMkB5OSKO+hEzEJQnxJ+SmV
  GYnFGfFFpTmpxYcYZTg4lCR4pzrEJggJFqWmp1akZeYAwxkmLcHBoyTC+8MWKM1bXJCYW5yZD
  pE6xRjO8WbtkkXMHG/BZNu9u0CyHUzOXHBwNTPHLDB5v/0QkHwAIoVY8vLzUqXEeRlAtgmAjM
  sozYNbBovXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebmA0S/Ek5lXAnfTK6BzmYDO3fg
  jEuTckkSElFQDU2D38Sk6vvFJj0tU65d2J/Irzs6pDrTtC19x4HVxgq3ytz/Hy9b4XtnvsaNV
  wEpi8omSylt3ixa0rjNMZtqku6zumu5UMfGLPk9sDswK15xxvF6W6Yt5h3n+xTKlkus7W7Ydm
  b/s//ElU3SaWQSm7pK7teslR9ajFvapO+4wib50/L2U4bCzTeAtX9bNhv/n8M4yD+lTy/q971
  qBzhnN69JfvgVmMV+61fvrmm2Z5yPxCvHCD+fW/XxuFXSycbr+Z+XWkghVxTvqPw9UW8z4PbX
  eIUjBgLFbPnKBZ9J1j9l3Pk9jXDJrzq2liptCfu5Y7T1dTe5nitiqAkW9Lwu1lHV2b28+P+e/
  imj+0Ux3RSWW4oxEQy3mouJEAFuKcrdSAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-291.messagelabs.com!1616724405!380165!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17987 invoked from network); 26 Mar 2021 02:06:46 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 02:06:46 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q26jde015780
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 02:06:45 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 02:06:44 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nanopb: upgrade 0.4.4 -> 0.4.5
Date: Fri, 26 Mar 2021 10:06:38 +0800
Message-ID: <1616724398-25511-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../nanopb/{nanopb_0.4.4.bb => nanopb_0.4.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb_0.4.4.bb => nanopb_0.4.5.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.4.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
index 19db89bdc..b2f8db9c0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 DEPENDS = "protobuf-native"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git"
-SRCREV = "2b48a361786dfb1f63d229840217a93aae064667"
+SRCREV = "c9124132a604047d0ef97a09c0e99cd9bed2c818"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

