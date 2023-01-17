Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADDBC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:26:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.191366.1673940411826513963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AGytGLPG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940410; i=@fujitsu.com;
	bh=rjw1BqeVub7IMVex6AYkryGtHUttM2DfHdts0tLB1S0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AGytGLPGBG07bBEzzfVpihk/oM0eHkbBbNCIUF6SJncRkrUvO/FEtpIETclrlJcYS
	 6fp1nPlx3ShsY/ohqvvIxPuSdNQugEVy05DRLioSuTkmjg926hLp8WD+FpLu8r2jX5
	 pgUHFVqx6FLDanHXim525YRL/6GRrC45WraK721shPAD91cYA8l0IQ+H4QJ/2WQFtn
	 qm+D0NALdp3z23Xc6rsyIOkO8tbcLtrw8n1b4xLTF7sgWAhtwbP1y8SIUmS34/PlCl
	 OOiA0UO22SIdlwlJGLLBe+i+EUq6MbkUJK16C15k0CEvEaKoaeKG8E1euLFpJ2rhBj
	 ebWVgo+Gp2nuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqLvT91i
  ywbQHghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bd/ytZCmZzVdx/6t/AuJyzi5GTQ0jgCaPE
  9suOXYxcQPYNJomuNUuYIZy9jBLzr75jBqliE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawgJ/Erl+vWEFsFgFViYbmLhYQm1fASeLj32NgtoSAgsSUh+/BejkFnCWa5p5jhrjCSWLZ1N
  fMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFacWlSWWqRraKaXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeX
  WrKJERi6KcVMz3cwnl32R+8QoyQHk5Io70nTY8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhPe
  QHlBItS01Mr0jJzgHEEk5bg4FES4Q23BErzFhck5hZnpkOkTjEqSonzOvoAJQRAEhmleXBtsN
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY19EbaApPZl4J3PRXQIuZgBZ7lBwFWVySiJC
  SamBqP71P8FOsjPhHoYyjsv/Zb11RcDcX1dVhsXlkfT06aWZi+9ssqeM1q//xa+7UtY6YY+31
  IHqG4SeblO4grgf+fs/XPVJREnJQ3REuJzHpgUnUgnSB+2WPGHadb/hT1TDNOuz+l5Zvk/32f
  gyT8knz+77uZtB0npkaFpWp3KFB++1P7Re8oqpy71f6/I3HtzK8e5rJ/+Sr8NGyC5+n7Fa+pR
  ElsHWeK6du3q1nTD/Ml2qfr7LYY7D6aXbA9n931HazT9r60pT/erqOQv7ZeKvqCRsdLxoGcD6
  7z7BvpeE5nTRpW8vSTbN4jGcJneCYpsCSqsqePOPJsc/tUdz/EieW+brysj/4aHHhkN+jVQxK
  LMUZiYZazEXFiQClZG/FWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1673940409!383951!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19938 invoked from network); 17 Jan 2023 07:26:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:26:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DF63F10019A
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CEB2F100195
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:26:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.6 -> 3.0.7
Date: Tue, 17 Jan 2023 15:26:18 +0800
Message-ID: <1673940378-20528-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
References: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100629

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Improved :func:'autofit' algorithm to account for the additional width of
  autofilter and table dropdowns.

* Improved :func:'autofit' take user defined column widths into account.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.6.bb => python3-xlsxwriter_3.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.6.bb => python3-xlsxwriter_3.0.7.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb
index 2b32c0f59..e73e579e3 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "2f9e5ea13343fe85486e349d4e5fdf746bb69dc7bc1dedfa9b5fae2bb48c0795"
+SRC_URI[sha256sum] = "1239958b12da12be6abf05b32f64ff162eb75fff0fdf00d901ca0f46dc0557cf"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


