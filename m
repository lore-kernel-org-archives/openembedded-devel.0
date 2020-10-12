Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.41301.1602511235653541225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kRyNM-00026S-Mz; Mon, 12 Oct 2020 17:00:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-multidict: Upgrade 4.7.6 -> 5.0.0
Date: Mon, 12 Oct 2020 17:00:20 +0300
Message-Id: <20201012140022.15761-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012140022.15761-1-leon.anavi@konsulko.com>
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.0:

- Provide wheels for aarch64, i686, ppc64le, s390x architectures
  on Linux as well as x86_64.
- Provide wheels for Python 3.9.
- Drop Python 3.5 support; Python 3.6 is the minimum supported
  Python version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-multidict_4.7.6.bb => python3-multidict_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.6.bb => python3-multidict_5.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
rename to meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
index 02c541b4c2..676fbae7ed 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-SRC_URI[md5sum] = "40b6ca77171ac8af55f7aa60049f3cdf"
-SRC_URI[sha256sum] = "fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430"
+SRC_URI[md5sum] = "c2c3311e25636a6f213e998cd1e80d72"
+SRC_URI[sha256sum] = "1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

