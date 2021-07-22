Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.5583.1626946819214254659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t8e8fy3K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626946817; i=@fujitsu.com;
	bh=Lj2hVvcPbObFBUAzAkTqvVuxWivcwCubrGwPZ6+ssLU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=t8e8fy3KqDR05zDR/0veRAa2WxiioJ9AVsh/IWK/PCP6+dt27rwaLPsFOJTjz0k4n
	 TOEa4h/XBLjTYqlmFP/xMOisK1q1Bnc0GGRvlVx2Dl6tZy9yDsnPJ44j5LsqBMi2Dg
	 vaqxsaD2kwn3BAHT7Xr8WGeT3nnpD3QMHbE6tQd2G4lLa0RcWZVLqS9HE6JxlvrR/u
	 H2qGlGw3iKJl/Kw7vyaEK+uCLTpuIdJp6uWCrxsoJCXSGwidhaks+KX9SD1PkCXay0
	 WigF6uSItRNp2bKcGmrIofeBvbnoVmF+ZFH5Yx0B7i+n8YxPlp9XBrDvg/reLX8yY6
	 I3sDUxsHnEs3w==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 33/27-27654-10D39F06; Thu, 22 Jul 2021 09:40:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVZfB9me
  CweblRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bLc4vYC/o5K2bffcHWwDiLo4uRi0NIYDaT
  xLd7txghnBOMEvO/H2XrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHvYuRg4OYQF7i
  VltPCBhFgFViR3f9rCD2LwCjhLT5s5kArElBBQkpjx8zwwRF5Q4OfMJC8QYCYmDL14wQ9QoSs
  y+3MwCYVdIvD58iXkCI+8sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hpqWtkZK6
  XWKWbpJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERheKQXHH+9gXPHmg94hRkkOJiVR3rNs
  3xKE+JLyUyozEosz4otKc1KLDzHKcHAoSfA6Wv9MEBIsSk1PrUjLzAGGOkxagoNHSYRX3Bwoz
  VtckJhbnJkOkTrFqCglzmsB0icAksgozYNrg8XXJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjE
  rCvKFWQFN4MvNK4Ka/AlrMBLR417SvIItLEhFSUg1ME+sa3R+JO/r1i3HeONkba2Ors0XLeMG
  WzbveuYt4fZfpuKq5ICf/foOYwGJJxhn9Qm8UXi/Pdfix9FBVQ/zFbfqFkiXRj1dNKTom9EHT
  QT3n2dF/72J+qv3+/takUinupvHT2I5+le8rJjdYMUduu/q/fUJpWe2Ex7f2C/bV8lkd73496
  ebfkpnL/n27v7ou6NTaTbuOBd1TfmpVrcl/3G2W3Ov/SbM1s/uXHvpR93XJHf4noY9FWUw/OU
  6drSSpkOj9Ik1fvlWebXv2wYv8Shu0t4a/EwmQ2e2mvoLzX6q/zWNHyYyJ8cclzhps+/Eyw1v
  tO8OFaq39vTyPVj2wv150jDn6WKbGf/GXhX/9lViKMxINtZiLihMB3r77wSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-287.messagelabs.com!1626946816!3340!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20387 invoked from network); 22 Jul 2021 09:40:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jul 2021 09:40:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16M9eBwD013410
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jul 2021 10:40:16 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 22 Jul 2021 10:40:08 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 40.2 -> 40.4
Date: Thu, 22 Jul 2021 17:39:57 +0800
Message-ID: <1626946797-5560-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

==============
Evince    40.4
==============

shell:
  *  fix compilation error when DBus is disabled (Tom Schoonjans)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_40.2.bb => evince_40.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_40.2.bb => evince_40.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_40.2.bb b/meta-gnome/recipes-gnome/evince/evince_40.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/evince/evince_40.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_40.4.bb
index fa5125b53e..59999b749f 100644
--- a/meta-gnome/recipes-gnome/evince/evince_40.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_40.4.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "0ff7ec79376a8a97ac4cd274d32e804c7e236ef2d2d5d3f646de6eb882a63c77"
+SRC_URI[archive.sha256sum] = "33420500e0e060f178a435063197d42dae7b67e39cc437a96510a33ddf7e95fb"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1

