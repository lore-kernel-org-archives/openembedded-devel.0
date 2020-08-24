Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.196103.1598280616866309288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnb-0006gX-Lk; Mon, 24 Aug 2020 17:50:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-pymisp: Upgrade 2.4.128 -> 2.4.130
Date: Mon, 24 Aug 2020 17:50:00 +0300
Message-Id: <20200824145004.12568-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.130:

- Blacklist methods.
- Add list of missing calls.
- Add test_obj_references_export.
- Add MISPObject.standalone property.
  Setting MISPObject.standalone updates MISPObject._standalone and
  add/removes "ObjectReference" from AbstractMISP.__not_jsonable
  using update_not_jsonable/_remove_from_not_jsonable.
- Add AbstractMISP._remove_from_not_jsonable.
- Bump version, dependencies, objects and types.
- [testlive_comprehensive] Updated generic tagging method to match
  changes in MISP.
- Cleanup blocklist methods.
- Remove outdated example.
- Bug fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.128.bb => python3-pymisp_2.4.130.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.128.bb => python3-pymisp_2.4.130.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
index e27bf9900..2e9259466 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "a90a25def591c6a265bc904f801646f1"
-SRC_URI[sha256sum] = "714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7"
+SRC_URI[md5sum] = "be91a479c689857617fbfc7ce919e291"
+SRC_URI[sha256sum] = "2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

