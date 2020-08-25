Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13393.1598362013128569604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyR-0001xr-AY; Tue, 25 Aug 2020 16:26:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-sentry-sdk: Upgrade 0.16.5 -> 0.17.0
Date: Tue, 25 Aug 2020 16:26:31 +0300
Message-Id: <20200825132633.875-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
References: <20200825132633.875-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.0:

- Fix a bug where class-based callables used as Django views
  (without using Django's regular class-based views) would not
  have csrf_exempt applied.
- New integration for Google Cloud Functions.
- Fix a bug where a recently released version of urllib3 would
  cause the SDK to enter an infinite loop on networking and SSL
  errors.
- Breaking change: Remove the traceparent_v2 option. The option
  has been ignored since 0.16.3, just remove it from your code.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.16.5.bb => python3-sentry-sdk_0.17.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.5.bb => python3-sentry-sdk_0.17.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
index ad01f6f5b..340b5fed5 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "6d65fda758929b6a8d16e6030302c811"
-SRC_URI[sha256sum] = "e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334"
+SRC_URI[md5sum] = "5806e450b2a4e341478411bc5d5cef31"
+SRC_URI[sha256sum] = "09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

