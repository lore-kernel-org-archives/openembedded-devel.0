Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17245.1593432771960190622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseY-0001kP-6e; Mon, 29 Jun 2020 15:12:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-autobahn: Upgrade 20.4.3 -> 20.6.2
Date: Mon, 29 Jun 2020 15:12:30 +0300
Message-Id: <20200629121233.27026-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.6.2:

- fix: xbr fixes
- fix: use cpy 3.8 for running flake in CI
- new: Ticket1392 internal attrs
- new: internal-only router attributes and hook for router to add
  custom information

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_20.4.3.bb => python3-autobahn_20.6.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.4.3.bb => python3-autobahn_20.6.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
index 60ef57d04..171a6dce4 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
@@ -3,7 +3,8 @@ DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f"
+SRC_URI[md5sum] = "bcafb42ea58232308777a265d41c1c98"
+SRC_URI[sha256sum] = "6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01"
 
 inherit pypi setuptools3
 
-- 
2.17.1

