Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.146440.1598053524419216162
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gin-0003AI-Oy; Sat, 22 Aug 2020 02:45:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/11] python3-click-spinner: Add recipe
Date: Sat, 22 Aug 2020 02:45:03 +0300
Message-Id: <20200821234504.719-10-leon.anavi@konsulko.com>
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

Add recipe for click-spinner, a spinner for Click.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-click-spinner_0.1.10.bb               | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
new file mode 100644
index 000000000..418f8a32a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Spinner for Click"
+HOMEPAGE = "https://github.com/click-contrib/click-spinner"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "ab68ed404401421819c81cc6c0677a87"
+SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
+
+inherit pypi setuptools3
-- 
2.17.1

