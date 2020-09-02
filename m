Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2887.1599035634074946690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDODH-0004fH-23; Wed, 02 Sep 2020 11:33:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-stevedore: Upgrade 3.2.0 -> 3.2.1
Date: Wed,  2 Sep 2020 11:33:39 +0300
Message-Id: <20200902083342.22101-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902083342.22101-1-leon.anavi@konsulko.com>
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.1:

- Bug fix: there were some syntax errors in the comment of
  stevedore code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-stevedore_3.2.0.bb => python3-stevedore_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.2.0.bb => python3-stevedore_3.2.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
index 0a2bffdcc..c3c368c34 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "6a39764d7aecc63a0990cf4635cb430d"
-SRC_URI[sha256sum] = "38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5"
+SRC_URI[md5sum] = "5f5660cebaefebbde4607e44e050a3b2"
+SRC_URI[sha256sum] = "a34086819e2c7a7f86d5635363632829dab8014e5fd7be2454c7cba84ac7514e"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.17.1

