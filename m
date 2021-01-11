Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.36058.1610378728300164912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4R-0006IU-BB; Mon, 11 Jan 2021 17:25:28 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-prompt-toolkit: Upgrade 3.0.9 -> 3.0.10
Date: Mon, 11 Jan 2021 17:25:08 +0200
Message-Id: <20210111152512.23506-6-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.10:

- Improved `WordCompleter`: accept `display_dict`. Also accept
  formatted text for both `display_dict` and `meta_dict`.
- Allow customization of button arrows.
- Correctly recognize backtab on Windows.
- Show original display text in fuzzy completer if no filtering
  was done.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...prompt-toolkit_3.0.9.bb => python3-prompt-toolkit_3.0.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.9.bb => python3-prompt-toolkit_3.0.10.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
index 589d9398d..abd9eb18c 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f"
+SRC_URI[sha256sum] = "b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

