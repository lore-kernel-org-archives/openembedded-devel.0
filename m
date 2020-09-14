Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60147.1600089356205943686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKo-0000ED-T6; Mon, 14 Sep 2020 16:15:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-parse: Upgrade 1.17.0 -> 1.18.0
Date: Mon, 14 Sep 2020 16:15:36 +0300
Message-Id: <20200914131536.6072-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.18.0:

- Correct bug in int parsing introduced in 1.16.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-parse_1.17.0.bb => python3-parse_1.18.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.17.0.bb => python3-parse_1.18.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
index 7acf780e3..ed9204e3b 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[md5sum] = "5b753ffb1470ffa4b3e6e16956048316"
-SRC_URI[sha256sum] = "c7806139a481ec8c8336a54418894c8b201314f8ecc63e55f438f4b72bdc4485"
+SRC_URI[md5sum] = "42ea0002cf36bfd2bd74f3c05bf25f60"
+SRC_URI[sha256sum] = "91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

