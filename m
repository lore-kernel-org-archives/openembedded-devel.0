Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E35FC77B61
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.65778.1679548619063190730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CUnxzcHC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548617; i=@fujitsu.com;
	bh=D4Uk680f6y7sximQ/wFxS7I2aQ1rC4/ovCKvMtcDd7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CUnxzcHCoYeCT7koqTbTwdVxcw2CsPY2PhWSepxv49gZWvLRR51H72th/h595tDNi
	 3zT+lVNwoPbGr7OJqpWxMWe/qQ4UoNB/Hlz/KeBox37v3+Ebg1arPWH5lYgFs7opuG
	 VwZdLhvfkkIyPABMlgV2r4EOEKErFpXGfjxkvdETQFRplOYI7NK/I6CWNtiwfxuvyl
	 RUpxX+CZcd1giOTyUX3ejGTMfOk5w4IXTAqfEN8/gFCXFJ0TPkquEyPAaDmlJl0wSv
	 QiXPUmoaLEZVMU33RJr2P4Qen8RA4B7VCKrtQ98MgUYPBIDXRS055ooaf9WKDet2wJ
	 vMTMB+K2tOAsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffEA+k
  Ug3dzTCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxXP+IL2rgrOg/sY2xg7OTqYuTkEBJ4wChx
  639AFyMXkH2ZSeLS3SvMEM4eRokl976ygFSxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvMevgfqA4BweLgKrEj/ORIGFeASeJHVtawcolBBQkpjx8D2ZzCjhL/O69yQ5xhJPEg+
  mHmCDqBSVOznzCAjFeQuLgixdQvYoSsy83s0DYFRKNUPUSAmoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGlroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGbkqx8ocdjEv7/uodYpTkYFIS5ZUIlU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMErc
  AcoJ1iUmp5akZaZA4wimLQEB4+SCO/cg0Bp3uKCxNzizHSI1ClGRSlxXklg7AkJgCQySvPg2m
  CRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/OPaApPJl5JXDTXwEtZgJaHDdDAmRxSSJ
  CSqqBKcU/rb09/WKeGKONwqtK5j11Hzru5jfLnTU+fvS3JJdgTECK2OpWNtF9BiYtU3m+7XOU
  aX4u2+692M7p5hK/0wK3RTxv5m598+pY1eVqdudYp4KO+8Ep17gzvjtvS3uoFKy7fs/B8rzFh
  62/+vb0dz1hYXBY8Fthh377f95LDVtelRx4JvPVdW70Vof8c1bmxayNge9MmbyU2X+++Ps8qO
  VAwJryX1cSGSb6BXH6PHVpijydy5fNejPYoPefC8fWBYdV+lmjFnNZzWMw6lVJrp4cFna6iz0
  29P4U1peJS97bXGq8/VRRw6PZb+f9N99VmW7qGbdGNi98su/8xcyzK1j8d+ls33Vs5s/z3ZFK
  LMUZiYZazEXFiQA4Bv0JVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1679548616!763090!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12443 invoked from network); 23 Mar 2023 05:16:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:16:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8F0A47C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:56 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 82A1C73
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:16:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:16:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.5.2 -> 6.0
Date: Thu, 23 Mar 2023 13:16:35 +0800
Message-ID: <1679548598-20478-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
References: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101663

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Build Linux binary wheels for Python 3.11.
 Drop support for Python 2.7, 3.5, 3.6.
 Fix test deprecation warning on Python 3.11.
 Add preliminary support for Python 3.12 as of 3.12a5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-zopeinterface_5.5.2.bb => python3-zopeinterface_6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.5.2.bb => python3-zopeinterface_6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb
index 0384d46e5..264898adb 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "bfee1f3ff62143819499e348f5b8a7f3aa0259f9aca5e0ddae7391d059dce671"
+SRC_URI[sha256sum] = "aab584725afd10c710b8f1e6e208dbee2d0ad009f57d674cb9d1b3964037275d"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.34.1


