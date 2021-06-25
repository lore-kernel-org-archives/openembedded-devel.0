Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5528.1624616164775435295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisK-0005zp-Cx; Fri, 25 Jun 2021 13:15:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-ruamel-yaml: Upgrade 0.17.9 -> 0.17.10
Date: Fri, 25 Jun 2021 13:15:40 +0300
Message-Id: <20210625101545.30040-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.10:

- Bug fix: token with old comment structure != two elements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ruamel-yaml_0.17.9.bb => python3-ruamel-yaml_0.17.10.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.9.bb => python3-ruamel-yaml_0.17.10.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb
index 30306410da..3414ed097b 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.10.bb
@@ -8,9 +8,11 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-BBCLASSEXTEND = "native nativesdk"
+SRC_URI[sha256sum] = "106bc8d6dc6a0ff7c9196a47570432036f41d556b779c6b4e618085f57e39e67"
 
-SRC_URI[sha256sum] = "374373b4743aee9f6d9f40bea600fe020a7ac7ae36b838b4a6a93f72b584a14c"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-shell \
+"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

