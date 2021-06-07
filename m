Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.33011.1623053476536398224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZP/PU1x6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623053474; i=@fujitsu.com;
	bh=yAE/gJo7pb8fClpOwtD+nU66zp1CNx10HGHX9UEgDcs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZP/PU1x6lTCCeOwGmOHS0CfTqojnl091x21/lF2A646ycdIgPA3vV1BQMb9MIcgQb
	 tea0RnXTZJi2e3MRMY1e6OaqgeVEf7o9GMqbivs8VAmCwsswJykr/87TFHrcqyZiTd
	 +g+XeTHNU3qvgY7TSAln8ZQz8kfRxM5OZZQP1OIm7CmGZT7BugQ/NA3gfqe7KVVjC6
	 cbk7Mn6DPU9XBG55liUKTLtwWKuW8f1nOj0O+IwN/zrVREe8plLGI8te+hbSiq3QcU
	 Iil220IphQMj6ovt3OVlz6J/3+fGNXXk/xaomhwhxxkYShuqWL57gUR6fxB3JGMge3
	 EBE4Hm+k1RMnA==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 09/A1-25406-2A4DDB06; Mon, 07 Jun 2021 08:11:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYorvoyt4
  EgzP/+S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyHvx+xFzRwVvx58YCxgXEaRxcjF4eQwCwm
  icbPv9kgnOOMEht/H2TsYuTkYBPQkeh40c0CYosI6Essnb2HuYuRg0NYwE+itakKJMwioCIxf
  9Y0sBJeAXeJS3tamEBsCQEFiSkP3zNDxAUlTs58AlbDLCAhcfDFC2aIGkWJ7TvPsEDYFRIzZm
  xjm8DIMwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWlrqGhmZ6yVW6SbppZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEhlFKwfHHOxhXvPmgd4hRkoNJSZSX7fjuBCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvEyX9yYICRalpqdWpGXmAEMaJi3BwaMkwvsNJM1bXJCYW5yZDpE6x
  agoJc57GyQhAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxswKgU4snMK4
  Gb/gpoMRPQ4mr7XSCLSxIRUlINTPEJGvcYz1eY3n+8vlysW8TvDfOkgzayDdNeNsfYPPpRq3i
  j8a/0Jut/njEvF/MGaq6Ojai723P73d69N1jWZ/zZtT9R0SE/g+lrhl+EbvB3tfzIlLNLWVX/
  skYofm+RsBa+scpuukXOKl8j48KORLlTp421P53s2hr15G+cxPqcLSdTl6hvapq2dIHhkbD1H
  QLC715Mnu6scKVU69nViLVFJxLvpZx2C5pwlnXCTv2S5e/in3A9YjLf9+Gt075LquKmx0UlHn
  Z6vVrVPO1E1tY94cZyHtGy8VyPWXf/O6O0dC/3+WdNp7YsD9az+FBu1qcvVNtd4h7VnSN06UF
  9ksSLe+uWLZ22qj/SositUImlOCPRUIu5qDgRAFtTcQMeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-287.messagelabs.com!1623053473!7606!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1717 invoked from network); 7 Jun 2021 08:11:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2021 08:11:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1578BAvQ005998
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 09:11:13 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 7 Jun 2021 09:11:09 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] [oe] [meta-gnome] [PATCH] tracker: upgrade 3.0.4 -> 3.1.1
Date: Mon, 7 Jun 2021 16:11:01 +0800
Message-ID: <1623053461-20727-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../tracker/{tracker_3.0.4.bb => tracker_3.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.0.4.bb => tracker_3.1.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
index 82e3d006e..7d9fe9b8e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
@@ -21,7 +21,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "c120d81f2df94aa794b1a7953b55cfa46de318ed68e6f3b5ad4fce0c729c2483"
+SRC_URI[archive.sha256sum] = "4376e2e98454066f44f7a242e45b99b3bfe4c03b67fab19abb0ed586ca748ae7"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1

