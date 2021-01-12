Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.13116.1610474211986216744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 09:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45176 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzNuU-0003G6-CI; Tue, 12 Jan 2021 19:56:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-cffi: Upgrade 1.14.3 -> 1.14.4
Date: Tue, 12 Jan 2021 19:56:41 +0200
Message-Id: <20210112175641.5003-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112175641.5003-1-leon.anavi@konsulko.com>
References: <20210112175641.5003-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.4:

- Release done for pip reasons.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cffi_1.14.3.bb => python3-cffi_1.14.4.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.3.bb => python3-cffi_1.14.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
index dbdd16f66..45962c6ce 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.4.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "c2a47ffd5d183b193ac8ed3414dcfd07"
-SRC_URI[sha256sum] = "f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591"
+SRC_URI[sha256sum] = "1a465cbe98a7fd391d47dce4b8f7e5b921e6cd805ef421d04f5f66ba8f06086c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

