Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13396.1614269158882041155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54856 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFJ9D-0004JR-Cx; Thu, 25 Feb 2021 18:05:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-markdown: Upgrade 3.3.3 -> 3.3.4
Date: Thu, 25 Feb 2021 18:05:40 +0200
Message-Id: <20210225160544.8994-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.4:

- Properly parse unclosed tags in code spans
- Properly parse processing instructions in md_in_html
- Properly parse code spans in md_in_html
- Preserve text immediately before an admonition
- Simplified regex for HTML placeholders addressing
- Ensure permalinks and ankorlinks are not restricted by toc_depth

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
index 990544cf1b..b51e8eef17 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
-SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
+SRC_URI[sha256sum] = "31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

