Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13099.1597146302463207576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiD-0004It-8l; Tue, 11 Aug 2020 14:45:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-tqdm: Upgrade 4.48.0 -> 4.48.2
Date: Tue, 11 Aug 2020 14:44:26 +0300
Message-Id: <20200811114430.27916-6-leon.anavi@konsulko.com>
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

Upgrade to release 4.48.2:

- fix notebook formatting
- fix ANSI escape codes breaking tqdm.write
- fix long-lived strongref
- fix cli --version crash on missing git/refs/heads
- fix contrib.tenumerate ignoring total
- fix potential deep => shallow kwargs copy issues
- improve notebook display for unknown total
- make asyncio inherit from std rather than auto
- make auto multi-inherit from autonotebook, asyncio on Python3.5+
- misc documentation & examples updates
- mention docker-compose requirements
- misc linting & tidy
- misc minor testing framework updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.48.0.bb => python3-tqdm_4.48.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.0.bb => python3-tqdm_4.48.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
index 428bdb59e..831468095 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "89dbe66a10f78900e4e7be729ddd28ca"
-SRC_URI[sha256sum] = "6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29"
+SRC_URI[md5sum] = "d29c836d74d2f2ec6a10d052937f7371"
+SRC_URI[sha256sum] = "564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21"
 
 inherit pypi setuptools3
 
-- 
2.17.1

