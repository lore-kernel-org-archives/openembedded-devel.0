Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.24266.1605708154479063235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kfO2a-0005MS-Bs; Wed, 18 Nov 2020 16:02:33 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-croniter: Upgrade 0.3.35 -> 0.3.36
Date: Wed, 18 Nov 2020 16:02:18 +0200
Message-Id: <20201118140220.29364-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 0.3.36:

- Updated docs section regarding max_years_between_matches to
  be more shorter and hopefully more relevant
- Don't install tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-croniter_0.3.35.bb => python3-croniter_0.3.36.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.35.bb => python3-croniter_0.3.36.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
index 388885c158..b2571491b6 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.36.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
-SRC_URI[md5sum] = "8bb1443b90123f96ad64d7fae26df342"
-SRC_URI[sha256sum] = "b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf"
+SRC_URI[md5sum] = "1be5dd43ca26a66b5f981e41c74fd346"
+SRC_URI[sha256sum] = "9d3098e50f7edc7480470455d42f09c501fa1bb7e2fc113526ec6e90b068f32c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

