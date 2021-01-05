Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6811.1609859817857744966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4p-0007qz-E7; Tue, 05 Jan 2021 17:16:52 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-prompt-toolkit: Upgrade 3.0.8 -> 3.0.9
Date: Tue,  5 Jan 2021 17:16:34 +0200
Message-Id: <20210105151638.15700-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.9:

- Handle c-tab for TERM=linux.
- Improve rendering speed of `print_formatted_text`. (Don't render
  styling attributes to output between fragments that have
  identical styling.)
- Gracefully handle `FileHistory` decoding errors.
- Prevent asyncio deprecation warnings.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...prompt-toolkit_3.0.8.bb => python3-prompt-toolkit_3.0.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.8.bb => python3-prompt-toolkit_3.0.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
index 0debba48d2..589d9398d0 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "cf3ca19873fa9e7f6162296cf6bae419"
-SRC_URI[sha256sum] = "25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c"
+SRC_URI[sha256sum] = "c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

