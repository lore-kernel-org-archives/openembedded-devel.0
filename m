Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1345.1609787968061381697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 11:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39382 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwVO2-0007Kw-Fy; Mon, 04 Jan 2021 21:19:27 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 2.0.1 -> 2.1
Date: Mon,  4 Jan 2021 21:19:16 +0200
Message-Id: <20210104191916.7071-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210104191916.7071-1-leon.anavi@konsulko.com>
References: <20210104191916.7071-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1:

- Officially support Python 3.9.
- Drop official support for Python 3.5.
- In order to avoid conflicts with future CSS specification
  changes, non-standard pseudo classes will now start with the
  :-soup- prefix. As a consequence, :contains() will now be known
  as :-soup-contains(), though for a time the deprecated form of
  :contains() will still be allowed with a warning that users
  should migrate over to :-soup-contains().
- Added new non-standard pseudo class :-soup-contains-own() which
  operates similar to :-soup-contains() except that it only looks
  at text nodes directly associated with the currently scoped
  element and not its descendants.
- Import bs4 globally instead of in local functions as it appears
  there are no adverse affects due to circular imports as bs4 does
  not immediately reference soupsieve functions and soupsieve does
  not immediately reference bs4 functions. This should give a
  performance boost to functions that had previously included bs4
  locally.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.0.1.bb => python3-soupsieve_2.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.0.1.bb => python3-soupsieve_2.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
index ae242af562..7cb0efbf97 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
 
-SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
-SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
+SRC_URI[sha256sum] = "6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

