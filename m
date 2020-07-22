Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16202.1595414960115780414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJK-0001ZT-6q; Wed, 22 Jul 2020 13:49:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-stevedore: Upgrade 2.0.1 -> 3.2.0
Date: Wed, 22 Jul 2020 13:49:02 +0300
Message-Id: <20200722104905.15499-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.0:

- sphinxext: fix warning message for detailed list
- add release note before major version update
- switch to importlib.metadata package

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-stevedore_2.0.1.bb => python3-stevedore_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_2.0.1.bb => python3-stevedore_3.2.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
index cf388fa7c..0a2bffdcc 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "d0f137ec4fe5d98978970671a860882d"
-SRC_URI[sha256sum] = "609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7"
+SRC_URI[md5sum] = "6a39764d7aecc63a0990cf4635cb430d"
+SRC_URI[sha256sum] = "38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.17.1

