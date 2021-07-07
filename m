Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.20735.1625663363154463147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 06:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m17Il-0004Cr-LE; Wed, 07 Jul 2021 16:09:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pillow: Upgrade 8.2.0 -> 8.3.1
Date: Wed,  7 Jul 2021 16:09:11 +0300
Message-Id: <20210707130913.13459-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.3.1:

- Catch OSError when checking if fp is sys.stdout
- Handle removing orientation from alternate types of EXIF data
- Make Image.__array__ take optional dtype argument

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
index 3241230d13..045357a6ad 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
+SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
 
 inherit setuptools3
 
-- 
2.17.1

