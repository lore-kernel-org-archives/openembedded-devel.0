Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.81950.1629448958919138625
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59332 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mH06i-0004p8-RI; Fri, 20 Aug 2021 11:42:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-regex: Upgrade 2021.7.6 -> 2021.8.3
Date: Fri, 20 Aug 2021 11:42:16 +0300
Message-Id: <20210820084216.23017-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210820084216.23017-1-leon.anavi@konsulko.com>
References: <20210820084216.23017-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.8.3:

- re.sub and re.findall freeze with regex, but not old re
- regex's `Match` and `Pattern` types do not act as generics

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2021.7.6.bb => python3-regex_2021.8.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.7.6.bb => python3-regex_2021.8.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb b/meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb
index 09f98112f9..2c35faf553 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.8.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8394e266005f2d8c6f0bc6780001f7afa3ef81a7a2111fa35058ded6fce79e4d"
+SRC_URI[sha256sum] = "8935937dad2c9b369c3d932b0edbc52a62647c2afb2fafc0c280f14a8bf56a6a"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.17.1

