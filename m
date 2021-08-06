Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.1757.1628233193499288397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 23:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jcKxKKIs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628233190; i=@fujitsu.com;
	bh=EUhWodMPNhPcRiBwPQlwN/BOjD4L7kvB/XGEmgvFGI8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jcKxKKIsedwK+1itjJXZDt8l7gG76sHPa6ow69Te9iWKFuT3OSSO6CsyZVf+YDyPl
	 rrsSnUxqpGa1KDgbQJPLZ2SX6ySi6K9as2MWm9esJ7YMx5n7gNd1mgF+GAM291bH55
	 z2+9PSHoBFxDwyoJe2isiPkHP1LnozR7KA/6lrRbEIX9SHWC761K/uPDaTloidY4zs
	 LzcxV0beynU5LjS54E4qn4vCqifpNyMe8oQ7nWc2SrMqIkjmzAsb7uCfNhgQITtReV
	 rQTOgpdwYaxRSJg1XKiiYw3tmBaZFqfBOJbbVA9kk3/sk4iz2qjyWr3qK6eEihM05A
	 /OVLu2hUvd5gw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id E4/6A-07274-6EDDC016; Fri, 06 Aug 2021 06:59:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxRffZXZ5
  Eg6XXWSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy7RzgKFnJXfLp5lbWBcS5XFyMXh5DALCaJ
  V5tnM0I4uxklehZuAnI4OdgEdCXOPV7LDmKLCOhLLJ29hxnEFhbwkXj+dSJYnEVAReL/z6lMI
  DavgIfE+cenwXolBBQkpjx8zwwRF5Q4OfMJC4jNLCAhcfDFC6A4B1CNosTs6fIQ5RUSrw9fYp
  7AyDMLSccsJB0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6hqaGuolVukm6qWW6panFpf
  oArnlxXrFlbnJOSl6eaklmxiBQZRScHj6Dsb+Nx/0DjFKcjApifI2n+NJFOJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTBG3cHKCdYlJqeWpGWmQMMaJi0BAePkghv1y2gNG9xQWJucWY6ROoUoyvHs
  7VLFjFzbJi3FEj+v3sXSPYvOLiameNm+6HVzEIsefl5qVLivJwgswVAmjNK8+BGw6LxEqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gkgJ/Bk5pXAXfAK6DgmoOMuxHKCHFeSiJCSamCyq3Z
  w2haRNHcHo4yvKiP3vEgH52aX6Q/fnvS6yDD/TNSjFXa/5iYJGtVv913h0Z1yNKTqCENce9q7
  fZ+WcS93PaXYcfik5oLJ90tO5lnG3j96kCljgdXJZWyu86dPkhK8ZJgg9MeUsUn2ous3raXxU
  z6o2v1xcwp+b3jmVeH8xGTlNwXhCvsWimRsMrNdpHxKnG3tJtZyr8MOuy9PtPwfofGBsVrf29
  b6ZYXkopOnvL599jsz8+c9bfd3ZXGbb774rW257j9nxduCtBOafhMe/394gI1bvYNhbepvO19
  72dR9k1ZpHVwzVfzi1Lj/lQdCZrIwb3xtWvJHdgfX73tXlyQcPM657cLslM2Hy7dNVWIpzkg0
  1GIuKk4EANbaokVBAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-267.messagelabs.com!1628233189!114420!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14750 invoked from network); 6 Aug 2021 06:59:50 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Aug 2021 06:59:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1766xf1e022945
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 07:59:49 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 6 Aug 2021 07:59:39 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.2.0 -> 4.2.1
Date: Fri, 6 Aug 2021 14:59:32 +0800
Message-ID: <1628233172-40265-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 4.2.1 - 2021-08-02

Support setting socketio_path to the root URL #242 (commit)
Use the gevent selector to avoid 1024 file handle limitation of select#228 (commit)
Pass reason when closing a WebSocket connection (commit)
Improved project structure (commit)
Remove executable permissions from files that lack shebang lines #240 (commit) (thanks Ben Beasley!)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-engineio_4.2.0.bb => python3-engineio_4.2.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.2.0.bb => python3-engineio_4.2.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb
index 7a828a645d..2eb82e8fc8 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb
@@ -17,5 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[md5sum] = "1fa937ec2a9f6feac27e9f65824c5781"
-SRC_URI[sha256sum] = "4e97c1189c23923858f5bb6dc47cfcd915005383c3c039ff01c89f2c00d62077"
+SRC_URI[sha256sum] = "d510329b6d8ed5662547862f58bc73659ae62defa66b66d745ba021de112fa62"
-- 
2.25.1

