Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6719.1593076121266502487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNs7-0005y7-Jy; Thu, 25 Jun 2020 12:08:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/12] python3-coverage: Upgrade 5.0.2 -> 5.1
Date: Thu, 25 Jun 2020 12:07:17 +0300
Message-Id: <20200625090719.16068-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1:

- The JSON report now includes counts of covered and missing
  branches.
- On Python 3.8, try-finally-return reported wrong branch coverage
  with decorated async functions (issue 964). This is now fixed.
- The :meth:`~coverage.Coverage.get_option` and
  :meth:`~coverage.Coverage.set_option` methods can now manipulate
  the [paths] configuration setting.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.0.2.bb => python3-coverage_5.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.0.2.bb => python3-coverage_5.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.1.bb
index 9407278e9..7265d2c97 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "876be562bc78deac6fc2a06ee4a6d551"
-SRC_URI[sha256sum] = "b251c7092cbb6d789d62dc9c9e7c4fb448c9138b51285c36aeb72462cad3600e"
+SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
+SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
 
 inherit pypi setuptools3
 
-- 
2.17.1

