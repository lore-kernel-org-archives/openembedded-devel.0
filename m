Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5873.1614863169001049776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lHng4-0000xG-NI; Thu, 04 Mar 2021 15:06:06 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ipython: Upgrade 7.20.0 -> 7.21.0
Date: Thu,  4 Mar 2021 15:05:50 +0200
Message-Id: <20210304130554.32308-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.21.0:

- New "context" command in ipdb
- Fix some issues on new osx-arm64
- Compatibility with Xeus-Python for debugger protocol
- Misc docs fixes for compatibility and uniformity with Numpydoc

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.20.0.bb => python3-ipython_7.21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.20.0.bb => python3-ipython_7.21.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
index 42795b9bfd..31ea244e34 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e"
+SRC_URI[sha256sum] = "04323f72d5b85b606330b6d7e2dc8d2683ad46c3905e955aa96ecc7a99388e70"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

