Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FAEC4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:38:04 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.6856.1651127875557214922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DpctN9ia;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651127873; i=@fujitsu.com;
	bh=im+U+R5Ib0fx/6o0hXvw3fJSg9dEwaYOKiYAmHDb94g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DpctN9iagNT94ak7YscsZ4bmcveaEegs22u5MJuM0j4uJ2qc3wlScBsnYvXJsK3cq
	 hczZDcu2OpVLNjc32Ap+aS8us8vbB5x2LMADJYhuRGCH4BM1EzKOnGhjSS467Gs76y
	 YGAW0CzD1f3U4fl3knN2rS1AY25hIGlb01ExKK9eDWAIEj9KsPCQ87dvRNu4MAR8UO
	 UHHR419s0t89pqAPPbwYOP8houwkP0FgJiRX5+sLOcLSRimNXdrBj+RSZV0orXz1TT
	 ZZs6MwckMYSehUHQTfUCExBfUnh4heFQqSSJOG/r5rsnub1llVzM4RjWFuvWHFcHV1
	 b/QYFBRxG3n6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSdfeLCv
  JYNktS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPNrG2MBZM4K26e+8LcwLibo4uRi0NI4Amj
  xKKdT5khnAtMEovunmKDcPYwSqz43MHYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAj8T2Zb9YQGwWAVWJo/9ngcV5BZwkZs9sA7MlBBQkpjx8D9bLKeAs8fPdRLC4EFBN36
  RJTBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXVNdY2MjfUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQLDOKWY9eUOxul9P/UOMUpyMCmJ8lqZZiUJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuDNNgHKCRalpqdWpGXmAGMKJi3BwaMkwitjDJTmLS5IzC3OTIdInWJUlBLnXQgyUwAkkV
  GaB9cGi+NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5o0Gm8GTmlcBNfwW0mAlo8cqiTJD
  FJYkIKakGphW/flgUZbXvXGYbn7i+QKXlnJUM9yqRd71Sgrd2s53p+q28O7qmrjZ9mmKQyV+V
  KIY9IdMCvW9GBlVVPE2SWBywco+U1Ry7N8Iaz087rxF0P/lQk4eNSzniW7HBxIL8tpx1E9/0v
  rN89GGyndRO25sqvx7JTQ8I4ZT5ua9sguz57RIZXnkPu56cfuJ19krHNJYA/pSEnfrs/Z17nR
  jsP9jG7/nVHqZXV8sw7UB2wKrgk4dNTHzuP7GaWZGu9Mr+31ZF5suPV5xptpshP8Gw89HjlHf
  yGhNP2of86BfoDnyZlV95vTpMRY1RvqpcvbelfcVVi/mzYnL8FCSDhPat0li8fPM2uySOvHP/
  98YosRRnJBpqMRcVJwIAo9nntl4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1651127871!18144!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30250 invoked from network); 28 Apr 2022 06:37:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 06:37:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7AE7F100440
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6947D1000FD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 07:37:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.5.2 -> 5.6.0
Date: Thu, 28 Apr 2022 06:53:26 +0800
Message-ID: <1651100009-17477-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
References: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96823

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.5.2.bb => python3-socketio_5.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.5.2.bb => python3-socketio_5.6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb b/meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb
index 6611743bf8..d762611487 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.6.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "6213f7dfbb87e554472d11151f96bae9059854aa88e4a1e0fa6e97cca1c3fcf4"
+SRC_URI[sha256sum] = "f1f2eabdea500dbcb384902418cacedd98b7fe4d0fed818415ddf8af10e428fa"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


