Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13096.1597146299806504767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5Si9-0004It-AR; Tue, 11 Aug 2020 14:44:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-bitarray: Upgrade 1.4.2 -> 1.5.1
Date: Tue, 11 Aug 2020 14:44:23 +0300
Message-Id: <20200811114430.27916-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- support signed integers in `util.ba2int()` and `util.int2ba()`
- deprecate `.length()` in favor of `len()`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.4.2.bb => python3-bitarray_1.5.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.2.bb => python3-bitarray_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
index 925bdc8d9..70804ad18 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "2bc9489e9048db6a8705a7b9493e3015"
-SRC_URI[sha256sum] = "16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680"
+SRC_URI[md5sum] = "7005b90013838954facbaa231d7cccd9"
+SRC_URI[sha256sum] = "45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

