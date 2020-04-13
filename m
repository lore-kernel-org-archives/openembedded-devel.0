Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2313.1586807358552935199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 12:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55876 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jO54z-0000VV-Cr; Mon, 13 Apr 2020 22:49:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCH 1/3] python-docker-pycreds: move from meta-virtualization
Date: Mon, 13 Apr 2020 22:49:07 +0300
Message-Id: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
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

Support for Python 2 has been dropped in meta-virtualization. Move
python-docker-pycreds and other related recipes to meta-python2
for backward compatibility of legacy projects.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-docker-pycreds_0.4.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-devtools/python/python-docker-pycreds_0.4.0.bb

diff --git a/recipes-devtools/python/python-docker-pycreds_0.4.0.bb b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
new file mode 100644
index 0000000..4e9b3ac
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python bindings for the docker credentials store API"
+HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "322f570cea6b4661c6ac335683988e18"
+SRC_URI[sha256sum] = "6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4"
-- 
2.7.4

