Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18818.1597250638896446155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 09:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5tr2-0000d2-Cv; Wed, 12 Aug 2020 19:43:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-redis: Upgrade 2.10.6 -> 3.5.3
Date: Wed, 12 Aug 2020 19:43:35 +0300
Message-Id: <20200812164335.24599-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812164335.24599-1-leon.anavi@konsulko.com>
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5.3:

- Restore try/except clauses to __del__ methods. These will be
  removed in 4.0 when more explicit resource management if
  enforced.
- Update the master_address when Sentinels promote a new master.
- Update SentinelConnectionPool to not forcefully disconnect
  other in-use connections which can negatively affect threaded
  applications.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-redis_2.10.6.bb => python3-redis_3.5.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_2.10.6.bb => python3-redis_3.5.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
rename to meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
index 7a9cc3f79..1887bf9e8 100644
--- a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
-SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
+SRC_URI[md5sum] = "7a00d4540374f34e152a33faa1fcee5f"
+SRC_URI[sha256sum] = "0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2"
 
 inherit pypi setuptools3
 
-- 
2.17.1

