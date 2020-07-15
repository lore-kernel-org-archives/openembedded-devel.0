Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9065.1594826709510784039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 08:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jvjHO-0006eC-L7; Wed, 15 Jul 2020 18:25:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-isort: Upgrade 4.3.21 -> 5.1.0
Date: Wed, 15 Jul 2020 18:24:48 +0300
Message-Id: <20200715152450.29018-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715152450.29018-1-leon.anavi@konsulko.com>
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.0:

- isort now throws an exception if an invalid settings path is
  given (issue #1174).
- Implemented support for automatic redundant alias removal
  (issue #1281).
- Implemented experimental support for floating all imports to
  the top of a file (issue #1228)
- Fixed #1178: support for semicolons in decorators.
- Fixed #1315: Extra newline before comment with -n + --fss.
- Fixed #1192: -k or --keep-direct-and-as-imports option has been
  deprecated as it is now always on.

For more details and breaking changes with release 5:
https://github.com/timothycrosley/isort/blob/master/CHANGELOG.md

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-isort_4.3.21.bb => python3-isort_5.1.0.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_4.3.21.bb => python3-isort_5.1.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
index e0b21ab55..a57b22361 100644
--- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.1.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "A Python utility / library to sort Python imports."
 HOMEPAGE = "https://pypi.python.org/pypi/isort"
 LICENSE = "MIT"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
-SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
+SRC_URI[md5sum] = "9e47f58de573c3fab674a70f0512e9f7"
+SRC_URI[sha256sum] = "b19b7ebce5e292507afa8fab30dd666011dd5ae8f4ef2a2d431751dc84c22140"
 
 inherit pypi setuptools3
 
-- 
2.17.1

