Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5827.1593170999707772413
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYQ-000568-Cn; Fri, 26 Jun 2020 14:29:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/12] python3-pkgconfig: Upgrade 1.4.0 -> 1.5.1
Date: Fri, 26 Jun 2020 14:29:40 +0300
Message-Id: <20200626112944.25569-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Inherit class pypi and upgrade to release 1.5.1:

- Use poetry instead of setuptools directly
- Fix: raise exception if package is missing
- Fix version parsing for openssl-like version numbers
- Fix: expose --modversion
- Fix: strip whitespace from variable names
- Fix: do not specify pytest Python version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pkgconfig_1.4.0.bb => python3-pkgconfig_1.5.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.4.0.bb => python3-pkgconfig_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
index fc7a47a43..05ca3beec 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
@@ -4,16 +4,14 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
 
-SRC_URI = "git://github.com/matze/pkgconfig.git"
-SRCREV ?= "8af0102346847e8873af8e76ab3f34ba9da806e2"
+SRC_URI[md5sum] = "9f9cdb224ec0a1e59efcc7cac4b91972"
+SRC_URI[sha256sum] = "97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f"
 
 RDEPENDS_${PN} = "pkgconfig \
                  ${PYTHON_PN}-shell \
                  "
 
-inherit setuptools3
-
-S = "${WORKDIR}/git"
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

