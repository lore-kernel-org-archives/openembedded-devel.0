Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18233.1596201784530811104
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V02-000741-I5; Fri, 31 Jul 2020 16:23:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/15] python3-dynamic-dispatch: Upgrade 1.0.2 -> 1.0.3
Date: Fri, 31 Jul 2020 16:22:23 +0300
Message-Id: <20200731132230.20031-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.3:

- Fix bug when instantiating a thrice derived classes via dynamic
  dispatch.

Also a HOMEPAGE has been set.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...c-dispatch_1.0.2.bb => python3-dynamic-dispatch_1.0.3.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dynamic-dispatch_1.0.2.bb => python3-dynamic-dispatch_1.0.3.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 6485f9d57..2bf487584 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -1,11 +1,12 @@
 SUMMARY = "dynamic dispatch decorator for classes and functions"
+HOMEPAGE = "https://github.com/XevoInc/dynamic_dispatch"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
-SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
+SRC_URI[md5sum] = "6bd3cc24427de753eed0656e89d5302c"
+SRC_URI[sha256sum] = "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604"
 
 PYPI_PACKAGE = "dynamic_dispatch"
 
-- 
2.17.1

