Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6909.1593768640666299457
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1m-0007av-Gk; Fri, 03 Jul 2020 12:30:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-sentry-sdk: Upgrade 0.14.0 -> 0.16.0
Date: Fri,  3 Jul 2020 12:30:13 +0300
Message-Id: <20200703093020.3514-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.0:

- Redis integration: add tags for more commands
- Redis integration: Patch rediscluster package if installed.
- Session tracking: A session is no longer considered crashed if
  there has been a fatal log message (only unhandled exceptions
  count).
- Breaking change: Revamping of the tracing API.
- Breaking change: before_send is no longer called for
  transactions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.14.0.bb => python3-sentry-sdk_0.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.14.0.bb => python3-sentry-sdk_0.16.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
index 894e1f9020..b3f149029f 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "2d5cc43c8a178134b739c77439d1f26b"
-SRC_URI[sha256sum] = "8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8"
+SRC_URI[md5sum] = "8cfa879e803add117b073cad20c1d74d"
+SRC_URI[sha256sum] = "da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

