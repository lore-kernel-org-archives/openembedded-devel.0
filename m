Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1051.1609970848837053405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxi-0004lA-Ki; Thu, 07 Jan 2021 00:07:27 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-smbus2: Upgrade 0.3.0 -> 0.4.0
Date: Thu,  7 Jan 2021 00:06:59 +0200
Message-Id: <20210106220702.10483-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.0:

- Support for SMBus PEC (Packet Error Checking).
- Support for Python 3 type hinting and mypy static type analysis.
  Type stubs added to the project.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-smbus2_0.3.0.bb => python3-smbus2_0.4.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.3.0.bb => python3-smbus2_0.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
index 7a61927206..1f6f61137e 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
-SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
+SRC_URI[sha256sum] = "1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

