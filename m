Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.498.1593451166832661457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxRF-0000w7-6T; Mon, 29 Jun 2020 20:19:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-html5lib: Upgrade 1.0.1 -> 1.1
Date: Mon, 29 Jun 2020 20:18:52 +0300
Message-Id: <20200629171853.18608-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1:

- Drop support for Python 3.3.
- Drop support for Python 3.4.
- Deprecate the html5lib sanitizer (html5lib.serialize(sanitize=True)
  and html5lib.filters.sanitizer). We recommend users migrate to
  Bleach <https://github.com/mozilla/bleach>.
- Try to import from collections.abc to remove DeprecationWarning
  and ensure html5lib keeps working in future Python versions.
- Drop optional datrie dependency.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-html5lib_1.0.1.bb => python3-html5lib_1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-html5lib_1.0.1.bb => python3-html5lib_1.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 98ee56b2e..59f3cc945 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
-SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
-SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
+SRC_URI[md5sum] = "6748742e2ec4cb99287a6bc82bcfe2b0"
+SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

