Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8107.1600847926881620267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzfl-0005D6-9s; Wed, 23 Sep 2020 10:58:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-paho-mqtt: Upgrade 1.5.0 -> 1.5.1
Date: Wed, 23 Sep 2020 10:58:24 +0300
Message-Id: <20200923075830.30859-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- Exceptions that occur in callbacks are no longer suppressed by
  default. They can optionally be suppressed by setting
  `client.suppress_exceptions = True`.
- Fix PUBREL remaining length of > 2 not being accepted for MQTT
  v5 message flows.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-paho-mqtt_1.5.0.bb => python3-paho-mqtt_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.5.0.bb => python3-paho-mqtt_1.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
index 8bf80e601a..d93bc884ee 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
@@ -8,8 +8,8 @@ SRCNAME = "paho-mqtt"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "45e80d9b8066a8d0ba1ecfffe271bd3d"
-SRC_URI[sha256sum] = "e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4"
+SRC_URI[md5sum] = "32f93c0ed92c7439f7a715ed258fd35d"
+SRC_URI[sha256sum] = "9feb068e822be7b3a116324e01fb6028eb1d66412bf98595ae72698965cb1cae"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
-- 
2.17.1

