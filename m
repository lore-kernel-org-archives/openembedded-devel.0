Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18338.1600248104765432369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 02:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35260 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kITdF-0000SY-3t; Wed, 16 Sep 2020 12:21:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-sentry-sdk: Upgrade 0.17.5 -> 0.17.6
Date: Wed, 16 Sep 2020 12:21:33 +0300
Message-Id: <20200916092133.11861-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916092133.11861-1-leon.anavi@konsulko.com>
References: <20200916092133.11861-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.6:

- Support for Flask 0.10 (only relaxing verson check)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.5.bb => python3-sentry-sdk_0.17.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.5.bb => python3-sentry-sdk_0.17.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
index 5495fa0d3a..5f566a8264 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "dcdf0d4f84f4f6ea02ad3f15dfcff2d9"
-SRC_URI[sha256sum] = "02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a"
+SRC_URI[md5sum] = "f48cccd128b10a9a4d19db89d1a74a58"
+SRC_URI[sha256sum] = "1a086486ff9da15791f294f6e9915eb3747d161ef64dee2d038a4d0b4a369b24"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

