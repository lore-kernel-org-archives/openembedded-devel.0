Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56485.1600074276213000185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPZ-0007z1-DA; Mon, 14 Sep 2020 12:04:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-coverage: Upgrade 5.2.1 -> 5.3
Date: Mon, 14 Sep 2020 12:04:19 +0300
Message-Id: <20200914090419.19171-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3:

- The source setting has always been interpreted as either a file
  path or a module, depending on which existed. If both
  interpretations were valid, it was assumed to be a file path.
  The new source_pkgs setting can be used to name a package to
  disambiguate this case.
- If a plugin was disabled due to an exception, we used to still
  try to record its information, causing an exception. This is now
  fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.2.1.bb => python3-coverage_5.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.2.1.bb => python3-coverage_5.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.3.bb
index 48e352c1d..2354c5e73 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "9e6165146b9bda60a779953c79e8ca54"
-SRC_URI[sha256sum] = "a34cb28e0747ea15e82d13e14de606747e9e484fb28d63c999483f5d5188e89b"
+SRC_URI[md5sum] = "c2faf2ccc498ce16fd48cc9201c520d7"
+SRC_URI[sha256sum] = "280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

