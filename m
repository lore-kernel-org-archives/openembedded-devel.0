Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.5165.1626942719070131853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 01:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gEdOFL7n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626942716; i=@fujitsu.com;
	bh=FJLnMMcCePIiXpE1seKscdqLHOGoPszruY+i5QOQjbA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gEdOFL7n8MyTiPolJvR2h5PX5moH8yuYcs5ed/reRNWfnbrgp6xbF/KMjLQ7ncKxk
	 Fqy2yC6qeTgWFQ7VAlvIE6rBwDCRPKFShh8UAxl4juDgnVz87uajhbED0suGB+8Mun
	 SqZVeK90eolatGDfgmegaiqgBnCp7y8nIqrJJTIqcKS8v/Yj5WDiqsVWiSeIfxaW6N
	 gRHdo2SJgjF27reA9yEz23Dnj9Q4pyvB2N7uK7WcRjlug+PoAvJL3lBZQbZNiZVYaF
	 9tZNXAuEoCyWZonGjgQzoEGEg4NJP1sTBdUlIjf2IBYlORX6TekG20eSGoeQNFRY/f
	 52Ic1XXCNIvTw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F8/C5-03136-BFC29F06; Thu, 22 Jul 2021 08:31:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqvtb52e
  CwfR36hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a7q89ZC95yVsyZJ9/AOJGzi5GLQ0hgNpPE
  y/5PLF2MnEDOCUaJ7zulQWw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBfwkXqyZB
  VbDIqAqcX3rJLA4r4CjxNTuV4wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2aIGkWJ2ZebWS
  DsConXhy8xT2DknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXUNdQ1NjPQSq3QT9VJ
  LdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiB4ZVSyNi3g3Himw96hxglOZiURHnPsn1LEOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBy6D9M0FIsCg1PbUiLTMHGOowaQkOHiURXmUOoDRvcUFib
  nFmOkTqFKOilDgvMzBChARAEhmleXBtsPi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd6
  8W0BSezLwSuOmvgBYzAS3eNe0ryOKSRISUVANT59XdMRd+ssobbGp00n0/7Rez+e6FtWH9O7j
  DRTIl0jweis/PFy9qOprlWHrVzaJwU3fF2tfXNUtOfjX413Jt7f8XxhI3mrZOvLFk2dnz2xQf
  tDl77dXqlesJlngq1tB1an7aHzdllrfXsmOnizW6Hv53TuRQ3nfPW6fDjSqW7/LYyftwqe2cF
  zM3L2s/aSlTWb/3x3VzPU1ToW+FrWpfayNutpod2Zd0wNzdcep82YIexeQD+Sce8vAd+7ZMyS
  dgevGhL5tdvoTaZdkrhC/9dL3KT91HJHZT2Wy2A0yXK+cuu2m0Nm3T3NvWK9qv/LNwt/zbmRK
  129HDgK9klxT7l6/pFeWzQk8EHPSqXXleiaU4I9FQi7moOBEAMECPZSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-226.messagelabs.com!1626942715!49055!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17981 invoked from network); 22 Jul 2021 08:31:55 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jul 2021 08:31:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16M8VlUj010369
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jul 2021 09:31:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 22 Jul 2021 09:31:46 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-backgrounds: upgrade 3.36.0 -> 3.38.0
Date: Thu, 22 Jul 2021 16:31:34 +0800
Message-ID: <1626942694-5358-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gnome-backgrounds_3.36.0.bb => gnome-backgrounds_3.38.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_3.36.0.bb => gnome-backgrounds_3.38.0.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.38.0.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.38.0.bb
index 6a765bd8b6..2cb5222efa 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.38.0.bb
@@ -8,8 +8,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase allarch gettext upstream-version-is-even allarch
 
-SRC_URI[archive.md5sum] = "1330dd3895b0cf054668a7c0db1c8487"
-SRC_URI[archive.sha256sum] = "b8cb81e4cf9d085fbb23540635b492d5c124a1f8611c2aa9ac6384111d77bb0b"
+SRC_URI[archive.sha256sum] = "f7712a873a80c9a9fcf3952611effeb2d9aed23a3e8abfcda8afb15c427d1ee3"
 
 FILES_${PN} += " \
     ${datadir}/backgrounds \
-- 
2.25.1

