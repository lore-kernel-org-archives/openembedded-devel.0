Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.32986.1618236151315207455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx8t-0002MB-3i; Mon, 12 Apr 2021 17:02:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-cerberus: Upgrade 1.3.2 -> 1.3.3
Date: Mon, 12 Apr 2021 17:02:06 +0300
Message-Id: <20210412140212.8395-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Minor code refactoring of the recipe and upgrade to release 1.3.3:

- Classes can be used as constraint for the type rule
- The abstract base classes of the standard library's
  collections.abc module are available as named types for the
  type rule
- Generic type aliases from the :mod:`typing` module can be used
  as constraints for the type rule, including parametrized ones
  a.k.a. compound types
- Support for Python 3.5 is removed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cerberus_1.3.2.bb => python3-cerberus_1.3.3.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.2.bb => python3-cerberus_1.3.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
index 61a76f5f6..fa0bbb0aa 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
@@ -1,11 +1,11 @@
-# The PyPI package uses a capital letter so we have to specify this explicitly
-PYPI_PACKAGE = "Cerberus"
-
-inherit pypi setuptools3
-
 SUMMARY = "Lightweight, extensible schema and data validation tool for Python dictionaries."
+HOMEPAGE = "http://docs.python-cerberus.org/"
+SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
-SRC_URI[md5sum] = "6e648b38b468617a06745d1e8a96c848"
-SRC_URI[sha256sum] = "302e6694f206dd85cb63f13fd5025b31ab6d38c99c50c6d769f8fa0b0f299589"
+# The PyPI package uses a capital letter so we have to specify this explicitly
+PYPI_PACKAGE = "Cerberus"
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "eec10585c33044fb7c69650bc5b68018dac0443753337e2b07684ee0f3c83329"
-- 
2.17.1

