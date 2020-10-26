Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11404.1603713077366335722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55378 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kX11w-0007bv-BB; Mon, 26 Oct 2020 13:51:16 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-u-msgpack-python: Upgrade 2.7.0 -> 2.7.1
Date: Mon, 26 Oct 2020 13:50:39 +0200
Message-Id: <20201026115041.11671-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026115041.11671-1-leon.anavi@konsulko.com>
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.1:

- Add Ext type value validation to Ext class and
  ext_serializable() decorator
- Change string formatting from % to .format() throughout codebase

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...pack-python_2.7.0.bb => python3-u-msgpack-python_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.7.0.bb => python3-u-msgpack-python_2.7.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
index 4797a3535f..c5524d152e 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.1.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer w
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
 
-SRC_URI[md5sum] = "231609d87aa58459a1491c8f5df4e4cd"
-SRC_URI[sha256sum] = "996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54"
+SRC_URI[md5sum] = "8691cea6bc7b44bce6e2115260a54323"
+SRC_URI[sha256sum] = "b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

