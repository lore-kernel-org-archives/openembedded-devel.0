Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.12226.1603795222347222246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXMOr-0001vr-BL; Tue, 27 Oct 2020 12:40:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-markdown: Upgrade 3.3.2 -> 3.3.3
Date: Tue, 27 Oct 2020 12:40:12 +0200
Message-Id: <20201027104013.11394-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027104013.11394-1-leon.anavi@konsulko.com>
References: <20201027104013.11394-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.3:

- Unify all block-level tags
- Fix issue where some empty elements would have text rendered
  as None when using md_in_html
- Avoid catastrophic backtracking in hr regex
- Fix hr HTML handling

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.3.2.bb => python3-markdown_3.3.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.2.bb => python3-markdown_3.3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
index d8d5304264..990544cf1b 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[md5sum] = "4bdebf1b5c64286c2214c99120da4292"
-SRC_URI[sha256sum] = "4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011"
+SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
+SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

