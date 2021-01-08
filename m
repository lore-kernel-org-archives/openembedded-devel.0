Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.2027.1610101708310368141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44762 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxp0L-0000kU-GF; Fri, 08 Jan 2021 12:28:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pymisp: Upgrade 2.4.133 -> 2.4.135.3
Date: Fri,  8 Jan 2021 12:28:13 +0200
Message-Id: <20210108102814.9560-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108102814.9560-1-leon.anavi@konsulko.com>
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.135.3:

- Bump version.
- Improve typing.
- Improve add_attribute with a list.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.133.bb => python3-pymisp_2.4.135.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.133.bb => python3-pymisp_2.4.135.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
index 28a24fed5..bbfc0459d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "00e258da18f59845687f58389a2e8e12"
-SRC_URI[sha256sum] = "4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5"
+SRC_URI[sha256sum] = "f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

