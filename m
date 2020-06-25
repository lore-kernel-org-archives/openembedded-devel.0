Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6535.1593076130231643644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNsG-0005y7-Ro; Thu, 25 Jun 2020 12:08:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/12] python3-astroid: Upgrade 2.3.3 -> 2.4.2
Date: Thu, 25 Jun 2020 12:07:19 +0300
Message-Id: <20200625090719.16068-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.2:

- `FunctionDef.is_generator` properly handles `yield` nodes in
  `While` tests
- Properly construct the arguments of infered property descriptors
- Handle the case where the raw builder fails to retrieve the
  ``__all__`` attribute
- Restructure the AST parsing heuristic to always pick the same
  module
- Do not crash with SyntaxError when parsing namedtuples with
  invalid label
- Expose a ast_from_string method in AstroidManager, which will
  accept source code as a string and return the corresponding
  astroid object
- Prevent a recursion error to happen when inferring the declared
  metaclass of a class

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.3.3.bb => python3-astroid_2.4.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.3.3.bb => python3-astroid_2.4.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
index dc1ce0eb4..677cec7ac 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
-SRC_URI[sha256sum] = "71ea07f44df9568a75d0f354c49143a4575d90645e9fead6dfb52c26a85ed13a"
+SRC_URI[md5sum] = "b54e1325995d3a9abd84bac91d4d5867"
+SRC_URI[sha256sum] = "2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703"
 
 inherit pypi setuptools3
 
-- 
2.17.1

