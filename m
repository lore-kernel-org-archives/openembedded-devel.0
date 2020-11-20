Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.22871.1605864565970725865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 01:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40904 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kg2jM-0006cP-Rk; Fri, 20 Nov 2020 11:29:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-toml: Upgrade 0.10.1 -> 0.10.2
Date: Fri, 20 Nov 2020 11:29:10 +0200
Message-Id: <20201120092910.30736-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120092910.30736-1-leon.anavi@konsulko.com>
References: <20201120092910.30736-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.10.2:

- Added toml.dump example to Quick Tutorial
- Skip numpy tests when numpy is not available
- Bug fix: ids were based on the string, rather than the actual
  object which causes incorrect detection of circular references
- Show meaningful error message for wrong case booleans
- Bug fix: broken quoted section name starts with dot

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-toml_0.10.1.bb => python3-toml_0.10.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-toml_0.10.1.bb => python3-toml_0.10.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
index 00f38c6c3b..b46eba6fd1 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
 
-SRC_URI[md5sum] = "743131c431419fe42f854cff02ad3abe"
-SRC_URI[sha256sum] = "926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f"
+SRC_URI[sha256sum] = "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

