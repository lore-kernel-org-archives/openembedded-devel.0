Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.4084.1617626985197999994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55456 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTOfm-0005yF-5y; Mon, 05 Apr 2021 15:49:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-docutils: Upgrade 0.16 -> 0.17
Date: Mon,  5 Apr 2021 15:49:31 +0300
Message-Id: <20210405124933.8920-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405124933.8920-1-leon.anavi@konsulko.com>
References: <20210405124933.8920-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17:

- Installing with setup.py now requires setuptools. Alternatively,
  install with pip.
- The generic command line front end tool docutils-cli.py allows
  the free selection of reader, parser, and writer components.
- New, experimental wrapper to integrate the recommonmark Markdown
  parser for use with Docutils.
- pseudoxml-writer got a --detailled option for pretty printing
  text nodes.
- odf/odt-writer improved metadata handling.
- HTML5 writer improvements.
- LaTeX writer improvements.
- Fixes in Arabic mappings and Korean translations.
- directives: Prevent infinte inclusion loops.

License-Update: Fix link to 2-Clause BSD license in COPYING.txt.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-docutils_0.16.bb => python3-docutils_0.17.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.16.bb b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-docutils_0.16.bb
rename to meta-python/recipes-devtools/python/python3-docutils_0.17.bb
index 44b7320cb..8605e93b5 100644
--- a/meta-python/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
@@ -2,9 +2,8 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "https://pypi.org/project/docutils/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & GPL-2.0 & Python-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
+SRC_URI[sha256sum] = "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
 
 inherit pypi setuptools3
-- 
2.17.1

