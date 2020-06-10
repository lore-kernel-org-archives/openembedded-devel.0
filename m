Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10432.1591794959443500673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0aE-0005hT-Cj; Wed, 10 Jun 2020 16:15:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-more-itertools: Upgrade 8.2.0 -> 8.3.0
Date: Wed, 10 Jun 2020 16:15:34 +0300
Message-Id: <20200610131536.31426-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.3.0:

* New itertools: :func:`zip_equal`.
* Changes to existing itertools.
* Type stubs are now tested with stubtest
* Tests now run with python -m unittest

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ore-itertools_8.2.0.bb => python3-more-itertools_8.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.2.0.bb => python3-more-itertools_8.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
index 1718fdf93..97393d050 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[md5sum] = "55e7e0a5eabc5a57bc8353c65c6f9965"
-SRC_URI[sha256sum] = "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
+SRC_URI[md5sum] = "03dbc82ec1c4e814733d84abf79f43f0"
+SRC_URI[sha256sum] = "558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

