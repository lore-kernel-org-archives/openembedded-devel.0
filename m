Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7739.1601540422910187877
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 01:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52088 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNtp6-0007uO-MZ; Thu, 01 Oct 2020 11:20:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-cbor2: Upgrade 5.1.2 -> 5.2.0
Date: Thu,  1 Oct 2020 11:20:03 +0300
Message-Id: <20201001082006.21365-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001082006.21365-1-leon.anavi@konsulko.com>
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.2.0:

- Final version tested with Python 2.7 and 3.5
- README: Announce deprecation of Python 2.7, 3.5
- README: More detail and examples
- Bugfix: Fix segfault on loading huge arrays with C-backend
- Build system: Allow packagers to force C-backend building or
  disable using env var
- Feature: :module:`cbor2.tool` Command line diagnostic tool
- Feature: Ignore semantic tag used for file magic 55799 AKA
  "Self-Described CBOR"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.1.2.bb => python3-cbor2_5.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.2.bb => python3-cbor2_5.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
index c65be72261..cc067c41a9 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
@@ -4,8 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6"
-SRC_URI[md5sum] = "693c1bd6635bee8a591a70ea924ad676"
+SRC_URI[sha256sum] = "a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf"
+SRC_URI[md5sum] = "0940aa8bfd1a07f06a983bb6dc78f1ca"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

