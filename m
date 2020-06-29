Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.17261.1593432771419890767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseX-0001kP-8S; Mon, 29 Jun 2020 15:12:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-humanize: Upgrade 2.4.0 -> 2.4.1
Date: Mon, 29 Jun 2020 15:12:29 +0300
Message-Id: <20200629121233.27026-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 2.4.1:

- Explicit error if _DEFAULT_LOCALE_PATH is None
- Fix incorrect Portuguese spelling
- Fix fractional(0.333) output in README

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_2.4.0.bb => python3-humanize_2.4.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.4.0.bb => python3-humanize_2.4.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
index 6bb6946ff..3a06a48b1 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_2.4.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
-SRC_URI[sha256sum] = "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
+SRC_URI[md5sum] = "3d4d25cf84181c55bf7d219dd175dbff"
+SRC_URI[sha256sum] = "4b4ce2fc1c9d79c63f68009ddf5a12ad238aa78e2fceb256b5aa921763551422"
 
 inherit pypi setuptools3
 
-- 
2.17.1

