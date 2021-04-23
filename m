Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6837.1619165023063506860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 01:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47740 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZqmq-00018D-2G; Fri, 23 Apr 2021 11:03:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-xlsxwriter: Upgrade 1.3.9 -> 1.4.0
Date: Fri, 23 Apr 2021 11:03:26 +0300
Message-Id: <20210423080326.6577-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423080326.6577-1-leon.anavi@konsulko.com>
References: <20210423080326.6577-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.0:

- Add fix for issue for where a y_axis font rotation of 0 was
  ignored.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-xlsxwriter_1.3.9.bb => python3-xlsxwriter_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.9.bb => python3-xlsxwriter_1.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb
index e53dd4d5b9..b5e15f14c9 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb
@@ -8,6 +8,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[sha256sum] = "eca2e737d0b8df3cd72520fadcda9f48c3581282639965125a86ea8cd04620cf"
+SRC_URI[sha256sum] = "82be5a58c09bdc2ff8afc25acc815c465275239ddfc56d6e7b2a7e6c5d2e213b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

