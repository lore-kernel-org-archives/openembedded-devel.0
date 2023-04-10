Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B0AC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:28:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.40226.1681115289573096521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oFVH89JO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115287; i=@fujitsu.com;
	bh=ZFn3Na5g1UhlDVjgvKTjvxTy3R3MYvpbQ9T5W3OdxZ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oFVH89JOt14ia9Iz8T8p3dJP+DuTEVWYC6RgWPqLYfr6ivdWwnwUpqTZ5ERxXbD+W
	 jrMZyxl4TDHAmbmnYCvFNTJbU9mIezVaSCOHeboAtKeB3vmn77dPHXKRqqEMKQaAVE
	 2PDnT3+im2fgcFIDd+lBWy0TBA4QGWOwklzvZgH0uLUlHl/Qw/caQE3JQNZ6KHkxbW
	 Or/ZhOz/Nqs/JZLsYr707rUVZTf/SRAXlzivfelNNUEwRK5r2m4o8CjTUEoIL7aISE
	 PEdDmqZz58tsP8+GNyH/Hy8DX9IdIXr62BESyUT8a+RrfkmGSrWPeiaRZksLPR1SOk
	 Ta8At26mCjaBw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqDv9hHG
  KwbQmJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqn5qCDdwVD3v3sDcwTuPqYuTiEBJ4wihx
  +MwjRgjnOpPEtImroJw9jBLv7zxh7WLk5GATkJK4cf8/G4gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEFiyYlPYDaLgKrEo/3nWEBsXgEniVU9rWD1EgIKElMevgezOQWcJZZdOwE2XwioZvlrkC
  tA6gUlTs58wgIxX0Li4IsXUL2KErMvN7NA2BUSjdMPMUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xmhWnFpWlFuka6SUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWl
  lmxiBAZvSnHypx2M63r/6h1ilORgUhLl7eIyThHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbvwA
  FBOsCg1PbUiLTMHGEkwaQkOHiUR3opjQGne4oLE3OLMdIjUKUZdjk2Hr+xlFmLJy89LlRLn7Q
  UpEgApyijNgxsBi+pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5tx0GmsKTmVcCt+kV0BF
  MQEdwuRiAHFGSiJCSamC62Nx6fm67zmoe2/RVnhv/3Exedvo5+/RDqhxsd4zn63508ha/bzVr
  1w2P3pVGefNm64ddvsYgtFs8nuNsiNNDQRf3hma5G9y3naQWsKzO+cJ57sg2fvuQpEfXdusWJ
  L9VXrt0W/y/ftc/DHaK+pu4brSH7Tzw65SMzjFty+s671VyCs1+RpZEvopJEOX43mnFxntS22
  rhBymfr5bB2SuK9x8P/vs8zevorJ2xUsIOQh9izD0O5DlcaFR3jw78+bBRwd6E/WpuXZBugrl
  kYPXlpbkfX60/rFRs1uGgNN90s9LFey9n1nVcFA92ZMoQ8LEqC81O2aB7UuPMjLMNE9f5Bzge
  CitaYnf4Ur3qDyWW4oxEQy3mouJEACIYDzZlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-745.messagelabs.com!1681115286!189109!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6156 invoked from network); 10 Apr 2023 08:28:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:28:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7EDD21001B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 734DC1001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:28:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mg: upgrade 20221112 -> 20230406
Date: Mon, 10 Apr 2023 16:27:40 +0800
Message-ID: <1681115263-24378-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
References: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102011

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 the ARGSUSED comment has been removed upstream
 version.c: updated to v 1.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mg/{mg_20221112.bb => mg_20230406.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mg/{mg_20221112.bb => mg_20230406.bb} (88%)

diff --git a/meta-oe/recipes-support/mg/mg_20221112.bb b/meta-oe/recipes-support/mg/mg_20230406.bb
similarity index 88%
rename from meta-oe/recipes-support/mg/mg_20221112.bb
rename to meta-oe/recipes-support/mg/mg_20230406.bb
index 2d0afe8a9..8d61b7f7b 100644
--- a/meta-oe/recipes-support/mg/mg_20221112.bb
+++ b/meta-oe/recipes-support/mg/mg_20230406.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://version.c;md5=43616508f42ab3fdb082c5f932bd2eb4"
+LIC_FILES_CHKSUM = "file://version.c;md5=36d8ace99e6cd003132975a9266d3f77"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "5dbacce10b4cc5fe0785840c09398fc5b19fb96a"
+SRCREV = "4e6d2de9582cfe7f0977be4ce9532e3d33c5be15"
 SRC_URI = "git://github.com/hboetes/mg;branch=master;protocol=https \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.34.1


