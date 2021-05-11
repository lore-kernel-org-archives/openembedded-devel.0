Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1930.1620751950370812873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lgVcT-0007jj-Ax; Tue, 11 May 2021 19:52:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-sentry-sdk: Upgrade 1.0.0 -> 1.1.0
Date: Tue, 11 May 2021 19:52:17 +0300
Message-Id: <20210511165217.18433-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511165217.18433-1-leon.anavi@konsulko.com>
References: <20210511165217.18433-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Fix for AWSLambda integration returns value of original handler
- Fix for RQ integration that only captures exception if RQ job
  has failed and ignore retries
- Feature that supports Tracing for the Tornado integration
- Feature that supports wild cards in ignore_logger in the Logging
  Integration
- Fix for django that deals with template span description names
  that are either lists or tuples

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-sentry-sdk_1.0.0.bb => python3-sentry-sdk_1.1.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.0.0.bb => python3-sentry-sdk_1.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb
index 22b9f55ddf..89c659dba3 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[sha256sum] = "71de00c9711926816f750bc0f57ef2abbcb1bfbdf5378c601df7ec978f44857a"
+RDEPENDS_${PN} += "python3-urllib3"
+
+SRC_URI[sha256sum] = "c1227d38dca315ba35182373f129c3e2722e8ed999e52584e6aca7d287870739"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.17.1

