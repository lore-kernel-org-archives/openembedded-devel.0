Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6847.1616723592469066030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 0A/89-53635-68E3D506; Fri, 26 Mar 2021 01:53:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MRqttmF5t
  gMOczn8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFzyna2ghfsFZv+/GRvYGxl72Lk4hAS2MIk
  MW/XDLYuRk4gZw+jxLRlgSA2m4CBxP6zF9hBbBEBfYmls/cwg9jCAnYSX3csYeli5OBgEVCVe
  L5QBiTMK+At8fnmIrASCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88YIZpFVCQFFi9nR5CLNK4s
  hMtQmMPLOQNMxC0rCAkWkVo3lSUWZ6RkluYmaOrqGBga6hoZGuoaWRromJXmKVbqJeaqlueWp
  xia6hXmJ5sV5xZW5yTopeXmrJJkZg+KQUHNDZwfjz1Qe9Q4ySHExKoryHTsQkCPEl5adUZiQW
  Z8QXleakFh9ilOHgUJLgfW0bmyAkWJSanlqRlpkDDGWYtAQHj5II7w+QNG9xQWJucWY6ROoUY
  zjHm7VLFjFzvAWTbffuAsl2MDlzwcHVzByzwOT99kNA8gGIFGLJy89LlRLnLQQZJwAyLqM0D2
  4ZLFYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmtQKZwpOZVwJ30yugc5mAzt34IxLk3JJ
  EhJRUA5N0dt5KLa5nzH51XGd/tL75nzml2KnKacr/HQzLGP47LpjD0b91JvuVV1elnJcGPexm
  +x4kXB3Rryc5eT/j3xV7Pkn+L+M3ja3Pmuu3XOMm1+MOi61iwqUGB8W5du+Kq5T8XXDZilHp2
  cG2aYEJzVVCbtZHzrzY6VW+b9qja1WKyrntzTviRbzX5ge9yLIzVPfesPPlteK93E8qVcXmB/
  q9YLYr7lktM4VxI6Pyz8JZEyIsdicmBh5mlPr+6DhDw8ennRFps3J5e/LfzmblfxLNPrtRdOP
  Xol8vjtjUC3+8N7npi9KZzOr1/dGXbufvfZf2xeOzd+ZZi0KdGI3/s7usnxrtc9X/lbFDfkH/
  TiWW4oxEQy3mouJEABTsk8ZQAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-33.tower-265.messagelabs.com!1616723589!755999!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17991 invoked from network); 26 Mar 2021 01:53:10 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-33.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:53:10 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1r9GO004973
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 01:53:09 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:53:08 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.36.3 -> 1.36.4
Date: Fri, 26 Mar 2021 18:24:46 +0800
Message-ID: <1616754286-67807-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.36.3.bb => grpc_1.36.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.36.3.bb => grpc_1.36.4.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb
index 738d5e10b..03de4997b 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.4.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "ce05bf557ced2d311bad8ee520f9f8088f715bd8"
+SRCREV_grpc = "3e53dbe8213137d2c731ecd4d88ebd2948941d75"
 BRANCH = "v1.36.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
-- 
2.25.1

