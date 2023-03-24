Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC24C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:26:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.89842.1679617580324216380
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XQ56zl6c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617582; i=@fujitsu.com;
	bh=yURG8nTUe1fZnIXa3ZCcVTIgt5Jog9WndE/lx+sKJ+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XQ56zl6ctpQqmgNB6+aBkw+cdFHb5xznfyUyPn0G8m2nljd2gHmK8YvKZ9A8bcOwa
	 Z5+pOnCPjLnmRz/8abBY64wtrXAqpIK7T2BlrCDZqkPz/HyJ143sVYcOVdDbvjduOu
	 B4dZoDsavS+cMaJhfhvM2e/TVBlDPz2OokaVrO9R45YRKRgKXo3DhDdJq7CYSiGI/+
	 mAaAItKLTEYaxS1MNAZI28pqqnSkbrkY4ejtae6Ti4fl5chrUwVW6erlHPbN4H2odF
	 0kjVOimmnKoWW3mrg4PBF9hUvAFqOu6emoQWFxN+1xk3iwBQABadxztpiy/fEJeQlv
	 ooio3y2L8xdrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqKv7Tib
  FYN4ZeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePg5aqCtzwVp+Z8ZmxgfM/dxcjFISTwhFHi
  ccdiFgjnOpPE0pVP2bsYOYGcPYwSC765gthsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N0DV
  i8sECyx4EE/C4jNIqAqcebFciYQm1fASeLkwV+MILaEgILElIfvwXo5BZwlrjTPA6rhANrlJH
  HncDpEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRvPi1KKy1CJdQwO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzA0E0pTpy/g/Fy31+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4P7+RSRESLEpNT61Iy8wBxhFMWoKDR0mE99BZoDRvcUFibnFmOkTqFKOilDjvY5A+AZBERm
  keXBssdi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubd8xpoCk9mXgnc9FdAi5mAFjvXgC0
  uSURISTUwhV1T4q1oDrX4PeHDhKVx13w+l9de70yas+UXw08xU0EWtamBixZq209++rj8IWvu
  xdzL20rXtCw8wC/6unGJab9FantzpEPhvAk/RDX1foramGmuKNpbnuxz8pCvfEJyWt5W31U8M
  w/5cB4s3b/TIiXRz8qLr5nxL7NWqmHeBuGE4kvakpd2NUsW3FPJ3zErVSlZmyn2cV3ui96Xd1
  d88uzLNO9eub++7o/bk9x8Ae8tzKGzu3uS+6xyxJ+XnU28uDHy/2WNzzuF108XVW6a8EzB65q
  vr13TE+vU7EgNec3AgmURKlIBx999m/L85YusT3ceJso+TFxsdfoBo9FmMZHDSpPerrF8dzm1
  m0OJpTgj0VCLuag4EQAp5xpDWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1679617581!252970!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31377 invoked from network); 24 Mar 2023 00:26:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:26:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E018D10019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:20 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D46BA10019E
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:26:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcompress-raw-lzma-perl: upgrade 2.201 -> 2.204
Date: Fri, 24 Mar 2023 08:25:34 +0800
Message-ID: <1679617536-27169-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
References: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101675

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Use GIMME_V instead of GIMME
      54e3c1e18b61f0892056925240bbc80f76e2f038

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-lzma-perl_2.201.bb => libcompress-raw-lzma-perl_2.204.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.201.bb => libcompress-raw-lzma-perl_2.204.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb
index a9a5570d39..c4b6a4bb79 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.201.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.204.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8f4f1603d6e92a381ce2f595ab3cafd5"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d3663edc094aced6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ccefd0c0379fae599e2f24570d51cdd8135c161519f7931f0b6cfcf0366094f1"
+SRC_URI[sha256sum] = "b226d0648da3e7309387cd8d9cf629353593fd08bac29533f2559659ef7aac1a"
 
 DEPENDS += "xz"
 
-- 
2.34.1


