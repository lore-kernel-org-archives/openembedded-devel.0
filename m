Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.5351.1632471926450689351
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AIuR4c2V;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471924; i=@fujitsu.com;
	bh=/k6sge4yBzE96NpKWa14L4jNMH5Off3QmkJUArw0ifY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AIuR4c2Vw/18uWmTgHm/J/Rv6LOfT+lJp+bAjNvmFdDRcTrLQ+/VMlO2JX9NhUjPy
	 iU0aRzKUs1SPZuQN0cTA4vgYDU2D+RTxFQqkR+GctcbFIEXeU36oniSn/9alUC31WG
	 baeBJPqlwU0FE6YSgOV44Z/CRT5HeamrkvtJLHk6P+eiVNQsIjJFczjzc6Riuhw88G
	 COvaFOY1WL37Nq8f8M1ZzhiJE4LmMUMFVg3JZJLDjXruyRWuYvED34YTaCEz8xEZEB
	 vsnD4frGrgijl3UsmDVOoRHQ/NE+47nHOjoYSMxnnytwQrVZkzxcNTyNCchgEKKIWg
	 UYG/N1LbBqo6w==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 2C/C7-29868-47B8D416; Fri, 24 Sep 2021 08:25:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRopvf7Zt
  o8Gciq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFn1kbWgvd8FZ1zT7A2MM7m7WLk4hASmM0k
  0b/4LCOEc4JRYtnRy8xdjJwcbAI6Eh0vullAbBEBfYmls/eAxYUFfCTmtN5mA7FZBFQl7v25B
  lTDwcEr4CYx+7sjSFhCQEFiysP3YOW8AoISJ2c+ARvDLCAhcfDFC2aIGkWJ7TvPsEDYFRKvD1
  9insDIMwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6Zoa6iVW6SbqpZbqJqfmlRQ
  lAiX1EsuL9Yorc5NzUvTyUks2MQLDKKWQyXgH47XXH/QOMUpyMCmJ8sp3+SYK8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuB90QSUEyxKTU+tSMvMAYY0TFqCg0dJhHcCSCtvcUFibnFmOkTqFKMux
  6oD01cxC7Hk5eelSonzfmsFKhIAKcoozYMbAYuvS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeY1AVvFk5pXAbXoFdAQT0BHP5/qAHFGSiJCSamAqKTj76KHBjQURn84Yrjjx+oTf9oCe6vQ
  qU59f/9uLSo/IXvqXdaBpr5HsGa4un6rMhQ/i/l0wPPC//93p33dm63lKF5tfnL5hFqOFzzcB
  kydmT7asebpymlmrg/PywMJL3YF8W07yuN2au8O484nJsnNqm/Z2mrA8yknwFr4gezGa8dvzp
  ObS984HCrmvR99/zLRBbELEBzGdQ59sVBRrcjWn3/6sXFv8cm0c266jB365MIao3BB5rnhmox
  rLddZPOfHTjGyqlLnXnC6WLWgxl3DQ1bjr9S6koe1ecshG4XelknnbPPuqbWwFP221q9/74px
  ca3fX5wnsJpxzy42tuQJ178289aL2U297oZMSS3FGoqEWc1FxIgBFvaXbKgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1632471918!176523!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2836 invoked from network); 24 Sep 2021 08:25:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:25:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8PIis005021
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:25:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:25:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlparse: upgrade 0.4.1 -> 0.4.2
Date: Sat, 25 Sep 2021 04:25:11 +0800
Message-ID: <1632515111-4794-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 0.4.2 (Sep 10, 2021)
----------------------------

Notable Changes

* IMPORTANT: This release fixes a security vulnerability in the
  strip comments filter. In this filter a regular expression that was
  vulnerable to ReDOS (Regular Expression Denial of Service) was
  used. See the security advisory for details: https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-p5w8-wqhj-9hhf
  The vulnerability was discovered by @erik-krogh and @yoff from
  GitHub Security Lab (GHSL). Thanks for reporting!

Enhancements

* Add ELSIF as keyword (issue584).
* Add CONFLICT and ON_ERROR_STOP keywords (pr595, by j-martin).

Bug Fixes

* Fix parsing of backticks (issue588).
* Fix parsing of scientific number (issue399).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-sqlparse_0.4.1.bb => python3-sqlparse_0.4.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.4.1.bb => python3-sqlparse_0.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
index a159975f71..31ee493992 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
@@ -8,8 +8,7 @@ SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
 	    "
 
-SRC_URI[md5sum] = "eebbc6b5f1033054873033e54b0c1266"
-SRC_URI[sha256sum] = "0f91fd2e829c44362cbcfab3e9ae12e22badaa8a29ad5ff599f9ec109f0454e8"
+SRC_URI[sha256sum] = "0c00730c74263a94e5a9919ade150dfc3b19c574389985446148402998287dae"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.25.1

