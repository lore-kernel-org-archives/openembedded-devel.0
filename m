Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.37009.1610991020350958714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 09:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42860 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1YM5-0000AX-91; Mon, 18 Jan 2021 19:30:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-parse: Upgrade 1.18.0 -> 1.19.0
Date: Mon, 18 Jan 2021 19:30:07 +0200
Message-Id: <20210118173007.20996-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210118173007.20996-1-leon.anavi@konsulko.com>
References: <20210118173007.20996-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.19.0:

- Fix using digit field numbering and types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-parse_1.18.0.bb => python3-parse_1.19.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.18.0.bb => python3-parse_1.19.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
index ed9204e3b..b5e076954 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[md5sum] = "42ea0002cf36bfd2bd74f3c05bf25f60"
-SRC_URI[sha256sum] = "91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4"
+SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

