Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD776C433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 10:40:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.35155.1653907211318256955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 03:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uUpRujjE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653907209; i=@fujitsu.com;
	bh=cwlTHYH5rAmTQDcjCc/9Vkp/OLzLcBwN7v/OB+RJ8+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uUpRujjEXqGWt7z+Wm7eB6GxwZM+OGKmfFTQTVMMIervDeLcRD4hWlZJbuOS3CHEP
	 X74aqd63Wm6yIrm32VD25/kV4cA4pu2YZtzKXR7OV1U7VrmPvm3T/qn70h1xwelsf0
	 yzlI/HoBjwP4nAXiwq+d4PV/nF5eXezza2LkNBrUp/Fo0YHyEKE8hJaoMJxsuT6rB2
	 tvv8/gq3it6aMd9xVj7LsFbXI8EDdwwL9Mo/PBvC6gEB9G2+gFXiqvFiSca7NW/a7w
	 i32QWqZo0FU6qjTYmsXJCBu50iPL5lt42qTdilXcNON4a6iCaA5AFh5ZVybRp+vu0Y
	 dW39hybBEi4JA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORpMsxf0q
  SwcLpuhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bsPWvYCk5zV/Que8PUwDibq4uRi0NI4CGj
  xJm/69i7GDmBnLNMEtNOFUAk9jBKHLzYxgKSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rBmYQE7iT+dTUD1HBwsAqoSW25Kg4R5BZwkWq5vAGuVEFCQmPLwPTNEXFDi5MwnLBBjJCQOvn
  jBDFGjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUM
  DA11DQ1NdQ10jQ3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAkEwpZry5
  g7G176feIUZJDiYlUd6zqpOThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwZsydkiQkWJSanlqRl
  pkDjA+YtAQHj5IIr0o/UJq3uCAxtzgzHSJ1itGe4+qVK3uZOW6Ayamz/+1n5lgOIoVY8vLzUq
  XEeWeCTBUAacsozYMbCovnS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeW3mAU3hycwrgdv
  9CugsJqCzuJkmgpxVkoiQkmpgahdpuLP8xYLIljs/L9bc3/fY51ebWKjIzS3bK471rA2U2vis
  U2QWh+SEP68eXrXP7L1ov6vYw/BjQET3LO+Zb/jkXj97I15/oeTC9rKCb9uZ7Ga7LgvTYfpv8
  /Jd90IRcamj3elmzud2LhXsUbJbtcZ339KbBRUS52f9fu2dsHbWjMsbWdfuY56txmJ2PCfzVO
  2SrRebftt/Wv7FoMXX6ued85M0gv/x7WPgPqjx/dbejE4TBc8pAonWJr8mx7kut242X1KV/ih
  zq9fkF/xqta0r3/Ln7NDbKML++0X65XtHpRaxfrjE5Ffk0Ll0neOe8xEPw3L9ararv53jJpL5
  Y6mvinrst9u7eD991TatSFJiKc5INNRiLipOBAA1yHGNYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1653907208!235843!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19760 invoked from network); 30 May 2022 10:40:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 10:40:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 433B0D64
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 38285B56
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 11:40:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] apitrace: upgrade 11.0 -> 11.1
Date: Mon, 30 May 2022 18:39:49 +0800
Message-ID: <1653907191-24731-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 10:40:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97321

Changelog:
=========
 frametrim: fix active texture check compare by @okias in #789
 gltrim: handle glFramebufferTexture3D and glMultiDrawElements by @gerddie in #790
 implement ARB_create_context_no_error for GLX and WGL by @okias in #791
 wrappers/glcaps: Check config availablility before dereferencing by @gerddie in #793

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apitrace/{apitrace_11.0.bb => apitrace_11.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/apitrace/{apitrace_11.0.bb => apitrace_11.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb
rename to meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
index 1e5798de5..aed797759 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRCREV = "c54d99563414cd178abec7cf7d9663eb949a0f51"
-PV .= "+10.0.1+git${SRCPV}"
+SRCREV = "9352fc02bba106fbbeef9e8452ef34643c0d0764"
+PV .= "+11.1+git${SRCPV}"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
           "
 
-- 
2.25.1


