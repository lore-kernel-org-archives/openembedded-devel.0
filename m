Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60424C7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.103822.1683541489411906040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DT5MMn5K;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541487; i=@fujitsu.com;
	bh=hlhq47wRQ9mBwrX7OHyaw2ariIW+SjFmmp2a4SaNLBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=DT5MMn5KykeyRbY7i3eZ/l9zZ/YGAyCfCLO7zUw4fF7OC9zwkYpyDv8ZbdugovQDf
	 hUhTGm3SPoyWZzN4swuFhfRPBshir2txyEXyiyklbSHedQXw4yyDXd09nAsG4fr16c
	 ov3TCUhRjugkOdRKCEh6hCR/Ra8/Kypo5N4mrbhV0BMUQNapwucWe/clHG3L72qKER
	 Xy2Ijw5M/SyD3DPKIw/PSRx3NXyQRMEskxRG6u/2C7F2W5cSRXLUmRiUMcooygE1uP
	 CSoskkF+pi94aH+2R5ZBHbWkQlAfF7aygBKCSF+7GgyIqO7qc3j3lewV+zchS4mQIq
	 HGpjko3eSIhUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpPv+bES
  KwY7XkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bPsTusBVO5Kn72eDUw7uTsYuTiEBLYyCix
  eN96ZghnGpNE14HPjF2MnBxsAhIS0/eeZAexRQR0JT5+mAsWZxZQkZgx+QgTiC0s4C8xed0ms
  DiLgKrE0qZmsDivgJPEzjPfwXolBBQkpjx8zwxicwo4S2zt2wpWLwRUc6u5lxmiRk3i6rlNzB
  MYeRYwMqxiNCtOLSpLLdI1NNdLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67
  MTc5J0ctLLdnECAyJlGLlKzsY+3f91TvEKMnBpCTKa3owLEWILyk/pTIjsTgjvqg0J7X4EKMM
  B4eSBK/L6YgUIcGi1PTUirTMHGB4wqQlOHiURHhljwCleYsLEnOLM9MhUqcYFaXEebeeAUoIg
  CQySvPg2mAxcYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8aMMKEeDLzSuCmvwJazAS02P
  9yOMjikkSElFQDU8j+v7euqauIt2Rs/bOCv+TBl9Msufty+7NOLF32Tq0o+9vvR+ns079Pn1p
  bs/r+POb0F+J2m9hZnQwPKOaduaVq5r5U9py2kmXMB+ZVkzwuxKgVLd6zyi+Hcd30i/rVQU5p
  lZX101RdOkpsuJQmRFnEJZxskK44Yb1kgkepQG0Of3ml1aKUE89cZHKYci5tqCowbrj71/ils
  aJfZNaB+CC7q5f3nEy6fEBq9zThY++7dL6GSvg5bxV8pi6w75u00Z0bl36Fh07qmPZL4i2/h/
  q3p9fLnh1a/qn2+rT2LONwxu9nZ91ot7QoWV9beuT/kp5gJWW1mKWZu+dqlCby76zSXCofEcO
  z42iOYtUNJZbijERDLeai4kQARiVnSgQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1683541487!225535!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7441 invoked from network); 8 May 2023 10:24:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2BD831D4;
	Mon,  8 May 2023 11:24:47 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 52CAD1D2;
	Mon,  8 May 2023 11:24:46 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.9 -> 2.0.12
Date: Mon,  8 May 2023 18:24:33 +0800
Message-Id: <1683541475-25799-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
References: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102429

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-sqlalchemy_2.0.9.bb => python3-sqlalchemy_2.0.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.9.bb => python3-sqlalchemy_2.0.12.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb
index 743d76afc3..0b221c7e9d 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "95719215e3ec7337b9f57c3c2eda0e6a7619be194a5166c07c1e599f6afc20fa"
+SRC_URI[sha256sum] = "bddfc5bd1dee5db0fddc9dab26f800c283f3243e7281bbf107200fed30125f9c"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


