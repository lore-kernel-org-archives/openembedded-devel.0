Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.22649.1611829763378670629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43042 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l54Y9-00080R-Ni; Thu, 28 Jan 2021 12:29:22 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-prompt-toolkit: Upgrade 3.0.11 -> 3.0.14
Date: Thu, 28 Jan 2021 12:29:00 +0200
Message-Id: <20210128102903.11760-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128102903.11760-1-leon.anavi@konsulko.com>
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.14:

- Disable bell when `PROMPT_TOOLKIT_BELL=false` environment
  variable has been set.
- Improve cancellation of history loading.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.11.bb => python3-prompt-toolkit_3.0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.11.bb => python3-prompt-toolkit_3.0.14.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
index 0b832c064..e5ad069d3 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed"
+SRC_URI[sha256sum] = "7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525"
 
 inherit pypi setuptools3
 
-- 
2.17.1

