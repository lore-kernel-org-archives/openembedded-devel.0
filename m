Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3878.1593686910770441212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35470 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqwlX-0002lw-38; Thu, 02 Jul 2020 13:48:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pint: Upgrade 0.13 -> 0.14
Date: Thu,  2 Jul 2020 13:48:15 +0300
Message-Id: <20200702104819.14256-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.14:

- Changes required to support Pint-Pandas 0.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.13.bb => python3-pint_0.14.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.13.bb => python3-pint_0.14.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.13.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pint_0.13.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 9a081baba..8e1630476 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "6e60d42736f8175a57119aecc383fe4b"
-SRC_URI[sha256sum] = "13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2"
+SRC_URI[md5sum] = "e5e409806bc82f518230117b30ae23ed"
+SRC_URI[sha256sum] = "9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

