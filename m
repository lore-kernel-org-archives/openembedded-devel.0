Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D981C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.103808.1683541402356413163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UV0fvgll;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541400; i=@fujitsu.com;
	bh=8NnIXDVOMBodBJ31OJwip8CZg+54ep4Lp84OZp7DJi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=UV0fvgllBD9q36TSyYd0eI1DrIGjkx/17hOkF1Cny4GL3ldW0Zitbr/AINu4Zuphr
	 +NFcsk5fidusE7HNZDnchLqnOa/0AoVkUSXUHPS1o0rBO/3R3gS5veL7X2qBvOc7+p
	 26oXZ03Q159uS+i54zq0WwVl2E4vKRUL+GC8VJvEOclvTCYyYPAYlWtobnfxMpl55O
	 XZ8yXWkMGAqzFOkpYlhVUVVpQloww+rEyo1nwUPx5VsYx0gwGTZwzAGY1rP14XA50W
	 uffCsNABwh2As4fPoJDbaGwjNfXPhfqdg+W3N6giSgz0HDidrzlac51/cdLGgwqvsx
	 2MsJs0Ya8dQ+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpDv9bES
  KwdvvmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b65hWsBRs5K/5eecvcwHiNo4uRi0NIYCOj
  xOvjJ5kgnGlMEs3L/rN1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyEaAGDg5hAV+J6
  wejQcIsAqoSGxv3soDYvAJOEpN7P7CC2BICChJTHr5nBrE5BZwlvr7eAFYjBFTT3TubHaJGTe
  LquU3MExh5FjAyrGI0L04tKkst0jU00ksqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9Z
  LLS7WK67MTc5J0ctLLdnECAyKlOLU9h2MR3f91TvEKMnBpCTKa3owLEWILyk/pTIjsTgjvqg0
  J7X4EKMMB4eSBK/L6YgUIcGi1PTUirTMHGCAwqQlOHiURHhljwCleYsLEnOLM9MhUqcYFaXEe
  fnOACUEQBIZpXlwbbCouMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcBZApPZl4J3PRXQI
  uZgBb7Xw4HWVySiJCSamCSm3Gw/6buW9d5/M9X7W2KNU2LXd8ZXPD0dkf6IZPY2U26JcsmO96
  WuKD44Yfvnqt2Z3dc+TJd7vzDSV4vUzVUKi+/CvvlIp2yK2LSYSbnHyWldiF3/YtTa6Z7KYtu
  fcrXZeWgrLRDvOfgzUU89zsb7Jtks9r7v3lvP3akc+/dGU5zNtm2nOvaaSP+hPn8E9F9Juc4s
  mbXvPxz63jeIvttFs0X/DslOXSNpryy67CTzgu+175R8tf1b5+mGPhvFZmmu0u250L2Mq6Jj6
  a96WG/8pTRTHD57ofbfU8Fevv+/lNXf0YiY8pHz8uRIkpKO+7mX1FoqOLui07bubn4pO7PqM+
  XbU81nPLf67ZHMcJUiaU4I9FQi7moOBEAs12DKAUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1683541399!497218!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10661 invoked from network); 8 May 2023 10:23:19 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:19 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 237741D6;
	Mon,  8 May 2023 11:23:19 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4AB0B1C2;
	Mon,  8 May 2023 11:23:18 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-pulsectl: upgrade 22.3.2 -> 23.5.0
Date: Mon,  8 May 2023 18:23:04 +0800
Message-Id: <1683541384-25689-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
References: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102420

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_22.3.2.bb => python3-pulsectl_23.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_22.3.2.bb => python3-pulsectl_23.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb
index c13c677899..465038e220 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "cc174e1ceebd4e6222c5b78f4f415f12e80753c9ab75ab354159b4cb5950b084"
+SRC_URI[sha256sum] = "8b8a487f1a63b4108e0fc84eab9177c96fb14aafa1a550f52a40c5f7fce99672"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1


