Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C5C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:24:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.6688.1678281842266278201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SYS3Gj4q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281840; i=@fujitsu.com;
	bh=Tp/PD+UR6dThscteH0W9Rd5QinPdWfe7q2nFyIqtUc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SYS3Gj4qsn1cagtudqDf3Rg7CDS/xAKiZiLv/I2brLcWRZTEsubxYgloXn9zvkhEq
	 8uJKN0hfca9Xwb9gCtR7oeDy6mBobBdGyJs4CDplFr+5DIyhqMkZDdn4l7gyfS7dgl
	 AqD+xVhn8Gv8o3DQQlQA8cXFqI+AkY+CIUFv23QL/o+TBYCVE3/GMKcNSAerHxKb2x
	 Jkm3NglTrN2TqbsxxOwHk++iT69YUeqahNjeeSPeD5NtKJmGGQZ6TpOT4UB4I2hFIN
	 6LkkTTCPDeXjTRDVaNNNBV5SvrhfryqAZDHECM/BK64zof7DMczefJAjwnbkpnCBLT
	 EXvbqSxejtJiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSbeghyP
  FYMpLFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePBuk72gvsCFd9uvGBqYFzF18XIxSEk8IRR
  YtaiWewQzg0micNLD7JBOHsYJfZefM7YxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAh8SK13fBaliA4svOX2ECsXkFnCQWHjkDNkdCQEFiysP3YL2cAs4SM5eeZgGxhYBqbj
  adZIWoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGuml1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFDDd2MM7p+6t3iFGSg0lJlJc1hiNFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvp
  y6gnGBRanpqRVpmDjCSYNISHDxKIrx364HSvMUFibnFmekQqVOMilLivBtA+gRAEhmleXBtsO
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzvIFJ7MvBK46a+AFjMBLb6wnwVkcUkiQkq
  qgSlgW7deO//LKM6YTX5Ln92ebLrJ6a+VgYBl43OdVZqR3k+T79i+bnv/dI/56amK97KNP5p9
  uxK+dFqqm8ymTvXa4AiO6LKOiZ7LuJuOeM/h9X697OjZ4OXrP0rcvLv7wSSWwzqPvAJtk3fIb
  cx7/LZwwfydqlfE3/j3a08IU1fu+HOqu+Nq7t1nn12m86xh0Z+594vW37ku7V68Ym72ddf/zs
  o9zx6X+/SEqcbChNnPxU4LzJzaVXy9LeDFjPAm/UYL26P/mNYK7uD7FXl+O3NwYVFagkXWO61
  /Lrc/fjq6cGuHfjeLMH9F2B1h08pna1ljdHfMX6Lbnpk4Y4VJwNO1F4++jj4vOXt2opkkm6gS
  S3FGoqEWc1FxIgCJeLtOWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1678281839!460491!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15334 invoked from network); 8 Mar 2023 13:24:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:24:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AE1A61000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:59 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A232E1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:23:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] apache2: upgrade 2.4.55 -> 2.4.56
Date: Wed, 8 Mar 2023 21:23:40 +0800
Message-ID: <1678281820-25489-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
References: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-  rotatelogs: Add -T flag to allow subsequent rotated logfiles to be
   truncated without the initial logfile being truncated.

-  mod_ldap: LDAPConnectionPoolTTL should accept negative values in order to
   allow connections of any age to be reused. Up to now, a negative value
   was handled as an error when parsing the configuration file.  PR 66421.

-  mod_proxy_ajp: Report an error if the AJP backend sends an invalid number
   of headers.

-  mod_md:
   - Enabling ED25519 support and certificate transparency information when
     building with libressl v3.5.0 and newer.
   - MDChallengeDns01 can now be configured for individual domains.
   - Fixed a bug that caused the challenge
     teardown not being invoked as it should.

-  mod_http2: client resets of HTTP/2 streams led to unwanted 500 errors
   reported in access logs and error documents. The processing of the
   reset was correct, only unneccesary reporting was caused.

-  mod_proxy_uwsgi: Stricter backend HTTP response parsing/validation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
index 88cef0ef8..1ad222ace 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
+SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


