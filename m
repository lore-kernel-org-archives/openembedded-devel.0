Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B85C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:39:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.13660.1660545591604872744
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RNktibxp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545589; i=@fujitsu.com;
	bh=1LqkKqcJICVtGMTRL7Fvy+EVApxdEnO3uLhLa1v/zeg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RNktibxpoIJWvcP3X/ZZntcnWOXkLkwUQz95t0j9ZYAWUlVk+A3LZZ4Zgyg2oykEL
	 gdhH7+SHxbHOAkNJlFyHY5wnE5CASjokZ0f8loDwtJV2BJfUZTcvywtb5UNRV2t/7L
	 QpEkYpEdO4KPaf8GZELaRthpcGa2Yiz5lQFr5ux7AZCfurthAZ+sPI/NgzU0O+xiTq
	 wVKhgu20PuuQRkK7XQrMChDoHTLT83hXSKhg4O50SwkJ82TVc8056rtu5mMex40nrj
	 FD/H7tLpHR7+qE8pHyIWowyzW3ZV6ikzudUZr5gucxwwCoyFld/MN+RXS0wSpiILek
	 jCK7NrMcMAqfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWdf01c8
  kgwMnBS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozjP46xFqzir/jT8J+9gXE6bxcjJ4eQwANG
  iY2/CroYuYDsy0wS386eYoFw9jBKTOtqYASpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATmLbqe9g9SwCqhILPxwCq+EVcJTYcvIOG4gtIaAgMeXhe7A4p4CTxJzGRWwQVzhKzN
  3ynR2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWPGNqiZahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6Boamuoa6BoZmuolVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcUoxw/UdjBP7fuodYpTkYFIS5b128WeSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQne0udAOcGi1PTUirTMHGBEwaQlOHiURHj7XgCleYsLEnOLM9MhUqcYjTk+HLqyl5nj6h
  UgKcSSl5+XKiXOW/cMqFQApDSjNA9uECzSLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n0
  AspAnM68Ebt8roFOYgE7Ru/sd5JSSRISUVANTKq+eRGalAZ+9hkNF67w1E1rnfe16Zzjp92GP
  He58c4yeyARc/LPhgHzsovjyQlcdL+3egORVXK8sHj5ztLnY6fP81s24xfeS2rWEtD9zdj3ma
  zZ9qusrdtRdznyrxeYnbvrz6t68lbEWa9z+z2fx6mM55cdsO3QjHdySBLYcWiGymKlhU9u6JX
  3SP/zvPX0l/btByNay5r1vZh7Tx5S6rO7LkW8bpNPfx31cpu3+Uzvu48d7dk+CQvp7JuhcNmv
  XkT+xJIHj0eyZ6xn4GhX/aXPc1n3ka5Lu9iPhVauP9v/4wvzrO47+OPpH0jFO35ip67ZktxOT
  2OHaR3MuLug6sl2Ps7yLT7LPJtbSQYmlOCPRUIu5qDgRAChYNvBvAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1660545589!826201!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29896 invoked from network); 15 Aug 2022 06:39:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:39:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E84D075
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DB8DB73
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:39:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.12.1 -> 1.12.2
Date: Mon, 15 Aug 2022 14:39:21 +0800
Message-ID: <1660545563-1580-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
References: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98251

Changelog:
=========
- GH #3460 fix(Platform): LoongArch support
- GH #3688 Linking Crypto-testrunner fails
- GH #3693 VS2022 compilation issues
- GH #3698 SIGABRT in OSSL_PROVIDER_unload with static OpenSSL3
- GH #3699 POSIX Event state need not be atomic
- GH #3700 Release script must include build_vs170.cmd
- GH #3708 wakeup fd is never read
- GH #3711 lowercase winsock2 and iphlpapi to allow cross compile
- GH #3716 Compiling with clang_cl_x64_x64 on Visual Studio 2022 failed
- GH #3717 Only support extracting JSON fields when the SDK supports it
- GH #3719 PocoNet Project File does not support Visual Studio 2022
- GH #3720 Update max MSVC version information
- GH #3721 fails to build with Visual Studio projects
- GH #3722 Added missing Crypto Header to ProGen source
- GH #3724 Crypto: Progen again to add new files and bring back ARM64 configuration
- GH #3727 Add how to install using Conan section on README
- GH #3733 Poco::format and C++20
- GH #3734 g++ C++20 warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/poco/{poco_1.12.1.bb => poco_1.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.12.1.bb => poco_1.12.2.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.1.bb b/meta-oe/recipes-support/poco/poco_1.12.2.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.12.1.bb
rename to meta-oe/recipes-support/poco/poco_1.12.2.bb
index daf9ec00b6..5ecc5b8dee 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://run-ptest \
            "
-SRCREV = "92fac970d4b6161fd58335bfe1492689ba5a80a3"
+SRCREV = "be19dc4a2f30eb97cc9bdd7551460db11cc27353"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


