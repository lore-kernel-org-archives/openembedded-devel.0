Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3708.1618471363859931295
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 00:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWwKn-00077s-Kb; Thu, 15 Apr 2021 10:22:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-xlsxwriter: Upgrade 1.3.8 -> 1.3.9
Date: Thu, 15 Apr 2021 10:22:30 +0300
Message-Id: <20210415072230.5957-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415072230.5957-1-leon.anavi@konsulko.com>
References: <20210415072230.5957-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.9:

- Added option to set row heights and column widths in pixels via
  the :func:`set_row_pixels` and :func:`set_column_pixels` methods

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-xlsxwriter_1.3.8.bb => python3-xlsxwriter_1.3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.8.bb => python3-xlsxwriter_1.3.9.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb
index e89221e5c3..e53dd4d5b9 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb
@@ -8,6 +8,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[sha256sum] = "2b7e22b1268c2ed85d73e5629097c9a63357f2429667ada9863cd05ff8ee33aa"
+SRC_URI[sha256sum] = "eca2e737d0b8df3cd72520fadcda9f48c3581282639965125a86ea8cd04620cf"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

