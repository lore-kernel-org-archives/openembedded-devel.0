Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCFFC25B0D
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:49:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.13789.1660546173454782799
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OczUwzOn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660546171; i=@fujitsu.com;
	bh=MeKgkjcQkf9XVbgUQzBeh2HwaARtHlmMu48phHNn+os=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OczUwzOnQgpaBsfksTmuEEAflsDPsUIneArex52b0Li2v5gFNn8YBzHdNOk4i+2eN
	 v6/RBxs+T/x2hOFz3hvhHxQH6l+lylP1uH1EFxKfT1PQRWQK4cak/7ey3uVPaeK9KK
	 1PPkmeDd8KEGayaouq9MGbHaACKMlN2H4B7I4wJOP2FOVQAFLi5n/ohQv4H9C7rDFp
	 I9hZnYhwda3tOtVhKgbtoeZN5YH0moxUQqEJNJ4D028lQDtfFQ6fbShtnUFgDTaGWj
	 NF7wzeFyN3nqJGcDufGVSmQLJeClRHTnEHhvSrhUlTw96m42p1tmEpmZKZ7oCnIVTn
	 l+3DEHIjxf1BA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqFv95me
  SwdOdkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLSVcZCyZwVRzevIG9gXEhZxcjF4eQwBNG
  icXHdrNAONeZJC7d+8IE4exhlHjRcYqxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9i7GDk4hAWcJY4d4wQJswioSiyff5sJxOYVcJRY9eIrC4gtIaAgMeXhe7BWTgEnia7b98BsIa
  CaDY27GSHqBSVOznzCAjFeQuLgixfMEL2KErMvN0PNqZCYMWMbG4StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xsa6huaVeYpVuol5qqW55anGJrpFeYnmxXmpx
  sV5xZW5yTopeXmrJJkZgGKcUK27ewThx5U+9Q4ySHExKorzXLv5MEuJLyk+pzEgszogvKs1JL
  T7EKMPBoSTBa/oKKCdYlJqeWpGWmQOMKZi0BAePkghv3wugNG9xQWJucWY6ROoUozHH2oYDe5
  k5Zn5tO8AsxJKXn5cqJc5r+hqoVACkNKM0D24QLNYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOd
  gVBLmLQeZwpOZVwK37xXQKUxAp+jd/Q5ySkkiQkqqgUljboul5+INV7xv9bf+q1e+X9jmMvPQ
  B62Tk/a55E1yqMn3UY4OPnZkb2uxfKnVjN2HNyaXnF7mtvv2O8lK3/8v896e5NWQ/nGAlfl64
  26JNR+2WRt817b+kro34aLigdYbZry5nZJzGL4onpDPVDtjL5D50aH6pav+F5/XddYCXOdL44
  V/3zBoFN7m/O6X+cYVkm9Cmvv1WTlaJ/wPLO28+/G6921+5WsPp21JVo183MsyMa7uQvAD6WS
  /mwbp7A0ms1gSNpxe2B0ssLovTLbNoaZxr3jHrF8HLp3kORnukalh8GGB3SVX17vJq3iX9W91
  klna9ajzyfZdBz/y2T5O3HRF7PD05qyL8asmeiuxFGckGmoxFxUnAgB19J4KcAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1660546171!60416!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12120 invoked from network); 15 Aug 2022 06:49:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:49:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1F44A100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 13831100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:49:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xdg-user-dirs: upgrade 0.17 -> 0.18
Date: Mon, 15 Aug 2022 14:49:08 +0800
Message-ID: <1660546148-1668-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
References: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:49:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98258

Changelog:
=========
 * Fixed minor leak
 * Updated translations
 * Documentation fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb} (76%)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
similarity index 76%
rename from meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
rename to meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
index 75d7f27485..84fc9e2f18 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
@@ -3,8 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "e0564ec6d838e6e41864d872a29b3575"
-SRC_URI[sha256sum] = "2a07052823788e8614925c5a19ef5b968d8db734fdee656699ea4f97d132418c"
+SRC_URI[sha256sum] = "ec6f06d7495cdba37a732039f9b5e1578bcb296576fde0da40edb2f52220df3c"
 
 inherit autotools gettext
 
-- 
2.25.1


