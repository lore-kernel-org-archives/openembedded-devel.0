Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.36060.1610378730320701206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4T-0006IU-Ic; Mon, 11 Jan 2021 17:25:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-jedi: Upgrade 0.17.2 -> 0.18.0
Date: Mon, 11 Jan 2021 17:25:11 +0200
Message-Id: <20210111152512.23506-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.18.0:

- Dropped Python 2 and Python 3.5
- Using pathlib.Path() as an output instead of str in most places:
  - Project.path - Script.path - Definition.module_path
  - Refactoring.get_renames - Refactoring.get_changed_files
- Functions with @property now return property instead of function
  in Name().type
- Started using annotations
- Better support for the walrus operator
- Project attributes are now read accessible
- Removed all deprecations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-jedi_0.17.2.bb => python3-jedi_0.18.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.17.2.bb => python3-jedi_0.18.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
index aa5e69874..6c857f09e 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[md5sum] = "f012668907d76cebe9c4766f3b806fcf"
-SRC_URI[sha256sum] = "86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20"
+SRC_URI[sha256sum] = "92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-parso"
 
-- 
2.17.1

