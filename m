Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7875.1625222532425161003
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jul 2021 03:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37340 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lzGca-00010S-Qf; Fri, 02 Jul 2021 13:42:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-priority: Upgrade 1.3.0 -> 2.0.0
Date: Fri,  2 Jul 2021 13:42:04 +0300
Message-Id: <20210702104204.8078-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Python 3.6 is the minimal support Python version.
- Support for Python 3.7 has been added.
- Support for Python 3.8 has been added.
- Support for Python 3.9 has been added.
- Support for Python 2.7 has been removed.
- Support for Python 3.3 has been removed.
- Support for Python 3.4 has been removed.
- Support for Python 3.5 has been removed.
- Support for PyPy (Python 2.7 compatible) has been removed.
- Add type hints throughout and support PEP 561 via a py.typed
  file. This should allow projects to type check their usage of
  this dependency.
- Throw TypeError when creating a priority tree with a
  maximum_streams value that is not an integer.
- Throw ValueError when creating a priority tree with a
  maximum_streams value that is not a positive integer.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-priority_1.3.0.bb => python3-priority_2.0.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-priority/{python3-priority_1.3.0.bb => python3-priority_2.0.0.bb} (63%)

diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
similarity index 63%
rename from meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
rename to meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
index 5d84571f9f..93b694c8b8 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
 
-SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
-SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
+SRC_URI[sha256sum] = "c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0"
 
 inherit pypi setuptools3
-- 
2.17.1

