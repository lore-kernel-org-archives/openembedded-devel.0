Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13112.1597146298775961767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5Si8-0004It-CY; Tue, 11 Aug 2020 14:44:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-hyperlink: Upgrade 19.0.0 -> 20.0.1
Date: Tue, 11 Aug 2020 14:44:22 +0300
Message-Id: <20200811114430.27916-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 20.0.1:

- Rerelease to fix packaging metadata around conditional
  requirements.
- CPython 3.7 and 3.8 and PyPy3 added to test matrix.
- Hyperlink now has type hints and they are now exported per
  PEP 561.
- Several bugs related to hidden state were fixed, making it so
  that all data on a URL object (including rooted and uses_netloc)
  is reflected by and consistent with its textual representation.
  This does mean that sometimes these constructor arguments are
  ignored, if it would create invalid or unparseable URL text.

License-Update: New contributor added. No change of license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-hyperlink_19.0.0.bb => python3-hyperlink_20.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_19.0.0.bb => python3-hyperlink_20.0.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
index 3ee098ad6..c9e281504 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A featureful, correct URL for Python"
 HOMEPAGE = "https://github.com/python-hyper/hyperlink"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca"
 
-SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
-SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
+SRC_URI[sha256sum] = "47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af"
+SRC_URI[md5sum] = "d7983e3d2625e5f7dffc8d12da8803ab"
 
 inherit pypi setuptools3
 
-- 
2.17.1

