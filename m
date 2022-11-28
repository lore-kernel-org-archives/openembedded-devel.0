Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E23FC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:12:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.111413.1669615960569611752
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NE09Ghrx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615958; i=@fujitsu.com;
	bh=GJlek2j5cqRnz4AZjw+MZMdo/pZGPVjvMQOu62y7/c4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NE09GhrxL66xzFfRqpx/Fg1NPaar0xF5vlFQaMZTtOnCxFWc/ffeFC9LAsD9MQaUq
	 JY1YIoAbbSEI0n7IGwZwfpbMRCslnUAqNyGO0ty6cjDRVkRf6YdAT9xp+1As62ZNWi
	 xT/fvwVnmg7+afBJBbJrpHgNOq7W9kbiqxljBNkr2oGSieGNMd3zfbupooNt4FAgWU
	 WhWWvA4N72IrnOJTc36cHb51DjcuE/6eg8o9j0muD+G0BTOSbvDcE7DOPRNlI83ZG3
	 SskZcSd+C7O0bmP6mgywa56Fh7rIQhvPazrVCFGjoZZDHrMK8/9vU0sW6GFVOg4Pjp
	 2u1+tdoa5KvRw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWTcssCX
  ZoP+UgMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHtw2nWgq08FefeNTI3MM7l7mLk4hASeMgo
  cWfGf3YI5zKTxId5l6CcPYwS21+vZ+1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBRYvb3V2A2i4CqxI1vG8F6eQWcJKa9PgvWKyGgIDHl4XuwXk4BZ4lp67eD2UJANVtXTm
  eEqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka66XVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcWqFjsY1y/7o3eIUZKDSUmUd+GlpmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzrP
  VuShQSLUtNTK9Iyc4CRBJOW4OBREuFdbA+U5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO
  85f6AiAZCijNI8uBGwqL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3G8gUnsy8ErhNr4C
  OYAI6YpNiE8gRJYkIKakGpsgPLta8rj5Nj430zm3Kav65fqV/UtX3hrb9XOss57pM6bKYvEMt
  0cJjQ2yr+r0S3U2le2L15VZciBW4y7vx4l7Bk3zLS+O2Jizfvedg96etN6tK7m5vPGxqsbbZK
  3qByZrS2tKXPx/9eT5L94mwTev/1bpi6zd223f+6H6pnnjf6p5wc/MvtsK3Ol9WsBcdVYzWn7
  RHTlKATSux+Uz/xePBr58q3cy6lGYWHlx8ZnnRcknRN49uPDnlc3zJk8+bJH6uPmc6de4jLgX
  3z6552Y4v7x3knXzFtFLw2mSxnDn9Ze0z7142NJkiOkly884lVc8Pmj7z3XRjX9mFw3tOX1vX
  3fNroogC/8e/L9S5PO4osRRnJBpqMRcVJwIA8RgdQGUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1669615958!290375!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30964 invoked from network); 28 Nov 2022 06:12:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:12:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 041AB150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EBC6E7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:12:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-lite: upgrade 1.9.8 -> 1.9.9
Date: Mon, 28 Nov 2022 14:12:07 +0800
Message-ID: <1669615929-13134-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
References: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99798

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- SCardEstablishContext() may return SCARD_W_SECURITY_VIOLATION if refused by Polkit
- Fix SCardReleaseContext() failure on orphan handles
- Fix SCardDisconnect() on orphan handle
- pcsc-spy: log the pioSendPci & pioRecvPci SCardTransmit() parameters
- Improve the log from pcscd: log the return code in text instead of hex
- Some other minor improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_1.9.8.bb => pcsc-lite_1.9.9.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.9.8.bb => pcsc-lite_1.9.9.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
index 64c9c2a9d..fd232c1b6 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "autoconf-archive-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d063c6ca17c17fab39a85132811e155d"
-SRC_URI[sha256sum] = "502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50efe3420d1b2289"
+SRC_URI[sha256sum] = "cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a"
 
 inherit autotools systemd pkgconfig perlnative
 
-- 
2.25.1


