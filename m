Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8777.1624547036611100403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 08:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60152 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwQtV-00022Q-RK; Thu, 24 Jun 2021 18:03:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-astroid: Upgrade 2.5.8 -> 2.6.0
Date: Thu, 24 Jun 2021 18:03:46 +0300
Message-Id: <20210624150347.5849-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.0:

- Appveyor and travis are no longer used in the continuous
  integration
- `setuptools_scm`` has been removed and replaced by ``tbump`` in
  order to not have hidden runtime dependencies to setuptools
- ``NodeNg``, the base node class, is now accessible from
  ``astroid`` or ``astroid.nodes`` as it can be used for typing
- pdate enum brain to improve inference of .name and .value
  dynamic class attributes
- Removed ``Repr``, ``Exec``, and ``Print`` nodes as the ``ast``
  nodes they represented have been removed with the change to
  Python 3
- Deprecate ``Ellipsis`` node. It will be removed with the next
  minor release
- Deprecated ``Index`` and ``ExtSlice`` nodes
- Updated all Match nodes to be internally consistent
- Add ``Pattern`` base class

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.5.8.bb => python3-astroid_2.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.8.bb => python3-astroid_2.6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb b/meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb
index 68165abd1c..e6c485bccf 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "2476b7f0d6cec13f4c1f53b54bea2ce072310ac9fc7acb669d5270190c748042"
+SRC_URI[sha256sum] = "09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb1d794c353c28bfd705"
 
 inherit pypi setuptools3
 
-- 
2.17.1

