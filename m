Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.45441.1624273125317064743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54610 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvHdR-0001ID-Pq; Mon, 21 Jun 2021 13:58:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-elementpath: Upgrade 2.2.2 -> 2.2.3
Date: Mon, 21 Jun 2021 13:58:23 +0300
Message-Id: <20210621105825.28736-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621105825.28736-1-leon.anavi@konsulko.com>
References: <20210621105825.28736-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.3:

- Add Python 3.10 in Tox and CI tests
- Apply __slots__ to TDOP and regex classes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-elementpath_2.2.2.bb => python3-elementpath_2.2.3.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.2.2.bb => python3-elementpath_2.2.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb
index c793592bea..2d9c53172d 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb
@@ -3,9 +3,13 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "68de07c1aec3b1d33126111252cc699600dd1e45802625344aa6eb9e680ef157"
+SRC_URI[sha256sum] = "60139b91ef9646e27381fd62b8c38f1fc8ebc78dc4bc231c08c51240062e58e6"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-xml \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

