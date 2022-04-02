Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A41C54EFE
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.2648.1649137236658108504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mUmSEk7y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137235; i=@fujitsu.com;
	bh=Kjy9vJpqF+nVB6bnzjp5pmMzUfR5vqT9L0dvR0mJYzw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mUmSEk7y8r8rrRIx0PrfpE0EC/04usGpSJlg0PUC2otUT9p+5gANXCYt2cv8AUeNt
	 FyoiNhtZEoVLdeUYwbEMVs4wJTxDychwj3jGRiC3NC1D0uAl6ORSLJuJxrulcrOKX/
	 nLSU48iUmAkjhhTv68k6MdTPgK2xDVdKv3orjr7BI106h2rQ66hed3xlvbR9d26Elt
	 fiFDqAdvndZ9mnC4ncg4YcopR+crZd00tTuQwQKvOyJ6YWfX2oS8mnU85Li+ZgIw24
	 ccLIbmHFUSx7JNRKMTQJ4vY5Uh06v9gMotjmsqt1MOd1Yj0WjKn4c6PJY8tB6fU3pF
	 Bw05BYIvjgNwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBt4zTv
  JYMkDPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePp7W7mgpmcFV3n4xsYj3J0MXJxCAk8YZRo
  W3iLHcK5wCTR/uQTC4Szm1Hi3dr9rF2MnBxsAmoS02/dALNFBPQlls7ewwxiMwuoSLz43cMOY
  gsLBEhcOraLCcRmAYov//oDrJ5XwEli54SXYDUSAgoSUx6+B+vlFHCWeL7jPVi9EFDNmfu/mS
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWiUVZaZnlOQmZuboGhoY6BoamuoCSSNjvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwCBOKWao3sH4v/en3iFGSQ4mJVHeM67eSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  E+eBcoJFqWmp1akZeYAIwomLcHBoyTCe+QiUJq3uCAxtzgzHSJ1ilFRSpz35hWghABIIqM0D6
  4NFsWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz8oBM4cnMK4Gb/gpoMRPQ4ndnPEEWlyQ
  ipKQamE4Y5G2pT9+4Re7wMT5Oz6fl32POsLqUsfDvlc43DD2Z5u8r+1lWsVx47pKdSTV/7c8+
  2xTbeOlC5jv1DU9XfvmpMUPFNXozk0bWTbvAt0e1m3NrP09LUF6/v0HvWm72IZlae5O3nO3vV
  01b7P78yPnjsq9uC5r/EDJ65bZA5W1LQYDwmYL89Hl/JKQMj/6Z5d/7wedzYJXWvIZoj6hD14
  wzlpRZnJl41udtfcmEey8Xayv+nXD6eM/Ds1WaW7Pnd6+qFOZik2ZXWVhf63z9w5L8p6qdvAe
  2Lrf5eYKXM/ln/FptbpUdzzX/Pg5itfzicjfwgtWRvLjXJr8esAYe28gz513E4WtFLFOb2nIW
  RiuxFGckGmoxFxUnAgBjgtchXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1649137233!529388!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23206 invoked from network); 5 Apr 2022 05:40:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:40:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 32A081001B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 079D81001A0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:40:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.32 ->
 1.4.34
Date: Sat, 2 Apr 2022 20:36:48 +0800
Message-ID: <1648903009-19854-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
References: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96411

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.32.bb => python3-sqlalchemy_1.4.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.32.bb => python3-sqlalchemy_1.4.34.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb
index 93a49df53a..b99ed83f6f 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "6fdd2dc5931daab778c2b65b03df6ae68376e028a3098eb624d0909d999885bc"
+SRC_URI[sha256sum] = "623bac2d6bdca3f3e61cf1e1c466c5fb9f5cf08735736ee1111187b7a4108891"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


