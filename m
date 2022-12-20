Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00640C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:13:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.48737.1671538405086372047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HTy4Bsxw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538403; i=@fujitsu.com;
	bh=2uUFNiE6qmUF5I7GZ5i08Yv8rkmtPnAhm2X3TfFTlgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HTy4Bsxw3e3gkZ/QDxd+X9eYyvXZ6x9Mm7cDq60N26coR/31xd+zazB7F5hHTPGb4
	 Jg6sZQvSs1EokcXYBIPjKsCNafbh+QpP2yWrRvQyxOKjqmXl6wc3ZL1xdvc2mTvikL
	 WImlf9hkkJnd3jvWoFownnuYwwcCJMKNjdIFKVRXnFxVVsvCW22a7m+2S19Pgb6xO/
	 kDTwLJ4qbRHn2+PFZbI8L3zS3G2h5qtIgcURWchXxprG0Gx/6vHmpNkKQvZxvZkk/R
	 klN11mre5WCwNPlZTwBoMNjvU7YMg54mk0QbIixgrmRlppHNHBV6bPuclI25jPDbBe
	 1bTOTSwXsCCGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqPto2cJ
  kg0+PzS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owXO18yFvRwVbScnsTawLiYs4uRi0NI4Amj
  xNq+PnYI5zqTxLf/B5kgnD2MEu8PTQRyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCTeNS9gRXEZhFQlTh07C6YzSvgKPGqsR+sXkJAQWLKw/dgNqeAk8TNIxcZQWwhoJotP1
  cxQtQLSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTRSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM35RilfYdjJ+W/dE7xCjJwaQkyhsWvjBZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvj
  EVAOcGi1PTUirTMHGAswaQlOHiURHh7ZgOleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzt
  u8FKhIAKQoozQPbgQsri8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubtApnCk5lXArfpFdA
  RTEBHHLo0F+SIkkSElFQDE6f7YZ3LVW4hetmC5sxPFigf8c1P+BHyX9Q9IXzKjaszVgecuywf
  0WMk2F39sGV52t+9xz2m3uoML+eq/+ueGi2UmuO6+PpSg1OtTk5z6pqZ2HNFnh4/6srmXfuY8
  Xk2+4PG1B9x1cvD1sQd3HtjWVPes1fafzUP7JfQ7+DeMU1w7tToA93xvzJf/trw8YHYkdiCu+
  Gvdzsy+Asu+PCtOEzNOOWTQbUxS+bvupzea8Z1+yo1H29vcdUtCVfKZz8/I/WWzcWrW90evj/
  CZTC9yUx8s8+k19MEZB4Zvk3tr86NmJx2iOfSoVvmN0o6uJiW1DM5fTg9JVXJYcOvJ4v8zr5d
  rhUTuTb6uMHeoturlFiKMxINtZiLihMBysYWZ2YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1671538402!368081!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4477 invoked from network); 20 Dec 2022 12:13:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:13:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9A5C210019D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8E24210019A
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:13:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libfile-slurper-perl: upgrade 0.013 -> 0.014
Date: Tue, 20 Dec 2022 20:12:41 +0800
Message-ID: <1671538363-7066-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
References: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100132

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Always return an empty file as an empty string

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...file-slurper-perl_0.013.bb => libfile-slurper-perl_0.014.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libfile/{libfile-slurper-perl_0.013.bb => libfile-slurper-perl_0.014.bb} (92%)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
similarity index 92%
rename from meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
rename to meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
index 3fa4fb17b..e29abb3e3 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
@@ -13,7 +13,7 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e2f6a4029a6a242d50054044f1fb86770b9b5cc4daeb1a967f91ffb42716a8c5"
+SRC_URI[sha256sum] = "d5a36487339888c3cd758e648160ee1d70eb4153cacbaff57846dbcefb344b0c"
 RDEPENDS:${PN} = " \
     perl-module-carp \
     perl-module-encode \
-- 
2.25.1


