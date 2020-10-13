Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7599.1602579563858904332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9R-0002BF-OT; Tue, 13 Oct 2020 11:59:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-ujson: Upgrade 3.2.0 -> 4.0.1
Date: Tue, 13 Oct 2020 11:59:09 +0300
Message-Id: <20201013085914.31580-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.1:

- Fix UnicodeDecodeError on arm64/aarch64
- Add support for Python 3.9
- Build wheels for Python 3.9
- Drop support for EOL Python 3.5
- Fix indent and add test case
- Update code samples in README

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_3.2.0.bb => python3-ujson_4.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_3.2.0.bb => python3-ujson_4.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
index e1d7d9d79a..2475306f91 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[md5sum] = "a524264ef4069e18d742e32e90845a3f"
-SRC_URI[sha256sum] = "abb1996ba1c1d2faf5b1e38efa97da7f64e5373a31f705b96fe0587f5f778db4"
+SRC_URI[md5sum] = "c8030a62912c3be18ff99fa5b25258b8"
+SRC_URI[sha256sum] = "26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

