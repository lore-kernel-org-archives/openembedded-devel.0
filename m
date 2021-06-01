Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.55568.1622542000089470506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 03:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49790 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lo1IE-0002gA-RQ; Tue, 01 Jun 2021 13:06:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-ruamel-yaml: Upgrade 0.17.4 -> 0.17.7
Date: Tue,  1 Jun 2021 13:06:31 +0300
Message-Id: <20210601100631.3277-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601100631.3277-1-leon.anavi@konsulko.com>
References: <20210601100631.3277-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.7:

- issue 385 also affected other deprecated loaders
- merged type annotations update provided by Jochen Sprickerhof
- fix for issue 385: deprecated round_trip_loader function not
  working
- fix for issue 384 !!set with aliased entry resulting in broken
  YAML on rt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-ruamel-yaml_0.17.4.bb => python3-ruamel-yaml_0.17.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.4.bb => python3-ruamel-yaml_0.17.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb
index 2543269fc..5da0ac3fc 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.7.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "44bc6b54fddd45e4bc0619059196679f9e8b79c027f4131bb072e6a22f4d5e28"
+SRC_URI[sha256sum] = "5c3fa739bbedd2f23769656784e671c6335d17a5bf163c3c3901d8663c0af287"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

