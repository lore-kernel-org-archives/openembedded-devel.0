Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12548.1600174496718723222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 05:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47684 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kIAU2-0005Ha-V2; Tue, 15 Sep 2020 15:54:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-msk: Upgrade 0.3.15 -> 0.3.16
Date: Tue, 15 Sep 2020 15:54:47 +0300
Message-Id: <20200915125447.14197-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915125447.14197-1-leon.anavi@konsulko.com>
References: <20200915125447.14197-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.16:

- Ensure local HEAD matches remote during upgrade
- Remove typing dependency - only required for Python <= 3.4
- Include license file in sdist package
- Add default icon and color during Skill creation
- Improved category selection and display
- Improve PyPI listing info

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-msk_0.3.15.bb => python3-msk_0.3.16.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msk_0.3.15.bb => python3-msk_0.3.16.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
rename to meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
index af011ccf8..a3206f79b 100644
--- a/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
+++ b/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
 
-SRC_URI[md5sum] = "dcb286c489d24d8b0fb8413835f7478a"
-SRC_URI[sha256sum] = "56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5"
+SRC_URI[md5sum] = "8a4fc92a074544f81f482da2c21ef989"
+SRC_URI[sha256sum] = "c6a717fc068f7c69ddc8cb21dbeeda7cfa97a4e9f41690459c9fbec68b16ee87"
 
 inherit pypi setuptools3
 
-- 
2.17.1

