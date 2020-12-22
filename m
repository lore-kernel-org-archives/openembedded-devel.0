Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5565.1608599711708419323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 17:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46704 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1krWGY-0002Fg-5s; Tue, 22 Dec 2020 03:15:07 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-chardet: Upgrade 3.0.4 -> 4.0.0
Date: Tue, 22 Dec 2020 03:14:58 +0200
Message-Id: <20201222011459.14452-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 4.0.0:

- Single-byte charset probers now use nested dictionaries under
  the hood, so they are usually a little faster than before.
- The CharsetGroupProber class now properly short-circuits when
  one of the probers in the group is considered a definite match.
  This lead to a substantial speedup.
- There is now a chardet.detect_all function that returns a list
  of possible encodings for the input with associated confidences.
- Support for Python 2.6, 3.4, and 3.5 was dropped as they are all
  past end-of-life.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-chardet_3.0.4.bb => python3-chardet_4.0.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-chardet_3.0.4.bb => python3-chardet_4.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
index 80785b8d4e..4caf33cb25 100644
--- a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "Universal encoding detector for Python 2 and 3"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
-SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
+SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
 
 # setup.py of chardet needs this.
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-- 
2.17.1

