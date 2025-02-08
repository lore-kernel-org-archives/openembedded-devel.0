Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170CFC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:04:13 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.10236.1739027045041019661
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BK0X0snl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025020815040014056ca6fcb1c77bb7-84_nkt@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025020815040014056ca6fcb1c77bb7
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 08 Feb 2025 16:04:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=m3RSG8Kz22opjkYgacgax4AsMS1aRzkvDw+ce9C2TvI=;
 b=BK0X0snlsVPcaAt8ZRMARfDKN5X4T1QcD6xGm+g8+dQSz7b2echg9d+tyt9pRoHKiI60dF
 I29T1QzplGM3iz3E1X58U4Be79rPMtB/Q77NKJXwpGt7v1ix+IWy/FMk2xoQM5B9yFP/UWT6
 AzBiss48fQbXdtRdAGGk3JxAX4qIGVNDNP36lYsFuFxm81trJSgpW3Dhmh8CV1c633i7zXNc
 4JyjZQHpsROe82BzH6Za3iMOiVwZKU/VxLYersN+lUfWcbJcMcn1m+9kWRXdxovnoMU/cJaF
 +y+HRYd8LJn0TQl6s7f6WJlkg6lyIEyP+VynFMySXy7gP/wfvok6eNTg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/4] grpc: remove unneeded dependencies
Date: Sat,  8 Feb 2025 16:03:05 +0100
Message-Id: <20250208150308.2451484-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 15:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115309

From: Peter Marko <peter.marko@siemens.com>

googletest is needed only if we would build tests, and then it should be
conditional on PTEST_ENABLED

libnsl is not needed. there is no linking command in any cmake.
The only grep hit is in cares.cmake to disable it.
Commit 2ffc7b45d638a89535b963533d39b8b13e4c8c1e which added it talks
about host distros, but also such case would be wrong when adding it to
general depends (should be in native only depends) and it would have to
have be reference in cmake (in grpc or in one of recipe-sysroot).

Also sort the dependencies in the process.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index caf355bb52..b82b802e3c 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS = "c-ares protobuf protobuf-native openssl libnsl2 abseil-cpp re2 zlib"
-DEPENDS:append:class-target = " googletest grpc-native "
+DEPENDS = "abseil-cpp c-ares openssl protobuf protobuf-native re2 zlib"
+DEPENDS:append:class-target = " grpc-native"
 DEPENDS:append:class-nativesdk = " grpc-native "
 
 PACKAGE_BEFORE_PN = "${PN}-compiler"

