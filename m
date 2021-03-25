Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.8197.1616679293378203541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8S-0007lW-Dv; Thu, 25 Mar 2021 15:34:52 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/11] python3-django: Upgrade 3.1.1 -> 3.1.7
Date: Thu, 25 Mar 2021 15:34:35 +0200
Message-Id: <20210325133436.18328-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.7:

- Fixed a regression in Django 3.1 that caused RuntimeError
  instead of connection errors when using only the 'postgres'
  database

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-django_3.1.1.bb => python3-django_3.1.7.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.1.1.bb => python3-django_3.1.7.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb b/meta-python/recipes-devtools/python/python3-django_3.1.7.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-django_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-django_3.1.7.bb
index ed6513d0c..d22bd14e8 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.1.7.bb
@@ -1,8 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "d5e894fb3c46064e84e9dc68a08a46d0"
-SRC_URI[sha256sum] = "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
+SRC_URI[sha256sum] = "32ce792ee9b6a0cbbec340123e229ac9f765dff8c2a4ae9247a14b2ba3a365a7"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -10,5 +9,5 @@ RDEPENDS_${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.1.1" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.1.7" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.17.1

