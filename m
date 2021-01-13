Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8608.1610547997720152737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6V-0000Li-K8; Wed, 13 Jan 2021 16:26:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-isort: Upgrade 5.6.4 -> 5.7.0
Date: Wed, 13 Jan 2021 16:26:17 +0200
Message-Id: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.7.0:

- In rare circumstances an extra comma is added after import
  and before comment.
- isort encounters bug in Python 3.6.0.
- Provide ways for extension formatting and file paths to be
  specified when using streaming input from CLI.
- Ability to output and diff within a single API call to
  isort.file.
- Better more useful fatal error messages.
- Support for automatically fixing mixed indentation of import
  sections.
- Added a CLI option for skipping symlinks.
- Support for disabling float_to_top from the command line.
- Allow toggling section comments on and off for indented import
  sections.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.6.4.bb => python3-isort_5.7.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.6.4.bb => python3-isort_5.7.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
index 66a5332be..9f234ee46 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.7.0.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "d2dfc32943b1d64311facec6a05c2f98"
-SRC_URI[sha256sum] = "dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58"
+SRC_URI[sha256sum] = "c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

