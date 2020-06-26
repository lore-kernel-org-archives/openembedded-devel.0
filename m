Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5615.1593170995911921577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYM-000568-5Z; Fri, 26 Jun 2020 14:29:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/12] python3-httplib2: Upgrade 0.17.3 -> 0.18.1
Date: Fri, 26 Jun 2020 14:29:35 +0300
Message-Id: <20200626112944.25569-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.18.1:

- explicit build-backend workaround for pip build isolation bug
  "AttributeError: 'module' object has no attribute '__legacy__'"
  on pip install
  https://github.com/httplib2/httplib2/issues/169
- IMPORTANT security vulnerability CWE-93 CRLF injection
  Force %xx quote of space, CR, LF characters in uri.
  https://cwe.mitre.org/data/definitions/93.html

PKG-INFO md5 checksum changed, the license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-httplib2_0.17.3.bb => python3-httplib2_0.18.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.17.3.bb => python3-httplib2_0.18.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
index 57047c9ac..9c9b6c5b0 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "A comprehensive HTTP client library, httplib2 supports many features
 HOMEPAGE = "https://github.com/httplib2/httplib2"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4edb3f072a9d815734530f608039a167"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7e04d1303d64a7b62421751ecb490dc2"
 
-SRC_URI[md5sum] = "5730490cfe83350477b54b0a8a190c8a"
-SRC_URI[sha256sum] = "39dd15a333f67bfb70798faa9de8a6e99c819da6ad82b77f9a259a5c7b1225a2"
+SRC_URI[md5sum] = "0b331f96cdb2ae0e0342d4ea0f5f0502"
+SRC_URI[sha256sum] = "8af66c1c52c7ffe1aa5dc4bcd7c769885254b0756e6e69f953c7f0ab49a70ba3"
 
 inherit pypi setuptools3
-- 
2.17.1

