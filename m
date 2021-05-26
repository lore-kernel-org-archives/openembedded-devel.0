Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3797.1622064791269017166
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19H-0000vH-NM; Thu, 27 May 2021 00:33:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-flask-wtf: Upgrade 0.14.3 -> 0.15.1
Date: Thu, 27 May 2021 00:32:44 +0300
Message-Id: <20210526213248.10348-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526213248.10348-1-leon.anavi@konsulko.com>
References: <20210526213248.10348-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.15.1:

- Add python_requires metadata to avoid installing on unsupported
  Python versions.
- Drop support for Python < 3.6.
- FileSize validator.
- Extra requirement email installs the email_validator package.
- Fixed Flask 2.0 warnings.
- Various documentation fixes.
- Various CI fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-flask-wtf_0.14.3.bb => python3-flask-wtf_0.15.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.14.3.bb => python3-flask-wtf_0.15.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb
index 213a0b58b..84b2a9e27 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.15.1.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
 
-SRC_URI[md5sum] = "1b60b7dd1245b0d0173c21123717af61"
-SRC_URI[sha256sum] = "d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720"
+SRC_URI[sha256sum] = "ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc"
 
 PYPI_PACKAGE = "Flask-WTF"
 
-- 
2.17.1

