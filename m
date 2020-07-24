Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3439.1595586930205381609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv32-0006km-Uw; Fri, 24 Jul 2020 13:35:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-bitarray: Upgrade 1.4.1 -> 1.4.2
Date: Fri, 24 Jul 2020 13:35:12 +0300
Message-Id: <20200724103515.21420-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to 1.4.2:

* add more tests
* C-level:
    - simplify pack/unpack code
    - fix memory leak in `~` operation (bitarray_cpinvert)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.4.1.bb => python3-bitarray_1.4.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.1.bb => python3-bitarray_1.4.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
index 4866e8464..925bdc8d9 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "dfb3fe66ae989e4724747fcb0f704f56"
-SRC_URI[sha256sum] = "9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f"
+SRC_URI[md5sum] = "2bc9489e9048db6a8705a7b9493e3015"
+SRC_URI[sha256sum] = "16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

