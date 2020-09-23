Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8292.1600847933038377913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzft-0005D6-PA; Wed, 23 Sep 2020 10:58:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-pint: Upgrade 0.16 -> 0.16.1
Date: Wed, 23 Sep 2020 10:58:27 +0300
Message-Id: <20200923075830.30859-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.1:

- Fix unpickling, now it is using the APP_REGISTRY as expected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.16.bb => python3-pint_0.16.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.16.bb => python3-pint_0.16.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.16.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.16.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
index 7775d733a7..d96659592a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "ec78e4e42512b93f80b9093416ad7417"
-SRC_URI[sha256sum] = "e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599"
+SRC_URI[md5sum] = "d4a7bbdf505dee964eb1e5e6e7f80c34"
+SRC_URI[sha256sum] = "d43a2e9ae003164978b60fdf8cd920d8581e1a5991df8dded29b00f4850ec83a"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

