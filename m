Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B336C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:40:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.8967.1648460416217704550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AkMFmChM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460414; i=@fujitsu.com;
	bh=bWqMrlDnktDaJP10o67+qZBlSG49jovR0MTpRnWIHY8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AkMFmChMiRcVNdEcA3agMX9gN25rNTg3edzwWir4/sIuEF9FK7q3nAGq2ux9+vdGt
	 aQCblOIt3TcFyqhvAm044XwS+BB0y3ecdbeG9TXawVl2rbdm9dy/Vicwq7pH/UNPYm
	 Kcrcy2Zl3hpah1a907mbb4bZ+gsyrH4fPeIYdVi061FWisoyoDH3Hl9IVBhcQhO0V4
	 oWuqdl8KqAOl3YLOm7dVEw8dDevW1eu7lI1+bNPb+3ndJmozLnfZH45cKoPDIdRwXG
	 z1A8VcBNdFX0SjFGSaqCGGCgp887Gzpe06vgnLE4Gi3b5TaiE9xNY0p+xuloHgnhIr
	 +78g0dGBMRGLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbe2yTH
  J4OYOM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3vA2sBU/YK/63GjUw/mbrYuTkEBJ4wigx
  411SFyMXkH2BSeLgwqvMEM4eRokJjU/AqtgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWcJQ4OvMBWA2LgKrEr7YeMJtXwEli+r25TCC2hICCxJSH78F6OQWcJbofvGGHuMJJ4vCJu1
  D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPaoGaqSVw9t4l5AqPgLCTts5C0L2BkWsV
  olVSUmZ5RkpuYmaNraGCga2hoqmtsqWtqpJdYpZuol1qqW55aXKIL5JYX66UWF+sVV+Ym56To
  5aWWbGIEhnBKsbrJDsbulT/1DjFKcjApifIaZTomCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgr
  WgAygkWpaanVqRl5gDjCSYtwcGjJMI7oQYozVtckJhbnJkOkTrFqCglznsKpE8AJJFRmgfXBo
  vhS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEec0agabwZOaVwE1/BbSYCWjx2ne2IItLEhF
  SUg1Mvc8LF39qZBPcqCxaIPfWdIJe8HaFI+lbAoqNFoZYMkV3K33kXCF1kfV/g2jt63WdWnLv
  H/5r+DGXx6f46Rzfm56HTBTdy3c6Rormz22e/3xL1Y93PDE/Z1jqHZUzrbZY8WrbVfFV8QuvW
  q1h7Yvjjros67eb/3fGnRlMBg9C/7j9ytu7YeJJ02mX5y6Qkw/5Ovde+oR0o5DKrCWsAjcVls
  y5UaTisfnZdrsvOgmbMuYEh2usOrN45sx9vTOi3wnO2yM1rYbP/ILXoe6ojavYnGtaW7+ra21
  kWSe1RPunRNJ6y/t9fypNou7O3nyAZX+GX3amR9TlupKu7GXsc+vynAXvCggvkXwhFc13/76+
  EktxRqKhFnNRcSIAgnAO9FwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-571.messagelabs.com!1648460413!24377!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31711 invoked from network); 28 Mar 2022 09:40:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-25.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:40:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7F13D10044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 712E910033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:40:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.10 -> 0.1.11
Date: Mon, 28 Mar 2022 17:39:40 +0800
Message-ID: <1648460382-15591-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96228

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.10.bb => libjcat_0.1.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.10.bb => libjcat_0.1.11.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
index 7422e28876..bd17e44cd0 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "edaf36b285497364bef8bf916ffe5b962d01c4b8"
+SRCREV = "ffa0b5a9a49a7880e9ab3ae3b061080f15e95e15"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.25.1


