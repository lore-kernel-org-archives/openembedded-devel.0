Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.2717.1615858945787344682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 76/64-60958-FFC00506; Tue, 16 Mar 2021 01:42:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqvuPJyD
  BYMcqE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPxxgf2godsFa8XcjYwNrF1MXJxCAnMZJLY
  +6gTytnNKDG36yNLFyMnB5uAgcT+sxfYQWwRAX2JpbP3MIPYwgJWEq0LtzCB2CwCqhKd6x6C2
  bwCXhK3n09lBLElBBQkpjx8zwwRF5Q4OfMJ2ExmAQmJgy9eAMU5gGoUJWZPl4cor5SY+2Yh0w
  RGnllIOmYh6VjAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJC18jQVC+xSjdJL7VUtzy1uET
  XUC+xvFivuDI3OSdFLy+1ZBMjMIhSCo5d38F49fUHvUOMkhxMSqK8fswBCUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeI9xA+UEi1LTUyvSMnOAAQ2TluDgURLh/QmS5i0uSMwtzkyHSJ1iVJQS5
  80HxoGQAEgiozQPrg0WRZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCUNM4cnMK4Gb/gpoMR
  PQYkNpP5DFJYkIKakGJhfjowJz3Pv0VnA8+WV4gfup6O2n3Ld5yg93uOqVeq69FPPlqEPCxqt
  GZ+/kNYrG7g+rKhd9atGQNMFINDCvZ7db1tbl7mFcyl5m1zZ3fdt+xSnRySSKUX7by+Rv7SZH
  tSvq/sdtvtfAsXnBfQHXa5c+LXO191AI3H5pw+w3tfLfZt69Zs9o8On2Y5mL85bJp33lnM+61
  ndZ7pXTTVKvC9a5RikWRezc52j2om2qw3mVw38+JP9VtGXTb98q32+SP2G9j3xwVOZiq2mWq9
  yfPv9//tcFQ0lnQ0FLW+nIW3XKjlNVuvJSVS2vnrz/2mm105Mavc1voo88nL15fXzJFZVkAaY
  85W9f79UIJs9TUGIpzkg01GIuKk4EANoiiogdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-287.messagelabs.com!1615858942!236833!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21423 invoked from network); 16 Mar 2021 01:42:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-20.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:42:22 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1gMLj021205
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:42:22 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:42:20 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gd: upgrade 2.3.1 -> 2.3.2
Date: Tue, 16 Mar 2021 18:42:09 +0800
Message-ID: <1615891329-3394-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/gd/{gd_2.3.1.bb => gd_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gd/{gd_2.3.1.bb => gd_2.3.2.bb} (96%)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.1.bb b/meta-oe/recipes-support/gd/gd_2.3.2.bb
similarity index 96%
rename from meta-oe/recipes-support/gd/gd_2.3.1.bb
rename to meta-oe/recipes-support/gd/gd_2.3.2.bb
index 60abe73a14..37896415ee 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.2.bb
@@ -16,7 +16,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
           "
 
-SRCREV = "75ef79c9b013fb5eafd92710b3867827682fd52d"
+SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

