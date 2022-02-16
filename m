Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F6AC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:05:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.5365.1644969912459829151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SDu3lI6I;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644969910; i=@fujitsu.com;
	bh=jygvEcmrTtwNYdCNhHfx0LCOHQgMoj73mMykvLSOOtQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SDu3lI6IQ0OEr1RwU5sMsCT5YHbzEf76WdgRlCEb7mUY+LHyQDsC/g5HHbxTyP+jE
	 3/eOHe9FLkN1Dpz22nZeh88o0OWnH5ZbXiZIsfc3Iu9LScnjfrVZYB9gI5See78qI/
	 UJp4XW5twJ8d1CAgooBzMdLHmATYLrFOVUBeU5+ehBRR+raaYddhNgcgHrSWmunsrY
	 8OYh6dM7saOG3xCk3vmGKH9B/HjLs3dgNiMCw4FwiU59xTQ17ZS0HTzIuhToe+YHnL
	 D1aVHxN2uNLu8Clr2zXLJvIMLSps/v6gra6/mS8BGnOCMNTUDcsIxBD3hESSilvI7k
	 H7w1bOkwg56SQ==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id EE/C6-22205-6BF3C026;
 Wed, 16 Feb 2022 00:05:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRorvVnif
  JYOEuQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP+9NuMBd+5Kr6dWsnUwPiWs4uRi0NIYCaT
  RNPp36wQzglGib6Wc0xdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCws4Sby++
  wbMZhFQlTj74j5QDQcHr4CjxL3fRiBhCQEFiSkP34O18goISpyc+YQFYoyExMEXL5ghahQlZl
  9uZoGwKyRmzWpjmsDIOwtJyywkLQsYmVYxWicVZaZnlOQmZuboGhoY6BoamuoaW+oaGRrrJVb
  pJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBllKsfrVHYybV/3UO8QoycGkJMrb
  doM7SYgvKT+lMiOxOCO+qDQntfgQowwHh5IEL78NT5KQYFFqempFWmYOMOBh0hIcPEoivO8sg
  dK8xQWJucWZ6RCpU4yKUuK8fnZACQGQREZpHlwbLMouMcpKCfMyMjAwCPEUpBblZpagyr9iFO
  dgVBLmTbMFmsKTmVcCN/0V0GImoMWKjVwgi0sSEVJSDUwsF+2cdgr8XtpontN/7EF9kmFd1de
  veRNZ3ugmC8XNCGzbHBP9La1uv8/xbd0nP254KndVuOu2CM8p3/DgXQznEu69M381f1XWC11h
  lT2hDKpMwu2PFArn+3fqeR/slBRxPf9lR/Cyfmf1BcE5r456nhNLq5Pf6f/4V2zf++UWZ/Viy
  9XFWO/ENjMJCBbcmiHelLLnqkyJp6/L62eXy3bxlrZyvzh72v7H3+nfX6mJlz1ct/t59NEp17
  7VeTYvPRWwNa111p/GCYZzD20U2zJThqlAJTQ/uq6af16hUst9Zv/w0jnv1W7P07PLufX9sUz
  ffKZcTr307epCmzM9VlyROnOttzt/65Kyl9u4s5RYijMSDbWYi4oTAQP0ruMtAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1644969909!21097!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15460 invoked from network); 16 Feb 2022 00:05:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 00:05:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21G053qW019255
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:09 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 00:05:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fsverity-utils: upgrade 1.4 -> 1.5
Date: Wed, 16 Feb 2022 08:04:48 +0800
Message-ID: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 00:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95322

Changelog:
=========
* Made the 'fsverity sign' command and the 'libfsverity_sign_digest()' function
  support PKCS#11 tokens.
* Avoided a compiler error when building with musl libc.
* Avoided compiler warnings when building with OpenSSL 3.0.
* Improved documentation and test scripts.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{fsverity-utils_1.4.bb => fsverity-utils_1.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/fsverity-utils/{fsverity-utils_1.4.bb => fsverity-utils_1.5.bb} (95%)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
similarity index 95%
rename from meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
rename to meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index b76ed2477f..89e92d62f4 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
-SRCREV = "9e082897d61a2449657651aa5a0931aca31428fd"
+SRCREV = "20e87c13075a8e5660a8d69fd6c93d4f7c5f01a5"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


