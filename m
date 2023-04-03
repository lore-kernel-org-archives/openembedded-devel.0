Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26004C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:09:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.66343.1680516540759704631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rm/votMD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516538; i=@fujitsu.com;
	bh=3tS7mDxwktm0r+LCWaToZd/8Q0VsbwK+470VwTv8g9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Rm/votMDnQctuL34QD8ymiqFCdrU8ZsmOGA5Y5ChyrWqWpeuZpGWaxvRREOy/1UJ7
	 YjP2AO3MfoiZYO5xKCooQCimHTNA4Pq8JHteDwIYHu21hHTJlDGwYJpp4TT0pbhhCP
	 UFBLjoDQ//lEdUYC+v5nwlSmqxXnCArOv2bH8P+xYAD7JceMAZGcup1yWu4Tsc2ZDz
	 n+yENicOKgfCThtWseUTZrVaUtmVsO2+8rVqW7HZFDyWnOLt1KQqlv3Y+vEpwXdDSq
	 e8GSWOX8BpLF9Hy5eq2Njtq/a8vc5UNbr09wCZCgz3lCzAnLFtxE5L1mleOP36nWJA
	 mmgX+WS6CPpVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXfXUq0
  Ug3uLJSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyF614yF1zjqdj3fzFbA+MS7i5GLg4hgYeM
  EnPO7GKEcC4zSaw6tp8FwtnNKHH5zkqmLkZODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787
  mEHsYUFfCR2ff3D2sXIwcECFD9/IQQkzCvgJPH7/HJWEFtCQEFiysP3YK2cAs4Sbf2tjCC2EF
  BNy6pzLBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYzYpTi8pSi3QN9ZKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMoBSieXFeqnFxXrFlbnJ
  OSl6eaklmxiBwZtSnHh7B+Py3r96hxglOZiURHkF67VShPiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwzlsElBMsSk1PrUjLzAFGEkxagoNHSYRXcQFQmre4IDG3ODMdInWKUVFKnDduCVBCACSRUZ
  oH1waL3kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnFFgNN4cnMK4Gb/gpoMRPQ4tYoDZD
  FJYkIKakGJgmemfPXHEy/qbCfxXppjK354qol7gvMmh89nJjx8U/Z7Z+x//5POrX9PKPw9Jio
  fQ5pyucfhHsxXrFw6elSmsB6Z1Z9vvAaxztWl/9pzQ5JndZnJMvJk8X1f+eWEm85vo9JRh+/P
  mKwffp739LvN33K3G/PWqBmdWh6Xq2SofWZL0ZW/x2e72ATPOuwu+r5/dMLuaes/LLX8++VE/
  IqNoVW7zN9Fm25IjYn8Ovtt48nme8+aXpeZMOdc4al287ePbDUnCX23sflXd9L2eaqxyxumPR
  rrhTv27VBLzbvtTv5cS2LEatZmhs7u9Xr4iLfQ+6v44JTJrdoZ7ebBK8vXbl/SvXFTeaKjDkt
  XbzJJycrsRRnJBpqMRcVJwIAJ0tZ7FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1680516538!1424406!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31371 invoked from network); 3 Apr 2023 10:08:58 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:08:58 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D1CD0162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:57 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C55797C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:08:56 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.3.1 -> 3.0.0
Date: Mon, 3 Apr 2023 18:08:10 +0800
Message-ID: <1680516490-31075-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
References: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Drop support for Python 3.6.
    watchdog is now PEP 561 compatible, and tested with mypy
    Fix missing > in FileSystemEvent.__repr__() (#980)
    [ci] Lots of improvements
    [inotify] Return from InotifyEmitter.queue_events() if not launched when thread is inactive (#963)
    [tests] Stability improvements
    [utils] Remove handling of threading.Event.isSet spelling (#962)
    [watchmedo] Fixed tricks YAML generation (#965)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.3.1.bb => python3-watchdog_3.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.3.1.bb => python3-watchdog_3.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb b/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
index b927de41e..bcd64892a 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d9f9ed26ed22a9d331820a8432c3680707ea8b54121ddcc9dc7d9f2ceeb36906"
+SRC_URI[sha256sum] = "4d98a320595da7a7c5a18fc48cb633c2e73cda78f93cac2ef42d42bf609a33f9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


