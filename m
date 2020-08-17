Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.40988.1597663764448526227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKM-000361-E3; Mon, 17 Aug 2020 14:29:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-humanize: Upgrade 2.5.0 -> 2.6.0
Date: Mon, 17 Aug 2020 14:28:53 +0300
Message-Id: <20200817112901.28914-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 2.6.0:

- Deploy docs to Read the Docs
- Build API reference docs from docstrings using MKDocs
- Function to represent timedeltas without losing precision
- Improve default locale path discovering
- Added Ukrainian language to list in README.md

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_2.5.0.bb => python3-humanize_2.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.5.0.bb => python3-humanize_2.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
index 255933a5c..de1e98574 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[md5sum] = "636e2c0fa1465abf8f1ff677d00e11c4"
-SRC_URI[sha256sum] = "8a68bd9bccb899fd9bfb1e6d96c1e84e4475551cc9a5b5bdbd69b9b1cfd19c80"
+SRC_URI[md5sum] = "de3a507d9274912a3a177849a9349edb"
+SRC_URI[sha256sum] = "8ee358ea6c23de896b9d1925ebe6a8504bb2ba7e98d5ccf4d07ab7f3b28f3819"
 
 inherit pypi setuptools3
 
-- 
2.17.1

