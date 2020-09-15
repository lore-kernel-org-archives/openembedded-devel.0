Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9152.1600160601408501775
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6ru-0007I7-W1; Tue, 15 Sep 2020 12:03:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-stevedore: Upgrade 3.2.1 -> 3.2.2
Date: Tue, 15 Sep 2020 12:03:00 +0300
Message-Id: <20200915090303.14367-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.2:

- fix supported python versions in documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-stevedore_3.2.1.bb => python3-stevedore_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.1.bb => python3-stevedore_3.2.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
index c3c368c34..18eae3532 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "5f5660cebaefebbde4607e44e050a3b2"
-SRC_URI[sha256sum] = "a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e"
+SRC_URI[md5sum] = "c78357a02888490ef27a0d898eb97172"
+SRC_URI[sha256sum] = "f845868b3a3a77a2489d226568abe7328b5c2d4f6a011cc759dfa99144a521f0"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.17.1

