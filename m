Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5138.1623836058548864502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ltRw7-0004CE-62; Wed, 16 Jun 2021 12:34:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-astroid: Upgrade 2.5.7 -> 2.5.8
Date: Wed, 16 Jun 2021 12:34:05 +0300
Message-Id: <20210616093408.19873-2-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.8:

- Improve support for Pattern Matching
- Add lineno and col_offset for ``Keyword`` nodes and Python 3.9+
- Add global inference cache to speed up inference of long
  statement blocks
- Add a limit to the total number of nodes inferred indirectly as
  a result of inferring some node

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.5.7.bb => python3-astroid_2.5.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.7.bb => python3-astroid_2.5.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb
index c805dc4dc9..68165abd1c 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.8.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "d66a600e1602736a0f24f725a511b0e50d12eb18f54b31ec276d2c26a0a62c6a"
+SRC_URI[sha256sum] = "2476b7f0d6cec13f4c1f53b54bea2ce072310ac9fc7acb669d5270190c748042"
 
 inherit pypi setuptools3
 
-- 
2.17.1

