Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A3DFA3744
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.7168.1667205749786018532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uvH1yDDN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205748; i=@fujitsu.com;
	bh=JmGMFDEi2gKaGgGfzFBPBqUZSZjUM+VZ+1jdal82o+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uvH1yDDNjPYYUqPklCiWwG12J/6WFEsuJZ1o1j0V+Zm5ISwRRgJ5Wzgt7hhhLPoZW
	 bVrU1mKCwRsvlSAho07a9KpUkOPlWupL7xfFzat4fUzz5aLHQaUB75CPN3XfsarGGt
	 244Q9bNq+ny5JKqVmnmaj7P8XH6GHPNAJfBITkX+VcXHetiOhAm0o3fyItq8SnLKDr
	 TbA2BvFpgjUmZfsdQBtxzK4zS7bA2h4/sa78kO4d3/j2AKyAvihdjBHOmSyemXuAH3
	 DRaXRI4k1gW1MZYslpInNV8RaUSw6c2NNIn4LYlUxONRyFirTLs27NkyrTNwGYHhZF
	 QSxFwrooQTjwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORqFvcFZ9
  s8PCMvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH03jTGgmv8FXNntTA3MJ7l7WLk4hASeMIo
  MfXhf0YI5zqTxJdVq1kgnD2MEgs/H2DtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQE7iauLXUDCLAKqEpOb7rCA2LwCjhK7bkGUSwgoSEx5+B7M5hRwkrhw6gYTiC0EVH
  P33mlWiHpBiZMzn7BAjJeQOPjiBVSvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hiZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHBm1Ks0r6D8dOyP3qHGCU5mJREed+1xCcL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uBlbAfKCRalpqdWpGXmACMJJi3BwaMkwtvbCpTmLS5IzC3OTIdInWK05Phw6MpeZo6rV0DkzK
  9tB5iFWPLy81KlxHnLOoEaBEAaMkrz4MbBov0So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWH
  erSBX8WTmlcBtfQV0EBPQQWztcSAHlSQipKQamPwXfn+30vhlcOeDuPfH1y9Scbb8YMbT//Ht
  hvvVe8+vu7Qij4vr1+TPmsKdSpPm1jkZrr4ssPqIUMWje2fPyc391DVB63Eb176MMzP3Llppq
  VUdl53asbi6Qu3ejVYWrYLi+fkTc/JvvlJmV/3+YIr9ohXxfGrt/sfnbrBdHpZhoqQRsv9/F3
  /6Ie6WG0+rk5XdFFLqvN7Uxhs8ufaj+b1d/IlrvDnSD2exOz7u3DXJpbL00dwjf71N1lX2ijP
  fCt4cvi70+O5v77UmH89tLYkuuLnjapqS+f0z0yoDwuoXNIj6Kk7USPi43Vnb02DRX64le3bM
  tr4brOb3fJnA+dD/srvryrb6Ra0Qjb7AMFOJpTgj0VCLuag4EQCmWaNxcQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1667205747!522156!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26570 invoked from network); 31 Oct 2022 08:42:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:42:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73EDA100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6062E100192
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:42:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.12.2 -> 1.12.3
Date: Mon, 31 Oct 2022 16:42:10 +0800
Message-ID: <1667205733-3829-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
References: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99371

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========

- GH #3682: Including Any.h causes Compiler error on Visual Studio
- GH #3683: Poco::format receives empty Vector<Any>
- GH #3692: v1.12.0 and v1.12.1 Poco::Any compile problem
- GH #3723: DateTimeFormatter creates invalid ISO8601 string
- GH #3737: Poco EventImpl for Win32 breaks INFINITE wait
- GH #3744: bindImplLOB zero size (or NULL) HY104 "Invalid precision value"
- GH #3748: Poco 1.12.2 - Building DataMySQL still fails (issue #3689)
- GH #3753: Fix optional JSON support for MySQL
- GH #3763: Poco::Util::Application VxWorks main is incorrect
- GH #3769: Fixed converting/correcting pre-gregorian dates (#3723).
- GH #3795: aix system NumberFormatter.cpp build error
- GH #3805: Upgrade expat to 2.4.9
- GH #3814: Security Vulnerability identified in POCO version 1.12.2
- GH #3825: VS 2022 Net project missing ARM64 config
- GH #3834: SocketImpl::available()
- GH #3846: Upgrade bundled zlib to 1.2.13 [fixes CVE]
- GH #3847: Upgrade bundled SQLite to 3.39.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.2.bb b/meta-oe/recipes-support/poco/poco_1.12.3.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.12.2.bb
rename to meta-oe/recipes-support/poco/poco_1.12.3.bb
index 5ecc5b8dee..32c57ce978 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://run-ptest \
            "
-SRCREV = "be19dc4a2f30eb97cc9bdd7551460db11cc27353"
+SRCREV = "f1aefe34a46891b09230422bbc37465bc6d0a0d1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


