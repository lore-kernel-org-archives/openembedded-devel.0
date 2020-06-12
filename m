Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16404.1591955292864120906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45372 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjgID-0001HN-Sk; Fri, 12 Jun 2020 12:48:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-packaging: Upgrade 20.3 -> 20.4
Date: Fri, 12 Jun 2020 12:47:55 +0300
Message-Id: <20200612094757.22146-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612094757.22146-1-leon.anavi@konsulko.com>
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.4 with the following improvements:

- Canonicalize version before comparing specifiers
- specifiers: don't rely on hashes for equality
- Add a NewType for normalized names
- Bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-packaging_20.3.bb => python3-packaging_20.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-packaging_20.3.bb => python3-packaging_20.4.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-packaging_20.3.bb
rename to meta-python/recipes-devtools/python/python3-packaging_20.4.bb
index 9eee84b1b..0f78fd016 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
-SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
+SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
+SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

