Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.1518.1624500108643018206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f94DHe4Y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500105; i=@fujitsu.com;
	bh=vnkoaFNsgTBO9o2h2BGH3yZ6CMFtWmSZCMiO89ZmWtg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f94DHe4Y2PqIgNNPoOtYWWdJ2e3QpbdaPcTt2KPEivMiH591HDs+xNZXFy70BTLJT
	 xdEyjj1aSY9UxjAbZQRY9GTYJ76ACvgq8dJA4HBSnSzme+DN9tshRKsFh9gh6TpKmq
	 nMdLhJ9X1Hfi9sSBoT/o4PANCthGcZd+7QW073rQDp0YB7mBTUB+Tv3dXIbLEY315S
	 yXd9PU4pCUoxq2DhSgBtabfUnOVyRTCdZoG51REuiURydM1dS9+bCcQacBSiIjrcDB
	 rtdOygThOvkJy2LT2pzFSsD9PtCKA3x7xKpgcdpEA1iPpevP45cuddrbE5s4UO7jyg
	 hHrhOud790Z7Q==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id DD/A5-14259-987E3D06; Thu, 24 Jun 2021 02:01:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0W1/fjn
  BYP8bA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePWpcOMBe08FXu6utkbGOdwdzFycQgJzGaS
  uNn1gwXC2cMosf7eVLYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBbwkNr7qBbNZBFQl2r7+A
  avnFfCQ2HLiOhOILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkJgxYx
  vbBEaeWUg6ZiHpWMDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNccyDLVS6zSTdJLLdVNTs0rKUo
  EyuollhfrFVfmJuek6OWllmxiBAZSSiF75g7GyW8+6B1ilORgUhLlLW2/nCDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJglfiGVBOsCg1PbUiLTMHGNQwaQkOHiURXssnQGne4oLE3OLMdIjUKUZFK
  XHex0+BEgIgiYzSPLg2WCRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM2wYyhSczrwRu+i
  ugxUxAixV+XwRZXJKIkJJqYDLd9qR/3fb5NyStY7n7487PSvwq0vnOOzl+x5XDO9Xv3Wfq9VS
  rnFDxvp73wBH3hW/uL2TbqvrkN6Pk/+aTl9jDG1d/ZO67Ooe9bvpms+BgifiY3Q1M9zyT1m4W
  CalIt41iTp9/zmG10awS9iDWZ5bmddVrlXaevlOSy+W5S96qWuSv7+1Y0QkbBSsvW+7u3bVpz
  p/myM0e1sGlIcqTbELaZ23d+mn+ykcpf9103s18+F6T56aC/+VTEuY+8mUXEpw/OQZaLXHWdu
  A9yxT56vOOlakvWo+pyluERlsp/bPc+WWpZbjrpgtu77za5l5/peSs/EvHZFlN6vyutufrFvd
  VFylu4zi7ec2N00pRc5RYijMSDbWYi4oTAT35vCUfAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-238.messagelabs.com!1624500103!52275!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26642 invoked from network); 24 Jun 2021 02:01:43 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:01:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O21hk3020560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:01:43 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:01:41 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-telnet-perl: upgrade 3.04 -> 3.05
Date: Thu, 24 Jun 2021 10:01:32 +0800
Message-ID: <1624500092-82603-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ibnet-telnet-perl_3.04.bb => libnet-telnet-perl_3.05.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-telnet-perl_3.04.bb => libnet-telnet-perl_3.05.bb} (78%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
similarity index 78%
rename from meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb
rename to meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index 652e8c941e..c5d8271ff7 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -12,11 +12,11 @@ HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
 SECTION = "Development/Libraries"
 
 LICENSE = "Artistic-1.0|GPLv1+"
-LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=3fd238bfb6ee1810cb15d5d95e07b0f5"
+LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
-SRC_URI[md5sum] = "d2514080116c1b0fa5f96295c84538e3"
-SRC_URI[sha256sum] = "e64d567a4e16295ecba949368e7a6b8b5ae2a16b3ad682121d9b007dc5d2a37a"
+SRC_URI[md5sum] = "c8573c57a2d9469f038c40ac284b1e5f"
+SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
 
-- 
2.25.1

