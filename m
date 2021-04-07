Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8122.1617805957921969251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9EP-0007iS-I4; Wed, 07 Apr 2021 17:32:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-django: Upgrade 3.1.7 -> 3.2
Date: Wed,  7 Apr 2021 17:32:07 +0300
Message-Id: <20210407143209.21813-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407143209.21813-1-leon.anavi@konsulko.com>
References: <20210407143209.21813-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2:

- Automatic AppConfig discovery
- Customizing type of auto-created primary keys
- Functional indexes
- pymemcache support
- New decorators for the admin site
- Other minor new features

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-django_3.1.7.bb => python3-django_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.1.7.bb => python3-django_3.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.7.bb b/meta-python/recipes-devtools/python/python3-django_3.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.bb
index d22bd14e8..e147e2f9d 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "32ce792ee9b6a0cbbec340123e229ac9f765dff8c2a4ae9247a14b2ba3a365a7"
+SRC_URI[sha256sum] = "21f0f9643722675976004eb683c55d33c05486f94506672df3d6a141546f389d"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS_${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.1.7" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.17.1

