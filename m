Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12059.1597228059069043041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 03:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53212 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5nyr-0001gR-7Q; Wed, 12 Aug 2020 13:27:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-u-msgpack-python: Upgrade 2.6.0 -> 2.7.0
Date: Wed, 12 Aug 2020 13:27:26 +0300
Message-Id: <20200812102726.4376-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812102726.4376-1-leon.anavi@konsulko.com>
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.0:

- Add support for packing subclasses of ext_serializable()
  application classes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...gpack-python_2.6.0.bb => python3-u-msgpack-python_2.7.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.6.0.bb => python3-u-msgpack-python_2.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
index f3f321e18..4797a3535 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.0.bb
@@ -3,7 +3,8 @@ DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer w
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
 
-SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
+SRC_URI[md5sum] = "231609d87aa58459a1491c8f5df4e4cd"
+SRC_URI[sha256sum] = "996e4c4454771f0ff0fd2a7566b1a159d305d3611cd755addf444e3533e2bc54"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

