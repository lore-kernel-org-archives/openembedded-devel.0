Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.145849.1598053520140832194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gij-0003AI-Ei; Sat, 22 Aug 2020 02:45:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/11] python3-asciitree: Add recipe
Date: Sat, 22 Aug 2020 02:44:58 +0300
Message-Id: <20200821234504.719-5-leon.anavi@konsulko.com>
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

Add recipe for asciitree that draws ASCII trees.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
new file mode 100644
index 000000000..833732bd4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Draws ASCII trees."
+HOMEPAGE = "http://github.com/mbr/asciitree"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
+
+SRC_URI[md5sum] = "2570b31e563b69da1aff54509db8ac6a"
+SRC_URI[sha256sum] = "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
+
+inherit pypi setuptools3
-- 
2.17.1

