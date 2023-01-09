Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC0CC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:33:06 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.64682.1673242377654274099
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wGJhefC9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673242375; i=@fujitsu.com;
	bh=u5uu2tr+IOCNCH5fznUw/ZMteQYLXm8l7+qFUnxF1EE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wGJhefC9My4cDoc9CBl3Jss0go5Y7dZW0UcOhTPzpTe5V7WOpkStXSyBL4VH7wqcW
	 y8G6dHzXLpxZb1wnqeMtVw52zSr+k/iNJeIIR8KWZ5W3sDX79t5S6Zjw1bMVysO9D8
	 3TyMBCZyKHbR02jmxkkIZq+bzBb5hSaFC9skYx/mhXzaDUfedJMWCuG4DqLp+oTrQ7
	 ZN56rNHWWp3Gi5LIGhjtoRh6QjTYlyhKeulQjDrV2whgqhc8T3RRmVgc6fUQtoaJkL
	 MMrOBJR8ViWIZUksFg0AhO7gMf98QZeQWOf5kJzk4DIVmuoGwZXtLBCSamS3XImobn
	 AqDCPY0l88lEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSZdt+e5
  kg1nLBSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyv684zF6zmqVj2awZLA+NZri5GLg4hgSeM
  ElO+PmKHcG4wSdz4MZ2li5ETyNnLKHG4xwLEZhPQkNg99TIziC0ioC+xdPYeMJtZQE3i6MufY
  LawgJXE+2s32UFsFgEViVfz5rKB2LwCLhJ7D55jArElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSby9tIcRwq6UaP3wiwXCVpO4em4T8wRG/llI2mchaV/AyLSK0bw4tagstUjX0EAvqSg
  zPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwHFOKUy7uYHyy
  7I/eIUZJDiYlUV6Oql3JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4Zy/cnSwkWJSanlqRlpkDj
  A2YtAQHj5IIr+EyoDRvcUFibnFmOkTqFKMuR/v2rgPMQix5+XmpUuK85iBFAiBFGaV5cCNgcX
  qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvxDygKTyZeSVwm14BHcEEdMSPqTtBjihJREh
  JNTD5HtliFerPfrZTvK3/Vd4EP5ULQU+Cnc91LykOOSlgmPYgzUtpxvd2h2t206dNZm//YqzT
  06Sz4+e9VUH/7yw5pbs1vrJB0WWqyXaxkqgSuU6N+cmBfis+lyzOD7V70Bq/bXXtzsNM2SvVC
  t8kCQRen3Su5pb1s8/n7lyZwPryzT85AXWr95tennSX0SlV23zzzHyhmcLx19k2JnhX8PaZ/X
  hx4O25+sZZRrcXCis/NVvgaLNIeKHuKYcTjNe2G/x+/dl6iuE5OdcFLzsnF6op8ds8Xipg99d
  LIMvGMXVb+JTqtJ2rK7fa3Xp3oPTS8b6Y+DBrs+6+/Z+qWRtetNmxSz5Yv+0Mf/zK71ma1hxK
  LMUZiYZazEXFiQDHLaCgTgMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1673242373!314839!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11864 invoked from network); 9 Jan 2023 05:32:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:32:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AFB031000FE
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jan 2023 05:32:53 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A36BC1000DC
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jan 2023 05:32:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:32:52 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] biodbc: Added a new recipe.
Date: Mon, 9 Jan 2023 13:32:42 +0800
Message-ID: <1673242362-6511-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 05:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100479

biodbc will provide you with everything you need to \
develop ODBC-compliant applications under Unix without having to pay \
royalties to other parties.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../recipes-support/libiodbc/libiodbc_3.52.15.bb   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
new file mode 100644
index 0000000..5722737
--- /dev/null
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
@@ -0,0 +1,28 @@
+SUMMARY = "iODBC driver manager maintained by OpenLink Software."
+
+DESCRIPTION = "This kit will provide you with everything you need to \
+develop ODBC-compliant applications under Unix without having to pay \
+royalties to other parties. \
+"
+
+HOMEPAGE = "http://www.iodbc.org/"
+
+LICENSE = "LGPL-2.0-only | BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
+                    file://LICENSE.BSD;md5=ff3a66a194e500df485da930da7f2c62 \
+                    "
+
+SRC_URI = "https://github.com/openlink/iODBC/archive/refs/tags/v3.52.15.tar.gz \
+           "
+S = "${WORKDIR}/iODBC-${PV}"
+SRC_URI[sha256sum] = "f6b376b6dffb4807343d6d612ed527089f99869ed91bab0bbbb47fdea5ed6ace"
+
+inherit autotools
+
+EXTRA_OECONF += " --prefix=/usr/local \
+		--with-iodbc-inidir=/etc \
+		--enable-odbc3 \
+		--enable-pthreads \
+		--disable-libodbc \
+		--disable-static \
+		"
-- 
1.8.3.1


