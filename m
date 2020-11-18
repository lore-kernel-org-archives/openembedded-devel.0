Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.24637.1605708156687015015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kfO2b-0005MS-UJ; Wed, 18 Nov 2020 16:02:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-bitarray: Upgrade 1.6.0 -> 1.6.1
Date: Wed, 18 Nov 2020 16:02:19 +0200
Message-Id: <20201118140220.29364-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.1:

- use PyType_Ready for all types: bitarray, bitarrayiterator,
  decodeiterator, decodetree, searchiterator

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.6.0.bb => python3-bitarray_1.6.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.0.bb => python3-bitarray_1.6.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
index b085cf7c09..f54d54f92c 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "08ddac722b139c1544087c4953a6335b"
-SRC_URI[sha256sum] = "ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d"
+SRC_URI[md5sum] = "a082075dbae478fb53c69e25cc7f9cd6"
+SRC_URI[sha256sum] = "ab85b38365dd9956264226b30dababa02161ed49bb36c7ee82cc6545e07b1599"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

