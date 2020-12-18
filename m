Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.661.1608328080554204450
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 13:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kqNbN-00048f-Qh; Fri, 18 Dec 2020 23:47:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-stevedore: Upgrade 3.2.2 -> 3.3.0
Date: Fri, 18 Dec 2020 23:47:44 +0200
Message-Id: <20201218214748.14563-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.0:

- Use py3 as the default runtime for tox
- Adding pre-commit
- Fix cache dir flooding when running from /tmp
- Add Python3 wallaby unit tests
- Update master for stable/victoria

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_3.2.2.bb => python3-stevedore_3.3.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.2.bb => python3-stevedore_3.3.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
index 18eae35322..5103717182 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "c78357a02888490ef27a0d898eb97172"
-SRC_URI[sha256sum] = "f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0"
+SRC_URI[sha256sum] = "3a5bbd0652bf552748871eaa73a4a8dc2899786bc497a2aa1fcb4dcdb0debeee"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.17.1

