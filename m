Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5616.1593170996768288948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYN-000568-3R; Fri, 26 Jun 2020 14:29:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/12] python3-cppy: Add new recipe
Date: Fri, 26 Jun 2020 14:29:36 +0300
Message-Id: <20200626112944.25569-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Add cppy release 1.1.0: C++ headers for C extension development.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-cppy_1.1.0.bb     | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
new file mode 100644
index 000000000..79ddbed7c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "C++ headers for C extension development"
+HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
+
+SRC_URI[md5sum] = "2110891d75aa12551deebba1603428c6"
+SRC_URI[sha256sum] = "4eda6f1952054a270f32dc11df7c5e24b259a09fddf7bfaa5f33df9fb4a29642"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

