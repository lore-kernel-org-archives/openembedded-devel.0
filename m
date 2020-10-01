Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7653.1601540427879102727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 01:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52088 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNtpB-0007uO-Tl; Thu, 01 Oct 2020 11:20:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-sentry-sdk: Upgrade 0.17.8 -> 0.18.0
Date: Thu,  1 Oct 2020 11:20:06 +0300
Message-Id: <20201001082006.21365-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001082006.21365-1-leon.anavi@konsulko.com>
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.18.0:

- Breaking change: The no_proxy environment variable is now
  honored when inferring proxy settings from the system.
- Added Performance/Tracing support for AWS and GCP functions.
- Fix an issue with Django instrumentation where the SDK modified
  resolver_match.callback and broke user code.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.8.bb => python3-sentry-sdk_0.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.8.bb => python3-sentry-sdk_0.18.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
index 99ddbe64d9..e4ab9f33d6 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "17ad6e414d77026e264152bd4cc11400"
-SRC_URI[sha256sum] = "e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1"
+SRC_URI[md5sum] = "d6a85d958aea9277c1728c77dcf063a1"
+SRC_URI[sha256sum] = "1d91a0059d2d8bb980bec169578035c2f2d4b93cd8a4fb5b85c81904d33e221a"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

