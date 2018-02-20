Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 917B7787D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 17:05:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zm6S43JGdz1qtNv;
	Tue, 20 Feb 2018 18:05:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zm6S42nskz1qqkQ;
	Tue, 20 Feb 2018 18:05:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id MSj3UyCsYyFL; Tue, 20 Feb 2018 18:05:02 +0100 (CET)
X-Auth-Info: iUjB67fykd7xGVFFelclhd09PCSJfa6/T0bOA0e8SxI=
Received: from xpert.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Feb 2018 18:05:02 +0100 (CET)
From: Parthiban Nallathambi <pn@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2018 18:04:44 +0100
Message-Id: <20180220170444.10057-2-pn@denx.de>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180220170444.10057-1-pn@denx.de>
References: <20180220170444.10057-1-pn@denx.de>
Cc: lusus@denx.de, ch@denx.de
Subject: [PATCH] nodejs: Update from 8.4.0 -> 8.9.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 17:05:07 -0000

Update nodejs to latest stable release 8.9.4

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
---
 .../recipes-devtools/nodejs/{nodejs_8.4.0.bb => nodejs_8.9.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.4.0.bb => nodejs_8.9.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
index 5bcbc0007..6164f9108 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e4d35c6120f175e1fbe5ff908b1cf2d6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
 
 DEPENDS = "openssl10 zlib"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "e6c85c83001340b30671e9432e1bd337"
-SRC_URI[sha256sum] = "5d5aa2a101dcc617231a475812eb8ed87cac21491f1dcc7997b9dd463563f361"
+SRC_URI[md5sum] = "631ed102fe58c13cf63bc92a68cf4759"
+SRC_URI[sha256sum] = "6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.14.3


