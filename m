Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.4096.1619425300783124315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 01:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mXiAEaoQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619425299; i=@fujitsu.com;
	bh=71p3qt3+7kW7+ZHeDhdgJmUXrpgGZZgkv15DZSrSs9U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mXiAEaoQ2GeKcinCLkxZg2vIcSCIOnk/8ix+d+CqO9UMEesmbmzlo/4QApKcVLPdH
	 vYc7sUpUEH1fOuOKjEixWc2ajPSmkvKNmZVcovuBwC0SFVRUSpWcmqAbgQ7sQtZ7ZO
	 IP50tyueRA8Cpo9Bmu+b+YtAeCxt6paxH5TZJCKLXqjuDDUbgwhzH71Stf8ysuszrg
	 5aM8mC1sYOuZV5VsCzVeXLKx9Hbowf1KxIJCeJLJX+Rz8vx4yPXwyR8OG2aqpo/cdx
	 YG6B1hQasiBRE8jn5Wj18q4YnSe0W8hq4OKfgYpvM4CHI1NdTi6Z7crgujBm4I5IWC
	 2UNiebewarpRQ==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 71/8F-46412-31876806; Mon, 26 Apr 2021 08:21:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1RWuaEs
  w2P6U0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdj6cjZTwXzOioef17A0MJ7h6GLk4hASmM0k
  8WDPPzYIZzejxIXHZ5m7GDk52AR0Jc49XssOYosI6Essnb0HLC4sEChxfdUsFhCbRUBVomnDR
  EYQm1fAQ+LLnIVgtoSAgsSUh++ZIeKCEidnPgGrZxaQkDj44gVQnAOoRlFi9nR5iPJKie3Tzj
  JOYOSZhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tLXQNzY31Eqt0k/RSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQLDKKXg2NodjD1vPugdYpTkYFIS5RXKbksQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMErWgqUEyxKTU+tSMvMAYY0TFqCg0dJhFe7CCjNW1yQmFucmQ6ROsWoK
  CXO61IGlBAASWSU5sG1weLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXhWQKTyZeSVw01
  8BLWYCWsxX1wqyuCQRISXVwNThXX9ZU5ivyMhsIVtVoiEPU+hvpSWH3zRM85t9S+2lKUNfm49
  QSwhL5Fqer+9YYg59eqWT0TNlVthCSxPdS7Ms9rpl/a0+WF764q/UK56XB1f63BacapwTMrnO
  7sCWpHv+nYI3vszyf1qoFMqf2H1Z3ujJ9bI9f6VeyxraKEdaLPfumnQ343ewgEbe4bz77fum/
  Ls/adbt112eNxwbeLQ0PSdnq78MXXdxbteSfSrGjOxvQqujDWQF93R2TjsS2PNs9+/VHh8Znh
  T+OF4u96+uWCDR5EdjwxepA+c19m5z/fvvjeyuv9bSBT2zuBes2f7BO+RK5ezuXeGXb+YIrXC
  JnG5v73t3dUGq35d3QkosxRmJhlrMRcWJAM6vJk8eAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-285.messagelabs.com!1619425298!1883624!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2794 invoked from network); 26 Apr 2021 08:21:38 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Apr 2021 08:21:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13Q8LcP4028861
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 09:21:38 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 09:21:37 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.3.0 -> 5.4.0
Date: Mon, 26 Apr 2021 16:21:30 +0800
Message-ID: <1619425290-76541-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-zopeinterface_5.3.0.bb => python3-zopeinterface_5.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.3.0.bb => python3-zopeinterface_5.4.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb
index 5da5a88b97..305e42a619 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "b18a855f8504743e0a2d8b75d008c7720d44e4c76687e13f959e35d9a13eb397"
+SRC_URI[sha256sum] = "5dba5f530fec3f0988d83b78cc591b58c0b6eb8431a85edd1569a0539a8a5a0e"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1

