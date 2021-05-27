Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web10.1250.1622078835362908077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 18:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IFO8Hv1q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078833; i=@fujitsu.com;
	bh=4LciulR6/xM6lVOkZeNACbmhQgVSXKyW1+9wa1/UEeg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IFO8Hv1qN/qLew7mA2OnWKFh+okZ+n14W9UxL+o7xClBJMD2XMJaCujDUZt75SeR5
	 mjeV/Ep3KoTOIfgBZ1bnvJptPgPmQYm41PlLBVYfns3VlsZhRSl6aZbNwabVxP4zkp
	 nH+dg3QP2tzYfcbayPWGbQR2y5XFweMUS4Qx53ZkJGP455GOFPT/wia6I4ZAZT5zbh
	 WQlaVN0jHEFbvWTAb6nJ7pMtKdszTZqMJ2CkkffNp5R8eDEq/eNhdM9SfhUPPMr52T
	 CyjPBPLrTzMcbDcVakj8YyVy0uCCTEs4of1iCpYGSn4Ku07vJYsQ2BSJ96+gAGMbax
	 1ZR07xotp1cGg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id A7/0E-55921-175FEA06; Thu, 27 May 2021 01:27:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1S38ui7
  BYOEfIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFsSPMBV/ZKx5+qmlg/MfWxcjFISQwm0li
  wckzTBDOHkaJFTMWADmcHGwCuhLnHq9lB7FFBPQlls7ewwxiCwtYSSzYOo8NxGYRUJXYvOsGU
  D0HB6+Ap8SMZ0IgYQkBBYkpD9+DlfMKCEqcnPmEBcRmFpCQOPjiBTNIuYSAosTs6fIQ5RUSM2
  ZsY5vAyDMLSccsJB0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlpa6BoZmuolVukm6aWW6pa
  nFpfoGuollhfrFVfmJuek6OWllmxiBIZQSsGx6zsYr77+oHeIUZKDSUmU99qJdQlCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHg/fgHKCRalpqdWpGXmAMMZJi3BwaMkwtv4GijNW1yQmFucmQ6RO
  sWoKCXOmwXSJwCSyCjNg2uDxdAlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8O0Cm8GTmlc
  BNfwW0mAlosVAi2OKSRISUVANTauH8KaY50XUb5qWu3JNec+qoQF/ZxXVzhO48SJPK27hWOdX
  ZJ+v9l5qJ3UsrJV6+1NJtncUsWsi2Nzm5gUfz6yWFfjtlsymfBU//2bvq+9cjgtcVn/G4X/iz
  w0Dw+Uuv9yr52govcoovcM9wzZgjtnuvOOu9x817Ntpd3z9hjuPWF6Zym2oVzSckzPyaYnS4y
  GmnqYNxqFgGt9sKmb/X9X0lf874HXzupNrnNeaPXrb+MWWb9a61LKhv3YPY3Fnv7Y/yhERE9+
  qedXScfUZs26Faec+sSPFtkd+6DHJX/g2LtxNdcDH+9xHRjomMJw1V9lt8/RsV08MQHfJxV7R
  J+a0lYWy/jAVfHEg8krlUiaU4I9FQi7moOBEA7AZTZhwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-285.messagelabs.com!1622078833!197996!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19487 invoked from network); 27 May 2021 01:27:13 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-19.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:27:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1RCFa017540
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 02:27:12 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:27:11 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libndp: upgrade 1.7 -> 1.8
Date: Thu, 27 May 2021 09:27:01 +0800
Message-ID: <1622078821-116548-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libndp/{libndp_1.7.bb => libndp_1.8.bb}                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libndp/{libndp_1.7.bb => libndp_1.8.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.7.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libndp/libndp_1.7.bb
rename to meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
index 07a7a1d239..0d35465c8c 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.7.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/jpirko/libndp \
            "
-# tag for v1.6
-SRCREV = "96674e7d4f4d569c2c961e865cc16152dfab5f09"
+# tag for v1.8
+SRCREV = "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1

