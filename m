Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24093CCA483
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:15:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.37575.1658211349167506250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Cf+LD7/h;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211347; i=@fujitsu.com;
	bh=gi9ob9vhraTKHCzKqMwBsKXMJhQTTfVPpD5PfuZDeYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cf+LD7/hLnnwWrnrk9KUGllI5Q9d5+zS3Oisj1fohChbmRM2baipYzv/dnjKoAbPr
	 bn1eLf+q1uIkWBG/Jl0ZEHH9zB0EQBVd5OWaKrutS1h3mA41Cvz4Y41jY5ob3THwBw
	 C9dAAJAWCyhwzUK+KH6pOhB/htGvqxImqvV+qnFScpwI7VhMOMHepwhWYS/gdmV9D2
	 srSplv0r28IW9uIoB15htSqR8XknPkKmhzXHTbKIyB9DgWqzxwPTmhA1jnLuL/+Y9i
	 zqinYwWAa+eRYwpy07ScXlsdS9+23MmUcBz8FkDVS6EAD3Xh8EulfIucP/jLM+hzG8
	 kxyVHc4XYtgjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqCvkcy3
  JYP1OI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaO5K6JgFm/FgwkP2BoY13J3MXJxCAk8YZRo
  /9vFDuFcZ5JYcbCPCcLZwygxq3M3axcjJwebgJrE9Fs3wGwRAX2JpbP3MIPYzAIqEi9+97CD2
  MIC7hJ3HzxhBLFZBFQlzi0/ywZi8wo4Stzu72IBsSUEFCSmPHwP1ssp4CTxatsfsLgQUM3iA8
  uZIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83Q82pkJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNNUlFmekZJbmJmjq6hgYGuoaEpkDbUNTbQS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzklOJUuR2MB/b90jvEKMnBpCTKO1XzWpIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd4LnkA5waLU9NSKtMwcYFTBpCU4eJREeNOcgdK8xQWJucWZ6RCpU4yWHFevXNnLzPH301
  8gOfNr2wFmIZa8/LxUKXHeQi+gBgGQhozSPLhxsMi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZy
  DUUmYtwpkCk9mXgnc1ldABzEBHTTJ6QrIQSWJCCmpBqa6p9nmsi9/9+ubhaiqsrIWLPBlN3/+
  bPZ2+ZW/q6q8f8ariWxYHqLrY37XKCppn3TIh+0LeqMYsvc4hP882cozdY+EImdBKfNzw32PG
  ++sLH/KuthBqSO788HyvUs6NXOX/FrZnBtT0N1gfilU+3DeHudsi2zeeQXMp1zmfePa63Lt5a
  s167dvuJSetORk6GLRO6Vnf7Ay73/f8tHLbfcL5v8zjfMONDYd5F76TNxJ+tnnZP17jN2X3YI
  Uf+rrHnTr/vi3T/5P4ORltn8nWr2p9jz+t+XP5P0ljZMiJe92zlV6lHhbh+nSbJ+u8HX/TB1/
  vBY8pP7ukdS13Qy7vP83HJxn6Flo9vZUeo5EsI4SS3FGoqEWc1FxIgCDTFSOdwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-745.messagelabs.com!1658211346!467866!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6264 invoked from network); 19 Jul 2022 06:15:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:15:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 404A4100195
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 34490100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:15:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] modemmanager: upgrade 1.18.8 -> 1.18.10
Date: Tue, 19 Jul 2022 14:15:26 +0800
Message-ID: <1658211328-2951-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97893

Changelog:
=========
 * Build:
   ** Require libqmi 1.30.8.

 * FCC unlock:
   ** Updated SDX55 unlock script to handle the new method introduced in
      the latest firmware releases.

 * Modem interface:
   ** Set signal quality to 0% on shutdown.
   ** Set signal quality as recent on init.

 * MBIM:
   ** Fix task completion when peeking device fails.
   ** Fix several GError double-frees.

 * mmcli:
   ** Don't print signal quality until modem is enabled.

 * Plugins:
   ** foxconn: remove carrier mapping table for T99W175.

 * Several other minor improvements and fixes.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
index 28f81ba6e5..9316cbbbc1 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV ?= "0d8b5e93fc62eb0f41e18a2d9d845331d7af36ec"
+SRCREV ?= "1338749739e0c01bdbc6ddf92388a781806ec3ac"
 
 # Patch 0001 will be in ModemManager > 1.19
 SRC_URI = " \
-- 
2.25.1


