Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3438.1595586929364653367
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv32-0006km-1p; Fri, 24 Jul 2020 13:35:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-aenum: Upgrade 2.2.3 -> 2.2.4
Date: Fri, 24 Jul 2020 13:35:11 +0300
Message-Id: <20200724103515.21420-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.4:

- add support to Constant to retrieve members by value
- add pickle/deepcopy support to Constant
- add support for Constant to use other Constant values
- AutoNumber and auto() now work together
- Enum members are now added to the class as enum_property, which
  supports unshadowing of parent class attributes when called on
  an Enum member

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_2.2.3.bb => python3-aenum_2.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.3.bb => python3-aenum_2.2.4.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
index 16d2a881f..da77a5c75 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[md5sum] = "026786dbb37c15c2c8dc91fbf5828e97"
-SRC_URI[sha256sum] = "a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8"
+SRC_URI[md5sum] = "8983562361efe5be865617341dadbb9b"
+SRC_URI[sha256sum] = "81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864"
 
 inherit pypi setuptools3
 
-- 
2.17.1

