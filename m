Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4497.1592909821277715923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 03:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05NAuuZ4010723
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 03:56:56 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 23 Jun 2020
 03:56:56 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freediameter: upgrade 1.3.2 -> 1.4.0
Date: Tue, 23 Jun 2020 13:54:53 +0300
Message-ID: <20200623105453.20889-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../{freediameter_1.3.2.bb => freediameter_1.4.0.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/freediameter/{freediameter_1.3.2.bb => freediameter_1.4.0.bb} (97%)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
similarity index 97%
rename from meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb
rename to meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index 385b8b373..15ee56196 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.3.2.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -23,8 +23,7 @@ SRC_URI = "\
     file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
     "
 
-SRC_URI[md5sum] = "73ce230b4789f9f28fff77cbc83c65af"
-SRC_URI[sha256sum] = "ce05b4bf2a04cd2f472e77ba4b86fbfca690bfc83e51da8ce0e575804b763eda"
+SRC_URI[sha256sum] = "7a537401bd110c606594b7c6be71b993f0ccc73ae151ad68040979286ba4e50e"
 
 S = "${WORKDIR}/${fd_pkgname}-${PV}"
 
-- 
2.17.1

