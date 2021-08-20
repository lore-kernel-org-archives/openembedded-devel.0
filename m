Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.81864.1629452334764037758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UctsiEGY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452332; i=@fujitsu.com;
	bh=CKajm0Cp+JvfrlDl2tCpRBbCOYo+0nnjOo91bwCswpA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UctsiEGYyKDOI6Jb2iXE9/ngQVc/GW8qhUMrqH95aRJ4JH3vqBBpIX8d6nszBfTuJ
	 tNf+mJzEl56vg0xl77KkZMCJ67J2us+ERuYB6PK2MjNhfV1sVsyOykOyBQKfYTNrJP
	 vaUvX9MLhz+gaYSpRZkmm52O+HsoW/iN4Y7huvc14h4zsQ7zGPNgOXS+XPAFZB/yKH
	 jtLBM6RM42RkWTjobGvjvFe3AHHiWdqX/9Tm9Lp4K3rS+4zN7elwj66ZdhCAFw/GpQ
	 EQk3h8zT5M3K6WmKnt7YI18MX3cU9VNJGXfQ85I0gMGJ7ed8j2RQaT2P/bLRA0xoSE
	 JeYxL/DBPv5Fg==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id D6/58-09210-C287F116; Fri, 20 Aug 2021 09:38:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYoqtTIZ9
  osGMOq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFx5wrGgomcFWvbpzE3MB7k6GLk4hASmM0k
  8bN5LyuEc4JR4kn3AvYuRk4ONgEdiY4X3SwgtoiAvsTS2XuYQWxhgSCJRd3PWEFsFgFViU3LX
  rKB2LwC7hLdUzvBaiQEFCSmPHzPDBEXlDg58wnYHGYBCYmDL15A1ShKbN95hgXCrpB4ffgS8w
  RGnllIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJY18jYRC+xSjdRL7VUtzy1uET
  XUC+xvFivuDI3OSdFLy+1ZBMjMJBSCg6+2sG48s0HvUOMkhxMSqK8qmbyiUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeC+VAeUEi1LTUyvSMnOAQQ2TluDgURLhLS4CSvMWFyTmFmemQ6ROMSpKi
  fN6lwMlBEASGaV5cG2wSLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3CGQKT2ZeCdz0V0
  CLmYAWC6nKgiwuSURISTUwLZVcIWAqdvzW/l37eo9sfLLI7NOD5ttnLJjVlK68KXGf1Hbl2a4
  9j+cdCLvUNetQiXikmNqBc5P/TMr6dMhJZeHOVxsbnRe/m3975dX8L8Uu2/OEWddxhuZdbS9x
  Dbf1itXbx/ws4KPg6r2KLCqXfet4Hy/a6s2g0rHgzOvJExRLf8WX5FitsVu8o0Z1ve0M3rNX3
  q8v+3vGMGPxgVnR1sc5b/VeLfgZx+SWIenH7pseZL900bTeTRJMUxZMV9aztL3G9+lq7bLY1N
  um63n1XjFd2elw9I5BUZt6eiPDxRJeV593boIdNeu3zFvr3Mm4L0m6+pO1k9PffSv9Ip/ZmN9
  PWs9Su1He5sm5hpTdpUosxRmJhlrMRcWJABYUpWYfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-271.messagelabs.com!1629452331!158350!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9990 invoked from network); 20 Aug 2021 09:38:52 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:38:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9cpB0006753
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:38:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:38:50 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.38.1 -> 1.39.0
Date: Fri, 20 Aug 2021 17:38:44 +0800
Message-ID: <1629452324-16574-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.38.1.bb => python3-grpcio-tools_1.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.38.1.bb => python3-grpcio-tools_1.39.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb
index ee7c140b3c..865124450f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.39.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "cd85f58038b92e1961f8127d79691e84e151390d35cae73c4c0cbe2042f76b77"
+SRC_URI[sha256sum] = "39dfe7415bc0d3860fdb8dd90607594b046b88b57dbe64284efa4820f951c805"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1

