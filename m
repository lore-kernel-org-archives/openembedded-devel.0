Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56481.1600074271171910517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPV-0007z1-Fs; Mon, 14 Sep 2020 12:04:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-iso8601: Upgrade 0.1.12 -> 0.1.13
Date: Mon, 14 Sep 2020 12:04:13 +0300
Message-Id: <20200914090419.19171-4-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.13:

- Move project source code to GitHub
- Remove python 2.6, 3.2, 3.3 and 3.4 from tests
- Add python 3.7 and 3.8 to tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-iso8601_0.1.12.bb => python3-iso8601_0.1.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.12.bb => python3-iso8601_0.1.13.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
index 74b5bdcb8..9e7494b3e 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.13.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
-SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
-SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
+SRC_URI[md5sum] = "df6e924305fd799d90be63336b2ab8b3"
+SRC_URI[sha256sum] = "f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

