Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.48473.1598857436122418975
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdr8-0006cW-IX; Mon, 31 Aug 2020 10:03:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-sentry-sdk: Upgrade 0.17.0 -> 0.17.1
Date: Mon, 31 Aug 2020 10:03:18 +0300
Message-Id: <20200831070318.6573-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831070318.6573-1-leon.anavi@konsulko.com>
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.1:

- Fix timezone bugs in AWS Lambda integration.
- Fix crash on GCP integration because of missing parameter
  timeout_warning.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.0.bb => python3-sentry-sdk_0.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.0.bb => python3-sentry-sdk_0.17.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
index 340b5fed5..730286303 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "5806e450b2a4e341478411bc5d5cef31"
-SRC_URI[sha256sum] = "09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762"
+SRC_URI[md5sum] = "ae5d718ad6fca0bf33960825544caae6"
+SRC_URI[sha256sum] = "2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

