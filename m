Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.146437.1598053521812777170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gil-0003AI-6v; Sat, 22 Aug 2020 02:45:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/11] python3-nocasedict: Add recipe
Date: Sat, 22 Aug 2020 02:45:00 +0300
Message-Id: <20200821234504.719-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
References: <20200821234504.719-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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

Add recipe for nocasedict, a case-insensitive ordered dictionary
for Python.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-nocasedict_0.5.0.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
new file mode 100644
index 000000000..440cf5109
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A case-insensitive ordered dictionary for Python"
+HOMEPAGE = "https://github.com/pywbem/nocasedict"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+SRC_URI[md5sum] = "b1037d65f1f73322c3c2d76681195bb3"
+SRC_URI[sha256sum] = "ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33"
+
+inherit pypi setuptools3
-- 
2.17.1

