Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22839.1605864564298734662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 01:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40904 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kg2jK-0006cP-68; Fri, 20 Nov 2020 11:29:23 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-arpeggio: Upgrade 1.9.2 -> 1.10.1
Date: Fri, 20 Nov 2020 11:29:09 +0200
Message-Id: <20201120092910.30736-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120092910.30736-1-leon.anavi@konsulko.com>
References: <20201120092910.30736-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.10.1:

- Fix packaging, exclude examples from wheel

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-arpeggio_1.9.2.bb => python3-arpeggio_1.10.1.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_1.9.2.bb => python3-arpeggio_1.10.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
index 802a5b2eaa..38e26623f5 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
@@ -3,13 +3,15 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[md5sum] = "39667a626217c670bc634444be6e904a"
-SRC_URI[sha256sum] = "948ce06163a48a72c97f4fe79ad3d1c1330b6fec4f22ece182fb60ef60bd022b"
+SRC_URI[sha256sum] = "920d12cc762edb2eb56daae64a14c93e43dc181b481c88fc79314c0df6ee639e"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
 
 # setup.py of Arpeggio needs this.
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "\
+    ${PYTHON_PN}-pytest-runner-native \
+    ${PYTHON_PN}-wheel-native \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

