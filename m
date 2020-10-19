Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web09.10585.1603103350820809618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09JAT8iW022328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 12:29:08 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.137.119])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 09JAT7jb003613;
	Mon, 19 Oct 2020 12:29:08 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 3CA4A950AAA;
	Mon, 19 Oct 2020 12:29:05 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrej.kozemcak@siemens.com, Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-oe][PATCH 2/2] nspr: upgrade 4.26 -> 4.29
Date: Mon, 19 Oct 2020 12:25:59 +0200
Message-Id: <20201019102559.19491-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201019102559.19491-1-andrej.valek@siemens.com>
References: <20201019102559.19491-1-andrej.valek@siemens.com>

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.26.bb => nspr_4.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.26.bb => nspr_4.29.bb} (97%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.26.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
similarity index 97%
rename from meta-oe/recipes-support/nspr/nspr_4.26.bb
rename to meta-oe/recipes-support/nspr/nspr_4.29.bb
index a15afd667..6307c159e 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.26.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "615695d57eaafa1fca085d3891befd68"
-SRC_URI[sha256sum] = "fc9d142d85b74ffd2e6374a0c9016f3f2dac074225e24df3070e5a72d31b773d"
+SRC_URI[md5sum] = "a546926d3c8e887be02c668c1293da92"
+SRC_URI[sha256sum] = "22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.11.0

