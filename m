Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6932.1617882820789471000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 04:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35416 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUTE9-0002Qi-6Q; Thu, 08 Apr 2021 14:53:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
Date: Thu,  8 Apr 2021 14:53:27 +0300
Message-Id: <20210408115330.7708-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.4:

- prevent (empty) comments from throwing assertion error
- fix for issue 382 caused by an error in a format string
- allow expansion of aliases by setting
  ``yaml.composer.return_alias = lambda s: copy.deepcopy(s)``

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-ruamel-yaml_0.17.2.bb => python3-ruamel-yaml_0.17.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.2.bb => python3-ruamel-yaml_0.17.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
index 6f15d1e70..2543269fc 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8f1e15421668b9edf30ed02899f5f81aff9808a4271935776f61a99a569a13da"
+SRC_URI[sha256sum] = "44bc6b54fddd45e4bc0619059196679f9e8b79c027f4131bb072e6a22f4d5e28"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

