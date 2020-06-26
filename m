Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5614.1593170995769819480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYL-000568-KT; Fri, 26 Jun 2020 14:29:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/12] python3-rdflib: Upgrade 4.2.2 -> 5.0.0
Date: Fri, 26 Jun 2020 14:29:34 +0300
Message-Id: <20200626112944.25569-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.0:

- Fix n3 parser exponent syntax of floats with leading dot.
- FIX: Change is comparison to == for tuple
- Added _parseBoolean function to enforce correct Lexical-to-value
  mapping
- SPARQL fix CONSTRUCT resolve with initBindings fixes
- Documentation fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rdflib_4.2.2.bb => python3-rdflib_5.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_4.2.2.bb => python3-rdflib_5.0.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
index f7e7f6310..d037a74bf 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_5.0.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
 
-SRC_URI[md5sum] = "534fe35b13c5857d53fa1ac5a41eca67"
-SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d"
+SRC_URI[md5sum] = "80d7c6adc2e4040cdd8dade2e0e61403"
+SRC_URI[sha256sum] = "78149dd49d385efec3b3adfbd61c87afaf1281c30d3fcaf1b323b34f603fb155"
 
 inherit pypi setuptools3
 
-- 
2.17.1

