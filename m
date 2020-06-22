Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14349.1592822173975759737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJoA-0005ty-P1; Mon, 22 Jun 2020 13:36:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-msk: Upgrade 0.3.13 -> 0.3.15
Date: Mon, 22 Jun 2020 13:35:38 +0300
Message-Id: <20200622103542.27830-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 0.3.15:

- Switch Github authentication to utilize Personal Access Tokens
  as the existing username and password method is being
  deprecated.
- Fix handling of --repo-cache argument.
- Query for name and e-mail if missing.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-msk_0.3.13.bb => python3-msk_0.3.15.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msk_0.3.13.bb => python3-msk_0.3.15.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
rename to meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
index 3f2aaf48d..af011ccf8 100644
--- a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
+++ b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
 
-SRC_URI[md5sum] = "11d9fc865ef627efe68f25fc113974e8"
-SRC_URI[sha256sum] = "55be86ff2cd0087016759f2b15b40861cda2a8d8a8d0c669fdacdf32a77a10da"
+SRC_URI[md5sum] = "dcb286c489d24d8b0fb8413835f7478a"
+SRC_URI[sha256sum] = "56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

