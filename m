Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11555.1611665419589487271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37874 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4NnM-0007hT-J6; Tue, 26 Jan 2021 14:50:16 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cachetools: Upgrade 4.2.0 -> 4.2.1
Date: Tue, 26 Jan 2021 14:49:59 +0200
Message-Id: <20210126125003.27620-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.2.1:

- Handle __missing__() not storing cache items.
- Clean up __missing__() example.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-cachetools_4.2.0.bb => python3-cachetools_4.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.0.bb => python3-cachetools_4.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
index cc697d5a9..616e88045 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
@@ -27,7 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = "9d54dacd774e2af7e9a50741386f5455"
-SRC_URI[sha256sum] = "3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e"
+SRC_URI[sha256sum] = "f469e29e7aa4cff64d8de4aad95ce76de8ea1125a16c68e0d93f65c3c3dc92e9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

