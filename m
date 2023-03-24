Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD55C7619A
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:26:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.90432.1679617586637752655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U9XcWeNs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617584; i=@fujitsu.com;
	bh=alFO9sLRCrNnQOfve2vRTBEJ/H0b0jkef+aFmeVkJyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U9XcWeNsEPnI7Q6QDn+g8QqYYfuT+ryt8SFmGFHudCoGYtWr6eBxFgd5AOuswxJzO
	 WbdyYNw5SCU5dMYySbBm0edC8G/KEhWlnPDF2UVIYcDytsimyZf/n0aOA3469V99JF
	 nZFjmINrg0jh0+ZF9pphRcSOMyUwB3tSPpoST/iChX4/5jnXtBqqY7Pk7UcO6Bv2Lh
	 dJla2S0ikSkTYiLYR2u3zkrGQCcvOsF0mOQEGfeAvgxC+87Ne6tXk8qHcU9hwFhUY2
	 209GvS7B7ZSSKkq87HgDt/azkCP+/e+Ed1SE8t7s3K+0nyG3uQ+b1oZ/YKzAvtZakZ
	 BkzoGbdrL/BpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8OxWVf/nUy
  KwYzbGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bn7c1sBT/lKn7e9GtgXCbdxcjJISTwkFFi
  2xvdLkYuIPsyk8TqXTtYIJw9jBLHfk5gB6liE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphgWiJCXf2sIDYLAKqEi0fzoLZvAJOEl1bVjOB2BICChJTHr4H6+UUcJa40jwPKM4BtMxJ4s
  7hdIhyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDUCPVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM25Ri5Yk7GFf0/tU7xCjJwaQkyisRKp0ixJeUn1KZkVicEV9UmpNafIhRhoNDSYL38
  xuZFCHBotT01Iq0zBxgDMGkJTh4lER4D50FSvMWFyTmFmemQ6ROMSpKifM+BukTAElklObBtc
  Hi9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd49r4Gm8GTmlcBNfwW0mAlosXMN2OKSRIS
  UVANTLsNBBaerDx5ksda43elVa7/GNmmjheEjJ4/rSzYzJeULiyzbN6NBaZKzj5/otrAYZbfO
  UOt7GcdK/1fKswYqXDxpohnmuHlKztF/jLl+/E/nWMevfBt0c6pg9hTRu2+uKS9d9uPxsVi95
  FPH+f79VFqzinnGw0q+wAXzzqbIrUq1NZSzaQ1sSGA0PGLHF5H/8HK7inD2UTPLG007je3nHr
  dlDDr64IqtwbSZHu/Wvrm16rFUzZz4CzUNhfJLL/o/uRAp/9oh93PVkjmFdkmX4jMrlkmIMVx
  4rF8vMe2wSmrG7h9HX/2oN2ON1PUovf+K+fGWnyrS9somn8/1xPPud9edudX2e5m8UaexMKsS
  S3FGoqEWc1FxIgA8+uMiVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1679617583!43922!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9206 invoked from network); 24 Mar 2023 00:26:23 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:26:23 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5FCDF150
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:23 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5382A73
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:26:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-perl] [PATCH] libcompress-raw-zlib-perl: upgrade 2.202 -> 2.204
Date: Fri, 24 Mar 2023 08:25:35 +0800
Message-ID: <1679617536-27169-4-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101676

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Update zlib sources to zlib-1.2.13
  https://github.com/pmqs/Compress-Raw-Zlib/issues/20
  eafe29c85437582d16c6bda16449ea2dea534266

* Use GIMME_V instead of the deprecated GIMME
  https://github.com/pmqs/Compress-Raw-Zlib/pull/19
  7a7b045d9d8729a6c82a78039dab5decf7e65907

License-Update:
 Copyright year updated to 2023.
 zlib version updated to 1.2.13, Copyright year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcompress-raw-zlib-perl_2.202.bb        | 47 -------------------
 .../libcompress-raw-zlib-perl_2.204.bb        | 28 +++++++++++
 2 files changed, 28 insertions(+), 47 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb
 create mode 100644 meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb
deleted file mode 100644
index 5459572e2b..0000000000
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.202.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- README
-# +++ README
-# @@ -1,4 +1,4 @@
-# -       Copyright (c) 2005-2020 Paul Marquess. All rights reserved.
-# +        Copyright (c) 2005-2022 Paul Marquess. All rights reserved.
-#            This program is free software; you can redistribute it
-#             and/or modify it under the same terms as Perl itself.
-#  
-# 
-#
-
-SUMMARY = "Perl interface to the zlib compression library."
-DESCRIPTION = "The Compress::Raw::Zlib module provides a Perl interface \
-to the zlib compression library (see 'AUTHOR' for details about where to \
-get zlib)."
-HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=9bd174bdd6fbb141c1b679e2466e0b39"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
-
-SRC_URI[sha256sum] = "96e20946eb457a32d2d7a0050b922e37b5ada41246bcdc824196d3f7c4da91b7"
-
-DEPENDS += "zlib"
-
-S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
-
-inherit cpan
-
-export BUILD_ZLIB="0"
-
-do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb
new file mode 100644
index 0000000000..e0aa2e9c25
--- /dev/null
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Perl interface to the zlib compression library."
+DESCRIPTION = "The Compress::Raw::Zlib module provides a Perl interface \
+to the zlib compression library (see 'AUTHOR' for details about where to \
+get zlib)."
+HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=45bba5fa4937353fd4f505fa2108a6bf"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "f161f4297efadbed79c8b096a75951784fc5ccd3170bd32866a19e5c6876d13f"
+
+DEPENDS += "zlib"
+
+S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
+
+inherit cpan
+
+export BUILD_ZLIB="0"
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


