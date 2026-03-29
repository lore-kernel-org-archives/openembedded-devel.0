Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA2CFC97EE
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 19:59:31 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35789.1774814367933740488
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 12:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ab3n1DQj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202603291959240adfd8f0c000020740-jsemiy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603291959240adfd8f0c000020740
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 29 Mar 2026 21:59:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6EdWH6cZ5mbbFwBzbPKo0tFIS5quIap+lx0eRKFY7vo=;
 b=ab3n1DQjNE95N2uOwccalVpQOLJ5rwsAXogojjDp+AIVB1JewHEsF2wUyQMwMgPneB3umC
 nWap5FDTCwqWMbTBb5Ln27gkvBcMhc5gQ4shzlcK1Rk1dfShTQFn/OKOCUjolHYdYxLi8zjr
 pVfDHHolkgaoR3CwHVUINIbS/CtyOV6UsSryWxFIb0Rd3nDY8/3q0EAMoKl3bXWgrUd+TneQ
 ubKJ1ZjXTUYudmO2E8uJXqz1HoyfCtnzAapD79ha+bwLQrQhF/IIbRAXhRtnKzkRf0Zu4/bp
 B7cMDOfO8OnGFZvamDJ/2MPeU3rBAVHtHA2+5bl8AaAf87DgLZkwCGZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] grpc: upgrade 1.78.1 -> 1.80.0
Date: Sun, 29 Mar 2026 21:58:58 +0200
Message-Id: <20260329195858.14273-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 19:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125808

License-Update: Re-scope secondary licenses [1]
Release information [2]:

This is release 1.80.0 (glimmering) of gRPC Core.
Core
* [ssl] Implement TLS private key signer in Python. (#41701)
* [TLS Credentials]: Private Key Offload Implementation. (#41606)
* Fix max sockaddr struct size on OpenBSD. (#40454)
* [core] Enable EventEngine for Python by default, and EventEngine fork support in Python and Ruby. (#41432)
* [TLS Credentials]: Create InMemoryCertificateProvider to update certificates independently. (#41484)
* [Ruby] Build/test ruby 4.0 and build native gems with Ruby 4.0 support. (#41324)
* [EventEngine] Remove an incorrect std::move in DNSServiceResolver constructor. (#41502)
* [RR and WRR] enable change to connect from a random index. (#41472)
* [xds] Implement gRFC A101. (#41051)
C++
* [C++] Add SNI override option to C++ channel credentials options API. (#41460)

[1] https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e
[2] https://github.com/grpc/grpc/releases/tag/v1.80.0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grpc/{grpc_1.78.1.bb => grpc_1.80.0.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.78.1.bb => grpc_1.80.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
index 6739c659d3..14ead4ccf9 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
 LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906 \
+    file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9 \
     file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
     file://third_party/xxhash/LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
 "
@@ -23,8 +23,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "5b6492ea90b2b867a6adad1b10a6edda28e860d1"
-BRANCH = "v1.78.x"
+SRCREV = "f5e2d6e856176c2f6b7691032adfefe21e5f64c1"
+BRANCH = "v1.80.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "

