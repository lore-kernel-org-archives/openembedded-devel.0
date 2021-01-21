Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6740.1611235039528751315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2Zpt-0002jH-UX; Thu, 21 Jan 2021 15:17:18 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-lz4: Upgrade 3.1.1 -> 3.1.3
Date: Thu, 21 Jan 2021 15:17:06 +0200
Message-Id: <20210121131709.27097-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121131709.27097-1-leon.anavi@konsulko.com>
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.3:

- Add support for publishing wheels to PyPi for Python 3.9. Wheel
  building is currently broken for Python 3.9 on Arm/Aarch64
- Drop building of wheels for Python 3.5
- Move to Visual Studio 2019 (14.2) on AppVeyor
- Build against the XCode 12.2 image on Travis

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lz4_3.1.1.bb => python3-lz4_3.1.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.1.bb => python3-lz4_3.1.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
index 1cc378def..b14484b78 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
@@ -8,7 +8,7 @@ DEPENDS += " \
     ${PYTHON_PN}-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda"
+SRC_URI[sha256sum] = "081ef0a3b5941cb03127f314229a1c78bd70c9c220bb3f4dd80033e707feaa18"
 
 inherit pypi setuptools3
 
-- 
2.17.1

