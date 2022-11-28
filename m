Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEDDC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:10:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.111378.1669615829964243313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i7218UBN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615828; i=@fujitsu.com;
	bh=dGGNSYIBaOfAWMPoWVMA9Qht7Ekg7k25bDLO1wm/Muk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i7218UBNcURuhjOraZECMO+HH4zdM72+DDjProzBHIbdGNLP0bXx2SGHQrQmtXd4N
	 x+D0totNvXAzhU45J9bq2IAnHLV6ZJ8zqFu6xPDXIJTw48A73el7ENjXe4Jmh2m9IP
	 lbI5iKNC+gSX5NJAJAyKtDSedz3miraxrK0ErZ4E/2l9ugDa3yZ7826QK2ePR7+bxR
	 3eusse3W7maRVQa1ZBZR9eMOnTvESQhj+MxNADnUV+b0VCFOuMY0ojcWE0BixXfaxy
	 7YATdeYksFLzpzCPYaAWLrRg5/ancDylAqR6e/Ylp1gg5RFjd/Bv+FBivQ+IVWAwqg
	 7LFnwAv3jV4Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpHs5oCX
  ZYM1cU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePxrI9sBe85KjZ+u8TWwPiPvYuRi0NI4CGj
  xIUVk5kgnMtMEhdOvWeGcPYwSsztbWTsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAQeLJs88sIDaLgKpE//pPYDavgJPE0oaJYLaEgILElIfvwXo5BZwl9jw6wQpiCwHVnH
  rcxghRLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqToXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbpGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlQJnE8mK91OJiveLK3OScFL28
  1JJNjMDgTSlW+L6DsXvpH71DjJIcTEqivAsvNSUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBd7
  9mSLCRYlJqeWpGWmQOMJJi0BAePkgjvYnugNG9xQWJucWY6ROoUoy7HpsNX9jILseTl56VKif
  M6+gMVCYAUZZTmwY2ARfUlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8gn5AU3gy80rgNr0
  COoIJ6IhNik0gR5QkIqSkGphCem6/vB5nuSJL6bfK69zs+025RZY/T/jPfc47O+5+7b+3N75M
  cN2ZuDZ0479nJtvveqdtcTk0LamzkTf2/o6Z8rEfq6Jfd8hz3Hrb/lGp9gLXjZltH83E/WOdb
  n8O8rl6et0Br7WKzpfe286auXjteqGFJ9KYPCqW9il8mV3aOmP5vaR2+5BA+/N8aU0zkv47/V
  ti0SK49OfHhIi3Si/Sqw88v7Pr9qMY5v2WPRuWlNydu+HGLAcxtz+p0pdc/k6a953rWaArX7O
  ox+/mvzWyPaua2GbtfVs8I/Obbpz83Rtij1NrPNZe6zd98PyBRjhr8xP1JZdfBDbM3VYQL7ub
  4UGCF7962Sel1Lfi0/UuKLEUZyQaajEXFScCADnZvh9lAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1669615827!290269!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16169 invoked from network); 28 Nov 2022 06:10:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:10:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 95E261AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8B4437B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:10:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mg: upgrade 20220614 -> 20221112
Date: Mon, 28 Nov 2022 14:09:45 +0800
Message-ID: <1669615786-13094-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
References: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99794

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mg/{mg_20220614.bb => mg_20221112.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mg/{mg_20220614.bb => mg_20221112.bb} (95%)

diff --git a/meta-oe/recipes-support/mg/mg_20220614.bb b/meta-oe/recipes-support/mg/mg_20221112.bb
similarity index 95%
rename from meta-oe/recipes-support/mg/mg_20220614.bb
rename to meta-oe/recipes-support/mg/mg_20221112.bb
index 01ccef512..2d0afe8a9 100644
--- a/meta-oe/recipes-support/mg/mg_20220614.bb
+++ b/meta-oe/recipes-support/mg/mg_20221112.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://version.c;md5=43616508f42ab3fdb082c5f932bd2eb4"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "ea58e622fad20622ac0b723d021baaaf5dc0eb49"
+SRCREV = "5dbacce10b4cc5fe0785840c09398fc5b19fb96a"
 SRC_URI = "git://github.com/hboetes/mg;branch=master;protocol=https \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.25.1


