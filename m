Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.17407.1621249900083579748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 04:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33204 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lib9u-0007uL-0J; Mon, 17 May 2021 14:11:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-javaobj-py3: Upgrade 0.4.2 -> 0.4.3
Date: Mon, 17 May 2021 14:11:26 +0300
Message-Id: <20210517111129.11619-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517111129.11619-1-leon.anavi@konsulko.com>
References: <20210517111129.11619-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.3:

- Added support for TC_NULL as array sub-type in _read_field_value
- javaobj can now read GZipped files directly (trick done in
  load(), which is also the underlying method used by loads())
- Fixed a type issue in BlockData/str content comparison

License-Update: License remains Apache License Version 2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-javaobj-py3_0.4.2.bb => python3-javaobj-py3_0.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.2.bb => python3-javaobj-py3_0.4.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
index 2f24219812..eb93e71733 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
@@ -5,9 +5,9 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world."
 HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ed3b1ffcfd39f165729cb53587cca02ab0bfa4c332c837a92d5ffe6aef5c8010"
+SRC_URI[sha256sum] = "38f74db3a57e9998a9774e3614afb95cb396f139f29b3fdb130c5af554435259"
 
 inherit pypi setuptools3
 
-- 
2.17.1

