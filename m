Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3650.1592905911342155086
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfan-0006Iq-Gp; Tue, 23 Jun 2020 12:51:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/11] python3-more-itertools: Upgrade 8.3.0 -> 8.4.0
Date: Tue, 23 Jun 2020 12:51:30 +0300
Message-Id: <20200623095136.24854-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.4.0:

- New itertools:
  :func:`mark_ends`
  :func:`is_sorted`
- Changes to existing itertools:
  :func:`islice_extended` can now be used with real slices
  The implementations for :func:`filter_except` and
  :func:`map_except` were improved
- Other changes:
  Automated tests now enforce code style (using black)
  The various signatures of :func:`islice_extended` and
  :func:`numeric_range` now appear in the docs
  The test configuration for mypy was updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ore-itertools_8.3.0.bb => python3-more-itertools_8.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.3.0.bb => python3-more-itertools_8.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
index 97393d050..f040b1a97 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[md5sum] = "03dbc82ec1c4e814733d84abf79f43f0"
-SRC_URI[sha256sum] = "558bb897a2232f5e4f8e2399089e35aecb746e1f9191b6584a151647e89267be"
+SRC_URI[md5sum] = "0912041c05148ed079984cff69af2e99"
+SRC_URI[sha256sum] = "68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

