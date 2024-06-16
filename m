Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC78C41513
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:24:19 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.40406.1718565853297575295
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Nc7YI+gR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240616192410f3a038b7ba2ec2fed6-_atveo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240616192410f3a038b7ba2ec2fed6
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 21:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sTIA0CHJ0/4OzhGW0hO1y8bn5DWZatCsPXX5OMpmHjU=;
 b=Nc7YI+gRMRo/JSrGEeob+hYtTJjm9vqT90ADdBrSxO1CYn855bhQFLGCmyEsoiTfbs0f2Q
 NrZH5aBtpgZlYU89nbYPKvlwPKAeEhR7Ra7XKKMzDNqs2KcatS51oYmEHvXl+99Sp0jNRCCN
 sxZT8cLvP7qdbDjsXIGGwid/pC/3Q=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/6] uriparser: upgrade 0.9.7 -> 0.9.8
Date: Sun, 16 Jun 2024 21:23:06 +0200
Message-Id: <20240616192310.856262-3-peter.marko@siemens.com>
In-Reply-To: <20240616192310.856262-1-peter.marko@siemens.com>
References: <20240616192310.856262-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 19:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110929

From: Wang Mingyu <wangmy@fujitsu.com>

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Protect against integer overflow in ComposeQueryEngine
* Protect against integer overflow in ComposeQueryMallocExMm
* Require CMake >=3.5.0
* CMake option URIPARSER_SHARED_LIBS=(ON|OFF) to control, whether to produce a
  shared or static library for uriparser and that alone, falls back to standard
  BUILD_SHARED_LIBS if available, else defaults to "ON"
* Document that scheme-based normalization a la section 6.2.3 of RFC 3986 is a
  responsibility of the application using uriparser
* Document supported code points for functions uriEscape(Ex)W
* Update Clang from 15 to 18
* Adapt to breaking changes in Clang packaging
* Get sanitizer CFLAGS and LDFLAGS back in sync
* Pin GitHub Actions to specific commits for security

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
index 421263e62b..3d76190d39 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "11553b2abd2b5728a6c88e35ab08e807d0a0f23c44920df937778ce8cc4d40ff"
+SRC_URI[sha256sum] = "4cd0e4f93b477272fabceeb0202f269169fe6ec3044e10fac6acbcdf354bb080"
 
 inherit cmake github-releases
 
-- 
2.30.2


