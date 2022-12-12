Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91810C04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:39:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.37738.1670830748398984620
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GeDBmxZi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830751; i=@fujitsu.com;
	bh=kUmZwE18ANoMLRve0JzavAnOYFoQau+cwcgjFD1CgDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GeDBmxZiqwman9s/kmsZcKIJhdSk/RjFNX2PyOOLzXBArJDQXpBqHP5qGsO8ElL2t
	 dL3tpmJN0uF284HGaniBcPNZE317VCOWCABFNkqZgqa+qS/05IlPRNlmvi6DgPZTvA
	 9LXPjbq1R1r2ZDrxVsAscved0QYAuDkSijjVkPFTikLJ7ePPlCb2dG7S90iMdYtRRA
	 nScx7LXIqC37VzLiylvaoJ4wHRW9yYWe0hIllGOwDNT8Cyx3CPuZhNKl8Ns5CRG3ld
	 gWRj3tqrRUvm6A7Pt9+nySrW29aNah+pEnU+sP7V0NUILceC6dDwvTqNQoVTdvwOHV
	 cgJh4HyiGSJhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpDvv1rR
  kgwlPTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owpb2+wFWzirrixYjZ7A+Nqri5GLg4hgYeM
  EscOtTNBOFeYJP6dfMYC4exhlGj/9grI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBA4ub0lYwgNouAqsT9s2eZQGxeAUeJmxMbwGwJAQWJKQ/fg/VyCjhJPGz+BdYrBFTzfW
  YTC0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2qJlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6ZrrJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm9KccLPHYwbl/3RO8QoycGkJMpbeWVashBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  oM3gXKCRanpqRVpmTnAWIJJS3DwKInwqgDjSYi3uCAxtzgzHSJ1ilFRSpxXGKRPACSRUZoH1w
  aL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl5QcbzZOaVwE1/BbSYCWhx1MupIItLEhF
  SUg1MXCb8LM1X5U2b/4Tf0bx2/4Tym+TalibLG+2tbxNey/4/MG+d67EDk98kv1AtvqRbs7fN
  ulz1otAiFymmJ2H570rSVszwZtBvWNpssaqkNfbY/u832bP/nDr6v7/+wzHhJTZ65sebm9fcc
  34g0/+s1/7hw9bHTrx/k7tNN4Vd1fh6K1w0htPGcmstQ/neR+7uAtbhclEntl6tlL/1r/LfwR
  lcFi+lNvfl5Yl2LD57xaVV8am4U5rIgyNlwlFyR19uuNS9uT21n61IXiDlgpqCenyL4OWqDVO
  82XdUFGZztXXMuG33ZFqEwJ2rn1Y9k793bv7s/l6Pgjtrspaoiq+7bByy11r27923b3znKvxX
  YinOSDTUYi4qTgQA01+lLFoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1670830750!205078!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9823 invoked from network); 12 Dec 2022 07:39:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:39:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 550541AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4A0E81AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:39:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.165.1 -> 2.4.166
Date: Mon, 12 Dec 2022 15:38:35 +0800
Message-ID: <1670830717-3138-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
References: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100052

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New
----
- Basic support for listing, enabling and disabling decaying models.
- [tests] Test for local tags.

Changes
--------
- [types] added azure-application-id.

Fix
-----
- [describetypes] updated with the latest output from MISP.
- [types] added missing type value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.165.1.bb => python3-pymisp_2.4.166.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.165.1.bb => python3-pymisp_2.4.166.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb
index b5efdd969..0efcea0b6 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "661bf6ad14bea56fbf59d1289ccaf061c2205ffb"
+SRCREV = "24c52813876dd88a92b9fcc4b6c2cd259d80d733"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


