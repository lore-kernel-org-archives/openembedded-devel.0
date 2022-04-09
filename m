Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6057DC3A5A1
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.7588.1649744997904747477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kR61+lCO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649744996; i=@fujitsu.com;
	bh=VvSK2F9Iw/wswJFCY2oR9ILeNMcRVccJ5dTn9yxqNyY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kR61+lCOMMXLfYkqamWN62BFeGFi0io2WWuZtF/oyuWb37Mjkq9gQ+7sQ/0/YOXxF
	 2GuWuVZy073Ar7AfH6vL07XozABdSrSmAjogkrxzxRwGn0SWyo0XFH5fNnKb/wOloV
	 Nz+zJtRbQjMusubES0J0yFauqisH6v5nKCVx36G4fo6ez01IZzxfzVWvjaFSRBk+u0
	 S04qHE8ztevHlzWD3LF9RO6ECsynejSP/FM0WJ7pS/gkyPuHWvenRfhDjlvk7dOshh
	 e2ZFp/HL/c/FIny91gKxEtqaeBwlL7mg0gMLmN8OXzAO+NdynYdOPxlJ4IeEKInr9o
	 MDh29+FsycDgQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxRTdZJjT
  JoHWxnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFh6lG2goPcFY0PJ7I2MG7k6mLk4hASmM0k
  cb7nKhOEs4dRYu/D30AOJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg9jCAvYSL27uB
  LNZgOJr5raxgdi8Ao4Sb48/B7MlBBQkpjx8D9bLKeAk8f/ZTrC4EFDNjG8foeoFJU7OfMICMV
  9C4uCLF8wQvYoSsy83s0DYFRKzZrUxTWDkn4WkZRaSlgWMTKsYrZKKMtMzSnITM3N0DQ0MdA0
  NTXWBpJGxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFCmFDNU72D83/tT
  7xCjJAeTkiivAU9okhBfUn5KZUZicUZ8UWlOavEhRhkODiUJXgdJoJxgUWp6akVaZg4wQmDSE
  hw8SiK8KlJAad7igsTc4sx0iNQpRkUpcV5daaCEAEgiozQPrg0WlZcYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfNWg0zhycwrgZv+CmgxE9Di0G2BIItLEhFSUg1M2vtu9lwMWsy49LK1yMP
  bF+ew73U4t3bZtLVdwU/KTVacCJ7cdX3ty8CzUY8XHfi8/M+KjDK/O6GbX68/nyLQ3uriWxbC
  PoU1V9zxueW841LTnMNnfT3C861ktXeZ2j6e2Kc7LvnrTpT0u3LT0boogL/pgfLPiwJ+3arTn
  vpsNePwYamKW+gR5loisd3tS5uh3/SAC7n9YWcEG9dvXFtR/mdx/8Wrl79dibt1knMWA9NJNr
  3Sa6ePrLrLfsHIf4+p3cTYA4+s1MLqTPIC5J7vrzd2Xjt7xgTdpSw/FU3XfD/PomkfdXPplUp
  GizVe2sw//paJuD2IVVCznBbYKcxs77t3wxrL4CYbb+ZI9rdJSizFGYmGWsxFxYkAT9bpX0UD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1649744995!38235!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27810 invoked from network); 12 Apr 2022 06:29:55 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 06:29:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23C6Tn6B005657
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:29:55 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 07:29:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lapack: upgrade 3.9.0 -> 3.10.0
Date: Sat, 9 Apr 2022 21:26:21 +0800
Message-ID: <1649510782-4563-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
References: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96561

License-Update: Copyright year updated to 2021.

Changelog:
http://netlib.org/lapack/lapack-3.10.0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lapack/{lapack_3.9.0.bb => lapack_3.10.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.9.0.bb => lapack_3.10.0.bb} (85%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
similarity index 85%
rename from meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
index a87dbf0481..c82761ac34 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linear Algebra PACKage"
 URL = "http://www.netlib.org/lapack"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=39902829ba0c2cbac1b0debfb75a416b"
 
 # Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
 # Enabling FORTRAN
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
 
 DEPENDS = "libgfortran"
 
-SRCREV = "6acc99d5f39130be7cec00fb835606042101a970"
+SRCREV = "aa631b4b4bd13f6ae2dbab9ae9da209e1e05b0fc"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


