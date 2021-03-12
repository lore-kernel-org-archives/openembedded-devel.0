Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.5222.1615533439754333814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.5.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 0E/EC-23163-C751B406; Fri, 12 Mar 2021 07:17:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRbdG1Dv
  B4PdXUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP17V7Wgma2iinfvBsY17B2MXJyCAnMZJLY
  tNGzi5ELyD7OKDG5uZUNJMEmoCnRu2ULI4gtIqAvsXT2HmYQm1lAXeLSuhYWEFtYwELiz2KIG
  hYBVYlZE98wgdi8Ai4Su45eA6uXEFCQmPLwPTNEXFDi5MwnLBBzJCQOvngBVaMoMftyMwuEXS
  mxZ/ND1gmMvLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hobGuGZCll1ilm6SXWqqbnJp
  XUpQIlNRLLC/WK67MTc5J0ctLLdnECAyulEI2rh2MT19/0DvEKMnBpCTKG8TsnSDEl5SfUpmR
  WJwRX1Sak1p8iFGGg0NJgtdPGCgnWJSanlqRlpkDDHSYtAQHj5IIr6EIUJq3uCAxtzgzHSJ1i
  lFRSpz3BUhCACSRUZoH1waLrkuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnDQKbwZOaVwE
  1/BbSYCWixl6oXyOKSRISUVANT0/mZTpJfNE7N4YhwCTVqW1+9V5oz/f0yuVmTjDR2TLrrFz4
  /rcVZuDxDd3ehgsqH7esL8i6VzdlnmLjrZ1qbwVv543m367I/tZsy9cm9YbFdsGTpmsbFDrt+
  TN62qI1PIbz7yheRQ3o7yqblfy1OPF62RivbZNbJJ3e3uM//Kv9P7833dUGpShv6Ff+IzevK9
  7yZo2jUJKb0vpjh4xx/u2K26hRdrpy2hQ+MO8Sk4ip/T60NM//zTUqgYeuM1sVt2hI7Jl5Q2s
  HgLsRZtm56c6Hu6ub37/o2ng7UkF67c6LSrN0/uG9rpyeci3KetX/Wu22PDO/rsHzdFnKt+5f
  RwvtvXzyV92I7bfH+1aY1SizFGYmGWsxFxYkAKEZ43CkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-248.messagelabs.com!1615533435!1570915!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11320 invoked from network); 12 Mar 2021 07:17:16 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2021 07:17:16 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12C7H9JC003554
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 07:17:15 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 07:17:07 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH v2] czmq: Conflict resolution for sha1.h
Date: Fri, 12 Mar 2021 15:16:59 +0800
Message-ID: <1615533419-8467-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

libmd(oe-core) also uses the doc 'sha1.h', so package it in own subdirs of czmq.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index e742d2a1c4..e6a4bc4c42 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -30,3 +30,7 @@ PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
 
 BBCLASSEXTEND = "nativesdk"
 
+do_install_append() {
+        mkdir -p ${D}/${includedir}/${BPN}
+        mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${BPN}/.
+}
-- 
2.25.1

