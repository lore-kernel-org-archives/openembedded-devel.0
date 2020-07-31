Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18234.1596201785115035658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V03-000741-Cn; Fri, 31 Jul 2020 16:23:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/15] python3-cbor2: Upgrade 5.1.1 -> 5.1.2
Date: Fri, 31 Jul 2020 16:22:24 +0300
Message-Id: <20200731132230.20031-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.2:

- Bugfix: Refcount bug in C lib causing intermittent segfaults
  on shutdown

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.1.1.bb => python3-cbor2_5.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.1.bb => python3-cbor2_5.1.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
index 6b26da2a6..c65be7226 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
@@ -4,8 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64"
-SRC_URI[md5sum] = "b034d7edfd22c1f98e600aaedbd90f39"
+SRC_URI[sha256sum] = "91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6"
+SRC_URI[md5sum] = "693c1bd6635bee8a591a70ea924ad676"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

