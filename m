Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D8EC4727C
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.26645.1650872215467789823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mNspXZtz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872213; i=@fujitsu.com;
	bh=SVNNGBKwm/4E9QPuobtQOk16ck5f3KgvZzt60/Y3aII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mNspXZtzMxWn7nPiyHNtmE6FhixEdUcOQ5sc8udr/KgeNke22zSAntJ12DPFEOX5B
	 LJ1A75OjhoTDZ+46KTmX8ONgqXRvL46aF4hzh+zbGYcTGykGgKdmhBYkmhUj2EmXT7
	 GXLA0JJYfjVSeyYv+Xdvwbj7SY5zfixcC7HRWuCaich6xUDypFoACY1kuetUQc3WXk
	 gPpbT0w8/in4EEk+ZuWrjNbbK+yqVJ3QncFo+oBavLruJ+UmgdkvaZ9FnwDmAxJXFW
	 hFMn1+KNAO7D+pxeHbMxUHDuo0+7cfisODSB6PUxLkQ9oQPDBmm5uI2SAdsV9m4bJS
	 otr2J+4loL8wQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXeqf1q
  SwYxnjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aj3WtZCqZwV6z8vIqlgbGHq4uRk0NI4Amj
  xIWp6l2MXED2BSaJTzvvsUAk9jBKrD5QBGKzCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgseb+LTCbRUBVYl3PCSCbg4NXwEli9YlMkLCEgILElIfvwVo5BZwlHrz4wgSxykli8p
  0nYGt5BQQlTs6EsJkFJCQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2VSUWZ6RkluYmaOrqGBga6hoamusa6FmV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmD4phQzh+1g/NP7U+8QoyQHk5Io7z2TtCQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKEry7fYFygkWp6akVaZk5wFiCSUtw8CiJ8KZ7A6V5iwsSc4sz0yFSpxgVpcR57/oBJQRAEh
  mleXBtsPi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN90HaApPZl4J3PRXQIuZgBZ/qk0
  FWVySiJCSamCKaVnEsZNb5vP3Rgv7yoAFCdWT0l77Rcz5FtGh8GdL9z253b3OB9XP10VFHT3J
  8vin0fSUKXqs5zZ3uu9ct/bvma/3anXTjU6aTpmgtfutn8Knf1KTsv+vXx2a8uBYyQPTg43lG
  tdtDZLz7O5cO16Rxxwr+ml+X43D69WNDz2mSzw2fLqZa6pXWHeDzvntfaUnfvY/Ln68Pvij1M
  mp2VpZhWqrXq3ZXWZ9NCVITS8lxZJdXlc4xXlC1brSsxeSJl7XmHerlHGz2ir7nxnq7xUfS/z
  bvD7ktef7FwcfvsriLkzKlQvfrjJfNnTi3vjDPNJfyk30LynfCtaWiJA/efzqmYoJyt2hQk0S
  R4V/bK9VYinOSDTUYi4qTgQAXjg2+FoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1650872212!132569!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20708 invoked from network); 25 Apr 2022 07:36:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:36:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 77833100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 69FA010032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:36:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lapack: upgrade 3.10.0 -> 3.10.1
Date: Mon, 25 Apr 2022 15:36:16 +0800
Message-ID: <1650872176-31497-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
References: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96775

Changelog:
http://netlib.org/lapack/lapack-3.10.1.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lapack/{lapack_3.10.0.bb => lapack_3.10.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.10.0.bb => lapack_3.10.1.bb} (85%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
similarity index 85%
rename from meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
index c82761ac34..00dfb0954c 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linear Algebra PACKage"
 URL = "http://www.netlib.org/lapack"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=39902829ba0c2cbac1b0debfb75a416b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a32c99f24d097c72d1857e533b55642b"
 
 # Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
 # Enabling FORTRAN
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=39902829ba0c2cbac1b0debfb75a416b"
 
 DEPENDS = "libgfortran"
 
-SRCREV = "aa631b4b4bd13f6ae2dbab9ae9da209e1e05b0fc"
+SRCREV = "32b062a33352e05771dcc01b981ebe961bf2e42f"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


