Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8717.1610547997720691871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6Y-0000Li-HC; Wed, 13 Jan 2021 16:26:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-lz4: Upgrade 3.1.0 -> 3.1.1
Date: Wed, 13 Jan 2021 16:26:18 +0200
Message-Id: <20210113142626.27599-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.4
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

Upgrade to release 3.1.1:

- Correct how pkgconfig is handled in setup.py to account for
  multiple build flags
- Improve how CHAR_BIT is handled

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lz4_3.1.0.bb => python3-lz4_3.1.1.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.0.bb => python3-lz4_3.1.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
index 06bf63159..1cc378def 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
@@ -8,8 +8,7 @@ DEPENDS += " \
     ${PYTHON_PN}-pkgconfig-native \
 "
 
-SRC_URI[md5sum] = "1bf913acec3cb63893f522c222c8e3b1"
-SRC_URI[sha256sum] = "debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05"
+SRC_URI[sha256sum] = "1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda"
 
 inherit pypi setuptools3
 
-- 
2.17.1

