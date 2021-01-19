Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.14582.1611077881678096097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux6-0001eq-6f; Tue, 19 Jan 2021 19:38:01 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-dbus-next: Upgrade 0.1.4 -> 0.2.2
Date: Tue, 19 Jan 2021 19:37:45 +0200
Message-Id: <20210119173746.24694-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.2.2:

- Add connected instance variable to the MessageBus
- Better handling of message bus errors on disconnect
- Ensure futures are not done when settings results and exceptions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dbus-next_0.1.4.bb => python3-dbus-next_0.2.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.4.bb => python3-dbus-next_0.2.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
index 0a5f19974..1970fdec1 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
 
-SRC_URI[md5sum] = "0d44e12e8689637a0c048ec7bb51d842"
-SRC_URI[sha256sum] = "1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363"
+SRC_URI[sha256sum] = "f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de"
 
 PYPI_PACKAGE = "dbus_next"
 
-- 
2.17.1

