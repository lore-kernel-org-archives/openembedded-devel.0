Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.7258.1625582950848288158
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m0mNn-0003Bp-GG; Tue, 06 Jul 2021 17:49:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-astroid: Upgrade 2.6.0 -> 2.6.2
Date: Tue,  6 Jul 2021 17:48:59 +0300
Message-Id: <20210706144901.30020-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.2:

- Fix a crash when the inference of the length of a node failed
- Fix unhandled StopIteration during inference, following the
  implementation of PEP479 in python 3.7+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.6.0.bb => python3-astroid_2.6.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.6.0.bb => python3-astroid_2.6.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb
index e6c485bccf..88a7c49499 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb1d794c353c28bfd705"
+SRC_URI[sha256sum] = "38b95085e9d92e2ca06cf8b35c12a74fa81da395a6f9e65803742e6509c05892"
 
 inherit pypi setuptools3
 
-- 
2.17.1

