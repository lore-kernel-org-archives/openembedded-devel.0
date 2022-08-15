Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C47C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:39:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.13675.1660545597734974391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=whSjlzVD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545596; i=@fujitsu.com;
	bh=DStCGoAed/xpZKvmpaMuMRPnIwm87oODJQefH7KH+FQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=whSjlzVDfP6NIBugVgjiQ1RU0r66gUWAgInRQnBxe+rRl0s/OUGLEK2CLIkuffXGw
	 c9zDoRX46idkaThYz7KO02V2BhovbTa5MR5597w1GRUwpmd4/uCihza9w/dOE499R8
	 2nVDBhN1DBcxd5R4NR5v8GCsJTQleeQLcXmLwRS6Z0HtGTWj0O85iPYeaD79A8pzkg
	 BfjKROhPKapdsqlpHrWGoQ11Q8b99mOBWAN7Z90R5mh1O3dxc6EQj5V1SqoNDFtDlD
	 sN4IeQVMFa9SAPgrqpbnIpkKkxlmTcrkmOahLTdV6DIL1BNDd93vaQ7qlcJC8axvaP
	 aIn5vkX5sKT6w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxSdf61c8
  kg0vHxSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyuTz+YCraIVHw7d5qtgfG0UBcjF4eQwBNG
  iXmb77JCONeZJF40f2OBcPYwSjR/2AnkcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgcfLhK7YuRg4OFgFVib+ri0HCvAKOEpfunARrlRBQkJjy8D1YK6eAk8ScxkVsILYQUM
  3cLd/ZIeoFJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ01TXUNdJLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM4JRiRqYdjMv6fuodYpTkYFIS5b128WeSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQne0udAOcGi1PTUirTMHGA0waQlOHiURHj7XgCleYsLEnOLM9MhUqcY7Tmmzv63n5ljOZ
  ic+bXtADPHpn1dB5iFWPLy81KlxHnrngG1CYC0ZZTmwQ2FRf8lRlkpYV5GBgYGIZ6C1KLczBJ
  U+VeM4hyMSsK8D0CW82TmlcDtfgV0FhPQWXp3v4OcVZKIkJJqYCr9s6HVNG6nVvTc+LZQzStu
  VodmbJUtmDAxe+fmr1K3L6ds4bxtYVnIH3j0fdJy5dUBe5gj3trMnb4z+D3PAz/F+ffenf81R
  19GyUjENuxknvWUlYEuvc2M1xWnbex3PrNYXe6iaXLokhr+Ly7uSouSFQuL4xW2z7YK5fRV45
  /HoJd15czsDaHbilpE30wo899w/rzrnPTi9/+f3V57asa7MvuA3NoP6lWtZjn2f3tf+3vlGF2
  Rnn1MJuFCx+6Fj6/3m++Jq2wof/N7q/GO8q6ePvuPAQ6qp3U7XWvt3f2EN1jl1r5o3TyhUmRO
  yEzzVzXJUybe6QtYIfP4iKVbwwuPG0JValZFZxZOiNA9qMRSnJFoqMVcVJwIAIazuxd5AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1660545595!155565!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26776 invoked from network); 15 Aug 2022 06:39:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:39:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 05D011000DC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ED512100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:39:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 14.4 -> 14.5
Date: Mon, 15 Aug 2022 14:39:23 +0800
Message-ID: <1660545563-1580-5-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98253

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_14.4.bb => postgresql_14.5.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.4.bb => postgresql_14.5.bb} (83%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 2256bccece..4a576d7172 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 07e605015fad0621c3e67133ff9330a5c6318daa Mon Sep 17 00:00:00 2001
+From 258c6bd2ad96f2c42f1cb5f4c84e4ca5865059f0 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 04ef7be..0eb595b 100644
+index ffe878e..c39799b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
similarity index 83%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
index 1daab22f92..1551d34053 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-config_info.c-not-expose-build-info.patch \
 "
 
-SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
+SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


