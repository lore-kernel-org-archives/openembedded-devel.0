Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.145137.1598053523566513839
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gim-0003AI-Uf; Sat, 22 Aug 2020 02:45:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/11] python3-click-repl: Add recipe
Date: Sat, 22 Aug 2020 02:45:02 +0300
Message-Id: <20200821234504.719-9-leon.anavi@konsulko.com>
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

Add recipe for click-repl, REPL plugin for Click.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-click-repl_0.1.6.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
new file mode 100644
index 000000000..fce9f9805
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = "REPL plugin for Click"
+HOMEPAGE = "https://github.com/untitaker/click-repl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5"
+
+SRC_URI[md5sum] = "2d5f4d42cbd1da9a50a49dff4d6087ca"
+SRC_URI[sha256sum] = "b9f29d52abc4d6059f8e276132a111ab8d94980afe6a5432b9d996544afa95d5"
+
+inherit pypi setuptools3
-- 
2.17.1

