Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B4CC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:01:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.48664.1681718482475302227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UMe9mR89;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718480; i=@fujitsu.com;
	bh=V7htNflb82qx54jm5iw6dFPsdFh7jKUmVfeHX6DK0Nk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UMe9mR89SFBIvJDz9KCoVsT9gxd4j5IRv5sZgFAxtXj8IXCi9zYWUDgVQbp8Ahp6/
	 XlCuErM5srvPcEpjSC55sb5NZuUWUsgfPIHAdU3+a7qkQMGcyo+ZYmYaLiKqD0AwZe
	 Z73pSGO/kmg6CRId8NOZymrCW39hbHfu0WCh3HaGCmvVZiWk/8Cezlyq2xYu820vDX
	 eZPR/ODLCC0agxMXp2PtUmxZfO1acZkVZn9As2Nldbq3VBy3apgpi316rJ21a4c0J6
	 F/FHi8Bo6M6PDe9uzr/SltrAiBG0pdQwMDCEo1ex2bhBeHzo2ondpNzsLDSIDKMonw
	 Ek0O04tj1wlow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8OxWff8H5s
  Ug49N1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRu1sYC/bzVsyfuZu9gfEDdxcjF4eQwENG
  iZOP97BCOFeZJDY/nM8O4exllLiz/TFzFyMnB5uAlMSN+//ZQGwRAX2JpbP3gMWZBVQkXvzuY
  QexhQU8JQ4s+AJmswioSpw/9JMJxOYVcJK42rIFrFdCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFuobGeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgQGZUpwwYwfjr76/
  eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4H350yZFSLAoNT21Ii0zBxgdM
  GkJDh4lEV7jZ0Bp3uKCxNzizHSI1ClGRSlxXlZgTAkJgCQySvPg2mAReYlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMO8+kO08mXklcNNfAS1mAlospwS2uCQRISXVwLRLasqHGkP2vVOq2vL
  +x9fdqU+4LbaARZdl2YuoVcdP1E4SDvHRkvbcHrtSjFXNRjpYyv6+5E4hi+mZgeUPWNX2frmr
  fzHq5aH8u+kKZl5CU8xsSv4fUVg9z3qfzvSd/QGLLiYa87f9NKmVPWr7i6/qYc534fulbzgnn
  BRplNo0f07hEx8f95OH1Kfd9XseUnniv+ulQ+ULnnaxfJE4NnfLNVdBO3mTqBXP45zLlyRdDl
  aRcJlnfzQmh2n5my2s6ycd89882UbR+8J7VU7RWs7IJXr3VngETvwzJSUjvC3rQuH+SInL8sK
  hzZzRaj97cwX6TeQ+Bkx5Wea33fnvbeumbTe/hdWqMO9+p6a6X4mlOCPRUIu5qDgRAAJQKFND
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-745.messagelabs.com!1681718479!219175!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30496 invoked from network); 17 Apr 2023 08:01:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-31.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:01:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4D77A153
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 09:01:19 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 417ED151
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 09:01:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:01:17 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpdump: upgrade 4.99.3 -> 4.99.4
Date: Mon, 17 Apr 2023 16:01:03 +0800
Message-ID: <1681718464-19357-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102126

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Source code:
----------------
  Fix spaces before tabs in indentation.
Updated printers:
-----------------
  LSP ping: Fix "Unused value" warnings from Coverity.
  CVE-2023-1801: Fix an out-of-bounds write in the SMB printer.
  DNS: sync resource types with IANA.
  ICMPv6: Update the output to show a RPL DAO field name.
  Geneve: Fix the Geneve UDP port test.
Building and testing:
----------------------
  Require at least autoconf 2.69.
  Don't check for strftime(), as it's in C90 and beyond.
  Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.
Documentation:
-------------
  man: Document TCP flag names better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 03f1b76f9..803a9bb5f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
+SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


