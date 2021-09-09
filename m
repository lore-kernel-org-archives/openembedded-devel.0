Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5345.1631181382358122517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yIHNzU32;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181385; i=@fujitsu.com;
	bh=KxsKW1+dO0Kqt9Q5Dsu/ZtyuhFccpfbl25Pcn2sbDnM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yIHNzU327QafGzlHPMk8YBbmZWPcjuSXg1ljhzo1pcbWnyIIfYV9MY2ynirGJGq7I
	 z7lIeX3nmoVxQpLd1fAb+K+ZrWKnuQYWkpGRKsBNU3YvxfA+2tVWpAqybm4RyeI4iy
	 8XhnE9nkz4PMtEDDFwBXZqnIehJggE78zPoSjj6Zpo80/b9iAvjI59LBOUNgyDN7cV
	 HTHiYVfD9YJKlyjZAKoCGqokS2S7qPIX89O+azPAjqOHDSnHRSgBMt8T0xey/hLX+d
	 EWLlSDYFKV84LDhHDVuL1thWCswkfHlvBU7JYj2iujXMgm4cnicHd+Gcz41156s6qf
	 6Lk2loVd2LGMw==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 9B/58-24763-84AD9316; Thu, 09 Sep 2021 09:56:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqutxyzL
  R4OhaFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPVtV72gnOcFe9mXmduYHzB0cXIySEkMItJ
  Yu32iC5GLiD7OKNE66H5jCAJNgEdiY4X3SwgtoiAvsTS2XuYQWxhASeJ5q0PwOIsAqoSR09/Z
  wWxeQXcJL42fWMCsSUEFCSmPHzPDBEXlDg58wlYPbOAhMTBFy+YIWoUJbbvPMMCYVdIvD58iX
  kCI88sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6RrZGiml1ilm6iXWqqbnJpXUpQ
  IlNVLLC/WK67MTc5J0ctLLdnECAyklEKmGzsYv73+oHeIUZKDSUmU1+ymZaIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd6E60A5waLU9NSKtMwcYFDDpCU4eJREeNVA0rzFBYm5xZnpEKlTjIpS4
  rw7bgAlBEASGaV5cG2wSLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXF+Qynsy8Erjpr4
  AWMwEt9r1mAbK4JBEhJdXAVM7lMOFqy6zL7H/WZ7xsav5+MHFiwPrIF5F/1lWI/xP0MpI9ovD
  nrfbcf8mXcqZ8fK2hKdNQ26GT67CzIXFPzFKP64bW98qkDzx9zMGy1vGzRSurdbzuSfGVNybo
  Mr47d+t6qcL2uOvfE/0DjaYkrlJf3qL1q7iS0fiuyKYatpSJ+19Ni9116K1/5JSnb8XkF65MZ
  UvJ/v7JNHqKI9e7dxI7LyXsf+vKpaEurlJZrZs3L5i15Es913fBkAyW0nTDeP0M/86fwZJsZi
  4PNRf/reGXVbZgmzHrUta70NUNE1jXiUjd9Xhy9WgKw1uhBJv4mtMLRA7XP+1kn3Rf8avb5hO
  lC+NlTFeWfMjeeJNViaU4I9FQi7moOBEAmu52gB8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-232.messagelabs.com!1631181384!137148!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27797 invoked from network); 9 Sep 2021 09:56:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:56:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899uNR6028365
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:56:24 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:56:22 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dash: upgrade 0.5.11.3 -> 0.5.11.5
Date: Fri, 10 Sep 2021 05:56:16 +0800
Message-ID: <1631224576-4442-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

parser: Fix VSLENGTH parsing with trailing garbage
eval: Do not cache value of eflag in evaltree

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.11.3.bb => dash_0.5.11.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.11.3.bb => dash_0.5.11.5.bb} (85%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
similarity index 85%
rename from meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
index 53d018358f..8fe601a2d4 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "c7016b513f701d88c70b3082eb183581"
-SRC_URI[sha256sum] = "62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a"
+SRC_URI[sha256sum] = "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.25.1

