Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5762.1601033011072616467
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56930 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLlp1-0008RR-2r; Fri, 25 Sep 2020 14:23:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-cryptography: Upgrade 3.1 -> 3.1.1
Date: Fri, 25 Sep 2020 14:23:18 +0300
Message-Id: <20200925112321.3195-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.1:

- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1h.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-cryptography_3.1.bb => python3-cryptography_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.1.bb => python3-cryptography_3.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
index 9ac23cda4f..1d6a9b32e0 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 LDSHARED += "-pthread"
 
-SRC_URI[md5sum] = "aa91e4974981b29e99b863c54034c361"
-SRC_URI[sha256sum] = "26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08"
+SRC_URI[md5sum] = "c3807891d36aa9de8187e9db8b2bb457"
+SRC_URI[sha256sum] = "9d9fc6a16357965d282dd4ab6531013935425d0dc4950df2e0cf2a1b1ac1017d"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

