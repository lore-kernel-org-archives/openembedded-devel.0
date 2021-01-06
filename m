Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1053.1609970852907801759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxk-0004lA-0J; Thu, 07 Jan 2021 00:07:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-sentry-sdk: Upgrade 0.19.1 -> 0.19.5
Date: Thu,  7 Jan 2021 00:07:01 +0200
Message-Id: <20210106220702.10483-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.19.5:

- Fix two regressions added in 0.19.2 with regard to sampling
  behavior when reading the sampling decision from headers.
- Increase internal transport queue size and make it configurable.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-sentry-sdk_0.19.1.bb => python3-sentry-sdk_0.19.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.1.bb => python3-sentry-sdk_0.19.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
index 2da9908e34..bb960eed09 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "1e6aabe30f4c86356d1d85a9beb0b05a"
-SRC_URI[sha256sum] = "5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8"
+SRC_URI[sha256sum] = "737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

