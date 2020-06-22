Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14360.1592822182389745079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJoJ-0005ty-Hh; Mon, 22 Jun 2020 13:36:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-croniter: Upgrade 0.3.33 -> 0.3.34
Date: Mon, 22 Jun 2020 13:35:41 +0300
Message-Id: <20200622103542.27830-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.34:

- Add croniter_range(start,end,cron_expr) function
- croniter_range: Allow different ret_type/input types
- croniter_range: Tweak internals
- Simplify datetime type check
- Remove croniter_range() timezone safety check
- Add cron expression optimizations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_0.3.33.bb => python3-croniter_0.3.34.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.33.bb => python3-croniter_0.3.34.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
index 4dd53a67b..0c28948f6 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
@@ -4,7 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
-SRC_URI[sha256sum] = "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee"
+SRC_URI[md5sum] = "adfeeb0032ab7aeccba908fa2eb09c33"
+SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964"
 
 inherit pypi setuptools3
 
-- 
2.17.1

