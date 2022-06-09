Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD27C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:17:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.7554.1654759015960306945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AKfKTQWY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759014; i=@fujitsu.com;
	bh=rxidcamVoLMhNQLdCg5iWxo8WcvpVZtv/QB0bOT56Mc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AKfKTQWYKiE48felseGeK0fFa3W2J6xhOIvXeT0Yf1/xn+l9/shkOpCuqgltYeFEw
	 xjed7lBengPik/XQxD0kpzOFX8N7oiVRYe2kNAa2JyKaUkt9VSBUO86cPVelyPmx0J
	 9TMIw17mi9J8z0Ep7Juj45z7fvtgiY8WKwIubvlD4ndMzDi3hozKXLbqXTXIzofJs2
	 zWBed4YE41XFWcnUX5UUlDa1/ImXvSz2fWSaaklC57posC/A3RFxJ6ipR8NTyCP7Tn
	 UWSf0BJRxKCrcwSMcvjCstGZ+T1OwQlJnNXNofAmdf3Ptj9+tHk5mTovT9hDfx0jAJ
	 FnfGeFt93dzwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWTd13sI
  kg95mS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePzr+PsBWe5K+4uW8DcwLiUq4uRi0NI4BGj
  xI4Lb9khnLNMEm9+XwFyOIGcE4wS69cqgthsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1wDV
  i8s4C0xd+57oBoODhYBFYk1DVogYV4Bd4k5c28ygdgSAgoSUx6+B2vlFPCQWPN0IQvEKneJ5V
  /Os0HUC0qcnPmEBWK8hMTBFy+YIXqVJE6s+Ag1p0Li9eFLUHE1iavnNjFPYBSchaR9FpL2BYx
  Mqxitk4oy0zNKchMzc3QNDQx0DQ1NdY2NdQ3NLfUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOKVYcfMOxokrf+odYpTkYFIS5T2XujBJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTv3llAOcGi1PTUirTMHGBEwaQlOHiURHivzgFK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS
  8/L1VKnHfdXKAiAZCijNI8uBGw6L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3KcgUnsy
  8ErhNr4COYAI64teVBSBHlCQipKQamHgXX1csvqW04h37Fnm3Q+7P7zXOVpVYXH7Nc4cs27En
  eatLfkRwd8fV7ed41LKG4f7L+n0bPP4tsSor2PzyZ/jSO2WdK1bZ//eZubmGL3K1tfTjhI33X
  Ro/fJTeFasmZl4Q93Lnx1Pd0zbVbxE6wTDv43zjp6/39/t+mdm6vFfTWeSci6755MtlbKn36i
  puR/5IP/eKf24n896vao4HeqynnVrTL3hn9/3FDsde3H4z8RVDM+O8h7dtDs9fd1dI7/6Nj7c
  cuDvzz/592DMz8fG1mfcTPDe9/C6+3M/+uqSW/s+dMs3xFwTS2ay7Wnmjtm+0eFZ9hM1Pw6Ne
  MjJCbMYNw3XyX3+I5X8vW9P90YlBiaU4I9FQi7moOBEAQK6XVWkDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1654759013!71516!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31412 invoked from network); 9 Jun 2022 07:16:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:16:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8A4A62CA5
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 746AB817
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:16:40 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-msgpack: upgrade 1.0.3 -> 1.0.4
Date: Thu, 9 Jun 2022 15:16:19 +0800
Message-ID: <1654758981-32219-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97447

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Support Python 3.11 (beta)
    refresh ci settings.
    Don't define _*ENDIAN macro on Unix.
    Update setuptools and black
    Use PyFloat_Pack8() on Python 3.11a7
    Upgrade black to fix CI
    Fix Unpacker max_buffer_length handling
    ci: Update action versions.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-msgpack_1.0.3.bb => python3-msgpack_1.0.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.3.bb => python3-msgpack_1.0.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb
index 92999255b..a796d7cb5 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "51fdc7fb93615286428ee7758cecc2f374d5ff363bdd884c7ea622a7a327a81e"
+SRC_URI[sha256sum] = "f5d869c18f030202eb412f08b28d2afeea553d6613aee89e200d7aca7ef01f5f"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
-- 
2.25.1


