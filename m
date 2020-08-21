Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.145846.1598053517578297706
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gig-0003AI-T4; Sat, 22 Aug 2020 02:45:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/11] python3-pydicti: Add recipe
Date: Sat, 22 Aug 2020 02:44:55 +0300
Message-Id: <20200821234504.719-2-leon.anavi@konsulko.com>
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

Add pydicti, a case insensitive derivable dictionary. Changelog
for release 1.1.3:

- avoid key recomputation in __setitem__

License-Update: Add WTFPL

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/licenses/WTFPL                         | 14 ++++++++++++++
 .../python/python3-pydicti_1.1.3.bb                |  9 +++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/licenses/WTFPL
 create mode 100644 meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb

diff --git a/meta-python/licenses/WTFPL b/meta-python/licenses/WTFPL
new file mode 100644
index 000000000..5a8e33254
--- /dev/null
+++ b/meta-python/licenses/WTFPL
@@ -0,0 +1,14 @@
+            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
+                    Version 2, December 2004
+
+ Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
+
+ Everyone is permitted to copy and distribute verbatim or modified
+ copies of this license document, and changing it is allowed as long
+ as the name is changed.
+
+            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. You just DO WHAT THE FUCK YOU WANT TO.
+
diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
new file mode 100644
index 000000000..bca0ba737
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Case insensitive derivable dictionary"
+HOMEPAGE = "https://github.com/coldfix/pydicti"
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
+
+SRC_URI[md5sum] = "b02ed35da91e400f1f17a57ab02ba06b"
+SRC_URI[sha256sum] = "eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4"
+
+inherit pypi setuptools3
-- 
2.17.1

