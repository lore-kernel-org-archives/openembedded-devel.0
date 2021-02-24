Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.7613.1614176836364369120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 5C/F0-41911-24266306; Wed, 24 Feb 2021 14:27:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVdcpySz
  B4LW9xcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa0b35BGPBOe6KQ1fOsTcwruXqYuTiEBLYwiRx
  5+ZaZgjnBKPEhjldTF2MnBxsApoSvVu2MILYIgL6Ektn72EGsZkF1CUurWthAbGFBWwkTh1+z
  wZiswioSrTOWwDWyyvgKvHk/xNWEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2ixOzLzS
  wQdpXEmo5pbBMYeWchaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdIGlqqJdYpZuol1q
  qm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMsJRChuk7GNe8+aB3iFGSg0lJlPejt1mCEF9S
  fkplRmJxRnxRaU5q8SFGGQ4OJQne4nignGBRanpqRVpmDjDYYdISHDxKIrzz4oDSvMUFibnFm
  ekQqVOMilLivFoJQAkBkERGaR5cGyzCLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5o0Fmc
  KTmVcCN/0V0GImoMVXYsAWlyQipKQamJSNtfTrGdd7npkVdDFOU9pl0ttOSekvbd6SLYuO8yj
  ttVpWv6qha7mWQOWSO6sk9t4y4zavafngW5b3oOYQ6zmRgJiMt4HM1f8SWqN+e4e/CbHSfWke
  5HjhrJrm3U4PibNn1mRlPb/GwvbJYaZc7cE33GHHH3IV/DVOd+679oyx7bP+jk+ZTql1ciu/m
  D9K2+y4f6futL1mq44Yr+E2cGlnys3iZClbELfsXqXCPt374haHTZ8v3i6TLT3xsMacjS4vMq
  IY/tXxfuy57OjQvuPBo4WTc9bGs3GE/ZezCpDZIZY0+b7AlldB7VzOW5JE3dQLTi1fayF6cf1
  uWwuu+x9uNFcJPDV5rcR1TclLiaU4I9FQi7moOBEAiXl12CsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-232.messagelabs.com!1614176833!477495!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1115 invoked from network); 24 Feb 2021 14:27:13 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2021 14:27:13 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11OERDSI006296
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 14:27:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 14:27:11 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] stunnel: upgrade 5.57 -> 5.58
Date: Wed, 24 Feb 2021 22:27:05 +0800
Message-ID: <1614176825-19967-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

License-Update: Update year to 2021

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stunnel/{stunnel_5.57.bb => stunnel_5.58.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.57.bb => stunnel_5.58.bb} (89%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.57.bb b/meta-networking/recipes-support/stunnel/stunnel_5.58.bb
similarity index 89%
rename from meta-networking/recipes-support/stunnel/stunnel_5.57.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.58.bb
index 8f6de571f3..1f1ca4e6b8 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.57.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.58.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 # a combined work based on stunnel. Thus, the terms and conditions of the GNU
 # General Public License cover the whole combination.
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=6bae28875b3b599f8f621f4335b17955"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=223b26c62f5e7c5c8656d6c133edd5ec"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "af5ab973dde11807c38735b87bdd87563a47d2fa1c72a07929fcfce80a600fe1"
+SRC_URI[sha256sum] = "d4c14cc096577edca3f6a2a59c2f51869e35350b3988018ddf808c88e5973b79"
 
 inherit autotools
 
-- 
2.25.1

