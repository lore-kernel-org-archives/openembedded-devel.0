Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8A6C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:30 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.8936.1678889180728780289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NsWmedDq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889182; i=@fujitsu.com;
	bh=APjuGwtqWHE5XWJ5E8oz18aWd6eKlFWWC0QE9HEfNbE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NsWmedDq04KSqyOyg8uYrqVQZVpasE/jKgCb7XZ/9Nkt/bC9U3yjhXsc7amo0wbA3
	 ctYFun8Pj0C9lH43ApdJQNHnXo2G8cgfqS7w3xNmRXv18P3F7nn8SeVJ7t2hi2lgJI
	 v3jZSylzqswYgr6XfjgSq1vZe9cBx2niKTlcFWJ6hufFN/Aoy2fnmD0XdR7V2aiLxc
	 S2nbOPx9qvsB0OlWBQ1CtTtwnw9cQjSD2EDH4kJQVMoGoH8lH974figPZWDKhVWaZ2
	 XmUY30ZVz4kxIzw4waFclrRjs+zdsjid+L/PSDmmhbF6mLyYbg4ztqTheXD4Iam2vt
	 1NuQsIvnDVgHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSffuBcE
  Ugz3vrS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxZyzexF2zkrJj5eTZbA+Nqji5GLg4hgSeM
  Emu+TGeDcK4zSew4vJ8dwtnDKLHl9RPWLkZODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787
  mEHsYUFHCRuzzsOVs8ioCqxbvZyRhCbV8BJomnWbhYQW0JAQWLKw/dgvZwCzhIvTp4GiwsB1S
  xa3MIKUS8ocXLmExaI+RISB1+8YIboVZSYfbkZak6FROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjKbFqUVlqUW6pnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgcGbUqy2awfjhL6/eocYJTmYlER5/6wRSBHiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  fvvjGCKkGBRanpqRVpmDjCSYNISHDxKIryp54HSvMUFibnFmekQqVOMilLivH9BEgIgiYzSPL
  g2WPReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuwxkO09mXgnc9FdAi5mAFvPOEwBZXJK
  IkJJqYLLSru6rrF8y+drGHtuQbLedgbl8+2U1lyV3t2aVS8c6cDy717NxTdQOq+O39l9asGlC
  QWz3zucuy5+cMz3qsK/1/Ab+fw82LA2N+qPPen3VO7nuZ/8+7w2oUvDh1xPef/Z+yumgHQ1z+
  C5ZfbdPnThp/dN1+1m/R57n2t0Xq3D65mNWgf3WyuZvmT+zXn5evnyz+/uvFSu/OG72/pLwU/
  FtRJ+7v/V+rZe1ckrXC2tfb4pamimTYvNZ+rRo6NqcT1GdL3S+L+TRurRNYbnC2nesBzqWlxj
  pp7w5sW5OT5uBFwO3Sg1PfEdbtLKP9/ZZ23h+7Vi2f94Pg5ZymTP+S703L+bb7rbALPiq8mZ5
  BnklluKMREMt5qLiRACFeMqoWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-571.messagelabs.com!1678889181!164661!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7572 invoked from network); 15 Mar 2023 14:06:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:06:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A7B031000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:21 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9B7581000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:06:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] makeself: upgrade 2.4.5 -> 2.5.0
Date: Wed, 15 Mar 2023 22:06:03 +0800
Message-ID: <1678889166-20681-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
References: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101544

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Adds improved support for NetBSD, OpenBSD
 Improved support for minimal Linux distributions such as Alpine
 Added bzip3 compression support
 Increased control over GPG signing via the GPG extra parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../makeself/{makeself_2.4.5.bb => makeself_2.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/makeself/{makeself_2.4.5.bb => makeself_2.5.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
rename to meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
index 4cfe2ecca..f94025dd0 100644
--- a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     git://github.com/megastep/${BPN}.git;protocol=https;branch=master \
 "
 
-SRCREV = "5742be6410bfad2c619fb1e98bf795e8fa0913c7"
+SRCREV = "09488c50c6bdc40aec8e3a9b23a539c5054a634c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


