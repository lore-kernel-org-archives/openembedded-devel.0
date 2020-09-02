Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2863.1599035635132800946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDODI-0004fH-OJ; Wed, 02 Sep 2020 11:33:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-sentry-sdk: Upgrade 0.17.1 -> 0.17.2
Date: Wed,  2 Sep 2020 11:33:41 +0300
Message-Id: <20200902083342.22101-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902083342.22101-1-leon.anavi@konsulko.com>
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.2:

- Fix timezone bugs in GCP integration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.17.1.bb => python3-sentry-sdk_0.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.1.bb => python3-sentry-sdk_0.17.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
index 730286303..9eddbbfdd 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.2.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "ae5d718ad6fca0bf33960825544caae6"
-SRC_URI[sha256sum] = "2c770e7bf72d6419bb82b3bb950f3789fc24bd6a0ba191369607a96289acd63b"
+SRC_URI[md5sum] = "a9d68b19c457d6a9ff70396ab341fca2"
+SRC_URI[sha256sum] = "bbfe5633aee4dacb53d79d303ab6bfacf1749fb717750c112fb1658e5accce0d"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

