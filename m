Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462D5C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:14:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.4598.1648714469959024619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M1rpVNX3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648714468; i=@fujitsu.com;
	bh=YUv9O0jmBNYOSayEwSpOFY+az35igZ+cANoIeLIJ+Js=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M1rpVNX3PwabkW0mVY6zwj54P8hBBPWvhHtRBGNMAlIdKfbvgOPf1FgXWvtl+Bnsx
	 3TSnxWqu/OxMUAwS6td0qZaK/nGc2CGPpmRoDcMdd4FbHxctGUSf68dOoOq4JY8cpt
	 Z66jEEYYbW9+ZOIzd3jnfxbNGjNinaiacs2XjjFXGK4Oc5uJH0QXwY5rsNPw4M+I1O
	 OS/TudgjDDueu32kSbZ52JG+c8qH+jSsjM84rzUgaLXKZg99tW9aG2HQiMv0+mxUwf
	 NntqpSX/t3Ef8cjvsQ11lNNXDTyIrQLB0byYLU7DaKb3gzBcxoTzlFxaPI3Nr7B6Iv
	 Z3hmFdVwHdOvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfdxkmu
  Swf0TRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aiph2sBf1cFa+md7M1MK7l7GLk4hASeMIo
  sWLyezYI5wKTRNfE1ywQzklGiaN7tzF1MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  TuILSwQI3FlyRywOAtQfNXPlawgNq+Au8TFn91gcQkBBYkpD98D2RwcnAIeEltanEHCQkAl0/
  5sY4YoF5Q4OfMJC8R4CYmDL15AtSpJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXSBpZKyXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYxCnFDNU7GP/3/tQ7xCjJwaQkyusU4JokxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YK3DhgXQoJFqempFWmZOcCIgklLcPAoifA6gqR5iwsSc4sz0yFSpxgVpcR5fROBEgIgiYzSPL
  g2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmwEyniczrwRu+iugxUxAi+seO4IsLkl
  ESEk1MDVoms0PTFi1/42WplkVn4TD/+ynu97q1U7SeeYm8YytPPddYUC7zbLdC/6+3sd9647G
  76ebJ/o5q/2WM7iwnmVjep7HlllSWwSv8p5ZLlP7nP+e0upWVZ2jPtb/vb0VTe9LcM2wfPYj7
  P09pS+Z+zf5Xf8dlVRpEZLMymCcpGTt0LqqLrxy3+ewOZwnS6fwLL38bf+Eor1qeltX3YzNKX
  67ftfkP26nV7YavZvWPPfJE92FYW/5ktZHt83ZYb/Ll2POXJP3NuL/OO4wpvM9ubJvd8oug3O
  XF1yp9j3d/qR1rbBhbO/5l8b3DsjMeNogfN7BR9GyVM5gHt/OsmUKL7M3q+vFLzv55aFBjoe7
  g4oSS3FGoqEWc1FxIgC1PZt4XQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1648714467!151396!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25687 invoked from network); 31 Mar 2022 08:14:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2022 08:14:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5C1DC100461
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:14:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 474F4100451
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:14:27 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 09:14:20 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 4/5] [oe] [meta-python] [PATCH] python3-itsdangerous: upgrade
 2.1.1 -> 2.1.2
Date: Thu, 31 Mar 2022 16:13:27 +0800
Message-ID: <1648714408-12048-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 08:14:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96290

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Handle date overflow in timed unsign on 32-bit systems.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-itsdangerous_2.1.1.bb => python3-itsdangerous_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.1.1.bb => python3-itsdangerous_2.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
index ef1d7cc07b..2e8c7e7802 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "7b7d3023cd35d9cb0c1fd91392f8c95c6fa02c59bf8ad64b8849be3401b95afb"
+SRC_URI[sha256sum] = "5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


