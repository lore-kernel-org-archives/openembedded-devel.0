Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3A6C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:40:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.16441.1666593649288439962
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VHgRkfaK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593647; i=@fujitsu.com;
	bh=GAG7JT2NGQKsLgvt7nUaJ67+RxfpXqdUv1NzVVQnsf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VHgRkfaKoRIHIIO79CWqWXBkBJomzQLrbgYToFIbHzp+KvZuUDz1tJuVBjPIJshGB
	 TBJSvf2pjBxdcNIwZo66hBwFAk3MTik5c5wpYotLwAsRSz4kIxnAPtcF/JftF8KI+Y
	 Ld9ugwEj2ikg0fx6j3lnWK1PcoumbH7pWWr/t0VtFGnHyB0/n01QHIuo74MS6JABA9
	 ZPIfTrbQe3PhlnNCo4V8Zfp50EQJG1MGQajc+qdCQUko4ldYIb0yZUoAL2yYW3G9n+
	 0ps0EsoMMxTTT594KlQD39q5h/FVWnnxEIY6sbGjgwQ1gkI/C+QmFTQvx/wib1gnF9
	 Eh4Q+q+Nix8Og==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWTfPOCz
  Z4PVaZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePr5CVsBdt5KqbOuszYwLiDu4uRi0NI4CGj
  xL2fm1kgnMtMEndbv7BBOHsYJRouzAFyODnYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8JeYeeweYxcjBweLgKrExRlFICavgJPExAYZkAoJAQWJKQ/fg3XyCghKnJz5hAViioTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQvTi0qSy3SNTTSSyr
  KTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDMaU4uS7Oxg7
  l//RO8QoycGkJMrLIB6WLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt0YLKCdYlJqeWpGWmQOMD
  Ji0BAePkghvghFQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rx8IEUCIEUZpXlwI2BReo
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9sA6ApPJl5JXCbXgEdwQR0xKUVQSBHlCQipKQ
  amOT7/v66Z7OFl8ltIdOy/qnsx5flJOvPtzh3d3Mvz/O3jWqZiQd0hAV7ZmaLfJAvCT85n/lq
  gOzUOw/tpwkHW386/yDZ7J/c/0IpB3XRKzkVS7fJyb9LmyYraVegXuXsqDvt6Le6Y9PFPxmms
  nqkXs+4HLPgvZb4/bOb3f6rqM6O5l+xTYAnT2lCYeVMw8P77Wx1i9J2mUw76vtqyf1vmxcXnZ
  ryPVyTsexbUdUPgXM2eeVXs8pX9/Y5rdzya8q/IAF5u4wjb6Z1XyqX/yl6YkPm3NoA984fyW8
  /CLXbP9s01Xc+A7cKbwrnuffs9W0/t3FEtKoV5TM0GrC9Mnl4UfBe1e75Z9c7TOS1erV/vxJL
  cUaioRZzUXEiACc5ZZ5NAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1666593646!196188!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9197 invoked from network); 24 Oct 2022 06:40:46 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:40:46 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 14781142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:40:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 07D097B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:40:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:40:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portalocker: upgrade 2.5.1 -> 2.6.0
Date: Mon, 24 Oct 2022 14:40:27 +0800
Message-ID: <1666593628-28701-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99273

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: updated to BSD-3-Clause

Changelog:
==========
Added fileno() support. Fixes #80 on posix systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-portalocker_2.5.1.bb => python3-portalocker_2.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.5.1.bb => python3-portalocker_2.6.0.bb} (59%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb
similarity index 59%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb
index 55037d1ebd..1762ae3a5e 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Cross-platform locking library"
 DESCRIPTION = "Portalocker is a library to provide an easy API to file locking"
-LICENSE = "PSF-2.0"
+LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9273424c73af966635d66eb53487e14"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "ae8e9cc2660da04bf41fa1a0eef7e300bb5e4a5869adfb1a6d8551632b559b2b"
+SRC_URI[sha256sum] = "964f6830fb42a74b5d32bce99ed37d8308c1d7d44ddf18f3dd89f4680de97b39"
 
 inherit pypi setuptools3
 
-- 
2.25.1


