Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.40994.1597663771367256512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKT-000361-Ea; Mon, 17 Aug 2020 14:29:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-bitarray: Upgrade 1.5.1 -> 1.5.2
Date: Mon, 17 Aug 2020 14:29:00 +0300
Message-Id: <20200817112901.28914-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- add PyType_Ready usage, issue #66
- speedup search() for bitarrays with length 1 in sparse bitarrays
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.5.1.bb => python3-bitarray_1.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.1.bb => python3-bitarray_1.5.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
index 70804ad18..15393001a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "7005b90013838954facbaa231d7cccd9"
-SRC_URI[sha256sum] = "45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd"
+SRC_URI[md5sum] = "ccd872c5effef77bf4028c67c0619f6c"
+SRC_URI[sha256sum] = "38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

