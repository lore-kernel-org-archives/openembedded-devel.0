Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.24661.1629123161989570447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 07:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57306 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mFdLw-0005El-5v; Mon, 16 Aug 2021 17:12:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-astroid: Upgrade 2.6.6 -> 2.7.0
Date: Mon, 16 Aug 2021 17:12:29 +0300
Message-Id: <20210816141231.13824-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.0:

- Import from ``astroid.node_classes`` and ``astroid.scoped_nodes``
  has been deprecated in favor of ``astroid.nodes``. Only the
  imports from ``astroid.nodes`` will work in astroid 3.0.0.
- Add support for arbitrary Enum subclass hierachies
- Add inference tips for dataclass attributes, including
  dataclasses.field calls. Also add support for InitVar.
- Adds a brain that deals with dynamic import of
  `IsolatedAsyncioTestCase` class of the `unittest` module.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.6.6.bb => python3-astroid_2.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.6.6.bb => python3-astroid_2.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb b/meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb
index 10851039b3..f95c5138cc 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "3975a0bd5373bdce166e60c851cfcbaf21ee96de80ec518c1f4cb3e94c3fb334"
+SRC_URI[sha256sum] = "1472a98322b64869b9dc95007a0fbbaa71d580e3c8abf73c989b740873c673f3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

