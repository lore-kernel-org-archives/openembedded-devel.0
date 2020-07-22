Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16235.1595414958616269870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJI-0001ZT-QJ; Wed, 22 Jul 2020 13:49:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-simplejson: Upgrade 3.17.0 -> 3.17.2
Date: Wed, 22 Jul 2020 13:49:00 +0300
Message-Id: <20200722104905.15499-2-leon.anavi@konsulko.com>
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

Upgrade to release 3.17.2:

* Added arm64 to build matrix and reintroduced
  manylinux wheels
* No more bdist_wininst builds per PEP 527
* Minor grammatical issue fixed in README

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-simplejson_3.17.0.bb => python3-simplejson_3.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.0.bb => python3-simplejson_3.17.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
index b76ae5299..cab0da6a1 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
-SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
+SRC_URI[md5sum] = "27fba3bc75a32318bd3b163b8a31aa7e"
+SRC_URI[sha256sum] = "75ecc79f26d99222a084fbdd1ce5aad3ac3a8bd535cd9059528452da38b68841"
 
 inherit pypi setuptools3
 
-- 
2.17.1

