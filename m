Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5140.1623836059189767611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ltRw9-0004CE-GF; Wed, 16 Jun 2021 12:34:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-ruamel-yaml: Upgrade 0.17.7 -> 0.17.9
Date: Wed, 16 Jun 2021 12:34:08 +0300
Message-Id: <20210616093408.19873-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093408.19873-1-leon.anavi@konsulko.com>
References: <20210616093408.19873-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.9:

- Fix issue with updating CommentedMap

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-ruamel-yaml_0.17.7.bb => python3-ruamel-yaml_0.17.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.7.bb => python3-ruamel-yaml_0.17.9.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb
index 5da0ac3fca..30306410da 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.9.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "5c3fa739bbedd2f23769656784e671c6335d17a5bf163c3c3901d8663c0af287"
+SRC_URI[sha256sum] = "374373b4743aee9f6d9f40bea600fe020a7ac7ae36b838b4a6a93f72b584a14c"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

