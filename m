Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.20974.1617022368297806919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 05:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45152 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQrNs-00036r-FD; Mon, 29 Mar 2021 15:52:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-ruamel-yaml: Upgrade 0.17.0 -> 0.17.2
Date: Mon, 29 Mar 2021 15:52:33 +0300
Message-Id: <20210329125233.12605-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.2:

- change -py2.py3-none-any.whl to -py3-none-any.whl, and remove
  0.17.1
- added 'Programming Language :: Python :: 3 :: Only', and
  removing 0.17.0 from PyPI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-ruamel-yaml_0.17.0.bb => python3-ruamel-yaml_0.17.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.0.bb => python3-ruamel-yaml_0.17.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
index fd99f8566..6f15d1e70 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "3572505e63dd35b5dea62cd0386d03c4f2a53da29a3af09f428114cc85c564aa"
+SRC_URI[sha256sum] = "8f1e15421668b9edf30ed02899f5f81aff9808a4271935776f61a99a569a13da"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

