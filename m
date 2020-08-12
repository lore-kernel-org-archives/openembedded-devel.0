Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18984.1597250635321051292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 09:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5tqy-0000d2-I9; Wed, 12 Aug 2020 19:43:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-sentry-sdk: Upgrade 0.16.0 -> 0.16.3
Date: Wed, 12 Aug 2020 19:43:33 +0300
Message-Id: <20200812164335.24599-3-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.3:

- Fix AWS Lambda support for Python 3.8.
- The AWS Lambda integration now captures initialization/import
  errors for Python 3.
- The AWS Lambda integration now supports an option to warn about
  functions likely to time out.
- Testing for RQ 1.5
- Flip default of traceparent_v2. This change should have zero
  impact. The flag will be removed in 0.17.
- Fix compatibility bug with Django 3.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.16.0.bb => python3-sentry-sdk_0.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.0.bb => python3-sentry-sdk_0.16.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
index b3f149029..ee84f6b0b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "8cfa879e803add117b073cad20c1d74d"
-SRC_URI[sha256sum] = "da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2"
+SRC_URI[md5sum] = "41ac61676030401bcf22b47ac6a2709f"
+SRC_URI[sha256sum] = "21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

