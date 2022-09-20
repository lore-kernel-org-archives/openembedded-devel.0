Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86AFC6FA90
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:12:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.7258.1663639969613268265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uMJeqqZU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639967; i=@fujitsu.com;
	bh=DY8CevqArZr3Mzb9oQ0SubXM65FpDCClio3LpdK6faA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uMJeqqZU5/jHclq8JLLVWR9dQfI3k6zxt1S4BrbYd0dOFIQFEKCTNvMXpyKIjF4Sz
	 klvUuuTQ4ewxFgf1m22DgSCqOs4Ju5BIZs4l1NnAxM5E6KEgyoBoYxiGQ1GIqCfKMl
	 qTdIvrjE9DeIulp2+dEJpBfje71HNiEL75iGZSELqW7RNP8otBd4m/cIhon0XZt1Zf
	 Mk41uUTgpAAHLloMvoZRfBOOfxC8Gni73EWW3jetJhM+Jh1mTumz4QXHYWAAZq5wzh
	 WloOsqdAEmdlx+BsXzVqsAhBCFP2E3v9+Tp72zRsTed7+awBsSKsrqsw2l13Wo5h0K
	 cRKDBuIpbB40A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWXeeoma
  ywfJHRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNluMsBRM4K3pvNbM1MHZzdDFycQgJPGSU
  +HppOksXIyeQc4VJYl6nP4S9h1Fia7cqiM0moCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sX
  YwcHMICjhJ7H+eChFkEVCVWzTkJVsIr4CRxe81VsFYJAQWJKQ/fQ8UFJU7OfMICMUZC4uCLF8
  wQNYoSsy83s0DYFRKN0w8xQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ugaGhj
  oGhqa6hqb6hpamOglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGZEqx8o4d
  jG2rfuodYpTkYFIS5eWq00gW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrL6iZLCRYlJqeWpGWm
  QOMD5i0BAePkggvmxRQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rwpCkBFAiBFGaV5cC
  NgsXqJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvuBzQFJ7MvBK4Ta+AjmACOuKGijrIESW
  JCCmpBiYe9XQn/fmm7zJ9n7qyM9S17FE4xDR1ST2brv99NZV3O6TVDpzeecvr077w+PmTF+zb
  fKP94pWN3Qe09l9TUtzIl5OQbbX84HHZnbee7fqVnH/2/6aP+4U47wc9LLzrbSW7aM/agNuF3
  n6mew8m5Jh/2qAhzrhtZULqfU5b/Txt8T98DgtX7Tn7qm7lNp4b9/dMXW+rnKfHY5N7z6o6qG
  ftVJOGSaefflpkYi/f8K9rzZN5FT33Zk2dIP6/+d2kkLnCnt0/p8090pC5te7zgdvcOrVrZ5R
  Z/HrcumLt4e2CisujvfzuRm/+ZOKy9GF92pewUrvlkyfJ+D3hu7pTj01hzra35x++P+D9icV/
  99RvwkosxRmJhlrMRcWJAJcdlO1QAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1663639966!259364!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31521 invoked from network); 20 Sep 2022 02:12:46 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:12:46 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8A4F015A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:12:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7CDC3152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:12:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:12:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.11 -> 0.1.12
Date: Tue, 20 Sep 2022 10:12:32 +0800
Message-ID: <1663639952-26988-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:12:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98872

Changelog:
==========
Bugfixes:
 - Correctly export the AliasIds in all cases
 - Install installed-test firmware.bin.ed25519
 - Predate test cert activation date by 1 day

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.11.bb => libjcat_0.1.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.11.bb => libjcat_0.1.12.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb
index bd17e44cd0..ff573ff7df 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "ffa0b5a9a49a7880e9ab3ae3b061080f15e95e15"
+SRCREV = "898b80468288bc6278b73210783ba1f7c0219c71"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.25.1


