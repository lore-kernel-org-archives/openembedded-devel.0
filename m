Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E637C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:19:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.336.1668309557254380019
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aHH3qx5h;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309555; i=@fujitsu.com;
	bh=Iz9ZrxdrSWO4G+uu55ZSjfLA+L00jxqCZ7zPMncL3ew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aHH3qx5hFaGghdQ/ld0Gt1Dn4wSa07eDGoGWPRD6Q+X8aTsXY+NbfO7qMKaf/Mlyi
	 BnxURtGpvNgKvgv35c39r88rvS/3hF6kTZb+/FkErWgpJnHECy1A6hOmDPe3g+Uknn
	 U7Kltd79yoQqDwFjdTLaY5hbdix7NbYa2yna8PuEfN/Q1jYQo6oZKofpbM2FtTEb6X
	 kM3qpdVzxywmz0ffjzR3Sy6ETw3ZKlNgiamo/xJq/ASJWF3gctraGvUnkrskKH6/Ep
	 yC4IUbfuQmY1vzHNg/orXkaK+z98cen6XvnZ4qaoJnc1gHINMeIbpQmd3CVPyra4vZ
	 kvFcziDKLAP8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpGuUVJB
  s0LmC3+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzWi+sIql4DZ3RUPfZLYGxgNcXYxcHEICDxkl
  pi28xtzFyAnkXGaS6NvpDZHYA5Q4/osJJMEmICVx4/5/NhBbREBfYunsPWANzAIqEi9+97CD2
  MICvhLfmiaC1bMIqEqcnb6bBcTmFXCS2L58L1i9hICCxJSH75kh4oISJ2c+YYGYIyFx8MULqB
  pFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3QNTfWSijLTM0p
  yEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpZi9eAfjg2V/9A4x
  SnIwKYnypl3PTxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfs7siBZSLAoNT21Ii0zBxgZMGkJD
  h4lEd4KO6A0b3FBYm5xZjpE6hSjopQ47+wEoIQASCKjNA+uDRaNlxhlpYR5GRkYGIR4ClKLcj
  NLUOVfMYpzMCoJ866NBprCk5lXAjf9FdBiJqDF3yPzQBaXJCKkpBqYph39VzRNLORVuOSBppU
  aGv92hcY6rnMq3p3tr7Dh6xb+td/2SDay1Z5OK3RsZVeMsjRaz/zJ5tn9GnYDjp+7dPdVl/yZ
  Eeq652KB7iSOD20SV0+yL+C3jP2dfS6JLfyK1u4fwjtqj9Z2n1A78qh/r4V/+KpHMlOypOJuT
  fH/qRt7bcGcQGY11SrtuKg5q0qWTV+4JW6zTlydh4Wu+VSXBqv+Os7PTqZBH8wKdvxJ9poWt7
  ju/lK/mJ/GLV9eWK1gqn/wynBOLnt3w2Uh7hSfBg2XU7Ytj4UTdDOiqqo+8XDs3+Z3/3FsiOj
  RE/cKYko+nypyvurzv4fr3OG7Sx4qBja9PuGlOulyPrffaS8lluKMREMt5qLiRABvw0BVQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1668309554!782134!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7271 invoked from network); 13 Nov 2022 03:19:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:19:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DFD801B3
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D53427B
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:19:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.22.3 -> 2.22.4
Date: Sun, 13 Nov 2022 11:18:54 +0800
Message-ID: <1668309535-15518-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix
-------
    Fix silent failure when writing gray images with explicit color channel using pillow (#906) (a075c17)
    Ffmpeg supports .h264 extension (#901) (7571ea9)
    Avoid webcam hang on MacOS (#899) (019069f)

Other
-------
    Fix typo (#905) (5355f93)
    Document deprecated format_hint (#902) (88b7784)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.22.3.bb => python3-imageio_2.22.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.22.3.bb => python3-imageio_2.22.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb
index 9b1be658f..919773060 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.22.4.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "63f007b7f2a082306e36922b3fd529a7aa305d2b78f46195bab8e22bbfe866e9"
+SRC_URI[sha256sum] = "0fae027addf02bc89c73a56cc157ad84557f8b8b84aa19b4cb706fefca2d88ff"
 
 inherit pypi setuptools3
 
-- 
2.25.1


