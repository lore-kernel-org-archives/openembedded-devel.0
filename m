Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.10397.1617328573626832347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j6anqUdY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617328571; i=@fujitsu.com;
	bh=sMnoC/Apz+ATXtwoBXczso+kfUglHdF3e2hN/VpquDQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j6anqUdY8KiIcECcWEZThJv1X09oVaXNJAOxHg3oXDqQmL1GHYdmbXup1hzgkXolH
	 71gRuxK0v7XpoR93T597Eh5zIYPeSYgLdFCX3163OsJRjRl0U+lFcGwwtZOyjss8cy
	 P9tR7MW0prwH/rPQS/wzUPuGty21wYx1mffRMbBhS8j2t4MFMt8P9kHu247nGJNyQr
	 9Hp2m2eEY7RBKc2yi6Z1qW6+Dn3Ik471njXlxGruT2RDnb5AwlFyMvVgglxDDWvmw2
	 5rTB4n44hcmdMxK3RIuqXGVjtnR/KDHMFhqNGb9/ryFsJuwF4TNNUJd45vXKROAzSZ
	 5fEyCj4CT+7mA==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 5A/16-14660-AB976606; Fri, 02 Apr 2021 01:56:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MRqrurMi3
  B4O1uFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePl5lMsBQ85K55+7WZtYHzL0cXIxSEksJVJ
  ovXsCzYI5zijxN85H5i7GDk52AR0JDpedLOA2CIC+hJLZ+8BiwsLOEvMnfgZzGYRUJH4+PstU
  xcjBwevgJvE/vPRIGEJAQWJKQ/fg5XwCghKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0mcnf
  2FaQIjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmka2RgopdYpZuol1qqW55
  aXKJrqJdYXqxXXJmbnJOil5dasokRGEYpBQfO7GA89fqD3iFGSQ4mJVFeccO0BCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvE8rgHKCRanpqRVpmTnAkIZJS3DwKInwGhYBpXmLCxJzizPTIVKnG
  I05Ll+ft4iZY/PcpYuYhVjy8vNSpcR5+0EmCYCUZpTmwQ2CxdolRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8nMDIFeLJzCuB2/cK6BQmoFNcb6SCnFKSiJCSamBaZvcopTtP11Lx0t07d02
  Ofsl/3PrtMdP6LH+ef1Nz5jNvePV/8hK5qf3cPYd9f26z8M6ufXZdRWj+Dg2ms/3n67P61h8O
  3Pdk3jq5gzLCEzL6gx6sbbC2EHTPu1An/2H/83UTTL7H9C62+dZ+yXVViVQE7/9M9m4h8TduE
  T9OHg4/ellq4zPj0sYu1iU63ye1yx3iUU28orieqSn778GSuVv3V8mtTbNIv2G4/+jBFXW6Gu
  ctj225NqNl5rF8/6R5SZs5+d0vWQVNuWXbZMPqYJz8X0v8tl9bhf5x/wpl61WqUwL3N5ndvr1
  EWOT33WtrGc5OSlpjomm15Fn53z/Wa4rlK/9tfrT6k+UqlkvqSizFGYmGWsxFxYkAQc4wYjAD
  AAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1617328570!519880!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22972 invoked from network); 2 Apr 2021 01:56:10 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Apr 2021 01:56:10 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1321u46Y019258
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Apr 2021 02:56:10 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 2 Apr 2021 02:56:03 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v3] libxaw: upgrade 1.0.13 -> 1.0.14
Date: Fri, 2 Apr 2021 09:55:54 +0800
Message-ID: <1617328554-7656-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
index cb1ffcd8c..15f52d8d4 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
@@ -5,10 +5,9 @@ DEPENDS += "xorgproto virtual/libx11 libxext libxt libxmu libxpm libxau xmlto-na
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
-PR = "r2"
 
-SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
-SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
+SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
+SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
 
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.25.1

