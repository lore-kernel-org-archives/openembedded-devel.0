Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.67278.1629367261161638769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 03:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35534 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGeqx-00066X-3I; Thu, 19 Aug 2021 13:00:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-ruamel-yaml: Upgrade 0.17.10 -> 0.17.11
Date: Thu, 19 Aug 2021 13:00:45 +0300
Message-Id: <20210819100046.24493-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.17.11:

- fix error baseclass for ``DuplicateKeyErorr``
- fix typo in reader error message, causing `KeyError` during
  reader error

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-ruamel-yaml_0.17.10.bb => python3-ruamel-yaml_0.17.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.10.bb => python3-ruamel-yaml_0.17.11.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb
index ec29436b79..8423a89294 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.11.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "106bc8d6dc6a0ff7c9196a47570432036f41d556b779c6b4e618085f57e39e67"
+SRC_URI[sha256sum] = "b5e96c0a6619830a7733099f0599b56556a963c6114ef64d0ddb4673347b426f"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.17.1

