Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41350.1597663771912654616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKU-000361-9g; Mon, 17 Aug 2020 14:29:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-xlsxwriter: Upgrade 1.3.2 -> 1.3.3
Date: Mon, 17 Aug 2020 14:29:01 +0300
Message-Id: <20200817112901.28914-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.3:

- Added :func:`ignore_errors()` worksheet method to to allow Excel
  worksheet errors/warnings to be ignored in user defined ranges.
  See also :ref:`ex_ignore_errors`.
- Added warning when closing a file more than once via
  :func:`close()` to help avoid errors where a file is closed
  within a loop or at the wrong scope level.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.2.bb => python3-xlsxwriter_1.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.2.bb => python3-xlsxwriter_1.3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
index 76f5d1622..e2a304437 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "78fccd0e056f3c1c474e13eec54ce30d"
-SRC_URI[sha256sum] = "3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb"
+SRC_URI[md5sum] = "7c7191afe3149e41dca0e17d535421fb"
+SRC_URI[sha256sum] = "830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

