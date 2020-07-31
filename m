Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.20698.1596209170263787005
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 08:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: daniel.dragomir@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06VFPmQ1031187
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 08:25:58 -0700
Received: from otp-ps-s1.wrs.com (128.224.124.60) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 08:25:25 -0700
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <daniel.dragomir@windriver.com>
Subject: [meta-oe][PATCH] rasdaemon: update to 0.6.6 and fix SRC_URI broken link
Date: Fri, 31 Jul 2020 17:26:37 +0000
Message-ID: <20200731172637.38212-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Get sources from another repository since the one from infradead.org
is broken:

fatal: remote error: access denied or repository not exported:
       /users/mchehab/rasdaemon.git

Also, fix indentation.

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 .../{rasdaemon_0.6.5.bb => rasdaemon_0.6.6.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.6.5.bb => rasdaemon_0.6.6.bb} (89%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb
similarity index 89%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb
index 93f624882..93e00e6e0 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://git.infradead.org/users/mchehab/rasdaemon.git"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
-SRC_URI = "git://git.infradead.org/users/mchehab/rasdaemon.git;branch=master \
-        file://0001-Fix-system-header-includes.patch \
-	file://rasdaemon.service \
-	file://init"
+SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master \
+           file://0001-Fix-system-header-includes.patch \
+           file://rasdaemon.service \
+           file://init"
 
-SRCREV = "25533c0c55426eeb2ad25dcbdb2b5e4ba4e83d80"
+SRCREV = "32b978fcf73215c90ce7383580224e4295930ae7"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

