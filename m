Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9363.1600160596428811053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rq-0007I7-8U; Tue, 15 Sep 2020 12:03:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-sentry-sdk: Upgrade 0.17.3 -> 0.17.5
Date: Tue, 15 Sep 2020 12:02:56 +0300
Message-Id: <20200915090303.14367-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.5:

- Work around an issue in the Python stdlib that makes the entire
  process deadlock during garbage collection if events are sent
  from a __del__ implementation.
- Add possibility to wrap ASGI application twice in middleware to
  enable split up of request scope data and exception catching.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.3.bb => python3-sentry-sdk_0.17.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.3.bb => python3-sentry-sdk_0.17.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
index 0a39fb142..5495fa0d3 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "5d4abcc416cbd0b9443bf56588b02b55"
-SRC_URI[sha256sum] = "0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78"
+SRC_URI[md5sum] = "dcdf0d4f84f4f6ea02ad3f15dfcff2d9"
+SRC_URI[sha256sum] = "02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

