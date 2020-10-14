Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6469.1602660784368901610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36146 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSbHR-00067Q-7K; Wed, 14 Oct 2020 10:33:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-markdown: Upgrade 3.3 -> 3.3.1
Date: Wed, 14 Oct 2020 10:32:52 +0300
Message-Id: <20201014073256.9605-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.1:

- Correctly parse raw script and style tags
- Ensure consistent class handling by fenced_code and codehilite

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.3.bb => python3-markdown_3.3.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.bb => python3-markdown_3.3.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
index db8311be5d..8c6830b47d 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[md5sum] = "76eb34a058bb8b637ccadc4ce384bae4"
-SRC_URI[sha256sum] = "4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc"
+SRC_URI[md5sum] = "c7b68676df277df34342bb9a27f7fe30"
+SRC_URI[sha256sum] = "c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

