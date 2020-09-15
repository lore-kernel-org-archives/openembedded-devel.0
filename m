Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2011.1600189814284971109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 10:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48736 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kIET4-0004hz-Cd; Tue, 15 Sep 2020 20:10:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][dunfell][PATCH] libldb: upgrade 1.5.7 -> 1.5.8
Date: Tue, 15 Sep 2020 20:10:03 +0300
Message-Id: <20200915171003.30632-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

From: Yi Zhao <yi.zhao@windriver.com>

Samba version 4.10.17 which has been already available in Dunfell
depends on version 1.5.8 of libldb.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.7.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.8.bb
index da77a2389..199db797a 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "4d72bbfe7c7fcdf592482a98c853d222"
-SRC_URI[sha256sum] = "b9eeb77ecb94f3b53caeff7cbc1850b6294fa937be4364c53a92a62c6548c001"
+SRC_URI[md5sum] = "d9b4bea8b48cd4c4d0c492e65881164b"
+SRC_URI[sha256sum] = "ddf7f770643e0a0dda60f2818913f883caeed37fa1e8d6eda0dfe9588c1e3a83"
 
 inherit waf-samba
 
-- 
2.17.1

