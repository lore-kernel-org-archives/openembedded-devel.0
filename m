Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16608.1600953695399147270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 06:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58940 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLRBm-0007nc-13; Thu, 24 Sep 2020 16:21:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-sentry-sdk: Upgrade 0.17.7 -> 0.17.8
Date: Thu, 24 Sep 2020 16:21:21 +0300
Message-Id: <20200924132122.30697-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924132122.30697-1-leon.anavi@konsulko.com>
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.8:

- Fix yet another bug with disjoint traces in Celery.
- Added support for Chalice 1.20. Thanks again to the folks at
  Cuenca MX!

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.7.bb => python3-sentry-sdk_0.17.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.7.bb => python3-sentry-sdk_0.17.8.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
index 27f68fcb21..99ddbe64d9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "eda3a8d9aae8459ef6efe540293a9ca8"
-SRC_URI[sha256sum] = "a698993f3abbe06e88e8a3c8b61c8a79c12f62e503f1a23eda30c3921f0525a9"
+SRC_URI[md5sum] = "17ad6e414d77026e264152bd4cc11400"
+SRC_URI[sha256sum] = "e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

