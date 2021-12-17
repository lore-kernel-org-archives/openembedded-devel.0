Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55FDC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:50:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.1708.1639709410935306753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vFJ3X+VS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639709409; i=@fujitsu.com;
	bh=Lz5VuDuA04dn2Xd3ibD4CqC2n4Pb0SN5koTpobjxblQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vFJ3X+VSwsXVFH8rTDbyKNVMXCxEef3mt1MC1S4ugBaOhc2obEW0okCAjS1MZZpG8
	 2IpFjMHr5RNO4dXYmm51qRFcZgtN17n8ZqFojiOUUJlBQ/D2SHngT9p3SOEXUPccQ/
	 w4ggGmwXzrvEbgDVaaJnFp/P3Q7+rbdY5O7zXuXpSfR7v7gl7Qzbm1xoGgiEejphei
	 E6yzExbdJhntqC/yM7wHhaCSOiFlM0GkApCw1h8EeAkpUnjIeZuJVhnKTOmIMgxDgw
	 QJUkeNXJJ4xpdQKbfTgd4IqGHK7pIB9dqGOjcOof58tdnB067rcSRAxZ4cT1wFhdFw
	 JHx+hHoSc2oaw==
Received: from [100.115.34.181] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 55/EB-28974-0EAFBB16;
 Fri, 17 Dec 2021 02:50:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPvg1+5
  EgxVtyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bq27NZC55wV8z+FtDA+Jari5GLQ0jgCaNE
  +/pJLBDOBSaJHTN/MEI4Jxgl1l5Zy97FyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAiESOy//BIuzCKhKXH/cBVbPK+Ak8eJyJ5gtIaAgMeXhe7AaTgFniSVrLoLFhYBqmo6dYY
  GoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJ1UlJmeUZKbmJmja2hgoGtoaKprbAGkDPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDOKVYLX8H49+VP/UOMUpyMCmJ8sZf2J0oxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YK3+xtQTrAoNT21Ii0zBxhTMGkJDh4lEV6/n0Bp3uKCxNzizHSI1ClGRSlx3rUgCQGQREZpHl
  wbLI4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnfQDaApPZl4J3PRXQIuZgBaHJ4EtLkl
  ESEk1MMnIaHyoyYxbYvEhytvy/a3PruwPP4s9LXBNLlhlXlHy51O7h/VUme3n9i7b//r/Ittv
  6/7NufjuZH99VJW8QZrHPN0u1hncuvZvdqtk1ET1npH6xVZ77cyNLzHnNx/bMufmh6xnm+QWT
  TBbmSz2dnGmpL7lU4sJl4WPnZxxsOT8JaVyycOM5ge39C9nYz1R3Kv215PvJlfZyZjtAnuNHj
  3VeM/5X3lVQuL7jVe7A7+0r3j2tckq8/sZvu+r2VgaLvLdVVsYJ/HM98z3jfxHt9u6SDmk/JH
  9n8QvfOuFn6zJds/ot6vmRmxwdHdQNbdXK+ty3FtUIt0ulf6/XKbW4mP1JNlP9zcHrtppdX8T
  300lluKMREMt5qLiRAArFtK8XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1639709408!24527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24119 invoked from network); 17 Dec 2021 02:50:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Dec 2021 02:50:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 33AC21009F9
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:50:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0AD761009E9
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:50:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 17 Dec 2021 02:49:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.2.1 ->
 1.2.3
Date: Fri, 17 Dec 2021 10:49:44 +0800
Message-ID: <1639709384-38298-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639709384-38298-1-git-send-email-wangmy@fujitsu.com>
References: <1639709384-38298-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94419

License-Update: add copyright year and owner.

Changelog:
=========
  - Fix broken run_forever() functionality (#769)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cket-client_1.2.1.bb => python3-websocket-client_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.2.1.bb => python3-websocket-client_1.2.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb
index b63285319..f85657a22 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.2.3.bb
@@ -5,9 +5,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1e01b26bacfc2232046c90a330332b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e401d789b93b47e65e852f16f2907aab"
 
-SRC_URI[sha256sum] = "8dfb715d8a992f5712fff8c843adae94e22b22a99b2c5e6b0ec4a1a981cc4e0d"
+SRC_URI[sha256sum] = "1315816c0acc508997eb3ae03b9d3ff619c9d12d544c9a9b553704b1cc4f6af5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


