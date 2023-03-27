Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6F0C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:04:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.26474.1679886266658899117
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GpSL2cQc;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886265; i=@fujitsu.com;
	bh=WT9QjCozrXjVfNmtHxQdajdVx+yK8iuPMpfTNs+uKso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GpSL2cQctvi0jOY2aq7XKIpc0frBVT99fXA2KRLD7yx1fEBephc8fEFndZ2SeSvDW
	 rMookcneknvEG2VQE6GGTPyJ3KpB/RISJfUlI3evLZlNFGmYUk/3hpJk8LWvXPgKRr
	 xpPPTY7rC+HhaubsAf4sdR1nJu7iMPsjUB/+hBYNFj8dfGoRS6u153FmQY066WPt+N
	 6DggeAVkof/gIEQ9i7+CQLD73bxKQCcn7hYjB+UJ6Ef2R1Jdw5ouVk9zPzCeHlL9q1
	 piJW61QWz+bgbSWmaPOsLOGOtKyA5dXCMMzyQtB/OQmiMj8uCumeW9PRJalRDU5fYx
	 okann5z0kYhaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqLuDXTH
  F4N0cTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd0y8sBVslK+5tb2VvYJwg1sXIySEk8IRR
  4s3O4i5GLiD7OpNE2+MrrBDOHkaJgxcbWECq2ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  72LkYNDWCBaYunyepAwi4CqxMvO32CtvAJOEi9774LZEgIKElMevgdr5RRwlri+vZ8V4ggnia
  NHH7JB1AtKnJz5hAVivITEwRcvmCF6FSVmX26GmlMh0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGuiV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOCmFCse28H4r/ev3iFGSQ4mJVHeaDf5FCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  C5siilCgkWp6akVaZk5wCiCSUtw8CiJ8K75pZAixFtckJhbnJkOkTrFqCglzvsJpE8AJJFRmg
  fXBovcS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVtBpvBk5pXATX8FtJgJaPG3ArDFJYk
  IKakGJmcbPbtbHjtUVd8uPX7KROb2xStXJr0WXadxOdRWNSYltTyGyarimlzdB22zd9Pu7Yuc
  sseW55yvm61wR66kRr9Pzfq4bqGXnHIpux2FxQKftjz9NildoevEpeszeA86JrKwvN2QacL/5
  Pca1iel83eW8fy7rlnM+cend1vvkadS6Ss4mbVeJKS+LzU+tu3L/jd1p4wOJasfL/YzM1SedK
  rmSpr8maLL98UsPv1K+Mu0Sz/r9sItv1Z9WDtLO1Oe6fuqM7LfJ3Fu8TMVey7j67WDXa97+VS
  BX77Hz0TvCn10WOVmH9f391592/PMFzyNq6leb/Cf/Va50/RQ6d/6zn37b053FKhI4KzhW1s2
  UYmlOCPRUIu5qDgRAE4IUgpXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1679886264!235750!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11040 invoked from network); 27 Mar 2023 03:04:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:04:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D36421001A4
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C73711001A3
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:04:22 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server(-native): upgrade 3.46.3 -> 3.48.0
Date: Mon, 27 Mar 2023 11:03:32 +0800
Message-ID: <1679886213-20913-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101757

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes:
===========
I#276 - alarm-notify: Incorrectly handles changes in recurring events
I#453 - build: Make it possible to override C++ standard
I#454 - libedataserverui: Tweak lookout of the Trust Prompt dialog
I#231 - Release unused memory in factories after certain operations
I#445 - libedataserverui4: (almost) empty GIR/VAPI file
I#446 - IMAP: Inbox hidden in offline with "Show only subscribed folders"
I#447 - Google Task modification not synced
I#452 - CalDAV: Can fail to refresh content in some cases
M!112 - Update for removal of WebKitGTK sandbox API
M!113 - Don't accidentally disable sandbox for GTK 3 users
M!114 - OAuth2: stop trying to disable WebKit plugins
M!114 - OAuth2: use WebKitNetworkSession to manage proxy settings
evo-I#2161 - Mail: Add 'Learn as Junk' message filter action
ews-I#210 - Add option to always use HTTP/1
I#416 - LDAP: Possible memory leak in build_mods_from_contacts()
I#417 - Serialize OAuth2 token refresh for an account
I#418 - locale_supports_12_hour_format() can read uninitialized value
I#419 - IMAP: Does not forget renamed folders on the server
I#420 - LDAP: Use valid values for error paths of contact create/remove
I#421 - libedataserver: Enhance two-digit year parsing
I#427 - Tautology in e_named_parameters_equal()
I#428 - Addressbook: Fix possible read of uninitialized data
I#429 - Fix some (rarely) possible dereferences of NULL
I#431 - e-xml-utils: Enable parse of huge XML files
I#432 - Fix possible NULL-dereference in e_cal_backend_file_modify_objects()
I#435 - ECalComponentAttendee: Default CUTYPE is INDIVIDUAL
I#437 - IMAP: Excessive memory usage on folder summary download
I#438 - Trust Prompt: Add issuer's certificate fingerprint
I#439 - Fails to add task with X-EVOLUTION-GTASKS-POSITION into Google Task list
I#442 - e_util_change_uri_component: Reset default port when changing scheme
I#443 - Camel: Mail header order in malformed message matters
M!97 - desktop: Remove obsolete Bugzilla entries
M!102 - Stored values are never read
M!106 - Fix few memory leaks
M!107 - Use webkitgtk-6.0 API version
M!108 - Try harder to support webkitgtk-6.0
M!109 - EGDataSession: Make it available to the GObject introspection
M!110 - typos: success, successful
M!111 - addressbook: Add autocleanups
ews-I#208 - Prompting for password too often

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 2b74b2e60..9db5e9011 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "0938e2279e5cfbc2204766ca9d3fea570911699b07c10cbe01aca62a7e8b2bee"
-PV = "3.46.3"
+SRC_URI[archive.sha256sum] = "0f25f73331edf53909be40f412b2a86939270327517616303f322de157083c35"
+PV = "3.48.0"
-- 
2.34.1


