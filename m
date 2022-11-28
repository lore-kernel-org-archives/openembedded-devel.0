Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20926C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:12:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.111377.1669615969246430812
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WlTDRuq8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615967; i=@fujitsu.com;
	bh=xU+UlrMMUTVrKj1WPqHApxsEEFzqJdnctuPKoJF+vqg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WlTDRuq8stfBXNY/ftyaVJOMpEmT3RUN4zNXjf7bUhshqikgZ21tOcA9Wa53nGf9y
	 NfDSQIdmfWjY4V0hlohf2UroCTFaBwWe2DX0gFZkXRITEPpASb7gRmiuvej87w5rg+
	 JfTTqctBWoqEqTEHqWgEt+zR4T3j3X+UeL2PT4M0c2yAoRi8OAu4kMDvz4Y1ncsrXz
	 bl6gONSL8qKnXI8RhobkynL6N6fDm3Gn2+2ujUgCrd4ra7huSR8psBaAMGRuV3lRiK
	 2cAQvQMoC+XHRot7FVR4fyZyuOaGi7bAST8e6ZIFXjMo8Ta6ChLaEKxRIKeIbV7MZk
	 3QQuhllhNLdZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSTcusCX
  ZoP2/pcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHjwSaWgh2cFScnvWRsYHzI0cXIxSEk8IRR
  orH7HWMXIyeQc51J4smEIojEHkaJ/z2/WEESbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwsESCxdM40FxGYRUJVYveMpWA2vgJNEx5W3YAskBBQkpjx8DxbnFHCWmLZ+OzPEYieJrS
  unM0LUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI1NNdLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzelGJ2gR2MR5b90TvEKMnBpCTKu/BSU7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d71ni3JQoJFqempFWmZOcBIgklLcPAoifAutgdK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1
  VKnPecP1CRAEhRRmke3AhYVF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7DWQKT2ZeCdy
  mV0BHMAEdsUmxCeSIkkSElFQD0+QLySduL+GdOHdbMacZezL//uyVJT6P8mJE/s1fVrW6/S7X
  0igxReNj1V9+fFx8z6pnYb1hp1xnxtaT/D8K/8/0VDy6KlCroCzWt2C+y+vt0/SOpOX+iuS75
  B/+hUuGrbe63WXbkZ+9NzyMv3DV/8iZ9uTuv+d6616c4cm7eXCRxez/+Xciap6u5UxbHpx4pv
  LmeR3POXyTZTc8DKqZMbWhrjX/OJfG5J6rh74XiZ+z0uf4+29x7cbOvVlu3AlmSV+Ek/LaFzH
  duBsQ/uvVvLlzjm8wCfzx9dGn+N8nSm69m1oxdf6Wb06bTeRrjM9KLJF55c59WaNozarYn51K
  W0Mcpf/d7i/kFhGeLK0WqqzEUpyRaKjFXFScCADs0PKIZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1669615966!221601!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12524 invoked from network); 28 Nov 2022 06:12:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:12:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8C2A11000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7FF481000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:12:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 2.0.5 -> 2.0.8
Date: Mon, 28 Nov 2022 14:12:09 +0800
Message-ID: <1669615929-13134-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
References: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99800

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_2.0.5.bb => python3-asyncinotify_2.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_2.0.5.bb => python3-asyncinotify_2.0.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb
index 4c6450875..a34f947c5 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "e4d95cba362f10d33b6fdd558afd39f0ea7a5be1a9694434e738141cbed366d9"
+SRC_URI[sha256sum] = "3a621eff75d37402d27648ec06874cd7fdf62128dc5c4f458f5bb88a32d87763"
 
 inherit pypi setuptools3
 
-- 
2.25.1


