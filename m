Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.68844.1597764899334445307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83dY-0004rN-SR; Tue, 18 Aug 2020 18:34:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-sentry-sdk: Upgrade 0.16.3 -> 0.16.5
Date: Tue, 18 Aug 2020 18:34:40 +0300
Message-Id: <20200818153444.15728-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.5:

- Fix a bug that caused Django apps to crash if the view didn't
  have a __name__ attribute.
- Add experiment to avoid trunchating span descriptions. Initialize
  with init(_experiments={"smart_transaction_trimming": True}).
- Add a span around the Django view in transactions to distinguish
  its operations from middleware operations.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sentry-sdk_0.16.3.bb => python3-sentry-sdk_0.16.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.3.bb => python3-sentry-sdk_0.16.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
index ee84f6b0b..ad01f6f5b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[md5sum] = "41ac61676030401bcf22b47ac6a2709f"
-SRC_URI[sha256sum] = "21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116"
+SRC_URI[md5sum] = "6d65fda758929b6a8d16e6030302c811"
+SRC_URI[sha256sum] = "e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.17.1

