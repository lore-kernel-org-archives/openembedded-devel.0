Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9230.1621002232675933094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjH-0005Cr-4k; Fri, 14 May 2021 17:23:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-matplotlib-inline: Add recipe
Date: Fri, 14 May 2021 17:23:40 +0300
Message-Id: <20210514142341.22666-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Inline Matplotlib backend for Jupyter.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-matplotlib-inline_0.1.2.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb
new file mode 100644
index 0000000000..f060f93337
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Inline Matplotlib backend for Jupyter"
+HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c2728819a4288030f51c594327977be0"
+
+SRC_URI[sha256sum] = "f41d5ff73c9f5385775d5c0bc13b424535c8402fe70ea8210f93e11f3683993e"
+
+inherit pypi
-- 
2.17.1

