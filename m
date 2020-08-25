Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13505.1598362008272796076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyK-0001xr-No; Tue, 25 Aug 2020 16:26:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-bitarray: Upgrade 1.5.2 -> 1.5.3
Date: Tue, 25 Aug 2020 16:26:27 +0300
Message-Id: <20200825132633.875-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.3:

- add optional index parameter to `.index()` to invert single bit
- fix `sys.getsizeof(bitarray)` by adding `.__sizeof__()`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.5.2.bb => python3-bitarray_1.5.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.2.bb => python3-bitarray_1.5.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
index 15393001a..e36a17027 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "ccd872c5effef77bf4028c67c0619f6c"
-SRC_URI[sha256sum] = "38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf"
+SRC_URI[md5sum] = "7cfa242b99351646fab0d76b05aab747"
+SRC_URI[sha256sum] = "567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

