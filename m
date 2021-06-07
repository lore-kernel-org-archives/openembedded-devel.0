Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.36111.1623073924458190351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 06:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57048 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lqFfc-0004lo-3Z; Mon, 07 Jun 2021 16:52:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-fasteners: Upgrade 0.16 -> 0.16.1
Date: Mon,  7 Jun 2021 16:51:50 +0300
Message-Id: <20210607135151.15783-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607135151.15783-1-leon.anavi@konsulko.com>
References: <20210607135151.15783-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.1:

- Force utf-8 when reading readme

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-fasteners_0.16.bb => python3-fasteners_0.16.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.16.bb => python3-fasteners_0.16.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb
index eed8d2c957..4b33a9ec69 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb
@@ -3,6 +3,11 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "c995d8c26b017c5d6a6de9ad29a0f9cdd57de61ae1113d28fac26622b06a0933"
+SRC_URI[sha256sum] = "b6f488d0fc9a3591a32d779400a00c3ebfadd41f45eb024d66f15a6c4e1c4a72"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-fcntl \
+"
-- 
2.17.1

