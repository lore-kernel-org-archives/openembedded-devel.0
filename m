Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6812.1609859819517976164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4l-0007qz-Ic; Tue, 05 Jan 2021 17:16:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-jsonpatch: Upgrade 1.26 -> 1.28
Date: Tue,  5 Jan 2021 17:16:29 +0200
Message-Id: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.28:

- Declare json-patch operations as a class-based attribute

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.26.bb => python3-jsonpatch_1.28.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.26.bb => python3-jsonpatch_1.28.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
index b1217cfac1..cef20495b6 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.26.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "3aa7e75ad472c51a6de0123137dbfdf2"
-SRC_URI[sha256sum] = "e45df18b0ab7df1925f20671bbc3f6bd0b4b556fb4b9c5d97684b0a7eac01744"
+SRC_URI[sha256sum] = "e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
-- 
2.17.1

