Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.51005.1612265204801502599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 03:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41580 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6tpS-0007Xh-UG; Tue, 02 Feb 2021 13:26:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-ipython: Upgrade 7.19.0 -> 7.20.0
Date: Tue,  2 Feb 2021 13:26:34 +0200
Message-Id: <20210202112636.30651-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202112636.30651-1-leon.anavi@konsulko.com>
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.20.0:

- Support for PyQt5 >= 5.11
- %reset remove imports more agressively
- fix the %conda magic
- compatibility with Jedi 0.18, and bump minimum Jedi version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.19.0.bb => python3-ipython_7.20.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.19.0.bb => python3-ipython_7.20.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
index d3ce9f5ff..42795b9bf 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[md5sum] = "33bdc8287c827aae23699751b0ed3f7a"
-SRC_URI[sha256sum] = "cbb2ef3d5961d44e6a963b9817d4ea4e1fa2eb589c371a470fed14d8d40cbd6a"
+SRC_URI[sha256sum] = "1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

