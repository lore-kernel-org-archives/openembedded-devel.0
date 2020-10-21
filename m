Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.10265.1603278978742612105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6L-0007Sd-BM; Wed, 21 Oct 2020 14:16:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-markdown: Upgrade 3.3.1 -> 3.3.2
Date: Wed, 21 Oct 2020 14:16:07 +0300
Message-Id: <20201021111609.28237-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.2:

- Properly parse inline HTML in md_in_html
- Account for Etree Elements in HTML Stash

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.3.1.bb => python3-markdown_3.3.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.1.bb => python3-markdown_3.3.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
index 8c6830b47d..d8d5304264 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[md5sum] = "c7b68676df277df34342bb9a27f7fe30"
-SRC_URI[sha256sum] = "c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6"
+SRC_URI[md5sum] = "4bdebf1b5c64286c2214c99120da4292"
+SRC_URI[sha256sum] = "4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

