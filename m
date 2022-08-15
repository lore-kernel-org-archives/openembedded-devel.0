Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E919C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:32:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.13589.1660545140014959775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L1T/J6gK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545138; i=@fujitsu.com;
	bh=3YOfUv3MT982r2c09l88Yc3nYXhFXNHu+ddRcjU0Alc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L1T/J6gKkmDgnXt8pjaX6J59AJ4KD1fM4yIBtBwmz21oH4CSnM6A06If967gH34kd
	 4bhRTX+7jfdwV/0Si15CJmxtsmmmD+Wl8KIqm3DGfq6XwINVDnj9+8G2P4GnhkWZMO
	 R6XO9ZDZM2tm1mqBs2yyb4WzuXeOS51M+qZtNKDXbzCj0EBMM/+fsRIiDVHkwoijQF
	 Q/JqHGv1NtClTDxyywyNajCkMRP5rCZx042RAuPjxoTqWVLH4415P4m8/1ixc8h4mS
	 xSQA9wUULeMcMT488DToCuMQ6OmrnE1H0n325Z4iFotet0Byb8FEdWq2EKOVo3mIZW
	 PlYg4V6PD+Z4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqFv04me
  SwYUODouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPD136mgp/CFYc+LGBrYOwQ7GLk4hASeMIo
  MXXyS2YI5zqTxMU5VxghnD2MEkdeHWbpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQELiban0iBhFgFViePbF4CV8Ao4Sux5MIENxJYQUJCY8vA9WJxTwEni+N0+dhBbCK
  hmy7ytUPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsCokZM7ZBzVSTuHpuE/MERsFZSNpnIWl
  fwMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19gCyLTUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOOUYrXcHYxTVv7UO8QoycGkJMp77eLPJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvKXPgXKCRanpqRVpmTnAmIJJS3DwKInwLrgNlOYtLkjMLc5Mh0idYtTlmPm17QCzEE
  tefl6qlDhv3TOgIgGQoozSPLgRsPi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYlxdkCk9
  mXgncpldARzABHaF39zvIESWJCCmpBqaD0zLMc31nWm4+nJnuNzNg+7OdYjVe37aJWzHEfosL
  C/y623Hiylm5UjH3PytvvC0h9WbGAsFvK/VFg/9YuO1fqa75oZ5XUeHBruNmlVsi5FfHVPxa9
  ixxcpSsSxqHxH+bdT9qWi4+P1O17sSfYDZhs6W6qtOXnN6+X8Gm1TTp7iSGs6eWSd7V3OfioD
  rJuP/40qrT+2K5NLpOZNgWPqgQFlfhqTn+V5q3+RdbWqveulmcK812VHw6JHPW/0mYxoxjrw7
  3Mt46fec/u4vYSplug0kegc9eS+xt7V0+p0Qs79e5lffVo0Kvzm4zK/tVuL9d8PI3xdDKRbKz
  L8bMXl8Y8Sfz4ZO7q877VReYb1FTYinOSDTUYi4qTgQAzo+Eh2oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1660545137!59551!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3410 invoked from network); 15 Aug 2022 06:32:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:32:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D0F63100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C5257100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:32:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 6.3 -> 6.4
Date: Mon, 15 Aug 2022 14:31:53 +0800
Message-ID: <1660545115-1513-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
References: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:32:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98246

Changelog:
==========
  bump version numbers and add a news item for the 6.4 release
  display: remember text and column positions when softwrapping a line
  docs: concisely describe how the linter behaves
  docs: remove the two notices about the changed defaults
  docs: rename README.GIT to README.hacking, so it's clearer what is meant
  docs: stop mentioning the obsoleted keywords that were removed
  files: designate the root directory with a simple "/", not with "//"
  formatter: instead of leaving curses, use full_refresh() to wipe messages
  gnulib: update to its current upstream state
  help: reshuffle two shortcuts so that more help-line items are paired
  options: stop accepting -z, as --suspendable has been dropped too
  rcfile: remove five obsolete or deprecated keywords
  syntax: default: do not colorize a square or angle bracket after a URL
  syntax: perl: add missing keywords, and reduce the length of some lines
  syntax: python: mention an alternative linter in a comment
  tweaks: add a missing word to a news item
  tweaks: add a translator hint
  tweaks: improve a comment, and reshuffle two functions plus some lines
  tweaks: put each regex on separate line, to better show many keywords
  tweaks: rename a variable, to not be the same as a function name
  tweaks: rename two variables, to not contain the name of another
  tweaks: reshuffle a description and rewrap another
  tweaks: reshuffle a few lines, to group things better
  version: condense the copyright message, to not dominate the output

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_6.3.bb => nano_6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_6.3.bb => nano_6.4.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_6.3.bb b/meta-oe/recipes-support/nano/nano_6.4.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_6.3.bb
rename to meta-oe/recipes-support/nano/nano_6.4.bb
index 6d22bfc083..d499362308 100644
--- a/meta-oe/recipes-support/nano/nano_6.3.bb
+++ b/meta-oe/recipes-support/nano/nano_6.4.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687"
+SRC_URI[sha256sum] = "4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


