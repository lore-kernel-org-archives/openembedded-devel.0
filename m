Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3455.1591866571977475396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJDG-0007qt-0x; Thu, 11 Jun 2020 12:09:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-pint: Upgrade 0.11 -> 0.12
Date: Thu, 11 Jun 2020 12:09:00 +0300
Message-Id: <20200611090904.29772-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.12. Fix link to the homepage, add a summary.
The new release brings:

- Add full support for Decimal and Fraction at the registry level.
- NaN is now treated the same as zero in addition, subtraction,
  equality, and disequality
- New implementation of 'Lx' String Format Type Option
- Bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pint_0.11.bb => python3-pint_0.12.bb}       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.11.bb => python3-pint_0.12.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-pint_0.11.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.12.bb
index d37da7c6a..626af0554 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
@@ -1,5 +1,6 @@
-DESCRIPTION = "Interval arithmetic for Python"
-HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
+SUMMARY = "Physical quantities module"
+DESCRIPTION = "Physical quantities Python module"
+HOMEPAGE = "https://github.com/hgrecco/pint"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
@@ -9,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
-SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
+SRC_URI[md5sum] = "0af699bc0ccdff56228b4a81216b4f7d"
+SRC_URI[sha256sum] = "dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

