Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9088.1618991943180136409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZ7lB-0002oU-DQ; Wed, 21 Apr 2021 10:59:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-asttokens: Upgrade 2.0.4 -> 2.0.5
Date: Wed, 21 Apr 2021 10:58:41 +0300
Message-Id: <20210421075843.17725-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421075843.17725-1-leon.anavi@konsulko.com>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.5:

- setup.cfg: remove wheel dependency
- Handle starred expressions in tests
- Make 3.9 support official
- pypy2 instead of pypy2.7
- pypy3 instead of pypy3.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asttokens_2.0.4.bb => python3-asttokens_2.0.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.4.bb => python3-asttokens_2.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
index c2149336fd..429a56bae6 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15b8842b027eec5128"
+SRC_URI[sha256sum] = "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7ccd0ee3ee35cf4d5"
 
 DEPENDS += "\
     python3-setuptools-scm-native \
-- 
2.17.1

