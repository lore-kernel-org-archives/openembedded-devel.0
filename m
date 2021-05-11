Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1808.1620751949550578194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lgVcS-0007jj-1L; Tue, 11 May 2021 19:52:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-robotframework: Upgrade 4.0.1 -> 4.0.2
Date: Tue, 11 May 2021 19:52:16 +0300
Message-Id: <20210511165217.18433-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511165217.18433-1-leon.anavi@konsulko.com>
References: <20210511165217.18433-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.2:

- Using Union containing generics as type hint causes an error
- Libdoc does not anymore work with resource files in PYTHONPATH
- Rebot removes sourcename attribute from <kw> in output.xml
- Run Keyword If Test Failed does not work correctly if it is not
  first keyword in teardown and test is skipped
- Argument conversion problems when type hint is ABC

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
index 3e5d67e0a4..67ebe3ee69 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "9fa609ceb78f67b1476edce8a7011b16bf3ab41c0fb8c211de6c99955eaf9fde"
+SRC_URI[sha256sum] = "efd39558219fddc86473d4d390aeaec60640d7a7567a15fd51c0576f20e46171"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

