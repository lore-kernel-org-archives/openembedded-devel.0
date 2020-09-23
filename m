Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8083.1600847937819884324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzfy-0005D6-EA; Wed, 23 Sep 2020 10:58:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-xlsxwriter: Upgrade 1.3.4 -> 1.3.5
Date: Wed, 23 Sep 2020 10:58:29 +0300
Message-Id: <20200923075830.30859-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.5:

- Fixed issue where relative url links in images didn't work.
- Added ``use_zip64`` as a constructor option.
- Added check, and warning, for worksheet tables with no data row.
  Either with or without a header row.
- Add a warning when the string length in
  :func:`write_rich_string()` exceeds Excel's limit.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.4.bb => python3-xlsxwriter_1.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.4.bb => python3-xlsxwriter_1.3.5.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
index 61a9c69b51..b4b0e2eb2e 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "7ea11261cbd5c763d106eea64471cf2f"
-SRC_URI[sha256sum] = "d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd"
+SRC_URI[md5sum] = "0b65976905bf3841bc6cae3f8c47295b"
+SRC_URI[sha256sum] = "de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

