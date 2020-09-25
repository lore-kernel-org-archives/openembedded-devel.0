Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5630.1601033011222632596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56930 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLlp3-0008RR-Os; Fri, 25 Sep 2020 14:23:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-cryptography-vectors: Upgrade 3.1 -> 3.1.1
Date: Fri, 25 Sep 2020 14:23:19 +0300
Message-Id: <20200925112321.3195-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925112321.3195-1-leon.anavi@konsulko.com>
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
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
 ...y-vectors_3.1.bb => python3-cryptography-vectors_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.bb => python3-cryptography-vectors_3.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
index 59347c94e5..9486fe2350 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "1ba5b0743e2876e909f7cfc28b744f27"
-SRC_URI[sha256sum] = "2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182"
+SRC_URI[md5sum] = "fbc43f8b155b52f9ed163d3555ea5e83"
+SRC_URI[sha256sum] = "5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

