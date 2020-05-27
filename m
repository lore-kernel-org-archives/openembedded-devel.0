Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4726.1590582164458377155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 05:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47738 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jdv4x-0007ch-3T; Wed, 27 May 2020 15:22:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-click: Upgrade 7.0 -> 7.1.2
Date: Wed, 27 May 2020 15:22:28 +0300
Message-Id: <20200527122229.24023-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 7.1.2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-click_7.0.bb => python3-click_7.1.2.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click_7.0.bb => python3-click_7.1.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-click_7.0.bb b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-click_7.0.bb
rename to meta-python/recipes-devtools/python/python3-click_7.1.2.bb
index cfa3e0fe4..fa29d11ab 100644
--- a/meta-python/recipes-devtools/python/python3-click_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
@@ -6,12 +6,11 @@ Line Interface Creation Kit". It's highly configurable but comes with \
 sensible defaults out of the box."
 HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[md5sum] = "7f53d50f7b7373ebc7963f9ff697450a"
-SRC_URI[sha256sum] = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
+SRC_URI[md5sum] = "53692f62cb99a1a10c59248f1776d9c0"
+SRC_URI[sha256sum] = "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
 
-PYPI_PACKAGE = "Click"
 inherit pypi setuptools3
 
 UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1

