Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13427.1589984114620308147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 07:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47208 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbPV3-0004ak-6u; Wed, 20 May 2020 17:15:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-markdown: Upgrade to 3.2.2
Date: Wed, 20 May 2020 17:15:00 +0300
Message-Id: <20200520141502.28254-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520141502.28254-1-leon.anavi@konsulko.com>
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-markdown_3.0.1.bb => python3-markdown_3.2.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.0.1.bb => python3-markdown_3.2.2.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
index cdfe5496a..ce5dde63e 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2/Markdown-${PV}.tar.gz"
-SRC_URI[md5sum] = "72219f46ca440b657bf227500731bdf1"
-SRC_URI[sha256sum] = "d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz"
+SRC_URI[md5sum] = "6e8daf1e566bf3572c137ada399fe40b"
+SRC_URI[sha256sum] = "1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

