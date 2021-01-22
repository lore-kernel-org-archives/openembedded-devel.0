Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6840.1611310314150233899
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52170 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2tPx-0000CW-C2; Fri, 22 Jan 2021 12:11:53 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-prompt-toolkit: Upgrade 3.0.10 -> 3.0.11
Date: Fri, 22 Jan 2021 12:11:26 +0200
Message-Id: <20210122101126.25982-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122101126.25982-1-leon.anavi@konsulko.com>
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.11:

- Poll terminal size: better handle resize events when the
  application runs in a thread other than the main thread (where
  handling SIGWINCH doesn't work) or in the Windows console.
- Fix bug in system toolbar. The execution of system commands was
  broken.
- A refactoring of patch_stdout that includes several fixes.
- A refactoring of the `ThreadedHistory`, which includes several
  fixes, in particular a race condition that happened when editing
  input while a big history was still being loaded in the
  background.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.10.bb => python3-prompt-toolkit_3.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.10.bb => python3-prompt-toolkit_3.0.11.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
index abd9eb18c..0b832c064 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5"
+SRC_URI[sha256sum] = "dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed"
 
 inherit pypi setuptools3
 
-- 
2.17.1

