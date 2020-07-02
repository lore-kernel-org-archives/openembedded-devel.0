Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3841.1593686915151117940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35470 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqwlc-0002lw-W9; Thu, 02 Jul 2020 13:48:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-stevedore: Upgrade 1.31.0 -> 2.0.1
Date: Thu,  2 Jul 2020 13:48:18 +0300
Message-Id: <20200702104819.14256-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702104819.14256-1-leon.anavi@konsulko.com>
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- Stop to use the __future__ module
- Switch to newer openstackdocstheme and reno versions
- Add Python3 victoria unit tests
- Mark sphinx extensions thread safe
- Remove dead files
- Drop Python 2.7 support
- Update master for stable/ussuri

Update the HOMEPAGE because Stevedore is now part of the OpenStack
Oslo program and is managed through OpenStack's infrastructure
system.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-stevedore_1.31.0.bb => python3-stevedore_2.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_1.31.0.bb => python3-stevedore_2.0.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
index b985ca5b1..cf388fa7c 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Manage dynamic plugins for Python applications"
-HOMEPAGE = "https://github.com/dreamhost/stevedore"
+HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "42fa2bf0251c96b543765c5ce13f37c9"
-SRC_URI[sha256sum] = "e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14"
+SRC_URI[md5sum] = "d0f137ec4fe5d98978970671a860882d"
+SRC_URI[sha256sum] = "609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.17.1

