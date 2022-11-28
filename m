Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428C9C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.111561.1669616749187843510
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OY53V9gd;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616747; i=@fujitsu.com;
	bh=DT3ZANjbJFWur5cZQsP9P1LwkTx7D57EspdSt7GVsMY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OY53V9gdKBQYTjUueISZWbOngFjmWzfQe9wlgG/413Ei13tXrLsf45WytWgoklF5K
	 hUkV8WxYe0YoACawkrDotXVLdFdxDvwXguT2ogMsobYItI8zQYEvDI20BP/2zTSOVn
	 tpaIocyG2EhBvM6xxqdvFbzApmvtCYJDSxSOqXdsxdmG8Q37mpQeXmw/05jnCaWVBb
	 YDk/4du7jBn09HDfYzhOrp2jriTMR/Nq3GCRCBoXcR6pS+/h7nEgqRRMy6jLLEYeFA
	 oFX/BLDTtS4ayZAmwqvcG1dSm/egXho74WiMJ5uGYNUjfFCa/8BxHRnT9zD396etKc
	 /PCtQjq3ek9jA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8OxWTc7pCX
  ZYPc/JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPTxNmMBf85Kv79+8zewNjH0cXIxSEk8JBR
  4tbkGSwQzmUmia1TL7F1MXICOXsYJXZdUQSx2QSkJG7c/w8WFxHQl1g6ew8ziM0soCLx4ncPO
  4gtLGApsWz6aRYQm0VAVeJc8zwwm1fASeLDu39gvRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU000sqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMaUYsWtOxhvLPuj
  d4hRkoNJSZT3Y2BLshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3rkgOcGi1PTUirTMHGBkwKQlO
  HiURHgX2wOleYsLEnOLM9MhUqcYjTnWNhzYy8wx82vbAWYhlrz8vFQpcV6OYKBSAZDSjNI8uE
  GwiL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXLwhoCk9mXgncvldApzABnbJJsQnklJJ
  EhJRUA5Nd+Dzbeb8T/SceMokwOuolIHbGP/8Fx/1CMaGYZby7/fUMVoZv/vvkWKerywfFLx57
  52/ocl08+cCbpjfJU88dXZb1XMQ7VaJnl3ucvKire8Tn58HXO9NnmOqFC+hPEt6jHnbU6OWed
  n6Pv2cN36tcWpO0SFjz0ByDk3/3bPuk0XvF8PinA19KTm5X25faP3NC6Yx7Th3R7Ad1lvikHp
  Y3f/76orOU0pqZJn1/1blqrp12VGKPi7qionD120mBzPU7t62repyvtcfv3snpfzIFDc6bay2
  fNyW28MQ175VLfyzee/j9q6Yyr9D8gO977e8V6f5iYumeKWsSm3u6K+D9NJ3/8zIcDt2cJOUt
  uKRdiaU4I9FQi7moOBEAYAJYxlMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1669616746!222677!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12050 invoked from network); 28 Nov 2022 06:25:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:25:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C245F150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B604473
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:25:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 373 -> 377
Date: Mon, 28 Nov 2022 14:25:18 +0800
Message-ID: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99816

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_373.bb => xterm_377.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_373.bb => xterm_377.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_373.bb b/meta-oe/recipes-graphics/xorg-app/xterm_377.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_373.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_377.bb
index bc555cbcd..e96c014ab 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_377.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "deb0989473a63908b5a8d44dfeea8301c8710f6ce01fb57ce8c30002375746b6"
+SRC_URI[sha256sum] = "db108fe7a45d8ed97e604721b58443b473649e61e263631bf8759f8618a990b2"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1


