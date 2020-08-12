Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18991.1597250634451834357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 09:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5tqx-0000d2-OM; Wed, 12 Aug 2020 19:43:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-javaobj-py3: Upgrade 0.4.0.1 -> 0.4.1
Date: Wed, 12 Aug 2020 19:43:32 +0300
Message-Id: <20200812164335.24599-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812164335.24599-1-leon.anavi@konsulko.com>
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.1:

- Added the custom transformer allowing a finer loading of custom
  Java streams

License-Update: Use file LICENSE to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-javaobj-py3_0.4.0.1.bb => python3-javaobj-py3_0.4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.0.1.bb => python3-javaobj-py3_0.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
index 49d258ca8..c83140a89 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
@@ -5,10 +5,10 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world."
 HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
-SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
+SRC_URI[md5sum] = "47632071c3c3ca14b6c42f2a4e2e1309"
+SRC_URI[sha256sum] = "419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14"
 
 inherit pypi setuptools3
 
-- 
2.17.1

