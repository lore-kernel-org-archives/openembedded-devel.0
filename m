Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3838.1593686911192336881
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35470 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqwlZ-0002lw-Iu; Thu, 02 Jul 2020 13:48:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-dbus-next: Upgrade 0.1.2 -> 0.1.3
Date: Thu,  2 Jul 2020 13:48:16 +0300
Message-Id: <20200702104819.14256-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702104819.14256-1-leon.anavi@konsulko.com>
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.1.3:

- Add the object manager interface to the service.
- Allow coroutines in service methods.
- Client: don't send method replies with NO_REPLY_EXPECTED
  message flag.
- Fix duplicate nodes in introspection.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-dbus-next_0.1.2.bb => python3-dbus-next_0.1.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.2.bb => python3-dbus-next_0.1.3.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
index 2784013a1..4da4be81b 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A zero-dependency DBus library for Python with asyncio support"
 HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b32e18a71bcdd072bce21f204629a104"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
 
-SRC_URI[md5sum] = "df838d695284dd1775860f9691a8663f"
-SRC_URI[sha256sum] = "a567d845ceed5feac48dda7faeb9ff2571f9a434a3c32b9b363f763e82368762"
+SRC_URI[md5sum] = "a823270b11c8dd7932c12adc6b2fadbb"
+SRC_URI[sha256sum] = "4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb"
 
 PYPI_PACKAGE = "dbus_next"
 
-- 
2.17.1

