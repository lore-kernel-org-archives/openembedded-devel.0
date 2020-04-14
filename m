Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8317.1586859906426695560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 03:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47782 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jOIkZ-0008UL-BT; Tue, 14 Apr 2020 13:25:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCHv2 2/2] python-docker: move from meta-virtualization
Date: Tue, 14 Apr 2020 13:24:57 +0300
Message-Id: <1586859897-2879-2-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586859897-2879-1-git-send-email-leon.anavi@konsulko.com>
References: <1586859897-2879-1-git-send-email-leon.anavi@konsulko.com>
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
python-docker recipes to meta-python2 for backward compatibility
of legacy projects. Dependencies python-docker-pycreds and
python-websocket-client should be also present in meta-python2.
Upgrade python-docker to 4.2.0, the latest version as of today.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-docker_4.2.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-devtools/python/python-docker_4.2.0.bb

diff --git a/recipes-devtools/python/python-docker_4.2.0.bb b/recipes-devtools/python/python-docker_4.2.0.bb
new file mode 100644
index 0000000..cf78cf1
--- /dev/null
+++ b/recipes-devtools/python/python-docker_4.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "19f803f6a7113301daa5d82a2d1d0c30"
+SRC_URI[sha256sum] = "ddae66620ab5f4bce769f64bcd7934f880c8abe6aa50986298db56735d0f722e"
+
+RDEPENDS_${PN} += " \
+	python-misc \
+	python-six \
+	python-docker-pycreds \
+	python-requests \
+	python-websocket-client \
+	python-backports-ssl \
+"
-- 
2.7.4

