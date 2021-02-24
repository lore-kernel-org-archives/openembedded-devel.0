Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5618.1614165923118809404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56972 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEsIC-000137-Lz; Wed, 24 Feb 2021 13:25:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cffi: Upgrade 1.14.4 -> 1.14.5
Date: Wed, 24 Feb 2021 13:25:10 +0200
Message-Id: <20210224112512.31406-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224112512.31406-1-leon.anavi@konsulko.com>
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.5:

- Source fix for old gcc version
- This and future releases should include wheels on more platforms

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cffi_1.14.4.bb => python3-cffi_1.14.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.4.bb => python3-cffi_1.14.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
index 45962c6ce8..16928f0dbc 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c"
+SRC_URI[sha256sum] = "fd78e5fee591709f32ef6edb9a015b4aa1a5022598e36227500c8f4e02328d9c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

