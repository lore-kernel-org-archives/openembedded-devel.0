Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.2730.1615859019925935214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 97/C3-53635-94D00506; Tue, 16 Mar 2021 01:43:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0fXkDUg
  w6GgRtrh4eCmzA6PHuY0rGAMYo1gz85LyKxJYMx6sbGMp2MhVseBmM2MD4y3OLkYuDiGBmUwS
  b99MYIZwdjNKTNv9lr2LkZODTcBAYv/ZC2C2iIC+xNLZe5hBbGGBYImpk7uYQGwWAVWJGQdWs
  oHYvAJeEm9/LWIEsSUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDllRJz3y
  xkmsDIMwtJxywkHQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWprqGhma6iVW6SbqpZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEhlFKweHrOxhvvf6gd4hRkoNJSZTXjzkgQYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IE7zFuoJxgUWp6akVaZg4wpGHSEhw8SiK8P0HSvMUFibnFmekQqVOMi
  lLivPk8QAkBkERGaR5cGyyOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQShpjCk5lXAjf9Fd
  BiJqDFhtJ+IItLEhFSUg1M4tpi96VMlgc2pWqXGDZopMYotlzOeHbav+BmV531jAzD916KdXn
  xt79MnnxE/+jWzzuesi/7am8YIT299MGiK5sXMRbw7g8K4rjR/72n4w1TrFvh3orn+ZXCPJ/q
  5s5dX+A/U+/+5vdLQjctaFj27qDouwdZdYzNuf+nB8096dXefUCXOalB0CfnwJQXc597RNl9s
  8hx47u64sXzrZMO/Pzx27K2TqDrpI5u77o/bHcf5miX5Z9wWpmybg2HJ79FVU/no4W5n26ZHF
  cL0Zi9bPnEnLsx74pPvWO91rSad+IS9aM3UoKVplj46u8+xvVG33lj5SQho0kZ84N+X9RcwXz
  QJfZ+xq5et8VSLR9vK7EUZyQaajEXFScCAJeuRVgeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-29.tower-265.messagelabs.com!1615859016!2125976!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29200 invoked from network); 16 Mar 2021 01:43:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-29.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:43:37 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1hXuf019353
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:43:36 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:43:32 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcrypt-openssl-guess-perl: upgrade 0.11 -> 0.12
Date: Tue, 16 Mar 2021 18:43:22 +0800
Message-ID: <1615891402-3519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...guess-perl_0.11.bb => libcrypt-openssl-guess-perl_0.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.11.bb => libcrypt-openssl-guess-perl_0.12.bb} (86%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
similarity index 86%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
index 57df78b4e1..6f35e39bf3 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "e768fe2c07826b0ac9ea604c79f93032"
-SRC_URI[sha256sum] = "aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167"
+SRC_URI[md5sum] = "9e86baf96828a38c967003a5e66f0c39"
+SRC_URI[sha256sum] = "0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d"
 
 DEPENDS += "openssl"
 
-- 
2.25.1

