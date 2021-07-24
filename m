Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.8547.1627145188304422832
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 09:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xpXB/ZY3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627145185; i=@fujitsu.com;
	bh=HryE8UrnO2qHxqTbsNqgmAI9iBUpK16yX3aUWz8WDjc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xpXB/ZY34zIZWZ1MoaL4StJZcnXmUeYCKkD3VLwXndttJ1/1qmUOyHn0EqFaVO3GE
	 gB741C7MDN5H1ccIc/R2V3zxzaxlKSbh1YXXiXsooM4nrkGsYVLsgqLEqdYpKtYQzk
	 U9yHUdw8EID7Z2yyHRAdQ3syBguKZEtFTwVURJm8W7LmpkAqrFaC5XKJak+3tIIeOl
	 VB/2ga2ag5lkZpSxGwzayi8VHvC9rmBhuIZfuBYnv44o6isfQVilxhnA6VUg4xMLyW
	 cbuqiFFMwXIz1fmG2S6zg1cPQJ0SCHKcAxvHeWd19u1zkhImZAZzWyt7yuvMMrEd7X
	 XpCjdofeSah/Q==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id D6/A6-07211-0E34CF06; Sat, 24 Jul 2021 16:46:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVfeB858
  Eg49PlS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyPL20LpvNVXJ32gr2BcQVPFyMXh5DAbCaJ
  C7OXsEI4JxglHj49w9zFyMnBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQWxhAU+Jo1NOA
  sU5OFgEVCWObuIACfMKOEmsXPYTrFVCQEFiysP3zBBxQYmTM5+wQIyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdQyBprpdYpZuol1q
  qm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMr5RCxtIdjNPefNA7xCjJwaQkyqtk/SdBiC8p
  P6UyI7E4I76oNCe1+BCjDAeHkgSvoyNQTrAoNT21Ii0zBxjqMGkJDh4lEV51C6A0b3FBYm5xZ
  jpE6hSjopQ471UnoIQASCKjNA+uDRZflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ814F2c
  6TmVcCN/0V0GImoMWnun6CLC5JREhJNTAJRFqwnDP6eq9xc2hAhc7ZxON54hEas2yjj3HsWeK
  7VHLymW2Nm472L5CfaW81e3Wal7aovn169J7dsmt1T/iHrbPJmvDnwbZpJqttuZdHPlXYkrVp
  XZB2efJGhrntrDvLv9+594LdsDE/7tSW4GTjGP2+mlu3HYReHBddc/jpG69/697klYe2F/V+t
  BU2VpR8ePwwa9CGfXu612os8j1o91x5za5Tp/bKpp//O9tBaS+rqOHaK9/DXZVesP2sref1n/
  15Qk6xYMt/hlsL9mlJHvxQ83SC1ZHGG49/hD659qTMjknpXqItL9ereycTf/OvM219y53fFlh
  ZNX3uRq9V608FTTpp35R3nqfp9YQdSizFGYmGWsxFxYkAjHTITSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1627145184!61645!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6046 invoked from network); 24 Jul 2021 16:46:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jul 2021 16:46:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16OGkIKs021705
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 17:46:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Sat, 24 Jul 2021 17:46:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libtalloc: upgrade 2.3.2 -> 2.3.3
Date: Sun, 25 Jul 2021 00:46:04 +0800
Message-ID: <1627145165-12120-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

License-Update:
 add note:
     ** NOTE! The following LGPL license applies to the talloc
     ** library. This does NOT imply that all of Samba is released
     ** under the LGPL
 "GNU General Public License" changed to "GNU Lesser General Public License"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
index ae92de2db3..1d227dac6c 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
-                    file://pytalloc.h;beginline=1;endline=18;md5=2c498cc6f2263672483237b20f46b43d"
+                    file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
+                    "
 
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
 "
-SRC_URI[md5sum] = "3376a86bdf9dd4abc6b8d8d645390902"
-SRC_URI[sha256sum] = "27a03ef99e384d779124df755deb229cd1761f945eca6d200e8cfd9bf5297bd7"
+SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
 
 inherit waf-samba
 
-- 
2.25.1

