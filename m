Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.4809.1626334069060859509
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eLEFP7AZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626334067; i=@fujitsu.com;
	bh=GSGncSU6ii0Jf1WGHt8W/99yvbof+6sK0qVoXTyUCI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eLEFP7AZKrBcrcmqtjS7zIG/uGqEM97eBigEKktEef8d/MzhpTOAou2C2XeBnIPye
	 7/ehlvr6yRnNGu6yvH+1hO1kQeZUyxaoa95n8nIfP0/IEX329/UNpIE4w0/1ajK82P
	 9PBsnlZ58xmtOpi5whgQcl+A6fn1wd2B+jC5ZniepfvO/tr91WRQSB7EJHWwp5vjUy
	 otS2gJ2p2y88i8uZdVbaPvgwm425AxA4tBjWI0H87wv0PwJ6de6+n19RfsiNNi8i7L
	 ZALsG0vQKdQYBgJwvOanr88KS8sWpB4WoS8yMI/PpQDU2rW2zYWbmOLxEE+2RuricE
	 jjzrDVTfbGyQQ==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 90/33-07800-273EFE06; Thu, 15 Jul 2021 07:27:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MRqlv0+H2
  CwZKLShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akdUeZC2byVuxYuYa5gfEudxcjJ4eQwDYm
  iSUfxboYuYDsk4wSp2fMZwNJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgJXHiW
  x9YPYuAqsT2Ay8YQWxeASeJtosdYHEJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvNw
  PFOYDsSokbj1MnMPLOQtIxC0nHAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWRrpGBiZ6iVW
  6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHBlVJw4MwOxlOvP+gdYpTkYFIS5d3U+j5B
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgQvxyOgnGBRanpqRVpmDjDQYdISHDxKIryP7wGleYsLE
  nOLM9MhUqcYwznerF2yiJnjLZhsu3cXSLaDyZkLDq5m5pgFJu+3HwKSD0CkEEtefl6qlDiv/U
  OgcQIg4zJK8+CWwSL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXmuQm3ky80rgbnoFdC4
  T0Lnaa96CnFuSiJCSamCaX/u1letFahHfLe+zOuKf1ltUdhXtCjFPWOLolHHp0sENzjttw+YI
  GGZwu9dtP7iuykQ6XkWoMk+PLb3ggjdTnkVEjqTqbf65/GvUlhQvs6tavHTJw2Vps7WP8P88G
  jVd4XJ94/uHi6zn74gRXney4FOo/6bu22c/BrXd6131JqVbuO8xa/bODdffFVcGpx25Wu/kGX
  2fxX37ruOHNt/Z9PF7ZWoTi9WPD9aLp6hLfcuSy0rYc67fWLma63xV6KvPVv27w6L7z4dezXq
  buOdh1zzjFMGCatbZj5jaAhNVI5/9zoyO3pOlMkkx9Juty7FZOccW6K/vMlnZbzP3g5zxz7jM
  zWqv3xrfNEtzeqnEUpyRaKjFXFScCADoar5aXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-267.messagelabs.com!1626334066!170733!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5514 invoked from network); 15 Jul 2021 07:27:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jul 2021 07:27:46 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16F7RbT2016385
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 08:27:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 15 Jul 2021 08:27:35 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] fatresize: upgrade 1.0.2 -> 1.1.0
Date: Thu, 15 Jul 2021 15:27:20 +0800
Message-ID: <1626334041-25250-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

License_Update: Update license to GPLv3

version 1.1.0:
 - drop support for libparted older than 2.4 (#16)
 - introduce `-n, --partition` to set a partition number when
   dealing with file dumps, /dev/loop and /dev/ram devices (#15)
 - ask confirmation for operations (e.g. FAT32 -> FAT16 conversion),
   add `-f, --force` option to not prompt (#13)
 - do not limit FAT32 usage on small partitions (#11)
 - update ChangeLog (#10)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fatresize/{fatresize_1.0.2.bb => fatresize_1.1.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-utils/fatresize/{fatresize_1.0.2.bb => fatresize_1.1.0.bb} (63%)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
similarity index 63%
rename from meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
rename to meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 88d495b685..32406077da 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Resize FAT partitions using libparted"
 SECTION = "console/tools"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
-SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
+SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
 
-PV = "1.0.2-11"
+PV = "1.1.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

