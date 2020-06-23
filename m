Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3659.1592905916753429873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfas-0006Iq-Fy; Tue, 23 Jun 2020 12:51:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/11] python3-spidev: Upgrade 3.4 -> 3.5
Date: Tue, 23 Jun 2020 12:51:34 +0300
Message-Id: <20200623095136.24854-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5:

- Fixed memory leaks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-spidev_3.4.bb => python3-spidev_3.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-spidev_3.4.bb => python3-spidev_3.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-spidev_3.4.bb
rename to meta-python/recipes-devtools/python/python3-spidev_3.5.bb
index 334d658d6..ca5a1eb52 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SRCNAME = "spidev"
 
-SRC_URI[md5sum] = "bbab6352449f1d572cc9eefeafc58bd1"
-SRC_URI[sha256sum] = "4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80"
+SRC_URI[md5sum] = "7007e4fff2750025e233d8dfe46be670"
+SRC_URI[sha256sum] = "8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d"
 
 inherit pypi setuptools3
-- 
2.17.1

