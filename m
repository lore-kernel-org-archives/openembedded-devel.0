Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18986.1597250637282219662
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 09:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5tr0-0000d2-E9; Wed, 12 Aug 2020 19:43:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-coverage: Upgrade 5.2 -> 5.2.1
Date: Wed, 12 Aug 2020 19:43:34 +0300
Message-Id: <20200812164335.24599-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812164335.24599-1-leon.anavi@konsulko.com>
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.2.1:

- Fix: the dark mode HTML report still used light colors for the
  context listing, making them unreadable.
- The time stamp on the HTML report now includes the time zone.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.2.bb => python3-coverage_5.2.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.2.bb => python3-coverage_5.2.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
index 72558e10c..48e352c1d 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
-SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
+SRC_URI[md5sum] = "9e6165146b9bda60a779953c79e8ca54"
+SRC_URI[sha256sum] = "a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

