Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.42493.1600695858180772765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKM76-0004UL-Eq; Mon, 21 Sep 2020 16:44:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-xlsxwriter: Upgrade 1.3.3 -> 1.3.4
Date: Mon, 21 Sep 2020 16:44:04 +0300
Message-Id: <20200921134405.676-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921134405.676-1-leon.anavi@konsulko.com>
References: <20200921134405.676-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.4:

- Replaced internal MD5 digest used to check for duplicate images
  with a SHA256 digest to avoid issues on operating systems such
  as Red Hat in FIPS mode which don't support MD5 for security
  reasons

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.3.bb => python3-xlsxwriter_1.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.3.bb => python3-xlsxwriter_1.3.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
index e2a304437d..61a9c69b51 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.4.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "7c7191afe3149e41dca0e17d535421fb"
-SRC_URI[sha256sum] = "830cad0a88f0f95e5a8945ee082182aa68ab89e7d9725d0c32c196207634244b"
+SRC_URI[md5sum] = "7ea11261cbd5c763d106eea64471cf2f"
+SRC_URI[sha256sum] = "d804881beb944c4fd73deed0ef2666b84437f30d72bdc1b3a6f0230458facbfd"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

