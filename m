Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.56411.1600074272086546179
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPW-0007z1-CO; Mon, 14 Sep 2020 12:04:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-dbus-next: Upgrade 0.1.3 -> 0.1.4
Date: Mon, 14 Sep 2020 12:04:14 +0300
Message-Id: <20200914090419.19171-5-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.4:

- Support tcp transport addresses
- Add support for the annonymous authentication protocol
- Add flags kwarg to aio high level client method call
- Allow subclassing of DBusError
- Fix exception in aio message handler loop on task cancellation
- Improve error messages
- Fix match rule memory leak bug
- Don't add match rules for high level client by default
- Add empty properties interface to standard interfaces

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-dbus-next_0.1.3.bb => python3-dbus-next_0.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.3.bb => python3-dbus-next_0.1.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
index 4da4be81b..0a5f19974 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
 
-SRC_URI[md5sum] = "a823270b11c8dd7932c12adc6b2fadbb"
-SRC_URI[sha256sum] = "4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb"
+SRC_URI[md5sum] = "0d44e12e8689637a0c048ec7bb51d842"
+SRC_URI[sha256sum] = "1b1942bffcc8c9a5bd6834257df227a55ee28e07dd413ead82ddd23115652363"
 
 PYPI_PACKAGE = "dbus_next"
 
-- 
2.17.1

