Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5826.1593170999192476106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYP-000568-SC; Fri, 26 Jun 2020 14:29:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/12] python3-greenlet: Upgrade 0.4.15 -> 0.4.16
Date: Fri, 26 Jun 2020 14:29:39 +0300
Message-Id: <20200626112944.25569-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.4.16:

- Support for DEC Alpha architecture
- Support for Python 3.9
- Support for Python 3.10a0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-greenlet_0.4.15.bb => python3-greenlet_0.4.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.15.bb => python3-greenlet_0.4.16.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
index f9c862118..4556d499f 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
-SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
+SRC_URI[md5sum] = "9aebea08f7beb6b87143d0588578c984"
+SRC_URI[sha256sum] = "6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c"
 
 inherit pypi distutils3
-- 
2.17.1

