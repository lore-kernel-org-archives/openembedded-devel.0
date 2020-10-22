Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11239.1603376280583836390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 07:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45090 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVbPj-0002Yk-Jl; Thu, 22 Oct 2020 17:18:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-sentry-sdk: Upgrade 0.19.0 -> 0.19.1
Date: Thu, 22 Oct 2020 17:17:48 +0300
Message-Id: <20201022141749.14950-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022141749.14950-1-leon.anavi@konsulko.com>
References: <20201022141749.14950-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.19.1:

- Fix dependency check for blinker fixes
- Fix incorrect timeout warnings in AWS Lambda and GCP integrations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.19.0.bb => python3-sentry-sdk_0.19.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.0.bb => python3-sentry-sdk_0.19.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
index b03e76b7c1..2da9908e34 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "5c988086e4c124380887b0d579081f33"
-SRC_URI[sha256sum] = "a3716e98a1285a74eeaea7418a5b8fb2d7568fa11b5fba389946f465876a4d44"
+SRC_URI[md5sum] = "1e6aabe30f4c86356d1d85a9beb0b05a"
+SRC_URI[sha256sum] = "5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

