Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.3076.1627006245566402081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yWQ3d9EV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627006243; i=@fujitsu.com;
	bh=mZGpIEZ/Q91E7UdEP7QiKkFdFPuy/9tEqGwUWE+P0Cs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yWQ3d9EV59WYNPlrwnjtnzzu6LtELRErmsjoJcszReppufePoCFLKGDPy5jeZSZ5Q
	 NsQ54+dXNS59ncLnsze01fXX+mC8V4SsdhuSvcNzKiHlUoXDxx+vkFY9RJSlT/qyv6
	 h4i2qTYlYL0hfqi1YdvQD/+xOa6TSQgUE2NKK1DE/Mpk94rpwXpWSuuYd8zjcSsXxA
	 Jy5fWkCBQ43h4Kp8j/jo/EcUW0qOOYwHAMf+6D3X9s6Dzssl6DbaDgCsm+h8aYTUYA
	 lIaok1AMPdHaN0Hr9yFZ6eHE4kFWgYcLe3czcuE+5w6lcn5t9hu2lVlxzXJKU+1vNY
	 c1SZjCImgChBQ==
Received: from [100.113.6.189] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id BE/38-07224-2252AF06; Fri, 23 Jul 2021 02:10:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxVVdJ9Ve
  CQU+bjMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH7/wX2gr0cFdOetrE1MD5k72Lk4hASmM0k
  0flsKWsXIyeQc4JRYv20AhCbTUBNYvqtG2BxEQF9iaWz9zCD2MwCKhIvfvewg9jCAv4SK9/cA
  IuzCKhKzLmykxHE5hVwlLg3+QxYXEJAQWLKw/dgNqeAk8Tb7/eZIHY5SjS92MoEUS8ocXLmEx
  aI+RISB1+8gOpVlJh9uZkFwq6QeH34EvMERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwED
  X0NBY11TXyMBQL7FKN0kvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERiQKYWsJ3cwTnrz
  Qe8QoyQHk5Ior9ThnwlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhXyPxKEBIsSk1PrUjLzAFGB
  0xagoNHSYS3VAIozVtckJhbnJkOkTrFGM7xZu2SRcwcb8Fk2727QLIdTM5ccHA1M8csMHm//R
  CQfAAihVjy8vNSpcR5JZWBxgmAjMsozYNbBov+S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  EeU1ApvBk5pXA3fQK6FwmoHNPdf0EObckESEl1cDUb3G3c2uz+w3XBc317vPy5BkzIhVvFv84
  2RKZ1zDlyNTVCSqfWcoreeZG/kj9tDA/w+LjnXDls5OP39yxvWN265pcXbZD3u+KfFrWqhVXf
  th5Ypd9/zylJ5wBPn8sS/Z5rJu62OHw9ONPg7sVTuz6+OJSQIfUdJO1f3zXKMWZZWfe4eg0em
  8xQbS3wOb01htCNx/MWs2+SJN5R/ysRf+V/Wf1eVpeq7zwyIc/3jg2f43gtha7hqCPag92ivI
  /bj3Rwv9zGecN/V0lp5oP/RLSWJfJx3tue2POgz3Tj2ddaQq7XKGnef/kCq6F3+5s+daXIpt6
  UKJwtuISPX47594iT2vnxw2/uu02BnCntexUYinOSDTUYi4qTgQAXrMTAnkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1627006241!94260!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7266 invoked from network); 23 Jul 2021 02:10:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:10:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2AWF4013755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:10:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:10:35 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210711.0 -> 5.9.20210718.0
Date: Fri, 23 Jul 2021 10:10:18 +0800
Message-ID: <1627006219-7443-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
References: <1627006219-7443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

docs(web): add RpmMacros as a new parser

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210711.0.bb => ctags_5.9.20210718.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210711.0.bb => ctags_5.9.20210718.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb
index 4be634b38f..9e803913fe 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210718.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c81079788bfe650190db8ac9df80d63d2bc160aa"
+SRCREV = "23ea3765d15a4cc361a1dfef497617c91c704fbe"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

