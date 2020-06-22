Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14340.1592822154834262497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJnp-0005ty-Bg; Mon, 22 Jun 2020 13:35:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-ordered-set: Upgrade 3.1.1 -> 4.0.2
Date: Mon, 22 Jun 2020 13:35:33 +0300
Message-Id: <20200622103542.27830-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 4.0.2:

- Fix packaging, remove vestiges of type stubs
- Code formatting (isort and black)
- Directly distribute type stub file via PEP 561
- Include pytest.ini in sdist
- Add a Jenkinsfile
- Handle another indexing case from NumPy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-ordered-set_3.1.1.bb => python3-ordered-set_4.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ordered-set_3.1.1.bb => python3-ordered-set_4.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
index bf362daa7..0e678b54d 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
 
-SRC_URI[md5sum] = "6e12312c8dc4c90fe840e86e8a352644"
-SRC_URI[sha256sum] = "a7bfa858748c73b096e43db14eb23e2bc714a503f990c89fac8fab9b0ee79724"
+SRC_URI[md5sum] = "5d88f3870c32d4868b28c8fe833f7e74"
+SRC_URI[sha256sum] = "ba93b2df055bca202116ec44b9bead3df33ea63a7d5827ff8e16738b97f33a95"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

