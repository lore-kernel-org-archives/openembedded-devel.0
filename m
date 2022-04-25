Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EE7C38A05
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.26491.1650872530430593805
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dgrpfxN5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872528; i=@fujitsu.com;
	bh=pcYJyOWbUoedbyPrubdzvzub37y2j1WpdQBxJ/f472U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dgrpfxN5vkplT+bxM4YW4h1Ppf7XBvSRx+5aKDH/j1Y8KF/Pa3sc7KwhKYirklllf
	 2XSqi9Q5X4lkBZ4slN1Vdv/TU/2Wq0BF/yAE9I9BFHoD+5PkqKldaB8OAyttL3VzD3
	 5lFQCCMlQsZdYQaH/Ki8jGVlQ2NYXKv/a+H8h+iEwH2fOrf0EIWV9xNrzZcacfvXYj
	 iXfbYyA1Gb9XQrH2+EgAel1xJpFvyIGqrTsTuYn82+7ku+ehcULi0Nrf4PTQMw6h9O
	 Pprh3zHl0X7XWFxNV2ctuDmFUSubW+qHqKBQQWQchMHFcPvOtI+2d8r5RqTGnULtqD
	 AbeABdnMW984w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSfdCQFq
  SQfNKRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWn9PMBbe5K/6fnMbSwLiSq4uRi0NI4Amj
  xLvDPUwQzgUmiXuP1zN2MXICOXsYJbZ3S4LYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  97FyMEhLGAjsW4XP0iYRUBVYk1PN1iYV8BJ4tM6K5CwhICCxJSH78E6OQWcJZ40d7BAbHKSeH
  R/KlicV0BQ4uTMJywQ0yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNdUlFmekZJbmJmjq6hgYGuoaGprpmZrqGFmV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1
  uFivuDI3OSdFLy+1ZBMjMJBTip127WA82PdT7xCjJAeTkijvPZO0JCG+pPyUyozE4oz4otKc1
  OJDjDIcHEoSvLt9gXKCRanpqRVpmTnAqIJJS3DwKInwpnsDpXmLCxJzizPTIVKnGBWlxHm5gL
  EoJACSyCjNg2uDRfIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK87/yBpvBk5pXATX8FtJg
  JaPGn2lSQxSWJCCmpBqY+CQ7xI9b3G3d+VJjXrtOnvCTEzPTz+rBLDZ6dyxUmsx87VNx447/E
  w8nX3r/60FSjFsy/W31hme/SJWarZhjrm9+UOprspXs4937V9uOrTzkfmnrdL83K/PLWX90bG
  ZynPT8dY7vys4Ki3R+24nOfb/j5XXu4THrdbS4LXV7vIz+cnj7JFd60S+oym8mnjXk6c1IrVm
  9iTuSaFnH6xF9n8T/Lc+xvzbn7MmbutoW+dz/qPfl4+N8PN8OQNYJ1D7tDDlbszlMq8iyWebW
  q+Gl+yUIpw5aqjbMvNl4QXvEkLLC3+f67Gf8qtYsKZjeuqTmnqejSkP1NveFHQXfG5K2BWl1m
  HW6nHW7W+hjnnnikxFKckWioxVxUnAgA2E+4vl8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-532.messagelabs.com!1650872527!132607!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14964 invoked from network); 25 Apr 2022 07:42:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:42:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 88CEC100450
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7BDB610033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:41:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lsscsi: upgrade 0.31 -> 0.32
Date: Mon, 25 Apr 2022 15:41:25 +0800
Message-ID: <1650872488-31555-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
References: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96777

Changelog for released lsscsi-0.32 [20210505] [svn: r167]
  - improve NVMe device parsing (e.g. /dev/nvme0c1n2)
  - print nr_hw_queues when available for SCSI hosts
  - Remove blank line after NVMe device name with -HL
  - collect_disk_wwn_nodes: Fix WWN string copy
  - make WWN printing for NVMe more consistent with
    output from SCSI devices (e.g. with -u and -t)
  - logic to select best SCSI id (--scsi_id) to output
  - clean up warnings for gcc-10
  - build with autoconf 2.70

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} (70%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
similarity index 70%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 54faaa384b..9e6eb7b724 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[md5sum] = "efb68946f51860e8eedc18d6784afdae"
-SRC_URI[sha256sum] = "12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca"
+SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
 inherit autotools
 
-- 
2.25.1


