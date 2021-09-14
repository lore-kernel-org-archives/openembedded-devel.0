Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.2529.1631674287920429749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 19:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tVwxdfGL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631674285; i=@fujitsu.com;
	bh=d586FxVCuCkha+3SZZ2rnqgantZ3D0Gkbl3Ic+CuHvo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tVwxdfGLLpb/j0hmQtl5lV69jUFxug753rjCf8guV33Y99kep59Qmheb3jYUREVJa
	 EB96ed6+SSXgFfMb4S80nlc1TC5+JLgQxeLFBPeC9zinXnkJe0fMqk5eHNUCVDwhk9
	 0uXTE7K4tbzp3M8lWL7nTOzdoZPCEzCtH8ZdXqTKee1nizO/Dqve/1Vv0PVx8ATKTa
	 ZJw/BSMnar4dxbytZ8hfGQibzMWgZ+Nlwon0yxLCsyaPhfRUfIAXMlYSA/RPSa1ET8
	 OrhpS/UkX9eyxOigeUD40ydSEkYWuMZAPho5NkVrxNWDYujXkhYKpetFk6lonfI0Fn
	 I0E0QD5NJZJfQ==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 4D/DB-32481-DAF51416; Wed, 15 Sep 2021 02:51:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0V0T75h
  ocGShjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHq426WgllcFSeffmduYJzF2cXIxSEkMJtJ
  4tH8o4wQzh5GiT3914AcTg42AV2Jc4/XsoPYIgL6Ektn72EGsYUF7CV2th4Hi7MIqEqc27STD
  cTmFfCQ+H3+DROILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRIqkoMz2jJDcxM0fX0MBA19DQWNdQ19RQL7FKN1EvtVQ3OTWvpCg
  RKKmXWF6sV1yZm5yTopeXWrKJERhGKYWMxjsYD77+oHeIUZKDSUmU1yfYMVGILyk/pTIjsTgj
  vqg0J7X4EKMMB4eSBK9eHFBOsCg1PbUiLTMHGNIwaQkOHiURXi2QNG9xQWJucWY6ROoUo6KUO
  O8FkIQASCKjNA+uDRZHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8z4HmcKTmVcCN/0V0G
  ImoMVH9juALC5JREhJNTBNnuA774CH1ga9W1JTtk5/1qpQk3Pn4jKR6xNSbJdO1ZhzJ8J5a93
  Obe+UPqxlvJQdnHXT74y7xtc5O707HniKzQxOWrBnx5xKIWPLrdVVp3adXtnRNqeiMsH7+cpn
  Njk/pxk/TGsM7Y6fsp+5V/fYkSUXshLuntUsqG3r339ckld8XXhLiZBzh6/qJ7v5D+xcVukqn
  lrCVWflsaY82S//o+Kd8Jr4KTbc9erinrEfhCQWP6js3Xrf/GHG9r2KzY2eTcksyl0mvh9veX
  ur/TDqNn6SM+X24ZUf477ZqsRYTM1XF6j+k593c7U65/cLa+vf1H2xeSOxLe1+uMqJSg45cw+
  eFM2C4Ie72Mw6FyqxFGckGmoxFxUnAgB6ZDX+HgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-226.messagelabs.com!1631674284!24035!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16555 invoked from network); 15 Sep 2021 02:51:24 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Sep 2021 02:51:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18F2pOrN001472
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 03:51:24 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 03:51:23 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.1.9 -> 1.1.16
Date: Tue, 14 Sep 2021 08:01:55 +0800
Message-ID: <1631577715-67557-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../zchunk/{zchunk_1.1.9.bb => zchunk_1.1.16.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.9.bb => zchunk_1.1.16.bb} (64%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb b/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
similarity index 64%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
index 9ac205afe2..59a0dfff2f 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.9.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 AUTHOR = "Jonathan Dieter"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "fe3e3af49fd30b68c21a9fcaac340ad8e7f91055"
+SRCREV = "ff34ee911f7d78d66b97894a773276babd63144c"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.25.1

