Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.36245.1629793115444694832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45220 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mIRda-0003rk-Jm; Tue, 24 Aug 2021 11:18:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-ruamel-yaml: Upgrade 0.17.11 -> 0.17.13
Date: Tue, 24 Aug 2021 11:18:13 +0300
Message-Id: <20210824081816.1806-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824081816.1806-1-leon.anavi@konsulko.com>
References: <20210824081816.1806-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.13:

- minor fix in attr handling
- fix issue with anchor on registered class not preserved and
  those classes using package attrs with @attr.s()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-ruamel-yaml_0.17.11.bb => python3-ruamel-yaml_0.17.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.11.bb => python3-ruamel-yaml_0.17.13.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb
index 8423a89294..d28e8a12fe 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b5e96c0a6619830a7733099f0599b56556a963c6114ef64d0ddb4673347b426f"
+SRC_URI[sha256sum] = "02f0ed93e98ea32498d25a2952635bbd9fabd553599b8ad67724b4ac88dd8f6c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.17.1

